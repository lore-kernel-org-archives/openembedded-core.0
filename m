Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1ROoxg-0004uf-9Z
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 12:07:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pABB1bgX026902
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 03:01:37 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 11 Nov 2011 03:01:37 -0800
Message-ID: <cover.1321009557.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 11 Nov 2011 19:05:57 +0800
Date: Fri, 11 Nov 2011 19:09:56 +0800
To: <openembedded-core@lists.openembedded.org>
CC: 
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] libx11-diet: update to 1.4.4
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
X-List-Received-Date: Fri, 11 Nov 2011 11:07:56 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Saul,

I have modified my fault according to your suggestion.
Please review it again.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/update_libx11-diet
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/update_libx11-diet

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  libx11-diet: update to 1.4.4

 .../xorg-lib/libx11-diet-1.3/include_fix.patch     |   25 --------------
 .../xorg-lib/libx11-diet-1.3/nodolt.patch          |   14 --------
 .../libx11-diet-1.3/x11_disable_makekeys.patch     |   31 ------------------
 .../X18NCMSstubs.diff                              |    1 +
 .../fix-disable-xlocale.diff                       |    1 +
 .../fix-utf8-wrong-define.patch                    |    2 +
 .../libx11-diet-1.4.4/keysymdef_include.patch      |   23 +++++++++++++
 .../libx11-diet-1.4.4/x11_disable_makekeys.patch   |   34 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb  |   25 --------------
 .../recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb |   28 ++++++++++++++++
 10 files changed, 89 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/x11_disable_makekeys.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/X18NCMSstubs.diff (99%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/fix-disable-xlocale.diff (90%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/fix-utf8-wrong-define.patch (88%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet_1.3.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet_1.4.4.bb



