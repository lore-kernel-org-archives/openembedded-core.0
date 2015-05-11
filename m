Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id ADF916013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 13:17:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 May 2015 06:17:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,407,1427785200"; d="scan'208";a="708359952"
Received: from nshraga-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.5.146])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2015 06:17:14 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2015 16:17:00 +0300
Message-Id: <1431350231-29495-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 00/11] devtool: code style fixes
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
X-List-Received-Date: Mon, 11 May 2015 13:17:16 -0000

This patchset contains numerous small non-functional changes to fix some style
errors and to improve the readability of the devtool code.

Markus Lehtonen (11):
  devtool: standard plugins: add missing docstrings
  devtool: standard plugins: remove unused import
  devtool: standard plugins: rename usunused variable
  devtool: lib: add missing docstrings
  devtool: lib: remove unnecessary re-import
  devtool: lib: wrap long lines in code
  devtool: deploy plugin: fix bad indentation
  devtool: deploy plugin: add missing docstrings
  devtool: deploy plugin: remove unnecessary re-import
  devtool: deploy plugin: rename unused variables
  devtool: deploy plugin: wrap long lines in code

 scripts/lib/devtool/__init__.py |  15 ++++--
 scripts/lib/devtool/deploy.py   | 112 ++++++++++++++++++++++++++++------------
 scripts/lib/devtool/standard.py |  23 +++++++--
 3 files changed, 110 insertions(+), 40 deletions(-)

-- 
2.1.4


