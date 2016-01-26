Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 84945770F9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 00:21:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 16:20:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,347,1449561600"; d="scan'208";a="868528142"
Received: from wkhoh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.195])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2016 16:20:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 13:20:23 +1300
Message-Id: <cover.1453767579.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Fix for extensible SDK build failure
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
X-List-Received-Date: Tue, 26 Jan 2016 00:21:03 -0000

Fixes a failure we've seen on the Yocto Project autobuilder when
building the extensible SDK.


The following changes since commit fc4209baa098caebf9c4cb75f9a6f2e85f43333c:

  Revert "xz: Allow to work with ASSUME_PROVIDED xz-native" (2016-01-25 10:08:25 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdk-path-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdk-path-fix

Paul Eggleton (1):
  gen-lockedsig-cache: fix bad destination path joining

 scripts/gen-lockedsig-cache | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.5.0


