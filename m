Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 54F2775C60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:10 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id yl2so4046532pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jNXf2XoaYMNHdRYRYbF5OS+TyVxptfffO9JOaPk8DCI=;
	b=iXOvrCWmp8l/odMpMJLHYKp68ijsrP/3AMiug6AArCcGwECN+xsSUBR7SIxZohmbl/
	hMD5Vum7w97VrGlLoEJ7Plm+zE+Bfn3mIoCOzgy4Z+sj1fqssB5DXGp5oceugoj7p8f8
	FBomJaRgsLG92cSqJdldsEBlceYe/O71Qdn2DmCIiZWGk+14KBvabYf2zdkAi5VhCyEU
	fpPR9O+HUJnAFKx1v+AP9TQ0qYh5KIWt/Ytfy4zEFPGdIY5ivUSsoCiIJOxNrwa1mDoJ
	cKNBqq4Hw/xbymprj63Ct8Lbuaz/GBihiuYo7qbL7uZ5AHIhRrIuOoJlxUudSTg8dPSR
	4NzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=jNXf2XoaYMNHdRYRYbF5OS+TyVxptfffO9JOaPk8DCI=;
	b=k6XhLyVJZUumuMWfabr1J+GH1nnwtP9c7OqijRKXOD4A4aqmxB1Ss4brsuvVjlAZXD
	6SZM+AFihh2DDBAWHDZp4DQ1m8E1R0m+B8r8nrHqqghhPVaiNBSt68c3r52jCS93V9iF
	o85rrvzr9AOUa0pRwm7m7ImfJBTmUuvx7nJyG0lB5ZlDXjw76s1aGOakJgKTWrXIgsmv
	TFKKvd+ANTAdvIlryqRxx9Y61AtTVRhlTgsVhLfyQevVpMbQiuhI8jzpUCctaUWu37mO
	Nkdm/DHV2kQic9fySaGBvJqeTHR41XJU4rVNCeDbXemlEvQLYsm/Ypk1ccCu/QuK8ny4
	sXdg==
X-Gm-Message-State: AOPr4FW29mmbKryNXftpJV4DdXZ/nQHwqHfgU2AngpAlkf5NukMXttmaXHfOv/O9dnRfzQ==
X-Received: by 10.66.27.164 with SMTP id u4mr6680116pag.112.1462988171254;
	Wed, 11 May 2016 10:36:11 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:21 -0700
Message-Id: <2c4a85a78d98c32bbd311fee753dddeececf3f17.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 18/42] conf: bump minimum kernel to 3.2.0
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
X-List-Received-Date: Wed, 11 May 2016 17:36:10 -0000

glibc 2.24 have raised the bar for minimum supported kernel
for more details see

http://repo.or.cz/glibc.git/commit/5b4ecd3f95695ef593e4474b4ab5a117291ba5fc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/conf/bitbake.conf                 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 008bb57..645a7f4 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -90,7 +90,7 @@ SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; tar_sdk; ${SDK
 # Some archs override this, we need the nativesdk version
 # turns out this is hard to get from the datastore due to TRANSLATED_TARGET_ARCH
 # manipulation.
-SDK_OLDEST_KERNEL = "2.6.32"
+SDK_OLDEST_KERNEL = "3.2.0"
 
 fakeroot python do_populate_sdk() {
     from oe.sdk import populate_sdk
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e02e91..07d171d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -403,7 +403,7 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 # Kernel info.
 ##################################################################
 
-OLDEST_KERNEL = "2.6.32"
+OLDEST_KERNEL = "3.2.0"
 OLDEST_KERNEL_aarch64 = "3.14"
 STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
 STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
-- 
2.8.2


