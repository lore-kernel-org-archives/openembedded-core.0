Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4D6C61E92
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 07:29:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r557TwPj026716
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Jun 2013 00:29:58 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 5 Jun 2013 00:29:57 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jun 2013 15:30:00 +0800
Message-ID: <cover.1370412765.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] socat enable termios
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
X-List-Received-Date: Wed, 05 Jun 2013 07:29:57 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 9ba812ab1f613d28f9eb3192d2ff1a34dfce33e4:

  binutils: fix compile error of complex expressions before @l/@h (2013-06-03 16:46:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/socat
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/socat

Roy.Li (1):
  socat: enable termios

 .../socat/files/fix-xxx_SHIFT-autoheader.patch     |   40 +++++++++
 .../socat/files/fix_termios.patch                  |   85 ++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.2.1.bb   |    8 +-
 3 files changed, 129 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch
 create mode 100644 meta/recipes-connectivity/socat/files/fix_termios.patch

-- 
1.7.10.4


