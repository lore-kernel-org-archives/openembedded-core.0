Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B45ED731B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 10:58:13 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c82so9899019wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 03:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V5+kyy/YCWMepinXLZRVDsL92JHCMlUeQQYGKpNDm34=;
	b=TbGm7QjMsn2lTk4sN/VuhNO2zXHJWqOHuJ+mccfjPz5uJ2ykG+Carbdzcf5nsawA4o
	zGgfbkpX9rP4UgA/qWi4hjVR5vaKQ1uvIBJkUle0QwMl7pFaIbRa8igVuhnroCJs0Ixb
	sOzYsBHYLyjK8MwmmNPtHZsmY/boPjG2jmXzwtpO2mKBy9SBu8Fi8wbG9i/JTag3AA3d
	3qCwg8y33dt6mfNK3/8NYWwBJdJCMA+tpsUoB9OccpNrPjFYl37B2KQjFYDnX19EDUof
	uwk+xTGCv+RM9tX2KaGAWTg9H8i5ksHdmAPuNJ4ZgYCxVrl1XEBRxlBGOzKWB0wR0t6y
	/+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V5+kyy/YCWMepinXLZRVDsL92JHCMlUeQQYGKpNDm34=;
	b=iSeG0nwiz9QnVtbdsgBKaSLNqXiV1ZF10UR68AGW3XL6Np9y44VoNHb7fedNmPf4hq
	O9SXlsNsmWBnNpockLKv7olCehwmxIMCWENyoZ+nATGfjIyWzDcbbHBV17y0oXXVsedW
	vWtRb1D4ijQLJq82u/nowWFYpV2UbKk8OgT3NB4sIr029N9Iv3KzrXFVozhKSXQiYT2P
	QZKNxlpTdWFs6et8X4ZJE99myIwBVnoG9eL/qAyxmpe+GFpkgRWwaJzzmfUxns/7BAbG
	9TsCd8H/qCLBmEwd8DY/gIkg6u9ky9EMtMi4TebofUaGg5/LZpxWODxxJ/aa8QEF2Czw
	xwwA==
X-Gm-Message-State: ALyK8tKCihMamhKj2f0NC13js9lAXeJOq6apToQBG40kFzom3a0krAfvyqP/R66P925viA==
X-Received: by 10.194.164.98 with SMTP id yp2mr27601850wjb.85.1466679493616;
	Thu, 23 Jun 2016 03:58:13 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	x10sm3833035wjj.14.2016.06.23.03.58.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jun 2016 03:58:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2016 12:58:39 +0200
Message-Id: <20160623105839.27075-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160622155839.GC4153@jama>
References: <20160622155839.GC4153@jama>
Subject: [PATCH] test-dependencies.sh: Strip also '\.bb; .*' before adding failed recipe to list of failed
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
X-List-Received-Date: Thu, 23 Jun 2016 10:58:16 -0000

* format of bitbake tasks changed in:
  2c88afb   taskdata/runqueue: Rewrite without use of ID indirection

-ERROR: Task 4 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/rpm/sftp.bb, do_fetch) failed with exit code '1'
+ERROR: Task /OE/build/oe-core/openembedded-core/meta/recipes-devtools/rpm/sftp.bb:do_fetch (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/rpm/sftp.bb:do_fetch) failed with exit code '1'

  so strip not only '\.bb, .*' used before, but also '\.bb;.*' to drop
  the task name to get recipe name.

* for more details see:
  http://lists.openembedded.org/pipermail/openembedded-core/2016-June/123132.html

* without this change you can see test-dependencies.sh trying to rebuild packages
  like:
  Building recipe: fbprogress (6/21)
  Building recipe: fbprogress.bb:do (7/21)
  where the later of course doesn't exist as a recipe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/test-dependencies.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index 0170947..00c50e0 100755
--- a/scripts/test-dependencies.sh
+++ b/scripts/test-dependencies.sh
@@ -141,7 +141,7 @@ build_all() {
   bitbake -k $targets 2>&1 | tee -a ${OUTPUT1}/complete.log
   RESULT+=${PIPESTATUS[0]}
   grep "ERROR: Task.*failed" ${OUTPUT1}/complete.log > ${OUTPUT1}/failed-tasks.log
-  cat ${OUTPUT1}/failed-tasks.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g' | sort -u > ${OUTPUT1}/failed-recipes.log
+  cat ${OUTPUT1}/failed-tasks.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g; s@\.bb;.*@@g' | sort -u > ${OUTPUT1}/failed-recipes.log
 }
 
 build_every_recipe() {
@@ -178,7 +178,7 @@ build_every_recipe() {
       RESULT+=${RECIPE_RESULT}
       mv ${OUTPUTB}/${recipe}.log ${OUTPUTB}/failed/
       grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | tee -a ${OUTPUTB}/failed-tasks.log
-      grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g' >> ${OUTPUTB}/failed-recipes.log
+      grep "ERROR: Task.*failed"  ${OUTPUTB}/failed/${recipe}.log | sed 's@.*/@@g; s@_.*@@g; s@\.bb, .*@@g; s@\.bb;.*@@g' >> ${OUTPUTB}/failed-recipes.log
       # and append also ${recipe} in case the failed task was from some dependency
       echo ${recipe} >> ${OUTPUTB}/failed-recipes.log
     else
-- 
2.9.0


