Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 72E1D77CFB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491236806; x=1522772806; h=from:to:subject:date:message-id;
	bh=AxUTlUsix5XqeqJ8E/rJjv6upmPP1DyqfTT/b2o+aOU=;
	b=q/23gSUxS3NMEjJlYy2Ld5Pk7IBSK39MQ7xfjBiYDThd2RY7FmC4L0st
	Obqxthzc2z7DNZSWimtFeWP5k3NcZw==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2017 09:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,271,1486454400"; d="scan'208";a="1114909606"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.9.149])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2017 09:26:27 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 17:26:22 +0100
Message-Id: <20170403162622.18421-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] yocto-uninative: Update to the 1.6 release
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
X-List-Received-Date: Mon, 03 Apr 2017 16:26:44 -0000

This release includes fixes for Windows/Mingw support.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 7f9eaba..7c2151c 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,6 +6,6 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.5/"
-UNINATIVE_CHECKSUM[i686] ?= "4cda652ba90f98e4c34e4c5a7e9f6364b51d3538228a4ffc24d0168fdf331369"
-UNINATIVE_CHECKSUM[x86_64] ?= "22f5a061d077379f5728197bfcc239aa087332293038df48535c7badcb6939fd"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.6/"
+UNINATIVE_CHECKSUM[i686] ?= "d9daf66785834f888b6f50a1d37a8120815f8380e0e267d311e1dfaf4bb5404e"
+UNINATIVE_CHECKSUM[x86_64] ?= "2b4fffa308d9f19e0742a1a404ff42495fb50c165e5ca0458cedca157372691a"
-- 
2.9.3


