Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0277C60123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 02:11:38 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 127so31431241pfg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 18:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ukxrV9of0bU4RdqiE9pnEMskWQaq/y1XC4czbnyT/mU=;
	b=Y7axHQT+c8B6r39JvT8/xsGTKzh7Eh5kFVfrj0UIDE2v31G2WBM5I98mXs8chi51N8
	u0RZ/H3g6JZgSafx6bTrTj/XOpVbJk4ccIxFBq+dyskWF+huvPV/MO5vx3Sdh+RUa82m
	QQwH2LssxXLwslDil9XQonDIjhG+HQDYr4KlvfWyDVuOXasVsEETq7AN5dDvCyDrtiYZ
	3byxP7tsWs9qIu7XABwcbytNVRRJDI0lTiPx1vj2bF+eqwFVZSOBbSe7TVzfI4DEvfed
	YCcymsgEvqVVbOkjspXfAe+XkfIp58Oy+83W1ygtdjihKIDw/3JLgQc0yMm2taq8913v
	PoBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ukxrV9of0bU4RdqiE9pnEMskWQaq/y1XC4czbnyT/mU=;
	b=M0bJBCPVIkqXnYtQSNUEW3gZlhtdjktaDU0CqhMBZbaBojMNjFaEwCuARrQ6BxzCBL
	DLFB+VfV1hp0341f2zA8dQbsdLnNeGknQrRvAHI7A06REVo0g8MEotFWh41Ir752hJtN
	qjqTcqso/LBSzjq6CX+SR/J2EGtxoWG/d3BbC9nNEmWs1iWGQ6NhbE6vdHw48UFI54pv
	SqeJ6WYagMU4LGOB4SwAbjVz6FfmLDA7EYBArG+F9fmnh6PnaSCr7AEGJqjbTUGpSXxJ
	jaLzQFCPAtaFYbSx9WHU//52mWyPci/BMby8yIkRyfZg0YN/WPR0C7XVbmdoljfqXOEF
	KdRA==
X-Gm-Message-State: AIkVDXJSyrAZ7goTt5XuPtVLq2N7GfiN5jaUe0Ka4veRQIGYAe31ipgvbwZ4zY0yNpBF4w==
X-Received: by 10.98.82.216 with SMTP id g207mr7353661pfb.32.1484100698974;
	Tue, 10 Jan 2017 18:11:38 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	c22sm8748480pgn.12.2017.01.10.18.11.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jan 2017 18:11:37 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2017 18:11:20 -0800
Message-Id: <1484100680-17209-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] wayland: minor recipe cleanup
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
X-List-Received-Date: Wed, 11 Jan 2017 02:11:39 -0000

Reorder lines, no functional changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/wayland/wayland_1.12.0.bb | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland_1.12.0.bb b/meta/recipes-graphics/wayland/wayland_1.12.0.bb
index de261fe..026227a 100644
--- a/meta/recipes-graphics/wayland/wayland_1.12.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.12.0.bb
@@ -10,20 +10,17 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
                     file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
 
+DEPENDS = "expat libxml2 libffi wayland-native"
+
 SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            "
 SRC_URI[md5sum] = "ee615e2d1e205eec48b02f069327eb96"
 SRC_URI[sha256sum] = "d6b4135cba0188abcb7275513c72dede751d6194f6edc5b82183a3ba8b821ab1"
 
-EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
-
 inherit autotools pkgconfig
 
-BBCLASSEXTEND = "native nativesdk"
-
-DEPENDS = "expat libxml2 libffi wayland-native"
-
 EXTRA_OECONF = "--disable-documentation --with-host-scanner"
+EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
 
 # Wayland installs a M4 macro for other projects to use, which uses the target
 # pkg-config to find files.  Replace pkg-config with pkg-config-native.
@@ -40,3 +37,5 @@ sysroot_stage_all_append_class-target () {
 
 FILES_${PN} = "${libdir}/*${SOLIBS}"
 FILES_${PN}-dev += "${bindir} ${datadir}/wayland"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


