Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BECCE6DE07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 07:47:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2C7l6nX018461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 00:47:07 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 12 Mar 2014 00:47:06 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 15:46:56 +0800
Message-ID: <cover.1394610315.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 0/5] Update some packages
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
X-List-Received-Date: Wed, 12 Mar 2014 07:47:07 -0000
Content-Type: text/plain

The following changes since commit 1960f6b2ecbb793b40ebc9aed25c8f9cb7884c9a:

  populate_sdk_deb: Fix meta-toolchain-sdk with amd64 ARCH (2014-03-11 20:28:58 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/update-pkgs
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/update-pkgs

Kai Kang (5):
  qmmp: update to 0.7.5
  directfb: update to 1.7.1
  directfb-examples: update to 1.7.0
  alsa-tools: update to version 1.0.27
  libnewt: update to 0.52.17

 meta/recipes-extended/newt/files/cross_ar.patch     | 16 ++++------------
 .../recipes-extended/newt/files/fix_SHAREDDIR.patch |  4 ++--
 .../recipes-extended/newt/libnewt-python_0.52.14.bb |  5 ++---
 meta/recipes-extended/newt/libnewt_0.52.14.bb       | 10 ++++------
 ...examples_1.6.0.bb => directfb-examples_1.7.0.bb} |  4 ++--
 meta/recipes-graphics/directfb/directfb.inc         |  4 +---
 .../{directfb_1.6.3.bb => directfb_1.7.1.bb}        | 10 ++++------
 .../alsa/alsa-tools/autotools.patch                 | 15 ++++++---------
 ...{alsa-tools_1.0.26.1.bb => alsa-tools_1.0.27.bb} |  8 +++-----
 meta/recipes-qt/qt-apps/qmmp/no-host-paths.patch    | 13 +++++++------
 .../recipes-qt/qt-apps/qmmp/no-sessionmanager.patch | 21 ---------------------
 .../qt-apps/{qmmp_0.6.6.bb => qmmp_0.7.5.bb}        |  6 +++---
 12 files changed, 38 insertions(+), 78 deletions(-)
 rename meta/recipes-graphics/directfb/{directfb-examples_1.6.0.bb => directfb-examples_1.7.0.bb} (78%)
 rename meta/recipes-graphics/directfb/{directfb_1.6.3.bb => directfb_1.7.1.bb} (54%)
 mode change 100755 => 100644
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.26.1.bb => alsa-tools_1.0.27.bb} (87%)
 delete mode 100644 meta/recipes-qt/qt-apps/qmmp/no-sessionmanager.patch
 rename meta/recipes-qt/qt-apps/{qmmp_0.6.6.bb => qmmp_0.7.5.bb} (93%)

-- 
1.8.1.2


