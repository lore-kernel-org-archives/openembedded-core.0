Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id D1365613C7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:17 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3so2005542wru.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LEHzdlZavVKsW4nc+5tq15H90KxvQ3clK9dzQoUhbq0=;
	b=PC4KXbHnam2bsIT4UFN5iwGi4bVUwGoYVHbGYFWTW86TFgT+yjk+Gxy4lN36yKUgjJ
	LbUvdRtfWZcpf5h4dNtCshVkAWfetZS7W7m6bPXbyyar/ct1jNDK96UkK4QdFhcI9tey
	q+C76wlCOmjL+hoHSs15t6GraySN9B3TndKW07rEtmJLylVkWcyABLY/WmJ3IoQE6+aU
	yF+FHT+ATjLSJILV8X3xncarHPBSw/bXBhydEowW01S/BlalCqWtdgp1wacaUC1Na3gY
	q/Zk16E6igVHthuvO5rvaT1po+BUuCJDxzsMmooFN24syhu2sYvFmDYmcZTG+VRJKeHF
	5kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LEHzdlZavVKsW4nc+5tq15H90KxvQ3clK9dzQoUhbq0=;
	b=S/Ykk9nVuZjQk3a3yXmBdkNaDQ7bSXdBiSAONjCdRFuVaDOllmbY9RWGW/RzvMEHcj
	fcvl4Z779tf7u9pR2vQkc3q1PN0hEPRKcwDY1acg/NHWbPpAIRmwbUZYITTpSlLX6Esf
	2pL5KpZLaY29HunpMVZUgM5velJZDyNhh8HuyvBzD5ZMnT4ZPvaTtecgpzt4NjpIf3AM
	18A6/q0mcjJijYU/ni/oU8bMGReeg4bho9dE0WWin9U0ADfcDTzbK26XBKv9zTeRqhC8
	W4K0wqupwb8zahWvgE67bY0xe4PRNm3nUEB/6BRYn0mX2MqApmcTVQrxEWJpuuWE46yF
	8i0w==
X-Gm-Message-State: APjAAAX43QSIQqanKq5ZtkjB5L/6XC9UcK+I8KWJy0OyqMoIqZufD78I
	1sZzahNfqdYYFHjv++fZu+4pblGx
X-Google-Smtp-Source: APXvYqyI5RiSmtMuVSjO3qGmIS/rp03V/IwbYLCtB8NK4miVOCri7MeeL40uyXNSelZQNXldq7BvKw==
X-Received: by 2002:adf:f288:: with SMTP id k8mr39676368wro.301.1582141698456; 
	Wed, 19 Feb 2020 11:48:18 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:42 +0100
Message-Id: <20200219194752.7967-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/13] webkitgtk: unbreak wayland build
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:19 -0000
Content-Transfer-Encoding: 8bit

webkit nowadays requires a couple of supplementary libraries for this,
so bring them in (courtesy of meta-webkit[1], which will hopefully
adjust without a lot of trouble).

[1] https://github.com/Igalia/meta-webkit/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/libwpe_1.4.0.1.bb       | 15 +++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb     |  2 +-
 meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb | 15 +++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
 create mode 100644 meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb

diff --git a/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
new file mode 100644
index 0000000000..346ca9b1d8
--- /dev/null
+++ b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
@@ -0,0 +1,15 @@
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
+SRC_URI[sha256sum] = "09849dfb34877354f34f318e138971cf22e677b2179e1f0a8ea00ab0b7bd8e9b"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index 153bc8db11..585723772e 100644
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
index 0000000000..7db5806d9d
--- /dev/null
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
@@ -0,0 +1,15 @@
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
+SRC_URI[sha256sum] = "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
+
-- 
2.25.0


