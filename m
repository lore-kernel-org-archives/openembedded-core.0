Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C34C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 02:28:53 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.2676.1648607333167729704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Vu2Jz2im;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id k14so16408354pga.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 19:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qNJnKiEn9hdXke5ND3y8y9xoOKVYfdycr1ld1qZL21A=;
        b=Vu2Jz2imUY6nYPOCRZBpTV3EA7dqAvfuGD0Wcl+b8p0CRhuD0QDilVdZA6gj7NvZiZ
         wrYfQMK/Nz7aeykcC3Z+ilqZST9BVeWjBpEk5Ui/WZJ3PFo9BGmKkTJ9o9JLRO0vKGpJ
         tUOlrNLysXurmfR6Pnd/IbIeL+84MlmMdZcnGRlVyU0Ydl6LhRueo48c9n591YzNtbrS
         GjFjdaJt7Jhb/rfC5JU+74xi20/JTJWBz3UzEbz5PzDrT++9LkHAQUn1Ogzc1MknheaV
         vFURSbMz3/D2ybi0gK3tM4OzmElN8HBru6U5C5bwbyR4ZixqX1ZSEmea3372EBxFZ6xs
         M4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qNJnKiEn9hdXke5ND3y8y9xoOKVYfdycr1ld1qZL21A=;
        b=mGX9rDoQJXaImu3aO0dB+Zj5k2D8pAwq8XmZF7fLajpIyahD8xhVaQ3cIpS8E4gBkV
         2Yb4ZdNtgLtK8V7bpgn5YAOsTWoRKIsyGILC+n5gLjEn76Q18gmxk3QdjxyDHg6bQYZw
         b2MKMw8yyi6+bYBjrROlsqXBwi46KTKmscK4tcuM91oT0lStuFtdCcN1zLvPu2QhcK3X
         6hsU+oAqfXYFfo4vMdydFoM0gnuCZR7cXvX1Q1pHz6i8nFCEBXU9acoX2BLjOKLeRCY5
         VGUmSYFqXFf+vFu8S8UkYaUH0oVh1YfEpTrjdRoTphvvBVQrb4tcPujakkblG5DZiRts
         yp8w==
X-Gm-Message-State: AOAM533ymFS46Xd3N4yj/PM/790R4Anr6hi74HMn1enLFxCSFPKBlGWp
	Yhb7J/vxIXPVzxaqy69V/ztHskMmqWggciz84zQ=
X-Google-Smtp-Source: 
 ABdhPJw2luleDBKxCQxWOIn1Tzm4zjZ9ohf4jpn86qp6VMNaotUqAjwhCDj2OkvagHJYnl27IlHF4w==
X-Received: by 2002:a63:788f:0:b0:386:3116:818c with SMTP id
 t137-20020a63788f000000b003863116818cmr4193708pgc.414.1648607332259;
        Tue, 29 Mar 2022 19:28:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 kb13-20020a17090ae7cd00b001c7de069bacsm4643484pjb.42.2022.03.29.19.28.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 19:28:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] xserver-xorg: update to 1.20.11
Date: Tue, 29 Mar 2022 16:27:56 -1000
Message-Id: 
 <928759347e18e56c991959d1a33aeb87ba6de4ee.1648596723.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648596723.git.steve@sakoman.com>
References: <cover.1648596723.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 02:28:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163767

Fixes CVE-2021-3472

Stable branch update:

6b767cdf6 (tag: xorg-server-1.20.11) xserver 1.20.11
a1a1aa2c1 Fix XChangeFeedbackControl() request underflow
8890c44a7 xquartz: Remove a check for NSAppKitVersionNumber >= NSAppKitVersionNumber10_7
3c3680c36 xquartz: Don't include strndup.c any more since we no longer support 10.8 and older
e1fdc856a xquartz: Add a launch trampoline to better integrate with modern versions of macOS
8f8e9c53e xquartz: Don't process AppKit events if we haven't finished initializing
aa6f84021 xquartz: Allocate each fbconfig separately
7aa51bb57 xquartz: Fix a compiler warning about const incompatible pointer assignment
d751c46bd xquartz: Fix build with sparkle enabled
03c2e12a8 xquartz: Silence a compiler warning about missing internal methods on NSApplication
fcbd57367 xquartz: Rewrite Window menu handling to not depend on X11App.windowsMenu.numberOfItems being correct in -awakeFromNib
b27c6602b xquartz: Convert X11Controller ivars into @properties
625c7e4de xquartz: Convert X11Application ivars into @properties
3017fec60 xquartz: Fold quartzCommon.h into quartz.h
bdaff44f9 xquartz: Fold away some unnecessary hops to X11Controller through X11Application
7d22031a6 xquartz: Fold away array_with_strings_and_numbers and simplify with more modern Objective-C
937b63ff4 xqaurtz: Remove message_kit_thread() and use dispatch instead
e531d3a4c xquartz: Use objc_autoreleasePoolPush / objc_autoreleasePoolPop directly in QuartzBlockHandler
08cf6c90f xquartz: Minor code modernization -- @autoreleasepool adoption
26e0c59a9 xquartz: Remove some dead code for compatibility with older nibs
2853f3896 xquartz: Remove a workaround for AppKit versions older than Lion
1edc9b980 xquartz: Apply spell check fixes from master for easier cherry-picking of changes in xquartz
67f25cc18 xquartz: Fix applications menu table background color for dark mode
4028c2ad1 xquartz: Apply Xcode 12.4 automatic updates to nibs
ff1c8e2f7 xquartz: Update the about box copyright to 2021
a16df6028 xquartz: Ensure we call into TIS on the main thread
2087b7782 xquartz: Ensure that NSRunAlertPanel() is run on the main thread
2fe5bf4ba xquartz: Remove support for older versions of libXplugin
bc1a2a0d8 xquartz: Remove unused include of AvailabilityMacros.h from various sources
393da8b43 xquartz: Remove support for building for i386
43aaa1093 xquartz: Remove support for Mountain Lion and earlier versions of macOS
fb492686d xquartz: Remove support for Lion and earlier versions of macOS
34784415a xquartz: Remove support for SnowLeopard and earlier versions of macOS
d3f81ecaf xquartz: Remove check for libdispatch now that we don't support pre-SnowLeopard
739c5bd32 xquartz: Remove support for Leopard and earlier versions of macOS
2d7eb8249 xquartz: Remove support for Tiger and earlier versions of macOS
080f9eb76 os: Remove support for Tiger and earlier versions of macOS
be9d2fd87 xquartz: Remove support for Panther and earlier versions of macOS
d39eb5840 Fix typo "XQaurtz" in Xquartz.man
1f2b73176 XQuartz: recognize F16-F20 and Menu keys
ecc4ebf53 xquartz: Add stub ddxInputThread()
f5df31c76 meson.build: KMS support also depends on dri2
b09f5f42d xwayland: Replace LogMessage with LogMessageVerb
c17872d50 xkb: Fix heap overflow caused by optimized away min.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{xserver-xorg_1.20.10.bb => xserver-xorg_1.20.11.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.10.bb => xserver-xorg_1.20.11.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
index 4d368a8b5a..b800167af9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.11.bb
@@ -6,8 +6,8 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            "
-SRC_URI[md5sum] = "8cf8bd1f33e3736bc8dd279b20a32399"
-SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
+SRC_URI[md5sum] = "a22ccd74a5eee721cad6805e489c7144"
+SRC_URI[sha256sum] = "914c796e3ffabe1af48071d40ccc85e92117c97a9082ed1df29e4d64e3c34c49"
 
 CFLAGS += "-fcommon"
 
-- 
2.25.1


