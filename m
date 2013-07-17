Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0767F6B1D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 09:09:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6H99V16017541
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 02:09:32 -0700 (PDT)
Received: from localhost (128.224.162.215) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 17 Jul 2013 02:09:31 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jul 2013 17:09:24 +0800
Message-ID: <55deaf5fb61cf1ea697beb1126f8a5177864f9cb.1374051740.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374051740.git.yi.zhao@windriver.com>
References: <cover.1374051740.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.215]
Subject: [PATCH 1/2] run-postinsts: Fix typo
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
X-List-Received-Date: Wed, 17 Jul 2013 09:09:31 -0000
Content-Type: text/plain

Fix a typo for stderr redirection.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../run-postinsts/run-postinsts/run-postinsts      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 2593066..d1bf582 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -26,7 +26,7 @@ for i in `ls $pi_dir`; do
 	echo "Running postinst $i..."
 	if [ -x $i ]; then
 		if [ "$POSTINST_LOGGING" = "1" ]; then
-			sh -c $i >>$LOGFILE 2&>1
+			sh -c $i >>$LOGFILE 2>&1
 		else
 			sh -c $i
 		fi
-- 
1.7.9.5


