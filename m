Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQcES-00041M-49
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 13:01:12 +0200
Received: from mail-lb0-f197.google.com ([209.85.217.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 23 Oct 2012 03:47:44 -0700
Received: by mail-lb0-f197.google.com with SMTP id b5so362972lbd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 03:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=OTYJZsRD16emQCR/5AOsi1bpla2zTLeCzukYrcCUe1g=;
	b=YtxhdVivnQRhkyigYAHyZZU9gERFRbH7g90ZganxUns/blKaoqxZqecNLze6X4Hqkb
	6/o6SH+059ISACxgNIAbaSG7eCU/lTpPr2iXvQ3yIBRERfjNxsNjrTs92sJQL1XVOZTb
	byN3wtzBzcszrOgTh+lky8jGgtscl0Ft7kV64FI0IqNcUhrtGNc3XMGxlJ/90IrrMVWX
	RIQZihQ1n9RQFfyP7FFEt3zle/79kTaafO1F03GCS0PqABR4T2PUdcBNk1rDdzniZ2ae
	EUTjIU5XRlFzFuIq72grndZgMmNaKAjSKga8MdcLQlv1MoI1kgoeJIAUxNdp8TF+RCK9
	SnfQ==
Received: by 10.216.140.131 with SMTP id e3mr6627682wej.134.1350989261668;
	Tue, 23 Oct 2012 03:47:41 -0700 (PDT)
Received: by 10.216.140.131 with SMTP id e3mr6627677wej.134.1350989261486;
	Tue, 23 Oct 2012 03:47:41 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dt9sm55666224wib.1.2012.10.23.03.47.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 03:47:40 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Oct 2012 11:46:20 +0100
Message-Id: <1350989180-27329-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <CAJTo0LZNTJdx4hZoXPAN=72Myqmat13EpcrPrH_CM=aRpuho0A@mail.gmail.com>
References: <CAJTo0LZNTJdx4hZoXPAN=72Myqmat13EpcrPrH_CM=aRpuho0A@mail.gmail.com>
X-Gm-Message-State: ALoCoQnfLNNgRf8fsds57vvzqFMlheY77Nk2oHnkpiW+/WwMUef4Id8P7fYUfMZSnvKpRze8YpSoMvuijGDbwRD5tbP89JgCH6Fc/Xu6jRIstYxjPQQFa8oNs1c1zl89yDnJehL4TVPIllTTeylBX4D6Y/Jt7GB4ElQT/VYAoFV+pLAQJFcFcSaH93GfYwJd2nikUGaPdwcs
Cc: Damien Lespiau <damien.lespiau@intel.com>
Subject: [PATCH] libxkbcommon: New window system-independent xkb library
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
X-List-Received-Date: Tue, 23 Oct 2012 11:01:12 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

Needed for weston and wayland clients to compile key maps.

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb |   26 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
new file mode 100644
index 0000000..00172bf
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Generic XKB keymap library"
+
+DESCRIPTION = "libxkbcommon is a keymap compiler and support library which \
+processes a reduced subset of keymaps as defined by the XKB specification."
+
+LICENSE = "MIT & MIT-style"
+
+require xorg-lib-common.inc
+
+DEPENDS = "flex-native bison-native"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=9c0b824e72a22f9d2c40b9c93b1f0ddc"
+
+SRCREV = "1c880887666f84e08ea1752bb8a5ab2a7bf1d8a0"
+PV = "0.1.0+git${SRCPV}"
+PR = "r0"
+
+SRC_URI = "git://anongit.freedesktop.org/xorg/lib/libxkbcommon;protocol=git"
+S = "${WORKDIR}/git"
+
+# makekeys needs to be compiled natively, so tell it what compiler to
+# use.
+export CC_FOR_BUILD = "${BUILD_CC}"
+export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
+export CPPFLAGS_FOR_BUILD = "${BUILD_CPPFLAGS}"
+export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index c911925..f3c08ab 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -17,7 +17,7 @@ EXTRA_OECONF = "--enable-malloc0returnsnull \
                 --disable-specs --with-groff=no --with-ps2pdf=no --with-fop=no --without-xmlto"
 
 python () {
-        whitelist = [ "pixman", "libpciaccess" ]
+        whitelist = [ "pixman", "libpciaccess", "libxkbcommon" ]
         if not d.getVar('BPN', True) in whitelist and not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
                 raise bb.parse.SkipPackage("'x11' not in DISTRO_FEATURES")
 }
-- 
1.7.10



