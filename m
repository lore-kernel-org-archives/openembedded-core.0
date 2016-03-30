Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB1160124
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 19:45:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 30 Mar 2016 12:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,417,1455004800"; d="scan'208";a="774903642"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 30 Mar 2016 12:45:53 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 12:31:53 -0700
Message-Id: <1459366314-23967-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: jurobystricky@hotmail.com
Subject: [jethro][PATCH 0/1] nativesdk-python3 build fix
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
X-List-Received-Date: Wed, 30 Mar 2016 19:45:55 -0000

Using jethro, this works fine:
   $ bitbake nativesdk-python

However, this fails with an error:
   $ bitbake nativesdk-python3

Objects/obmalloc.o: In function `_PyObject_DebugMallocStats':
 obmalloc.c:(.text+0x1360): undefined reference to `pool_is_in_list'
 collect2: error: ld returned 1 exit status
 make: *** [Parser/pgen] Error 1

Turns out this is the same issue as in YOCTO 8467, so the same fix/patch
by Alejandro Hernandez applied on python_3.4.3.bb fixes the problem.


Juro Bystricky (1):
  python3: fix building nativesdk-python3

 meta/recipes-devtools/python/python3_3.4.3.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


