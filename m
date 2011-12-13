Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaNbn-0007YT-KM
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 09:21:07 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Dec 2011 00:14:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86612737"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 13 Dec 2011 00:14:11 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2011 00:13:59 -0800
Message-Id: <cover.1323763897.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 00/10] Add missing SRC_URI checksums
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
X-List-Received-Date: Tue, 13 Dec 2011 08:21:07 -0000

Richard,

Add missing checksums for non-GPLv3 recipes since we enabled
the error.  Also fix the ed recipe to remove an not-yet supported
option.

Sau!


The following changes since commit 9244a3b0565fd52d7973fda42a4f706b16240316:

  eglibc: Generate cross testing script during install (2011-12-12 21:50:10 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (10):
  coreutils: Add SRC_URI Checksums for GPLv2
  readline: Add SRC_URI Checksums for GPLv2
  ed: Add SRC_URI Checksums for GPLv2
  findutils: Add SRC_URI Checksums for GPLv2
  gawk: Add SRC_URI Checksums for GPLv2
  gzip: Add SRC_URI Checksums for GPLv2
  sed: Add SRC_URI Checksums for GPLv2
  gmp: Add SRC_URI Checksums for GPLv2
  bash: Add SRC_URI Checksums for GPLv2
  ed: remove unsupported option

 meta/recipes-core/coreutils/coreutils_6.9.bb       |    3 ++
 meta/recipes-core/readline/readline_5.2.bb         |    3 ++
 meta/recipes-extended/bash/bash_3.2.48.bb          |   21 ++++++++++++++-----
 meta/recipes-extended/ed/ed_0.5.bb                 |    5 ++++
 .../recipes-extended/findutils/findutils_4.2.31.bb |    3 ++
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    3 ++
 meta/recipes-extended/gzip/gzip_1.3.12.bb          |    3 ++
 meta/recipes-extended/sed/sed_4.1.2.bb             |    3 ++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |    3 ++
 9 files changed, 41 insertions(+), 6 deletions(-)

-- 
1.7.6.4



