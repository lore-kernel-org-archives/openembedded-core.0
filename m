Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A5DD9610D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 23:00:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2014 15:55:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,947,1389772800"; d="scan'208";a="531222751"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 28 Apr 2014 16:00:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Apr 2014 16:00:30 -0700
Message-Id: <cover.1398725824.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/14] Patches and Updates
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
X-List-Received-Date: Mon, 28 Apr 2014 23:00:46 -0000

Richard,

I have pulled together this set up patches and updates from the 
list, they have been though the AB.  Note I dropped one of Martin's
ARM tune change due to a pending comment from Phil B.

There is also a pending change to the package_regex.inc for poky 
to fix the package reporting system which has been having some
issues recently.

Finally there is a Dora patch pending from Hongxu which is currently
building on the AB.

Hope your travels to the states went well.

Thanks
	Sau!


The following changes since commit be07344397b383ab5e56048acb64eb56272fe95e:

  cross: Drop package tasks (2014-04-27 01:20:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Changhyeok Bae (1):
  mirrors.bbclass: Add mirror site for savannah

Chong Lu (1):
  tar: set acpaths to avoid "Argument list too long" error

Drew Moseley (1):
  systemd: Check for HAVE_POSIX_FALLOCATE

Fathi Boudra (1):
  grub git: update to latest git (grub-2.02-beta2-81-g4b8b913)

Irina Patru (1):
  distrodata.bbclass: Fix checkpkg functionality

Jacob Kroon (1):
  sstate-cache-management: Minor cleanup of help text

Jate S (1):
  useradd: Add dependency on pseudo for setscene task

Martin Jansa (3):
  feature-arm-thumb.inc: Replace inner quotes with apostrophes
  feature-arm-thumb.inc, arch-armv4.inc: Add "arm" to TUNE_FEATURES
  tune-cortexr4.inc: Add thumb and arm to TUNE_FEATURES

Maxin B. John (2):
  openssl: enable ptest support
  ltp: update version to 20140422

Saul Wold (1):
  mc: update to 4.8.12

Stefan Stanacar (1):
  oeqa/utils: sshcontrol: realtime logging of output

 meta/classes/distrodata.bbclass                    | 40 ++++--------
 meta/classes/mirrors.bbclass                       |  1 +
 meta/classes/useradd.bbclass                       |  2 +-
 meta/conf/bitbake.conf                             |  1 +
 meta/conf/machine/include/arm/arch-armv4.inc       |  3 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |  2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |  2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc | 35 +++++++---
 meta/conf/machine/include/tune-cortexr4.inc        |  2 +-
 meta/lib/oeqa/utils/sshcontrol.py                  | 19 ++++--
 meta/recipes-bsp/grub/grub_git.bb                  |  2 +-
 meta/recipes-connectivity/openssl/openssl.inc      | 19 +++++-
 .../openssl/openssl/Makefiles-ptest.patch          | 75 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl/run-ptest |  2 +
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |  2 +
 .../systemd/systemd-pam-fix-fallocate.patch        |  4 +-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |  2 +-
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb  |  2 +-
 meta/recipes-devtools/quilt/quilt-0.61.inc         |  2 +-
 meta/recipes-extended/ed/ed_0.5.bb                 |  2 +-
 .../ltp/ltp/ffsb-remove-hardcoded-configure.patch  | 15 -----
 meta/recipes-extended/ltp/ltp/regen-makefile.patch | 22 -------
 .../ltp/{ltp_20140115.bb => ltp_20140422.bb}       |  6 +-
 .../mc/{mc_4.8.10.bb => mc_4.8.12.bb}              | 13 +++-
 meta/recipes-extended/tar/tar.inc                  |  6 ++
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |  2 +-
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |  2 +-
 meta/recipes-support/attr/acl.inc                  |  2 +-
 meta/recipes-support/attr/attr.inc                 |  2 +-
 scripts/sstate-cache-management.sh                 |  6 +-
 31 files changed, 192 insertions(+), 105 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/Makefiles-ptest.patch
 create mode 100755 meta/recipes-connectivity/openssl/openssl/run-ptest
 delete mode 100644 meta/recipes-extended/ltp/ltp/ffsb-remove-hardcoded-configure.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/regen-makefile.patch
 rename meta/recipes-extended/ltp/{ltp_20140115.bb => ltp_20140422.bb} (96%)
 rename meta/recipes-extended/mc/{mc_4.8.10.bb => mc_4.8.12.bb} (83%)

-- 
1.8.3.1


