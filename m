Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	by mail.openembedded.org (Postfix) with ESMTP id 338967C164
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:31 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id y11so8316157lfj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=S+fD9dT8fA+MvYlgMKZfOrrCdbilB1L3S2b5hFNs1Xo=;
	b=LLVZy6/+676NQltlhLGHogi3zseH4a8930tcZ/z164wA+pNL0+yKQBTRc6Iepg4sOK
	19/J1yW53Q5zXu2OYyChz9DIWoZd3AZkQc7ZAmvEdcK7Ppv9SHJbibk3vG/w6qV7OtEu
	sh0yxvL3pxJ8e4RFHaUZlbbSFtPXkwhKAR5iEZ52UE7Uyv4dRUvG0dh39Ji00nEEDSiL
	kpNtLVbjbP9xlzVMkN8OQsp2TVOwGSn5Q55/O+gDze1UvK3bl8rILC2IIiDXtPhND/Ca
	89BU/lHV6etjG2PG98Z6VepdBEm3WnnGkXTwR5J0exzs9pNLSo52P/8A25uxuWRdQrJh
	KXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=S+fD9dT8fA+MvYlgMKZfOrrCdbilB1L3S2b5hFNs1Xo=;
	b=RBFxRRhmdm1gidSIsaNItWfvI19r55xTQKwpp+0BpiKi1s4TWcymIO7nI7AjEZ7PoK
	xPcsAiMImpnRfm+JAmRXhR5hEIzPRDQt5J1+VoOGhDoU0254i7L1RNrnACZEFIhcjbS/
	1xo/CjGsj7kd+BcE+dsm1SiUxxiL9FNq4nBl3ZLe+VJYwNzpP/g0Mv/0x9jlxrCDmhfL
	Fbo5Z1ehqsDa0YYFiMyhzboeuAKZsiKGJC86R4qEniA4dW16Q+OzuBzez6ZeJAD5Jf7C
	s+9EfV5krbliTQgKAo7qJN6P3k0N/dACg9iGn/Gt1vMY8lufBGAJSlesh5JFI0pwiZrn
	UiUQ==
X-Gm-Message-State: AJcUukeJMEmRb3gxKSmwi1B9nA6qkvlzAktfVy/Bd2RoMQsnMHdwwNeZ
	lQPw38guJ4ZJCvpOQ//FPA6qLlHD
X-Google-Smtp-Source: ALg8bN5wN0SaYEExMeHiNlegbZYAnQoeu5olJy2DczuB19nmNTjsRG4IMWVAdQBS6ZTGkXiyX5Funw==
X-Received: by 2002:a19:5d42:: with SMTP id p2mr10995379lfj.83.1547743231438; 
	Thu, 17 Jan 2019 08:40:31 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:51 +0100
Message-Id: <bca305fd829bdbef99000faae71ccb458a0c0e65.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 06/27] libepoxy: enable native/nativesdk variants
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:31 -0000

libepoxy is a requirement of virglrenderer. Note that we strip
RPATH from the library, as this allows fall-through to the host
GL implementation, instead of attempting (and failing) to use
mesa-native.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
index 92f644c039d..dd706a96063 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
@@ -14,9 +14,25 @@ UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 inherit meson pkgconfig distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES_class-native = ""
+REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
 
 PACKAGECONFIG[egl] = "-Degl=yes, -Degl=no, virtual/egl"
 PACKAGECONFIG[x11] = "-Dglx=yes, -Dglx=no, virtual/libx11 virtual/libgl"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} egl"
 
 EXTRA_OEMESON += "-Dtests=false"
+
+PACKAGECONFIG_class-native = "egl"
+PACKAGECONFIG_class-nativesdk = "egl"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# This will ensure that dlopen will attempt only GL libraries provided by host
+do_install_append_class-native() {
+	chrpath --delete ${D}${libdir}/*.so
+}
+
+do_install_append_class-nativesdk() {
+	chrpath --delete ${D}${libdir}/*.so
+}
-- 
2.17.1


