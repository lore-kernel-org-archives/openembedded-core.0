Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1StCnu-000521-7Y
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 09:11:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6N5pHfb003609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 22:51:17 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 22 Jul 2012 22:51:15 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2012 13:50:52 +0800
Message-ID: <cover.1343022482.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] remake: Add remake-native and remake
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
X-List-Received-Date: Mon, 23 Jul 2012 07:11:42 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Add remake-native and remake to yocto

[YOCTO #2402]

The following changes since commit 315d52934693b14f08b62f3f5f361d834484e180:

  Pyphon-native: Fix typo (2012-07-22 14:20:57 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/2402
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/2402

Wenzong Fan (1):
  remake: Add remake-native and remake

 meta/recipes-devtools/remake/remake.inc            |   16 +++++++++++++
 .../remake/remake/version-remake.texi.patch        |   16 +++++++++++++
 meta/recipes-devtools/remake/remake_git.bb         |   25 ++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/remake/remake.inc
 create mode 100644 meta/recipes-devtools/remake/remake/version-remake.texi.patch
 create mode 100644 meta/recipes-devtools/remake/remake_git.bb

-- 
1.7.9.5



