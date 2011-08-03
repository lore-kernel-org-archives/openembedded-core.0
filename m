Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qoivc-0002E7-4K
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 23:24:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 14:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; d="scan'208";a="34056967"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 14:19:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 14:19:38 -0700
Message-Id: <9c6da2ab124482ee06cdbe0f44b35ba2d6b1e93f.1312394851.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312394851.git.sgw@linux.intel.com>
References: <cover.1312394851.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/33] Various siteinfo files: Drop enca section
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
X-List-Received-Date: Wed, 03 Aug 2011 21:24:40 -0000

From: Tom Rini <tom_rini@mentor.com>

As part of re-syncing with oe.dev, these tests aren't needed with the
oe.dev recipe of enca now.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/arm-linux   |    3 ---
 meta/site/ix86-common |    3 ---
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/meta/site/arm-linux b/meta/site/arm-linux
index 87b45eb..2f4974b 100644
--- a/meta/site/arm-linux
+++ b/meta/site/arm-linux
@@ -139,9 +139,6 @@ samba_cv_USE_SETREUID=${samba_cv_USE_SETREUID=yes}
 samba_cv_USE_SETUIDX=${samba_cv_USE_SETUIDX=yes}
 samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
 
-# enca
-yeti_cv_func_scanf_modif_size_t=yes
-
 # clamav
 clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
 clamav_av_have_in_port_t=${clamav_av_have_in_port_t=yes}
diff --git a/meta/site/ix86-common b/meta/site/ix86-common
index c663466..f89835d 100644
--- a/meta/site/ix86-common
+++ b/meta/site/ix86-common
@@ -74,9 +74,6 @@ ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
 dpkg_cv_va_copy=${ac_cv_va_copy=no}
 dpkg_cv___va_copy=${ac_cv___va_copy=yes}
 
-# enca
-yeti_cv_func_scanf_modif_size_t=yes
-
 # ettercap
 ettercap_cv_type_socklen_t=${ettercap_cv_type_socklen_t=yes}
 
-- 
1.7.3.4



