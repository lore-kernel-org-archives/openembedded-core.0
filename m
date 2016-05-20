Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA1C60761
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 01:58:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="6725105"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 May 2016 09:58:47 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5D08F489F960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 09:58:44 +0800 (CST)
Received: from localhost.localdomain (10.167.226.24) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 20 May 2016 09:58:43 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <1456614192-11233-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.24]
X-yoursite-MailScanner-ID: 5D08F489F960.ADA5D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] shadow: Fix rootfs creation errors
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
Date: Fri, 20 May 2016 01:58:52 -0000
X-Original-Date: Sun, 28 Feb 2016 02:03:12 +0300
X-List-Received-Date: Fri, 20 May 2016 01:58:52 -0000
Content-Type: text/plain

error: file /usr/share/man/man1/su.1 from install of shadow-doc-4.2.1
           conflicts with file from package coreutils-doc-6.9-r5

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/shadow/shadow.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index d024b01..5605876 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -179,10 +179,11 @@ ALTERNATIVE_${PN}-base = "newgrp groups login su"
 ALTERNATIVE_LINK_NAME[login] = "${base_bindir}/login"
 ALTERNATIVE_LINK_NAME[su] = "${base_bindir}/su"
 
-ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3 groups.1"
+ALTERNATIVE_${PN}-doc = "passwd.5 getspnam.3 groups.1 su.1"
 ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
 ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
 ALTERNATIVE_LINK_NAME[groups.1] = "${mandir}/man1/groups.1"
+ALTERNATIVE_LINK_NAME[su.1] = "${mandir}/man1/su.1"
 
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
-- 
1.8.4.2




