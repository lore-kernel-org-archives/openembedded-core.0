Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF4E749F9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 15:51:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 08:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,401,1517904000"; d="scan'208";a="39069228"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2018 08:51:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 18:45:23 +0300
Message-Id: <20180403154524.31588-7-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
References: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/8] gio-module-cache.bbclass: pass in ${libexecdir}
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
X-List-Received-Date: Tue, 03 Apr 2018 15:51:57 -0000

When it was something else than /usr/libexec (e.g. when
installing native SDK packages), things broke down.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gio-module-cache.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
index a8190b7b89a..e429bd31976 100644
--- a/meta/classes/gio-module-cache.bbclass
+++ b/meta/classes/gio-module-cache.bbclass
@@ -9,6 +9,7 @@ if [ "x$D" != "x" ]; then
             mlprefix=${MLPREFIX} \
             binprefix=${MLPREFIX} \
             libdir=${libdir} \
+            libexecdir=${libexecdir} \
             base_libdir=${base_libdir} \
             bindir=${bindir}
 else
-- 
2.16.1


