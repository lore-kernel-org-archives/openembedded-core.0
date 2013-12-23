Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 685736B1FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 20:59:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Dec 2013 12:59:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,538,1384329600"; d="scan'208";a="448866683"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga001.fm.intel.com with ESMTP; 23 Dec 2013 12:59:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 20:59:50 +0000
Message-Id: <c8e7511d4a0ce264f3ce8413a929d285478e7404.1387832257.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1387832257.git.paul.eggleton@linux.intel.com>
References: <cover.1387832257.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1387832257.git.paul.eggleton@linux.intel.com>
References: <cover.1387832257.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] README: fix DISTRO = "" reference
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
X-List-Received-Date: Mon, 23 Dec 2013 20:59:58 -0000

DISTRO should be set to "nodistro" for distro-less configurations since
empty string results in empty items ending up in OVERRIDES leading to
unexpected behaviour with FILESPATH.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 7e6a7cb..665c98f 100644
--- a/README
+++ b/README
@@ -3,7 +3,7 @@ OpenEmbedded-Core
 
 OpenEmbedded-Core is a layer containing the core metadata for current versions
 of OpenEmbedded. It is distro-less (can build a functional image with
-DISTRO = "") and contains only emulated machine support.
+DISTRO = "nodistro") and contains only emulated machine support.
 
 For information about OpenEmbedded, see the OpenEmbedded website:
     http://www.openembedded.org/
-- 
1.8.1.2


