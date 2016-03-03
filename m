Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 09EFA7710C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 17:45:51 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 03 Mar 2016 09:45:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,532,1449561600"; d="scan'208";a="59276070"
Received: from nikhilbh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.241])
	by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2016 09:45:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 06:44:55 +1300
Message-Id: <cover.1457027073.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] recipetool bugfix
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
X-List-Received-Date: Thu, 03 Mar 2016 17:45:52 -0000

The following changes since commit 092984669d8590627cfb188a0aa00244e22c4671:

  e2fsprogs: do not enable non-stable features by default (2016-03-03 10:48:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool-fix

Paul Eggleton (1):
  recipetool: create: fix support for AX_CHECK_LIBRARY

 scripts/lib/recipetool/create_buildsys.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.5.0


