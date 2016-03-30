Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6E36FF9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 07:23:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2U7NHkl002149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 00:23:17 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 30 Mar 2016 00:23:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Mar 2016 00:23:12 -0700
Message-ID: <95c58580b5700d138d32ba21cb1e488296ff5282.1459322435.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459322435.git.liezhi.yang@windriver.com>
References: <cover.1459322435.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] image-vm.bbclass: remove invalid code
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
X-List-Received-Date: Wed, 30 Mar 2016 07:23:17 -0000
Content-Type: text/plain

It has been done in syslinux.bbclass.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image-vm.bbclass | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 66712a6..326dc04 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -61,13 +61,6 @@ build_boot_dd() {
 		efi_hddimg_populate $HDDDIR
 	fi
 
-	if [ "x${AUTO_SYSLINUXMENU}" = "x1" ] ; then
-		install -m 0644 ${STAGING_DIR}/${MACHINE}/usr/share/syslinux/vesamenu.c32 $HDDDIR/${SYSLINUXDIR}/
-		if [ "x${SYSLINUX_SPLASH}" != "x" ] ; then
-			install -m 0644 ${SYSLINUX_SPLASH} $HDDDIR/${SYSLINUXDIR}/splash.lss
-		fi
-	fi
-
 	BLOCKS=`du -bks $HDDDIR | cut -f 1`
 	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
 
-- 
2.7.4


