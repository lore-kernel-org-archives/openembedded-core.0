Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6A87F6142F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 15:51:08 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y17so16658764wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 07:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=d5+uNNEMoIS+bHhSm8h6+d/8rB4psrUi7u8y8JDito0=;
	b=Ctl1hTTRSjApmVjvwwaTlDJCtvAuXcgubBX1Dr7n2X0t+fR51U7cmF7A7cTGZHnZHI
	r2Y+yGNc3w0HDjlCFl/1L9XPwo9/pcr8ZKELlqVxUs/IMad09W+8yaYqkeZKYCOVqIGU
	edlm0iLcVZT/7x9DyyQQfz+8u69EwNl3SawE+kQk6H3uNCUntpd1/4anrFGYuGeHIhdK
	SlqaTg/PIwixJeBqFaEfc3mQ2FPDslzlPUKMKBBNW2lwjgHKlMdDXT6ajLLGMwN2lYd6
	SpfElwXVGbgJDw52m6uxPVb697fiJCpkkKQFlze/iTB+QP1xITy9kj4kHnPNFwi/51xs
	b4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=d5+uNNEMoIS+bHhSm8h6+d/8rB4psrUi7u8y8JDito0=;
	b=qOmc/zsirq4NqppmUpgDPNrAy4wS23r+6H4Kycess9PGR+X70J7qve5I5osGvOMLPf
	M+H4RZYWTjCvIEYp2q30S4/hLnC8jebUu/Jcy3JApd4zGi7uh4waCSfW3uMVrwE2RRB7
	zav3CpVqveMIPbWII04sjiRiy2YzZnVWcl0sGE0lzVVKSABdQ7HaOh6749GVkEqjJxyx
	Wl/g4YHV66S/T3fd3ceZuRV3Gc1tcREsJl0qpHf/Dzm09jTg3JUezQEf9Bs5rUXD4s8r
	qJ9wNvDubu1r2AiTeSPDnjoSJtSZlzDY7mOpebnwYCAtCZU3hFDZQMfuuJl6CXUlGd2A
	GSIA==
X-Gm-Message-State: APjAAAX6Qe+87CXlUiZBDfszWsLuSSxCjkb9jcJ+hswlWJtQrBPy9iB+
	8fZB3JULruCwsBtrtgbZe2rBNjwR
X-Google-Smtp-Source: APXvYqyryoRh9tvSMXxxQuVRhcaUf4Jr37B59uAU+RQmqIesQbt0uAyDlkB70E1ExrFgbuddJnJM9g==
X-Received: by 2002:adf:ed8e:: with SMTP id c14mr16411237wro.80.1581868268803; 
	Sun, 16 Feb 2020 07:51:08 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t81sm16513271wmg.6.2020.02.16.07.51.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 07:51:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 16:50:12 +0100
Message-Id: <20200216155015.21738-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216155015.21738-1-alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] webkitgtk: unbreak wayland build
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
X-List-Received-Date: Sun, 16 Feb 2020 15:51:08 -0000
Content-Transfer-Encoding: 8bit

webkit nowadays requires a couple of supplementary libraries for this,
so bring them in (courtesy of meta-browser, which will hopefully
adjust without a lot of trouble).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/libwpe_1.4.0.1.bb    | 19 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb  |  2 +-
 .../webkit/wpebackend-fdo_1.4.1.bb            | 19 +++++++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
 create mode 100644 meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb

diff --git a/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
new file mode 100644
index 0000000000..b9c71f9dc5
--- /dev/null
+++ b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "General-purpose library specifically developed for the WPE-flavored port of WebKit."
+HOMEPAGE = "https://github.com/WebPlatformForEmbedded/libwpe"
+BUGTRACKER = "https://github.com/WebPlatformForEmbedded/libwpe/issues"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=371a616eb4903c6cb79e9893a5f615cc"
+DEPENDS = "virtual/egl libxkbcommon"
+
+# Workaround build issue with RPi userland EGL libraries.
+CFLAGS_append_rpi = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', '-D_GNU_SOURCE', d)}"
+
+inherit cmake
+
+SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "1d4d38413ee0d0043f74d0445cab906f"
+SRC_URI[sha256sum] = "09849dfb34877354f34f318e138971cf22e677b2179e1f0a8ea00ab0b7bd8e9b"
+SRC_URI[sha1sum] = "a41480a0a85cfa11b3f87f801b7c37bc3410e060"
+SRC_URI[sha384sum] = "30488e375d956809a84b0d8af7b386a332541c77dcbd53496a896f894dbf39ac34534e935d6bc7a75c1b536f04f7f0a0"
+SRC_URI[sha512sum] = "cbbe6b8e9bbb864d7f96bbdb56db262bbd341c86bc7bedfcc51be8077c0ea58a4e88c61b7b7bec937d5476e6cb81c093229bf80e3ee99452829287bd26175670"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index 4aa8533b42..8d87ad49a3 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -44,7 +44,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
                    libsecret \
                   "
 
-PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland"
+PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
 PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
 PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
 PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
new file mode 100644
index 0000000000..84df0c2535
--- /dev/null
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "WPE's backend based on a freedesktop.org stack."
+HOMEPAGE = "https://github.com/Igalia/WPEBackend-fdo"
+BUGTRACKER = "https://github.com/Igalia/WPEBackend-fdo/issues"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1f62cef2e3645e3e74eb05fd389d7a66"
+DEPENDS = "glib-2.0 libxkbcommon wayland virtual/egl libwpe"
+
+DEPENDS_append_class-target = " wayland-native"
+
+inherit cmake
+
+SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "c6362491a4a38ddac42b66f140e1cff2"
+SRC_URI[sha256sum] = "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
+SRC_URI[sha1sum] = "9217c8a5511bc53544b42cb23390256580ac4b0c"
+SRC_URI[sha384sum] = "79f3a28bc8e0a8240dc9962a6a245276d39dd8112a753d5ada39e98332d857eb9fc9c2879a702060807a10ea60be796d"
+SRC_URI[sha512sum] = "8fdd13843c77b95b96b3feffea463bce565620997680e209a0cdcc09314a1469f2f1cb4744dceb2cf6c8d6ce5cb2bbdb4c7fbaf0451a687640c3f63bbdbfc4d4"
+
-- 
2.25.0


