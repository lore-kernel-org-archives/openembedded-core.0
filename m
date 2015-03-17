Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 098DB738A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 16:06:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Mar 2015 09:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,417,1422950400"; d="scan'208";a="542145557"
Received: from gwu9-mobl.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.252.136.33])
	by orsmga003.jf.intel.com with ESMTP; 17 Mar 2015 09:05:22 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2015 10:06:22 -0600
Message-Id: <cover.1426608243.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCHv2 0/3] Recipes fix for build in x32 ABI
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
X-List-Received-Date: Tue, 17 Mar 2015 16:06:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next set of patches fixes builds for mdadm, systemtap and puzzles related 
to time_t that is long long int in x32 ABI instead of long int in normal x86_64.

The following changes since commit df0672b038e6942c97d266af9ca175a06f2b0423:

  bitbake: toaster: Fix the orderkey to match the column (2015-03-16 17:44:13 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/x32_time_t_bugs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/x32_time_t_bugs

Aníbal Limón (3):
  mdadm: Fix build in x32 ABI
  systemtap: Fix build in x32 ABI
  puzzles: Fix build in x32 ABI

 .../mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch   | 26 +++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb         |  1 +
 .../systemtap/systemtap/x32_abi_time.patch         | 34 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 .../puzzles/files/puzzles_x32_abi_time.patch       | 30 +++++++++++++++++++
 meta/recipes-sato/puzzles/puzzles_r10116.bb        |  1 +
 6 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/x32_abi_time.patch
 create mode 100644 meta/recipes-sato/puzzles/files/puzzles_x32_abi_time.patch

-- 
1.9.1


