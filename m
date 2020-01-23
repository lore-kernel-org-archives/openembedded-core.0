Return-Path: <yamane07ynct@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id B86A97F365
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 10:33:35 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id p14so1344689pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 02:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=e3lLE4U8JgGYN5vwb3nqBBEn6HS6qBXMNNq30YZg14o=;
	b=BfwKG+TZhZRE1n6l2k/bC/Rz2k9r5XBDxJZ9u1OCqWW13HakqXVxVZ1Cgd+2DnmY3c
	WX3mvzjRCCjgVkmb7TnFodSW86wKQZDp8+sGteRSFfc6BRxj/SMEKQaAphDEgiR00yYc
	i9hyiJ03CG8tWBKQBqtRXJX6qQ3zzdoOUwPmT2Rz1S12b8rdE0TZjHSMYql4vZikfokh
	9xigWTX8La0ig55UC506KWz1/wx+u867NFmJodcqChWbX2wx8q2cbSyxDNKq/L04vEK4
	fnrZj3MHdkYJNYiivQinx50YM1KOpjoX4xeAYdZ+TJeULUXfdYOKO0fnb/GvctAyjyZw
	QEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=e3lLE4U8JgGYN5vwb3nqBBEn6HS6qBXMNNq30YZg14o=;
	b=fXE7pSZk/yw+WJORDdGaQq4m2pKXrOUCTxAK9FtFvOb4j6HMTX2N1OGsIhQFVkYm5e
	SeoGKMyxPxUgyVvpCh4DdpWlAb8pjmxW3Kx17kbNASv31MXktfsblkLZghRC6B4B0FaE
	dFMvBfI8kvo9GOytuQFdndhhVVYLWSh608DNTDFjzmZVGY5HZYeZDup9ph91TzHRpnAJ
	bbJVkGomTR38SGxZjv4lWg0bxL/yfOEYQBMRVIXvKzX+ik3NxHr0Pc1SAxvXepbyq+Bw
	o+/4jGLxGThdkwoC/WjSIa8+7OJg+IvGEba3qwdzXqVKowvc7bp7uXoBXoE6obZAcH4N
	KN5w==
X-Gm-Message-State: APjAAAWHLzHPWZ7/oOu6sh41dx0tRnsN4dpmMw1QYrUzbJU0QM8HzE8k
	l0IdaUkDOyh47VUAp961LPqyqKJX
X-Google-Smtp-Source: APXvYqy+AAcVtKwxBZywjbvA1ij76ml3dq6HDuPkGZ+HWwYh6hXLpOEeaHvUJTGMcqjIIfxwiSZJGg==
X-Received: by 2002:a62:5214:: with SMTP id g20mr6726286pfb.101.1579775616700; 
	Thu, 23 Jan 2020 02:33:36 -0800 (PST)
Received: from localhost.localdomain (softbank060117076056.bbtec.net.
	[60.117.76.56]) by smtp.gmail.com with ESMTPSA id
	dw10sm2253176pjb.11.2020.01.23.02.33.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jan 2020 02:33:36 -0800 (PST)
From: Daisuke Yamane <yamane07ynct@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 10:33:32 +0000
Message-Id: <1579775613-23857-1-git-send-email-yamane07ynct@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v5 1/2] u-boot-tools: Add capability of building from out-of-tree
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
X-List-Received-Date: Thu, 23 Jan 2020 10:33:35 -0000

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


