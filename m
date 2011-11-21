Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RSPNc-000296-SZ
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Nov 2011 09:37:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAL8V0Nc019695
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2011 00:31:01 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 21 Nov 2011 00:31:00 -0800
Message-ID: <cover.1321862948.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 21 Nov 2011 16:09:08 +0800
Date: Mon, 21 Nov 2011 16:29:32 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/1] libx11-trim: update to 1.4.4
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
X-List-Received-Date: Mon, 21 Nov 2011 08:37:34 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Thanks for martin's comment.
I have modified libx11-trim_1.4.4.bb and don't remove libx11-trim_1.3.4.bb because someone could want to use previous version for some reason. If it is not necessary later, then I will remove the old version.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/update_libx11-trim
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/update_libx11-trim

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  blibx11-trim: update to 1.4.4

 .../libx11-trim-1.4.4/keysymdef_include.patch      |   23 ++++++++++
 .../libx11-trim-1.4.4/makekeys_crosscompile.patch  |   45 ++++++++++++++++++++
 .../libx11-trim-1.4.4/x11_disable_makekeys.patch   |   29 +++++++++++++
 .../recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb |   20 +++++++++
 4 files changed, 117 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/keysymdef_include.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim_1.4.4.bb



