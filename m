Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0E39E7317D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:14 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id tr5so2014368obc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VsYaNaWH2oS3WjzonCcWkwlmyQs934fCmLupLI5VPAk=;
	b=Ap4ZrxHHIIBDLczm9ns0Q9h5RtwfCV6UE5YzasATh9QmO3zrdGSSezHFDJF3HRUaUj
	IT+y1I2qN0z4hGkV1mwmghSpdLLqziYoddAVVJySYKK+vpzgbd/D3pMoSppPTS6WeEvf
	CaKoWpPLCcaCpYsGQzJR4IwJC+7ZnX9xToiK/S8D+2VZ2ebhF5Q9M0S4aE6jD+4rwUad
	YWQCxRQOVMZCSTywmOszRESYF4e5alS6bRWRUnCPq7wnpHcPXwjx0Jiw6Fby21y43W2R
	RN0iVb0IXkRZ0nTTSpOpZzfFi1l+C2wHmR/fC/RturwWScbEdL16ovt9gmWiyoL+vPWX
	5iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VsYaNaWH2oS3WjzonCcWkwlmyQs934fCmLupLI5VPAk=;
	b=K5RV3OH1Ui7Wn9SNU2+2utVlyh2DwKXA9HYSPs8aff7i6bXRtjIMLUFKGn8YTFxP0i
	MAHhsDzk4MjwdPyjtsmy695cGA8ebzoO6cCXU+HufcJzcDnk1rgOrgdZmQpYALwUiKQO
	Dk7jBpiDBN0m7Pd/uSfPZEEJHaLMJAfl94e+qF4xmoMcVR1YXvBPWSGPzKIl4iiHskXf
	7giDmZd8VHMWXx+KsyvHIzLX8hpgfjBRJZuP+8mXcpwFbSMT3+G6TMau3MVW1fFO7bpM
	EHCQLIq/2AIN2zBQMrbhK1zHvD5Q9iXEgGs8IPtS0k9Rvs+FSe4nkq/4JYNnVVtBRIIR
	747Q==
X-Gm-Message-State: ALoCoQmqKK4trwRt0Q4u0kS0wstpmeQTFJKAsvsphJvxOq6KQqPPXpXK8okHBl5tB4lBc7V+c+skXwiOKdx9cpkHL4V8FYT83w==
X-Received: by 10.182.200.201 with SMTP id ju9mr31165916obc.30.1453354634503; 
	Wed, 20 Jan 2016 21:37:14 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:13 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:23 -0800
Message-Id: <1453354610-19218-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 05/32] gstreamer1.0-plugins-base: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:16 -0000

Fix duplicate x11 dependencies (DEPENDS and x11 PACKAGECONFIG).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-base.inc        | 26 +++++++++++-----------
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   |  3 +--
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     |  8 +++----
 3 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 4375a4b..d543bdd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -2,38 +2,38 @@ require gstreamer1.0-plugins.inc
 
 LICENSE = "GPLv2+ & LGPLv2+"
 
-DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxv', '', d)}"
-DEPENDS += "freetype liboil util-linux iso-codes zlib"
+DEPENDS += "freetype iso-codes liboil util-linux zlib"
 
 inherit gettext
 
 PACKAGES_DYNAMIC =+ "^libgst.*"
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
-    orc ivorbis ogg theora vorbis pango gio-unix-2.0 \
-    "
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+    gio-unix-2.0 ivorbis ogg orc pango theora vorbis \
+"
 
-X11DEPENDS = "virtual/libx11 libsm libxrender"
+X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
 X11ENABLEOPTS = "--enable-x --enable-xvideo --enable-xshm"
 X11DISABLEOPTS = "--disable-x --disable-xvideo --disable-xshm"
-PACKAGECONFIG[x11]          = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
+
 PACKAGECONFIG[alsa]         = "--enable-alsa,--disable-alsa,alsa-lib"
+PACKAGECONFIG[cdparanoia]   = "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
+PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
 PACKAGECONFIG[ivorbis]      = "--enable-ivorbis,--disable-ivorbis,tremor"
 PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
-PACKAGECONFIG[theora]       = "--enable-theora,--disable-theora,libtheora"
-PACKAGECONFIG[vorbis]       = "--enable-vorbis,--disable-vorbis,libvorbis"
 PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
-PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
+PACKAGECONFIG[theora]       = "--enable-theora,--disable-theora,libtheora"
 PACKAGECONFIG[visual]       = "--enable-libvisual,--disable-libvisual,libvisual"
-PACKAGECONFIG[cdparanoia]   = "--enable-cdparanoia,--disable-cdparanoia,cdparanoia"
+PACKAGECONFIG[vorbis]       = "--enable-vorbis,--disable-vorbis,libvorbis"
+PACKAGECONFIG[x11]          = "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
 
 EXTRA_OECONF += " \
     --enable-zlib \
     --disable-freetypetest \
 "
 
-FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
-
 CACHED_CONFIGUREVARS_append_x86 = " ac_cv_header_emmintrin_h=no ac_cv_header_xmmintrin_h=no"
+
+FILES_${MLPREFIX}libgsttag-1.0 += "${datadir}/gst-plugins-base/1.0/license-translations.dict"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
index 473dbcd..d5687a8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
@@ -1,9 +1,8 @@
 include gstreamer1.0-plugins-base.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                   "
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
 SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index fbe3a42..f021f98 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -3,17 +3,15 @@ DEFAULT_PREFERENCE = "-1"
 include gstreamer1.0-plugins-base.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
-                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
-                   "
-
-S = "${WORKDIR}/git"
+                    file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
 SRCREV = "8d4cb64a4b9d84b10076bf350f80a0d6ea68ec2d"
 
+S = "${WORKDIR}/git"
+
 do_configure_prepend() {
 	cd ${S}
 	./autogen.sh --noconfigure
 	cd ${B}
 }
-
-- 
1.9.1


