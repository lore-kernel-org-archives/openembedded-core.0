Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4F874774EA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:21:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jun 2016 02:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994442355"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:21:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:21:05 +0300
Message-Id: <1464945665-2886-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] security_flags.inc: add an entry for python3-numpy
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
X-List-Received-Date: Fri, 03 Jun 2016 09:21:18 -0000

The entry is same as for python-numpy and prevents build failures
when extra security flags are in use (e.g. in poky-lsb).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index a4c0ead..ea1d4e5 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -79,6 +79,7 @@ SECURITY_CFLAGS_pn-python = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-pycurl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-smartpm = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python-numpy = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-python3-numpy = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-python3 = "${SECURITY_NO_PIE_CFLAGS}"
 # Revert RPM to using internally supported values
 SECURITY_CFLAGS_pn-rpm = "${lcl_maybe_fortify} -fstack-protector"
-- 
2.8.1


