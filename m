Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF0AC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 13:16:35 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.50257.1747055791699847648
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 06:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Pl+F4DyN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D29AE439E2;
	Mon, 12 May 2025 13:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747055789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L8bbi0CZzu3KeY2rK+SeGkViVwv2pKUchqvhv/MJ5x4=;
	b=Pl+F4DyNYcMn9AEeetGQGMb04w30sATBawnR9qwbXkREtHAqrtqNw7zEk1IFb2KOSAp+al
	glEr+tsaPym0CKJJoq5hvO+bmoDEJ4nvbGPp0+8IGziJk51JRoZ7Af/r3w8uKaVCgU0XrJ
	6t+5Ar799JOVtQjXWmrkXHHWbKk0nCO08ykiqs8XBwsxT9Z2CgC6pJfcbNWKTkP49gFoFC
	rPzi6/dUCpfKtJUoO04FVBYrRorbBJzRiw0sqFsccI9SfnhOBmXZ7gCKXZdhOo16XN29C8
	KuRO3Ms/DKFoMDiJoRKjLGsc8IT57fVXoOipLw2QBG0D0YOODkCpYUF1UP5sQQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Mon, 12 May 2025 15:16:10 +0200
Subject: [PATCH] linux/cve-exclusion: Update exclusions after kernel update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-mathieu-cve-exclusion-6-12-27-v1-1-840af7f51032@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJn0IWgC/x2MwQqDMBAFf0X23AWzkgj9Fekhxpe6YLUkVQTx3
 409DsPMQRlJkelZHZSwadZlLmAeFYXRz2+wDoVJarG1NcIf/xsVK4cNjD1M612w46KkZWejDLF
 v4J2h8vgmRN3//+51nhfi2XOWbwAAAA==
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747055788; l=39587;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=fYEGD2tsyhqPDWqbl8sEY4APyHfHTtphYVK9xeKrVVo=;
 b=DfP40J1TyxGARDUGp+31lgLx82lI2KzgUcskQgwWRjF5Jww0JxFN1xiZcv3ptMeupdV6/cQ0x
 1MJ3ehcDP4qC5fEw3Xga4kLqJEJ81T6eYQCW+CkRlRSRvAGUwJmngbF
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddufeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomhepofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelledtieffheelveefueffkefgheevvdeugedutdekfeeghffhfffftdegudfhteenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepsghruhgtvgdrrghshhhfihgvlhgusehgmhgrihhlr
 dgtohhmpdhrtghpthhtohepphgvthgvrhdrmhgrrhhkohesshhivghmvghnshdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 13:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216366

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc | 920 ++++++++++++++++++++++-
 1 file changed, 907 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 5249572cd4d5..656d1f68981f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-04-27 09:28:35.170900+00:00 for version 6.12.23
+# Generated at 2025-05-12 13:07:15.166162+00:00 for version 6.12.27
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.23"
+    this_version = "6.12.27"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -48,6 +48,10 @@ CVE_STATUS[CVE-2020-36788] = "fixed-version: Fixed from version 5.15"
 
 CVE_STATUS[CVE-2020-36789] = "fixed-version: Fixed from version 5.10"
 
+CVE_STATUS[CVE-2020-36790] = "fixed-version: Fixed from version 5.9"
+
+CVE_STATUS[CVE-2020-36791] = "fixed-version: Fixed from version 5.5.14"
+
 # CVE-2021-28688 has no known resolution
 
 # CVE-2021-28691 has no known resolution
@@ -1526,6 +1530,8 @@ CVE_STATUS[CVE-2021-4453] = "fixed-version: Fixed from version 5.16"
 
 CVE_STATUS[CVE-2021-4454] = "fixed-version: Fixed from version 6.2"
 
+CVE_STATUS[CVE-2022-21546] = "fixed-version: Fixed from version 5.19"
+
 # CVE-2022-26365 has no known resolution
 
 # CVE-2022-33740 has no known resolution
@@ -2098,8 +2104,6 @@ CVE_STATUS[CVE-2022-48915] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48916] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48917] = "fixed-version: Fixed from version 5.16.13"
-
 CVE_STATUS[CVE-2022-48918] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48919] = "fixed-version: Fixed from version 5.17"
@@ -3740,6 +3744,342 @@ CVE_STATUS[CVE-2022-49760] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-49761] = "fixed-version: Fixed from version 6.2"
 
+CVE_STATUS[CVE-2022-49762] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49763] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49764] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49765] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49766] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49767] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49768] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49769] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49770] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49771] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49772] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49773] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49774] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49775] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49776] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49777] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49778] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49779] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49780] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49781] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49782] = "fixed-version: Fixed from version 6.0.10"
+
+CVE_STATUS[CVE-2022-49783] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49784] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49785] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49786] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49787] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49788] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49789] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49790] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49791] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49792] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49793] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49794] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49795] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49796] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49797] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49798] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49799] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49800] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49801] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49802] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49803] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49804] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49805] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49806] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49807] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49808] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49809] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49810] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49811] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49812] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49813] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49814] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49815] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49817] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49818] = "fixed-version: Fixed from version 6.0.10"
+
+CVE_STATUS[CVE-2022-49819] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49820] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49821] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49822] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49823] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49824] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49825] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49826] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49827] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49828] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49829] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49830] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49831] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49832] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49833] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49834] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49835] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49836] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49837] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49838] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49839] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49840] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49841] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49842] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49844] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49845] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49846] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49847] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49848] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49849] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49850] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49851] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49852] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49853] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49854] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49855] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49857] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49858] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49859] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49860] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49861] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49862] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49863] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49864] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49865] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49866] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49867] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49868] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49869] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49870] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49871] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49872] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49873] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49874] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49875] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49876] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49877] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49878] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49879] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49880] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49881] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49882] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49883] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49884] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49885] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49886] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49887] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49888] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49889] = "fixed-version: Fixed from version 6.0.8"
+
+CVE_STATUS[CVE-2022-49890] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49891] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49892] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49893] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49894] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49895] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49896] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49898] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49899] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49900] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49901] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49902] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49903] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49904] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49905] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49906] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49907] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49908] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49909] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49910] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49911] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49912] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49913] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49914] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49915] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49916] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49917] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49918] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49919] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49920] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49921] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49922] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49923] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49924] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49925] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49926] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49927] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49928] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49929] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49930] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49931] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-49932] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-49933] = "fixed-version: Fixed from version 6.3"
+
 # CVE-2023-34319 has no known resolution
 
 # CVE-2023-34324 has no known resolution
@@ -4734,6 +5074,216 @@ CVE_STATUS[CVE-2023-53033] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-53034] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2023-53035] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53036] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53037] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53038] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53039] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53040] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53041] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53042] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53043] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53044] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53045] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53046] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53047] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53048] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53049] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53050] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53051] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53052] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53053] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53054] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53055] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53056] = "fixed-version: Fixed from version 6.2.9"
+
+CVE_STATUS[CVE-2023-53057] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53058] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53059] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53060] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53061] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53062] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53064] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53065] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53066] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53067] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53068] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53069] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53070] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53071] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53072] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53073] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53074] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53075] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53077] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53078] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53079] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53080] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53081] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53082] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53083] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53084] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53085] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53086] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53087] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53088] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53089] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53090] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53091] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53092] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53093] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53094] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53095] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53096] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53097] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53098] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53099] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53100] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53101] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53102] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53103] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53105] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53106] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53107] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53108] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53109] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53110] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53111] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53112] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53113] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53114] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53115] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53116] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53117] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53118] = "fixed-version: Fixed from version 6.2.8"
+
+CVE_STATUS[CVE-2023-53119] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53120] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53121] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53123] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53124] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53125] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53126] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53127] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53128] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53131] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53132] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53133] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53134] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53135] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53136] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53137] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53138] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53139] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53140] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53141] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53142] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53143] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53144] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53145] = "fixed-version: Fixed from version 6.3"
+
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26582] = "fixed-version: Fixed from version 6.8"
@@ -6826,8 +7376,6 @@ CVE_STATUS[CVE-2024-39499] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-39500] = "fixed-version: Fixed from version 6.10"
 
-CVE_STATUS[CVE-2024-39501] = "fixed-version: Fixed from version 6.10"
-
 CVE_STATUS[CVE-2024-39502] = "fixed-version: Fixed from version 6.10"
 
 CVE_STATUS[CVE-2024-39503] = "fixed-version: Fixed from version 6.10"
@@ -8974,8 +9522,6 @@ CVE_STATUS[CVE-2024-50014] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50015] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-50016] = "fixed-version: Fixed from version 6.12"
-
 CVE_STATUS[CVE-2024-50017] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-50019] = "fixed-version: Fixed from version 6.12"
@@ -10878,6 +11424,14 @@ CVE_STATUS[CVE-2024-58092] = "cpe-stable-backport: Backported in 6.12.22"
 
 # CVE-2024-58097 needs backporting (fixed from 6.15rc1)
 
+CVE_STATUS[CVE-2024-58098] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2024-58099] = "fixed-version: Fixed from version 6.12"
+
+CVE_STATUS[CVE-2024-58100] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2024-58237] = "cpe-stable-backport: Backported in 6.12.9"
+
 CVE_STATUS[CVE-2025-21629] = "cpe-stable-backport: Backported in 6.12.9"
 
 CVE_STATUS[CVE-2025-21631] = "cpe-stable-backport: Backported in 6.12.10"
@@ -11660,14 +12214,12 @@ CVE_STATUS[CVE-2025-22024] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22025] = "cpe-stable-backport: Backported in 6.12.23"
 
-# CVE-2025-22026 needs backporting (fixed from 6.12.24)
+CVE_STATUS[CVE-2025-22026] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-22027] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-22028] = "cpe-stable-backport: Backported in 6.12.23"
 
-CVE_STATUS[CVE-2025-22029] = "cpe-stable-backport: Backported in 6.12.23"
-
 CVE_STATUS[CVE-2025-22030] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-22031] = "fixed-version: only affects 6.13 onwards"
@@ -11860,7 +12412,7 @@ CVE_STATUS[CVE-2025-22120] = "fixed-version: only affects 6.13 onwards"
 
 # CVE-2025-22125 needs backporting (fixed from 6.15rc1)
 
-# CVE-2025-22126 needs backporting (fixed from 6.12.25)
+CVE_STATUS[CVE-2025-22126] = "cpe-stable-backport: Backported in 6.12.25"
 
 # CVE-2025-22127 needs backporting (fixed from 6.15rc1)
 
@@ -11886,12 +12438,354 @@ CVE_STATUS[CVE-2025-23136] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-23138] = "cpe-stable-backport: Backported in 6.12.23"
 
+CVE_STATUS[CVE-2025-23140] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-23141] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23142] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23143] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23144] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23145] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23146] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23147] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23148] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23149] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23150] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23151] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23152] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-23153] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-23154] = "cpe-stable-backport: Backported in 6.12.24"
+
+# CVE-2025-23155 needs backporting (fixed from 6.15rc1)
+
+CVE_STATUS[CVE-2025-23156] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23157] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23158] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23159] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23160] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23161] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23162] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-23163] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37738] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37739] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37740] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37741] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37742] = "cpe-stable-backport: Backported in 6.12.24"
+
+# CVE-2025-37743 needs backporting (fixed from 6.15rc1)
+
+CVE_STATUS[CVE-2025-37744] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37745] = "cpe-stable-backport: Backported in 6.12.24"
+
+# CVE-2025-37746 needs backporting (fixed from 6.15rc1)
+
+CVE_STATUS[CVE-2025-37747] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37748] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37749] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37750] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37751] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37752] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37753] = "fixed-version: only affects 6.15rc1 onwards"
+
+CVE_STATUS[CVE-2025-37754] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37755] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37756] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37757] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37758] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37759] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37760] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37761] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37762] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37763] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37764] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37765] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37766] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37767] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37768] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37769] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37770] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37771] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37772] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37773] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37774] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37775] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37776] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37777] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37778] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37779] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37780] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37781] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37782] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37783] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37784] = "fixed-version: only affects 6.13 onwards"
+
 CVE_STATUS[CVE-2025-37785] = "cpe-stable-backport: Backported in 6.12.23"
 
-# CVE-2025-37838 needs backporting (fixed from 6.12.24)
+CVE_STATUS[CVE-2025-37786] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37787] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37788] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37789] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37790] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37791] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37792] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37793] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37794] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37796] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37797] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37798] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37799] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37800] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37801] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37802] = "cpe-stable-backport: Backported in 6.12.26"
+
+# CVE-2025-37803 needs backporting (fixed from 6.15rc2)
+
+CVE_STATUS[CVE-2025-37804] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37805] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37806] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37807] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37808] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37809] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37810] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37811] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-37812] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37813] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-37814] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37815] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-37816] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37817] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37818] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37819] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37820] = "cpe-stable-backport: Backported in 6.12.26"
+
+# CVE-2025-37821 needs backporting (fixed from 6.15rc4)
+
+CVE_STATUS[CVE-2025-37822] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37823] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37824] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37825] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37826] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37827] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37828] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37829] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37830] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37831] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37832] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37833] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37834] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37836] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37837] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37838] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37839] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37840] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37841] = "cpe-stable-backport: Backported in 6.12.24"
+
+# CVE-2025-37842 needs backporting (fixed from 6.15rc1)
+
+CVE_STATUS[CVE-2025-37843] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37844] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37845] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37846] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37847] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37848] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37849] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37850] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37851] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37852] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37853] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37854] = "cpe-stable-backport: Backported in 6.12.24"
+
+# CVE-2025-37855 needs backporting (fixed from 6.15rc1)
+
+CVE_STATUS[CVE-2025-37856] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37857] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37858] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37859] = "cpe-stable-backport: Backported in 6.12.24"
 
 # CVE-2025-37860 needs backporting (fixed from 6.15rc1)
 
+CVE_STATUS[CVE-2025-37861] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37862] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37863] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37864] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37865] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37866] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37867] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37868] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37869] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37870] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37871] = "fixed-version: only affects 6.15rc1 onwards"
+
+CVE_STATUS[CVE-2025-37872] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37873] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37874] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37875] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37876] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37877] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37878] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37879] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37880] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37881] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37882] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37883] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37884] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37885] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37886] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37887] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37888] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37889] = "cpe-stable-backport: Backported in 6.12.20"
+
 CVE_STATUS[CVE-2025-37893] = "cpe-stable-backport: Backported in 6.12.23"
 
 # CVE-2025-37925 needs backporting (fixed from 6.15rc1)

---
base-commit: 0dfdaca8405f4f1a9c188f736a99c39b7f8272b3
change-id: 20250512-mathieu-cve-exclusion-6-12-27-65f2dfb3ea61

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


