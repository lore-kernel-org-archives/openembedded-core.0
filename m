Return-Path: <Yue.Tao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCF3C6D875
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 07:54:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAR7smRs005251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 23:54:48 -0800 (PST)
Received: from localhost.localdomain (128.224.162.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 26 Nov 2013 23:54:48 -0800
From: Yue Tao <Yue.Tao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Nov 2013 15:55:43 +0800
Message-ID: <1385538944-8585-4-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
References: <1385538944-8585-1-git-send-email-Yue.Tao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Subject: [PATCH 4/5] cronie: fix init.d/crond status return value
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
X-List-Received-Date: Wed, 27 Nov 2013 07:54:48 -0000
Content-Type: text/plain

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 meta/recipes-extended/cronie/cronie/crond.init |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie/crond.init b/meta/recipes-extended/cronie/cronie/crond.init
index c8dffef..53b8514 100755
--- a/meta/recipes-extended/cronie/cronie/crond.init
+++ b/meta/recipes-extended/cronie/cronie/crond.init
@@ -43,11 +43,8 @@ case "$1" in
     fi
     ;;
   status)
-    if [ -n "`/bin/pidof $CROND`" ] ; then
-        echo "crond is running."
-    else
-        echo "crond is not running."
-    fi
+    status crond
+    exit $?
     ;;
   restart)
     $0 stop && sleep 1 && $0 start
-- 
1.7.5.4


