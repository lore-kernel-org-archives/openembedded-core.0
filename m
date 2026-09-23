Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA83C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:23 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2814.1790154680015783005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ev+sRSvA;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso293847f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154678; x=1790759478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yjKRSN6RhPNxqLVAQH2Lb09RAELnorfAs/Av6yhAO8c=;
        b=Ev+sRSvArNVnWRqvEOEcvFPOrB4tWTdD8gl7R+YdTR1jqyzAp5GxVJ3Q8gqk2X+KaH
         gf6L10sHfQ0yDBFbTdhKBUu4MLdIvJhpBpJh4eLH+IYMiP88nv7UKetyxag3J1HvDfvN
         8vCilfqLq2d4K8WzuX6bmUSn2ec3zletf9lhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154678; x=1790759478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yjKRSN6RhPNxqLVAQH2Lb09RAELnorfAs/Av6yhAO8c=;
        b=vrbeGszxQIXRm5veXWwtXog06l5CYbSan8lA0w8yXzjLBUs/zB+0U8rKZQU1TYeDo1
         n3UPWfD1pcF6TTDxU0Q3yvbDek/8MIIOIkKeIL7a2+Oksr0hkg14H9cNC5v8pHaWxyLL
         BFWQfbcSHLoZMK2dkx1FWtFWtxMVpC9PCzdJGV5PDUnYEACuvT1j7bnMScBj7zgkCmVU
         RsOXminjxhHbV64N+o1+p0cZwXwXdWF17NjM+OFt2HJlofuvSNq/SQOn2BAXE4+qUzh/
         UVQf1uBB6gyyJPbvIV3lwMM2OPMvR/e+h1u7/YTac4qxHvvuRT6RRjzlK7sSEwUcy8eu
         WZ2A==
X-Gm-Message-State: AFuF++lAcsRWS8esZB3bwPlwTNYR/yiyKhhqiZ3GS0pa1keLSjcJ9RsN
	BW7eefyGzhyx42jSlyjhkejiYxKpr+cG9QCmcuBvyy5b2E3eBPbrltnDhJYgywtGnZMp6Dy3arB
	frh5eSzk=
X-Gm-Gg: AYBFou3DnvcSv+pGNuutOSpHt5MXpfQoMs4fEZ55kedU7Z9vTomt9HsTX8UD52eEXo+
	HCAMsvS81f5NUdlz6FjliEMbrGMWYt8IkKCFCzpsy2SUhUYmwtnYJ1NC5oR6WSKY5scQH7coYYb
	C1y9a4vaLPv1ygtjzGUMr/O7I9wvS8CvgPrjghwpTPHggVtVYOYulIvj4Sx0DL19BeN9qlxBXQH
	IBsQM1vP7583tITk8mv+tkgIr0qF4XF03mq2JTsaFxtmz4ppIAl9pgecuRm73ofGUmeElVJijnO
	SfQiKWUpDWKEEjLBorqh9qU4yXk9dx4bHfINGtWPj/GrucJjZIKfAqFloR7afyCc4RiL4QQh7Vi
	VhPzp0pbx7dyBOcLa1F7dk9AAyklC7YcBrvwOp+WE22DYRxf5ddNe9p93+8ZaDf4G6U0BzLcO3I
	fdJmfRE7Yyudsjg4iIhhH5mfQ407nMafIm18kahim9IEX8Zrej8x7g3S9pBwSTcsEDF4ZOiYP7l
	s/7yElATc9W/fJQMUgin3ifpJTULsfnHbDqxa7DoFA86rSrvz/PFuff17psrkfTC8wzYcPI6A==
X-Received: by 2002:a05:600c:46d5:b0:49d:257c:a735 with SMTP id 5b1f17b1804b1-49fde497533mr28128815e9.11.1790154677966;
        Wed, 23 Sep 2026 02:11:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/48] ca-certificates: upgrade 20260601 -> 20260816
Date: Wed, 23 Sep 2026 11:10:04 +0200
Message-ID: <31069b19cfd56f2995233033e2a54336ee6b0353.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246464

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Source: debian/changelog

ca-certificates (20260816) unstable; urgency=medium

  * Update Mozilla certificate authority bundle to version 2.90
    The following certificate authorities were added (+):
    + "SECOM TLS ECC Root CA 2024"
    + "SECOM TLS RSA Root CA 2024"
    + "Telia EC TLS Root CA v3"
    + "Telia RSA TLS Root CA v3"
    The following certificate authorities were removed (-):
    - "Atos TrustedRoot 2011"
    - "Entrust Root Certification Authority"
    - "SecureSign Root CA12"
    - "ePKI Root Certification Authority"

 -- Julien Cristau <jcristau@debian.org>  Sun, 16 Aug 2026 23:04:36 +0200

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e639396818e7152896e75364cff5fb97ae19cb32)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...vert-mozilla-certdata2pem.py-print-a-warning-for-e.patch | 6 +++---
 ...date-ca-certificates-don-t-use-Debianisms-in-run-p.patch | 2 +-
 ...date-ca-certificates-use-relative-symlinks-from-ET.patch | 2 +-
 ...certificates_20260601.bb => ca-certificates_20260816.bb} | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260601.bb => ca-certificates_20260816.bb} (97%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
index 1226508c983..001b4686246 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
@@ -1,4 +1,4 @@
-From 743774cd53ed1c45bb660eddacf6dadb5ee3e145 Mon Sep 17 00:00:00 2001
+From 8ea56b7d5eadb04309dc3cf1e6b0d94d1d053d80 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 18 Oct 2021 12:05:49 +0200
 Subject: [PATCH] Revert "mozilla/certdata2pem.py: print a warning for expired
@@ -16,10 +16,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  3 files changed, 1 insertion(+), 13 deletions(-)
 
 diff --git a/debian/changelog b/debian/changelog
-index dbe3e9c..496e05d 100644
+index 7ad495f..058ef5e 100644
 --- a/debian/changelog
 +++ b/debian/changelog
-@@ -156,7 +156,6 @@ ca-certificates (20211004) unstable; urgency=low
+@@ -234,7 +234,6 @@ ca-certificates (20211004) unstable; urgency=low
      - "Trustis FPS Root CA"
      - "Staat der Nederlanden Root CA - G3"
    * Blacklist expired root certificate "DST Root CA X3" (closes: #995432)
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
index 1a29da756fc..dcfa3554117 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -1,4 +1,4 @@
-From 63086d41f76b1c3357e23c6509df72d3f75af20c Mon Sep 17 00:00:00 2001
+From bab2e13b69af12c1864cccf371ebc4ef57a6fec2 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Jul 2015 15:19:41 +0100
 Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
index 929945b56f9..4d97c81b0d7 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0003-update-ca-certificates-use-relative-symlinks-from-ET.patch
@@ -1,4 +1,4 @@
-From a69933f96a8675369de702bdb55e57dc21f65e7f Mon Sep 17 00:00:00 2001
+From 8a5b4e2dd1479de0338db7a7234d037ef0f71c2f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
 Date: Wed, 28 Mar 2018 16:45:05 +0100
 Subject: [PATCH] update-ca-certificates: use relative symlinks from
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
similarity index 97%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
index b23f20a7828..33ca9291f4d 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260816.bb
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "7ab6301f7f34eef90a4d278647c260bc0762e0e14561f4649854cf4b0d4bea21"
+SRC_URI[sha256sum] = "d939bcdd0cb058712cf4175bac76997676eb8b68fe9473765e1b40fb3d5b186a"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \

