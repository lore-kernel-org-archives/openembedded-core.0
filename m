Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1ScJ4E-0001Mw-Ko
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 18:26:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jun 2012 09:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="153769517"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 06 Jun 2012 09:15:08 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 09:14:41 -0700
Message-Id: <7d0e6a9be9d32f333f3819daec44a5b6d67ceadb.1338999174.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1338999174.git.scott.a.garman@intel.com>
References: <cover.1338999174.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1338999174.git.scott.a.garman@intel.com>
References: <cover.1338999174.git.scott.a.garman@intel.com>
Subject: [PATCH 1/1] tcmode-default.inc: use ${EGLIBCVERSION} in PREFERRED_VERSION definitions
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
X-List-Received-Date: Wed, 06 Jun 2012 16:26:42 -0000

Remove hard-coded values and replace with ${EGLIBCVERSION}.

This fixes [YOCTO #2503]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/conf/distro/include/tcmode-default.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 3dc0932..b481163 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -44,9 +44,9 @@ PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_linux-libc-headers-nativesdk ?= "${LINUXLIBCVERSION}"
 PREFERRED_VERSION_eglibc                   ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-locale            ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-nativesdk         ?= "2.15"
+PREFERRED_VERSION_eglibc-nativesdk         ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_eglibc-initial           ?= "${EGLIBCVERSION}"
-PREFERRED_VERSION_eglibc-initial-nativesdk ?= "2.15"
+PREFERRED_VERSION_eglibc-initial-nativesdk ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${EGLIBCVERSION}"
 PREFERRED_VERSION_uclibc                   ?= "${UCLIBCVERSION}"
 PREFERRED_VERSION_uclibc-initial           ?= "${UCLIBCVERSION}"
-- 
1.7.9.5



