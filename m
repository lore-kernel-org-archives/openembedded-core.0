Return-Path: <wei.tee.ng@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4BEEB719D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 09:14:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 02:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,291,1491289200"; d="scan'208";a="1126762654"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2017 02:14:41 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 May 2017 19:04:56 -0700
Message-Id: <1493949898-38657-1-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: wei.tee.ng@intel.com
Subject: [PATCH 0/2] rpm: allow arch-dependent binaries in noarch packages
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
X-List-Received-Date: Fri, 05 May 2017 09:14:41 -0000

From: Ng Wei Tee <wei.tee.ng@intel.com>

This patch is to handle the packaging of arch specific firmware in
allarch way. In this case, the netronome binaries has ELF headers
which is arch specific firmware. This is targeted to solve Bugzilla
ID 11329.

Besides that, the netronome firmware is packaged in a new package
with a new license setup.

This configuration are build and tested for ipk, rpm and deb packaging.

Please review and provide feedbaack if you have any. Thank you.

Regards,
Wei Tee

Ng Wei Tee (2):
  rpm: allow arch-dependent binaries in noarch packages
  linux-firmware: enable netronome firmware

 meta/classes/package_rpm.bbclass                   |  1 +
 .../linux-firmware/linux-firmware_git.bb           | 25 +++++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

-- 
2.7.4


