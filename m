Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T1k3M-0007ps-MZ
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 22:18:57 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7FK6sWf011691;
	Wed, 15 Aug 2012 13:06:58 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 15 Aug 2012 16:06:23 -0400
Message-Id: <6058f32dc177025e6acaacf4835bff797d5ca0db.1345059176.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1345059176.git.bruce.ashfield@windriver.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1345059176.git.bruce.ashfield@windriver.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 4/4] kern-tools: fixes (branching, buildall) + cleanups (checkpoint, cleaner)
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
X-List-Received-Date: Wed, 15 Aug 2012 20:18:57 -0000

Updating the kern-tools SRCREV to pickup a collection of bug fixes
and cleanups:

  75e71c3 kgit-config-cleaner: add -k <keep option>
  02be3b5 buildall: switch back to scc driven processing
  c7101db kern-tools: support flexible branching
  e2d06bd kern-tools: Remove superfluous references to "defconfig" from the "createme" script.
  e693754 kgit-checkpoint: fix verify_branch variable name typo
  ee67a7b kgit-config-cleaner: fix redefintion processing

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index c176aed..974b86e 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "579b1ba2169d053c1330854f54f605bb6929d6d8"
+SRCREV = "33068f21169b327c64ac7e957fe9d89c391897a3"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



