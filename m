Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1To7H1-0002gt-29
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 07:49:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBR6Y635025016
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2012 22:34:06 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 26 Dec 2012 22:34:04 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Dec 2012 14:34:57 +0800
Message-ID: <cover.1356514770.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/3] V2: Perl: update package split and inner dependencies
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
X-List-Received-Date: Thu, 27 Dec 2012 06:49:03 -0000
Content-Type: text/plain

Because there is a pending perl-tests patch on the maillist, I didn't bump up PR.

V2:
This version update pacakge split script that make the same name A.pm and A.so files
into one package. And update autoconf rdependency.

The following changes since commit 90c0eb29f0b41e4ac2d3d17ebad7295c2ebdc02a:

  rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:55 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/perl-depends
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/perl-depends

Kang Kai (3):
  autoconf: update RDEDENDS
  perl: update RPROVIDES and popuate_package script
  perl: update dependency creating script

 meta/recipes-devtools/autoconf/autoconf.inc        |    1 -
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    2 +-
 .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2336 +++++++++++++++++++-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    9 +-
 4 files changed, 2293 insertions(+), 55 deletions(-)

-- 
1.7.5.4



