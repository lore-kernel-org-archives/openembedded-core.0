Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RQzoI-00057H-Nh
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 12:07:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAHB0lat022725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 03:00:48 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 Nov 2011 03:00:47 -0800
Message-ID: <cover.1321527367.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 17 Nov 2011 18:56:07 +0800
Date: Thu, 17 Nov 2011 19:00:05 +0800
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
X-List-Received-Date: Thu, 17 Nov 2011 11:07:15 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

I remove patch "nodolt.patch" because it is no use in the new version \
and change patch "include_fix.patch" to "keysymdef_include.patch" from libx11-1.4.4

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/update_libx11-trim
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/update_libx11-trim

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (1):
  libx11-trim: update to 1.4.4

 .../xorg-lib/libx11-trim-1.3.4/include_fix.patch   |   21 ---------
 .../libx11-trim-1.3.4/makekeys_crosscompile.patch  |   45 --------------------
 .../xorg-lib/libx11-trim-1.3.4/nodolt.patch        |   12 -----
 .../libx11-trim-1.3.4/x11_disable_makekeys.patch   |   33 --------------
 .../{libx11-trim_1.3.4.bb => libx11-trim_1.4.4.bb} |    7 +--
 5 files changed, 3 insertions(+), 115 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/makekeys_crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-trim-1.3.4/x11_disable_makekeys.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-trim_1.3.4.bb => libx11-trim_1.4.4.bb} (78%)



