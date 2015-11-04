Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B8B3F73D46
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 16:02:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Nov 2015 08:02:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,243,1444719600"; d="scan'208";a="843033911"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2015 08:01:53 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 07:50:48 +0000
Message-Id: <0a5ae2e581cfc43ee2a40626ac61c7191c3c6b1b.1446623061.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1446623061.git.mariano.lopez@linux.intel.com>
References: <cover.1446623061.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1446623061.git.mariano.lopez@linux.intel.com>
References: <cover.1446623061.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 3/3] package_manager.py: Delete installed_pkgs.txt file
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
X-List-Received-Date: Wed, 04 Nov 2015 16:02:07 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This change removes the file installed_pkgs.txt after it
was used for installation of complementary packages. This
file was causing confusion when left in the WORKDIR after
the build.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 964fddc..bc33473 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -625,6 +625,7 @@ class PackageManager(object):
                      "'%s' returned %d:\n%s" %
                      (' '.join(cmd), e.returncode, e.output))
         self.install(complementary_pkgs.split(), attempt_only=True)
+        os.remove(installed_pkgs_file)
 
     def deploy_dir_lock(self):
         if self.deploy_dir is None:
-- 
1.8.4.5


