Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4906478839
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 10:43:16 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id s206so22511382wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=7syQAHU0nBAsGevnLx5u3M4xljzRnSUAhLh5bpSRYEw=;
	b=f0ZF8d/IZFfUNEz8+19xEq3WNFUloVPFQTlYjM8JEuV30XIpyh1k7sQMj4adq8m3rz
	kZafgR7X83ceGlu11QBuZC9QHZPCxxDQGKAm9skS+Bf+3mDlbRBAueAJ+eI2SoXisedd
	+IVzyZoBCodWHExVT4twhXZU/KQLKNkrvM9clHYOGhP+nJ5O0BsImVIQp7cRXMZ4y74d
	83rLd/ru/tCFlwFf+GANG7nLJoTYXzz9SaUBuT/o7dfo3hwLKRuuZkwdYcNNCNkvi6wt
	+aNH6m6wp7+uGRmJZFjgFXJtPItfMdKDvMEmEvLHaNy3enFx6xtCSixUHyJoBsjxMSya
	zS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=7syQAHU0nBAsGevnLx5u3M4xljzRnSUAhLh5bpSRYEw=;
	b=BeSvAjHcxho8fLxnlBh/5zhQm9LynzADzaZ476WpfG9rIaJbtM3DFOgc7UC+gK7MvR
	omiYXvCDWTDBkptuAG1by4bKT7A5KY4oiD7RO9jh3unnxxjfuawQ8Sw85mhJk/CGd/qb
	lAFDCyYOB+E/0/SCP7v+M6DIlCIYA0rpbGqRA5MnhM0GudqYHEIahjwbqPx7jhekr7Bc
	tI+yoP2n9qCXXVA/lYgc/G8CYCezgtU9K5JwWxQFqH4KlMzbtp3zm7TZBvj8wwrF7UmR
	FcjwHcFYql7EkKs9Kg63lCgNhvwxKKK6k3K3PCiJbtMbbiVKnNNyXl5u2w1lGPjtPvVJ
	u0pg==
X-Gm-Message-State: AElRT7EoHd9SsqYhwHbtYZfiS7aSmHTixGPktLqwM/9pNLtKlQB0tB8u
	zAyeqfI1qjf8UJjoDOKNLT080Yh5
X-Google-Smtp-Source: AG47ELuBGEs7oeYMiKZtiDqpTUahv2CcTSRgNhBldcmCbxxNTmLe4pV7PgddESZb+Kxs0BgQ0lDHkw==
X-Received: by 10.28.27.194 with SMTP id b185mr1031926wmb.57.1521110597625;
	Thu, 15 Mar 2018 03:43:17 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q21sm4577235wmd.40.2018.03.15.03.43.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Mar 2018 03:43:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2018 10:43:15 +0000
Message-Id: <20180315104315.14973-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gtk-doc: use --srcdir instead of cd
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
X-List-Received-Date: Thu, 15 Mar 2018 10:43:17 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gtk-doc.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 3f731cb93bf..b4f6754906a 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -32,7 +32,9 @@ inherit python3native pkgconfig qemu
 DEPENDS_append = "${@' qemu-native' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 do_configure_prepend () {
-	( cd ${S}; gtkdocize --docdir ${GTKDOC_DOCDIR} || true )
+	# Need to use ||true as this is only needed if configure.ac both exists
+	# and uses GTK_DOC_CHECK.
+	gtkdocize --srcdir ${S} --docdir ${GTKDOC_DOCDIR} || true
 }
 
 do_compile_prepend_class-target () {
-- 
2.11.0


