Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Tm23O-0003hU-K0
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 13:50:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2012 04:35:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,329,1355126400"; d="scan'208";a="265540056"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2012 04:35:30 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Dec 2012 14:38:37 +0200
Message-Id: <1356093519-27312-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/2] bison: update to 2.7
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
X-List-Received-Date: Fri, 21 Dec 2012 12:50:18 -0000

The bison 2.7 update needs a change in rpm too; without this change, rpm
doesn't compile with bison 2.7.

Bogdan Marinescu (2):
  bison: update to 2.7
  rpm: remove declaration of "sykcparse"

 .../bison/{bison_2.5.1.bb => bison_2.7.bb}               |    4 ++--
 .../rpm/rpm/rpm-remove-sykcparse-decl.patch              |   14 ++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb                   |    3 ++-
 3 files changed, 18 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/bison/{bison_2.5.1.bb => bison_2.7.bb} (89%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch

-- 
1.7.10.4



