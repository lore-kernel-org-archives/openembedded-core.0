Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1T8sct-0008Pn-7S
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 14:53:07 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q84Cecws008783;
	Tue, 4 Sep 2012 05:40:42 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Sep 2012 08:40:35 -0400
Message-Id: <1a95cec9412edeacb30a26966032fb71596cf728.1346762109.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346762109.git.bruce.ashfield@windriver.com>
References: <cover.1346762109.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1346762109.git.bruce.ashfield@windriver.com>
References: <cover.1346762109.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 4/6] kern-tools: fix non-inheriting branch names
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 12:53:08 -0000

Importing the following tools SRCREV:

    kgit-meta: exclude explicit branches from name calculations

    kernel branches are constructed during patching of the tree by
    constructing a '/' based hierarchy of names as each branch
    directive is encountered.

    But if a "branch $name $branchpoint" is used, the entire branch
    name is supplied so no additions to the hierarchy should
    happen. As such, that type of branch command should not be part
    of branch name calculation and preparation.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index b560059..e8926ee 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native guilt-native"
 
-SRCREV = "6e92eca3bd30d73222dfeaae6d2d1d9764a5a3f8"
+SRCREV = "0c7b625280eb9ff62d40b53308e7238ddd164f38"
 PR = "r12"
 PV = "0.1+git${SRCPV}"
 
-- 
1.7.5.4



