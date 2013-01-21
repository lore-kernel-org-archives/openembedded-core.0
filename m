Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxJaP-0006b3-F0
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 16:47:04 +0100
Received: from mail-wg0-f72.google.com ([74.125.82.72])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 07:31:30 -0800
Received: by mail-wg0-f72.google.com with SMTP id fg15so6640320wgb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 07:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=fXBIgeiLcgH38PtkDJoAqrrpn5IYSB4mOP3OUt9I86U=;
	b=TgKtvWHYiIib7fsSBfSL3+vvfaopHBw1vO99l/mGnvECOoEFj46jeU+dQ8QD6po3+g
	RK/sT81Pa9z6ZVWSFAXNh0l+GRfhkY9/EIKAwpiU/ob/nzdhMStCED5Tw379nbno8fNx
	oS/+Bdo5F4n7t991ngsnyvRmHq0ZMH3dqBp35mP1aveKzj1W6Awu0P26aUGy7E938TQZ
	uV8Z2tFlRZtO8zU//KjIVAfgHcXUE6raCoukjx7hZEmxl50+ZgMrAwbEhTUBtnCxwikY
	FwwGzAnfpMY91kHOujliRLUuaqD/TrnB1VC3jv2YdrIZHZEsgPzP93KzkNSezQSEDlQM
	dg0Q==
X-Received: by 10.180.92.36 with SMTP id cj4mr16100478wib.23.1358782289405;
	Mon, 21 Jan 2013 07:31:29 -0800 (PST)
X-Received: by 10.180.92.36 with SMTP id cj4mr16100453wib.23.1358782289193;
	Mon, 21 Jan 2013 07:31:29 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hg17sm17327964wib.1.2013.01.21.07.31.27
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 07:31:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 15:29:30 +0000
Message-Id: <3f5517fd31e3342dcbd4743b88bc115cebb98492.1358782098.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358782098.git.ross.burton@intel.com>
References: <cover.1358782098.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlHtZQBwGmwR70SwfbkBAG6dR5fyeDlUpjdnMXaVilZxhXqj2dvoZDeZoL5GfeTNkvos5T1cjoOka4jcNWr5DqfjG3itRn094dNP+mfqUp+2QdM95wNYByfUCnd7Qn7Ziw08ppU+SnezB5BNqiMFPoXksdqepQzdKZeWp2hViMdk7XegJMc9Z4uQScUn592CZA75hYC
Subject: [PATCH 1/2] gupnp: remove, migrated to meta-multimedia
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 15:47:06 -0000

The GUPnP stack was stagnating in oe-core and untested.  It's now moved to
meta-multimedia where it's also been upgraded.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb    |   23 ----------------
 meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb  |   15 -----------
 .../gupnp/gupnp-tools_0.8.1.bb                     |   14 ----------
 meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb    |   28 --------------------
 4 files changed, 80 deletions(-)
 delete mode 100644 meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
 delete mode 100644 meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
 delete mode 100644 meta/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
 delete mode 100644 meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb

diff --git a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
deleted file mode 100644
index 9dc05e5..0000000
--- a/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Resource discovery and announcement over SSDP"
-DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-DEPENDS = "glib-2.0 libsoup-2.4 gobject-introspection-stub"
-
-PR = "r3"
-
-SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "aec6a56ac1d4f8a4837da83f2d152556"
-SRC_URI[sha256sum] = "94de92bb4f7906ed2f047b0146a3b21d53d09908fe1f0149484f61c6afc598ea" 
-
-inherit autotools pkgconfig
-
-PACKAGES =+ "gssdp-tools"
-
-FILES_gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
-
-EXTRA_OECONF = "--disable-introspection"
-
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)}"
-PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk,gtk+"
diff --git a/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb b/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
deleted file mode 100644
index 598aa4d..0000000
--- a/meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Helpers for AV applications using UPnP"
-DESCRIPTION = "GUPnP-AV is a collection of helpers for building AV (audio/video) applications using GUPnP."
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp-av/gupnp-av.h;beginline=1;endline=22;md5=d344132a8766641fcb11213ff5982086"
-DEPENDS = "gupnp"
-
-SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
-
-PR = "r2"
-
-inherit autotools pkgconfig
-
-SRC_URI[md5sum] = "8a41a3bb60b50fceb5ece71c0dc4dcfb"
-SRC_URI[sha256sum] = "e6aa032377488cedc4e347519bd30701c583780b7c54f00bab083f2316a93dc9"
diff --git a/meta/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb b/meta/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
deleted file mode 100644
index 2ee7462..0000000
--- a/meta/recipes-connectivity/gupnp/gupnp-tools_0.8.1.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Tools for GUPnP"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://src/network-light/main.c;beginline=1;endline=21;md5=033bf37c030780c5a72165846b3003f6"
-DEPENDS = "gupnp gupnp-av gtk+ libglade gnome-icon-theme"
-
-SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
-
-PR = "r0"
-
-inherit autotools pkgconfig
-
-SRC_URI[md5sum] = "d8a44a8c19b1cc10b8e5508448d8493f"
-SRC_URI[sha256sum] = "3b46a76fcbb0188b8d2c406e514edc7662d65f48774c81e5a19f93d7706db302"
diff --git a/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb b/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
deleted file mode 100644
index c226c9e..0000000
--- a/meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "UPnP framework"
-DESCRIPTION = "GUPnP is an elegant, object-oriented open source framework for creating UPnP  devices and control points, written in C using GObject and libsoup. The GUPnP API is intended to be easy to use, efficient and flexible. It provides the same set of features as libupnp, but shields the developer from most of UPnP's internals."
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=28c49b17d623afc3335efc2e511879e1"
-DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme gobject-introspection-stub"
-
-SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "021bb237741532af4bca50157ff326e4"
-SRC_URI[sha256sum] = "f01a1f4fd36ce161a3df29fa83e1a0a2fb40d3c9f30f6b403e7791688ad24cfe"
-
-PR = "r2"
-
-EXTRA_OECONF = "--disable-introspection"
-
-inherit autotools pkgconfig
-
-FILES_${PN} = "${libdir}/*.so.*"
-FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
-
-SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
-
-gupnp_sysroot_preprocess () {
-	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	install -m 755 ${D}${bindir}/gupnp-binding-tool ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-}
-
-- 
1.7.10.4



