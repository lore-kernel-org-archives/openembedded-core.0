Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 66D907FBF1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:11 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id r141so4130685wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MFt619UA37SNnTyfsjE8YDWEyhWRU+3SVArgUA6XpA8=;
	b=cM+NE0GND+okzceLzhdQZ6K5vf/ISgggweDxiLmRg+a9OQNBYRGAbx4xzvzVIIad3H
	96vgPWXePoglO0Ix/apNXf/O1ws6qRF3GXHRZvrm81NWiyunF4TUOlobwEM0QkAP0odl
	/WqKViykwZOeg7edVmE3bY3LIojIcNsPfQUD4FHozmQDVnSUH4hdBnwowSk074PeZ+FL
	78hhqomXYY6ZHXh3l0zy+QQ+eEJNBopD2gssTqDDMbq11sqLtQS7MaNVBnu5Hcv0sMR3
	gq6dyWv72mg++WskQ/uWLahX0aZCmOaq+1N0emmp17+EAmdZlG10mFfLCs88fa6LqKik
	hOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MFt619UA37SNnTyfsjE8YDWEyhWRU+3SVArgUA6XpA8=;
	b=Fv4wtsl8Km6Ms9nGQjT7pfHrVJS787lDGZuOIhylo83DuuHe/Bs3Mb13x3R8JNMoQq
	Jbl3udEce9OVfxxS+lomaeLEBJu7oHQvVqdDS/Rq3jRVN9str5YJshvnqbEFgruQDET7
	PiGU7kkrK4M9GIgkPAcNrYCM70yMdysIp/gbrq2y+4Ne1k+tvoqSspKdXxzs5qk0ES8R
	fBDduMiih4WQCBf+EzbNxX61WGm4omW4M2R+qaoGmZRicb1Qyoh193DjhgYfqvvUWaFq
	5VsTXJNbCOOYuRz75FOeff5aqJ+DDzHwv2VaMTgagFfcCRJRtVd1CjYEgJoB7hZEn2+y
	kYIg==
X-Gm-Message-State: APjAAAUJM+FoeI30haTGttOJXWe4l45jHS7OTcC9qEx7SLirp+zBaMDT
	uS3K2uXXbaYda7+8OxeajmE4iDs03fw=
X-Google-Smtp-Source: APXvYqxjRpZSrti3CbJC4xfWH/Z1paLsOgr0Rya3sQJYRdUktiCPDfDAuF6H8Ia1xbXXYLlSITvqyA==
X-Received: by 2002:a1c:7219:: with SMTP id n25mr6937330wmc.101.1572072611847; 
	Fri, 25 Oct 2019 23:50:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:41 -0700
Message-Id: <691f04965faf58d9d6323898478916ae306d046c.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 09/28] libsdl2: fix CVE-2019-13616
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:11 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2019-13616

Patch from:
https://hg.libsdl.org/SDL/rev/e7ba650a643a

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 70b9cdf86b9c5ed14937500619387a890a57ef20)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...538-validate-image-size-when-loading-BMP-.patch | 34 ++++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch
new file mode 100644
index 0000000..674decc
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch
@@ -0,0 +1,34 @@
+From 85138c1ec673e05263ae666baf61f79384daf7e0 Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Tue, 30 Jul 2019 11:00:00 -0700
+Subject: [PATCH] Fixed bug 4538 - validate image size when loading BMP files
+
+Upstream-Status: Backport
+[https://hg.libsdl.org/SDL/rev/e7ba650a643a]
+
+CVE: CVE-2019-13616
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ src/video/SDL_bmp.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/video/SDL_bmp.c b/src/video/SDL_bmp.c
+index 0b68918..a06b0c9 100644
+--- a/src/video/SDL_bmp.c
++++ b/src/video/SDL_bmp.c
+@@ -226,6 +226,11 @@ SDL_LoadBMP_RW(SDL_RWops * src, int freesrc)
+             SDL_RWseek(src, (biSize - headerSize), RW_SEEK_CUR);
+         }
+     }
++    if (biWidth <= 0 || biHeight == 0) {
++        SDL_SetError("BMP file with bad dimensions (%dx%d)", biWidth, biHeight);
++        was_error = SDL_TRUE;
++        goto done;
++    }
+     if (biHeight < 0) {
+         topDown = SDL_TRUE;
+         biHeight = -biHeight;
+-- 
+2.7.4
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
index 3a0654b..cdc8650 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.10.bb
@@ -14,6 +14,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://more-gen-depends.patch \
+           file://0001-Fixed-bug-4538-validate-image-size-when-loading-BMP-.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.7.4


