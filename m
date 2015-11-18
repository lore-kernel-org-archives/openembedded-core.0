Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 145B760118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 16:37:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Nov 2015 08:37:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,313,1444719600"; d="scan'208";a="841614392"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga001.fm.intel.com with ESMTP; 18 Nov 2015 08:37:25 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 08:25:52 +0000
Message-Id: <cover.1447834352.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/2] wic: Allow to user defined files as config for bootloaders
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
X-List-Received-Date: Wed, 18 Nov 2015 16:37:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

These two patches add a new option for the bootloaders. This new option is
to have a configuration file as the bootloader config and it can be used with
"configfile" variable in the bootloader line. This is very useful when there
is need to create a multiboot image or when there is need to use scripting in
the bootloader.

This change doesn't include the changes in the documentation but once the
patches are commited to master, I will work on the documentation of this new
feature.

The following changes since commit d9aabf9639510fdb3e2ccc21ba5ae4aa9f6e4a57:

  gcc: Drop 4.8 (2015-11-16 14:59:18 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8003
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8003

Mariano Lopez (2):
  wic: Prepare wicboot to allow custom bootloader config
  wic: Allow to use a custom config for bootloaders

 scripts/lib/wic/kickstart/__init__.py              |  7 +++
 .../lib/wic/kickstart/custom_commands/wicboot.py   |  5 ++
 scripts/lib/wic/plugins/source/bootimg-efi.py      | 66 ++++++++++++++--------
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   | 66 +++++++++++++---------
 4 files changed, 95 insertions(+), 49 deletions(-)

-- 
1.8.4.5


