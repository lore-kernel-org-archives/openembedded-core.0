Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SIKS1-0006ZR-3b
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 15:52:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3CDhJc1014445
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 06:43:19 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 12 Apr 2012 06:43:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Apr 2012 21:43:19 +0800
Message-ID: <cover.1334238048.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] mklibs-native 0.1.33: include unistd.h to fix build for gcc 4.7
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
X-List-Received-Date: Thu, 12 Apr 2012 13:52:41 -0000
Content-Type: text/plain

Test info:
Has been tested on:
Fedora 17 64bit
Fedora 16 64bit
Ubuntu 10.10 32bit

// Robert

The following changes since commit c37faea947ef3980934c02661ecd79cd9668b8a6:

  libunistring: Fix parallel make issue (2012-04-12 12:37:52 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/mklibs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/mklibs

Robert Yang (1):
  mklibs-native 0.1.33: include unistd.h to fix build for gcc 4.7

 .../mklibs/files/include-unistd.h-for-gcc47.patch  |   29 ++++++++++++++++++++
 .../mklibs/mklibs-native_0.1.33.bb                 |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch



