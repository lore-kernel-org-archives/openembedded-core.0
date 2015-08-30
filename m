Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B2E0276EB7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:09:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Aug 2015 09:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="778575394"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2015 09:09:03 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id B907E6A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:08:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:43 +0300
Message-Id: <ca3deea5851165b3a89f26e54a29cb94d792635e.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 10/11] devtool: build-image: add comments
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
X-List-Received-Date: Sun, 30 Aug 2015 16:09:02 -0000

Added couple of hopefully useful comments to the code.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index 5bc8213..817703a 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -58,6 +58,7 @@ def build_image(args, config, basepath, workspace):
     recipes = _get_recipes(workspace, config)
     if recipes:
         with open(appendfile, 'w') as afile:
+            # include selected recipes into the image
             afile.write('IMAGE_INSTALL_append = " %s"\n' % ' '.join(recipes))
 
             # Generate notification callback devtool_warn_image_extended
@@ -75,6 +76,7 @@ def build_image(args, config, basepath, workspace):
     else:
         logger.warning('No recipes in workspace, building image %s unmodified', image)
 
+    # run bitbake to build image
     try:
         exec_build_env_command(config.init_path, basepath,
                                'bitbake %s' % image, watch=True)
-- 
2.1.4


