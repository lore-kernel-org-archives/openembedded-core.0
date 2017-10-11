Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E58CD700F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 21:08:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 14:09:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,362,1503385200"; d="scan'208";a="1204825057"
Received: from jalamego-mobl3.zpn.intel.com ([10.219.128.138])
	by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2017 14:09:00 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 16:08:43 -0500
Message-Id: <1507756125-29469-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] pycairo & pygobject updates
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
X-List-Received-Date: Wed, 11 Oct 2017 21:09:00 -0000

python3-pycairo and python3-pygobject recipes must be updated to latest
stable release.
Being python3-cairo a dependency for python3-pygobject, the former must
be updated before the latter, due to version requirements.

Changes are detailed in each commit message.

Jose Lamego (2):
  python3-pycairo: update to 1.15.3
  python3-pygobject: update to 3.26.0

 .../python/python3-pycairo_1.10.0.bb               | 42 ----------------------
 .../python/python3-pycairo_1.15.3.bb               | 30 ++++++++++++++++
 ...bject_3.24.1.bb => python3-pygobject_3.26.0.bb} |  6 ++--
 3 files changed, 32 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycairo_1.10.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycairo_1.15.3.bb
 rename meta/recipes-devtools/python/{python3-pygobject_3.24.1.bb => python3-pygobject_3.26.0.bb} (76%)

-- 
2.7.4


