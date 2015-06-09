Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 84B94758B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 20:09:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Jun 2015 13:09:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,583,1427785200"; d="scan'208";a="708139875"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2015 13:09:14 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 12:05:18 +0000
Message-Id: <cover.1433851301.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/1] Upgrade 1.18 -> 1.19
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
X-List-Received-Date: Tue, 09 Jun 2015 20:09:13 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The following changes since commit 20a3a36547831349d5d8b429cb35f1415a856bda:

  scripts/combo-layer: Fix exit codes and tty handling (2015-06-05 16:42:17 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/libgpg-error-upgrade
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/libgpg-error-upgrade

Leonardo Sandoval (1):
  libgpg-error: Upgrade 1.18 -> 1.19

 .../libgpg-error/libgpg-error/pkgconfig.patch      | 45 +++++++++++-----------
 .../{libgpg-error_1.18.bb => libgpg-error_1.19.bb} |  6 +--
 2 files changed, 26 insertions(+), 25 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.18.bb => libgpg-error_1.19.bb} (89%)

-- 
1.8.4.5


