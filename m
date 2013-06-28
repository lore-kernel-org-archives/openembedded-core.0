Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B054D6023E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 01:11:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5S1B57h010562
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 18:11:05 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 27 Jun 2013 18:11:05 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2013 09:11:04 +0800
Message-ID: <cover.1372381458.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] xf86-video-intel: backport a patch to fix a compile failure
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
X-List-Received-Date: Fri, 28 Jun 2013 01:11:04 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 099063f353a7a18720c92d87400726a49eed432f:

  sanity.bbclass: Fix COREBASE sanity tests (2013-06-27 12:48:52 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/xf86-video-intel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/xf86-video-intel

Roy.Li (1):
  xf86-video-intel: backport a patch to fix a compile failure

 ...-compilation-error-with-xorg-xserver-1.10.patch |   31 ++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_2.21.9.bb         |    2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-compilation-error-with-xorg-xserver-1.10.patch

-- 
1.7.10.4


