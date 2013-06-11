Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EF8A96A9D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 20:53:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Jun 2013 13:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,847,1363158000"; d="scan'208";a="351677065"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.247])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jun 2013 13:53:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 13:53:01 -0700
Message-Id: <1370983981-7905-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] buildtools-tarball: add difflib and pprint python modules
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
X-List-Received-Date: Tue, 11 Jun 2013 20:53:01 -0000

Needed for the unittest part of bitbake-selftest can work correctly.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 4744daf..00fc26f 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -30,6 +30,8 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-python-compression \
     nativesdk-python-json \
     nativesdk-python-unittest \
+    nativesdk-python-difflib \
+    nativesdk-python-pprint \
     nativesdk-chrpath \
     nativesdk-tar \
     nativesdk-git \
-- 
1.8.1.4


