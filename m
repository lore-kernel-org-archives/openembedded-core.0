Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 460 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 02 Feb 2020 02:11:07 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3C560C17
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Feb 2020 02:11:07 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 3AD7921650;
	Sat,  1 Feb 2020 21:03:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute7.internal (MEProxy); Sat, 01 Feb 2020 21:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=HFvxW4GqPsyyY349btWPfqF8Zk
	J0MaAKoXO9j+b6QJw=; b=tgOHOqTXUR8T/JkPJX0X3Zzar3H0W62HqdNPSI0U0X
	xtTYunpfQObvpq5x4tRUxY4nRv/UjMIqvlvomquHY9Q999uZS2ghvsWoBCj/lQmT
	1OZtP8elsN9KkTntiu0jpvwMOsBPafY9rJ7g1p6kBtt/LNxIlC3g2Z5OnJoMVW3s
	N+6fVvN3R8xPt9AkmnIv5bDpGDEDYV++DdOwkdXisQ6p3LlxwXP6HdeEkWXEddsz
	jsxPpYFaXwN8cVT1kcthEO2HE3eleDb1w7vKC+z9zd5e6tsAJx4MNRLm+SYiRZxN
	nGxxb3sauYE9sUybgv3fUET0Q/rBG9kzRRt3PjhwxS6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HFvxW4GqPsyyY349b
	tWPfqF8ZkJ0MaAKoXO9j+b6QJw=; b=nAuAqLxeqWSdiMVbhjblNVMRX5qmzbYuW
	kESO4gEGtcS8huPBrpxTwtxvqx6swPhjZNAl8DLG2CnRVE4DjJLxBf3+jbMWDmQG
	Z548JuVDSoP8Ev3ynV6TsmjNBrRgXSULQerdZcNx4JH0s8Prys6DjJOwdgK6jUGj
	BmQ9S8XhKkkUwWXL8xbne8uqu9TllcedHkIFYJYUSCY4reFAP1/4pQdZExR4jWas
	CPfJ9owbBUQy1QivPlPAw7cdJuvW8DWPpC+9RsGY5hqDU48ftBlywlBzkLAJmSl8
	XXAOQ6s9ckxLcGELYSAJ0OW5yjwpNUSdsA2FxbFbv/lO3qlRjkVhg==
X-ME-Sender: <xms:7y02Xu5p6ojBTV84QBeq5x6-cSXItRkSiC3C8am-PIY3vqjv_gwUmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrgeefgdegudcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
	dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
	rghlihhsthgrihhrvdefrdhmvgeqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
	fkphepjeefrdelfedrkeegrddvtdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
	rghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:7y02Xkk6DQAdS-9-8NEGe1rGfVVl5-hYicx12iaMNV4aWYyrKQBTnw>
	<xmx:7y02XhVKOWt702oSRfDNGD-2wQiYSZ7J_O7GlBUa8mKSNcmGltEKuA>
	<xmx:7y02XlRcFT_9qKSzQDzxyZREou0hOsYXJgFSLnqmCFzsizGVDu1eCQ>
	<xmx:7y02XmVKUIr8Q2IClxiPw30m_gTwvKHroFDC2PSs63dNP_wHuWsIxw>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8707630607B0;
	Sat,  1 Feb 2020 21:03:26 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Feb 2020 18:03:23 -0800
Message-Id: <20200202020323.23609-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] libchamplain: Add support for building libchamplain
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
X-List-Received-Date: Sun, 02 Feb 2020 02:11:07 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../libchamplain/libchamplain_0.12.20.bb             | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb

diff --git a/meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb b/meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
new file mode 100644
index 0000000000..90e5533015
--- /dev/null
+++ b/meta/recipes-gnome/libchamplain/libchamplain_0.12.20.bb
@@ -0,0 +1,12 @@
+SUMMARY = "libchamplain is a Gtk widget displaying zoomable and pannable maps"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+DEPENDS = "glib-2.0 gtk+3 gdk-pixbuf clutter-1.0 clutter-gtk-1.0 libsoup-2.4"
+
+inherit meson gobject-introspection
+
+SRCREV = "145e417f32e507b63c21ad4e915b808a6174099e"
+SRC_URI = "git://github.com/gnome/libchamplain.git"
+
+S = "${WORKDIR}/git"
+
-- 
2.25.0


