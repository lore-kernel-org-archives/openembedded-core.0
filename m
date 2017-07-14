Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1991271A88
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:06:38 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2017 05:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,358,1496127600"; d="scan'208";a="126665345"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2017 05:06:38 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id A6B735803B9;
	Fri, 14 Jul 2017 05:06:37 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 15:06:31 +0300
Message-Id: <1500033991-27338-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] selftest: Add vulkan-demos to checkpkg exceptions
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
X-List-Received-Date: Fri, 14 Jul 2017 12:06:40 -0000

vulkan-demos has not had any releases.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---


This is only useful with the vulkan-demos patch. I've pushed this
on top of the jku/vulkan branch in poky-contrib.

The commit silences the selftest failure from the checkpkg test.
The whole checkpkg exceptions system should probably be changed so
it uses a recipe variable (say UPSTREAM_CHECK_NO_MATCH = "1") instead of
a whitelist file but the whole setup is "clever" enough that I'd
rather leave the improvement to Alexander...

Cheers,
  Jussi



 meta-selftest/files/distrodata/checkpkg_exceptions | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/files/distrodata/checkpkg_exceptions b/meta-selftest/files/distrodata/checkpkg_exceptions
index f0d1f67..ff54cf0 100644
--- a/meta-selftest/files/distrodata/checkpkg_exceptions
+++ b/meta-selftest/files/distrodata/checkpkg_exceptions
@@ -19,6 +19,7 @@ squashfs-tools
 tcf-agent
 unzip
 update-rc.d
+vulkan-demos
 x264
 xcursor-transparent-theme
 xinetd
-- 
2.1.4


