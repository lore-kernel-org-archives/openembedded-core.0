Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4CC76B8DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 06:17:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7M6HRe2021805
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 23:17:27 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 21 Aug 2013 23:17:27 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 14:17:12 +0800
Message-ID: <311185f8dbdd5b79419aa3aae313b0e54b1d30bf.1377151850.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1377151850.git.jackie.huang@windriver.com>
References: <cover.1377151850.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] openssh: add init.d/sshd status command for LSB compliance
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
X-List-Received-Date: Thu, 22 Aug 2013 06:17:27 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../openssh/openssh-6.2p2/init                     |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh-6.2p2/init b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
index 12fb79b..266689c 100644
--- a/meta/recipes-connectivity/openssh/openssh-6.2p2/init
+++ b/meta/recipes-connectivity/openssh/openssh-6.2p2/init
@@ -1,6 +1,9 @@
 #! /bin/sh
 set -e
 
+# source function library
+. /etc/init.d/functions
+
 # /etc/init.d/ssh: start and stop the OpenBSD "secure shell" daemon
 
 test -x /usr/sbin/sshd || exit 0
@@ -92,8 +95,13 @@ case "$1" in
 	echo "."
 	;;
 
+  status)
+	status /usr/sbin/sshd
+	return $?
+  ;;
+
   *)
-	echo "Usage: /etc/init.d/ssh {start|stop|reload|force-reload|restart}"
+	echo "Usage: /etc/init.d/ssh {start|stop|status|reload|force-reload|restart}"
 	exit 1
 esac
 
-- 
1.7.4.1


