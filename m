Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 805BD79B12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 13:44:18 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id q41-v6so9822958qtq.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 06:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=LOTmJ+/fuCxWiXYwCqwvEsSZLrFb8T1q5IiTvu49rjw=;
	b=ChXZCNjsy8HaL9qhQdWLLLZDer8zwWF4gZ9K8bxcqNw1fjjREY2uAbA9VOBpSpZqG6
	2bIqGRJmNrkcF4EMk5HAXVCLqqe1JrGowQLFscFIS6kmp41KZYRGhWCTkb+aONBkPDuw
	iuEO3FXinVdJzcmyXkiiW9yljcrX5DCpvDTxSchvtFM4cgnHpfEPvNnQB5yh6WbZSRA+
	tklWuH4AoGezRw46JoIwUgvFSUM6FSLy30w420eQJVqfFasqSe8LLtgksiKkSf8ZxVxA
	mjg9pz1E5uZWhruZUHVRjnJT9z9m307XWXRrthHOr3EHFwGQ7ztNHmaUvii8eEC65dU5
	p40A==
X-Gm-Message-State: ABuFfojn/vGjgpN3FkYrCVjp2Iw47WD30BvJn4l70qrH0oMKm49ayC5E
	aidhDtXgSpwRroD7/APV9zRfdRCa
X-Google-Smtp-Source: ACcGV63vHC7tReJ+1sWciPkXIh9CEk2+VqI6KLLJ5CbTwEYh+RB2BxVq0bHShFmKg11E7T6mSlib/g==
X-Received: by 2002:ac8:31a2:: with SMTP id
	h31-v6mr1632933qte.14.1539265458948; 
	Thu, 11 Oct 2018 06:44:18 -0700 (PDT)
Received: from localhost.localdomain ([181.220.65.91])
	by smtp.gmail.com with ESMTPSA id
	x12-v6sm16074312qtk.6.2018.10.11.06.44.16
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Oct 2018 06:44:18 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 11 Oct 2018 10:44:13 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2018 10:44:11 -0300
Message-Id: <20181011134411.11760-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] util-linux: Fix unshare alternative package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2018 13:44:18 -0000
Content-Transfer-Encoding: 8bit

The link was not being generated for the
sub-package (util-linux-unshare).

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/util-linux/util-linux.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 45e2203a64..c694bf013f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -220,7 +220,6 @@ ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
-ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
 ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
@@ -292,6 +291,9 @@ ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
 ALTERNATIVE_util-linux-mountpoint = "mountpoint"
 ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 
+ALTERNATIVE_util-linux-unshare = "unshare"
+ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
+
 BBCLASSEXTEND = "native nativesdk"
 
 python do_package_prepend () {
-- 
2.19.1


