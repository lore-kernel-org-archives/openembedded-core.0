Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D41EF6FF6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 19:43:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 21 Mar 2016 12:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,373,1455004800"; d="scan'208";a="928821494"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2016 12:43:06 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 21:42:59 +0200
Message-Id: <cover.1458587440.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Bugfixes for matchbox panel
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
X-List-Received-Date: Mon, 21 Mar 2016 19:43:08 -0000

Two fixes for Matchbox panel Home-button issues:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=9026
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=9284

Thanks,
 Jussi

The following changes since commit 068afc5d436c716591a54f7d6e1944d8b6f9a198:

  tzdata: update to 2016b (2016-03-20 23:12:32 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/sato-home-icon
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/sato-home-icon

Jussi Kukkonen (2):
  matchbox-panel-2: Fix Home-button icon load issue
  matchbox-wm: Update to fix XChangeProperty datatype issue

 .../matchbox-wm/matchbox-wm_git.bb                 |  2 +-
 ...top-Make-sure-active-state-is-initialized.patch | 50 ++++++++++++++++++++++
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |  1 +
 3 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/matchbox-panel-2/files/0001-showdesktop-Make-sure-active-state-is-initialized.patch

-- 
2.1.4


