Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 84B6F7EC0C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:20:26 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z23so10254644wma.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=gr0ggvd/+ClgPx8waMCTnCKUI2R9FOQ7uAERw9lyyrM=;
	b=MRZFtUDr8tfIVG0jEbvI73c9/tP+vuJJTlculyPfI0k6Ax2nAwQlRxQay1bWDgbFk/
	f6U4j49fCEPetc4R8Ovh52HiNXrxlHFu1OWfsqFwl7iq4UUwDf6kteiK9/cyXWgfo1ef
	7+K+q5lqgPo0bUGAyqN+/hJAuqFv9ghzPrrMq4atcZ3IkydicQqCfCdu+18I9QiloTyG
	WE72e6ZQv2LqeLZD2z4QvuK97s4PSYUb3iBhT+qdUiCaoWKX5NTHP4pLpXCS7zvaoLkF
	HIY1pHGQXZ+EcfhxwuntuQcbLjOCT/akvc3L77ddmydrf2G8WOwYEzmkq3JwwAKIXrfR
	mOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=gr0ggvd/+ClgPx8waMCTnCKUI2R9FOQ7uAERw9lyyrM=;
	b=hR6KBcz2KwgNCV8paMv5Yh2E7IvPhVkkNnlFxnTL/tPUMQ36XMqfZWtch0M+/cPb0H
	eqr54A2HitmXEyN2FDP9nIxF3wXVhSkq/8wkryiL4ZkhSfVn3pq1uZcS544zlrnYUpr6
	SaXVI8App6yzBXabWN1OJqwJ6xxiI9TsxmBf4aXD7nL4EYSy2NBtmj1a/qyHUy28pjBG
	pAsnpT7+Lg+mMn8odhSjLP8QuP0l3wNAr37TiJBE9r1hwCYZ37WGbCkeWqnW+m7DWWiR
	Zy9V6Qrb2gyTfMgMqQmjwDPD3q+lXYv9EJJGt5j890T3nMwrlkVCaiLBI3/D2qtf5j7U
	V9Rg==
X-Gm-Message-State: APjAAAW9LpJYwAaVzCdYBlTh2taJuzMOIp3HmHaoflQXOQ1NwPOSDFbf
	tXDABKYX52f3yALsj5plekGKlz3siwY=
X-Google-Smtp-Source: APXvYqz48vVghZgIEUH9QPIX2nl4X1QscR6vM+Yy31C9+gwZDmt6SuCn7dXbpJfbbXTitzT9iDmXUQ==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr4254847wme.81.1562343627046; 
	Fri, 05 Jul 2019 09:20:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r4sm9358102wrv.34.2019.07.05.09.20.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jul 2019 09:20:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2019 17:20:18 +0100
Message-Id: <20190705162018.28251-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190705162018.28251-1-ross.burton@intel.com>
References: <20190705162018.28251-1-ross.burton@intel.com>
Subject: [RFC PATCH 4/4] gnome-themes-standard: remove
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
X-List-Received-Date: Fri, 05 Jul 2019 16:20:26 -0000

This is the Adwaita theme for GTK+ 2, which we don't include in oe-core anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome/gnome-themes-standard_3.22.3.bb          | 46 ----------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb

diff --git a/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb b/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
deleted file mode 100644
index 55ee277606a..00000000000
--- a/meta/recipes-gnome/gnome/gnome-themes-standard_3.22.3.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY = "GTK+2 standard themes"
-HOMEPAGE = "http://ftp.gnome.org/pub/GNOME/sources/gnome-themes-standard/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-SECTION = "x11/gnome"
-
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-inherit autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even distro_features_check
-
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-DEPENDS += "intltool-native gtk+"
-
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-          "
-
-SRC_URI[md5sum] = "b51c362b157b6407303d44f93c31ee11"
-SRC_URI[sha256sum] = "61dc87c52261cfd5b94d65e8ffd923ddeb5d3944562f84942eeeb197ab8ab56a"
-
-EXTRA_OECONF = "--disable-gtk3-engine"
-
-do_install_append() {
-        # Only building Adwaita, remove highcontrast files
-        rm -rf ${D}${prefix}/share/themes/HighContrast \
-               ${D}${prefix}/share/icons
-
-	# The libtool archive file is unneeded with shared libs on modern Linux
-	rm -rf ${D}${libdir}/gtk-2.0/2.10.0/engines/libadwaita.la
-}
-
-# There could be gnome-theme-highcontrast as well but that requires
-# gtk+3 and includes lots of icons (is also broken with B != S).
-PACKAGES += "gnome-theme-adwaita \
-             gnome-theme-adwaita-dark \
-             "
-
-FILES_gnome-theme-adwaita = "${prefix}/share/themes/Adwaita \
-                              ${libdir}/gtk-2.0/2.10.0/engines/libadwaita.so"
-
-FILES_gnome-theme-adwaita-dark = "${prefix}/share/themes/Adwaita-dark"
-RDEPENDS_gnome-theme-adwaita-dark = "gnome-theme-adwaita"
-
-# gnome-themes-standard is empty and doesn't exist
-RDEPENDS_${PN}-dev = ""
-- 
2.11.0


