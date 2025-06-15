Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E07EC61CE8
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 19:16:18 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.15135.1750014970314830237
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 12:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=BWykNPQv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-202506151916073f3881f29355973c63-md0kbc@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202506151916073f3881f29355973c63
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Jun 2025 21:16:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=cclI4qgszIVgyaqH7IqUKBH3tQ1mBoLVpy4L4q8CuIo=;
 b=BWykNPQv/xcAhDl8Ntj53ZWWwvvyWaZl8scleAcih84/r7JIYpfUeLKbtZHAyGLbykl3Bc
 kTHtowNIWYY0ZTJKgED4LqjeR4O0w9+id92qSxZcTk0CU0R+djbSG/wxptNVBYlL+zALhatE
 I9Tzfqs9lCw46/lTrQaaO4gn16dGK7XO1r4CHIGKpTpBePkfTl4HV8bnIow+4r09MS6PRfNh
 /50eB3/x2cUISx6LoCg6shOHHC0v/3QxEtut9t2mQkqZs9RG0kohuP09ocLrF7PyVcVNNcc2
 IFEvAPK/VQJu0N2FuSpZ0AIhnicDCRcYIMU8hFZzuGWhp5qaBG4pCAZg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] oe-selftest: fitimage: fix new parser compatibility
Date: Sun, 15 Jun 2025 21:16:01 +0200
Message-ID: <20250615191601.1261775-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 19:16:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218749

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Recent parser changes throw a warning if there is no space around the
= operator.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 265cfed39fe..ca4724d1ae8 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -786,7 +786,7 @@ FIT_CONF_PREFIX = "foo-"
         EXPECTED_COMP = ["ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx"]
 
         config = """
-DISTRO="poky"
+DISTRO = "poky"
 MACHINE = "beaglebone-yocto"
 """
         self.write_config(config)
@@ -938,7 +938,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart comment'"
         """
 
         config = """
-DISTRO="poky"
+DISTRO = "poky"
 MACHINE = "beaglebone-yocto"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 INITRAMFS_SCRIPTS = ""
@@ -992,7 +992,7 @@ FIT_HASH_ALG = "sha256"
         """
 
         config = """
-DISTRO="poky"
+DISTRO = "poky"
 MACHINE = "beaglebone-yocto"
 INITRAMFS_IMAGE_BUNDLE = "1"
 INITRAMFS_IMAGE = "core-image-minimal-initramfs"
-- 
2.49.0


