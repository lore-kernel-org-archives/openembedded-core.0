Return-Path: <tanuk@iki.fi>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id B8FF57CBA6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 20:13:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id E650116FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:13:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Thu, 21 Feb 2019 15:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=HWmdFxHfh03Gmx4o8gJcyugvmJhGViHF9YmH//BH6Is=; b=2lW+WYoW
	6pcifPUWHs3jUXVKAvfCD5kOZx0rM1Qnb1qvz2EKld0aBzvbcfOPVuiJQRMhalnN
	YDW1MTA8a/1UzDvbbbf6E0VvOTjPY1lxqRchJ5NCKKvVeCMdUDCtOW7ljX91qQRT
	1uS/7nVfuNlIDNaZhBkCeNKp+pi99P+5gawJDjDOEqfgdDDMQVOqXHn7n9SteUr7
	nWfnfTuJ6bd1sa04cHQzppLuC1toERNnii7P5Ceu8LayhVUzhMjXqAJdOyGmT6tF
	lzDHtRGpX2bs+X1J2WTMmrUZNBRrIBKxLUnjOJ8a3dGOSAzo9I/5xk/GyDS6flpG
	0UvAp0qGw5QVjg==
X-ME-Sender: <xms:XQZvXETbwaq_C8uA6E_wrbHKyoS7d-cYK_zuGGDI0zpnT47duPfcvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdekgddufeejucdltddurdegtdelrddttd
	dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhht
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
	ertdertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
	ihdrfhhiqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppe
	ekkedruddufedrvdduuddrjedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhk
	sehikhhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:XQZvXGBpXpvrQbzbmRpeDjn2bNse4xV56ArDHQRc_4_JXCiWmEC3kQ>
	<xmx:XQZvXM0KCiB6I0pjKH8dulfiKpl644IKYpfzzHUVeUKkz3oRZ7aGLg>
	<xmx:XQZvXMXQ9XMLz3BfipgatCVb1NhhIM2tMqCG6ZJ_TnDjHiWeHsge9Q>
	<xmx:XQZvXGfp1gZq7yP7AHXotZ22wYjhomSSIBqo7-09PYLdlCiyTtnKXg>
Received: from localhost.localdomain (88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 95679E4443
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:13:16 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 22:13:04 +0200
Message-Id: <106c5467f93806485716f5a964d60929fcf777f1.1550779769.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1550779769.git.tanuk@iki.fi>
References: <cover.1550779769.git.tanuk@iki.fi>
MIME-Version: 1.0
Subject: [PATCH v2 2/3] alsa-plugins: 1.1.6 -> 1.1.8
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
X-List-Received-Date: Thu, 21 Feb 2019 20:13:16 -0000
Content-Transfer-Encoding: 8bit

Changelogs:
http://alsa-project.org/main/index.php/Changes_v1.1.6_v1.1.7
http://alsa-project.org/main/index.php/Changes_v1.1.7_v1.1.8

The --enable-avcodec configure option was renamed to --enable-libav, and
I renamed the respective packageconfig item too.

There's a new pcm plugin: aaf (AVTP Audio Format). I added a
packageconfig item for it, but I didn't test it, because libavtp doesn't
seem to be currently packaged for OpenEmbedded.

There are now configuration files for most of the plugins. I removed the
symlink creation for 50-pulseaudio.conf, because upstream now creates
the symlinks for us. 99-pulseaudio-default.conf is an exception, because
upstream ships it only as an example, and upstream doesn't install a
symlink for it (upstream actually installs it directly under /etc, but I
moved it back to /usr/share), so for that file we still have to create
the symlink ourselves.

The lavcrate plugin was converted to use libavresample (and renamed to
lavrate). Libavresample is provided by ffmpeg, but ffmpeg was by default
built with libavresample disabled. This patch now enables libavresample
by default in the ffmpeg recipe in order to not cause a regression in
alsa-plugins.

SRC_URI was changed to a more reliable source (at least currently the
ftp server is flaky).

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 89 +++++++++++++++----
 .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-
 2 files changed, 75 insertions(+), 16 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} (53%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.8.bb
similarity index 53%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.1.8.bb
index ee06191ea9..2d9cc06f58 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.8.bb
@@ -20,9 +20,9 @@ LIC_FILES_CHKSUM = "\
         file://rate/rate_samplerate.c;endline=35;md5=fd77bce85f4a338c0e8ab18430b69fae \
 "
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/plugins/${BP}.tar.bz2"
-SRC_URI[md5sum] = "8387279e99feeb2ecffaac5f293223d7"
-SRC_URI[sha256sum] = "6f1d31ebe3b1fa1cc8dade60b7bed1cb2583ac998167002d350dc0a5e3e40c13"
+SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
+SRC_URI[md5sum] = "d0f87211d1560f2c07c8eae4297bc4f6"
+SRC_URI[sha256sum] = "7f77df171685ccec918268477623a39db4d9f32d5dc5e76874ef2467a2405994"
 
 DEPENDS += "alsa-lib"
 
@@ -33,8 +33,9 @@ PACKAGECONFIG ??= "\
         speexdsp \
         ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
 "
-PACKAGECONFIG[avcodec] = "--enable-avcodec,--disable-avcodec,libav"
+PACKAGECONFIG[aaf] = "--enable-aaf,--disable-aaf,avtp"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
+PACKAGECONFIG[libav] = "--enable-libav,--disable-libav,libav"
 PACKAGECONFIG[maemo-plugin] = "--enable-maemo-plugin,--disable-maemo-plugin"
 PACKAGECONFIG[maemo-resource-manager] = "--enable-maemo-resource-manager,--disable-maemo-resource-manager,dbus"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
@@ -54,15 +55,11 @@ do_install_append() {
 	rm ${D}${libdir}/alsa-lib/*.la
 
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}" = "yes" ]; then
-		# We use the example as is, so just drop the .example suffix.
-		mv ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf
-
-		# The conf.d files are installed in datadir, but alsa-lib
-		# searches for conf.d files only in sysconfdir. Distributions
-		# are expected to create symlinks in sysconfdir, so that's what
-		# we do here.
-		mkdir -p ${D}${sysconfdir}/alsa/conf.d
-		ln -s ${datadir}/alsa/alsa.conf.d/50-pulseaudio.conf ${D}${sysconfdir}/alsa/conf.d/50-pulseaudio.conf
+		# We use the example as is. Upstream installs the file under
+		# /etc, but we move it under /usr/share and add a symlink under
+		# /etc to be consistent with other installed configuration
+		# files.
+		mv ${D}${sysconfdir}/alsa/conf.d/99-pulseaudio-default.conf.example ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf
 		ln -s ${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf ${D}${sysconfdir}/alsa/conf.d/99-pulseaudio-default.conf
 	fi
 }
@@ -73,6 +70,68 @@ python populate_packages_prepend() {
     d.setVar("RDEPENDS_alsa-plugins", packages)
 }
 
+# Many plugins have a configuration file (plus a symlink in /etc) associated
+# with them. We put the plugin and it's configuration usually in the same
+# package, but that's problematic when the configuration file is related to
+# multiple plugins, as is the case with the pulse, oss and maemo plugins. In
+# case of the pulse plugins, we have a separate alsa-plugins-pulseaudio-conf
+# package that depends on all the pulse plugins, which ensures that all plugins
+# that the configuration references are installed. The oss and maemo
+# configuration files, on the other hand, are in the respective pcm plugin
+# packages. Therefore it's possible to install the configuration file without
+# the ctl plugin that the configuration file references. This is unlikely to
+# cause big problems, but some kind of improvement to the packaging could
+# probably be done here (at least it would be good to handle the different
+# plugins in a consistent way).
+FILES_${MLPREFIX}libasound-module-ctl-arcam-av += "\
+        ${datadir}/alsa/alsa.conf.d/50-arcam-av-ctl.conf \
+        ${sysconfdir}/alsa/conf.d/50-arcam-av-ctl.conf \
+"
+FILES_${MLPREFIX}libasound-module-pcm-a52 += "\
+        ${datadir}/alsa/alsa.conf.d/60-a52-encoder.conf \
+        ${sysconfdir}/alsa/conf.d/60-a52-encoder.conf \
+"
+FILES_${MLPREFIX}libasound-module-pcm-alsa-dsp += "\
+        ${datadir}/alsa/alsa.conf.d/98-maemo.conf \
+        ${sysconfdir}/alsa/conf.d/98-maemo.conf \
+"
+FILES_${MLPREFIX}libasound-module-pcm-jack += "\
+        ${datadir}/alsa/alsa.conf.d/50-jack.conf \
+        ${sysconfdir}/alsa/conf.d/50-jack.conf \
+"
+FILES_${MLPREFIX}libasound-module-pcm-oss += "\
+        ${datadir}/alsa/alsa.conf.d/50-oss.conf \
+        ${sysconfdir}/alsa/conf.d/50-oss.conf \
+"
+FILES_${MLPREFIX}libasound-module-pcm-speex += "\
+        ${datadir}/alsa/alsa.conf.d/60-speex.conf \
+        ${sysconfdir}/alsa/conf.d/60-speex.conf \
+"
+FILES_${MLPREFIX}libasound-module-pcm-upmix += "\
+        ${datadir}/alsa/alsa.conf.d/60-upmix.conf \
+        ${sysconfdir}/alsa/conf.d/60-upmix.conf \
+"
+FILES_${MLPREFIX}libasound-module-pcm-usb-stream += "\
+        ${datadir}/alsa/alsa.conf.d/98-usb-stream.conf \
+        ${sysconfdir}/alsa/conf.d/98-usb-stream.conf \
+"
+FILES_${MLPREFIX}libasound-module-pcm-vdownmix += "\
+        ${datadir}/alsa/alsa.conf.d/60-vdownmix.conf \
+        ${sysconfdir}/alsa/conf.d/60-vdownmix.conf \
+"
+FILES_${MLPREFIX}libasound-module-rate-lavrate += "\
+        ${datadir}/alsa/alsa.conf.d/10-rate-lav.conf \
+        ${sysconfdir}/alsa/conf.d/10-rate-lav.conf \
+"
+FILES_${MLPREFIX}libasound-module-rate-samplerate += "\
+        ${datadir}/alsa/alsa.conf.d/10-samplerate.conf \
+        ${sysconfdir}/alsa/conf.d/10-samplerate.conf \
+"
+FILES_${MLPREFIX}libasound-module-rate-speexrate += "\
+        ${datadir}/alsa/alsa.conf.d/10-speexrate.conf \
+        ${sysconfdir}/alsa/conf.d/10-speexrate.conf \
+"
+
 # The rate plugins create some symlinks. For example, the samplerate plugin
 # creates these links to the main plugin file:
 #
@@ -89,10 +148,10 @@ python populate_packages_prepend() {
 # The symlinks cause QA errors, because usually it's a bug if a non
 # -dev/-dbg/-nativesdk package contains links to .so files, but in this case
 # the errors are false positives, so we disable the QA checks.
-FILES_${MLPREFIX}libasound-module-rate-lavcrate += "${libdir}/alsa-lib/*rate_lavcrate_*.so"
+FILES_${MLPREFIX}libasound-module-rate-lavrate += "${libdir}/alsa-lib/*rate_lavrate_*.so"
 FILES_${MLPREFIX}libasound-module-rate-samplerate += "${libdir}/alsa-lib/*rate_samplerate_*.so"
 FILES_${MLPREFIX}libasound-module-rate-speexrate += "${libdir}/alsa-lib/*rate_speexrate_*.so"
-INSANE_SKIP_${MLPREFIX}libasound-module-rate-lavcrate = "dev-so"
+INSANE_SKIP_${MLPREFIX}libasound-module-rate-lavrate = "dev-so"
 INSANE_SKIP_${MLPREFIX}libasound-module-rate-samplerate = "dev-so"
 INSANE_SKIP_${MLPREFIX}libasound-module-rate-speexrate = "dev-so"
 
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb
index 0506e11c4b..749b3d0dd8 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb
@@ -42,7 +42,7 @@ DEPENDS = "alsa-lib zlib libogg nasm-native"
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc \
+PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale postproc avresample \
                    bzlib gpl lzma theora x264 \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv', '', d)}"
 
-- 
2.20.1


