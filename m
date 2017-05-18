Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EAB1278092
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 22:28:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 15:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,360,1491289200"; d="scan'208";a="1150009228"
Received: from jalamego-mobl2.zpn.intel.com ([10.219.128.138])
	by fmsmga001.fm.intel.com with ESMTP; 18 May 2017 15:28:51 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 17:28:45 -0500
Message-Id: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] bc: upgrade 1.06 to 1.07.1
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
X-List-Received-Date: Thu, 18 May 2017 22:28:51 -0000

bc recipe must be upgraded to latest version in upstream.

Changes in this series:
    include ed to the hosttools required to run builds with oe-core,
    since the new bc version requires the ed command during build

    upgrade bc version from 1.06 to 1.07.1

    update bc license from "GPLv2+ & LGPLv2.1" to "GPLv3+ & LGPLv3"

    unset PARALLEL_MAKE variable in bc recipe to prevent a
    Parallel Make Race during build

Jose Lamego (2):
  conf/bitbake.conf: include ed in hosttools
  bc: upgrade 1.06 to 1.07.1

 meta/conf/bitbake.conf                             |  2 +-
 .../bc/{bc_1.06.bb => bc_1.07.1.bb}                | 22 +++++++++++-----------
 2 files changed, 12 insertions(+), 12 deletions(-)
 rename meta/recipes-extended/bc/{bc_1.06.bb => bc_1.07.1.bb} (28%)

-- 
2.7.4


