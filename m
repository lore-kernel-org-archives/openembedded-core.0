Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7AF4460169
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 14:05:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 05 Feb 2015 05:59:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,524,1418112000"; d="scan'208";a="647782343"
Received: from mhgreen-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.19.49])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2015 06:04:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 14:03:58 +0000
Message-Id: <cover.1423144990.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] devtool/recipetool command-line help fixes
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
X-List-Received-Date: Thu, 05 Feb 2015 14:05:36 -0000

The following changes since commit eb9d896db2fc67bac8efd258744d06fbbee87f06:

  libtool: avoid running automake/autoconf --version (2015-02-05 09:45:49 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-cmdline-help
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-cmdline-help

Paul Eggleton (2):
  devtool: improve command-line help
  recipetool: improve command-line help

 scripts/devtool                  | 18 ++++++++++--------
 scripts/lib/devtool/standard.py  | 13 ++++++++++---
 scripts/lib/recipetool/create.py |  8 +++++---
 scripts/recipetool               |  6 +++---
 4 files changed, 28 insertions(+), 17 deletions(-)

-- 
1.9.3


