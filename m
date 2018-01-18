Return-Path: <amanda.r.brindle@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C88F26FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 23:47:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jan 2018 15:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,379,1511856000"; d="scan'208";a="10880931"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga007.jf.intel.com with ESMTP; 18 Jan 2018 15:47:35 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 15:45:23 -0800
Message-Id: <cover.1516318733.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: paul.eggleton@linux.intel.com, Amanda Brindle <amanda.r.brindle@intel.com>
Subject: [PATCH 0/1] tinfoil.py: Check if BUILDDIR exists
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
X-List-Received-Date: Thu, 18 Jan 2018 23:47:34 -0000

The following changes since commit 364f8bcfcbd04e722490f363ad36a15fb7066ba7:

  linux-firmware: Bump revision to 65b1c68c (2018-01-11 10:26:07 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib abrindle/tinfoil
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/tinfoil

Amanda Brindle (1):
  tinfoil.py: Check if BUILDDIR exists

 bitbake/lib/bb/tinfoil.py | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.7.4


