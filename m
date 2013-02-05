Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1U2jjA-0007Q4-7q
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 15:42:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Feb 2013 06:26:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="283046106"
Received: from unknown (HELO localhost) ([10.255.12.93])
	by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2013 06:26:37 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 08:26:36 -0600
Message-Id: <341343d75f79054134a88814833ff75823a787ac.1360074262.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1360074262.git.tom.zanussi@linux.intel.com>
References: <cover.1360074262.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] crosstap: handle hyphenated x86_64 target arch
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
X-List-Received-Date: Tue, 05 Feb 2013 14:42:34 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

systemtap_target_arch() should also translate x86-64 (hyphenated) into
x86_64 for the -a param.  Failing to do that causes systemtap to see
an architecture mismatch and create a cloned session with a bogusly
synthesized build directory path, and fails to compile the probe.

 Fixes [YOCTO #3756]

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/crosstap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/crosstap b/scripts/crosstap
index 783bf2f..58317cf 100755
--- a/scripts/crosstap
+++ b/scripts/crosstap
@@ -70,7 +70,7 @@ function systemtap_target_arch() {
         i?86)
             SYSTEMTAP_TARGET_ARCH="i386"
             ;;
-        x86_64*)
+        x86?64*)
             SYSTEMTAP_TARGET_ARCH="x86_64"
             ;;
         arm*)
-- 
1.7.11.4



