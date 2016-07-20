Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3F3606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 08:32:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6K8WbGC015685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 01:32:37 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jul 2016 01:32:36 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2016 04:32:34 -0400
Message-ID: <cover.1468998858.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] LSB: 4.1.0 -> 5.0
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
X-List-Received-Date: Wed, 20 Jul 2016 08:32:40 -0000
Content-Type: text/plain

The test steps:
  1. Add the meta-qt4 layer to the ../conf/bblayers.conf
  2. Set the MACHINE ?= "x86-64" to ../conf/local.conf
  3. Set the DISTRO ?= "poky-lsb" to ../conf/local.conf
  4. Set the IMAGE_ROOTFS_EXTRA_SPACE = "5242880" ../conf/local.conf (Because it will download tests and produce many report files)
  5. Run the command: bitbake core-image-lsb qemuparams="-m 512" kvm

The test results:  
  TEST          PASS    
  cmdchk        98.7%
  libchk        95.8%
  alsa-t2c      99.9%
  core-t2c      96.6%
  cpp-t2c       99.9%
  desktop       98.6%
  desktop-t2c   98.7%
  libstdcpp     89.8%
  olver         99.8%
  perl          90.1%
  printing      84.8%
  python        98.1%
  qt4-azov      100%
  xml2-azov     99.9%
  apache        100%
  expect        100%
  groff         100%
  raptor        100%
  rsync         100%
  samba         100%
  xpdf          100%
  tcl           88.5%
  xts5		100%

Two special case:
  core          54.3%

Explanation:
        total   passed  failed  untest  other
  core  10661   5762    60      4826    91  
  The untest is that tests not relevant/not applicable, it does not affect the results.  
  The core tests contains 4826 untests, the failed is 60, so we consider it is a good results.

The following changes since commit 5c11e365e19357f721c49d076971567e7b64b61b:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:22:48 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/LSB_Update_to_5.0
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/LSB_Update_to_5.0

Dengke Du (1):
  LSB: 4.1.0 -> 5.0

 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      |  3 +-
 meta/recipes-extended/lsb/lsbtest/packages_list    | 57 +++++++++++-----------
 meta/recipes-extended/lsb/lsbtest/session          |  9 ----
 .../packagegroups/packagegroup-core-lsb.bb         | 11 -----
 4 files changed, 29 insertions(+), 51 deletions(-)

-- 
2.8.1


