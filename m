Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id D3D447F87A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 08:31:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 273BC21FC6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 03:24:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Mon, 06 Jan 2020 03:24:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=HiobdLxZ3bmp8NB2bkHgqJKB0EecJthCGzBzt8qkVZ4=; b=xbG4+OtF
	D8sEkT0WCsb8b5hD4y9mbFR91kIWX/nEXuKWe/CSFOM+m+LYdhxwCtq4AkRRkDQt
	1a0Bj7LQoXachiEq+Wa3+trcxv9/vBRVnh+RO6ABxjndqbUbRWhbMpTmgWmMF6Yu
	skPiWOZDVuv//bnhbXMTemMT2/kPm31r/vn6O9a9nqV7N7K34pbzt6dOQFuH3NdX
	2NgzaHomF9gAW5MWwJYsgzTLhDIcD/+siLnu1vKc6yS1Sm4jm6DSOD0X+fXvYTkT
	gd7T/Gvl1aIx62iQkGjNxmZeCDXer6dHGBSJX4vUsJ8BAI6ox6rVxOTVX9WbPOtR
	IVRuKzFAJ2sZyA==
X-ME-Sender: <xms:tu4SXumGvRJHGkwYy1M0NLFw29iioGNlvcin6kaBW3qFP6cVTQ-hRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegledguddukecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
	ertdertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhk
	ihdrfhhiqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppe
	duleeirddvgeegrdduledurdejgeenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhu
	khesihhkihdrfhhinecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:tu4SXhkxNsnLgSevZ-LjKhTvI47fSdn5noz3RzXC38sI99JnpsdLVw>
	<xmx:tu4SXlPdaU3AWR_Gsofpmzok8GWh2Osg5JrBqlGzOvZhC05Oj1VvVA>
	<xmx:tu4SXjsE_hGvhQ_YLlZg2av_gAl-5VrQhHhtJMwG0hrfK7q2Q7VpEA>
	<xmx:tu4SXnMqmku9bgfPmAhMcMM0Vlu1wCu1tgOwUkVds9qsej4Pnpnhrg>
Received: from localhost.localdomain (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id 89B338005A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 03:24:21 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 10:24:08 +0200
Message-Id: <20200106082408.47678-6-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106082408.47678-1-tanuk@iki.fi>
References: <20200106082408.47678-1-tanuk@iki.fi>
MIME-Version: 1.0
Subject: [PATCH 5/5] alsa-plugins: 1.1.9 -> 1.2.1
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

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../alsa/{alsa-plugins_1.1.9.bb => alsa-plugins_1.2.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.9.bb => alsa-plugins_1.2.1.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
index b94fc5cee3..9882e12763 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
@@ -21,8 +21,8 @@ LIC_FILES_CHKSUM = "\
 "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e0caffbd849c51ed81751378f56cb563"
-SRC_URI[sha256sum] = "161772303da521abbbf1d91f63b470c4791392d5728f2192a42d71292078f907"
+SRC_URI[md5sum] = "5b11cd3ec92e5f9190ec378565b529e8"
+SRC_URI[sha256sum] = "4d94de7ad41734b8604a652521200bb6554fcf0c2c00fdbd302b1710d76548da"
 
 DEPENDS += "alsa-lib"
 
-- 
2.20.1


