Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id D8D307F8A1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:18:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3243021FFD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 04:18:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Mon, 06 Jan 2020 04:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=HiobdLxZ3bmp8NB2bkHgqJKB0EecJthCGzBzt8qkVZ4=; b=X1MXDsJN
	3IPe1X42xewMvVtpYTzHChhon9Td2KPwqJTqyhYoqkbcU2Lj21QTPqJQLN0F124t
	iJZywR/MDJlnjBu80PYG7Yc99LkCwhw8A2BKfzIzEPLjUAMPoVzfID7Snm3wk4IB
	x2zyoa0d6JLpfrwm8SO8pCovlIklxOxZvNzxIogH1rJiirm8f5JReu9jgyHIM9bv
	14/0Q9226LUaxUtPw7Y0Sx+8Pa41ZYhrxcubMZZ+lKFd8hFZJFw5SevPNUt/rmuw
	kBzbHeBKLOOZMd3Dm9/BgOENn4kbv/v6e/OjswG4f2RVGJyYJ0xdXvm2RqdqsJxK
	nTCy5V3sjTTY6w==
X-ME-Sender: <xms:XPsSXsBpaxf0VT5sdjAk8cu06BhtUhaFQhz8AS1AQXqOgH1Mw4Q3mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgtdefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
	dtredttdenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhi
	rdhfiheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepud
	eliedrvdeggedrudeluddrjeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhk
	sehikhhirdhfihenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:XPsSXnLKDG6usl6U8dfX4iYM0Jmd71aDUC9TyG9KA19XWD8OVQu2JA>
	<xmx:XPsSXnBxUc1ElaGyakli2L82Jl06txiFmPQyR9gSWTlmx1HADj-xxA>
	<xmx:XPsSXssHoxqSW07JZYPYnIE_NIQWXyLvxY91BW2PEL2hCfW8n9wKag>
	<xmx:XPsSXos9wEFP1VzLCYsp9-50IxVnRalV-P3EyAGPmx7ldunOVM3mtw>
Received: from localhost.localdomain (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id A681A3060774
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 04:18:19 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 11:18:06 +0200
Message-Id: <20200106091806.49129-6-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200106091806.49129-1-tanuk@iki.fi>
References: <20200106091806.49129-1-tanuk@iki.fi>
MIME-Version: 1.0
Subject: [PATCH v2 5/5] alsa-plugins: 1.1.9 -> 1.2.1
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
X-List-Received-Date: Mon, 06 Jan 2020 09:18:19 -0000
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


