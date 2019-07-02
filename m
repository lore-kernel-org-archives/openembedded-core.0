Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14AA87EADB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 04:24:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2019 21:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; d="scan'208";a="157502501"
Received: from aradinsa-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.181.235])
	by orsmga008.jf.intel.com with ESMTP; 01 Jul 2019 21:24:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:23:58 +1200
Message-Id: <cover.1562041417.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/2] devtool/recipetool fixes
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
X-List-Received-Date: Tue, 02 Jul 2019 04:24:31 -0000
Content-Transfer-Encoding: 8bit

The following changes since commit 1f8a73261c7a134821c40845da27d8edbb0763b6:

  Revert "pigz: Add debug for autobuilder errors" (2019-06-30 23:33:12 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool36-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool36-oe

Paul Eggleton (2):
  recipetool: ignore zero-length setup.py files
  devtool: upgrade: fix handling of errors parsing upgraded recipe

 scripts/lib/devtool/upgrade.py                | 28 ++++++++++++-------
 .../lib/recipetool/create_buildsys_python.py  |  9 ++++--
 2 files changed, 25 insertions(+), 12 deletions(-)

-- 
2.20.1


