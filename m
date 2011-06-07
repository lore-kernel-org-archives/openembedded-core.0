Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QTsqk-0006pM-9N
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 11:45:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p579g4r9003358
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Jun 2011 02:42:04 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 7 Jun 2011 02:42:03 -0700
Message-ID: <cover.1307438945.git.kai.kang@windriver.com>
Old-Date: Tue, 7 Jun 2011 17:29:05 +0800
Date: Tue, 7 Jun 2011 17:42:00 +0800
To: <richard.purdie@linuxfoundation.org>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: Kang, poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] eglibc: migrate configurability from oe V3
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
X-List-Received-Date: Tue, 07 Jun 2011 09:45:26 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Hi Richard,

I add a new local.extended.conf to put the DISTRO_FEATURES there, and I am not quit sure that 
is the right use of it. 

Update to check DISTRO_FEATURES to get eglibc configuration options.
Update to set or not set PACKAGE_NO_GCONV automatically.

Any suggestion will be appreciated!
Thanks & Regards,
Kai

The following changes since commit 7f34cd1eb2a459709006ae985a14decd4d2152e6:

  tzcode: Update to 2011g (2011-06-06 15:58:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro

Kang Kai (2):
  bitbake: add another local configuration file
  eglibc: migrate configurability from oe

 meta-yocto/conf/local.conf.sample.extended         |    5 ++
 meta/conf/bitbake.conf                             |    1 +
 meta/conf/distro/include/default-distrovars.inc    |    8 ++-
 .../eglibc-2.13-fix-macro-RTLD_DEBUG.patch         |   20 ++++++
 meta/recipes-core/eglibc/eglibc-options.inc        |   62 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc                |    6 ++
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
 scripts/oe-setup-builddir                          |   19 ++++++
 8 files changed, 123 insertions(+), 2 deletions(-)
 create mode 100644 meta-yocto/conf/local.conf.sample.extended
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc

-- 
1.7.5.1.300.gc565c



