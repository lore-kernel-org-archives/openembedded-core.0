Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QXVJk-0001kq-N5
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Jun 2011 11:26:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5H9Mo6U023296
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2011 02:22:50 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 17 Jun 2011 02:22:50 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jun 2011 17:19:13 +0800
Message-ID: <cover.1308302102.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] Integrate ccache-native
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
X-List-Received-Date: Fri, 17 Jun 2011 09:26:21 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

1) Add ccache as a native tool, for getting it built automatically make
it as the dependency of bzip2; Also, the ccache will be included by SDK
images;

2) Set CCACHE on a per recipe basis and add task 'mkccachedir' to create
the CCACHE_DIR while start a package building;

3) Remove the duplicate 'ccache.inc' from 'meta/class/'.  

The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
  Tom Zanussi (1):
        systemtap: remove non-core COMPATIBLE_MACHINES

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/ccache
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ccache

Wenzong Fan (1):
  ccache: Integrate ccache-native

 meta/classes/base.bbclass                    |    1 +
 meta/classes/ccache.bbclass                  |   21 +++++++++++++++++++++
 meta/classes/ccache.inc                      |   11 -----------
 meta/conf/bitbake.conf                       |    1 +
 meta/recipes-core/tasks/task-core-sdk.bb     |    1 +
 meta/recipes-devtools/ccache/ccache.inc      |   16 ++++++++++++++++
 meta/recipes-devtools/ccache/ccache_3.1.5.bb |    8 ++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb   |    2 ++
 8 files changed, 50 insertions(+), 11 deletions(-)
 create mode 100644 meta/classes/ccache.bbclass
 delete mode 100644 meta/classes/ccache.inc
 create mode 100644 meta/recipes-devtools/ccache/ccache.inc
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.1.5.bb



