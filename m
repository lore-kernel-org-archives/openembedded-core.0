Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 23BFD6DA81
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 03:33:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBG3X8nc009884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Dec 2013 19:33:08 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Sun, 15 Dec 2013 19:33:09 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 16 Dec 2013 11:32:56 +0800
Message-ID: <cover.1387164126.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] V3: Update for lsb and lsbtest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2013 03:33:11 -0000
Content-Type: text/plain

V3:
* fix installed but unshipped issue for lib64-lsb

V2:
* This version of lsb patch creates necessary directory otherwise do_install fails.
* Some update for package lsbtest.

The following changes since commit 36fe775672d66e3d83575eb532eb6ab5109343b4:

  useradd-example: add example for setting clear text password (2013-12-14 09:16:38 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/lsb
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/?h=kangkai%2Flsb

Kai Kang (5):
  lsb: update directory of install_initd and remove_initd
  LSB_Test.sh: update rpm platform file when enable multilib
  LSB_Test.sh: check ldconfig before update cache
  LSB_Test.sh: update locales
  lsbtest: add ppc64 support

 meta/recipes-extended/lsb/lsb_4.1.bb          |  8 +++++---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 20 ++++++++++++++++++--
 meta/recipes-extended/lsb/lsbtest_1.0.bb      | 12 ++++++++++++
 3 files changed, 35 insertions(+), 5 deletions(-)

-- 
1.8.1.2


