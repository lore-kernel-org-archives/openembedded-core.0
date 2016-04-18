Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3C15060721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 03:27:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 17 Apr 2016 20:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,500,1455004800"; d="scan'208";a="786863168"
Received: from mbmatesa-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.151])
	by orsmga003.jf.intel.com with ESMTP; 17 Apr 2016 20:27:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2016 15:27:06 +1200
Message-Id: <cover.1460949989.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] Fix buildtools issue preventing eSDK + ipk working
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
X-List-Received-Date: Mon, 18 Apr 2016 03:27:49 -0000

The following changes since commit 37aac647d510557323083c77c3114476440a325d:

  fs-perms.txt: fix ROOT_HOME's permission (2016-04-15 06:58:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildtools-perl-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildtools-perl-fix

Paul Eggleton (1):
  buildtools-tarball: fix perl being included when building with ipk

 meta/recipes-core/meta/buildtools-tarball.bb              | 2 +-
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.5.5


