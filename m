Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 758AE6FF6A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 07:01:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5H71MqC020770
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 00:01:22 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 00:01:22 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jun 2014 15:01:04 +0800
Message-ID: <cover.1402988295.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/4] upgrade: libnewt/libnewt-python/directfb/qmmp
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
X-List-Received-Date: Tue, 17 Jun 2014 07:01:27 -0000
Content-Type: text/plain

The following changes since commit 3a88df915831f2fd5e46ed71b21190398d1de0f1:

  alsa-tools: Add missing pkgconfg dependency (2014-06-14 08:46:02 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-20140617
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-20140617

Hongxu Jia (4):
  libnewt/libnewt-python: upgrade to 0.52.17
  directfb: upgrade to 1.7.4
  qmmp: upgrade to 0.7.7
  maintainers: Update directfb/ghostscript/libnewt/qmmp ownership

 meta-yocto/conf/distro/include/maintainers.inc     | 10 ++++-----
 meta/recipes-extended/newt/files/cross_ar.patch    | 19 +++++++++++------
 .../newt/files/fix_SHAREDDIR.patch                 | 12 +++++++++--
 .../newt/files/fix_python_fpic.patch               | 24 ----------------------
 ...python_0.52.14.bb => libnewt-python_0.52.17.bb} |  4 ++--
 .../{libnewt_0.52.14.bb => libnewt_0.52.17.bb}     |  8 ++++----
 .../{directfb_1.7.1.bb => directfb_1.7.4.bb}       |  6 +++---
 .../qt-apps/{qmmp_0.7.5.bb => qmmp_0.7.7.bb}       |  4 ++--
 8 files changed, 39 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-extended/newt/files/fix_python_fpic.patch
 rename meta/recipes-extended/newt/{libnewt-python_0.52.14.bb => libnewt-python_0.52.17.bb} (87%)
 rename meta/recipes-extended/newt/{libnewt_0.52.14.bb => libnewt_0.52.17.bb} (81%)
 rename meta/recipes-graphics/directfb/{directfb_1.7.1.bb => directfb_1.7.4.bb} (70%)
 rename meta/recipes-qt/qt-apps/{qmmp_0.7.5.bb => qmmp_0.7.7.bb} (95%)

-- 
1.8.1.2


