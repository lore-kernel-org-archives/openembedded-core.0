Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1TYphY-0007iK-G7
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 04:01:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAF2lFgT014705
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 18:47:15 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 14 Nov 2012 18:47:15 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Nov 2012 10:47:15 +0800
Message-ID: <cover.1352947538.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Change some applets dirs to make them FHS and LSB compliance
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
X-List-Received-Date: Thu, 15 Nov 2012 03:01:13 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

The following changes since commit b53ea6687b6201c8c5ab5cb0d2a845ef7e7b2abe:

  sstate: Bump version number to deal with layout fixes (2012-11-14 23:37:26 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib roy/change-applets-dir
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/change-applets-dir

Roy.Li (1):
  Change some applets dirs to make them FHS and LSB compliance

 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |    6 +-
 meta/recipes-connectivity/iproute2/iproute2.inc    |    2 +-
 .../iproute2/iproute2_3.5.1.bb                     |    2 +-
 ...-several-applets-to-different-install-dir.patch |  174 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    5 +-
 meta/recipes-core/kbd/kbd_1.15.2.bb                |    9 +-
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |   22 ++-
 meta/recipes-core/util-linux/util-linux.inc        |    5 +-
 meta/recipes-core/util-linux/util-linux_2.21.2.bb  |    2 +-
 9 files changed, 214 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/Move-several-applets-to-different-install-dir.patch

-- 
1.7.4.1



