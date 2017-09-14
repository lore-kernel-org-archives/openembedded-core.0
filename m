Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 008AF781CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 04:15:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 13 Sep 2017 21:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,391,1500966000"; d="scan'208";a="151648806"
Received: from babarret-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.243])
	by fmsmga006.fm.intel.com with ESMTP; 13 Sep 2017 21:15:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 16:15:10 +1200
Message-Id: <cover.1505361895.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH v2 0/2] A couple of devtool fixes
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
X-List-Received-Date: Thu, 14 Sep 2017 04:15:26 -0000

A fix for devtool modify and other source extracting subcommands to
handle dependencies, and a fix for devtool modify within the eSDK.

NOTE: the patch I just sent to the bitbake list to fix a bug in the way
empty directory notifications should be merged prior to merging this
series.

Changes since v1:
* Drop the invalidateParseCache command call since I have sent a fix
  for the bug that caused it to be required.


The following changes since commit 2ebbeb61114e4b847e9164c621ac87b5cf03a299:

  staging: gracefully abort if two recipes conflict in the sysroot (2017-09-11 17:30:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool30-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool30-oe

Paul Eggleton (2):
  devtool: rework source extraction so that dependencies are handled
  devtool: ensure recipes devtool is working on are unlocked within the eSDK

 meta/classes/devtool-source.bbclass     | 165 ++++++++++++++++++++++++
 meta/classes/populate_sdk_ext.bbclass   |   3 +
 meta/classes/sstate.bbclass             |   9 +-
 meta/lib/oeqa/selftest/cases/devtool.py |  10 +-
 scripts/devtool                         |  20 ---
 scripts/lib/devtool/__init__.py         |  40 ++++++
 scripts/lib/devtool/standard.py         | 217 ++++++++++----------------------
 scripts/lib/devtool/upgrade.py          |   9 +-
 8 files changed, 295 insertions(+), 178 deletions(-)
 create mode 100644 meta/classes/devtool-source.bbclass

-- 
2.9.5


