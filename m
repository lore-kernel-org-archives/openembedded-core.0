Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TQuMg-0007Fm-HT
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 08:22:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q9O69QMV006277
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Oct 2012 23:09:26 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Tue, 23 Oct 2012 23:09:24 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 24 Oct 2012 14:09:50 +0800
Message-ID: <cover.1351049433.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] V2: Fix (nativesdk-)perl dependency issues
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
X-List-Received-Date: Wed, 24 Oct 2012 06:22:55 -0000
Content-Type: text/plain

V2:
update dependencies among perl modules and fix dependency rules don't work
for nativesdk packages.
add the specified perl modules to autoconf rdepends and remove redundant deps
from automake.

The following changes since commit f07be9d2b68ac4e184ce2670bfa65b8d944387aa:

  yocto-bsp: set branches_base for list_property_values() (2012-10-22 12:15:55 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/fix-perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/fix-perl

Kang Kai (3):
  perl: update dependencies among modules
  autoconf: update runtime dependencies
  automake: update dependencies

 meta/recipes-devtools/autoconf/autoconf.inc        |   19 +-
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    2 +-
 meta/recipes-devtools/automake/automake_1.12.3.bb  |   20 +-
 .../recipes-devtools/perl/perl-rdepends_5.14.2.inc |  436 ++++++++++---------
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
 5 files changed, 251 insertions(+), 228 deletions(-)

-- 
1.7.5.4



