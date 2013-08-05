Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 532D761223
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 11:42:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r75BgBOw002249
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Aug 2013 04:42:11 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 5 Aug 2013 04:42:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Aug 2013 19:42:08 +0800
Message-ID: <cover.1375702232.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V3 0/1] list-packageconfig-flags.py: add a script to list all PACKAGECONFIG flags
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
X-List-Received-Date: Mon, 05 Aug 2013 11:42:11 -0000
Content-Type: text/plain

Change in V3: 
  * Reference Paul's bitbake parser examples to redesign the script
  * Add '-a' option to list all pkgs and PACKAGECONFIG information

Usage: list-packageconfig-flags.py [-f|-a] [-p]
  list available pkgs which have PACKAGECONFIG flags

OPTION:
  -h, --help    display this help and exit
  -f, --flag    list available PACKAGECONFIG flags and all affected pkgs
  -a, --all     list all pkgs and PACKAGECONFIG information
  -p, --prefer  list pkgs with preferred version

EXAMPLE:
Enter the build directory and setup OE Build Environment

list-packageconfig-flags.py
PACKAGE NAME                               PACKAGECONFIG FLAGS
==============================================================
alsa-tools-1.0.26.1                        defaultval gtk+
avahi-ui-0.6.31                            defaultval python
bluez4-4.101                               alsa defaultval pie

list-packageconfig-flags.py -f
PACKAGECONFIG FLAG     PACKAGE NAMES
====================================
3g                     connman-1.16        
avahi                  cups-1.6.3  pulseaudio-4.0
beecrypt               rpm-5.4.9  rpm-native-5.4.9

list-packageconfig-flags.py -a
==================================================
gtk+-2.24.18
/home/jiahongxu/yocto/poky/meta/recipes-gnome/gtk+/gtk+_2.24.18.bb
PACKAGECONFIG x11
PACKAGECONFIG[x11] --with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}

xf86-video-intel-2.21.9
/home/jiahongxu/yocto/poky/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb
PACKAGECONFIG None
PACKAGECONFIG[xvmc] --enable-xvmc,--disable-xvmc,libxvmc
PACKAGECONFIG[sna] --enable-sna,--disable-sna

//Hongxu

The following changes since commit 9de0ad47462c13ac4a2d73e12e92be6c1b4e0415:

  genericx86: ship all the driver firmware by default (2013-07-31 07:00:00 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/list-pkgconfigflag
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/list-pkgconfigflag

Hongxu Jia (1):
  list-packageconfig-flags.py: add a script to list all PACKAGECONFIG
    flags

 scripts/contrib/list-packageconfig-flags.py | 191 ++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100755 scripts/contrib/list-packageconfig-flags.py

-- 
1.8.1.2


