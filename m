Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E1D24777C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:26:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:26:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988253"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:26:04 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:14 +0200
Message-Id: <1e59ae7c1c7204a3c3bc8c3339b35b230173c6c0.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 35/44] security_flags.inc: update to reflect smart->dnf transition
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
X-List-Received-Date: Fri, 10 Mar 2017 11:26:04 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 5a1cbb13192..b0a775450fe 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -72,14 +72,13 @@ SECURITY_CFLAGS_pn-openssl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-opensp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-ppp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-python-backports-lzma = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-python-smartpm = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-python-pygpgme = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3-pycairo = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
-# Revert RPM to using internally supported values
-SECURITY_CFLAGS_pn-rpm = "${lcl_maybe_fortify} -fstack-protector"
 SECURITY_CFLAGS_pn-syslinux = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-slang = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-source-highlight = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.11.0


