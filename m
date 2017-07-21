Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 873B477B95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 19:36:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jul 2017 12:36:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,391,1496127600"; d="scan'208";a="1153972961"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.28])
	by orsmga001.jf.intel.com with ESMTP; 21 Jul 2017 12:36:26 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 12:39:52 -0700
Message-Id: <b07d90b1b87b7f3a49c240e92d6c7b6fdcbc529e.1500665624.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1500665624.git.brian.avery@intel.com>
References: <cover.1500665624.git.brian.avery@intel.com>
Subject: [PATCH 1/2] meta-yocto-bsp: Remove superfluous kernel set
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
X-List-Received-Date: Fri, 21 Jul 2017 19:36:45 -0000

The genericx86 and genericx86-64 machine confs do not need to set the
PREFERRED_PROVIDER_virtual/kernel as they will use the one set by the
distribution. If there needed to be a different version for one of these
machines in the future, we could add it in to the machine.conf.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta-yocto-bsp/conf/machine/genericx86-64.conf | 2 --
 meta-yocto-bsp/conf/machine/genericx86.conf    | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-yocto-bsp/conf/machine/genericx86-64.conf b/meta-yocto-bsp/conf/machine/genericx86-64.conf
index bfedd84..12f7c0d 100644
--- a/meta-yocto-bsp/conf/machine/genericx86-64.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86-64.conf
@@ -7,6 +7,4 @@ DEFAULTTUNE ?= "core2-64"
 require conf/machine/include/tune-core2.inc
 require conf/machine/include/genericx86-common.inc
 
-PREFERRED_VERSION_linux-yocto ?= "4.10%"
-
 SERIAL_CONSOLES_CHECK = "ttyS0"
diff --git a/meta-yocto-bsp/conf/machine/genericx86.conf b/meta-yocto-bsp/conf/machine/genericx86.conf
index af03b86..798b62ec 100644
--- a/meta-yocto-bsp/conf/machine/genericx86.conf
+++ b/meta-yocto-bsp/conf/machine/genericx86.conf
@@ -8,5 +8,3 @@ require conf/machine/include/tune-core2.inc
 require conf/machine/include/genericx86-common.inc
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "gma500-gfx-check"
-
-PREFERRED_VERSION_linux-yocto ?= "4.10%"
-- 
1.9.1


