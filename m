Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF896A687
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 05:51:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5D5pqIa009197
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 22:51:52 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 12 Jun 2013 22:51:52 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2013 13:51:50 +0800
Message-ID: <cover.1371102447.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] bind: backport six CVE patches
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
X-List-Received-Date: Thu, 13 Jun 2013 05:51:52 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 74158c2e99c6d8631800ae80025d1cc9f19336d2:

  tune-cortexa*.inc: fix tunings for cortex a5, a7, a8, a9, a15 machines. (2013-06-12 17:54:28 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/bind-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/bind-1

Roy.Li (1):
  bind: backport six CVE patches

 .../bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch |  119 +++++++++++++++++
 .../bind/bind-9.8.1/bind-CVE-2011-4313.patch       |   89 ++++++++++++
 .../bind/bind-9.8.1/bind-CVE-2012-1667.patch       |   92 +++++++++++++
 .../bind/bind-9.8.1/bind-CVE-2012-3817.patch       |   40 ++++++
 .../bind/bind-9.8.1/bind-CVE-2013-2266.patch       |   41 ++++++
 .../bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch   |  141 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |    6 +
 7 files changed, 528 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-9.8.1-CVE-2012-5166.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2011-4313.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-1667.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2012-3817.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-CVE-2013-2266.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.8.1/bind-Fix-CVE-2012-4244.patch

-- 
1.7.10.4


