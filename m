Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EAED6E3BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 03:29:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1E3U0P7005144
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 19:30:00 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 13 Feb 2014 19:29:59 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Feb 2014 11:30:51 +0800
Message-ID: <1392348651-16466-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] nss: change kernel version from 3.4 to 3.10
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
X-List-Received-Date: Fri, 14 Feb 2014 03:30:00 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Linux kernel 3.10 is used currently

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/nss/nss.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index a6aeed8..e0840c4 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -55,7 +55,7 @@ do_compile() {
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
 
-    export OS_RELEASE=3.4
+    export OS_RELEASE=3.10
     export OS_TARGET=Linux
     export OS_ARCH=Linux
 
@@ -95,7 +95,7 @@ do_install() {
     export NSS_USE_SYSTEM_SQLITE=1
     export NSS_ENABLE_ECC=1
 
-    export OS_RELEASE=3.4
+    export OS_RELEASE=3.10
     export OS_TARGET=Linux
     export OS_ARCH=Linux
 
-- 
1.7.10.4


