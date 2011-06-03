Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QSJRg-0001Bq-Sy
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 03:45:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p531fpH8012152
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jun 2011 18:41:52 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 2 Jun 2011 18:41:51 -0700
Message-ID: <cover.1307005797.git.kai.kang@windriver.com>
Old-Date: Thu, 2 Jun 2011 17:09:57 +0800
Date: Fri, 3 Jun 2011 09:41:39 +0800
To: <openembedded-core@lists.openembedded.org>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 0/1] eglibc: enable eglibc configurability
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
X-List-Received-Date: Fri, 03 Jun 2011 01:45:05 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Migrate configurability from oe, try to shrink minimal image size

The switch is in local.conf.sample, uncomment the line
DISTRO_FEATURES_EGLIBC = ""
and write what options you want to enable.

If want to disable locale-code charsets or locales, you have to uncomment
PACKAGE_NO_GCONV = 1
Because without this, it fails on package_do_split_gconvs in libc-package.bbclass

The following changes since commit fabfd7ec97af3ae2eef39b94d52b49ad565aed90:

  task-core-lsb: add cups and ghostscript into image (2011-06-02 15:51:23 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib.git kangkai/distro
  http://git.pokylinux.org/cgit.cgi//log/?h=kangkai/distro

Kang Kai (1):
  eglibc: migrate configurability from oe

 meta-yocto/conf/local.conf.sample                  |   17 ++++++
 .../eglibc-2.13-fix-macro-RTLD_DEBUG.patch         |   20 +++++++
 meta/recipes-core/eglibc/eglibc-options.inc        |   55 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc                |    6 ++
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
 5 files changed, 101 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/eglibc-2.13-fix-macro-RTLD_DEBUG.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-options.inc

-- 
1.7.5.1.300.gc565c



