Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RG27b-0002Go-J4
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 07:21:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9I5G04w028828
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 22:16:00 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 17 Oct 2011 22:16:00 -0700
Message-ID: <cover.1318904555.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 18 Oct 2011 10:22:35 +0800
Date: Tue, 18 Oct 2011 13:21:56 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/2] update packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Oct 2011 05:21:52 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Update packages "qmmp" and "libx11-diet".

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/update
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/update

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (2):
  qmmp: update to 0.5.2
  libx11-diet: update to 1.4.4

 .../xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.diff   |  540 ++++++++++++++++++++
 .../libx11-diet-1.4.4/fix-disable-xlocale.diff     |   16 +
 .../libx11-diet-1.4.4/fix-utf8-wrong-define.patch  |   17 +
 .../xorg-lib/libx11-diet-1.4.4/include_fix.patch   |   25 +
 .../xorg-lib/libx11-diet-1.4.4/nodolt.patch        |   14 +
 .../libx11-diet-1.4.4/x11_disable_makekeys.patch   |   31 ++
 .../recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb |   27 +
 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb              |   49 ++
 8 files changed, 719 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/X18NCMSstubs.diff
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-disable-xlocale.diff
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/fix-utf8-wrong-define.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/include_fix.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/nodolt.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb
 create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb



