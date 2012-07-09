Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SoHXS-00063A-JK
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:14:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2012 10:03:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190326774"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.244])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 10:03:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 18:03:06 +0100
Message-Id: <cover.1341853333.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Misc tidy-ups
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
X-List-Received-Date: Mon, 09 Jul 2012 17:14:22 -0000

The following changes since commit 8d8b9e77aa3403e880cbbdfefc7f24a993b3161f:

  linux-yocto/3.4: perf scripting & unionfs fixes (2012-07-09 17:06:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/cleanup2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/cleanup2

Paul Eggleton (3):
  libgsmd - remove
  core-image-minimal-dev: base on core-image-minimal
  core-image-*: remove copyright notices

 meta/conf/multilib.conf                            |    1 -
 .../gsm/files/0001-Introduce-ports.patch           |  712 --------------------
 ...ending-commands-before-restarting-the-mod.patch |   76 ---
 ...-segment-incoming-usock-data-into-packets.patch |   79 ---
 .../0004-Handle-read-and-write-return-values.patch |  178 -----
 .../gsm/files/0005-Add-ask-ds-option-forSMS.patch  |  132 ----
 .../gsm/files/024_sms-text-in-bracket.patch        |   72 --
 .../gsm/files/025_sms-status-report.patch          |  135 ----
 ...027_phonebook-find-and-read-range-support.patch |  425 ------------
 ...ell-phonebook-find-and-read-range-support.patch |  266 --------
 meta/recipes-connectivity/gsm/files/default        |   59 --
 .../gsm/files/fix_machine_init.patch               |   28 -
 meta/recipes-connectivity/gsm/files/gsmd           |   47 --
 .../gsm/files/install-ts-headers.patch             |   13 -
 .../gsm/files/lgsm_send_fix_return_value.patch     |   13 -
 meta/recipes-connectivity/gsm/gsmd.inc             |  108 ---
 meta/recipes-connectivity/gsm/libgsmd_svn.bb       |    6 -
 meta/recipes-core/images/core-image-base.bb        |    3 -
 meta/recipes-core/images/core-image-core.bb        |    3 -
 meta/recipes-core/images/core-image-minimal-dev.bb |   15 +-
 .../images/core-image-minimal-mtdutils.bb          |    3 -
 meta/recipes-core/images/core-image-minimal.bb     |    3 -
 meta/recipes-core/tasks/task-base.bb               |    5 +-
 meta/recipes-rt/images/core-image-rt-sdk.bb        |    3 -
 meta/recipes-rt/images/core-image-rt.bb            |    3 -
 meta/recipes-sato/images/core-image-sato-dev.bb    |    3 -
 meta/recipes-sato/images/core-image-sato-sdk.bb    |    3 -
 meta/recipes-sato/images/core-image-sato.bb        |    3 -
 28 files changed, 4 insertions(+), 2393 deletions(-)
 delete mode 100644 meta/recipes-connectivity/gsm/files/0001-Introduce-ports.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/0002-Flush-all-pending-commands-before-restarting-the-mod.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/0003-Correctly-segment-incoming-usock-data-into-packets.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/0004-Handle-read-and-write-return-values.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/0005-Add-ask-ds-option-forSMS.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/024_sms-text-in-bracket.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/025_sms-status-report.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/027_phonebook-find-and-read-range-support.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/028_shell-phonebook-find-and-read-range-support.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/default
 delete mode 100644 meta/recipes-connectivity/gsm/files/fix_machine_init.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/gsmd
 delete mode 100644 meta/recipes-connectivity/gsm/files/install-ts-headers.patch
 delete mode 100644 meta/recipes-connectivity/gsm/files/lgsm_send_fix_return_value.patch
 delete mode 100644 meta/recipes-connectivity/gsm/gsmd.inc
 delete mode 100644 meta/recipes-connectivity/gsm/libgsmd_svn.bb

-- 
1.7.9.5



