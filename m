Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 56A426AF56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 20:59:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Dec 2013 12:59:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,538,1384329600"; d="scan'208";a="448866668"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga001.fm.intel.com with ESMTP; 23 Dec 2013 12:59:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Dec 2013 20:59:48 +0000
Message-Id: <cover.1387832257.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 0/2] LICENSE / README fixes for OE-Core
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
X-List-Received-Date: Mon, 23 Dec 2013 20:59:57 -0000

Note: this is the OE-Core fix; there is an alternative one for Poky.

The following changes since commit 421e927bd453259f4b3cdbd1676f6e12f97bf34f:

  openssl: use PACKAGECONFIG to disable perl bits (2013-12-21 09:09:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/doc-fixes-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/doc-fixes-oecore

Paul Eggleton (2):
  Fix license notices for OE-Core
  README: fix DISTRO = "" reference

 LICENSE                   |  16 +--
 README                    |   2 +-
 meta-skeleton/COPYING.MIT |  17 +++
 meta/COPYING.GPLv2        | 339 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 365 insertions(+), 9 deletions(-)
 create mode 100644 meta-skeleton/COPYING.MIT
 create mode 100644 meta/COPYING.GPLv2

-- 
1.8.1.2


