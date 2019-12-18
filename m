Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 81F807FE67
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 09:58:02 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id z16so942029pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 01:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e3lLE4U8JgGYN5vwb3nqBBEn6HS6qBXMNNq30YZg14o=;
	b=DRKc5sG10+kL8q508M+UmxUdut6bHsA1uRljHNosOX5f1s+YhFOJzWxFdiP67rY3mQ
	GJhED7EQb1xdcRTd63OCrOuK98g2bvlV/NYUfehvBdi9+VAGI/IxD345eptd+PE1mu9F
	DKH5foCh4xUvV+Rr8SS6Z+5/scxYiHrUzXzusVQxh8BWd8y3vF6foaSixe1kZYLsVIrl
	BkxAXWf+imE+RtfwMmMoCTzHVwpRR+ACNwQOiBBzTEXx/IR3Fp2gxop+PWx+0sc2IqLe
	YO3AqhGSA9opnjNK4/ezvUD/IIU8sDOtwBawtkqec5YSxILNBfC/A1092C2Gp8pITOIO
	5nfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e3lLE4U8JgGYN5vwb3nqBBEn6HS6qBXMNNq30YZg14o=;
	b=mdcA2vbDLwHIGZrYP/oFTiWs+p2HfplxfKy87XQ8AbMck0A3RMQqIyenpjm0bbKGks
	2T1ZKhXfxL2lM/huje3uUyptBT0H9vHMI4NDG3wbUSUlFOQMr74OYrUsxpF0mX67MJed
	Cp1l6weeO765A8K9M4K7+AyDd391eKGusTMt9LK4k5uMmuzrMms0LD7nHSikL65OPWZF
	xrDlA9LwjW/XxdwEPjtRQOFtEwAy+ZQmReXuUdAPKIHSyjWpNtqc86p+bdtGM/OmsYrA
	7lsjHarhAgKi3QehEKD6cvRkf/uyaCFz0kO1Loe+XbFIbxpVGASHFOyjEBva7HMe2655
	9r3A==
X-Gm-Message-State: APjAAAVph1OgTM6wIFypeJBKyQAVTqFjWGQ9zkx30DFMezhoa6S8S2zW
	GCUlwJfGOuemlOSTPb6VZpV8XuPN
X-Google-Smtp-Source: APXvYqyOX2j5fpGm+C5ezJd+mWeK2zfTrrOdhuKzeewq7CDZ4q6mZk+sEcjlifcwbuzSRRMpi5q/bQ==
X-Received: by 2002:aa7:9306:: with SMTP id 6mr1923210pfj.36.1576663083809;
	Wed, 18 Dec 2019 01:58:03 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	j38sm2411501pgj.27.2019.12.18.01.58.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Dec 2019 01:58:03 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 09:57:49 +0000
Message-Id: <1576663070-30914-2-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576663070-30914-1-git-send-email-yamane07ynct@gmail.com>
References: <1576663070-30914-1-git-send-email-yamane07ynct@gmail.com>
Subject: [PATCH v3 2/3] u-boot-tools: Add capability of building from out-of-tree
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
X-List-Received-Date: Wed, 18 Dec 2019 09:58:03 -0000

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


