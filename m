Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QS38o-0006vF-2x
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:20:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2011 01:17:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; d="scan'208";a="10805872"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2011 01:17:17 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 16:17:14 +0800
Message-Id: <cover.1307002336.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
Subject: [PATCH 0/2] Upstream-status --> Upstream-Status and a fix to send-pull-request
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
X-List-Received-Date: Thu, 02 Jun 2011 08:20:31 -0000

Upstream-status --> Upstream-Status:
As a keyword, it's case sensitive, so let's fix the lowercase s here.

The fix to send-pull-request:
I don't know why othes doesn't complain about this, but without this patch,
the script can't run properly in my side.


Thanks,
-- Dexuan

The following changes since commit 484c4e73245c93a08413cd204513bf5c5698b994:

  clutter-1.6: Add patch to update gettext macro version (2011-06-01 18:34:37 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Dexuan Cui (2):
  recipes: Upstream-status --> Upstream-Status: for multiple patches
  send-pull-request: fix a small typo that fails the script

 .../eglibc/eglibc-2.13/IO-acquire-lock-fix.patch   |    2 +-
 .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    2 +-
 .../eglibc/eglibc-2.13/mips-rld-map-check.patch    |    2 +-
 .../eglibc-2.13/shorten-build-commands.patch       |    2 +-
 .../eglibc/eglibc-2.13/stack-protector-test.patch  |    2 +-
 .../elfutils/elfutils-0.148/mempcpy.patch          |    2 +-
 .../ghostscript/ghostscript-9.02-genarch.patch     |    2 +-
 .../ghostscript-9.02-prevent_recompiling.patch     |    2 +-
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |    2 +-
 scripts/send-pull-request                          |    2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.7.2



