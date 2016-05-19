Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DCE14606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 13:42:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2016 06:42:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,334,1459839600"; d="scan'208";a="980452438"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 19 May 2016 06:42:41 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 572B46A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 07:30:11 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 16:43:06 +0300
Message-Id: <1463665389-18822-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/4] package_regex.inc: remove deprecated file
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
X-List-Received-Date: Thu, 19 May 2016 13:42:41 -0000

Remove this file as it has been deprecated in the previous release.
New entries should be added to recipes itself.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/distrodata.bbclass            |  1 -
 meta/conf/distro/include/package_regex.inc | 22 ----------------------
 2 files changed, 23 deletions(-)
 delete mode 100644 meta/conf/distro/include/package_regex.inc

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 51bfc1e..fbb7402 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -1,4 +1,3 @@
-include conf/distro/include/package_regex.inc
 include conf/distro/include/upstream_tracking.inc
 include conf/distro/include/distro_alias.inc
 include conf/distro/include/maintainers.inc
diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
deleted file mode 100644
index 9fc1157..0000000
--- a/meta/conf/distro/include/package_regex.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-# NOTE: THIS FILE IS DEPRECATED. Please add new entries to the recipes themselves.
-#
-# package_regex.inc - This file contains data that tracks
-# upstream project associated with a given recipe. This list is needed
-# for recipes that version information can not be automagically discovered.
-# As we automate this checking, this file will slowly be reduced.
-#"
-# This data is used by the package reporting system (packages.yoctoproject.org)
-#"
-# The format is as a bitbake variable override for each recipe
-#"
-#       UPSTREAM_CHECK_URI_pn-<recipe name> = "recipe_url"
-#	 - This is the url used by the package checking system to
-#	   get the latest version of the package
-#       UPSTREAM_CHECK_REGEX_pn-<recipe name> = "package_regex"
-#	 - This is the regex the package checking system uses to
-#	   parse the page found at UPSTREAM_CHECK_URI_pn-<recipe name>
-#	UPSTREAM_CHECK_GITTAGREGEX_pn-<recipe name> = "git_tag_regex"
-#	 - When source code is fetched from git, git tags are used to
-#	   determine the upstream release version. This regex can be used
-#	   to filter only relevant tags.
-#
-- 
2.4.0


