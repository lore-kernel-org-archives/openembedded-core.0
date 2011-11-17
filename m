Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1RQxUn-0004pM-JU
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 09:38:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2011 00:31:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="76628914"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by orsmga002.jf.intel.com with ESMTP; 17 Nov 2011 00:31:26 -0800
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 16:32:58 +0800
Message-Id: <cover.1321516924.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1]rpm: Fix rpm log grows indefinitely issue.
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
X-List-Received-Date: Thu, 17 Nov 2011 08:38:57 -0000

This patch fixes bug 1174.

Thanks,
Lei

The following changes since commit 300336fc4a310ed16a14ad041744708d54aae189:
  Richard Purdie (1):
        update-alternatives: Various fixes

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib lmei3/bug1174
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/bug1174

Mei Lei (1):
  rpm: Flush old logs by change the DB_CONFIG

 .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |   12 ++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    5 +++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch



