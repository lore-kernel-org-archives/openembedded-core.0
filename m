Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33DDD784F4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 02:46:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w562k3RN009485
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2018 19:46:18 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 5 Jun 2018 19:45:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2018 10:54:39 +0800
Message-ID: <147e74c43063db9838d27cfa0a36a6d2246a5a27.1528252931.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528252931.git.liezhi.yang@windriver.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 04/11] xinetd: add Init Script Actions to xinetd script
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
X-List-Received-Date: Wed, 06 Jun 2018 02:46:27 -0000
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
2.7.4


