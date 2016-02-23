Return-Path: <Guojian.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 821F97731E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 11:47:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1NBlhIC014061
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 03:47:43 -0800 (PST)
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 23 Feb 2016 03:47:42 -0800
From: <guojian.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Feb 2016 19:47:40 +0800
Message-ID: <1456228061-17206-1-git-send-email-guojian.zhou@windriver.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Subject: [PATCH 1/2] oe-core: Update alternatives of man pages
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
X-List-Received-Date: Tue, 23 Feb 2016 11:47:44 -0000
Content-Type: text/plain

From: Guojian Zhou <guojian.zhou@windriver.com>

Update alternatives of man pages between util-linx and shadow packages.

Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 3 +++
 meta/recipes-extended/shadow/shadow.inc     | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 08ca040..0191bfb 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -201,6 +201,7 @@ ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 
 ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3"
+ALTERNATIVE_${PN}-doc += "eject.1 su.1"
 
 ALTERNATIVE_LINK_NAME[last.1] = "${mandir}/man1/last.1"
 ALTERNATIVE_LINK_NAME[lastb.1] = "${mandir}/man1/lastb.1"
@@ -217,6 +218,8 @@ ALTERNATIVE_LINK_NAME[blkid.8] = "${mandir}/man8/blkid.8"
 ALTERNATIVE_LINK_NAME[findfs.8] = "${mandir}/man8/findfs.8"
 ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
 ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
+ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
 
 ALTERNATIVE_util-linux-hwclock = "hwclock"
 # There seems to be problem, atleast on nslu2, with these, untill they are
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 4313ffe..6b4c9b6 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -179,10 +179,12 @@ ALTERNATIVE_${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 
-ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3 groups.1"
+ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3 groups.1 su.1 nologin.8"
 ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
 ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
 ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
+ALTERNATIVE_LINK_NAME[nologin.8] = "${mandir}/man8/nologin.8"
 
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
-- 
1.7.12.4


