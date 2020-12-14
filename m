Received: from wforward5-smtp.messagingengine.com (wforward5-smtp.messagingengine.com [64.147.123.35])
 by mx.groups.io with SMTP id smtpd.web09.1537.1607973711133516885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 11:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=msjHgRaq;
 spf=neutral (domain: iki.fi, ip: 64.147.123.35, mailfrom: tanuk@iki.fi)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailforward.west.internal (Postfix) with ESMTP id CD13F5D2
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 14:21:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 14 Dec 2020 14:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PyfKTXNQ9haRTp8q3
	1ucu++Pz/3w0aF3pPvN+LrHKeA=; b=msjHgRaqcCDZ8NnudkCknj7lM/wJuD28Z
	jahqI3ugUzXZ48ovtgv1nk0qyatrtp4Rcba850GSV8tG1rg1ZlhCnKnx2FKNF0KG
	851KjhF3zqOiJ3v+uEr8bdb6TEe3Ee5D3TOrXHWQePWPiC26RwOgoY0tp88Irkst
	IZfx30K+j1wzIrAkF2wNfLQUtrSXCESNGYmafgeMio2m4F+I+Ak0Wo83SkMNrp2X
	tbHDkcyWIX/qoFBScKIIKDviye90dCo+bGfhOcZwLLRCF23ErNoeNF0/6HyMkMGv
	DPHjKtb6vj98kvxZZPPEBBw/cM0MzHdaAdgOqnIrI2pxSp6hwAavg==
X-ME-Sender: <xms:SrvXX0ivXaAx3jlPHvpdQdIh6aS6qkYsFrSqhnjjRut9jmftDT8v2g>
    <xme:SrvXXyRbvYitKo7TDyh5P9iCRHtfv2Rn5NqkUH1qw2cQWgCrMCepDLlD2XWKyNzke
    no8WCZ7ct9p5GtY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudekkedguddvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecuogfggedutddqvdejucdlgedtmdenucfjughrpe
    fhvffufffkofgggfestdekredtredttdenucfhrhhomhepvfgrnhhuucfmrghskhhinhgv
    nhcuoehtrghnuhhksehikhhirdhfiheqnecuggftrfgrthhtvghrnhephffhheehieeiff
    egueevvdekudeltdegvefflefgleefudfffefgjeetieetieeinecukfhppedukeekrddu
    vdeirdekledruddunecuufhprghmkfhppfgvthifohhrkhepudekkedruddviedrkeelrd
    duudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeht
    rghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:SrvXX9zFRW471WN7W1lsaWlPjXT7ij07ceivLO0fMRXrWzrO24ZPBQ>
    <xmx:SrvXX9fckQYaBJT_GxTd8fX2JWXfa3XPGhEwGjkiT_JMC3SZGBLrfw>
    <xmx:SrvXX5J6kghRylm4hBAdtQXTwnKuwI0yPTMRjKnCYowTtbarwQKDrA>
    <xmx:S7vXXwOCAXHTrv8NiZfI8ReFdcLO6f1di0RReej6bg-T6IjZUe64AuePUhc>
Received: from localhost.localdomain (unknown [188.126.89.11])
	by mail.messagingengine.com (Postfix) with ESMTPA id 57FC8240062
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 14:21:46 -0500 (EST)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: remove myself from maintainers
Date: Mon, 14 Dec 2020 21:21:35 +0200
Message-Id: <20201214192135.10277-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 meta/conf/distro/include/maintainers.inc | 38 ++++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e9c69b2e6e..8dffa2fc95 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -31,14 +31,14 @@ RECIPE_MAINTAINER_pn-acl = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-acpica = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-acpid = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-adwaita-icon-theme = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER_pn-alsa-lib = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-alsa-plugins = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-alsa-state = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-alsa-tools = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-alsa-topology-conf = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-alsa-ucm-conf = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-alsa-utils = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-alsa-utils-scripts = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-alsa-lib = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER_pn-alsa-plugins = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER_pn-alsa-state = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER_pn-alsa-tools = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER_pn-alsa-topology-conf = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER_pn-alsa-ucm-conf = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER_pn-alsa-utils = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER_pn-alsa-utils-scripts = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -175,7 +175,7 @@ RECIPE_MAINTAINER_pn-expect = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ffmpeg = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-file = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-findutils = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-flac = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-flac = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-flex = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-font-alias = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-font-util = "Armin Kuster <akuster808@gmail.com>"
@@ -297,10 +297,10 @@ RECIPE_MAINTAINER_pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-kmod-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-kmscube = "Carlos Rafael Giani <dv@pseudoterminal.org>"
 RECIPE_MAINTAINER_pn-l3afpad = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-lame = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-lame = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-less = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER_pn-liba52 = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-liba52 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-libacpi = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libaio = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libarchive = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
@@ -343,7 +343,7 @@ RECIPE_MAINTAINER_pn-libgudev = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libhandy = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libical = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libice = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libid3tag = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-libid3tag = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-libidn2 = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libinput = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libjitterentropy = "Ross Burton <ross.burton@arm.com>"
@@ -374,11 +374,11 @@ RECIPE_MAINTAINER_pn-libpthread-stubs = "Alexander Kanavin <alex.kanavin@gmail.c
 RECIPE_MAINTAINER_pn-libpsl = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-librepo = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-librsvg = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER_pn-libsamplerate0 = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-libsamplerate0 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-libsdl2 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-libsecret = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libsm = "Armin Kuster <akuster808@gmail.com>"
-RECIPE_MAINTAINER_pn-libsndfile1 = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-libsndfile1 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-libsolv = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
@@ -577,8 +577,8 @@ RECIPE_MAINTAINER_pn-pseudo = "Richard Purdie <richard.purdie@linuxfoundation.or
 RECIPE_MAINTAINER_pn-psmisc = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-psplash = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-ptest-runner = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER_pn-pulseaudio = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-pulseaudio = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER_pn-pulseaudio-client-conf-sato = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
@@ -651,7 +651,7 @@ RECIPE_MAINTAINER_pn-ruby = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER_pn-sbc = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-sbc = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-screen = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-serf = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -666,8 +666,8 @@ RECIPE_MAINTAINER_pn-shutdown-desktop = "Alexander Kanavin <alex.kanavin@gmail.c
 RECIPE_MAINTAINER_pn-signing-keys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-speex = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-speexdsp = "Tanu Kaskinen <tanuk@iki.fi>"
+RECIPE_MAINTAINER_pn-speex = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER_pn-speexdsp = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER_pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
-- 
2.20.1

