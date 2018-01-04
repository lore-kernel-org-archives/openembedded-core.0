Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E51466011B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 04:59:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2018 20:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,505,1508828400"; d="scan'208";a="164047901"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga004.jf.intel.com with ESMTP; 03 Jan 2018 20:59:56 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  4 Jan 2018 12:54:07 +0800
Message-Id: <1515041649-67749-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [pyro] [PATCH 0/2] Fix for fetcher failure on SRC_URI
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
X-List-Received-Date: Thu, 04 Jan 2018 04:59:57 -0000

We encountered a few fetcher failures on pyro branch.
A further investigation has been done and verified that
it is not a transient network issue.

Chang Rebecca Swee Fun (1):
  liburi-perl: update SRC_URI to yoctoproject mirror

Ross Burton (1):
  diffstat: use HTTP mirror for SRC_URI

 meta/recipes-devtools/diffstat/diffstat_1.61.bb | 2 +-
 meta/recipes-devtools/perl/liburi-perl_1.71.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4


