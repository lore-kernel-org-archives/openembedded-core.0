Return-Path: <wei.tee.ng@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4E13077D91
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491560356; x=1523096356;
	h=from:to:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=ZIVbQV1x6UCSGXgXZaMVtnmBqjav6dwehphWG+odxHk=;
	b=jMf0YPz1Y0SScfdEVPLQQOjIy0hwQ2uBxhmie0fbeb0N7LfBcpZbtOdZ
	luTYqjUgXU5v4YBOD5AEY0JABreSRw==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Apr 2017 03:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,164,1488873600"; d="scan'208";a="85894868"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2017 03:19:15 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 03:19:09 -0700
Message-Id: <1491560353-96797-1-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/4][YOCTO #11090] Set linux-firmware to correct license
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
X-List-Received-Date: Fri, 07 Apr 2017 10:19:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

These patches is to update the SRCREV of linux-firmware to the latest HEAD
and set the license file explicitly for linux-firmware-carl9170 to GPL-2.
 
The SRCREV for linux-firmware was updated to the latest in order to include
the GPL-2 license file. The netronome firmware was removed until rpm
packaging issue is resolved.
 
This configuration are build and tested.
 
Please review and provide feedback if you have any.
 
Thanks.
 
Regards,

Wei Tee

Chang, Rebecca Swee Fun (1):
  linux-firmware: Fix build failure when update SRCREV to latest HEAD

Ng, Wei Tee (2):
  linux-firmware: update to revision a4dde74b
  linux-firmware: Set the license for carl9170 to GPLv2

Peter Kjellerstedt (1):
  bitbake: fetch2: Do not fail to create symbolic links if they already
    exist

 bitbake/lib/bb/fetch2/__init__.py                  | 15 ++++++--
 .../linux-firmware/linux-firmware_git.bb           | 40 ++++++++++++++--------
 2 files changed, 38 insertions(+), 17 deletions(-)

-- 
2.7.4


