Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RQG2G-0000st-I8
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 11:14:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAFA8Da4009073
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 02:08:13 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 15 Nov 2011 02:08:12 -0800
Message-ID: <cover.1321351373.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 15 Nov 2011 18:02:53 +0800
Date: Tue, 15 Nov 2011 18:07:54 +0800
To: <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 15 Nov 2011 10:14:38 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Saul,

I have modified my fault according to your suggestion.
Please review it again.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/libx11-diet
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/libx11-diet

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
 .../{libx11-diet_1.3.bb => libx11-diet_1.4.4.bb}   |   17 +++++-----
 9 files changed, 70 insertions(+), 78 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/x11_disable_makekeys.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/X18NCMSstubs.diff (99%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/fix-disable-xlocale.diff (90%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/fix-utf8-wrong-define.patch (88%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/x11_disable_makekeys.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.3.bb => libx11-diet_1.4.4.bb} (51%)



