Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1296173061
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 14:40:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 06:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,198,1484035200"; d="scan'208";a="1101446381"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2017 06:40:06 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id CF6136A4004
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 06:40:04 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 16:33:47 +0200
Message-Id: <cover.1487860017.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] fix #11044: wic should support multiple boot labels such as boot and install targets
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
X-List-Received-Date: Thu, 23 Feb 2017 14:40:15 -0000

Hi,

This patchset provides an example of multi-target syslinux config.
It utilizes --configfile bootloader option instead of "traditional" way to
hardcode all configuration details in wic plugin code.

This approach is a preferable way to configure bootloaders in wic. It should
be used for all wic pluins in future.

The following changes since commit 5d96bc6d1af89dda11f3266548fe1547152c86e1:

  image_types_wic: fix expansion error (2017-02-22 15:41:33 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (2):
  wic: bootimg-pcbios: add support for syslinux vesamenu
  wic: add more targets to directdisk syslinux config

 .../canned-wks/directdisk-bootloader-config.cfg    | 28 +++++++++++++++++-----
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   | 20 ++++++++++------
 2 files changed, 35 insertions(+), 13 deletions(-)

--
Regards,
Ed

