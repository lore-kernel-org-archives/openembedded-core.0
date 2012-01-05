Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RigkH-0000w2-KN
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 07:24:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jan 2012 22:16:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92571713"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 04 Jan 2012 22:16:49 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2012 22:16:31 -0800
Message-Id: <cover.1325743881.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/3] Patch Status and non-GPLv3 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2012 06:24:13 -0000

Richard,

A few non-GPLv3 fixes for updated packages and more Patch
Status updates.

Sau!

The following changes since commit f309769d10cb3d8b72b8c7c4f7f418dcb8422c61:

  valgrind: Fix for automake update (2012-01-04 16:03:59 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix2

Saul Wold (3):
  Patch Upstream-Status Update
  util-linux: Update patch for non-GPLv3
  gnutls: remove gettext patch for non-GPLv3

 .../util-linux-2.20.1/remove-lscpu.patch           |   94 +------------------
 meta/recipes-devtools/guilt/files/guilt-bash.patch |    2 +
 .../guilt/files/guilt-import-commit.patch          |    2 +
 meta/recipes-devtools/guilt/files/guilt-init.patch |    2 +
 meta/recipes-devtools/guilt/files/guilt-pop.patch  |    2 +
 .../guilt/files/guilt-push-no-series.patch         |    2 +
 meta/recipes-devtools/guilt/files/guilt-push.patch |    2 +
 .../guilt/files/guilt-set-git_exec_path.patch      |    2 +
 meta/recipes-devtools/guilt/files/guilt.patch      |    2 +
 .../guilt/files/improve_auto_header_gen.patch      |    2 +
 .../files/make_git_commands_conditional.patch      |    2 +
 .../guilt/files/optional_head_check.patch          |    2 +
 .../guilt/files/uninstall_force.patch              |    2 +
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |   13 ++-
 14 files changed, 39 insertions(+), 92 deletions(-)

-- 
1.7.6.4



