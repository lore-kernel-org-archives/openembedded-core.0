Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QwSo5-0003u7-NJ
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 07:48:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7P5i0qV012388
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Aug 2011 22:44:00 -0700 (PDT)
Received: from localhost (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 24 Aug 2011 22:44:00 -0700
Message-ID: <cover.1314242316.git.kai.kang@windriver.com>
Old-Date: Thu, 25 Aug 2011 11:18:36 +0800
Date: Thu, 25 Aug 2011 13:43:56 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.196]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] bug fix for 1231
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
X-List-Received-Date: Thu, 25 Aug 2011 05:48:50 -0000
Content-Type: text/plain

From: Kang Kai <kai.kang@windriver.com>

Hi Saul,

qt4-tools-nativesdk needs set the gcc standard header searching paths because
crosssdk.bbclass uses a undefined variable "includedir_nativesdk".

These commits are to fix it, and update qt4-tools-nativesdk and cmake-nativesdk
bb files.

The following changes since commit 30381645eefe4e3222fd3ce45823f143ce2fa82c:

  rt-tests: use an explicit commit ID (2011-08-12 21:07:02 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro

Kang Kai (3):
  bitbake.conf: set includedir_nativesdk
  qt4-tools-nativesdk: remove gcc standard paths
  cmake-nativesdk: remove gcc standard paths

 meta/conf/bitbake.conf                      |    1 +
 meta/recipes-devtools/cmake/cmake_2.8.5.bb  |    8 +-------
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |    9 ++-------
 3 files changed, 4 insertions(+), 14 deletions(-)

-- 
1.7.5.1.300.gc565c



