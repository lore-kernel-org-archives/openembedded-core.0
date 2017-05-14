Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7215C71D9D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 May 2017 22:00:19 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 14 May 2017 15:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,341,1491289200"; d="scan'208";a="261524599"
Received: from cdhirema-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.50])
	by fmsmga004.fm.intel.com with ESMTP; 14 May 2017 15:00:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 09:59:51 +1200
Message-Id: <cover.1494799168.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/2] Minor recipetool create fixes
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
X-List-Received-Date: Sun, 14 May 2017 22:00:19 -0000

The following changes since commit c59fa3bd71b42410bf032846ee8fdb6e6eb1b95c:

  python*-git: Upgrade to version 2.1.3 (2017-05-12 08:49:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-fixes8
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/recipetool-fixes8

Paul Eggleton (2):
  recipetool: create: skip values extracted from spec files containing macros
  recipetool: create: extract name of package from a repository

 scripts/lib/recipetool/create.py          | 11 ++++++++---
 scripts/lib/recipetool/create_buildsys.py |  4 ++++
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.9.3


