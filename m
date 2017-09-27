Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3BC71CB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 08:08:16 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Sep 2017 01:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,444,1500966000"; d="scan'208";a="153854534"
Received: from summit.tm.intel.com ([10.237.55.152])
	by orsmga005.jf.intel.com with ESMTP; 27 Sep 2017 01:08:16 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 11:08:13 +0300
Message-Id: <20170927080815.18392-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170926120328.14928-1-mikko.ylinen@linux.intel.com>
References: <20170926120328.14928-1-mikko.ylinen@linux.intel.com>
Subject: [PATCH v2 0/2] remove update-alternatives correctly
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
X-List-Received-Date: Wed, 27 Sep 2017 08:08:17 -0000

v2: move the fix to rootfs.py and implement 2-stage removal
based on the feedback. split the fix and the logging improvements
in two commits.

Mikko Ylinen (2):
  rootfs.py: remove update-alternatives correctly
  package_manager: rpm: improve logging

 meta/lib/oe/package_manager.py |  4 +++-
 meta/lib/oe/rootfs.py          | 17 ++++++++++++-----
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.1.4


