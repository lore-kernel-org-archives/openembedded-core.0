Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QUXHD-00062A-R5
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 06:55:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Jun 2011 21:52:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,340,1304319600"; 
   d="scan'208";a="9690382"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 08 Jun 2011 21:52:07 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 13:01:37 +0800
Message-Id: <cover.1307595269.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH 0/1]distro_tracking_fields.inc: Fix a date issue
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
X-List-Received-Date: Thu, 09 Jun 2011 04:55:28 -0000

Hi Saul,
	This patch fix a little date issue in distro_tracking_fields.inc.

Thanks
Lei

The following changes since commit a702c3dbf5fdc88eefdadd1f6c4cd6e04811c1e1:
  Richard Purdie (1):
        bitbake-layers: Fixup after recent server changes

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/distro_date_issue
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/distro_date_issue

Mei Lei (1):
  distro_tracking_fields.inc: Fix a incorrect date format

 .../conf/distro/include/distro_tracking_fields.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)



