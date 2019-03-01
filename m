Return-Path: <naveen.kumar.saini@intel.com>
X-Greylist: delayed 572 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Mar 2019 08:05:09 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id AF2287CD28
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 08:05:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2019 23:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,426,1544515200"; d="scan'208";a="120050622"
Received: from optimus-prime.png.intel.com ([172.30.199.130])
	by orsmga006.jf.intel.com with ESMTP; 28 Feb 2019 23:55:37 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2019 15:55:17 +0800
Message-Id: <20190301075517.25999-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH v2] parselogs.py: ignore regulatory.db load failure messages for x86*
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
X-List-Received-Date: Fri, 01 Mar 2019 08:05:09 -0000

[YOCTO #13098]

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index e3465ea71e..bed4a022cd 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -69,6 +69,8 @@ x86_common = [
     'amd_nb: Cannot enumerate AMD northbridges',
     'failed to retrieve link info, disabling eDP',
     'Direct firmware load for iwlwifi',
+    'Direct firmware load for regulatory.db',
+    'failed to load regulatory.db',
 ] + common_errors
 
 qemux86_common = [
-- 
2.17.0


