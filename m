Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1Qa3CD-0005aN-TU
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 12:01:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5O9vPhJ015325
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 02:57:25 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 24 Jun 2011 02:57:25 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2011 17:53:10 +0800
Message-ID: <cover.1308902512.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH v2 0/4] Integrate ccache-native
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
X-List-Received-Date: Fri, 24 Jun 2011 10:01:06 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

1) Add ccache as a native tool and put its recipe files to:
'meta/recipes-devtools/ccache';

2) Set 'CCACHE_DIR' in 'bitbake.conf' and create the dirs for every
package before task 'do_configure' started;

3) Add 'ccache' for all SDK images;

4) Remove duplicate 'ccache.inc' from 'meta/class/'.

The following changes since commit 7cd2ac0e40d854bab9a32512018aff6172500c0e:
  Beth Flanagan (1):
        common-licenses: Additions and corrections

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/ccache
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ccache

Wenzong Fan (4):
  ccache: Integrate ccache-native to poky
  ccache: Set CCACHE on a per recipe basis
  ccache: Add 'ccache' for SDK images
  ccache: Remove duplicate 'ccache.inc' from 'meta/class/'

 meta/classes/base.bbclass                    |    1 +
 meta/classes/ccache.inc                      |   11 -----------
 meta/conf/bitbake.conf                       |    1 +
 meta/recipes-core/tasks/task-core-sdk.bb     |    1 +
 meta/recipes-devtools/ccache/ccache.inc      |   16 ++++++++++++++++
 meta/recipes-devtools/ccache/ccache_3.1.5.bb |    8 ++++++++
 6 files changed, 27 insertions(+), 11 deletions(-)
 delete mode 100644 meta/classes/ccache.inc
 create mode 100644 meta/recipes-devtools/ccache/ccache.inc
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.1.5.bb



