Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.27835.1628536852646904576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 12:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=jbI0p/uB;
 spf=pass (domain: pbarker.dev, ip: 64.147.123.24, mailfrom: paul@pbarker.dev)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id B50553200900;
	Mon,  9 Aug 2021 15:20:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 09 Aug 2021 15:20:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm1; bh=dUOZDMcfF1hQK9IftO/kmumI2j
	asiKQKojAsDhogtHg=; b=jbI0p/uB/hcbqhgqfxKug5kpsoQug0piMC31I66SQb
	BXQ3F/I0J4RD5ztiuYQJcKTcqNRZKG+kMe2j3AbxiGv1q61kUc45SACQhRwkVeov
	5svmh4NHF053pMxNwXiiM7bVj746NFgjQrgveoPjth1U9wPwSARdhHNW+ssbP9Mq
	xRrDXdZ97tyrHeKijEtqmcGOrrODQZI/VtuZYGwqQv+IFLbBd4j4JjPMwWx4t+Zi
	IwZf5p/v9tNSzVm9VHUYxfKyOAqCQtZbJumR2ckaBa+JVt7XE8MzjKyapq+mAzJM
	4GCppoM+sQNvidbjYfYCv/m6qh1rNIgZoD7U+JfwFZ5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dUOZDMcfF1hQK9Ift
	O/kmumI2jasiKQKojAsDhogtHg=; b=mtuXsLgguWAicNSYWpvy8n8VwqGiGNMvF
	2ONliZYMd/UJs+xErZBi5yychZIg44Haz/jfQP9jO/HUx54keB/qWapjwzvtXdJF
	8AGGhcnd9q9msPrHifFmIIWNFburlqmZT834eXgfyZOqo0vm/OUlXxFQ46c8vhmv
	A2+hXobUR2cBjHazXj52XV7E68boGLHEVq+lCbHeJyFwtIlJWNP94YGTh+1Ym/DT
	BVbfpg1aYtb7v7lpXOBKEthRbW0YHOp0sEUH7LvbQQLrQT/7x+zNOW/S2CW2XZfJ
	Q319iDogIGL53wX0P+aAnhRVigfqnFqgrmyC9EdZ5x0ew/ts9GkOg==
X-ME-Sender: <xms:EoARYatUfcDB3jFgbzTgVLVCmjuh62fWlVhqtMy7lyC2zfkoHHayhw>
    <xme:EoARYffKCC9Q72kKpv8gcijmHwqrsqopFXMhADSiS8-n9eHhdFR3VBkyCUx23Alzk
    G705rEIalHHUPAkaBs>
X-ME-Received: <xmr:EoARYVytLDIrODLAQAOGWS-zOksSh7najyQt0hqvogXOULevnQxrO4MrOzCsd9L9ksiAjkfh76-l5EXmhMH4s2fwuzrRDjAjg5WdblsuBP-sPbcignVw6C3Diik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeejgddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepteefleelheeugeejudegiedttddvffdvleefgf
    dvudegkeduleegudeihfeijedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:EoARYVPkeV5__2utct7LCEYL1SF0IbZNCWRaVHgN6Xj6yMjIjoyEUA>
    <xmx:EoARYa-N0G_lkG4pQ_2g_14L4vYe5Rvk0bF_MVhMjSF7QjXe3kj0NQ>
    <xmx:EoARYdUpUttriLklX5lGcQzXuFolnFAIWuj0n61ziIDcZqV8CPXY9g>
    <xmx:E4ARYfGZB5I4x1kaMiNcBQUILvEUvIhI_773KJyr1Gfpc5K-mD5RYw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Aug 2021 15:20:50 -0400 (EDT)
From: "Paul Barker" <paul@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [PATCH] u-boot: Package extlinux.conf separately
Date: Mon,  9 Aug 2021 20:20:42 +0100
Message-Id: <20210809192042.20918-1-paul@pbarker.dev>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A separate u-boot-extlinux package is created for the extlinux.conf file
so that it can be installed on its own if needed. If this package is
populated, it is added as a dependency of the main u-boot package so
that installing just u-boot still results in the extlinux.conf file
being present in the rootfs.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 4340b17cb6..971fdbb102 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -210,7 +210,7 @@ do_install () {
     fi
 }
 
-PACKAGE_BEFORE_PN += "${PN}-env"
+PACKAGE_BEFORE_PN += "${PN}-env ${PN}-extlinux"
 
 RPROVIDES:${PN}-env += "u-boot-default-env"
 ALLOW_EMPTY:${PN}-env = "1"
@@ -219,6 +219,9 @@ FILES:${PN}-env = " \
     ${sysconfdir}/fw_env.config \
 "
 
+FILES:${PN}-extlinux = "${UBOOT_EXTLINUX_INSTALL_DIR}/${UBOOT_EXTLINUX_CONF_NAME}"
+RDEPENDS:${PN} += "${@bb.utils.contains('UBOOT_EXTLINUX', '1', '${PN}-extlinux', '', d)}"
+
 FILES:${PN} = "/boot ${datadir}"
 RDEPENDS:${PN} += "${PN}-env"
 
-- 
2.31.1

