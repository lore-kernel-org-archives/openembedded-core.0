Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qfj25-0002bD-Us
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Jul 2011 03:42:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2011 18:38:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,506,1304319600"; d="scan'208";a="26044871"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.180])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2011 18:38:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jul 2011 18:38:07 -0700
Message-Id: <cover.1310261708.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [RC2 PATCH 0/2] Patch for meta-toolchain-gmae for RC2 build
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
X-List-Received-Date: Sun, 10 Jul 2011 01:42:06 -0000

Richard,

This the libx11 patch is needed to ensure that meta-toolchain-gmae
built, we missed updating the nativesdk DEPENDS (without xcb enabled).

The tcmode-default updates binutils to remove the preferred provider warnings.

Thanks
	Sau!


The following changes since commit 4f36a7f698de5056cb38641a7bf12921dba7d962:

  libx11: enable xcb support (2011-07-08 23:01:54 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (2):
  libx11: ensure nativesdk uses correct DEPENDS and XCB flags
  tcmode-default: update binutils version

 meta/conf/distro/include/tcmode-default.inc    |    2 +-
 meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb |   13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

-- 
1.7.3.4



