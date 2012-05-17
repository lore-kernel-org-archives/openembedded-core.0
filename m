Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SUx94-0006NU-GH
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 11:37:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 May 2012 02:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="167517742"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.120])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2012 02:27:14 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 17:25:05 +0800
Message-Id: <cover.1337246557.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/3] Misc fixes for multilib
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
X-List-Received-Date: Thu, 17 May 2012 09:37:18 -0000

This patch set added a package QA function to detect the potential incorrected
package dependencies for multilib packages.

It also fixed the locale related package name in multilib case reported by the
new package QA function.

The following changes since commit 2cf6e7cf81c0b864b5d51be60094a6eb3e584383:
  Andrei Gherzan (1):
        fotowall: Add #include ui_wizard.h to ExportWizard.cpp

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/multilib2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/multilib2

Lianhao Lu (3):
  (libc-)package.bbclass: Added MLPREFIX to locale packages.
  multilib.conf: Added multilib support for kmod.
  multilib.bbclass: Added multilib specific package QA.

 meta/classes/libc-package.bbclass |    4 ++--
 meta/classes/multilib.bbclass     |   31 +++++++++++++++++++++++++++++++
 meta/classes/package.bbclass      |    5 +++--
 meta/conf/multilib.conf           |    1 +
 4 files changed, 37 insertions(+), 4 deletions(-)



