Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id AE95371B0A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:15:13 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878764"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:15:14 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:19 +0300
Message-Id: <5d79c3ec1d571851df0ffea7e3e5cef9711a0832.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 16/26] pulseaudio: enable optional building of manpages
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
X-List-Received-Date: Fri, 28 Oct 2016 15:15:13 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 7e54ad4..f5c5ed2 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -13,7 +13,7 @@ DEPENDS = "libatomic-ops libsndfile1 libtool intltool-native"
 DEPENDS += "udev alsa-lib glib-2.0 gconf"
 DEPENDS += "json-c gdbm speexdsp libxml-parser-perl-native libcap"
 
-inherit autotools bash-completion pkgconfig useradd gettext perlnative bluetooth systemd
+inherit autotools bash-completion pkgconfig useradd gettext perlnative bluetooth systemd manpages
 
 # *.desktop rules wont be generated during configure and build will fail
 # if using --disable-nls
@@ -62,6 +62,7 @@ PACKAGECONFIG[autospawn-for-root] = ",,,"
 PACKAGECONFIG[lirc] = "--enable-lirc,--disable-lirc,lirc"
 PACKAGECONFIG[webrtc] = "--enable-webrtc-aec,--disable-webrtc-aec,webrtc-audio-processing"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, "
 
 EXTRA_OECONF_append_arm = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
 EXTRA_OECONF_append_armeb = "${@bb.utils.contains("TUNE_FEATURES", "neon", "", " --enable-neon-opt=no", d)}"
-- 
2.9.3


