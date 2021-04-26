Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.927.1619398452808593695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: fVZnPxIUPOzoFp1Fd6PyXqqCM6fBh8CmZXfV/U6m0HWQJAIiH9a0J/Zo5xCgfsCERZ0CrEIjOz
 rXj0AvP6XOgw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818059"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818059"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:12 -0700
IronPort-SDR: EAwRoq0S5Cd57MeBVgVQb+HiHMCG1/MaBuq1NSwuMEX2qlZJjifHIDabOle/HfLu3YLDcYN71i
 yizVWMOH7dVw==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067235"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:01 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/64] archiver: Fix typos
Date: Mon, 26 Apr 2021 08:52:36 +0800
Message-Id: <dee125de5f6a4b42ecfae08688641ac783c096f5.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Ammann <daniel.ammann@bytesatwork.ch>

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 36de56496bc07c321162555d603fac756297911a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/archiver.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 858507b343..a3962306b1 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -118,7 +118,7 @@ python () {
         d.appendVarFlag('do_deploy_archives', 'depends', ' %s:do_ar_patched' % pn)
     elif ar_src == "configured":
         # We can't use "addtask do_ar_configured after do_configure" since it
-        # will cause the deptask of do_populate_sysroot to run not matter what
+        # will cause the deptask of do_populate_sysroot to run no matter what
         # archives we need, so we add the depends here.
 
         # There is a corner case with "gcc-source-${PV}" recipes, they don't have
@@ -163,7 +163,7 @@ python () {
                 d.appendVarFlag('do_package_write_rpm', 'depends', ' %s:do_ar_configured' % pn)
 }
 
-# Take all the sources for a recipe and puts them in WORKDIR/archiver-work/.
+# Take all the sources for a recipe and put them in WORKDIR/archiver-work/.
 # Files in SRC_URI are copied directly, anything that's a directory
 # (e.g. git repositories) is "unpacked" and then put into a tarball.
 python do_ar_original() {
@@ -463,7 +463,7 @@ python do_unpack_and_patch() {
     ar_sysroot_native = d.getVar('STAGING_DIR_NATIVE')
     pn = d.getVar('PN')
 
-    # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
+    # The kernel class functions require it to be on work-shared, so we don't change WORKDIR
     if not is_work_shared(d):
         # Change the WORKDIR to make do_unpack do_patch run in another dir.
         d.setVar('WORKDIR', ar_workdir)
@@ -505,7 +505,7 @@ python do_unpack_and_patch() {
 # of the output file ensures that we create it each time the recipe
 # gets rebuilt, at least as long as a PR server is used. We also rely
 # on that mechanism to catch changes in the file content, because the
-# file content is not part of of the task signature either.
+# file content is not part of the task signature either.
 do_ar_recipe[vardepsexclude] += "BBINCLUDED"
 python do_ar_recipe () {
     """
-- 
2.30.2

