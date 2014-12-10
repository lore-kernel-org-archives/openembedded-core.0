Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8293F724FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 05:55:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2014 21:55:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,550,1413270000"; d="scan'208";a="635378092"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.161])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2014 21:55:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Dec 2014 21:55:15 -0800
Message-Id: <d09337b71154632d8c79f5afcf5cae0b6824fe09.1418190513.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
References: <cover.1418190513.git.sgw@linux.intel.com>
In-Reply-To: <cover.1418190513.git.sgw@linux.intel.com>
References: <cover.1418190513.git.sgw@linux.intel.com>
Subject: [PATCH 3/6] npth: npth needs pthread in some cases
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
X-List-Received-Date: Wed, 10 Dec 2014 05:55:30 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/npth/npth/pkgconfig.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/npth/npth/pkgconfig.patch b/meta/recipes-support/npth/npth/pkgconfig.patch
index 55d12c2..178ed54 100644
--- a/meta/recipes-support/npth/npth/pkgconfig.patch
+++ b/meta/recipes-support/npth/npth/pkgconfig.patch
@@ -3,6 +3,7 @@ Added npth pkgconfig file
 Upstream-Status: Incompatible [oe-core specific]
 
 Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
 Index: npth-1.1/src/npth.pc.in
 ===================================================================
 --- /dev/null
@@ -16,7 +17,7 @@ Index: npth-1.1/src/npth.pc.in
 +Name: npth
 +Description: a new portable posix threading library
 +Version: @VERSION@
-+Libs: -L${libdir} -lnpth
++Libs: -L${libdir} -lnpth -lpthread
 +Cflags: -I${includedir}
 Index: npth-1.1/src/Makefile.am
 ===================================================================
-- 
1.8.3.1


