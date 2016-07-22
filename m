Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DDE4606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 12:38:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2016 05:38:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,404,1464678000"; d="scan'208";a="1000491747"
Received: from lwong9-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.13])
	by orsmga001.jf.intel.com with ESMTP; 22 Jul 2016 05:38:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jul 2016 00:38:07 +1200
Message-Id: <6f804ba10dc914c7d68b976eaf249fce53252685.1469190931.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/8] classes/populate_sdk_ext: set default for SDK_INCLUDE_PKGDATA
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
X-List-Received-Date: Fri, 22 Jul 2016 12:38:45 -0000

We don't absolutely need this - it doesn't change the default
behaviour, but it seems to me we have a convention to set default values
so we should add one here.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 62f2c3e..720142f 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -20,6 +20,7 @@ SDK_EXT_task-populate-sdk-ext = "-ext"
 
 # Options are full or minimal
 SDK_EXT_TYPE ?= "full"
+SDK_INCLUDE_PKGDATA ?= "0"
 
 SDK_RECRDEP_TASKS ?= ""
 
-- 
2.5.5


