Return-Path: <alistair@alistair23.me>
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
	[64.147.123.27])
	by mail.openembedded.org (Postfix) with ESMTP id 078867FE71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 04:15:07 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 0B0A58E6;
	Thu, 19 Dec 2019 23:15:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute7.internal (MEProxy); Thu, 19 Dec 2019 23:15:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=7lmiruq56SaniZX4S3LLChstVr
	1OGcWpOXEIG13OFeI=; b=hQ3LytG6tN2V4aPtfYAkUTuj6WLa0uDWU/i+lnhwdB
	9ZWiHdt34XoKU9pvkg7McD9iZ0N804o+JoMf5mdGJP5JEqI5wc1xsiRk09RHdP3B
	jQ2HtgJwvA6z46V8oU5npNR7kJlvx3/w+iZmoddQcAIZ4lYaDmguosBS2DgzAK5O
	QrrXe8osEP0Ew0n6MNafGkwGT5fZEpp6tEitUtukaHOzXzbFqWKYGlGQbE8d5tmt
	BMKw11naGmY9f6eaDKA7gl9oV2jWssHXtg/JOEQ9v+nILVkyLoSl0ZJsWmn8O5bH
	CP+Uy9MivlHWw9HNsslxY7jTpPcgvCOA5l3UaoF673GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7lmiruq56SaniZX4S
	3LLChstVr1OGcWpOXEIG13OFeI=; b=pfkEqOA8iEFSBCMWxaZqWmcrPq6IPBQLZ
	ybxWhywGNTvnbE7EjuezzrKh5f9QUHTQn/sL9jkaq7GoFKm7Ekp/ppzJOIiqpxAS
	P68GsCxvsNW4vvx3ozzy6lCK+66YBe6N73C5BEW7Qm5iN4DjICVTjIlFRMwLDlA0
	yzSByLyBLYW56z6aE2gziGxx94o6Ea1zlHNnEAunKaC4JZ4XrCqyIL9zvhbcF5L0
	8+EbgjLpkbomYG7f8wBX3dOhEYVZuRUXxMnSGoHEzMgbL5pvIeu71dBb5l2bGlN/
	VwuBtY1bI8jnoRFEou3SZ24JU6S9uwza5KLrj/wtXs3ONWzJQhJnQ==
X-ME-Sender: <xms:yUr8XWrqq-fbPT2F6IrU6Npe6olC-tRsaTitFDVCcIOV7cLGSm4ZHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduvddgieeiucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucgovehorghsthgrlhdqhfeguddvqddtvdculdduhe
	dtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlihhs
	thgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmh
	gvqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeejfedrleefrdekgedr
	vddtkeenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrg
	hirhdvfedrmhgvnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:yUr8XaqqGfe7pvyrWet9UZhOd2tOZOjRxwa3dlwy3QjKZIGYO2dpEg>
	<xmx:yUr8XY1cQzoXQfgzpdd39NmG6Zm53NOVhkHf1hWKaLp539IpQukxuQ>
	<xmx:yUr8XRBfqxPJYoklDgqVirhVDfQK7hMZzTmS3fTDC12F3vWqwdUjGg>
	<xmx:yUr8XakHkLixBkym9cfaYrLPPzjpPsVBQuD2n3hiIVHcB7lzTcCDMAJOhMM>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id AFA723060774;
	Thu, 19 Dec 2019 23:15:04 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 20:15:00 -0800
Message-Id: <20191220041501.19716-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v3 1/2] libepoxy: Update to 1.5.4
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
X-List-Received-Date: Fri, 20 Dec 2019 04:15:08 -0000
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


