Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id F150F610AF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 06:26:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 0BFB02148D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 01:26:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Sun, 16 Feb 2020 01:26:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0YZSkHTKjWC3g67vm
	c7E6cschE16LmJ86m0TOKQpvWo=; b=StCiwxWR52HloClodUHDzmtaV+k4wQa13
	1deiwAsH/6fk2Q8s4tECIeyTlZRo/QgzN0avdAxDv7Lr2pSVcF6KiOM+tDHvVwmC
	VB1uCrxVM+6x9E03VSFaEVraw5FWqY/flmrVHbfBgD57eIfXNnoy4J7Eixr3rqJi
	9rwpGXNhE326ic1ZIUWvMErlwdqcCPfNBxXV/yJfXra/QYvO/RlyW8MKI4aETD2z
	Q/C+GcmKDNdN3JrBfTgA9rdavixTfzX43y7wnb3v8BI1YvyvHM0eScr/rZVP6KaD
	eu6JsGlHB/fSG8iqKl3pH3c5dWMJKGYItWBq6/tNDaq89RcbfGYsQ==
X-ME-Sender: <xms:o-BIXjWX-R3VsIXcdgy4G86qrFidkcUdrZznePZgMJ4Jyt8xMTdIuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeefgdeliecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
	dtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhi
	qeenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucfkphepudeliedrvd
	eggedrudeluddrledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
	lhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:o-BIXp__oKQ-Wi569X_x5ovIqfX019MtSeoxtF1ThcUBucSbT6O2ZQ>
	<xmx:o-BIXh3Xaxl5g-646CEjaTJBvq8O3kGPwk2Hs5qIKbNwgl5bZEZhcw>
	<xmx:o-BIXrgDzF8mcGsbnCWOlqHvZLDqeW7RZiGiW-veTlV_72R7hZ0bhw>
	<xmx:pOBIXuLQ-SdGGGm_dyTxhdJ8j48dyAKD6NghRc-Pn5ugC0qQ1hfOxg>
Received: from localhost.localdomain (unknown [196.244.191.90])
	by mail.messagingengine.com (Postfix) with ESMTPA id 627E13280060
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 01:26:43 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 08:26:29 +0200
Message-Id: <20200216062629.36132-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] pulseaudio: remove unnecessary libltdl copying
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
X-List-Received-Date: Sun, 16 Feb 2020 06:26:45 -0000
Content-Transfer-Encoding: 8bit

This was added in 5df6deaa32e4f6d0a8985403970a137270491991. I don't know
what problem it solved at that time (2009-04-21), but it seems that
nowadays PulseAudio builds fine without copying the libltdl stuff.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
index 7f8ebc2090..1bd4d9083e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
@@ -7,8 +7,3 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            "
 SRC_URI[md5sum] = "e41d606f90254ed45c90520faf83d95c"
 SRC_URI[sha256sum] = "961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057"
-
-do_compile_prepend() {
-    mkdir -p ${S}/libltdl
-    cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
-}
-- 
2.20.1


