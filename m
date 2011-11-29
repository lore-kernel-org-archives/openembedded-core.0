Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RVJMs-00079z-IQ
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 09:48:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAT8g6r6015733
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 00:42:06 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 29 Nov 2011 00:42:05 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 16:38:57 +0800
Message-ID: <cover.1322554339.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/5] add autotools nativesdk to meta-toolchain
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
X-List-Received-Date: Tue, 29 Nov 2011 08:48:46 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

[yocto #1603]

Add automake-nativesdk and autoconf-nativesdk into meta-toolchain,
this will help to process new libtool m4 macros in any autotools
project, such as support for '--with-libtool-sysroot' option.

Also add m4-nativesdk and gnu-config-nativesdk which required by
autoconf-nativesdk.

The following changes since commit 4cd96710785eb05abeff1f281878655118d4a7dd:
  Richard Purdie (1):
        bitbake: Update users of getVar/setVar to use the data store functions directly

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/autotool_nativesdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/autotool_nativesdk

Wenzong Fan (5):
  gnu-config: Extend to provide nativesdk recipe
  m4: Add m4-nativesdk recipes
  automake: Extend to provide nativesdk recipe
  autoconf: Extend to provide nativesdk recipe
  task-sdk-host-nativesdk: add autotools nativesdk to meta-toolchain

 meta/recipes-core/tasks/task-sdk-host-nativesdk.bb |    4 +++-
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    9 ++++++---
 meta/recipes-devtools/automake/automake.inc        |    2 +-
 meta/recipes-devtools/automake/automake_1.11.1.bb  |    3 ++-
 .../gnu-config/gnu-config_20111111.bb              |    4 ++--
 meta/recipes-devtools/m4/m4-nativesdk_1.4.16.bb    |   12 ++++++++++++
 meta/recipes-devtools/m4/m4-nativesdk_1.4.9.bb     |   12 ++++++++++++
 7 files changed, 38 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/m4/m4-nativesdk_1.4.16.bb
 create mode 100644 meta/recipes-devtools/m4/m4-nativesdk_1.4.9.bb



