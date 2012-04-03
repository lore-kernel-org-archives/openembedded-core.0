Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SEraf-0006Za-8O
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 02:27:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Apr 2012 17:18:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="124666778"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga001.jf.intel.com with ESMTP; 02 Apr 2012 17:18:07 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2012 08:13:48 +0800
Message-Id: <cover.1333411736.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Separate add-on settings for target/nativesdk eglibc
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
X-List-Received-Date: Tue, 03 Apr 2012 00:27:17 -0000

This patch uses a separate setting SDK_GLIBC_ADDONS for naitvesdk eglibc 
add-on settins.

The following changes since commit 5bcb68a232539cf11a30e3b812b2fbd6d7d76e35:
  Richard Purdie (1):
        gettext: Fix sysroot conflict over owner of macros

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/nativesdkfixing
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/nativesdkfixing

Lianhao Lu (1):
  eglibc: SDK_GLIBC_ADDONS for eglibc-nativesdk.

 meta/conf/machine-sdk/i586.conf         |    2 ++
 meta/conf/machine-sdk/i686.conf         |    2 ++
 meta/conf/machine-sdk/x86_64.conf       |    4 +++-
 meta/recipes-core/eglibc/eglibc.inc     |    4 ++++
 meta/recipes-core/eglibc/eglibc_2.13.bb |    5 ++---
 meta/recipes-core/eglibc/eglibc_2.15.bb |    4 +---
 6 files changed, 14 insertions(+), 7 deletions(-)



