Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A319C6AD31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 05:08:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5O581aA017539
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 22:08:01 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 23 Jun 2013 22:08:01 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 13:08:02 +0800
Message-ID: <cover.1372040014.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] fix qt-mobility-x11 build failure
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
X-List-Received-Date: Mon, 24 Jun 2013 05:08:00 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit b2df9eef5a99e1d5a9dd262c1091b409a8c8174d:

  psplash: Bump PR to allow removal of PRINC from meta-yocto (2013-06-21 14:23:16 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/qt-mobility
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/qt-mobility

Roy.Li (1):
  qt-mobility: remove /usr/lib from ld rpath-link option

 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc |    6 ++++++
 1 file changed, 6 insertions(+)

-- 
1.7.10.4


