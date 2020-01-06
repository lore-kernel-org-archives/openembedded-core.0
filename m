Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 04D307F893
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 08:31:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 6291E21FC5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 03:24:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Mon, 06 Jan 2020 03:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=hlfM4Yo+PBnkGw0Ca5p+XpJcEgjLsse2BUqOVyU7W5s=; b=gt/qfi0x
	jbIj90TEiOY9lPe2vGJw2htPWT2nLFy6OYtQ9mroAsurFW/MO+yzfTrGp08DsmWv
	vCkZ3H6hrdkbQbTo9+lAD9zFbs+YaTtEtRwmfcqV0ogbws4bfrI8Brj+/dnmt6QF
	o/N5iVwa/8iqjG5eFpZd8CdNEECClSauVVzOovjhIwkCg5M08WxAb6b1tt7rPgCY
	4jobjSG54ecIvqipjuRYi8otOmEysxumtoj7PPoBnsqrCpNEKnWJyBac1GcRQbSk
	22BlQSovgnq8NSkU/S764oCT2qNs9kIOa7EnyMGxLdzIOMBPKTlLyW50niqL1JPq
	jD2kPPCnLSSmKg==
X-ME-Sender: <xms:s-4SXlADOHGi0VGsx435LI3maNewH96W5RnpZ974gDCiI8EPYHV-YA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegledguddukecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
	ertdertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
	ihdrfhhiqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppe
	duleeirddvgeegrdduledurdejgeenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhu
	khesihhkihdrfhhinecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:s-4SXlaxgVhfGQg06c8_9GD3I8ogr54DAnQzhWFxHwzpVas5eUTolA>
	<xmx:s-4SXlMClE7mG0lbmCr7ANpFXpqi3R_t-ULzkay630OqHhWmw4JroQ>
	<xmx:s-4SXuTXCCECbbhSwj0wpLgnUzZmPTSNYUh5l17W2ir1SCmrcs0T4w>
	<xmx:s-4SXkBiJz_ULUadmtNc-QcCQwJV9-giZBOlJT5qgpdqD21lDJukyw>
Received: from localhost.localdomain (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id C9E768005A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 03:24:18 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 10:24:06 +0200
Message-Id: <20200106082408.47678-4-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106082408.47678-1-tanuk@iki.fi>
References: <20200106082408.47678-1-tanuk@iki.fi>
MIME-Version: 1.0
Subject: [PATCH 3/5] alsa-topology-conf: new recipe, version 1.2.1
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
X-List-Received-Date: Mon, 06 Jan 2020 08:31:07 -0000
Content-Transfer-Encoding: 8bit

The topology configuration files were moved from the alsa-lib repository
to a new alsa-topology-conf repository. The move was accompanied by
a license change from LGPL2.1 to BSD-3-Clause.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../alsa/alsa-lib_1.2.1.2.bb                  |  1 +
 .../alsa/alsa-topology-conf_1.2.1.bb          | 22 +++++++++++++++++++
 3 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ad9b8776dd..36becec62c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -35,6 +35,7 @@ RECIPE_MAINTAINER_pn-alsa-lib = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-plugins = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-state = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-tools = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-alsa-topology-conf = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-ucm-conf = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-utils = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-utils-scripts = "Tanu Kaskinen <tanuk@iki.fi>"
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
index c6c4ce420b..2b15e21359 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
@@ -34,6 +34,7 @@ FILES_alsa-conf = "${datadir}/alsa/"
 FILES_libatopology = "${libdir}/libatopology.so.*"
 
 RDEPENDS_${PN}_class-target = "alsa-conf alsa-ucm-conf"
+RDEPENDS_libatopology_class-target = "alsa-topology-conf"
 
 # upgrade path
 RPROVIDES_${PN} = "libasound"
diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
new file mode 100644
index 0000000000..add1f309ec
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "ALSA topology configuration files"
+HOMEPAGE = "https://alsa-project.org"
+BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
+
+# The tarball doesn't have any toplevel directory. The subdir option tells
+# Bitbake to unpack the archive to the correct place.
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2;subdir=${BP}"
+SRC_URI[md5sum] = "7fdf5fff3f1e0603456e719f6033e922"
+SRC_URI[sha256sum] = "354a43f4031c98bef1349ac722d83b2603ef439f81a1ab1eba8814c28243a9b2"
+
+inherit allarch
+
+do_install() {
+        install -d ${D}/usr/share/alsa
+        cp -r ${S}/topology ${D}/usr/share/alsa
+}
+
+PACKAGES = "${PN}"
+
+FILES_${PN} = "*"
-- 
2.20.1


