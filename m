Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE547F877
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 08:31:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C6C6F21FBA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 03:24:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Mon, 06 Jan 2020 03:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=dw3q69oJ8n8hpan1MTR+v9BZy0yBVy73ImJSLNwKFIE=; b=Okh7vhIb
	pa1Fd7CrYfbK9SxO4yHMtQbsPZn0ztSM8eg4oTbotaej23JIxQ4/DQNzmwH7L/gh
	5DuC6ko6Ze6/Su3EzC+RGvXgH+42rRV1TGQFRFUSpt99VHFEEfkOtlnUVdCGMaTJ
	+eJbD5qsHRq1pN+HQBISJ/mZBjgBVqgbdHK0e4L7Hf0Kcs+TH/0KNqkJsgBa7Zul
	YoH6cGuxim6dwDoYWrGY4UU5KRgt82qbBQOSac7kE1/3xNVXkfCsGLz7bj/B89BS
	DVgrysl46ULcjBnQzH3NT9jncasnG8KvCmnDA5nJldQzHzgGD1KquyX4JrtO2Y+x
	JHxoizdd0P32tQ==
X-ME-Sender: <xms:tO4SXhflUXfT1KRaB6HqpkSdS6LjTazu1kS5b7tLvBfgmJ2p8vZ9zQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegledguddukecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
	ertdertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
	ihdrfhhiqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppe
	duleeirddvgeegrdduledurdejgeenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhu
	khesihhkihdrfhhinecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:tO4SXiLLcmLyYfVwPuE2p66sqQFzrR6qfNjhTZ4GPzAPXn4c9wbF7w>
	<xmx:tO4SXuvUuuRljZxhQ1-hwyTiBLj36TCol14e0kvnAq5p_mxd0PkbDA>
	<xmx:tO4SXoJNLHGIvqLOVYxrmyowiwzDmuJKhOCjIxuL-_pfcPuDfEN8ow>
	<xmx:tO4SXj6Vg_Fo4yA8RsmD9QEtCFZvn9BNGvqePdAq4kSHOZiCrOCKbw>
Received: from localhost.localdomain (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id 482958005A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 03:24:20 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 10:24:07 +0200
Message-Id: <20200106082408.47678-5-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106082408.47678-1-tanuk@iki.fi>
References: <20200106082408.47678-1-tanuk@iki.fi>
MIME-Version: 1.0
Subject: [PATCH 4/5] alsa-utils: 1.1.9 -> 1.2.1
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

I moved the ALLOW_EMPTY line next to the line that sets FILES to "".
That makes it easier to see that the package is not only allowed to be
empty, but forced to be empty.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...-utils-scripts_1.1.9.bb => alsa-utils-scripts_1.2.1.bb} | 0
 .../alsa/{alsa-utils_1.1.9.bb => alsa-utils_1.2.1.bb}      | 7 +++----
 2 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.9.bb => alsa-utils-scripts_1.2.1.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.9.bb => alsa-utils_1.2.1.bb} (97%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.9.bb b/meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.1.bb
similarity index 100%
rename from meta/recipes-multimedia/alsa/alsa-utils-scripts_1.1.9.bb
rename to meta/recipes-multimedia/alsa/alsa-utils-scripts_1.2.1.bb
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
similarity index 97%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
index 03b5c8de30..81b1154de9 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.1.bb
@@ -21,8 +21,8 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[md5sum] = "5ed21c3e296c06046cc986e732f625f6"
-SRC_URI[sha256sum] = "5ddf2cbddb4bd1a4a2a6492a09c25898b08c3ad64893c3655be14194cf0a213a"
+SRC_URI[md5sum] = "c4628bae7632937eac2de4cf2a3de82e"
+SRC_URI[sha256sum] = "0b110ba71ef41d3009db1bc4dcae0cf79efb99cb5426fa19d0312470560a2c0d"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
@@ -56,6 +56,7 @@ PACKAGES += "${ALSA_UTILS_PKGS}"
 RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
 
 FILES_${PN} = ""
+ALLOW_EMPTY_alsa-utils = "1"
 FILES_alsa-utils-alsabat     = "${bindir}/alsabat"
 FILES_alsa-utils-alsatplg    = "${bindir}/alsatplg"
 FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord ${bindir}/axfer"
@@ -88,8 +89,6 @@ SUMMARY_alsa-utils-alsaucm      = "ALSA Use Case Manager"
 
 RRECOMMENDS_alsa-utils-alsactl = "alsa-states"
 
-ALLOW_EMPTY_alsa-utils = "1"
-
 do_install() {
 	autotools_do_install
 
-- 
2.20.1


