Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F23B676AC2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 17:12:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2015 10:12:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,739,1432623600"; d="scan'208";a="789926553"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.5.148])
	by fmsmga002.fm.intel.com with ESMTP; 24 Aug 2015 10:12:17 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 12:12:18 -0500
Message-Id: <1440436338-28264-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440436338-28264-1-git-send-email-anibal.limon@linux.intel.com>
References: <1440436338-28264-1-git-send-email-anibal.limon@linux.intel.com>
Subject: [PATCH 2/2][dizzy] license.bbclass: fix unexpected operator for LICENSE values with space
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
X-List-Received-Date: Mon, 24 Aug 2015 17:12:18 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* add quotes around pkged_lic so that it works correctly with spaces
* fixes following error:
  run.license_create_manifest.50601: 193: [: GPLv2: unexpected operator

(From OE-Core rev: 2bb8b2abb689d91b7b7e28e6bd528747bde94dd2)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index dfb162d..8d383ca 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -50,7 +50,7 @@ license_create_manifest() {
 		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
 		pkged_name="$(basename $(readlink ${filename}))"
 		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; p }" ${filename})"
-		if [ -z ${pkged_lic} ]; then
+		if [ -z "${pkged_lic}" ]; then
 			# fallback checking value of LICENSE
 			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; p }" ${filename})"
 		fi
-- 
1.9.1


