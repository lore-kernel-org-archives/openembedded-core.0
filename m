Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE8D6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 05:36:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 07 Mar 2016 21:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,555,1449561600"; d="scan'208";a="919077639"
Received: from jlee45-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.164.131])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2016 21:36:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 18:35:59 +1300
Message-Id: <cover.1457415260.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/6] recipetool create improvements
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
X-List-Received-Date: Tue, 08 Mar 2016 05:36:39 -0000

Improvements to the following areas of recipetool create:
* License detection
* Autotools program mapping and spacing in macro regexes
* npm module handling


The following changes since commit 0d02159c8d66bb136f7da2c10fda7d1a57f40cec:

  image.bbclass: fix incomplete .rootfs customization (2016-03-07 22:01:16 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool3

Paul Eggleton (6):
  recipetool: create: be more tolerant of spacing in configure.ac
  recipetool: create: improve mapping for autotools program macros
  recipetool: create: match *LICENSE* as a license file
  recipetool: create: add license file crunching
  recipetool: create: split npm module dependencies into packages
  recipetool: create: check if npm available if npm:// URL specified

 meta/classes/npm.bbclass                  |  12 +++
 meta/lib/oe/package.py                    |  24 ++++++
 scripts/lib/recipetool/create.py          | 135 +++++++++++++++++++++++++++++-
 scripts/lib/recipetool/create_buildsys.py |  54 ++++++++----
 scripts/lib/recipetool/create_npm.py      |  42 +++++++++-
 5 files changed, 245 insertions(+), 22 deletions(-)

-- 
2.5.0


