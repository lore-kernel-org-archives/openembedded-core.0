Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6295370A7C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:07:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Aug 2014 15:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="555928092"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2014 15:06:33 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:41 -0500
Message-Id: <712e9e1e81c123b5a702170c75b72066ea472036.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 16/35] wic: Remove unused 3rdparty/commands
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
X-List-Received-Date: Fri, 08 Aug 2014 22:07:25 -0000

wic doesn't use anything but partition and bootloader, so remove the
rest.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../mic/3rdparty/pykickstart/commands/__init__.py  |    8 +-
 .../3rdparty/pykickstart/commands/authconfig.py    |   40 -
 .../mic/3rdparty/pykickstart/commands/autopart.py  |  119 ---
 .../mic/3rdparty/pykickstart/commands/autostep.py  |   55 -
 .../mic/3rdparty/pykickstart/commands/clearpart.py |   86 --
 .../mic/3rdparty/pykickstart/commands/device.py    |  125 ---
 .../3rdparty/pykickstart/commands/deviceprobe.py   |   40 -
 .../3rdparty/pykickstart/commands/displaymode.py   |   68 --
 .../mic/3rdparty/pykickstart/commands/dmraid.py    |   91 --
 .../3rdparty/pykickstart/commands/driverdisk.py    |  184 ----
 .../lib/mic/3rdparty/pykickstart/commands/fcoe.py  |  114 --
 .../mic/3rdparty/pykickstart/commands/firewall.py  |  193 ----
 .../mic/3rdparty/pykickstart/commands/firstboot.py |   62 --
 .../lib/mic/3rdparty/pykickstart/commands/group.py |   88 --
 .../3rdparty/pykickstart/commands/ignoredisk.py    |  139 ---
 .../3rdparty/pykickstart/commands/interactive.py   |   58 --
 .../lib/mic/3rdparty/pykickstart/commands/iscsi.py |  133 ---
 .../mic/3rdparty/pykickstart/commands/iscsiname.py |   54 -
 .../lib/mic/3rdparty/pykickstart/commands/key.py   |   64 --
 .../mic/3rdparty/pykickstart/commands/keyboard.py  |   55 -
 .../lib/mic/3rdparty/pykickstart/commands/lang.py  |   60 --
 .../3rdparty/pykickstart/commands/langsupport.py   |   58 --
 .../mic/3rdparty/pykickstart/commands/lilocheck.py |   54 -
 .../mic/3rdparty/pykickstart/commands/logging.py   |   66 --
 .../mic/3rdparty/pykickstart/commands/logvol.py    |  304 ------
 .../3rdparty/pykickstart/commands/mediacheck.py    |   53 -
 .../mic/3rdparty/pykickstart/commands/method.py    |  186 ----
 .../mic/3rdparty/pykickstart/commands/monitor.py   |  106 --
 .../lib/mic/3rdparty/pykickstart/commands/mouse.py |   70 --
 .../mic/3rdparty/pykickstart/commands/multipath.py |  111 --
 .../mic/3rdparty/pykickstart/commands/network.py   |  363 -------
 .../lib/mic/3rdparty/pykickstart/commands/raid.py  |  365 -------
 .../mic/3rdparty/pykickstart/commands/reboot.py    |   79 --
 .../lib/mic/3rdparty/pykickstart/commands/repo.py  |  249 -----
 .../mic/3rdparty/pykickstart/commands/rescue.py    |   68 --
 .../mic/3rdparty/pykickstart/commands/rootpw.py    |   93 --
 .../mic/3rdparty/pykickstart/commands/selinux.py   |   64 --
 .../mic/3rdparty/pykickstart/commands/services.py  |   71 --
 .../lib/mic/3rdparty/pykickstart/commands/skipx.py |   54 -
 .../lib/mic/3rdparty/pykickstart/commands/sshpw.py |  105 --
 .../mic/3rdparty/pykickstart/commands/timezone.py  |   86 --
 .../mic/3rdparty/pykickstart/commands/updates.py   |   60 --
 .../mic/3rdparty/pykickstart/commands/upgrade.py   |  106 --
 .../lib/mic/3rdparty/pykickstart/commands/user.py  |  173 ----
 .../lib/mic/3rdparty/pykickstart/commands/vnc.py   |  114 --
 .../mic/3rdparty/pykickstart/commands/volgroup.py  |  102 --
 .../mic/3rdparty/pykickstart/commands/xconfig.py   |  184 ----
 .../mic/3rdparty/pykickstart/commands/zerombr.py   |   69 --
 .../lib/mic/3rdparty/pykickstart/commands/zfcp.py  |  134 ---
 .../mic/3rdparty/pykickstart/handlers/control.py   | 1092 --------------------
 50 files changed, 1 insertion(+), 6474 deletions(-)
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/authconfig.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/autopart.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/autostep.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/clearpart.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/device.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/deviceprobe.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/displaymode.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/dmraid.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/driverdisk.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/fcoe.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/firewall.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/firstboot.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/group.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/ignoredisk.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/interactive.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/iscsi.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/iscsiname.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/key.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/keyboard.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lang.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/langsupport.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/lilocheck.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/logging.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/logvol.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mediacheck.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/method.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/monitor.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/mouse.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/multipath.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/network.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/raid.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/reboot.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/repo.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/rescue.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/rootpw.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/selinux.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/services.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/skipx.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/sshpw.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/timezone.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/updates.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/upgrade.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/user.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/vnc.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/volgroup.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/xconfig.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/zerombr.py
 delete mode 100644 scripts/lib/mic/3rdparty/pykickstart/commands/zfcp.py

Patch too large to post - see git repository.

-- 
1.8.3.1


