Return-Path: <alistair@alistair23.me>
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
	[66.111.4.224])
	by mail.openembedded.org (Postfix) with ESMTP id 78D1F7FC2C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Dec 2019 06:36:54 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 1A6B033F2;
	Sat, 21 Dec 2019 01:36:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute7.internal (MEProxy); Sat, 21 Dec 2019 01:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=7lmiruq56SaniZX4S3LLChstVr
	1OGcWpOXEIG13OFeI=; b=NE9iVBa8t/sSarYjj9asqvzEGUSxCAI2dn3s7Bh5tO
	Y8o2YFWOkXEx0282U1PeRG/ml4jD1+X77nKCdNWQQcEdKTguDWTyzEmrqRR+aaI9
	FX+VINnVYbzrBwziJIbuIGU4/DsnWfgpPGi9trBoEZl2aReiDcDZf0cWFRv+QpwV
	2NNsNfzDVw9jW/YCUE9Ut62pcOWFM4nXzK5cXpccE10xYil4PGEgZdVAZEucPzGb
	nr6Kdu6OF97ai0tpVt/lJgavLv99dGL8rslCtR+ZYRn1TRGMGUYuU7YYbOd1gJAp
	Axxa3ptzhC0Fp52s6jdqUVEane0w2SV/ECt9xa5fKxLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7lmiruq56SaniZX4S
	3LLChstVr1OGcWpOXEIG13OFeI=; b=UYa61Ir5vA00gZS6hfaKWtV7Gdjsyqmd5
	B8cMXPq0ItPZivGEEusSzkG1CC4qOx+xZkAkUcrRqXREN7qLcUYDEjY+oQ1vTMA7
	T2/Zig9iJyk1F9il5XNXIMZy1yM/aAP1B6DAV+oVER8deIHVw0IqwnRnbYlKXrxR
	xlAY+JUsax+Wh+IiTSVfVjr33UqZrhRRILkRb2Rqorur+oQo/oXRaR1jmPLZ0DlL
	Y2Ew62l1svLo5C3rIKIOd5Oj6DLbCun+remV4c/szzDsEInfZ+k6Lzb9/4OcaTNg
	Dzs2mWL+8Boj3JZyrf0VSoKAn4KWeR0vLEZTCzPiKxAsfEWeia32w==
X-ME-Sender: <xms:g739XQK-O5pkV8SqimnREdLd_M_Nuw6mIQd-XfYbuUo9kcY__zZzSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddugedgledvucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucgovehorghsthgrlhdqhfeguddvqddtvdculdduhe
	dtmdenucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlihhs
	thgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmh
	gvqeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeejfedrleefrdekgedr
	vddtkeenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrg
	hirhdvfedrmhgvnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:g739XZci6yGa9ya0IhiIRjeRpP0BbhjakBGR8vdbm5aA2YDtVidrOg>
	<xmx:g739XX8z2-2dUsi-U294npOA6mA0IqGNvArxDqxnXXaxqukZN0w_kg>
	<xmx:g739Xeol3WCdYnNy4wi1Q_da9fIOGfdvgya8Uet3fpYpt2_6IgwcSw>
	<xmx:hL39XbbVoH3UAjZXt-H52aU-jtjm8_yJyvNlnsgggvP6LO3maPnn9A>
Received: from alistair-xps-14z.alistair23.me
	(c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2DE568005C;
	Sat, 21 Dec 2019 01:36:51 -0500 (EST)
From: Alistair Francis <alistair@alistair23.me>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 22:36:47 -0800
Message-Id: <20191221063648.24227-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v4 1/2] libepoxy: Update to 1.5.4
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
X-List-Received-Date: Sat, 21 Dec 2019 06:36:55 -0000
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


