Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1A94731DA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 04:21:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8D4LxKE028088
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 21:21:59 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 12 Sep 2016 21:21:58 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2016 12:19:08 +0800
Message-ID: <1473740348-31600-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] xinetd: add Init Script Actions to xinetd script
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
X-List-Received-Date: Tue, 13 Sep 2016 04:22:01 -0000
Content-Type: text/plain

From: Shan Hai <shan.hai@windriver.com>

The chkconfig fails to list the xinetd service because the xinetd
lacks Init Script Actions in it, add the actions to fix it.

Signed-off-by: Shan Hai <shan.hai@windriver.com>
Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/xinetd/xinetd/xinetd.init | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.init b/meta/recipes-extended/xinetd/xinetd/xinetd.init
index 777c2c8..a021410 100644
--- a/meta/recipes-extended/xinetd/xinetd/xinetd.init
+++ b/meta/recipes-extended/xinetd/xinetd/xinetd.init
@@ -1,5 +1,15 @@
 #!/bin/sh
-#
+### BEGIN INIT INFO
+# Provides:          inetd
+# Required-Start:    $local_fs $remote_fs
+# Required-Stop:     $local_fs $remote_fs
+# Should-Start:      $syslog
+# Should-Stop:       $syslog
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Start or stop the xinetd daemon.
+### END INIT INFO
+
 # /etc/init.d/xinetd  --  script to start and stop xinetd.
 
 # Source function library.
-- 
2.8.1


