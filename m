Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7337FB3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 08:42:52 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w62so822147pfw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 00:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e3lLE4U8JgGYN5vwb3nqBBEn6HS6qBXMNNq30YZg14o=;
	b=Wnq0f2eMWVsqAqvP2HITrNZY7YRgMgtsRclMf2urfLDsQ4Udq7PGDKe3XfNs7H71ce
	+189h6DN0DFLXbZWjQ4nfopal2rrPDq07DQB4pXNSfItkQLtShLpyw9dhfr5KF8u/Giq
	nTmOkfYluD2B5XJ7xyoUwLxh2G9KCZyzcMNO9oJhYAb1nI9u/+RNCdL9Uuu1ymJrbZb2
	Hdbw/4zd3c4D8L1iyL3tZ3e6oG40Yp9gXP1uclrxiCPy5o01+eq6Uk31Y7FKdBTimx1d
	n5pUZ1X7P4lDjo4K4xeCQmg0xwIuYLqwaPa+yHOw9mKJ31Yn/UtNqGSzUPVEPa+02j8X
	+d3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e3lLE4U8JgGYN5vwb3nqBBEn6HS6qBXMNNq30YZg14o=;
	b=kkg5WWH5Vntbv9/7Zhqa6axM4xpu0De10V7OptQHyV9emZWPNXVv9cmvD3Ft4XpY5I
	3X2PzheymgWus8tnX56x7udJV3yUtjAykLgYm7t/IX1rYpPHyCV+tRQYcIbS4p4joJ43
	760N9cDOre+mom4lhn1CEVTJVvYJhaGhWj6oYZyawrr3Gqh1C1Bjz+1Pdbrxltsp6OI4
	BpwIieIqIAtK7YUQ2YmCI6dM1ciuOVZRNjaVcerZ+Ex9LvrUFoFT9rS3RT9U3f4eYsH3
	EJQG1qapVk9MnZxk/pqMp2fHnOvah8i+V58A6IIft1hwqtCG2XCJHEehqsY7aDnlo29P
	M2eQ==
X-Gm-Message-State: APjAAAXjRz3fFUiwmQcBW0a+v9LZ20MiWm+0J7PrLTCo1yM/CusqdsMf
	Um006e+iJS98tAhXOFJzYv8RtVw5
X-Google-Smtp-Source: APXvYqzrpyJq1S3MRnSvd7HzQGsCIqGF2mdlRv4gx28r8BbcPDN5AxTl3l2OaICcMdwMKAVHLjyOOw==
X-Received: by 2002:a63:2fc4:: with SMTP id v187mr1718164pgv.55.1576658573257; 
	Wed, 18 Dec 2019 00:42:53 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	a12sm1988889pga.11.2019.12.18.00.42.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Dec 2019 00:42:52 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 08:42:44 +0000
Message-Id: <1576658565-16680-2-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576658565-16680-1-git-send-email-yamane07ynct@gmail.com>
References: <1576658565-16680-1-git-send-email-yamane07ynct@gmail.com>
Subject: [PATCH v2 2/3] u-boot-tools: Add capability of building from out-of-tree
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
X-List-Received-Date: Wed, 18 Dec 2019 08:42:52 -0000

This patch also helps to build with EXTERNALSRC.

Signed-off-by: Daisuke Yamane <yamane07ynct@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
index bede984..414ee33 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2020.01.bb
@@ -25,14 +25,14 @@ SED_CONFIG_EFI_armeb = ''
 SED_CONFIG_EFI_aarch64 = ''
 
 do_compile () {
-	oe_runmake sandbox_defconfig
+	oe_runmake -C ${S} sandbox_defconfig O=${B}
 
 	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
 	# generating it requires bin2header tool, which for target build
 	# is built with target tools and thus cannot be executed on host.
-	sed -i -e "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" ${SED_CONFIG_EFI} .config
+	sed -i -e "s/CONFIG_CMD_LICENSE=.*/# CONFIG_CMD_LICENSE is not set/" ${SED_CONFIG_EFI} ${B}/.config
 
-	oe_runmake cross_tools NO_SDL=1
+	oe_runmake -C ${S} cross_tools NO_SDL=1 O=${B}
 }
 
 do_install () {
-- 
2.7.4


