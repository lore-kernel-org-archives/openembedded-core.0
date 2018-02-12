Return-Path: <jsbronder@cold-front.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 069716FFC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 22:05:33 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id D02B020DF7;
	Mon, 12 Feb 2018 17:05:34 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute7.internal (MEProxy); Mon, 12 Feb 2018 17:05:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	h=cc:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=mrbLc6qrFzMzJV625kYH1b7Hb+VA6vozaXDrPt
	qkz40=; b=WBxiCxMjXDMVwXKEJ387Ex0cRL+TEr70q2w/iAAs3GXfjgL8CrIndt
	d7UjmauOKLKy6pWFiE5ClBDz5eTVN5CeRtzwuR8m5QYZAHNkCVhWD0R4rvvF3eJc
	BQ1GUQyGkHJ/Kk6PFvNfDL3AViev0MBFAC1ZYyuX1Pz3/F5bkgnx4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=mrbLc6qrFzMzJV625
	kYH1b7Hb+VA6vozaXDrPtqkz40=; b=HB6zIudHf8U31tnk1Hx3ktEwuyoS2Eqff
	/QnEV5EiieDxMf36Ll9qn/b9wo4EYU/MOdDClpSD8Zs7gyvPP5q5X9SaLnnF+Kr0
	4Fav+0efx5LoQ2bVm69sIQBKtozGWJ+2juQp2VxiLO6eW+JZPQti4/RgVbAR5+7M
	SMSTRmSXgf+AlYFEGap7jm4pFUhqo2OQptBZidHBLW8veDLibWvFIsazhGAqr01M
	+Lfym8XZwUQfi2SklS61Bm5RircszLnkauVncYnL6fccJcpiRNouqzl3u/CxFY/N
	CT3AQ+A7jpukz+LI4+Zc0CwusZxCpKDi882vj1bhlhQsOofCWgkPA==
X-ME-Sender: <xms:rg-CWpzzQ4dndTxo0X8PofwrHE_e6HZE2jZgc0RZ-bogwLqs6q7FYA>
Received: from localhost (c-24-60-203-86.hsd1.ma.comcast.net [24.60.203.86])
	by mail.messagingengine.com (Postfix) with ESMTPA id 79EF77E522;
	Mon, 12 Feb 2018 17:05:34 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 17:05:28 -0500
Message-Id: <20180212220528.5545-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] rxvt-unicode: add missing pkgconfig
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
X-List-Received-Date: Mon, 12 Feb 2018 22:05:34 -0000

The configure script uses pkg-config in RXVT_CHECK_MODULES and falls
back to disabling features that were enabled in EXTRA_OECONF if
pkg-config isn't found.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
index 4d5daa661c..b568f04580 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode.inc
@@ -12,7 +12,7 @@ SRC_URI = "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-${PV}.tar.bz2
 	   file://rxvt.desktop \
 	   file://rxvt.png"
 
-inherit autotools update-alternatives
+inherit autotools pkgconfig update-alternatives
 
 PROVIDES = "virtual/x-terminal-emulator"
 ALTERNATIVE_${PN} = "x-terminal-emulator"
-- 
2.13.6


