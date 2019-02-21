Return-Path: <tanuk@iki.fi>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id D18107CB4D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 13:34:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 5D5AF3307
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 08:26:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Thu, 21 Feb 2019 08:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=NYX9HLtyG9FFqMy27RMTeagZYYyru7dmHTd+xFrIIME=; b=Pgj1hqD4
	zJJFa3igaNwjcY/H46X59ZRGvZfTQJ4gLGBdhkDNkD9mpNGEL4IRW/BBu6fL58rt
	Svq5BCDJdL/uAtKLFgdxzc/L9w1LQnMsJwwvItgHj/zRrwEsbuIPsS2zPSys1LB6
	CbNUy91jdXkScEU6yiMQ3agmeV/HH75XAx2Vx1cHsWx/laMUrcHSEj4xC/TVDlec
	e/+cGxXm8dPBRGpZ1JCpx9bcKB1PSo5+0/UYx2xLUmbMofJF+ARB/nCDq2Yx7DBc
	+lbYTHXW0APIPElHz4U8JSUExuE0hUMjOHZwhOmnYE+2WzlkuZNnIH+VHd/se7/w
	5fVtyD/CJ8N74g==
X-ME-Sender: <xms:BqduXBb-Q9y4XaKmgtgqprkqWPz1OmmVeSfgNyEcwOzZB9wiCf7QNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdekgdehfeculddtuddrgedtledrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
	dtredttdenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhi
	rdhfiheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepke
	ekrdduudefrddvuddurdejvdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhes
	ihhkihdrfhhinecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:BqduXHJYZoOvvTZZQ_0FUCmOenu0KeEEdwYjLIUd6yh__mDnvdOO4g>
	<xmx:BqduXIgLoqF7ZRETad_E8odfyQjIq2al5yFAwib2Xet1AAHOCoOPzg>
	<xmx:BqduXLsNnc4dqMqTxz0qwUFLQqsvpErk9SKA11ACzMA9lnqxevnO_w>
	<xmx:BqduXEjxxdMyYHD6OZsWIwpGk4Oczx13t2aGPiEZqqQmq-BfykJaAA>
Received: from localhost.localdomain (88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4F81DE4559
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 08:26:30 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 15:26:21 +0200
Message-Id: <1d298dc7e078474b5fb703359942420430bb4c4d.1550755110.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1550755109.git.tanuk@iki.fi>
References: <cover.1550755109.git.tanuk@iki.fi>
MIME-Version: 1.0
Subject: [PATCH 3/3] alsa-utils: 1.1.6 -> 1.1.8
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
X-List-Received-Date: Thu, 21 Feb 2019 13:34:24 -0000
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

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...ls-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
 .../alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb}  | 10 +++++-----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} (92%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.8.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.6.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.8.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
similarity index 92%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.6.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
index b8ba0cb22a..ab02169ac6 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.8.bb
@@ -22,8 +22,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
           "
 
-SRC_URI[md5sum] = "50ae75567459646b843bed78d916b002"
-SRC_URI[sha256sum] = "155caecc40b2220f686f34ba3655a53e3bdbc0586adb1056733949feaaf7d36e"
+SRC_URI[md5sum] = "54d6f9b483144823d0fc0c26e8cea028"
+SRC_URI[sha256sum] = "fd9bf528922b3829a91913b89a1858c58a0b24271a7b5f529923aa9ea12fa4cf"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
@@ -59,7 +59,7 @@ RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
 FILES_${PN} = ""
 FILES_alsa-utils-alsabat     = "${bindir}/alsabat"
 FILES_alsa-utils-alsatplg    = "${bindir}/alsatplg"
-FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord"
+FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
 FILES_alsa-utils-amixer      = "${bindir}/amixer"
 FILES_alsa-utils-alsamixer   = "${bindir}/alsamixer"
 FILES_alsa-utils-speakertest = "${bindir}/speaker-test ${datadir}/sounds/alsa/ ${datadir}/alsa/speaker-test/"
@@ -67,10 +67,10 @@ FILES_alsa-utils-midi        = "${bindir}/aplaymidi ${bindir}/arecordmidi ${bind
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


