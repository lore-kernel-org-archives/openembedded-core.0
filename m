Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 54F5E6E245
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:55:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBD7tikj010437
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Dec 2013 23:55:44 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 12 Dec 2013 23:55:43 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Fri, 13 Dec 2013 15:54:42 +0800
Message-ID: <cover.1386920771.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] Update for lsb and lsbtest
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
X-List-Received-Date: Fri, 13 Dec 2013 07:55:46 -0000
Content-Type: text/plain

Hi Saul,

This version of lsb patch creates necessary directory otherwise do_install fails.
And some update for package lsbtest.

The following changes since commit ba8506ee342a1a579ceb309f3f50285eaad84f25:

  local.conf.extended: Bring into sync with OE-Core (2013-12-12 23:18:39 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/lsb
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/?h=kangkai%2Flsb

Kai Kang (5):
  lsb: update directory of install_initd and remove_initd
  LSB_Test.sh: update rpm platform file when enable multilib
  LSB_Test.sh: check ldconfig before update cache
  LSB_Test.sh: update locales
  lsbtest: add ppc64 support

 meta/recipes-extended/lsb/lsb_4.1.bb          |  7 ++++---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 20 ++++++++++++++++++--
 meta/recipes-extended/lsb/lsbtest_1.0.bb      | 12 ++++++++++++
 3 files changed, 34 insertions(+), 5 deletions(-)

-- 
1.8.1.2


