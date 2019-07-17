Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CBFF77ECC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 11:03:26 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s15so314335wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 04:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g4GuNrOxGcJQR3ezLOr3C9tK3zJkOPW0QCCcmjjmKlw=;
	b=xyf7fXe0nQB0Q3xRnciUTvl+U3vAVhKVYiVcailumQSO/Padv14He6VogPBnwyI1Gd
	xkShw+y6K5PZaj2j4mncrV0z+E31ET2lgRs7dZCN8+p2TLdYM+s6eUqSenuMujWWRvGA
	A0o0tiJUhLhdxCDplC9wNU0855/3OnS7094levAMV6rr6zC3QtlQn9IxqsKC7jV0+Rte
	G5Q43c5JVt00M2BVD/UloyOKQmrCEkVaP4WivTAarTxX59HYD39mjII8rF7IOIPwZ9eu
	vfHIGSa194C00kQwH6crN/WLldYAjsceJjx0y89GhUcoVmLd5K06+jZtGbQmRr5JTPXO
	4eUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g4GuNrOxGcJQR3ezLOr3C9tK3zJkOPW0QCCcmjjmKlw=;
	b=Fyei/IAFID8MawsK0vzCeN2Di91T94JrXxEdK6RDSENlMZ/tbWhwuMwEdgkqZe+G6e
	rQESYOxHQsBK52egCF4cCy5k1OZatUb6own1ZwB3poWXd7bf4ie7L9g0MBzL6Yed+RRQ
	pjTvXZyUFMV5rzsmQekgYabqTLO57A+dVafldtCJlL3FjtBK/WvlKk5sar7DEplsqBIr
	jxELZXjwRj/6YkIqpxEs94Sh0nZ1frQLE8Dcsi1NdTl7JAzmBiDLWVkAOTM3SXgigANL
	SbhYuyEzgJWTyWdzCJhJQDnL2w567cnEBO2WnrP7C0pZg8DZIn+puwB6Ci1MKbCTtdes
	2gdQ==
X-Gm-Message-State: APjAAAXnpwnzCqjm4rnXEHIo76UnB7jaKEN0GY+Cgcrv37bU31Sdaxep
	Yv/H4/gOq/+q7OHgDHljolRhy73gzpM=
X-Google-Smtp-Source: APXvYqzy7PmSAYkZg7zHuQNv4w8Z34pn4uHpOEtjManqktbcaKmy1tuJZq9E2/lUBLkAnrj8Z1kobw==
X-Received: by 2002:a05:600c:10ce:: with SMTP id
	l14mr35315012wmd.118.1563361407188; 
	Wed, 17 Jul 2019 04:03:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g8sm24584326wme.20.2019.07.17.04.03.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 17 Jul 2019 04:03:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 12:03:21 +0100
Message-Id: <20190717110324.24433-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] subversion: set CVE vendor to Apache
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
X-List-Received-Date: Wed, 17 Jul 2019 11:03:27 -0000
Content-Transfer-Encoding: 8bit

There's a Jenkins plugin for Subversion.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/subversion/subversion_1.12.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.12.0.bb b/meta/recipes-devtools/subversion/subversion_1.12.0.bb
index f059ff9ffac..3d0f3e688db 100644
--- a/meta/recipes-devtools/subversion/subversion_1.12.0.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.12.0.bb
@@ -19,6 +19,8 @@ SRC_URI[sha256sum] = "7fae7c73d8a007c107c0ae5eb372bc0bb013dbfe966fcd5c59cd5a195a
 
 inherit autotools pkgconfig gettext
 
+CVE_PRODUCT = "apache:subversion"
+
 PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
-- 
2.20.1


