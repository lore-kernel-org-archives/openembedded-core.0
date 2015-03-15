Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5E1C60034
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2015 21:28:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 15 Mar 2015 14:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,405,1422950400"; d="scan'208";a="467614972"
Received: from feifeich-mobl.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.252.141.167])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2015 14:21:41 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2015 15:28:50 -0600
Message-Id: <cover.1426454666.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] fixes for x32 ABI build
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
X-List-Received-Date: Sun, 15 Mar 2015 21:28:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next set of patches fixes builds for mdadm, systemtap and puzzles related 
to time_t that is long long int in x32 ABI instead of long int in normal x86_64.

The following changes since commit 7f30749fe026e9ceb75d73b89271145a45a60763:

  oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:50:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/x32_time_t_bugs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/x32_time_t_bugs

Aníbal Limón (3):
  mdadm: Fix build in x32 ABI
  systemtap: Fix build in x32 ABI
  puzzles: Fix build in x32 ABI

 .../mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch   | 24 ++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb         |  1 +
 .../systemtap/systemtap/x32_abi_time.patch         | 32 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 .../puzzles/files/puzzles_x32_abi_time.patch       | 28 +++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_r10116.bb        |  1 +
 6 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/x32_abi_time.patch
 create mode 100644 meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch

-- 
1.9.1


