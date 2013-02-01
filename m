Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1U1B0r-0001Dj-GJ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 08:26:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r117AVrk001821
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 23:10:31 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 31 Jan 2013 23:10:30 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Feb 2013 15:10:28 +0800
Message-ID: <cover.1359688928.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] QT4: use '-no-neon' if cpu does not support neon
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 07:26:19 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

*** BLURB HERE ***
The following changes since commit ab692ed618f83df2ce452769165314e70b867345:

  gettext: Fix build with uclibc remove upstreamed patches (2013-01-27 13:52:49 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib qt4-check-neon-against-tune-features
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=qt4-check-neon-against-tune-features

Roy.Li (1):
  QT4: use '-no-neon' if cpu does not support neon

 meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb |    4 ++--
 meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
1.7.10.4



