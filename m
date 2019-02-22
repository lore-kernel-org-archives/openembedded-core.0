Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 349 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Feb 2019 08:03:29 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB846BA9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 08:03:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 287DA221BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 03:03:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Fri, 22 Feb 2019 03:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7WOHCN00cCFA3qa4d
	dj5gHZHhGLljRKeltK/qiVBkOE=; b=D/QA62R/e1qORvgLHF15vpUAqugny4AJ0
	gacjWSBeaF06mnfyWJ6671u/VOEtQ5pupBQIl5Hr3YwpRJm1KrMSfoIZW1ZvCp9H
	3s5gv1J1azWF+uu38LCa4XBzVlIn/MiyokzQDuS8L1kxX8dVAXUNGAwWFZyhIb+L
	ULTH150aDMLEhrsLRrg8BcK6dcafZG91mxJNo1MJVZ5XDZHnXR3BeFFtFdqLgLQ9
	eAiK5uREAua9rJHbcZgpC69QC0vhmdwypxjXfegN0AgwMc63Do3BFgWXBi0hasdS
	YafjTBvU52hL4x8zIAIAy1HZ+3IItYp1eWD8txvY0TRTPUsNuKmZw==
X-ME-Sender: <xms:0qxvXEh_n3BGqUCFl-V-d_BsN2ZU0s7ViXaEzTZeEgYIXhLSuAyKow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdelgdduudegucdltddurdegtdelrddttd
	dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhht
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
	ertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdr
	fhhiqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppeekke
	druddufedrvdduuddrjedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehi
	khhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:0qxvXIJKF0vRZuM66v31iztitz8ku47L5huy30soKFR6p04nWrPGzw>
	<xmx:0qxvXCcsYeTm8cLocGzqYqdXCKU13YXeheWNLbPX8mvxj_vwmsfTzA>
	<xmx:0qxvXAPHkVOQO9hP9ta3iIf4SydB3FocUtxtkG1Xlgj5ktUjtNY0Rw>
	<xmx:06xvXIVD54rjYusk9QWFzFyyFu-iVJ3xxfdXy7-DoVSNVgR8Gioe3A>
Received: from localhost.localdomain (88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3C51C10310
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 03:03:30 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 10:03:10 +0200
Message-Id: <20190222080310.34789-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] alsa-tools: use a better SRC_URI
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
X-List-Received-Date: Fri, 22 Feb 2019 08:03:30 -0000
Content-Transfer-Encoding: 8bit

The ftp server has been flaky recently.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
index 90e54dbb14..0662b5a78d 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f65
                     file://ld10k1/COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
-SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
+SRC_URI = "https://www.alsa-project.org/files/pub/tools/${BP}.tar.bz2 \
            file://0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch \
            file://musl.patch \
            "
-- 
2.20.1


