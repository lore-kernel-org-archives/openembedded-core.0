Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D31EA77337
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 21:17:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 15 Dec 2016 13:17:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,354,1477983600"; d="scan'208";a="203074697"
Received: from weipengl-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.182.212])
	by fmsmga004.fm.intel.com with ESMTP; 15 Dec 2016 13:17:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 10:17:36 +1300
Message-Id: <cover.1481836625.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] devtool: modify: fix usage on the kernel
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
X-List-Received-Date: Thu, 15 Dec 2016 21:17:45 -0000

Fix for a regression caused by my tinfoil2 changes.


The following changes since commit 91f856426c7523e1ebdf6d6f93f5fa7e509d6e49:

  oeqa/utils/commands.py: Fix get_bb_vars() when called without arguments (2016-12-14 16:14:59 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-tinfoil2-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-tinfoil2-fix

Paul Eggleton (1):
  devtool: modify: fix usage on the kernel

 scripts/lib/devtool/standard.py | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.5.5


