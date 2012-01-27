Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RqpWY-0007HY-5O
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:23:42 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jan 2012 09:15:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117133169"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2012 09:15:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 09:15:45 -0800
Message-Id: <2fff1897b09ba66f264a8f49f06a4a25f3c24374.1327684299.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327684299.git.sgw@linux.intel.com>
References: <cover.1327684299.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327684299.git.sgw@linux.intel.com>
References: <cover.1327684299.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 2/6] gcc-runtime: fix override from poky-lsb to linuxstdbase
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
X-List-Received-Date: Fri, 27 Jan 2012 17:23:42 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-runtime_4.6.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb b/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb
index 97468db..a2fb200 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb
+++ b/meta/recipes-devtools/gcc/gcc-runtime_4.6.bb
@@ -5,4 +5,4 @@ require gcc-package-runtime.inc
 ARCH_FLAGS_FOR_TARGET += "-isystem${STAGING_INCDIR}"
 
 EXTRA_OECONF += "--disable-libunwind-exceptions"
-EXTRA_OECONF_append_poky-lsb = " --enable-clocale=gnu"
+EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
-- 
1.7.6.5



