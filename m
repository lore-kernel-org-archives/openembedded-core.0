Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TtoGi-0008Pv-2x
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 00:44:21 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jan 2013 15:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,455,1355126400"; d="scan'208";a="245455388"
Received: from unknown (HELO localhost) ([10.255.14.242])
	by orsmga001.jf.intel.com with ESMTP; 11 Jan 2013 15:28:55 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 17:28:48 -0600
Message-Id: <8dd276a78340059151c4cb5d5ef37f7940494df0.1357946582.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <b7c087229da048ee38f14508c2d157bea10c8e49.1357946582.git.tom.zanussi@intel.com>
References: <b7c087229da048ee38f14508c2d157bea10c8e49.1357946582.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1357946582.git.tom.zanussi@intel.com>
References: <cover.1357946582.git.tom.zanussi@intel.com>
Subject: [PATCH 3/3] recipes-kernel/lttng-2.0: rename to recipes-kernel/lttng
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
X-List-Received-Date: Fri, 11 Jan 2013 23:44:22 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

recipes-kernel/lttng was removed by a previous patch, which also
removed the naming conflict that caused the lttng-2.0 version of lttng
to be named recipes-kernel/lttng-2.0.  Since the naming conflict has
disappeared, we can go back to the simpler naming.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/{lttng-2.0 => lttng}/babeltrace_1.0.0.bb              | 0
 .../lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch   | 0
 meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules_2.1.0.bb           | 0
 meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-tools_2.1.0.bb             | 0
 meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-ust_2.1.0.bb               | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/babeltrace_1.0.0.bb (100%)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch (100%)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-modules_2.1.0.bb (100%)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-tools_2.1.0.bb (100%)
 rename meta/recipes-kernel/{lttng-2.0 => lttng}/lttng-ust_2.1.0.bb (100%)

diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_1.0.0.bb b/meta/recipes-kernel/lttng/babeltrace_1.0.0.bb
similarity index 100%
rename from meta/recipes-kernel/lttng-2.0/babeltrace_1.0.0.bb
rename to meta/recipes-kernel/lttng/babeltrace_1.0.0.bb
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch b/meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
similarity index 100%
rename from meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
rename to meta/recipes-kernel/lttng/lttng-modules/lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.1.0.bb b/meta/recipes-kernel/lttng/lttng-modules_2.1.0.bb
similarity index 100%
rename from meta/recipes-kernel/lttng-2.0/lttng-modules_2.1.0.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.1.0.bb
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.1.0.bb
similarity index 100%
rename from meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.1.0.bb
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
similarity index 100%
rename from meta/recipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.1.0.bb
-- 
1.7.11.4



