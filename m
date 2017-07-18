Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E632D77F6D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 07:57:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I7v2xT023879
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 00:57:03 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 00:57:02 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jul 2017 03:56:57 -0400
Message-ID: <9112998bb4e6eef7dd5a2f4606b770bf8e9eb5af.1500364523.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500364523.git.dengke.du@windriver.com>
References: <cover.1500364523.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] acl: reduce local pending patches
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
X-List-Received-Date: Tue, 18 Jul 2017 07:57:02 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../attr/acl/test-fix-directory-permissions.patch       | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch b/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
index a76cbbe..e64990a 100644
--- a/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
+++ b/meta/recipes-support/attr/acl/test-fix-directory-permissions.patch
@@ -1,6 +1,9 @@
+From 311589fedf196168382d8f0db303ab328bcf9d83 Mon Sep 17 00:00:00 2001
+From: Peter Seebach <peter.seebach@windriver.com>
+Date: Wed, 11 May 2016 15:16:06 -0500
+Subject: [PATCH] acl.inc, run-ptest: improve ptest functionality on limited
+
 commit c45bae84817a70fef6c2b661a07a492a0d23ae85
-Author: Peter Seebach <peter.seebach@windriver.com>
-Date:   Wed May 11 15:16:06 2016 -0500
 
     Fix permissions on temporary directory
 
@@ -10,7 +13,12 @@ Date:   Wed May 11 15:16:06 2016 -0500
 
     Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
 
-Upstream-Status: Pending
+Upstream-Status: Backport [ http://git.savannah.gnu.org/cgit/acl.git/commit/?id=c6772a958800de064482634f77c20a0faafc5af6 ]
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ test/root/permissions.test | 1 +
+ 1 file changed, 1 insertion(+)
 
 diff --git a/test/root/permissions.test b/test/root/permissions.test
 index 42615f5..098b52a 100644
@@ -24,3 +32,6 @@ index 42615f5..098b52a 100644
  	$ mkdir d
  	$ cd d
  	$ umask 027
+-- 
+2.8.1
+
-- 
2.8.1


