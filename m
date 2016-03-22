Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6D99F607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 18:13:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 22 Mar 2016 11:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,378,1455004800"; d="scan'208";a="916617439"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.254.120.177])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2016 11:13:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 22 Mar 2016 11:13:07 -0700
Message-Id: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/4] linux-firmware update and cleanup
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
X-List-Received-Date: Tue, 22 Mar 2016 18:13:12 -0000

There has been a recent spat of linux-firmware updates that is required for
newer hardware, this patch set updates the firmware and also does some clean-up
to licenses and breaks out some firmware for smaller packages needed for
creating initramfs blobs.

Sau!


Saul Wold (4):
  linux-firmware: Update to latest HEAD
  linux-firmware: Collapse iwlwifi firmware blobs for 7260 and 7265
  linux-firmware: Clean-up and sync license data
  linux-firmware: Break out some additional firmware

 .../linux-firmware/linux-firmware_git.bb           | 155 +++++++++++++++------
 1 file changed, 114 insertions(+), 41 deletions(-)

-- 
2.5.0


