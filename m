Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CFE7B70738
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Aug 2014 06:11:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7I6BqUR029914
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 23:11:52 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 17 Aug 2014 23:11:51 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Aug 2014 23:11:48 -0700
Message-ID: <99c55de8e07d47988da8f8825c9972b0647eca1b.1408342098.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408342098.git.liezhi.yang@windriver.com>
References: <cover.1408342098.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] syslinux: add perl to RDEPENDS_syslinux-misc
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
X-List-Received-Date: Mon, 18 Aug 2014 06:11:55 -0000
Content-Type: text/plain

These scripts are perl:
syslinux-misc/usr/bin/md5pass
syslinux-misc/usr/bin/isohybrid.pl
syslinux-misc/usr/bin/pxelinux-options
syslinux-misc/usr/bin/keytab-lilo
syslinux-misc/usr/bin/sha1pass
syslinux-misc/usr/bin/syslinux2ansi
syslinux-misc/usr/bin/mkdiskimage
syslinux-misc/usr/bin/lss16toppm
syslinux-misc/usr/bin/ppmtolss16

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/syslinux/syslinux_6.01.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
index 7885390..20afae9 100644
--- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
+++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
@@ -66,6 +66,7 @@ do_install() {
 PACKAGES += "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${PN}-isolinux ${PN}-misc"
 
 RDEPENDS_${PN} += "mtools"
+RDEPENDS_${PN}-misc += "perl"
 
 FILES_${PN} = "${bindir}/syslinux"
 FILES_${PN}-extlinux = "${sbindir}/extlinux"
-- 
1.7.9.5


