Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QjwvF-0002zK-8d
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 19:20:30 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-217.ottawa.windriver.com [128.224.146.217])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6LHGDpA016866;
	Thu, 21 Jul 2011 10:16:17 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 21 Jul 2011 13:16:08 -0400
Message-Id: <129417014aaa71318ddb7c94a8fa88e7cdc8e165.1311267679.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311267679.git.bruce.ashfield@windriver.com>
References: <cover.1311267679.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1311267679.git.bruce.ashfield@windriver.com>
References: <cover.1311267679.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 4/4] kern-tools: update SRCREV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jul 2011 17:20:30 -0000

Fixes [YOCTO #1261]

Updating the SRCREV to pickup some branch creation fixes that
were causing an invalid branch name to be used on a repository
that couldn't support it (i.e. standard/base on a 2.6.34).

With this the 2.6.34 and 3.0 -rt branches will build.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index f7600ca..1fbb1f7 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "f8eb067b023d590b6cd8deddf6f96d6a820997af"
+SRCREV = "f5a915c277a37ba5949b4c0778356189e7dd9ec0"
 PR = r10
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.4.1



