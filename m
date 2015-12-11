Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 19D7E6FFDF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 00:51:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 10 Dec 2015 16:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,410,1444719600"; d="scan'208";a="871282119"
Received: from exxie-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.26])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2015 16:51:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Dec 2015 13:51:30 +1300
Message-Id: <cover.1449794902.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Fix for earlier buildtools fix
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
X-List-Received-Date: Fri, 11 Dec 2015 00:51:59 -0000

Hmm, turns out that whilst my earlier buildtools fix did fix the bug,
in question, it still wasn't quite right. Here's the bit I missed doing.


The following changes since commit 192da885e92d3b163b9c4e6b8151c9ecc6062b14:

  build-appliance-image: Update to master head revision (2015-12-09 08:49:13 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildtools-fix2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildtools-fix2

Paul Eggleton (1):
  nativesdk-buildtools-perl-dummy: properly set PACKAGE_ARCH

 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 2 --
 1 file changed, 2 deletions(-)

-- 
2.5.0


