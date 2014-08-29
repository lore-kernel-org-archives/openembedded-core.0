Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6AC70F06
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 13:10:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2014 06:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,424,1406617200"; d="scan'208";a="591690113"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2014 06:10:46 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 16:10:39 +0300
Message-Id: <cover.1409317786.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/3] Various PUs
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
X-List-Received-Date: Fri, 29 Aug 2014 13:10:48 -0000

The following changes since commit fe2e53ba30ba679c038bd5b48b9a91a41af4c49e:

  bitbake: toaster: create Build methods for calculating progress and ETA (2014-08-29 13:56:50 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (3):
  iproute2: upgrade to 3.16.0
  libpcap: upgrade to 1.6.1
  libical: upgrade to 1.0.0

 .../{iproute2_3.15.0.bb => iproute2_3.16.0.bb}     |  4 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |  4 +-
 .../libpcap/libpcap/ieee80215-arphrd.patch         | 24 ----------
 .../libpcap/{libpcap_1.5.3.bb => libpcap_1.6.1.bb} |  8 ++--
 .../libical/files/pthread-fix.patch                | 52 ----------------------
 .../libical/{libical_0.48.bb => libical_1.0.0.bb}  | 13 +++---
 6 files changed, 12 insertions(+), 93 deletions(-)
 rename meta/recipes-connectivity/iproute2/{iproute2_3.15.0.bb => iproute2_3.16.0.bb} (68%)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/ieee80215-arphrd.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.5.3.bb => libpcap_1.6.1.bb} (66%)
 delete mode 100644 meta/recipes-support/libical/files/pthread-fix.patch
 rename meta/recipes-support/libical/{libical_0.48.bb => libical_1.0.0.bb} (40%)

-- 
1.9.1


