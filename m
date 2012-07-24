Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1StXyn-0007o2-Q3
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 07:48:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Jul 2012 22:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172328323"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.53])
	by azsmga001.ch.intel.com with ESMTP; 23 Jul 2012 22:36:52 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:36:53 +0300
Message-Id: <1343108218-7108-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/5] Connectivity and base packages updates.
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
X-List-Received-Date: Tue, 24 Jul 2012 05:48:22 -0000

Multiple package updates, see below for details.
Packages and core-image-sato target build on all architectures.
Basic sanity tests performed in core-image-sato under qemux86.
No obvious issues observed.

Cristian Iorga (5):
  telepathy-glib: upgrade to ver. 0.19.4
  iptables: upgrade to ver. 1.4.14
  telepathy-mission-control: upgrade to ver. 5.13
  libpcap: upgrade to ver. 1.3
  byacc: upgrade to ver. 20120526

 .../{libpcap-1.2.1 => libpcap-1.3.0}/aclocal.patch |    0
 .../ieee80215-arphrd.patch                         |    0
 .../libpcap/{libpcap_1.2.1.bb => libpcap_1.3.0.bb} |    4 ++--
 ...thy-glib_0.19.2.bb => telepathy-glib_0.19.4.bb} |    4 ++--
 ...12.0.bb => telepathy-mission-control_5.13.0.bb} |    4 ++--
 .../byacc/{byacc_20120115.bb => byacc_20120526.bb} |    4 ++--
 .../{iptables_1.4.13.bb => iptables_1.4.14.bb}     |    4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.2.1 => libpcap-1.3.0}/aclocal.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.2.1 => libpcap-1.3.0}/ieee80215-arphrd.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.2.1.bb => libpcap_1.3.0.bb} (73%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.2.bb => telepathy-glib_0.19.4.bb} (80%)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.12.0.bb => telepathy-mission-control_5.13.0.bb} (92%)
 rename meta/recipes-extended/byacc/{byacc_20120115.bb => byacc_20120526.bb} (75%)
 rename meta/recipes-extended/iptables/{iptables_1.4.13.bb => iptables_1.4.14.bb} (91%)

-- 
1.7.9.5



