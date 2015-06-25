Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2C96775A06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 18:21:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2015 11:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,678,1427785200"; d="scan'208";a="514251212"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.55])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jun 2015 11:19:20 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 13:21:14 -0500
Message-Id: <cover.1435255972.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] DPKG/IPK fixes
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
X-List-Received-Date: Thu, 25 Jun 2015 18:21:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 18e902b2dc17746af453869bcc1fba4dbae7c94f:

  wpa-supplicant: Revert "Make SystemD D-Bus config conditional" (2015-06-24 14:04:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/deb_ipk_postinsts
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/deb_ipk_postinsts

Aníbal Limón (2):
  oe/rootfs.py: DpkgRootfs/OpkgRootfs add support for dependency    
    handling in postinsts scripts.
  run-postinsts: Fix ipk package management detection

 meta/lib/oe/rootfs.py                              | 156 +++++++++++++--------
 .../run-postinsts/run-postinsts/run-postinsts      |   5 +-
 2 files changed, 105 insertions(+), 56 deletions(-)

-- 
1.9.1


