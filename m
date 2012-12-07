Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1Tgr74-0003A8-2y
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 07:08:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB75sFx4024788
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 21:54:15 -0800 (PST)
Received: from pek-usp-11.wrs.com (128.224.163.66) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 6 Dec 2012 21:54:15 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Dec 2012 13:54:12 +0800
Message-ID: <cover.1354859376.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, Jackie.Huang@windriver.com
Subject: [PATCH 0/1] rt-tests: added missing dependencies in Makefile
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
X-List-Received-Date: Fri, 07 Dec 2012 06:08:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Test info:
1) MACHINE=qemux86-64/qemuppc/qemumips; PARALLEL_MAKE = "-j 24"
$ bitbake core-image-sato 
$ bitbake rt-tests

The following changes since commit 17d27fd6e2750e6455f656159da56c3350c4b3cd:

  sstate: fix typo (2012-12-06 22:59:05 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_rt-tests_1207_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_rt-tests_1207_2

Jackie Huang (1):
  rt-tests: added missing dependencies in Makefile

 .../files/added-missing-dependencies.patch         |   50 ++++++++++++++++++++
 meta/recipes-rt/rt-tests/rt-tests.inc              |    6 ++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-rt/rt-tests/files/added-missing-dependencies.patch

-- 
1.7.4.1



