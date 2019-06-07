Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CBE2A7E557
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 23:48:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2019 16:48:15 -0700
X-ExtLoop1: 1
Received: from chiron.jf.intel.com ([10.54.74.38])
	by orsmga005.jf.intel.com with ESMTP; 07 Jun 2019 16:48:15 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 16:47:52 -0700
Message-Id: <0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] scons.bbclass: use python3-scons
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
X-List-Received-Date: Fri, 07 Jun 2019 23:48:13 -0000
Content-Transfer-Encoding: 8bit

SCons has supported python3 since 3.0.0 release, use it.

[YOCTO #13381]

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/classes/scons.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 9ee7d1587d..a8ddae35f7 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -1,4 +1,4 @@
-DEPENDS += "python-scons-native"
+DEPENDS += "python3-scons-native"
 
 EXTRA_OESCONS ?= ""
 
-- 
2.20.1


