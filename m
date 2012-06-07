Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Scj2Y-0004qu-Fo
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 22:10:42 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q57K07DX018923;
	Thu, 7 Jun 2012 13:00:08 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Jun 2012 15:59:42 -0400
Message-Id: <142f9889526d2a77bbb23e2591aa36f8974bfad0.1339098507.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/9] kern-tools: remove unused code, meta branch and directory assumptions
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
X-List-Received-Date: Thu, 07 Jun 2012 20:10:42 -0000

Updating the kern-tools SRCREV to pick up fixes that remove unused
code, transition code (tree format changes) and to remove assumptions
about branch and directory naming.

There are no user visible changes with this update, but the plumbing
changes will be used in future updates for more generalized support.

The commit details are below:

 Author: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date:   Fri May 11 12:13:12 2012 -0400

    kgit-publish: remove --remote option

    The ability to publish and automatically push a repository was
    never used, and is error prone. The complexit isn't needed in
    the script, so removing it is the best option.

    An explicit push after tree publication is suggested, or a
    wrapper script (specific to a particular infrastructure) around
    this script.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

 Author: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date:   Fri May 11 12:04:09 2012 -0400

    kern-tools: remove unused code, scripts and transition code

    The period of supporting old trees with a different meta
    branch name and directory structure are gone. So the cleanup
    and removal of the old structure can be completed.

    The meta branch and directory are now controlled via command line,
    or via the KMETA environment variable. No testing and conditional
    processing of the tree are required.

    Additionally, the generate_cfg script is no longer used, or is the
    branch conditing code in createme. So they can be safely removed
    from the tools and repository.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

 Author: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date:   Thu May 10 12:18:19 2012 -0400

    kern-tools: remove meta tag and directory assumptions

    During repository sanity checks (createme) and during the
    checkpoint process, there were several assumptions about the tree
    that either relied on a tag, or a particular directory name.

    With this set of changes, simply passing the meta branch name is
    enough to sanitize and restore the checkpoint. If no meta branch
    name is passed, the default of 'meta' is used for both the branch
    and meta data directory name.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 9ef1a20..becb0de 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Scripts and utilities for managing Yocto branched kernels."
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d843f43d2e22b0d91a6fee"
+LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70cd5f52972f8884b80743d"
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "de3649840e8e3ca25bc79d2444f04a1b158a1769"
+SRCREV = "0859d2f73cc6f6973835fa5713b5a98a43ed43ff"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



