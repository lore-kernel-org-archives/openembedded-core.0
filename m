Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TtkOQ-0005nL-E0
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 20:35:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2013 11:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,453,1355126400"; d="scan'208";a="190280144"
Received: from unknown (HELO localhost) ([10.255.14.242])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jan 2013 11:20:33 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2013 13:20:27 -0600
Message-Id: <ef98aeab61fcc3877c3cabd56e6bcdf8e22a1adc.1357930527.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <88b78152fff010082e07b57992977e0b9d65fdde.1357930527.git.tom.zanussi@intel.com>
References: <88b78152fff010082e07b57992977e0b9d65fdde.1357930527.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1357930527.git.tom.zanussi@intel.com>
References: <cover.1357930527.git.tom.zanussi@intel.com>
Subject: [PATCH 3/5] recipes-kernel/lttng-2.0: rename to recipes-kernel/lttng
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
X-List-Received-Date: Fri, 11 Jan 2013 19:36:03 -0000

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



