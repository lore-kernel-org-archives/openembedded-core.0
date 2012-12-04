Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tg29T-0001gG-FY
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 00:43:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 15:29:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,217,1355126400"; d="scan'208";a="229008958"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.117])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 15:29:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 15:29:09 -0800
Message-Id: <1354663759-20022-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 0/3] libnl Update and friends
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
X-List-Received-Date: Tue, 04 Dec 2012 23:43:47 -0000

Mihai sent these patches a couple weeks ago, and they got
stuck someplace, so I am resending them here.

Sau!

Mihai Prica (3):
  libnl: upgrade to 3.2.14
  wpa-supplicant: configured to work with libnl 3.2.14
  libpcap: PR bump because of PU for libnl

 meta/recipes-connectivity/libpcap/libpcap.inc      |  2 +-
 .../wpa-supplicant/wpa-supplicant-1.0.inc          |  1 +
 .../wpa-supplicant-1.0/defconfig-gnutls            |  2 +-
 .../wpa-supplicant/wpa-supplicant_1.0.bb           |  2 +-
 .../libnl/{libnl-2.0 => libnl}/fix-pc-file.patch   | 14 ++++----
 .../fix-pktloc_syntax_h-race.patch                 | 27 ++++++++------
 meta/recipes-support/libnl/libnl_2.0.bb            | 27 --------------
 meta/recipes-support/libnl/libnl_3.2.14.bb         | 41 ++++++++++++++++++++++
 8 files changed, 69 insertions(+), 47 deletions(-)
 rename meta/recipes-support/libnl/{libnl-2.0 => libnl}/fix-pc-file.patch (52%)
 rename meta/recipes-support/libnl/{libnl-2.0 => libnl}/fix-pktloc_syntax_h-race.patch (57%)
 delete mode 100644 meta/recipes-support/libnl/libnl_2.0.bb
 create mode 100644 meta/recipes-support/libnl/libnl_3.2.14.bb

-- 
1.8.0



