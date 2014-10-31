Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6B26A65CA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 14:36:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 31 Oct 2014 07:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,295,1413270000"; d="scan'208";a="624180361"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 31 Oct 2014 07:36:11 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 16:36:06 +0200
Message-Id: <cover.1414766096.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] QEMU upgrade to 2.1.2
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
X-List-Received-Date: Fri, 31 Oct 2014 14:37:01 -0000

The following changes since commit f19b4e995ea47f9243f152b39337330307453c9f:

  bitbake: bitbake: clarify startup message (2014-10-30 13:39:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib PUs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/PUs

Cristian Iorga (1):
  qemu: upgrade to 2.1.2

 ...1-Back-porting-security-fix-CVE-2014-5388.patch | 30 ----------------------
 .../qemu/{qemu_2.1.0.bb => qemu_2.1.2.bb}          |  5 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/0001-Back-porting-security-fix-CVE-2014-5388.patch
 rename meta/recipes-devtools/qemu/{qemu_2.1.0.bb => qemu_2.1.2.bb} (81%)

-- 
2.1.0


