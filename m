Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 191D960043
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 23:18:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2016 15:18:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,554,1449561600"; d="scan'208";a="759846222"
Received: from yihsuany-mobl1.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.255.84.75])
	by orsmga003.jf.intel.com with ESMTP; 07 Mar 2016 15:18:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon,  7 Mar 2016 15:18:38 -0800
Message-Id: <1457392718-14397-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH v2] no-static-libs: Ensure correct whitespace is set for _append
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
X-List-Received-Date: Mon, 07 Mar 2016 23:18:56 -0000

Adjusted white space in the DISABLE_STATIC to make output of the -e
option more readable.

Before:
 " --enable-opt1 --with_opt1=${libdir}${DISABLE_STATIC}
After
 " --enable-opt1 --with_opt1=${libdir} ${DISABLE_STATIC}

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
v2: Fixed commit message to show what was getting fixed

 meta/conf/distro/include/no-static-libs.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 6c0f859..0ab99c0 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -1,4 +1,4 @@
-DISABLE_STATIC = " --disable-static"
+DISABLE_STATIC = "--disable-static"
 
 # qemu aborts on unrecognised option
 DISABLE_STATIC_pn-qemu = ""
@@ -27,6 +27,6 @@ DISABLE_STATIC_pn-nativesdk-openssl = ""
 # libssp-static-dev included in build-appliance
 DISABLE_STATIC_pn-gcc-runtime = ""
 
-EXTRA_OECONF_append = "${DISABLE_STATIC}"
+EXTRA_OECONF_append = " ${DISABLE_STATIC}"
 
-EXTRA_OECMAKE_append_pn-libical = "-DSHARED_ONLY=True"
+EXTRA_OECMAKE_append_pn-libical = " -DSHARED_ONLY=True"
-- 
2.5.0


