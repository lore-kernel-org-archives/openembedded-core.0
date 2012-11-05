Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TVIh7-0007U9-Nu
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Nov 2012 10:10:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA58uOOt016073
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Nov 2012 00:56:24 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 5 Nov 2012 00:56:24 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Mon, 5 Nov 2012 16:56:46 +0800
Message-ID: <cover.1352101205.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Update perl populate_package and dependency creating scripts
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
X-List-Received-Date: Mon, 05 Nov 2012 09:10:10 -0000
Content-Type: text/plain

The following changes since commit e421e95de0ce430cc2c6db9b0712a66ab96288a1:

  gnome-desktop: Now we depend on gnome-common-native, use the correct sysroot (2012-11-02 16:18:32 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-perl

Kang Kai (2):
  perl: update dependency creating script
  perl: update RPROVIDES and popuate_package script

 .../recipes-devtools/perl/perl-rdepends_5.14.2.inc | 2335 +++++++++++++++++++-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    8 +-
 2 files changed, 2292 insertions(+), 51 deletions(-)

-- 
1.7.5.4



