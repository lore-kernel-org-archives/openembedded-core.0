Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 941B16059F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Nov 2017 22:00:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Nov 2017 14:00:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,385,1505804400"; d="scan'208";a="1243245079"
Received: from mintingh-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.199])
	by fmsmga002.fm.intel.com with ESMTP; 12 Nov 2017 14:00:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 11:00:24 +1300
Message-Id: <cover.1510524005.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/1] recipetool: create: fix failure handling included dicts
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
X-List-Received-Date: Sun, 12 Nov 2017 22:00:57 -0000

The following changes since commit a17f3ec910366e9e7551fa24fbc07929b9584341:

  dhcp: fix build issue with libxml2 support (2017-11-10 14:44:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool-fix2
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/recipetool-fix2

Paul Eggleton (1):
  recipetool: create: fix failure handling included dicts

 scripts/lib/recipetool/create_buildsys_python.py | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.9.5


