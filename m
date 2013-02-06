Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1U37Mi-0003cX-6J
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 16:56:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Feb 2013 07:41:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,615,1355126400"; d="scan'208";a="253378775"
Received: from unknown (HELO localhost) ([10.255.12.217])
	by azsmga001.ch.intel.com with ESMTP; 06 Feb 2013 07:40:59 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org,
	ross.burton@intel.com
Date: Wed,  6 Feb 2013 09:40:58 -0600
Message-Id: <f651997fbd77a84e5c9c379898836cf4cb3340f1.1360165052.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1360165052.git.tom.zanussi@linux.intel.com>
References: <cover.1360165052.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1][danny] crosstap: handle hyphenated x86_64 target arch
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
X-List-Received-Date: Wed, 06 Feb 2013 15:56:57 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

systemtap_target_arch() should also translate x86-64 (hyphenated) into
x86_64 for the -a param.  Failing to do that causes systemtap to see
an architecture mismatch and create a cloned session with a bogusly
synthesized build directory path, and fails to compile the probe.

 Fixes [YOCTO #3756]

(From OE-Core rev: 98cae0544884cb5700d42409ec4a9584a17dc9a4)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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



