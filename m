Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4CADF65CD0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2015 18:50:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2015 11:48:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,401,1422950400"; d="scan'208";a="680177379"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by fmsmga001.fm.intel.com with ESMTP; 14 Mar 2015 11:50:05 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Mar 2015 10:45:00 +0000
Message-Id: <cover.1426328088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [PATCH 0/5] license: Add support for handle INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Sat, 14 Mar 2015 18:50:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The next changes was made to implement INCOMPATIBLE_LICENSE handling in manifest
creation this implies to rewrite license_manifest_creation from shell to python.

Tests was made to guarantee compatibility and can be found at,

The last two patches are to avoid warnings in manifest creation due that these
recipes don't collect licenses before.

The following changes since commit 7f30749fe026e9ceb75d73b89271145a45a60763:

  oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:50:24 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/license-rebase
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/license-rebase

Aníbal Limón (5):
  license_class: Reimplemented manifest creation in python
  license_class: Generalize license_ok function
  license: Add support for handle INCOMPATIBLE_LICENSE in manifest
    creation
  packagegroups: Add LIC_FILES_CHKSUM to avoid warnings in manifest
    creation
  glibc/glibc-collateral.inc: Add LIC_FILES_CHKSUM to avoid warnings in
    manifest creation

 meta/classes/license.bbclass                       | 190 +++++++++++----------
 meta/lib/oe/license.py                             |  84 +++++++++
 meta/recipes-core/glibc/glibc-collateral.inc       |   2 +
 .../packagegroups/packagegroup-base.bb             |   1 +
 .../packagegroups/packagegroup-core-boot.bb        |   1 +
 .../packagegroup-core-buildessential.bb            |   1 +
 .../packagegroup-core-eclipse-debug.bb             |   1 +
 .../packagegroups/packagegroup-core-nfs.bb         |   1 +
 .../packagegroups/packagegroup-core-sdk.bb         |   1 +
 .../packagegroup-core-ssh-dropbear.bb              |   1 +
 .../packagegroups/packagegroup-core-ssh-openssh.bb |   1 +
 .../packagegroup-core-standalone-sdk-target.bb     |   1 +
 .../packagegroups/packagegroup-core-tools-debug.bb |   1 +
 .../packagegroup-core-tools-profile.bb             |   1 +
 .../packagegroups/packagegroup-cross-canadian.bb   |   1 +
 .../packagegroups/packagegroup-self-hosted.bb      |   1 +
 .../packagegroup-core-device-devel.bb              |   1 +
 .../packagegroup-core-full-cmdline.bb              |   1 +
 .../packagegroups/packagegroup-core-lsb.bb         |   1 +
 .../packagegroups/packagegroup-core-clutter.bb     |   1 +
 .../packagegroups/packagegroup-core-directfb.bb    |   1 +
 .../packagegroups/packagegroup-core-x11-base.bb    |   1 +
 .../packagegroups/packagegroup-core-x11-xserver.bb |   1 +
 .../packagegroups/packagegroup-core-x11.bb         |   1 +
 .../packagegroups/packagegroup-core-qt.bb          |   1 +
 .../packagegroups/packagegroup-core-qt4e.bb        |   1 +
 .../packagegroup-qt-toolchain-target.inc           |   1 +
 .../packagegroups/packagegroup-core-x11-sato.bb    |   1 +
 28 files changed, 212 insertions(+), 89 deletions(-)

-- 
1.8.4.5


