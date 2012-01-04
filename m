Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RiXKC-000528-Sb
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 21:20:42 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q04KDE7o001257;
	Wed, 4 Jan 2012 12:13:15 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed,  4 Jan 2012 15:13:00 -0500
Message-Id: <1c46d8ffd42a43b755542ae8aad282ae7106ef35.1325706838.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1325706838.git.bruce.ashfield@windriver.com>
References: <cover.1325706838.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1325706838.git.bruce.ashfield@windriver.com>
References: <cover.1325706838.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/3] kern-tools: import flexible branching support
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
X-List-Received-Date: Wed, 04 Jan 2012 20:20:42 -0000

The commit:

   kern-tools: update SRCREV to pickup git operation fixes

Brought in the ability to trap failed git operations on the working tree,
but what it missed were some branching changes that allow arbitrary
branch points and the ability to create a branch multiple times (if a feature
is included multiple times). The graphics driver branches used by some
BSPs need this part of the change to properly handle graphics driver
branches.

Updating the SRCREV to pickup the associated kern-tools changes for this
support.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 6bb9c85..c387af8 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "806f1452eeced0bbd05433456ac0d6786d5362dc"
+SRCREV = "710067f39a2518f095456eed0232de6300f0b6df"
 PR = r12
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.4.1



