Return-Path: <brian.avery@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id E99E971A9E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 00:41:36 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 05 Oct 2016 17:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,451,1473145200"; d="scan'208";a="17116073"
Received: from bavery-ws-desk.jf.intel.com ([10.7.198.85])
	by orsmga004.jf.intel.com with ESMTP; 05 Oct 2016 17:41:38 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 17:43:06 -0700
Message-Id: <6863f13b14e0561cc46d2a5f60308b395aa94d0d.1475714128.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1475714128.git.brian.avery@intel.com>
References: <cover.1475714128.git.brian.avery@intel.com>
Subject: [PATCH 1/1 V2] uninative: users can override download site
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
X-List-Received-Date: Thu, 06 Oct 2016 00:41:38 -0000

The default download site for the uninative tarball is
http://downloads.yoctoproject.org/releases/uninative/<version>. There
are scenarios in which the user may need to force the download to be
somewhere else.  This patch allows the UNINATIVE_URL to be set in the
local.conf.

Signed-off-by: bavery <brian.avery@intel.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 2f794f7..975edec 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,6 +6,6 @@
 # to the distro running on the build machine.
 #

-UNINATIVE_URL = "http://downloads.yoctoproject.org/releases/uninative/1.4/"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.4/"
 UNINATIVE_CHECKSUM[i686] ?= "b4bc60511ce479736808273ffa043df4ed2a225407dd7ca150ae6220d9ce76d5"
 UNINATIVE_CHECKSUM[x86_64] ?= "101ff8f2580c193488db9e76f9646fb6ed38b65fb76f403acb0e2178ce7127ca"
--
1.9.1

