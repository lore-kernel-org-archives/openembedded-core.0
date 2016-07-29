Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF5C607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 22:28:14 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id q2so5822286pap.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 15:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3TZWkJipSp4UCyvI/FRky4zLyXkQLLdupy41chiUYpE=;
	b=EkdqjF7k3hOEyNWv4YFwG7SY+/KMhOXoScxFBhTzaUz5Z4EZudEu5ufT2Q6e7Sjiis
	IHOz0KmHA5EIGxznqbLWXZE5ORite9ui4o01BXZLWlcNkVlz3TjSdN08MClzXrMFx2/B
	oHeF+E3YeSOjYpJ85RUo1i977AxmmFytmZV3oA57T0CmeX6AKJkgv4pve2kLPwdswjhX
	0cwgVTl3iHd+Si/JTkkNYhT++zgyumaRh273Hr6tvm9RCb1SqbH4+rrptZWmyIYVjZAS
	mJbRIBKySu9aZ/PFsFjO7m78FU4M6Q44eMpNcn02WoJYQLHBoBlvACW8pe+S3Q1isXHN
	t4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3TZWkJipSp4UCyvI/FRky4zLyXkQLLdupy41chiUYpE=;
	b=KlexPAMlnLra8zZsi06UuNXV0ZgOqPEHZM0RTL/84YFyhiLg2Br/3LQItbW1l2tvrL
	uye4wIx2Wpi27bu8KgxMlIwAJB7TAOXbSdbPN3Swz6jUZZlE6n9uYzJGOhsSYUOcVlT/
	0wyfTAl0OLvse1KmcO6QSYXMVZuDSU+DyJvdiGYCg1lSr80XkiRyaIN3d2dsbNI+uuxX
	93JzoRP9GBFiAj1yI16z1pATzRyWgcIx2y1bNULMtIolbVaUUmJDaqDtGWOkoqOJ7fuX
	z5ahPtAqd//Ogigd2rvkv0ngTBvaTPxZCs8KAxcz90RCBBlEgCtfYO93e8JyU9o26R1p
	POPA==
X-Gm-Message-State: AEkoouvSVHd0GygP28P/RPiKcZSSwxxQGyO3j0NM9u4WwqCcnb5JKOlzDArOdsbu7hMVTQ==
X-Received: by 10.66.76.9 with SMTP id g9mr72026645paw.51.1469831295619;
	Fri, 29 Jul 2016 15:28:15 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	191sm27326626pfx.68.2016.07.29.15.28.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jul 2016 15:28:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 15:28:00 -0700
Message-Id: <20160729222801.9806-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160729222801.9806-1-raj.khem@gmail.com>
References: <20160729222801.9806-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] ffmpeg: Upgrade to 3.1.1
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
X-List-Received-Date: Fri, 29 Jul 2016 22:28:15 -0000

Fix build on mips64 while on it.
It was failing for mips64 with 3.1 too

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ffmpeg/ffmpeg/mips64_cpu_detection.patch       | 32 ++++++++++++++++++++++
 .../ffmpeg/{ffmpeg_3.1.bb => ffmpeg_3.1.1.bb}      |  9 +++---
 2 files changed, 37 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.1.bb => ffmpeg_3.1.1.bb} (95%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
new file mode 100644
index 0000000..69429af
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/mips64_cpu_detection.patch
@@ -0,0 +1,32 @@
+It will add -mips64r6 and -mips64r2 to cmdline which will
+cause conflicts
+
+in OE we user mips32r2 and mips64r2 for mips arch versions
+so there is no benefit of detecting it automatically by
+poking at tools especially in cross env
+
+Fixes errors like
+
+linking -mnan=2008 module with previous -mnan=legacy modules
+failed to merge target specific data of file
+
+-Khem
+Upstream-Status: Inappropriate [OE-Specific]
+
+Index: ffmpeg-3.1.1/configure
+===================================================================
+--- ffmpeg-3.1.1.orig/configure
++++ ffmpeg-3.1.1/configure
+@@ -5220,12 +5220,9 @@ elif enabled mips; then
+ 
+     # Enable minimum ISA based on selected options
+     if enabled mips64; then
+-        enabled mips64r6 && check_inline_asm_flags mips64r6 '"dlsa $0, $0, $0, 1"' '-mips64r6'
+         enabled mips64r2 && check_inline_asm_flags mips64r2 '"dext $0, $0, 0, 1"' '-mips64r2'
+         disabled mips64r6 && disabled mips64r2 && check_inline_asm_flags mips64r1 '"daddi $0, $0, 0"' '-mips64'
+     else
+-        enabled mips32r6 && check_inline_asm_flags mips32r6 '"aui $0, $0, 0"' '-mips32r6'
+-        enabled mips32r5 && check_inline_asm_flags mips32r5 '"eretnc"' '-mips32r5'
+         enabled mips32r2 && check_inline_asm_flags mips32r2 '"ext $0, $0, 0, 1"' '-mips32r2'
+         disabled mips32r6 && disabled mips32r5 && disabled mips32r2 && check_inline_asm_flags mips32r1 '"addi $0, $0, 0"' '-mips32'
+     fi
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb
similarity index 95%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb
index 2d83ef0..b8acb61 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.1.1.bb
@@ -13,10 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
-
-SRC_URI[md5sum] = "24ef0c0d541c857c8bc39215619b126f"
-SRC_URI[sha256sum] = "919022430e2dad782fabccffdd6c4cae4e7029f84f0701aa662f036a9ca65423"
+SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
+           file://mips64_cpu_detection.patch \
+          "
+SRC_URI[md5sum] = "4ba7033da5d9ac4d0391516c7e5d97e4"
+SRC_URI[sha256sum] = "71bc11f2a8202ef3fbe5e43a9a163b4b698855da39fb6216d9a4614eddd031db"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.9.0


