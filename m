Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QW34d-0005bT-2C
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 11:04:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5D91HtT026382
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2011 02:01:17 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 13 Jun 2011 02:01:17 -0700
Message-ID: <cover.1307954821.git.kai.kang@windriver.com>
Old-Date: Mon, 13 Jun 2011 16:47:01 +0800
Date: Mon, 13 Jun 2011 17:01:29 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] eglibc: migrate configurability from oe V5
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
X-List-Received-Date: Mon, 13 Jun 2011 09:04:43 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Hi Saul,

This update only add file local.conf.sample.extended, not source it any more.

Using DISTRO_FEATURES_LIBC to manage eglibc configurable options suggested by
Koen and Martin, and set DISTRO_FEATURES_LIBC in default-distrovars.inc to enable
all eglibc configurable options by default to make current compilation succeed.

Regards,

The following changes since commit 7f34cd1eb2a459709006ae985a14decd4d2152e6:

  tzcode: Update to 2011g (2011-06-06 15:58:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro

Kang Kai (2):
  bitbake: add local.conf.sample.extended
  eglibc: migrate configurability from oe

 meta-yocto/conf/local.conf.sample.extended      |   12 ++++
 meta/conf/distro/include/default-distrovars.inc |    9 +++-
 meta/recipes-core/eglibc/eglibc-options.inc     |   62 +++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc             |    6 ++
 4 files changed, 88 insertions(+), 1 deletions(-)
 create mode 100644 meta-yocto/conf/local.conf.sample.extended
 create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc

-- 
1.7.5.1.300.gc565c



