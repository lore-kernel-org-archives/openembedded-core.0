Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1SXTud-0008Qn-2R
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 11:00:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 01:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144105319"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga001.jf.intel.com with ESMTP; 24 May 2012 01:50:38 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 17:15:55 +0800
Message-Id: <cover.1337850757.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/2] ltp: Upgrade LTP to 20120401
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2012 09:00:51 -0000

Upgrade LTP to 20120401 and remove the patch for getcontext and profil,
since LTP has fixed the build issue.


The following changes since commit e6333825c3482a559a0c0499e17f8f48d3042ddf:

  tune-mips64.inc: Add new tune file for mips64 big-endian (2012-05-20 20:24:37 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jxu49/oe-contrib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jxu49/oe-contrib

Jiajun Xu (2):
  ltp: Upgrade LTP to version 20120401
  distro_tracking_fields: update information for ltp

 .../conf/distro/include/distro_tracking_fields.inc |    8 +-
 .../ltp/ltp/uclibc-getcontext.patch                |   78 --------------------
 .../ltp/{ltp_20120104.bb => ltp_20120401.bb}       |    7 +-
 3 files changed, 7 insertions(+), 86 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
 rename meta/recipes-extended/ltp/{ltp_20120104.bb => ltp_20120401.bb} (95%)



