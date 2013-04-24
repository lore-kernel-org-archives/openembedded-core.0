Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47C-0004Uq-8U
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:08:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2013 10:50:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632414"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:39 +0100
Message-Id: <0379201b2fa9abada12c145887382033733b17f4.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/21] eglibc: add common HOMEPAGE and SUMMARY for eglibc-locale
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
X-List-Received-Date: Wed, 24 Apr 2013 18:08:42 -0000
X-List-Received-Date: Wed, 24 Apr 2013 18:08:42 -0000

Add SUMMARY for eglibc-locale, and HOMEPAGE in eglibc-collateral.inc
(used for eglibc-locale and eglibc-mtrace).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc-collateral.inc |    1 +
 meta/recipes-core/eglibc/eglibc-locale.inc     |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-core/eglibc/eglibc-collateral.inc b/meta/recipes-core/eglibc/eglibc-collateral.inc
index b770bb0..8feca09 100644
--- a/meta/recipes-core/eglibc/eglibc-collateral.inc
+++ b/meta/recipes-core/eglibc/eglibc-collateral.inc
@@ -1,5 +1,6 @@
 INHIBIT_DEFAULT_DEPS = "1"
 LICENSE = "GPLv2 & LGPLv2.1"
+HOMEPAGE = "http://www.eglibc.org/"
 
 do_fetch[noexec] = "1"
 do_unpack[noexec] = "1"
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 3d6382d..f4cb814 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -1,5 +1,7 @@
 include eglibc-collateral.inc
 
+SUMMARY = "Locale data from eglibc"
+
 BPN = "eglibc"
 LOCALEBASEPN = "${MLPREFIX}eglibc"
 
-- 
1.7.10.4



