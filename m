Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QZi3d-0008VZ-K8
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 13:26:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Jun 2011 04:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,412,1304319600"; d="scan'208";a="17267136"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2011 04:23:12 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2011 19:33:01 +0800
Message-Id: <cover.1308827218.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Removing hard coded libdir for libc locale generating
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
X-List-Received-Date: Thu, 23 Jun 2011 11:26:49 -0000

The patch replaces the hard coded libdir in package_do_split_gconvs() in libc-package.bbclass to meet the requirement of multilib.

The following changes since commit b04ee632eb06650dde3e3ee8c4788a45cae0aa5e:
  Richard Purdie (1):
        multilib: First pass from RP

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib llu/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/ml

Lianhao Lu (1):
  libc-package.bbclass: Replace hard coded libdir.

 meta/classes/libc-package.bbclass |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)



