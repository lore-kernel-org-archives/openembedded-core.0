Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SJnmB-00083G-0T
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 17:23:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3GFE9iG004170
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 08:14:09 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 16 Apr 2012 08:14:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 23:14:58 +0800
Message-ID: <cover.1334589214.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] qemu-nativesdk: can't find libcurl.so.4
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
X-List-Received-Date: Mon, 16 Apr 2012 15:23:35 -0000
Content-Type: text/plain

Test info:
Tested on:
FC 13/16/17 64bit
Ubuntu 10.10 32bit

$ bitbake meta-toolchain-sdk core-image-sato
* The build worked well.
* runqemu worked well
* untar the sdk, and the runqemu from the sdk worked well.

// Robert

The following changes since commit 4e1a8ed1ab7e7bd950e511c79ddfe072cb280a6e:

  bitbake.conf: Include abi_version.conf in a early stage (2012-04-16 12:51:50 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/qemu
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/qemu

Robert Yang (1):
  qemu-nativesdk: can't find libcurl.so.4

 meta/recipes-devtools/qemu/qemu.inc       |    4 ++--
 meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 +-
 meta/recipes-devtools/qemu/qemu_git.bb    |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)



