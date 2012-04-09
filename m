Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SHBtB-00021O-NG
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 12:32:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q39AMiUa003635
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2012 03:22:44 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 9 Apr 2012 03:22:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Apr 2012 18:22:31 +0800
Message-ID: <cover.1333966697.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] meta-toolchain: runqemu falied on FC16/Opensuse12.1 x86_64
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
X-List-Received-Date: Mon, 09 Apr 2012 10:32:02 -0000
Content-Type: text/plain

Test info:
* Have tested on:
  * Fedora 16 x86_64
  * Opensuse 12.1 x86_64
  * Ubuntu 10.04

* The testing commands are:
  $ bitbake core-image-sato meta-toolchain meta-toolchain-sdk

  And untar the sdk, then runqemu from the sdk to start the target.

// Robert

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/tc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/tc

Robert Yang (1):
  meta-toolchain: runqemu falied on FC16/Opensuse12.1 x86_64

 meta/conf/distro/include/tcmode-default.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)



