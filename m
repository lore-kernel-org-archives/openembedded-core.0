Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SJmGY-0005vL-G3
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 15:46:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3GDbOjQ019402
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 06:37:24 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 16 Apr 2012 06:37:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 21:38:11 +0800
Message-ID: <cover.1334583221.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/3] meta-toolchain-sdk: /bin/perl is needed by some pkgs on FC 17
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
X-List-Received-Date: Mon, 16 Apr 2012 13:46:50 -0000
Content-Type: text/plain

Test info:
Tested on FC 13/16/17 64bit
1) $ bitbake  meta-toolchain-sdk core-image-sato
2) untar the sdk, and use the sdk to build some pkgs (autoreconf, configure and make)

// Robert

The following changes since commit 4e1a8ed1ab7e7bd950e511c79ddfe072cb280a6e:

  bitbake.conf: Include abi_version.conf in a early stage (2012-04-16 12:51:50 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/fc17_sdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/fc17_sdk

Robert Yang (3):
  glib-2.0: fix builds on fedora 17
  autoconf-nativesdk: fix builds on fedora 17
  automake-nativesdk: fix builds on fedora 17

 meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb     |   12 +++++++++++-
 meta/recipes-devtools/autoconf/autoconf.inc       |   16 +++++++++++++++-
 meta/recipes-devtools/autoconf/autoconf_2.68.bb   |    2 +-
 meta/recipes-devtools/automake/automake_1.11.2.bb |   20 +++++++++++++++++---
 4 files changed, 44 insertions(+), 6 deletions(-)



