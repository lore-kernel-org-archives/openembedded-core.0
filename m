Return-Path: <andrei@gherzan.ro>
Received: from mail-qe0-f45.google.com (mail-qe0-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5D90E60CE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 16:34:00 +0000 (UTC)
Received: by mail-qe0-f45.google.com with SMTP id 6so5288101qea.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 08:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u4XsszQR2k++1gE1OHI10waNKTOq/3u1/Q3a+NvIfNA=;
	b=jxygpkTfP8if4poICrncIWJbgzmIiYFBz4+YwILcvAyGf6IYpX4IqjMIFE9AJXYOtQ
	riruR1nQoCPLgI0eBMJIhmZ/hB7Ihvk5si/p2mhX+uiO/lPfpIhb9ViCix1F5tJZ+jES
	zERFcwzikfnXKWZvp7AjHFS/q7eEQH3Y3ByuhNlTlUq4KgzlMJooMqFCKO8fAJDzDFRd
	LeHEu83WOqwUFagj6iXlmjvCmGSTbwYWdXMByiu8nVrR9M+/fkSIertAofzB61jS6bEd
	4yFyg3RjbIVbflR7vXzp/AY5eRDo/2KEYHW/Sdqxdduk4MH+305DcmZWDiofVL5Kxg5z
	oBEQ==
X-Gm-Message-State: ALoCoQnRBAHB23gU087XAQn4FTsrLPy0wRB6Uvk1Xd7mZs7pK5PmN2r9TUYwh0h8nxHbGVJ2XSmg
X-Received: by 10.224.87.194 with SMTP id x2mr2798211qal.67.1387298040873;
	Tue, 17 Dec 2013 08:34:00 -0800 (PST)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPSA id n14sm58008737qav.8.2013.12.17.08.33.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Dec 2013 08:33:59 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2013 18:33:51 +0200
Message-Id: <1387298031-15180-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
Cc: Alexandru Niculita <alexnick87@gmail.com>
Subject: [PATCH 1/1] libsdl: Add support for libsdl-native
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
X-List-Received-Date: Tue, 17 Dec 2013 16:34:00 -0000

From: Alexandru Niculita <alexnick87@gmail.com>

Change-Id: I4fb1e623c7bbb1f35ae3001c839cd7e16ce1bd65
Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 4b4ff63..84d3ad6 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -17,6 +17,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
            tslib"
 DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
+DEPENDS_class-native = "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-native libxrandr-native libxrender-native libxext-native', '', d)}"
 
 PR = "r2"
 
@@ -63,4 +64,4 @@ do_configure_prepend() {
         export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
 }
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "nativesdk native"
-- 
1.8.1.4


