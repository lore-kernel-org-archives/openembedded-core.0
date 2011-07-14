Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QhUTT-0007Z8-0X
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 00:33:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jul 2011 15:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,531,1304319600"; d="scan'208";a="30467041"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 14 Jul 2011 15:29:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2011 15:21:21 -0700
Message-Id: <cover.1310681919.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH 0/2] libiconv update and distro tracking updates
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
X-List-Received-Date: Thu, 14 Jul 2011 22:33:39 -0000

Richard,

This patch adds libiconv 1.13.1 which is now GPLv3, so we need
to keep 1.11.1

Also updates to distro_tracking.

Sau!


The following changes since commit 615f05dc46afa14ea4fca49a551278b92d2c99d3:

  perl: Use SITEINFO variables not functions (2011-07-14 15:40:26 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (2):
  libiconv: add version 1.13.1
  distro tracking: Updates

 .../conf/distro/include/distro_tracking_fields.inc |   21 +++++++++-----
 .../{libiconv-1.11.1 => files}/autoconf.patch      |    2 +
 .../shared_preloadable_libiconv_linux.patch        |    2 +
 meta/recipes-support/libiconv/libiconv_1.13.1.bb   |   29 ++++++++++++++++++++
 4 files changed, 46 insertions(+), 8 deletions(-)
 rename meta/recipes-support/libiconv/{libiconv-1.11.1 => files}/autoconf.patch (98%)
 rename meta/recipes-support/libiconv/{libiconv-1.11.1 => files}/shared_preloadable_libiconv_linux.patch (98%)
 create mode 100644 meta/recipes-support/libiconv/libiconv_1.13.1.bb

-- 
1.7.3.4



