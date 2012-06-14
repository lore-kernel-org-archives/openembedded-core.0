Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfC8D-0000s6-NG
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 17:38:45 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Jun 2012 08:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112132917"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.138])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Jun 2012 08:28:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 08:27:59 -0700
Message-Id: <d9b3498416a0ddf7939998d41a960dc67263949d.1339687522.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339687522.git.sgw@linux.intel.com>
References: <cover.1339687522.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339687522.git.sgw@linux.intel.com>
References: <cover.1339687522.git.sgw@linux.intel.com>
Subject: [PATCH 4/6] eglibc: added ac_cv_path_ to CACHED_CONFIGUREVARS
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
X-List-Received-Date: Thu, 14 Jun 2012 15:38:46 -0000

On Fedora 17, bash has moved to /usr/bin/bash and the configure process it find it
on the host machine there, this ensures that it is set correctly for the target.

[YOCTO #2363]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc.inc     |    2 ++
 meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 8e3fe50..51061bc 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -32,6 +32,8 @@ require eglibc-options.inc
 
 LEAD_SONAME = "libc.so"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_KSH=${base_bindir}/bash \
+                       ac_cv_path_BASH_SHELL=${base_bindir}/bash"
 GLIBC_EXTRA_OECONF ?= ""
 GLIBC_EXTRA_OECONF_virtclass-nativesdk = ""
 INHIBIT_DEFAULT_DEPS = "1"
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 73cd0aa..690f99d 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r27"
+PR = "r28"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
diff --git a/meta/recipes-core/eglibc/eglibc_2.15.bb b/meta/recipes-core/eglibc/eglibc_2.15.bb
index 6dd846f..e57a112 100644
--- a/meta/recipes-core/eglibc/eglibc_2.15.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "17386"
 
 DEPENDS += "gperf-native"
-PR = "r11"
+PR = "r12"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_15"
-- 
1.7.7.6



