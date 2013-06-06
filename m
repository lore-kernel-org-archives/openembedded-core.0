Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CAA376A875
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 08:32:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r568Wm02011421
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 01:32:49 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 01:32:46 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2013 16:32:49 +0800
Message-ID: <cover.1370506099.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] socat: enable termios
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
X-List-Received-Date: Thu, 06 Jun 2013 08:32:48 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 9ba812ab1f613d28f9eb3192d2ff1a34dfce33e4:

  binutils: fix compile error of complex expressions before @l/@h (2013-06-03 16:46:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/socat-v1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/socat-v1

Roy.Li (1):
  socat: enable termios

 .../socat/files/fix-xxx_SHIFT-autoheader.patch     |   40 ++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.2.1.bb   |   15 ++++++--
 2 files changed, 52 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch

-- 
1.7.10.4


