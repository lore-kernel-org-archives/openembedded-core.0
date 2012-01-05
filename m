Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rigy3-0001EP-Ek
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:38:28 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Jan 2012 22:31:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94663930"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2012 22:31:01 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:30:50 -0800
Message-Id: <819e4bf1ec5999f20899ee5b21bc09b6826a7530.1325744640.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325744640.git.sgw@linux.intel.com>
References: <cover.1325744640.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/28] Patch Upstream-Status Update
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
X-List-Received-Date: Thu, 05 Jan 2012 06:38:29 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/guilt/files/guilt-bash.patch |    2 ++
 .../guilt/files/guilt-import-commit.patch          |    2 ++
 meta/recipes-devtools/guilt/files/guilt-init.patch |    2 ++
 meta/recipes-devtools/guilt/files/guilt-pop.patch  |    2 ++
 .../guilt/files/guilt-push-no-series.patch         |    2 ++
 meta/recipes-devtools/guilt/files/guilt-push.patch |    2 ++
 .../guilt/files/guilt-set-git_exec_path.patch      |    2 ++
 meta/recipes-devtools/guilt/files/guilt.patch      |    2 ++
 .../guilt/files/improve_auto_header_gen.patch      |    2 ++
 .../files/make_git_commands_conditional.patch      |    2 ++
 .../guilt/files/optional_head_check.patch          |    2 ++
 .../guilt/files/uninstall_force.patch              |    2 ++
 12 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/guilt/files/guilt-bash.patch b/meta/recipes-devtools/guilt/files/guilt-bash.patch
index d2058e8..70a439e 100644
--- a/meta/recipes-devtools/guilt/files/guilt-bash.patch
+++ b/meta/recipes-devtools/guilt/files/guilt-bash.patch
@@ -9,6 +9,8 @@ in as /bin/sh makes the problem go away.  So here we change the guilt
 scripts to explicitly call for bash to ensure we don't have a similar
 issue after deployment.
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/guilt-import-commit.patch b/meta/recipes-devtools/guilt/files/guilt-import-commit.patch
index 78cc93e..bd746c5 100644
--- a/meta/recipes-devtools/guilt/files/guilt-import-commit.patch
+++ b/meta/recipes-devtools/guilt/files/guilt-import-commit.patch
@@ -8,6 +8,8 @@ are generated.
 If patches cannot be exported, fall back to importing 
 commits via a more custom method.
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/guilt-init.patch b/meta/recipes-devtools/guilt/files/guilt-init.patch
index a06da5b..1583346 100644
--- a/meta/recipes-devtools/guilt/files/guilt-init.patch
+++ b/meta/recipes-devtools/guilt/files/guilt-init.patch
@@ -1,5 +1,7 @@
 guilt: allow previously initialized branches to be re-initialized
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/guilt-pop.patch b/meta/recipes-devtools/guilt/files/guilt-pop.patch
index c26b324..9c05427 100644
--- a/meta/recipes-devtools/guilt/files/guilt-pop.patch
+++ b/meta/recipes-devtools/guilt/files/guilt-pop.patch
@@ -3,6 +3,8 @@ guilt: pop and delete tags
 Add support for popping to a tag and the ability to delete
 a tag while popping from the tree
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/guilt-push-no-series.patch b/meta/recipes-devtools/guilt/files/guilt-push-no-series.patch
index d40119c..3446f10 100644
--- a/meta/recipes-devtools/guilt/files/guilt-push-no-series.patch
+++ b/meta/recipes-devtools/guilt/files/guilt-push-no-series.patch
@@ -4,6 +4,8 @@ If a series file becomes mangled and a patch name appears in there
 more than once, then the guilt-push will fail a horrible and
 incomprehensible death.  Make it fail in a sensible way.
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/guilt-push.patch b/meta/recipes-devtools/guilt/files/guilt-push.patch
index 2184329..5ec290b 100644
--- a/meta/recipes-devtools/guilt/files/guilt-push.patch
+++ b/meta/recipes-devtools/guilt/files/guilt-push.patch
@@ -2,6 +2,8 @@ guilt: add support for pushing and tagging
 
 It can be handy to push AND tag at the same time.
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch b/meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch
index 92e75f2..a40ec6f 100644
--- a/meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch
+++ b/meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch
@@ -8,6 +8,8 @@ guilt be in the same directory to ensure they are matched,
 so we use the environment variable GIT_EXEC_PATH to 
 force the issue.
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/guilt.patch b/meta/recipes-devtools/guilt/files/guilt.patch
index a3352cf..8e5b61e 100644
--- a/meta/recipes-devtools/guilt/files/guilt.patch
+++ b/meta/recipes-devtools/guilt/files/guilt.patch
@@ -12,6 +12,8 @@ This change does three things:
   - enhances the header detection and creation of patches
     as they are pushed onto the tree.
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch b/meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch
index b98ec5e..fa7dd8a 100644
--- a/meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch
+++ b/meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch
@@ -4,6 +4,8 @@ Patches that do not have a proper header are encountered when generating
 a tree. This improves the detection of these patches and generates a sane
 header so the eventual commit will be coherent
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch b/meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch
index b6d40db..c912397 100644
--- a/meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch
+++ b/meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch
@@ -5,6 +5,8 @@ Some of the git commands that are always called will report errors
 unecesarility in this scenario. This adds a variable that will inhibit
 those problematic calls
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by <bruce.ashfield@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/optional_head_check.patch b/meta/recipes-devtools/guilt/files/optional_head_check.patch
index 368d63b..01e1d02 100644
--- a/meta/recipes-devtools/guilt/files/optional_head_check.patch
+++ b/meta/recipes-devtools/guilt/files/optional_head_check.patch
@@ -25,6 +25,8 @@ Other modes such as pop or refresh can run into problems when
 the HEAD commit isn't tracked or expected, so they should remained 
 checked.
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 
 ---
diff --git a/meta/recipes-devtools/guilt/files/uninstall_force.patch b/meta/recipes-devtools/guilt/files/uninstall_force.patch
index 8c9067d..8f7cea1 100644
--- a/meta/recipes-devtools/guilt/files/uninstall_force.patch
+++ b/meta/recipes-devtools/guilt/files/uninstall_force.patch
@@ -1,5 +1,7 @@
 guilt: force removal when uninstalling
 
+Upstream-Status: Inappropriate [oe-specific]
+
 Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
 
 --- a/uninstall.orig
-- 
1.7.6.4



