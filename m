Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5C82B731E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 19:49:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 May 2016 12:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,615,1455004800"; d="scan'208";a="980017477"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.164])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2016 12:49:04 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 14:49:28 -0500
Message-Id: <1463168968-29526-5-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1463168968-29526-1-git-send-email-anibal.limon@linux.intel.com>
References: <1463168968-29526-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com, edwin.plauchu.camacho@intel.com
Subject: [PATCH 4/4] security_flags: Enable security flags on leafpad, ltp and libuser.
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
X-List-Received-Date: Fri, 13 May 2016 19:49:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now we have patches that solves the security formatting issues into
those packages.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 5755d28..7a91cec 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -103,9 +103,6 @@ SECURITY_STRINGFORMAT_pn-expect = ""
 SECURITY_STRINGFORMAT_pn-gcc = ""
 SECURITY_STRINGFORMAT_pn-gettext = ""
 SECURITY_STRINGFORMAT_pn-kexec-tools = ""
-SECURITY_STRINGFORMAT_pn-leafpad = ""
-SECURITY_STRINGFORMAT_pn-libuser = ""
-SECURITY_STRINGFORMAT_pn-ltp = ""
 SECURITY_STRINGFORMAT_pn-makedevs = ""
 SECURITY_STRINGFORMAT_pn-oh-puzzles = ""
 SECURITY_STRINGFORMAT_pn-stat = ""
-- 
2.1.4


