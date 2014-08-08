Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A1C8970A38
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:06:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2014 15:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="582200192"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2014 15:06:14 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:30 -0500
Message-Id: <3269ce6b784fc816e09806ef85c2202927b5110d.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 05/35] wic: Remove mic chroot
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
X-List-Received-Date: Fri, 08 Aug 2014 22:06:13 -0000

mic chroot allows users to chroot into an existing mic image and isn't
used by wic, so remove it.

Removing chroot.py leads in turn to various plugin-loading failures
for a number of plugins that wic doesn't use either, so remove those
as well.

The existing source plugins refer to chroot but don't use it, so fix
those up.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/chroot.py                        | 343 -----------
 scripts/lib/mic/imager/fs.py                     |  99 ---
 scripts/lib/mic/imager/livecd.py                 | 750 -----------------------
 scripts/lib/mic/imager/liveusb.py                | 308 ----------
 scripts/lib/mic/imager/loop.py                   | 418 -------------
 scripts/lib/mic/imager/raw.py                    | 501 ---------------
 scripts/lib/mic/plugins/imager/direct_plugin.py  |   2 +-
 scripts/lib/mic/plugins/imager/fs_plugin.py      | 143 -----
 scripts/lib/mic/plugins/imager/livecd_plugin.py  | 255 --------
 scripts/lib/mic/plugins/imager/liveusb_plugin.py | 260 --------
 scripts/lib/mic/plugins/imager/loop_plugin.py    | 255 --------
 scripts/lib/mic/plugins/imager/raw_plugin.py     | 275 ---------
 scripts/lib/mic/plugins/source/bootimg-efi.py    |   2 +-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py |   2 +-
 scripts/lib/mic/plugins/source/rootfs.py         |   2 +-
 15 files changed, 4 insertions(+), 3611 deletions(-)
 delete mode 100644 scripts/lib/mic/chroot.py
 delete mode 100644 scripts/lib/mic/imager/fs.py
 delete mode 100644 scripts/lib/mic/imager/livecd.py
 delete mode 100644 scripts/lib/mic/imager/liveusb.py
 delete mode 100644 scripts/lib/mic/imager/loop.py
 delete mode 100644 scripts/lib/mic/imager/raw.py
 delete mode 100644 scripts/lib/mic/plugins/imager/fs_plugin.py
 delete mode 100644 scripts/lib/mic/plugins/imager/livecd_plugin.py
 delete mode 100644 scripts/lib/mic/plugins/imager/liveusb_plugin.py
 delete mode 100644 scripts/lib/mic/plugins/imager/loop_plugin.py
 delete mode 100644 scripts/lib/mic/plugins/imager/raw_plugin.py

Patch too large to post - see git repository.

-- 
1.8.3.1


