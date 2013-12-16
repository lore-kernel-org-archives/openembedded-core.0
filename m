Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 172D16E4AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 17:00:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Dec 2013 09:00:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,496,1384329600"; d="scan'208";a="445121225"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2013 09:00:14 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2013 19:02:45 +0200
Message-Id: <cover.1387213322.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/2] libpcap and libtirpc PUs
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
X-List-Received-Date: Mon, 16 Dec 2013 17:00:16 -0000

The following changes since commit 9daa1de753e58b7f678e68cf307f6028c0c79a6a:

  qemu/local.conf.sample: Add sdl PACKAGECONFIG (2013-12-16 12:13:59 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (2):
  libtirpc: upgrade to 0.2.4
  libpcap: upgrade to 1.5.2

 meta/recipes-connectivity/libpcap/libpcap/aclocal.patch   |  8 ++++----
 .../libpcap/{libpcap_1.4.0.bb => libpcap_1.5.2.bb}        |  4 ++--
 .../libtirpc-0.2.3/obsolete_automake_macros.patch         | 15 ---------------
 .../libtirpc-0.2.1-fortify.patch                          |  0
 .../remove-des-uclibc.patch                               |  0
 .../libtirpc/{libtirpc_0.2.3.bb => libtirpc_0.2.4.bb}     |  8 +++++---
 6 files changed, 11 insertions(+), 24 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.4.0.bb => libpcap_1.5.2.bb} (80%)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc-0.2.3/obsolete_automake_macros.patch
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.3 => libtirpc-0.2.4}/libtirpc-0.2.1-fortify.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc-0.2.3 => libtirpc-0.2.4}/remove-des-uclibc.patch (100%)
 rename meta/recipes-extended/libtirpc/{libtirpc_0.2.3.bb => libtirpc_0.2.4.bb} (84%)

-- 
1.8.3.2


