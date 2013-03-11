Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kevin.strasser@linux.intel.com>) id 1UFBpv-0003qi-Lf
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 00:08:59 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Mar 2013 15:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,825,1355126400"; d="scan'208";a="299498945"
Received: from wrk.jf.intel.com ([10.7.202.65])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2013 15:52:16 -0700
From: Kevin Strasser <kevin.strasser@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 15:39:47 -0700
Message-Id: <cover.1363041435.git.kevin.strasser@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] archiver fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 23:09:09 -0000

The following changes since commit 63c7192119d54b92d908441109ed4e4fff761cba:

  base.bbclass: don't backfill features that already exist (2013-03-09 23:50:17 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib strassek/archiver
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=strassek/archiver

Kevin Strasser (2):
  archive-*-source.bbclass: fix scripts_with_logs build error
  archiver: fix archive filtering behavior

 meta/classes/archive-configured-source.bbclass |   15 +++++++++++----
 meta/classes/archive-original-source.bbclass   |   15 +++++++++++----
 meta/classes/archive-patched-source.bbclass    |   15 +++++++++++----
 meta/classes/archiver.bbclass                  |   13 +------------
 4 files changed, 34 insertions(+), 24 deletions(-)

-- 
1.7.9.5



