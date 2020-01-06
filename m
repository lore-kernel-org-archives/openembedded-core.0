Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id D39DE7F8A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:18:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2E23221C1C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 04:18:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Mon, 06 Jan 2020 04:18:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=q3DSwaf8Ke7pJ/I9fX82AP8/An2KwdCyt+SdSbcw2oQ=; b=ZsQV27aK
	PgzDpuqfzhasG9KUXtPzhw1IYRQnhb4nZi3CEoHNnVDyh+VebU1CZZo+iPb3Y4Hj
	xTU72OK2opWrSmBMLvDIGgdgkPpbpk2m6HAHO6VBKIWy12EATWha6Xc+X66/GY/b
	ORxS1rTwxo7HsgJCYOR+ntAxrkINWzvfUbiKrjJXhvAofkSe/RsJnspizpGava20
	gUgAEitraxAs30Hsf8lBTrjoYtbJWQfBN7nko7g/95ugQ3rE5AMWLzSmRT73tbEP
	cm5HqjQQbHX6DZdxJx+IKGYz3/xx6wEqHgFn5Ykcg900BfXSD8FJ4bbbEuTFkpoR
	qmSAVvGKID52JQ==
X-ME-Sender: <xms:V_sSXj4qvvtNlJRX4hQjEfVt7Xzp2dn4-KzW0w7fMGkvQwZ7-4pEIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgtdefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
	dtredttdenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhi
	rdhfiheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepud
	eliedrvdeggedrudeluddrjeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhk
	sehikhhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:V_sSXrR6NYdufa0TpyardMB9rerxnsne7cS3eClx2qntEjfc6IhxnQ>
	<xmx:V_sSXlBRV6c8_IAigQ5crh-_3LRtnMTv49FwpajQvioIIxESXP7geg>
	<xmx:V_sSXurhZZD4cd-R2WQ2piHGOGjp46PIzbnn22aMh0dpzEXUjD1C9Q>
	<xmx:V_sSXhFEColi7Sjh8JPhwJZ0pYEMQIKVo2jJ_9yjZbxTSNgmdSkkmw>
Received: from localhost.localdomain (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8F63A30600A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 04:18:14 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 11:18:03 +0200
Message-Id: <20200106091806.49129-3-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106091806.49129-1-tanuk@iki.fi>
References: <20200106091806.49129-1-tanuk@iki.fi>
MIME-Version: 1.0
Subject: [PATCH v2 2/5] alsa-ucm-conf: new recipe, version 1.2.1.2
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
X-List-Received-Date: Mon, 06 Jan 2020 09:18:14 -0000
Content-Transfer-Encoding: 8bit

The UCM configuration files were moved from the alsa-lib repository to a
new alsa-ucm-conf repository. The move was accompanied by a license
change from LGPL2.1 to BSD-3-Clause.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../alsa/alsa-lib_1.2.1.2.bb                  |  2 +-
 .../alsa/alsa-ucm-conf_1.2.1.2.bb             | 23 +++++++++++++++++++
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 39eee9475c..c9fb373f52 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -35,6 +35,7 @@ RECIPE_MAINTAINER_pn-alsa-lib = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-plugins = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-state = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-tools = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-alsa-ucm-conf = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-utils = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-alsa-utils-scripts = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
index 9565ad1b20..7bc78b8523 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
@@ -33,7 +33,7 @@ FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
 FILES_libatopology = "${libdir}/libatopology.so.*"
 
-RDEPENDS_${PN}_class-target = "alsa-conf"
+RDEPENDS_${PN}_class-target = "alsa-conf alsa-ucm-conf"
 
 # upgrade path
 RPROVIDES_${PN} = "libasound"
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
new file mode 100644
index 0000000000..469d1f7a95
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
@@ -0,0 +1,23 @@
+SUMMARY = "ALSA Use Case Manager configuration"
+HOMEPAGE = "https://alsa-project.org"
+BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
+
+# The tarball doesn't have any toplevel directory. The subdir option tells
+# Bitbake to unpack the archive to the correct place.
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2;subdir=${BP}"
+SRC_URI[md5sum] = "b7fa43cfd79df978184a6333766d2a50"
+SRC_URI[sha256sum] = "ea8a86875f4cf430d49a662a04a6d6c606c5c9d67e54cb944c4d77b24554062f"
+
+inherit allarch
+
+do_install() {
+        install -d ${D}/usr/share/alsa
+        cp -r ${S}/ucm ${D}/usr/share/alsa
+        cp -r ${S}/ucm2 ${D}/usr/share/alsa
+}
+
+PACKAGES = "${PN}"
+
+FILES_${PN} = "*"
-- 
2.20.1


