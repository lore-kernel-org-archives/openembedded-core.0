Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7B27D245
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 05:16:44 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id y67so14729502ede.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 22:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=k0PqRKG6UyqAOmrthKSrVAol+dTaHBBoieC52ogJeZA=;
	b=ZEvzf7uNXBqpZLEVGQwwnSPgs9tX0gAzbWCvUhNi6aL2eEICATx7E92URqbcN6n9L8
	xFHFGcpbDwDbrELAwHYU9Ax8FUkbL4K29hTq8g1biJL3hIjUU2FSd7j1c+tbl5OELmjt
	rbwOP8kRabO9CCYbok8xvovcASaT/LXcLrXaGP72hFQf5o5c2n2XeoCCtlwO7YiUr63r
	c9MonSX+SRRpiNKME/OAMgN2/1xLxRt8/JWelw2XUix2FqIKPOvkC3i+p4MTlDoRDQNY
	exr81lTOfv+SK1SUR9gIw4CZjUeaOMskFq4pBZbtwfB/dc78QFxoBMLp0OHc5xxDloJW
	QDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=k0PqRKG6UyqAOmrthKSrVAol+dTaHBBoieC52ogJeZA=;
	b=C8kQKBO9XDDU4IZzFEWXfG5AhtZMwFjmpisF8I4CvlqOKxt8p4Sek4uxzu4/Y8UrLc
	fpiQywvbBD8zeThHAP3MnxnUzhqQyaMnPVBiR0adumgaoMMifoF06Hk2j//OjrO2DIKH
	n7lcCF7MH4+sxmgM9EZbVQzd+Vk/f/RGet3pHu7X6ORWQC8N3N/AJzO7WKfG4q3WRYsc
	XWGn9Xi2JxwTqEEtfLKZT23FKdgS7GzKGYN0bIBEQpDjbIrN40SonP9/ECsBPv+N17lh
	jLJS4CQebIid1hsCOCOtL2zxFYBJ8fM3Ti6+M+BppV2vNovQdM83TwAj9G9cdRK3stfA
	bS5g==
X-Gm-Message-State: APjAAAXX9O8bdmcqUIlkFNcors4ghlZ5l/yAGCOyA5EwHcLA0994XwB1
	5XNL/wRqJCKrioiCX6HGtZXjwwybQH0=
X-Google-Smtp-Source: APXvYqxRcBYPq8w3sXBqsRCYEq069wQ5nIr7Qj2X3FTKXwmb1zdHq7e4sp07jH9kNiaO9l+CU3Tnjw==
X-Received: by 2002:a05:6402:169a:: with SMTP id
	a26mr19230367edv.26.1556083004791; 
	Tue, 23 Apr 2019 22:16:44 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id e7sm39251eja.35.2019.04.23.22.16.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 22:16:44 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 07:16:20 +0200
Message-Id: <20190424051620.10065-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2] ell: add recipe
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
X-List-Received-Date: Wed, 24 Apr 2019 05:16:44 -0000

ELL has originally been part of meta-openembedded, but newer versions
of some of the oe-core components depend on it, e.g. ofono.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-core/ell/ell_0.19.bb        | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-core/ell/ell_0.19.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 41c2a95d53..c00e5b8c65 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -166,6 +166,7 @@ RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-core/ell/ell_0.19.bb b/meta/recipes-core/ell/ell_0.19.bb
new file mode 100644
index 0000000000..8f635e673c
--- /dev/null
+++ b/meta/recipes-core/ell/ell_0.19.bb
@@ -0,0 +1,22 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "The Embedded Linux Library (ELL) provides core, \
+low-level functionality for system daemons. It typically has no \
+dependencies other than the Linux kernel, C standard library, and \
+libdl (for dynamic linking). While ELL is designed to be efficient \
+and compact enough for use on embedded Linux platforms, it is not \
+limited to resource-constrained systems."
+SECTION = "libs"
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+
+DEPENDS = "dbus"
+
+inherit autotools pkgconfig
+
+SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "4356397ca11d5f8ec7f1aaf1e91ffea4"
+SRC_URI[sha256sum] = "a5a4d45ca002dd91560fcd565e696f59e82631e69c927115dafc640f0b8d779c"
+
+do_configure_prepend () {
+    mkdir -p ${S}/build-aux
+}
-- 
2.17.1


