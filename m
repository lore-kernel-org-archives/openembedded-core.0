Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 85FA56C9B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 20:53:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 19 Feb 2014 12:53:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,507,1389772800"; d="scan'208";a="477967709"
Received: from unknown (HELO localhost) ([10.255.12.82])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 12:53:35 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 14:53:34 -0600
Message-Id: <cover.1392842779.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/2] wic: Fix PATH used to find commands and error if not found
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
X-List-Received-Date: Wed, 19 Feb 2014 20:53:37 -0000

This fixes a problem noticed when building images in that a
non-bootable image can silently be produced if a command used to build
the image isn't found.  The first problem is that the only the first
element of the PATH was being used to look for commands, and the
second is that no error is produced even if the command isn't found.

The following changes since commit 54562006c1327c5b99daa4cc05a3ba7e38412da1:

  image_types.bbclass: Fix tar IMAGE_CMD to not change directories (2014-02-18 08:38:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-native-fix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-native-fix

Tom Zanussi (2):
  wic: Fix exec_native_cmd() path
  wic: Make exec_native_command() fail if a command isn't found

 scripts/lib/mic/utils/oe/misc.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
1.8.3.1


