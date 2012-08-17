Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1T2Dfe-0004uE-VJ
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 05:56:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 16 Aug 2012 20:44:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,782,1336374000"; d="scan'208";a="203251908"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 16 Aug 2012 20:44:27 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 06:44:19 +0300
Message-Id: <cover.1345174354.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Add support for relocatable SDK to ADT installer and some fixes
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
X-List-Received-Date: Fri, 17 Aug 2012 03:56:27 -0000

Hi,

This patchset adds support for relocating SDK to ADT installer and a couple of
fixes.

Thanks,
Laurentiu

The following changes since commit af847d36375aa53f0c1ee2a00c97ba9f38837d1b:

  bitbake: bitbake: build.py: Add stampdir argument to cached_mtime_noerror (2012-08-16 12:27:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/relocatable_adt
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/relocatable_adt

Laurentiu Palcu (3):
  populate_sdk_base.bbclass: fix SDK relocation issues
  package.bbclass: change RPATHs for cross-canadian binaries
  adt-installer: add support for relocatable SDK

 meta/classes/package.bbclass                       |    2 +-
 meta/classes/populate_sdk_base.bbclass             |    4 +-
 .../installer/adt-installer/adt_installer          |   11 ++
 .../adt-installer/scripts/adt_installer_internal   |  111 ++++++++++++++++----
 .../installer/adt-installer_1.0.bb                 |   37 +++----
 5 files changed, 126 insertions(+), 39 deletions(-)

-- 
1.7.9.5



