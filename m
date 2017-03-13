Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A0C04601F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 23:06:20 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2017 16:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,161,1486454400"; d="scan'208";a="67073528"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 13 Mar 2017 16:06:20 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 16:06:15 -0700
Message-Id: <1489446377-13434-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com
Subject: [morty][PATCH 0/2] GDB: fix missing modules
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
X-List-Received-Date: Mon, 13 Mar 2017 23:06:31 -0000

This is a backport of two patches by George McCollister needed to
fix GDB from complaining:

Python Exception <class 'ImportError'> No module named 'imp':
...


[YOCTO#11134]


*** BLURB HERE ***

George McCollister (1):
  gdb-cross-canadian: Depend on nativesdk-python3-importlib

Juro Bystricky (1):
  python-3.5-manifest: Add imp to importlib

 meta/recipes-devtools/gdb/gdb-cross-canadian.inc     | 3 ++-
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.7.4


