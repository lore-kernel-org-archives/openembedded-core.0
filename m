Return-Path: <tanuk@iki.fi>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id B45FC7CBA3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 20:13:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 0838616FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:13:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Thu, 21 Feb 2019 15:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=MCNZUevWk+mCj7kH1bNv8JZ7UAa7E/7Wp192aBCPP0Y=; b=KdcG3I5F
	tX0jWB7tQNNlXLLrm9jWN1NO08OjmIZz4SNLJgbuOf0hA16THcQySsSDD3NTJG7p
	V7SRSTmrongfUtlfmQTKdDtBFXBFEMVOwTqCA4hWJ5c4xXe8HlTbWPOPf3zTrS+s
	sqQTabYpFh+TGvLtZAa+tNmcKXoFHF5XAIxnOWGx+NdB4MkV+MeS3ri/ccDwXhHU
	gt1escpncoiJWhUJ7YYoYEGiSxy//01S3aMpCw0GqHGU3rYS1gYZNAS4NBKjBEAC
	ATtpKjO7T6VSZEzA7iau2ulWgf3Lhj7q68CbkvzB17uAxYhKV6GdeGNRjVFpMf5m
	oy4b93ZtZcJPFQ==
X-ME-Sender: <xms:XgZvXDH2CjpKUJSj7txnC7HqoxXbRvW0VPyPJ1K2lSubWYgRdDmf3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdekgddufeejucdltddurdegtdelrddttd
	dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhht
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
	ertdertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
	ihdrfhhiqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppe
	ekkedruddufedrvdduuddrjedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhk
	sehikhhirdhfihenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:XgZvXGV4mtuN0_quVo0Bp8yv_wPF_Hl0v1h00Ybj_oUY1zPuAFSRHg>
	<xmx:XgZvXCz3VBByjlibybEc8_AMywcXkQGLUAVVg2T8BnyGOX-iRpnOiw>
	<xmx:XgZvXMMOqXZj9nJSIVKm4wjuirAEWbQq3NHxJzzmuHTHtKcEfnnV-w>
	<xmx:XgZvXBlQqVS8uy2UxthimIIF-3czn_Ji6CRX5RLc9sYu9LRVjJGyPQ>
Received: from localhost.localdomain (88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id E295DE4549
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:13:17 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 22:13:05 +0200
Message-Id: <52ec539cbf4ec7511f1259fef31e0c13244b0836.1550779769.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1550779769.git.tanuk@iki.fi>
References: <cover.1550779769.git.tanuk@iki.fi>
MIME-Version: 1.0
Subject: [PATCH v2 3/3] alsa-utils: 1.1.6 -> 1.1.8
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
X-List-Received-Date: Thu, 21 Feb 2019 20:13:17 -0000
Content-Transfer-Encoding: 8bit

Changelogs:
http://alsa-project.org/main/index.php/Changes_v1.1.6_v1.1.7
http://alsa-project.org/main/index.php/Changes_v1.1.7_v1.1.8

There's a new program, axfer, which is a reimplementation of aplay (and
arecord). The purpose of the rewrite is to have code that is easier to
maintain. For now both implementations exist, and I decided to put both
in the aplay package.

The new 89-alsa-ucm.rules udev file initializes the mixer settings for
certain hardware. It's needed for making the hardware usable at boot, in
case there's no higher level software (such as PulseAudio) managing the
mixer settings. Shipping hardware specific configuration in alsa-utils
seems wrong, but I don't know what else to do. I added it to the alsaucm
package, because it's kind of tied to the alsaucm utility (the udev
rules execute the alsaucm program, and the build system installs the
rules file only when alsaucm is enabled). Ideally the UCM configuration
in alsa-lib would define the default UCM verb for each hardware, then
the udev rules file could just enable the default verb, and there would
be no hardware specific configuration in alsa-utils. But that requires
upstream development effort.

SRC_URI was changed to a more reliable source (at least currently the
ftp server is flaky).

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...cripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
 .../{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb}   | 14 ++++++--------
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} (90%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.8.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.6.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.8.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
similarity index 90%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.6.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
index b8ba0cb22a..1e21022e95 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
@@ -19,11 +19,9 @@ PACKAGECONFIG[bat] = "--enable-bat,--disable-bat,fftwf"
 PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d,--with-udev-rules-dir=/unwanted/rules.d,udev"
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
-          "
-
-SRC_URI[md5sum] = "50ae75567459646b843bed78d916b002"
-SRC_URI[sha256sum] = "155caecc40b2220f686f34ba3655a53e3bdbc0586adb1056733949feaaf7d36e"
+SRC_URI = "https://www.alsa-project.org/files/pub/utils/${BP}.tar.bz2"
+SRC_URI[md5sum] = "54d6f9b483144823d0fc0c26e8cea028"
+SRC_URI[sha256sum] = "fd9bf528922b3829a91913b89a1858c58a0b24271a7b5f529923aa9ea12fa4cf"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
@@ -59,7 +57,7 @@ RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
 FILES_${PN} = ""
 FILES_alsa-utils-alsabat     = "${bindir}/alsabat"
 FILES_alsa-utils-alsatplg    = "${bindir}/alsatplg"
-FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord"
+FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
 FILES_alsa-utils-amixer      = "${bindir}/amixer"
 FILES_alsa-utils-alsamixer   = "${bindir}/alsamixer"
 FILES_alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
@@ -67,10 +65,10 @@ FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bind
 FILES_alsa-utils-aconnect    = "${bindir}/aconnect"
 FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
 FILES_alsa-utils-iecset      = "${bindir}/iecset"
-FILES_alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d */*/udev/rules.d ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
+FILES_alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d/90-alsa-restore.rules */*/udev/rules.d/90-alsa-restore.rules ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
 FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
 FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
-FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm"
+FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm */udev/rules.d/89-alsa-ucm.rules */*/udev/rules.d/89-alsa-ucm.rules"
 
 SUMMARY_alsa-utils-alsabat      = "Command-line sound tester for ALSA sound card driver"
 SUMMARY_alsa-utils-alsatplg     = "Converts topology text files into binary format for kernel"
-- 
2.20.1


