Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 70B0070254
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:01:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2014 01:01:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,663,1400050800"; d="scan'208";a="569954734"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.85])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2014 01:01:24 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 11:00:44 +0300
Message-Id: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/9] pam.d: added system-auth configuration file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 08:01:49 -0000

Needed by systemd when it starts user sessions.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/recipes-extended/pam/libpam/pam.d/system-auth | 7 +++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/pam.d/system-auth

diff --git a/meta/recipes-extended/pam/libpam/pam.d/system-auth b/meta/recipes-extended/pam/libpam/pam.d/system-auth
new file mode 100644
index 0000000..3275288
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/pam.d/system-auth
@@ -0,0 +1,7 @@
+auth        required      pam_env.so
+auth        sufficient    pam_unix.so try_first_pass nullok
+auth        required      pam_deny.so
+
+account     required      pam_unix.so
+
+session required pam_systemd.so
\ No newline at end of file
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 3190aaf..231a76f 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://pam.d/common-password \
            file://pam.d/common-session \
            file://pam.d/common-session-noninteractive \
+           file://pam.d/system-auth \
            file://pam.d/other \
            file://libpam-xtests.patch \
            file://destdirfix.patch \
-- 
1.9.1


