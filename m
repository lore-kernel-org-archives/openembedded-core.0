Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QaBMG-0008Cc-Fj
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 20:44:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5OIeLT0007272
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 11:40:21 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 24 Jun 2011 11:40:21 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2011 13:40:14 -0500
Message-ID: <cover.1308940765.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/4] A few misc recipe fixed
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
X-List-Received-Date: Fri, 24 Jun 2011 18:44:00 -0000
Content-Type: text/plain

The problems with these recipes were detected over the course of a few
make -k world builds.. This allows make world to complete.

The following changes since commit 3aec2fa2df9aaa883feda0d7aed85e63d01398b9:

  qemuimagetest: update cvs and iptables to newer version for toolchain test (2011-06-24 11:28:28 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/fix-recipe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/fix-recipe

Mark Hatle (4):
  gcc: Fix file ownership
  rpm: Change config option
  msmtp: Disable gnome keyring
  linux-firmware: Fix file permissions

 .../recipes-devtools/gcc/gcc-configure-runtime.inc |    1 +
 meta/recipes-devtools/gcc/gcc-package-sdk.inc      |    2 ++
 meta/recipes-devtools/gcc/gcc-package-target.inc   |    2 ++
 meta/recipes-devtools/gcc/libgcc_4.5.1.bb          |    2 ++
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 ++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
 meta/recipes-extended/msmtp/msmtp_1.4.24.bb        |    4 +++-
 .../linux-firmware/linux-firmware_git.bb           |    6 +++---
 8 files changed, 16 insertions(+), 5 deletions(-)

-- 
1.7.3.4



