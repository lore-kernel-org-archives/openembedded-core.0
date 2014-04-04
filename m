Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9715060D71
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 00:26:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s340QBbF012462
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Apr 2014 17:26:11 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 3 Apr 2014 17:26:10 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Apr 2014 08:26:12 +0800
Message-ID: <1396571172-13968-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] sysvinit: fix the bootlogd init script header
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
X-List-Received-Date: Fri, 04 Apr 2014 00:26:17 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

fix the bootlogd init script header, to make chkconfig be able to work
on bootlogd

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-core/sysvinit/sysvinit/bootlogd.init |   18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
index b181357..7d6518d 100755
--- a/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
+++ b/meta/recipes-core/sysvinit/sysvinit/bootlogd.init
@@ -1,12 +1,16 @@
 #! /bin/sh
+### BEGIN INIT INFO
+# Provides:          bootlogd
+# Required-Start:
+# Required-Stop:
+# Default-Start:     S
+# Default-Stop:      2 3 4 5
+# Short-Description: One of the first scripts to be executed. Starts or stops
+#               the bootlogd log program. If this script is called as
+#               "stop-bootlogd", it will stop the daemon instead of
+#               starting it even when called with the "start" argument.
 #
-# bootlogd	One of the first scripts to be executed. Starts or stops
-#		the bootlogd log program. If this script is called as
-#		"stop-bootlogd", it will stop the daemon instead of
-#		starting it even when called with the "start" argument.
-#
-# Version:	@(#)bootlogd  2.85-12  21-Mar-2004  miquels@cistron.nl
-#
+### END INIT INFO
 
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 DAEMON=/sbin/bootlogd
-- 
1.7.10.4


