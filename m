Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C0CF6C72D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 13:54:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Feb 2014 05:54:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,548,1389772800"; d="scan'208";a="488416000"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2014 05:54:47 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 15:54:44 +0200
Message-Id: <cover.1393422829.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] adt_installer: fix issue with x86_64
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
X-List-Received-Date: Wed, 26 Feb 2014 13:54:50 -0000

The following changes since commit e47afff7d812c74f8091d85facfdf34d6a1b698e:

  runqemu: Use readlink instead of realpath (2014-02-25 21:29:53 +0000)

are available in the git repository at:

  git://mirror.rb.intel.com/git.yoctoproject.org/poky-contrib lpalcu/b5806_adt_installer_fails_for_xf86_64

for you to fetch changes up to 72cf90ecf51d88becfaf037b6233c78e8c6e4a9c:

  adt_installer: fix issue with x86_64 (2014-02-26 15:36:44 +0200)

----------------------------------------------------------------
Laurentiu Palcu (1):
      adt_installer: fix issue with x86_64

 .../adt-installer/scripts/adt_installer_internal   |   61 +++++++++++---------
 1 file changed, 35 insertions(+), 26 deletions(-)

Laurentiu Palcu (1):
  adt_installer: fix issue with x86_64

 .../adt-installer/scripts/adt_installer_internal   |   61 +++++++++++---------
 1 file changed, 35 insertions(+), 26 deletions(-)

-- 
1.7.9.5


