Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id 7442C7F8AE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:18:15 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C348821F83
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 04:18:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Mon, 06 Jan 2020 04:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=UCm2mlijfviV7Z6kFqFEsuVVKLm7EGi4/0aGlP11nQM=; b=dAKON1rb
	GsvSgis82oKtR1TBYiiCpeaRrbeVKnNrWbKUMCqyzmQ5heYs0Gz1UpUdUcBASX2T
	TnKG3wx6T2wc9gUHOd6gqi1XEprgT/A9hpfMgOHZvIqIwtKZM/niqqteVrbtTPTf
	k77MvBtEU+zF5efmWhS2w2kGrjxILO++AaUN+80LlYsXsxGb9vrhOv1+/AzwtnTm
	aQxZdc9rfj7eLBF/Qlbr9nfJIQGtl2ATMMcVOBVkAlFn7vcLbEtSvtHhNenzPwEo
	v+UzY3e8uhrmAZHDkYh2eKLdMX1RafUlnYvXhjq+zqqCm62MF2DqJDSiVaKabkKt
	U4mv4uPazEAo1g==
X-ME-Sender: <xms:WPsSXp-Q027X0MsfdvzWdU_2n4h2exe22t9OMGztthj1qaD0Si0oTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgtdefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
	dtredttdenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhi
	rdhfiheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepud
	eliedrvdeggedrudeluddrjeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhk
	sehikhhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:WPsSXl5-CTut4Aowl2ENwX9eItbjX63MizhzXb57-NO44guIMh7GwQ>
	<xmx:WPsSXikEtjZGEXSsjbQDIAaNOsVGRBv7Ii_P1n5HEcZtrxQpj_LHtQ>
	<xmx:WPsSXoEhgZkAg34LXxSv4KZstzkN7zXfYmZM-cgtxxsisNqpMFc2RQ>
	<xmx:WPsSXkC3N1_sOjfY4jvO0tCGaNS-kZ2nxBQi49K5UbDoK2ipkB0Viw>
Received: from localhost.localdomain (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2DE4230602DB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 04:18:16 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 11:18:04 +0200
Message-Id: <20200106091806.49129-4-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106091806.49129-1-tanuk@iki.fi>
References: <20200106091806.49129-1-tanuk@iki.fi>
MIME-Version: 1.0
Subject: [PATCH v2 3/5] alsa-topology-conf: new recipe, version 1.2.1
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
X-List-Received-Date: Mon, 06 Jan 2020 09:18:15 -0000
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
index c9fb373f52..3c07804ce0 100644
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
index 7bc78b8523..e2bc61fbe9 100644
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


