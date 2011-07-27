Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QmD6D-0004F5-0N
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 01:01:09 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6RMurMk004891
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 17:56:54 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:56:49 -0700
Message-Id: <526d8982bcd6e373d101c03fea63af99d25b11fc.1311807353.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311807353.git.tom_rini@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
Subject: [PATCH 5/9] Various siteinfo files: Drop enca section
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
X-List-Received-Date: Wed, 27 Jul 2011 23:01:09 -0000

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
1.7.0.4



