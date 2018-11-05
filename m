Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id EA0BE79D59
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 05:39:56 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 206C51C001F;
	Mon,  5 Nov 2018 18:39:55 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Nov 2018 18:39:41 +1300
Message-Id: <20181105053941.19098-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] Reproducible build: Comment only: do_deploy_source_date_epoch task
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
X-List-Received-Date: Mon, 05 Nov 2018 05:39:57 -0000

Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe's SDE_FILE.
If none of the existing mechanisms are suitable, replace the do_deploy_source_date_epoch task
with recipe-specific functionality to write the appropriate SOURCE_DATE_EPOCH into the SDE_FILE.
---
 meta/classes/reproducible_build.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 4f3680a376..0eb696ac78 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -24,7 +24,10 @@
 #
 # 4. If the above steps fail, use the modification time of the youngest file in the source tree.
 #
-# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe's ${SDE_FILE}.
+# Once the value of SOURCE_DATE_EPOCH is determined, it is stored in the recipe's SDE_FILE.
+# If none of these mechanisms are suitable, replace the do_deploy_source_date_epoch task
+# with recipe-specific functionality to write the appropriate SOURCE_DATE_EPOCH into the SDE_FILE.
+#
 # If this file is found by other tasks, the value is exported in the SOURCE_DATE_EPOCH variable.
 # SOURCE_DATE_EPOCH is set for all tasks that might use it (do_configure, do_compile, do_package, ...)
 
-- 
2.17.1


