Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UF0nC-00015P-4S
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 12:21:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2BB4hqi005761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 04:04:43 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 04:04:43 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 19:04:24 +0800
Message-ID: <cover.1362985569.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [danny][PATCH 00/17] fix toolchain relocation issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 11:21:51 -0000
X-List-Received-Date: Mon, 11 Mar 2013 11:21:51 -0000
X-List-Received-Date: Mon, 11 Mar 2013 11:21:51 -0000
Content-Type: text/plain

1, fix toolchain relocation issues for danny which has be done in 1.4 master.

2, there are several other defects on the way to fix toolchain relocation
issues, so cherry-pick a set of related patches from 1.4 master and merge to
danny.

[Yocto #3069]
[Yocto #3100]
[YOCTO #3325]
[Yocto #3338]
[YOCTO #3401]
[YOCTO #3839]
[YOCTO #3984]
The following changes since commit e89f812a0af56beda951c1dce6113a61d6db8cda:

  bitbake: knotty.py: fix unknown event bb.event.DiskFull (2013-03-04 10:17:20 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-toolchain-relocation-danny
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-toolchain-relocation-danny

Hongxu Jia (17):
  toolchain-scripts.bbclass:add PYTHONHOME variable to
    environment-setup
  autoconf:fix autoreconf run failed on x86-64 gmae-toolchain
  perl-rdepends_5.14.2.inc: update dependencies among modules
  perl-rdepends_5.14.2.inc:fix perl File::Glob module is broken
  perl-rdepends_5.14.2.inc:update dependency creating script
  perl-rdepends_5.14.2.inc:be more strict in multiline comment
  perl_5.14.2.bb: fix dependecies
  perl_5.14.2.bb: use PACKAGES_DYNAMIC as regexp
  perl_5.14.2.bb:Fix support strict/vars/config/warnings modules
  perl_5.14.2.bb:fix autoreconf run failed on gmae-toolchain
  generate-sh.patch:fix autoreconf run failed on gmae-toolchain
  perl_5.14.2.bb:fix errors if configure is reattempted
  automake_1.12.3.bb: update dependencies
  nativesdk-ncurses 5.9: fix files were installed but not shipped
  populate_sdk_base: tarball installer: SDK overwrite warning
  perl_5.14.2.bb:fix toolchain relocation issues
  populate_sdk_base.bbclass:fix toolchain relocation issues

 meta/classes/populate_sdk_base.bbclass             |   22 +-
 meta/classes/toolchain-scripts.bbclass             |    2 +
 meta/recipes-core/ncurses/ncurses.inc              |    4 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |   18 +-
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    2 +-
 meta/recipes-devtools/automake/automake_1.12.3.bb  |   20 +-
 .../perl/perl-5.14.2/generate-sh.patch             |   16 +-
 .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2686 ++++++++++++++++++--
 meta/recipes-devtools/perl/perl_5.14.2.bb          |   32 +-
 9 files changed, 2552 insertions(+), 250 deletions(-)

-- 
1.7.10.4



