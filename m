Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D42276FEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 15:28:33 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jan 2016 07:28:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,289,1449561600"; d="scan'208";a="28676071"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga004.fm.intel.com with ESMTP; 13 Jan 2016 07:28:33 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 07:24:47 +0000
Message-Id: <cover.1452669610.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCHv2 0/4] Clean PkgsList return data implementation.
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
X-List-Received-Date: Wed, 13 Jan 2016 15:28:35 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently the when calling the list() from the classes that inherit
from PKgsList, it must pass the format required and it will return
a formated string listing all the packages installed. Retruning such
string is not the best data structure to manipulate in the callers.

This series of patches change PkgsList to return a dictionary and the
callers will format the output as required.

Changes in V2:

- Fix the last break line in the image manifest
- Fix issue not showing the last pkg when using deb or ipk

[YOCTO #7427]


The following changes since commit 96a34e7f847ad34deac520b78809e7dd82dbc59e:

  conf/distro/poky-tiny: correctly disable python in opkg-utils (2016-01-12 15:35:27 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug7427v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug7427v2

Mariano Lopez (4):
  lib/oe/package_manager: Add list_pkgs() to PkgsList class
  lib/oe/utils: Add function format_pkg_list()
  lib/oe/rootfs: Use list_pkgs() instead of list()
  lib/oe/package_manager.py: Remove list() from PkgsList class

 meta/classes/buildhistory.bbclass        |  11 +-
 meta/classes/license.bbclass             |   8 +-
 meta/classes/populate_sdk_base.bbclass   |   8 +-
 meta/classes/rootfs-postcommands.bbclass |   4 +-
 meta/lib/oe/package_manager.py           | 193 ++++++++++++++-----------------
 meta/lib/oe/rootfs.py                    |   8 +-
 meta/lib/oe/sdk.py                       |   8 +-
 meta/lib/oe/utils.py                     |  22 ++++
 8 files changed, 137 insertions(+), 125 deletions(-)

-- 
1.8.4.5


