Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 93E8977D1C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 08:17:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 01:17:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,257,1488873600"; d="scan'208";a="850336756"
Received: from lcosgrav-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.20.227])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2017 01:17:25 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 11:17:32 +0300
Message-Id: <20170427081733.20125-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH v2 0/1] oeqa.utils.metadata: cope with invalid lines in os-release file
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
X-List-Received-Date: Thu, 27 Apr 2017 08:17:28 -0000

Total rewrite of the patch, as per Joshua's comments. Refactor and move
get_os_release() from oeqa.utils.metadata to oe.lsb.

Markus Lehtonen (1):
  oe.lsb: add get_os_release()

 meta/lib/oe/lsb.py              | 33 ++++++++++++++++++++-------------
 meta/lib/oeqa/utils/metadata.py | 16 +++-------------
 2 files changed, 23 insertions(+), 26 deletions(-)

-- 
2.12.0


