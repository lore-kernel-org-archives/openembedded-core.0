Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SwCg0-0004E8-0D
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 15:39:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2012 06:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="191139831"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jul 2012 06:28:17 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 16:30:00 +0300
Message-Id: <1343741400-17415-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] babeltrace: Update to upstream stable versrion 0.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 13:39:56 -0000

Latest version is 1.0.0 but in rc4 for now.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../{babeltrace_0.8.bb => babeltrace_0.12.bb}      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng-2.0/{babeltrace_0.8.bb => babeltrace_0.12.bb} (91%)

diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb b/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
similarity index 91%
rename from meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
rename to meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
index 0b4a122..eaf7eeb 100644
--- a/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
+++ b/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
@@ -10,8 +10,8 @@ inherit autotools
 
 DEPENDS = "gtk+ util-linux"
 
-SRCREV = "efc5077568403009493d1d72e94f292838825e51"
-PV = "0.8+git${SRCPV}"
+SRCREV = "0d8f8c2ea27df096269aa76b4baeab26b68b95d4"
+PV = "0.12+git${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
-- 
1.7.9.5



