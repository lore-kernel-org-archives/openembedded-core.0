Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rksqp-00005h-9z
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 08:44:03 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Jan 2012 23:36:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="96880534"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.168])
	by orsmga002.jf.intel.com with ESMTP; 10 Jan 2012 23:36:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Jan 2012 23:36:25 -0800
Message-Id: <cover.1326267271.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [CONSOLIDATED PULL 0/5] final items for M2 RC1
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
X-List-Received-Date: Wed, 11 Jan 2012 07:44:03 -0000

Richard,

Here are the final items we discussed yesterday, a succesful
build finished, and we seem to be in good shape, please pull 
these early in your day and fire up AB Master is you can.


Thanks
	Sau!


The following changes since commit 9b944ae2f0e4dbac5a8f1f235f60730e56b26516:

  Revert "site/common-uclibc: Cache gl_cv_func_wcwidth_works" (2012-01-10 18:32:16 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Lianhao Lu (2):
  meta/PRService: Added export/import fuctions.
  package.bbclass: per recipe PRSERV_HOST support

Robert Yang (2):
  Incremental rpm image generation
  Incremental rpm image generation(Add config sample)

Shane Wang (1):
  hdparm: upgrade to 9.37

 meta/classes/image.bbclass                         |   11 ++-
 meta/classes/package.bbclass                       |   21 +++-
 meta/classes/package_rpm.bbclass                   |   73 +++++++++++--
 meta/classes/prexport.bbclass                      |   45 ++++++++
 meta/classes/primport.bbclass                      |   17 +++
 meta/classes/prserv.bbclass                        |   36 +++----
 meta/classes/rootfs_rpm.bbclass                    |    6 +-
 meta/conf/bitbake.conf                             |    4 +-
 meta/conf/local.conf.sample.extended               |    7 ++
 meta/conf/prexport.conf                            |    1 +
 meta/conf/primport.conf                            |    1 +
 meta/lib/oe/prservice.py                           |  113 ++++++++++++++++++++
 .../recipes-extended/hdparm/hdparm-6.3/bswap.patch |   37 -------
 .../hdparm/hdparm-6.3/uclibc.patch                 |   34 ------
 meta/recipes-extended/hdparm/hdparm_6.3.bb         |   18 ---
 meta/recipes-extended/hdparm/hdparm_9.37.bb        |   36 ++++++
 meta/recipes-extended/stat/stat_3.3.bb             |   27 +++++
 scripts/bitbake-prserv-tool                        |   57 ++++++++++
 18 files changed, 415 insertions(+), 129 deletions(-)
 create mode 100644 meta/classes/prexport.bbclass
 create mode 100644 meta/classes/primport.bbclass
 create mode 100644 meta/conf/prexport.conf
 create mode 100644 meta/conf/primport.conf
 create mode 100644 meta/lib/oe/prservice.py
 delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/bswap.patch
 delete mode 100644 meta/recipes-extended/hdparm/hdparm-6.3/uclibc.patch
 delete mode 100644 meta/recipes-extended/hdparm/hdparm_6.3.bb
 create mode 100644 meta/recipes-extended/hdparm/hdparm_9.37.bb
 create mode 100644 meta/recipes-extended/stat/stat_3.3.bb
 create mode 100755 scripts/bitbake-prserv-tool

-- 
1.7.6.5



