Return-Path: <laurentiu.palcu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0B26ABBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 11:59:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jun 2013 05:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,936,1363158000"; d="scan'208";a="355422532"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2013 04:59:58 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2013 14:59:04 +0300
Message-Id: <cover.1372161097.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] populate_sdk_base, adt_installer: abort install if path contains spaces
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
X-List-Received-Date: Tue, 25 Jun 2013 11:59:14 -0000

The following changes since commit 87da29080429f1793845978901f5160701648c21:

  sanity.bbclass: Various improvements (2013-06-24 15:41:33 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/b4488_sdk_installer_handle_spaces
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4488_sdk_installer_handle_spaces

Laurentiu Palcu (1):
  populate_sdk_base, adt_installer: abort install if path contains
    spaces

 meta/classes/populate_sdk_base.bbclass             |   13 +++++++++----
 .../installer/adt-installer/adt_installer          |   13 +++++++++----
 2 files changed, 18 insertions(+), 8 deletions(-)

-- 
1.7.9.5


