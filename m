Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1A5C7822A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 06:04:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA1647r9029076
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Oct 2017 23:04:08 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 31 Oct 2017 23:04:06 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 31 Oct 2017 23:04:03 -0700
Message-ID: <e3065f5f50408e6f84649381de1f00a95c1f7869.1509516068.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1509516068.git.wenzong.fan@windriver.com>
References: <cover.1509516068.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] initscripts: minor fixes to checkroot.sh
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
X-List-Received-Date: Wed, 01 Nov 2017 06:04:07 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix checkroot.sh issue while booting:
  sh: no: unknown operand

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index c879f9e519..bf6136cc42 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -74,9 +74,9 @@ test "$VERBOSE" != no && echo "Activating swap"
 #
 # Check the root filesystem.
 #
-if test -f /fastboot || test $rootcheck = no
+if test -f /fastboot || test "$rootcheck" = no
 then
-  test $rootcheck = yes && echo "Fast boot, no filesystem check"
+  test "$rootcheck" = yes && echo "Fast boot, no filesystem check"
 else
   #
   # Ensure that root is quiescent and read-only before fsck'ing.
-- 
2.11.0


