Return-Path: <wei.tee.ng@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 268DA6010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 09:09:56 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 10 Apr 2017 02:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,181,1488873600"; d="scan'208";a="85508389"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga005.jf.intel.com with ESMTP; 10 Apr 2017 02:09:57 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Apr 2017 18:58:41 -0700
Message-Id: <1491789524-26109-1-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3 0/3] Set linux-firmware to correct license
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
X-List-Received-Date: Mon, 10 Apr 2017 09:09:57 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

This is the revised version to fix the ipk packaging error as below:
ERROR: linux-firmware-1_0.0+gitAUTOINC+b14134583c-r0 do_package_write_ipk: Function failed: do_package_ipk

These patches is to update the SRCREV of linux-firmware to the latest HEAD
and set the license file explicitly for linux-firmware-carl9170 to GPL-2.
This also targeted to solve the Bugzilla ID 11090.

The SRCREV for linux-firmware was updated to the latest in order to
include the GPL-2 license file. The netronome firmware was removed
until rpm packaging issue is resolved.
 
This configuration are build and tested for ipk, rpm and deb packaging.
 
Please review and provide feedback if you have any.

Thanks.
 
Regards,

Wei Tee

Chang, Rebecca Swee Fun (1):
  linux-firmware: Fix build failure when update SRCREV to latest HEAD

Ng, Wei Tee (2):
  linux-firmware: update to revision a4dde74b
  linux-firmware: Set the license for carl9170 to GPLv2

 .../linux-firmware/linux-firmware_git.bb           | 40 ++++++++++++++--------
 1 file changed, 25 insertions(+), 15 deletions(-)

-- 
2.7.4


