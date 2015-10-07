Return-Path: <anujx.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E685760125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 08:12:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Oct 2015 01:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,648,1437462000"; d="scan'208";a="786456797"
Received: from yocto-pc.png.intel.com ([172.30.197.17])
	by orsmga001.jf.intel.com with ESMTP; 07 Oct 2015 01:12:23 -0700
From: Anuj Mittal <anujx.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Oct 2015 16:02:43 +0800
Message-Id: <1444204964-21670-1-git-send-email-anujx.mittal@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [fido][PATCH 0/1] linux-firmware cherry-pick request
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
X-List-Received-Date: Wed, 07 Oct 2015 08:12:29 -0000

Hello,

This is a cherry-picked patch from master to update the SRCREV of linux-firmware
in fido.

The aim is to bring in i915 GuC firmware for broxton and skylake in fido.

Please merge in fido if this looks okay.

Thank you.

Cristian Iorga (1):
  linux-firmware: upgrade to commit
    75cc3ef8ba6712fd72c073b17a790282136cc743

 .../linux-firmware/linux-firmware_git.bb           |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.9.5


