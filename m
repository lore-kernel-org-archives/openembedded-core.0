Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TgEgc-000103-ID
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 14:06:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2012 04:52:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="229266788"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2012 04:52:24 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 14:57:35 +0200
Message-Id: <a85177d471561b0413cc27e8ac85188a2c232534.1354711738.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354711738.git.radu.moisan@intel.com>
References: <cover.1354711738.git.radu.moisan@intel.com>
In-Reply-To: <cover.1354711738.git.radu.moisan@intel.com>
References: <cover.1354711738.git.radu.moisan@intel.com>
Subject: [PATCH 1/4] babeltrace: upgrade to 1.0.0
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
X-List-Received-Date: Wed, 05 Dec 2012 13:06:50 -0000

From: Constantin Musca <constantinx.musca@intel.com>

License checksum change due to diff:
15a16,22
>
> * LGPLv2.1
>
> The file include/babeltrace/list.h is licensed under LGPLv2.1. It only
> contains trivial static inline functions and macros, and, therefore,
> including it does not make babeltrace a derivative work on this header.
> Please refer to the LGPLv2.1 license for details.

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../{babeltrace_0.12.bb => babeltrace_1.0.0.bb}    |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/lttng-2.0/{babeltrace_0.12.bb => babeltrace_1.0.0.bb} (81%)

diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb b/meta/recipes-kernel/lttng-2.0/babeltrace_1.0.0.bb
similarity index 81%
rename from meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
rename to meta/recipes-kernel/lttng-2.0/babeltrace_1.0.0.bb
index e699712..4223c54 100644
--- a/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
+++ b/meta/recipes-kernel/lttng-2.0/babeltrace_1.0.0.bb
@@ -4,15 +4,15 @@ HOMEPAGE = "http://www.efficios.com/babeltrace/"
 BUGTRACKER = "n/a"
 
 LICENSE = "MIT & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8d1a03b3c17bdd158b3cbb34813b1423"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 inherit autotools
 
 DEPENDS = "glib-2.0 util-linux popt"
 
-SRCREV = "0d8f8c2ea27df096269aa76b4baeab26b68b95d4"
-PV = "0.12+git${SRCPV}"
-PR = "r2"
+SRCREV = "f6ed7fa4636ff22e08f57721dcd312828547aa66"
+PV = "1.0+git${SRCPV}"
+PR = "r0"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
 
-- 
1.7.9.5



