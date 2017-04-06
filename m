Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1D3E577CF6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 22:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491516112; x=1523052112;
	h=from:to:cc:subject:date:message-id;
	bh=Wi9hHNyki5lyN8K4mT9rg976PW079bCqeQ/pJOiLUQM=;
	b=Xj7IS5Vqo1XfL5c57NKBDWKgwNjyaI8Fl9TP3pGTq/iR6k+9mFSX2dfe
	QdanITjsVKP8F3tC3VHPAkG/WkquEw==;
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 15:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,161,1488873600"; d="scan'208";a="953035274"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by orsmga003.jf.intel.com with ESMTP; 06 Apr 2017 15:01:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 10:01:42 +1200
Message-Id: <cover.1491515976.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/2] OE-side fixes for bitbake-diffsigs
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
X-List-Received-Date: Thu, 06 Apr 2017 22:01:51 -0000

Fixes for lib/oe/sstatesig.py corresponding to the bitbake-diffsigs
patchset I just sent to bitbake-devel.


The following changes since commit 901659a51cd53625a93f57a9c5865e90a07ec09d:

  oeqa/runtime/utils/targetbuildproject: use parent classes defaults tmpdir (2017-04-06 10:13:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/diffsigs-fixes-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/diffsigs-fixes-oe

Paul Eggleton (2):
  lib/oe/sstatesig: fix finding native siginfo files in sstate-cache
  lib/oe/sstatesig: avoid reporting duplicate siginfo files from sstate

 meta/lib/oe/sstatesig.py | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

-- 
2.9.3


