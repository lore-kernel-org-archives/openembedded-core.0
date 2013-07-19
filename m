Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF976B2E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 09:39:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6J9dGT9007161
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 02:39:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 19 Jul 2013 02:39:16 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2013 17:39:26 +0800
Message-ID: <1d0bbe38b84de7dd2208ee54820e12f4e9175db5.1374226651.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1374226651.git.Qi.Chen@windriver.com>
References: <cover.1374226651.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 2/3] run-postinsts: fix comment
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
X-List-Received-Date: Fri, 19 Jul 2013 09:39:16 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The run-postinsts script also handles the #SYSCONFDIR#/rpm-postinsts
directory. Add it to the comment for clarity.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../run-postinsts/run-postinsts/run-postinsts      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index d1bf582..2a8d1d6 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -5,8 +5,8 @@
 # Author: Richard Purdie <rpurdie@openedhand.com>
 #
 
-# The following script will run all the scriptlets found in #SYSCONFDIR#/deb-postinsts or
-# #SYSCONFDIR#/ipk-postinsts
+# The following script will run all the scriptlets found in #SYSCONFDIR#/deb-postinsts,
+# #SYSCONFDIR#/ipk-postinsts or #SYSCONFDIR#/rpm-posinsts.
 
 pi_dir=""
 for pm in rpm deb ipk; do
-- 
1.7.9.5


