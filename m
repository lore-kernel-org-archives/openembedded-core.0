Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id C0DC674A37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 02:07:45 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id p3-v6so1652319itc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2018 19:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=chs1UROn3eP/K+X6X792Onr1EQkVnub66qpTL8XdM3E=;
	b=Dnby+oSmQrJUGoFlJtMCf+4ge1KghR9NLWhvnCKdrJuKnAghmmYLnxbeLDVl8e73lQ
	i+ViWOTtQtFUVYSKfNEb2clDiHbKyC6GlhZ9z4EMUMtCHSm+reWQZNc5tjVD69t+DkRr
	xiJ5/RPbJaxJnlxstnfo6CgJdUiNQJdDUpSKKKiy5oCxZcov474GHmtMxxaRo9TaSKtb
	7lVBhTItyOQ3Y+e8QI+Wi6TUVnNDu4FYtTAn+EvxC8Qr3YR5Q0my2EIE6BukK8R+sizw
	YdzhV8p//km9cZVjwwF0U4Nw/reVSO/M3ig6RRDMgABDZ2qD/I83k+qaP7bplWn2+qaK
	Pgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=chs1UROn3eP/K+X6X792Onr1EQkVnub66qpTL8XdM3E=;
	b=OMLqkKgkZJc8fFche/WUO+n9y2lhAdmmOvufwZcjV/1xn33le3Z9GTXA4dQQahZ98O
	uzXdx2Fg2PNqcuNZW8vLZUxBjl2IQNK+/zFvYGI5ekin8vq2bgr9zzzY12UeMKIRO6Wy
	1W9i9owwZp7HyukDAcmXJdmNKuXfmZ92H7CeoGnf/J5cDjz1Omg+P1cqOVgcUkSMXa8r
	xGQge9VoObPfiSHmkKWzc0omdy8q7GZmLe7AhHXLJFDec3ijAXxs2saiZOKovRJTGotl
	NJfzsxcFS+d4JJzrYsZU21xkVXfxmM0gEvBjTgGIwkmSDFyODEaoB3IBJFsSKe5sAmzP
	e1cw==
X-Gm-Message-State: ALQs6tDW3yXO0GThUE8etFYtanqHJMYcdFIqKYB3O0XuUOsETAzhRPHw
	9ggHC1C5is0WRGOUIAv/QOOHOaHt
X-Google-Smtp-Source: AB8JxZrKF96V4RjmbhGMta4maQfE8se5kmDCMJXNqdSMcOJKbpI3Xzo/dbhgrdSK+/TcO4T/eqdIRg==
X-Received: by 2002:a24:10c:: with SMTP id 12-v6mr7893098itk.17.1525399666235; 
	Thu, 03 May 2018 19:07:46 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o205-v6sm497718itd.2.2018.05.03.19.07.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 May 2018 19:07:45 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2018 22:07:37 -0400
Message-Id: <20180504020737.20586-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [PATCH] u-boot: remove upstreamed patch
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
X-List-Received-Date: Fri, 04 May 2018 02:07:46 -0000

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../files/MPC8315ERDB-enable-DHCP.patch       | 19 -------------------
 .../u-boot/u-boot-common_2018.01.inc          |  4 +---
 2 files changed, 1 insertion(+), 22 deletions(-)
 delete mode 100644 meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch

diff --git a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch b/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
deleted file mode 100644
index ecaa1796a4..0000000000
--- a/meta/recipes-bsp/u-boot/files/MPC8315ERDB-enable-DHCP.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Enabled dhcp client functionality for Yocto reference
-hardware MPC8315E-RDB.
-
-Upstream-Status: Pending
-
-Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
-
-Index: git/configs/MPC8315ERDB_defconfig
-===================================================================
---- git.orig/configs/MPC8315ERDB_defconfig
-+++ git/configs/MPC8315ERDB_defconfig
-@@ -12,6 +12,7 @@ CONFIG_CMD_PCI=y
- CONFIG_CMD_SATA=y
- CONFIG_CMD_USB=y
- # CONFIG_CMD_SETEXPR is not set
-+CONFIG_CMD_DHCP=y
- CONFIG_CMD_MII=y
- CONFIG_CMD_PING=y
- CONFIG_CMD_DATE=y
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
index d2073ea0c7..2cf66f4f1d 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.01.inc
@@ -9,8 +9,6 @@ PE = "1"
 # repo during parse
 SRCREV = "f3dd87e0b98999a78e500e8c6d2b063ebadf535a"
 
-SRC_URI = "git://git.denx.de/u-boot.git \
-    file://MPC8315ERDB-enable-DHCP.patch \
-"
+SRC_URI = "git://git.denx.de/u-boot.git"
 
 S = "${WORKDIR}/git"
-- 
2.17.0.rc2.3.gc2a499e6c


