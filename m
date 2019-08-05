Return-Path: <andrew@aj.id.au>
X-Greylist: delayed 534 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 Aug 2019 03:21:08 UTC
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
	[64.147.123.24])
	by mail.openembedded.org (Postfix) with ESMTP id E45AE75E2D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 03:21:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 2878A214;
	Sun,  4 Aug 2019 23:12:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Sun, 04 Aug 2019 23:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=KToNnmF1jLjW/Fgu4sPktyDuWN
	pAdhIKKqEqGBOM7Ow=; b=Ggp6hkw5cNMJZ0Ftv/d6rwXdLpqbRFHoh38jDsNKpT
	ho/jKp6md09ntuNLjJsagNlqQy2vBA1oSKLyu07gQ7T3iQHsoLxzs8rP/zzFpwNb
	m3PiKO1XT0ytPob6bUlrpTrD0JLT5EQUxoB/RlnkrJfOmBz5dlPbJ35e4+KWK0fE
	vOtv5StYaLIdSgPNagbkKeGqfanS6zyG2yJCGWfW0kKyWMYnJWa2Og65WXfdESmQ
	D40uhYs01KBT/8SoeXl0DQYgO9rAMTwvYgLSIi0ktVODupqXtOLGQHr7qY2GU1Ia
	bk7KroCExXPD+dvf0CTRWqhwsHJ5nZGm+GXwwN/XYRTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KToNnmF1jLjW/Fgu4
	sPktyDuWNpAdhIKKqEqGBOM7Ow=; b=SFtnl1Ov69A56Ehx2YFaGzNeRNGY/hjVZ
	PAHJt7Ba7XrE8MgiO50fdFfzygLjYQuInk7+nY5f6OErKWD/H50MI4zL0aJ6iDcJ
	mDyY81C/A5WcSW94A72aH/KsyLD6SyajqFo+I87McuCTZHll5BksWVzDmKDoBYVq
	WxlUS499fWSRunIIEuP8lAEYwvUju+ZmOyoIv6bAIBtZiWi0aW5mj0jLWV0W88o7
	RrLz/PUr4GJW1DurTIBpk5mANHux7+0mvP/fi71UN/+B6XomPjHCoH9SRQjBX2YK
	LFX5DlG4tsH+D3N3lhQd2FaMz1zmXN5sd58/x4BFswl67iETkAsLA==
X-ME-Sender: <xms:i55HXQZBeyHNjuIVvx6jkJrJ0qAK0LkAVcCE-8g6E-jLLMZy43uu-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtiedgieehucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
	dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
	ihgurdgruheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtoh
	hmnecukfhppeduudekrddvuddtrddugeefrdduvdehnecurfgrrhgrmhepmhgrihhlfhhr
	ohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:i55HXY4L4O9oMyEMMD-FiowPxuMYLoLmbtBfSzrw1VNmmkfvTwRYMQ>
	<xmx:i55HXRRAm4V1_lB9GfVnAnDrPcaycdUdZ97TYICBmTuPuAhY_gckxw>
	<xmx:i55HXRxoDPCrBlTvJxhcchWH00hD_A5a2A3Rai7QF_uHDcYrhQ2Q_g>
	<xmx:i55HXQc5kADb9rXYPis4YEOZiaFt4IPC9-pmUSQkDYOUfzS9Gt34YQ>
Received: from localhost.localdomain
	(ppp118-210-143-125.adl-adc-lon-bras33.tpg.internode.on.net
	[118.210.143.125])
	by mail.messagingengine.com (Postfix) with ESMTPA id C478080059;
	Sun,  4 Aug 2019 23:12:09 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Aug 2019 12:42:11 +0930
Message-Id: <20190805031211.11190-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] dtc: Provide libfdt
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
X-List-Received-Date: Mon, 05 Aug 2019 03:21:09 -0000
Content-Transfer-Encoding: 8bit

Applications are appearing that depend on parsing flattened devicetree
in userspace on target devices, e.g. pdbg[1]. Mark dtc as providing
libfdt so application recipes can depend on it.

[1] https://github.com/open-power/pdbg

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta/recipes-kernel/dtc/dtc.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.inc
index 0650e3c82e6d..d55c8af90660 100644
--- a/meta/recipes-kernel/dtc/dtc.inc
+++ b/meta/recipes-kernel/dtc/dtc.inc
@@ -5,6 +5,8 @@ SECTION = "bootloader"
 LICENSE = "GPLv2 | BSD"
 DEPENDS = "flex-native bison-native"
 
+PROVIDES += "libfdt"
+
 SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
            file://make_install.patch \
            "
-- 
2.20.1


