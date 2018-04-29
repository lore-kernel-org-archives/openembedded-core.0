Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5FB74527
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:31 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id a13-v6so4926636pgu.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pgpxW4k70heKCfDM5MA/EvOffYswhW++ZXsOtbnyjS8=;
	b=DwOrMbxdLcfCCmP1z8QH/3p4Eg8ZubKEzF6uypgNChIhiwR+DoMcJyqqIG8si2jxMT
	wiFgVJ6jYYnzuuQNsJxq2by5Vggo/WMnQZSXpw0+oCXg8WKUgrfigjPeOYsQmrAW6iJD
	VbOvBy71GM0EtkYAfMGw7UJUz9o7+dsrZJT6eLEChq6s1LQjW+ALEHNXvcogpWggobP7
	6R/JJ6UCeZVH070rTtjGHxpbhJO5ix9vSj37bUbsppD/T0xZHS92SyldPdTfMXUZyt7F
	zeKxENNNWygWX45YnH+ZJ8Gh3hxWMlerW5Vfu3QHTAtLJoTLJqDXR/vk0F9WWs2+N0an
	Lf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pgpxW4k70heKCfDM5MA/EvOffYswhW++ZXsOtbnyjS8=;
	b=Nt18zokD8Iv+9sDXb/BIdU0DWHtcc47KPjoWvPjFsYhc0196em7XiKIwqRNrA8PTND
	i+PyWnYOyL8TWwOBeQa209iommU7/vCiRcLazXBNLYFKBFbZKN8iAcvJBN6UeYd9ciP/
	/lfaoW4EMMftZJYGsT+3BgSibTJ0ZSCNGw58t29lDwHWqhlC72chRRQWAUjVgDqaXilh
	b7YyRJcqQqnSntkbIo7ycTTNoQIOiayJsNy8nSUw3HaqbxoRCHcycSVaY3+TrRxH8vvB
	RpNY6eFEGD8W6KCjYePQOhHA72LFEL8ZQmZJtzC5PZQwFwBc4QHOxDFSFCCSacjZ9BDz
	zwnw==
X-Gm-Message-State: ALQs6tBKUNQWT+3jiKlVD5C4wsb77zLB0vDBJYEH9lkb2HtiZlm+4shd
	s6nDNHFwgG6eLkjZNEv4TbBHjw==
X-Google-Smtp-Source: AB8JxZr3GmsoHPAKmxNGsaZ210w/BKyc9Bfs0RzBnd3Gc0SstjmTXx1JH2i9Idb2WlzyA2aVqlsr5g==
X-Received: by 2002:a17:902:2468:: with SMTP id
	m37-v6mr10140410plg.388.1525030592760; 
	Sun, 29 Apr 2018 12:36:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:00 -0700
Message-Id: <00dd53fde90bd764c2f363d83d1b07dd14a18ce5.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 13/24] libnss-nis: Add recipe
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:32 -0000

This will substitute the glibc nis module which
has been removed

Skip for non-glibc systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../recipes-extended/libnss-nis/libnss-nis.bb | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/libnss-nis/libnss-nis.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 823e1bfa98..d49be7abb9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -362,6 +362,7 @@ RECIPE_MAINTAINER_pn-libnl = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-libnotify = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libnsl2 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libnss-mdns = "Alexander Kanavin <alexander.kanavin@intel.com>"
+RECIPE_MAINTAINER_pn-libnss-nis = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libogg = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libomxil = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-libowl = "Maxin B. John <maxin.john@intel.com>"
diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
new file mode 100644
index 0000000000..e0f69b02ef
--- /dev/null
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -0,0 +1,36 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "NSS module for glibc, to provide NIS support for glibc"
+
+DESCRIPTION = "This package contains the NSS NIS plugin for glibc.\
+This code was formerly part of glibc, but is now standalone to\
+be able to link against TI-RPC for IPv6 support."
+
+HOMEPAGE = "https://github.com/thkukuk/libnss_nis"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+SECTION = "libs"
+DEPENDS += "libtirpc libnsl2"
+
+PV = "3.0+git${SRCPV}"
+
+SRCREV = "d4aea48657a8e90d7922574b8021ee03915a36cb"
+
+SRC_URI = "git://github.com/thkukuk/libnss_nis \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+BBCLASSEXTEND += "native nativesdk"
+#
+# We will skip parsing this packagegeoup for non-glibc systems
+#
+python __anonymous () {
+    if d.getVar('TCLIBC') != "glibc":
+        raise bb.parse.SkipRecipe("incompatible with %s C library" %
+                                   d.getVar('TCLIBC'))
+}
+
-- 
2.17.0


