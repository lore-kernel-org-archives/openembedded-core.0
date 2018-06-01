Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id AF443745C3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 10:29:48 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id z6-v6so4838060wma.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1TS7sbHrLk1JFxCn8MZkAkbmPxM1jUVZ2JJmYGYPNjI=;
	b=frYffhG8iir8J6XL4yEvwynGQ1et2A9AP9O4yYdvcFCy0Srzjxxg223z1hmeogfsZH
	bTwja3Ld9yj5L6cwbGqWiXwLfprxLgtiIDFw42gq60/zJmDe8Adr8SLbDVWlQZhhfpIj
	YH+JMdrOn5pWMBK9zBP8Ow2N7F0FCJc7ZsTGP0ELcFFcXiAWQ6/hUvUammxF8SB7nqEa
	xlrkqFtR3XlOikW8WoUVpbZBGRSZxrqa7LIaROUJ0Cje62Vz3+rM61P9VQ7hs/CO5w4N
	GBEA57MvnPzDAIM4soc/mA5eRJH1WIy7mwWPzV9vVnKS4Jxdo76tPvkTqF+zeLfhaS1L
	ZtVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1TS7sbHrLk1JFxCn8MZkAkbmPxM1jUVZ2JJmYGYPNjI=;
	b=cUC2WKS63zKhFbHKayBc5O8YJF4oZUo0XVT4m7C7Iid/1WEuTbAKJCAv4FXsIarh0e
	pK/Xf9ykzFx5KhOPlRxejBVBv+Zg5l2j+NJB5Ux9kbUh/Jo7FGOnA1blJ+0eMBJ3qrZ0
	bQlmeBMyB9UEnlYJWtiDfTdkCLdOFN0oquplqCtMr5H6TRlSeDV8YLGviRt+M36kYyvL
	flO7nbPAdqbDcImkGJ7GrLLkBSbRH7TFLOBl97uX/wlISMNAuX52Fbh1aKpR4MR/myna
	7HfVtUaAT5hQgEAn9pi9x9FfBwQ/B3kpw63V+VAm+dxZd7eb+ONwx5PGyOjK/JaC7YdD
	+lkA==
X-Gm-Message-State: ALKqPwc0aSmMJt5PwfiMGmgpp9ja/OZv1pczV0KfqDhrr7tbRDlJIc96
	B4DyDujYhCDg8uDIOJg5q3mStg==
X-Google-Smtp-Source: ADUXVKKOdmAfWDUYbAh+oGOqQrNcoMNIJU9K6tCcQmJtlw0p1T5Wk9uu12PtJSgPLEeieOeeMPo6vg==
X-Received: by 2002:a1c:f106:: with SMTP id p6-v6mr2272327wmh.68.1527848989110;
	Fri, 01 Jun 2018 03:29:49 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v14-v6sm11349755wro.33.2018.06.01.03.29.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Jun 2018 03:29:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 10:29:40 +0000
Message-Id: <5abf602787af642723785206e7a7082c0641b7f7.1527848868.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1527848868.git.Martin.Jansa@gmail.com>
References: <cover.1527848868.git.Martin.Jansa@gmail.com>
Subject: [master][PATCH 3/4] qemu: add PACKAGECONFIG for virglrenderer, usb-redir and spice
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
X-List-Received-Date: Fri, 01 Jun 2018 10:29:49 -0000

* drop "fdt sdl" listed twice in PACKAGECONFIG
* keep all 3 disabled by default
* spice, usbredir recipes will eventually be in meta-networking layer
  (you can use jansa/spice branch from meta-openembedded-contrib repository)
* virglrenderer recipe will eventually be in oe-core layer
  (you can use jansa/qemu branch from openembedded-core-contrib repository)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index dc73df813a..773ac81a6e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -74,10 +74,9 @@ do_install_append() {
 # END of qemu-mips workaround
 
 PACKAGECONFIG ??= " \
-	fdt sdl \
-	fdt sdl kvm \
-	${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
-	"
+    fdt sdl kvm \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
+"
 PACKAGECONFIG_class-native ??= "fdt alsa kvm"
 PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
 
@@ -115,5 +114,10 @@ PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
 PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,${BLUEZ}"
 PACKAGECONFIG[libiscsi] = "--enable-libiscsi,--disable-libiscsi"
 PACKAGECONFIG[kvm] = "--enable-kvm,--disable-kvm"
+PACKAGECONFIG[virglrenderer] = "--enable-virglrenderer,--disable-virglrenderer,virglrenderer"
+# spice will be in meta-networking layer
+PACKAGECONFIG[spice] = "--enable-spice,--disable-spice,spice"
+# usbredir will be in meta-networking layer
+PACKAGECONFIG[usb-redir] = "--enable-usb-redir,--disable-usb-redir,usbredir"
 
 INSANE_SKIP_${PN} = "arch"
-- 
2.17.0


