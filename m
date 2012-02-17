Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yi.Zhao@windriver.com>) id 1RyHzf-0000L7-N2
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 08:12:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q1H74K9U004396
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 23:04:21 -0800 (PST)
Received: from localhost (128.224.162.249) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 16 Feb 2012 23:04:20 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Feb 2012 15:04:12 +0800
Message-ID: <cover.1329456260.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.249]
Subject: [PATCH 0/3] lsbtest: Add recipe for LSB tests and automate test
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
X-List-Received-Date: Fri, 17 Feb 2012 07:12:36 -0000
Content-Type: text/plain

Hi,

The pull request is to address [YOCTO #1567] - "Add recipe for lsb tests and automate test".
LSB testing is different from LTP or POSIX testing. We don't need to build the cases from sources but need to install a set of pre-build binary packages in lsb image.
I add a script and 2 list files in this recipe. The script is used for setting up lsb test environment, download lsb rpm packages from remote, install packages, execute the test and collect the results.
When run this script in the target, the lsb will be downloaded, installed and executed automatically.

The following changes since commit 41a83ccfe50ec69425a4828fb5836d38d3f99e67:

  guile: fix cross configure failure (2012-02-10 17:01:42 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib yizhao/bug1567
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=yizhao/bug1567

Yi Zhao (3):
  lsbtest: Add recipe for LSB tests and automate test
  distro_tracking_fields: add information for lsbtest
  task-core-lsb: add lsbtest to RDEPENDS_task-core-misc list

 .../conf/distro/include/distro_tracking_fields.inc |    4 +
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      |  493 ++++++++++++++++++++
 meta/recipes-extended/lsb/lsbtest/packages_list    |   50 ++
 meta/recipes-extended/lsb/lsbtest/session          |  194 ++++++++
 meta/recipes-extended/lsb/lsbtest_1.0.bb           |   36 ++
 meta/recipes-extended/tasks/task-core-lsb.bb       |    3 +-
 6 files changed, 779 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
 create mode 100644 meta/recipes-extended/lsb/lsbtest/packages_list
 create mode 100644 meta/recipes-extended/lsb/lsbtest/session
 create mode 100644 meta/recipes-extended/lsb/lsbtest_1.0.bb



