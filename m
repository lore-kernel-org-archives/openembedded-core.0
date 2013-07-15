Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0220B619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 08:59:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6F8x5e5028609
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 01:59:05 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 15 Jul 2013 01:59:05 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2013 16:59:05 +0800
Message-ID: <cover.1373877005.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] dpkg: backport a patch to support mipsn32el and mips64el
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
X-List-Received-Date: Mon, 15 Jul 2013 08:59:05 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit e683f1ce730dcdbf0acb280ebe53673c415e1454:

  pango: remove pango-module-basic-x RRECOMMENDS (2013-07-09 10:25:54 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/dpkg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/dpkg

Roy.Li (1):
  dpkg: backport a patch to support mipsn32el and mips64el

 ...-for-mipsn32-el-and-mips64-el-to-arch-tab.patch |   78 ++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.16.10.bb         |    3 +-
 2 files changed, 80 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/Add-support-for-mipsn32-el-and-mips64-el-to-arch-tab.patch

-- 
1.7.10.4


