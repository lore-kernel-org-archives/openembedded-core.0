Return-Path: <alistair@alistair23.me>
X-Greylist: delayed 310 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 19 Dec 2019 05:20:56 UTC
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
	[64.147.123.18])
	by mail.openembedded.org (Postfix) with ESMTP id 656E77FDC2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:20:56 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 40028486;
	Thu, 19 Dec 2019 00:15:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute7.internal (MEProxy); Thu, 19 Dec 2019 00:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=7lmiruq56SaniZX4S3LLChstVr
	1OGcWpOXEIG13OFeI=; b=xkTQ2Ircz7wFccn2/a4wkSArYI0oO6Ni7Tta9dQ0H3
	8QY8tzFdoAm5G4nvv37oMXOShS4VIkhze0jI6hYjlXv/76pHi5XEvVOfGHgSVBG7
	Pql5+3HgDTKHmprcj3KocvAurIWOcWslOcnffglWTSQz+/lY0NEEGDIjTx3kchWI
	MIQGaqdZYEAfpN40rMgrA36hdI7/nlnV1oI7dZg5vow2INIXJmjvufCrP77XxlEI
	H4Y1Cco9ogGNNywT26ZZ2MedLG+QTCfkcM76yVtTLr81v82m39KT7RHU5F22VpET
	zFyJY7ZXwisU+VmiUdyVYWUcMfH7nxf6wd6X1FhRmnOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7lmiruq56SaniZX4S
	3LLChstVr1OGcWpOXEIG13OFeI=; b=OPPFf4LGFYSOojSj06WK2XtqB4XUChDo1
	rbDBwtcqd5OnlVd7OyaRG150fAXuULDeGQVEloZhlV3E+bxucFLFhEwM3QA1KClY
	Ju2EhdxEnibIWiojIezTJCB0qwy74bEw0Bvd0iXQTSZqmAhXQJNjPF/2FexjGKk8
	HWLp/MohJCCq9kAc+ddxL0FU6XTIKg7CB3Nwd4EGvrhKwnQoieBTls6NU/oSQjXd
	XY4hjtrBkpSg1J/lNzpPzD26ae76AhhiEpWNWlzRLx1TKp+vDhNr5x2ePYBXy5gC
	0R6w7TNMkMquXk8pCY1rw538wISyuYH5AQuGP+5yQl/BgNdxRBiKQ==
X-ME-Sender: <xms:ggf7XdW0qorUS11f4FVHLrHG7V3ceYKiiosBfvxzRRc8uDFFFCaYdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddutddgjeelucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucgovehorghsthgrlhdqhfeguddvqddtvdculdduhe
	dtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlihhs
	thgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmh
	gvqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeejfedrleefrdekgedr
	vddtkeenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrg
	hirhdvfedrmhgvnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ggf7XSzrwPtsMigb_lcxdi8d_jZq7xN8bVUsHjvdTyyeoBLoMq8Zfg>
	<xmx:ggf7XaSntVl-Jh_6zOY0UCMpILg-KzcsqaoNgXZYKLyP3yWLwR3dzg>
	<xmx:ggf7XWgJ6azoFG_AHqcdpQFJtl8ZW36vgPQmN-HX8Z4n04JYK0A-dg>
	<xmx:ggf7XX_uynpIA6XmzeVkZduswhzjsIpW5dsbzpSNjwBZ22Ln_HVHjvkAmyI>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 25FC38005A;
	Thu, 19 Dec 2019 00:15:46 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 21:15:42 -0800
Message-Id: <20191219051543.20185-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v2 1/2] libepoxy: Update to 1.5.4
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
X-List-Received-Date: Thu, 19 Dec 2019 05:20:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../libepoxy/{libepoxy_1.5.3.bb => libepoxy_1.5.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.3.bb => libepoxy_1.5.4.bb} (91%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
similarity index 91%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
index 71a2c91353..4caf672369 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.4.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            "
-SRC_URI[md5sum] = "e2845de8d2782b2d31c01ae8d7cd4cbb"
-SRC_URI[sha256sum] = "002958c5528321edd53440235d3c44e71b5b1e09b9177e8daf677450b6c4433d"
+SRC_URI[md5sum] = "00f47ad447321f9dc59f85bc1c9d0467"
+SRC_URI[sha256sum] = "0bd2cc681dfeffdef739cb29913f8c3caa47a88a451fd2bc6e606c02997289d2"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit meson pkgconfig features_check
-- 
2.24.0


