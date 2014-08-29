Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E93D871213
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 15:26:53 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 08:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,424,1406617200"; d="scan'208";a="473835159"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.12.242])
	by azsmga001.ch.intel.com with ESMTP; 29 Aug 2014 08:26:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 08:26:26 -0700
Message-Id: <cover.1409325858.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/5] Package Updates
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
X-List-Received-Date: Fri, 29 Aug 2014 15:26:57 -0000

Richard,

A final set of package before feature freeze.

Sau!

The following changes since commit d2fbc55d6863a767e69092bac686c02c3ec34650:

  populate_sdk_base: Remap TOOLCHAIN_HOST_TASK variable (2014-08-28 15:12:31 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (5):
  less: Upgrade to 466
  man-pages: Upgrade to 3.71
  libxkbcommon: Upgrade to 0.4.3
  libassuan: Upgrade to 2.1.2
  at: Upgrade to 3.1.15

 meta/recipes-extended/at/{files => at}/S99at       |  0
 meta/recipes-extended/at/{files => at}/atd.service |  0
 .../{files => at}/configure-add-enable-pam.patch   |  0
 .../file_replacement_with_gplv2.patch              |  0
 .../{files => at}/fix_parallel_build_error.patch   |  0
 .../at/{files => at}/pam.conf.patch                | 24 +++++++++-----
 meta/recipes-extended/at/{files => at}/posixtm.c   |  0
 meta/recipes-extended/at/{files => at}/posixtm.h   |  0
 .../at/{at_3.1.14.bb => at_3.1.15.bb}              |  4 +--
 .../less/{less_458.bb => less_466.bb}              |  4 +--
 .../{man-pages_3.70.bb => man-pages_3.71.bb}       |  4 +--
 ...libxkbcommon_0.4.2.bb => libxkbcommon_0.4.3.bb} |  4 +--
 .../libassuan-add-pkgconfig-support.patch          | 38 +++++++++++-----------
 .../{libassuan_2.1.1.bb => libassuan_2.1.2.bb}     |  4 +--
 14 files changed, 44 insertions(+), 38 deletions(-)
 rename meta/recipes-extended/at/{files => at}/S99at (100%)
 rename meta/recipes-extended/at/{files => at}/atd.service (100%)
 rename meta/recipes-extended/at/{files => at}/configure-add-enable-pam.patch (100%)
 rename meta/recipes-extended/at/{files => at}/file_replacement_with_gplv2.patch (100%)
 rename meta/recipes-extended/at/{files => at}/fix_parallel_build_error.patch (100%)
 rename meta/recipes-extended/at/{files => at}/pam.conf.patch (68%)
 rename meta/recipes-extended/at/{files => at}/posixtm.c (100%)
 rename meta/recipes-extended/at/{files => at}/posixtm.h (100%)
 rename meta/recipes-extended/at/{at_3.1.14.bb => at_3.1.15.bb} (94%)
 rename meta/recipes-extended/less/{less_458.bb => less_466.bb} (88%)
 rename meta/recipes-extended/man-pages/{man-pages_3.70.bb => man-pages_3.71.bb} (82%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_0.4.2.bb => libxkbcommon_0.4.3.bb} (82%)
 rename meta/recipes-support/libassuan/{libassuan_2.1.1.bb => libassuan_2.1.2.bb} (86%)

-- 
1.8.3.1


