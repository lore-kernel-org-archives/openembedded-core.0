Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4CAF7F286
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 01:31:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7G1V2fs027178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 18:31:12 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 15 Aug 2019 18:30:51 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2019 09:30:50 +0800
Message-ID: <1565919050-304607-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] dbus: disable test-bus
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
X-List-Received-Date: Fri, 16 Aug 2019 01:31:21 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

test-bus take long time to finish, sometimes longer than ptest-runner's
timeout limit 300s, so skipped it for now

[YOCTO #13409]

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/dbus/dbus/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
index cf2e68f..48535e1 100755
--- a/meta/recipes-core/dbus/dbus/run-ptest
+++ b/meta/recipes-core/dbus/dbus/run-ptest
@@ -21,7 +21,8 @@ do
      #these programs are used by testcase test-bus, don't run here
      if [ $i = "test/test-service" ] \
         || [ $i = "test/test-shell-service" ] \
-        || [ $i = "test/test-segfault" ]
+        || [ $i = "test/test-segfault" ] \
+        || [ $i = "test/test-bus" ]
      then
          continue
      fi
-- 
2.7.4


