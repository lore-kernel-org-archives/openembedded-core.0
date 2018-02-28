Return-Path: <maxin.john@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6B178856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:55:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 06:55:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,406,1515484800"; d="scan'208";a="23912783"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2018 06:55:26 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 3C4B858038F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 06:55:26 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 16:57:54 +0200
Message-Id: <1519829874-23964-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] openssh: remove unused patch
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
X-List-Received-Date: Wed, 28 Feb 2018 14:55:25 -0000

Remove unused patch:
        0001-openssh-Fix-syntax-error-on-x32.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-openssh-Fix-syntax-error-on-x32.patch     | 33 ----------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-openssh-Fix-syntax-error-on-x32.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-openssh-Fix-syntax-error-on-x32.patch b/meta/recipes-connectivity/openssh/openssh/0001-openssh-Fix-syntax-error-on-x32.patch
deleted file mode 100644
index ce9e200..0000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-openssh-Fix-syntax-error-on-x32.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a7e359d4ba345aa2a13c07f1057184e9b4e598a2 Mon Sep 17 00:00:00 2001
-From: sweeaun <swee.aun.khor@intel.com>
-Date: Tue, 22 Aug 2017 11:19:48 -0700
-Subject: [PATCH] openssh: Fix syntax error on x32
-
-Upstream-Status: Backport
-This bug has been fixed in v_7.5 branch https://github.com/openssh/
-openssh-portable/tree/V_7_5 and master branch https://github.com/
-openssh/openssh-portable/tree/master.
-
-Fix compilation error during openssh x32 build due to syntax error.
-
-Signed-off-by: sweeaun <swee.aun.khor@intel.com>
----
- sandbox-seccomp-filter.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
-index 3a1aedc..a8d472a 100644
---- a/sandbox-seccomp-filter.c
-+++ b/sandbox-seccomp-filter.c
-@@ -235,7 +235,7 @@ static const struct sock_filter preauth_insns[] = {
- 	 * x86-64 syscall under some circumstances, e.g.
- 	 * https://bugs.debian.org/849923
- 	 */
--	SC_ALLOW(__NR_clock_gettime & ~__X32_SYSCALL_BIT);
-+	SC_ALLOW(__NR_clock_gettime & ~__X32_SYSCALL_BIT),
- #endif
- 
- 	/* Default deny */
--- 
-2.7.4
-
-- 
2.4.0


