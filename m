Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA2472FC4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:49:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 06:49:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875905"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:49:08 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:56 +0200
Message-Id: <da21fa09510e1760fb0bd9ed50cb35b8ca84ce57.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 39/39] security_flags.inc: update to reflect smart->dnf transition
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
X-List-Received-Date: Tue, 21 Feb 2017 14:49:07 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 77416bc11e7..99a0a33969f 100644
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


