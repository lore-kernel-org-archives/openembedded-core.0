Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6E7126C1C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2019 10:53:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Nov 2019 02:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,322,1569308400"; d="scan'208";a="237289144"
Received: from ppatil-mobl1.amr.corp.intel.com (HELO shodan.fritz.box)
	([10.255.162.6])
	by fmsmga002.fm.intel.com with ESMTP; 19 Nov 2019 02:52:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Nov 2019 23:52:51 +1300
Message-Id: <cover.1574160556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/1] devtool: fix devtool upgrade with reproducible_builds class
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
X-List-Received-Date: Tue, 19 Nov 2019 10:53:03 -0000
Content-Transfer-Encoding: 8bit

NOTE: This change depends upon Richard's fix for recipetool create.

The following changes since commit 185ef531739fddb98577ba822d131188fc1d6c85:

  poky: Default to reproducible builds (2019-11-19 13:43:44 +1300)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib paule/devtool-rb-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/devtool-rb-fix

Paul Eggleton (1):
  devtool: fix devtool upgrade with reproducible_builds class

 scripts/lib/devtool/upgrade.py   |  5 +++--
 scripts/lib/recipetool/create.py |  4 +---
 scripts/lib/scriptutils.py       | 10 ++++++++++
 3 files changed, 14 insertions(+), 5 deletions(-)

-- 
2.20.1


