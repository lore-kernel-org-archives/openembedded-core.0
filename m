Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E38473223
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 01:32:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S1W7wT015755
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 18:32:07 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 27 May 2015 18:32:06 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <randy.macleod@windriver.com>
Date: Thu, 28 May 2015 09:26:13 +0800
Message-ID: <cover.1432775689.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] Fix CVE issues and add new libav recipe
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
X-List-Received-Date: Thu, 28 May 2015 01:32:08 -0000
Content-Type: text/plain

* Fix CVE issues for severial packages
* Upgrade libav  9.61 --> 9.18
* Add recipe for libav series 11

Build world for x86-64 and qemuarm are fine except some textrel warnings for qemuarm.
Should I open new defects that?

--Kai

The following changes since commit a431e5aa572358ba61cf3c9e501f830263bdcd3d:

  bitbake: data: Make expandKeys deterministic (2015-05-27 17:48:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/CVEs
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/CVEs

Kai Kang (5):
  gpgme: fix CVE-2014-3564
  grep: fix CVE-2015-1345
  qt4: fix CVE issues
  libav: upgrade to 9.18
  libav: add recipe for 11 release series

 .../grep/grep/grep-fix-CVE-2015-1345.patch         | 154 +++++++++++++++++++++
 meta/recipes-extended/grep/grep_2.21.bb            |   3 +-
 meta/recipes-multimedia/libav/libav.inc            |   2 -
 .../libav/libav/libav-fix-CVE-2014-9676.patch      |  98 +++++++++++++
 meta/recipes-multimedia/libav/libav_11.3.bb        |   4 +
 meta/recipes-multimedia/libav/libav_9.16.bb        |   4 -
 meta/recipes-multimedia/libav/libav_9.18.bb        |   6 +
 meta/recipes-qt/qt4/qt4-4.8.6.inc                  |   2 +
 ...Fixes-crash-in-bmp-and-ico-image-decoding.patch |  71 ++++++++++
 .../0036-Fixes-crash-in-gif-image-decoder.patch    |  39 ++++++
 .../gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch      |  56 ++++++++
 meta/recipes-support/gpgme/gpgme_1.4.3.bb          |   4 +-
 12 files changed, 435 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-extended/grep/grep/grep-fix-CVE-2015-1345.patch
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
 create mode 100644 meta/recipes-multimedia/libav/libav_11.3.bb
 delete mode 100644 meta/recipes-multimedia/libav/libav_9.16.bb
 create mode 100644 meta/recipes-multimedia/libav/libav_9.18.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0035-Fixes-crash-in-bmp-and-ico-image-decoding.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.6/0036-Fixes-crash-in-gif-image-decoder.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch

-- 
1.9.1


