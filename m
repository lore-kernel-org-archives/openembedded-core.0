Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD8A7607F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 02:39:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r632dTbs003538
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2013 19:39:29 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 2 Jul 2013 19:39:28 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jul 2013 10:39:56 +0800
Message-ID: <cover.1372819132.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/1] busybox: upgrade to stable 1.21.1
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
X-List-Received-Date: Wed, 03 Jul 2013 02:39:29 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 80b263430453896189b704d0997943642eec6fef:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:08 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/busybox-upgrade-1.21.1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-upgrade-1.21.1

Chen Qi (1):
  busybox: upgrade to stable 1.21.1

 .../poky-tiny/defconfig                            |    0
 ...box_1.20.2.bbappend => busybox_1.21.1.bbappend} |    0
 .../busybox/busybox-1.20.2/B921600.patch           |   24 -----
 .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   28 ------
 .../busybox-mkfs-minix-tests_bigendian.patch       |   34 -------
 .../fix-for-spurious-testsuite-failure.patch       |   27 ------
 .../busybox/busybox-1.20.2/strict-atime.patch      |   49 ----------
 .../busybox/busybox-1.20.2/sys_resource.patch      |   99 --------------------
 .../busybox/busybox-1.20.2/wget_dl_dir_fix.patch   |   30 ------
 .../busybox-appletlib-dependency.patch             |    0
 ...usybox-list-suid-and-non-suid-app-configs.patch |    0
 .../busybox-sulogin-empty-root-password.patch      |    0
 .../busybox-udhcpc-no_deconfig.patch               |    0
 .../{busybox-1.20.2 => busybox-1.21.1}/defconfig   |    0
 .../fail_on_no_media.patch                         |    0
 .../get_header_tar.patch                           |    0
 .../login-utilities.cfg                            |    0
 .../run-parts.in.usr-bin.patch                     |    4 +-
 .../stat-usr-bin.patch                             |    0
 ...estsuite-du-du-k-works-fix-false-positive.patch |    0
 .../watch.in.usr-bin.patch                         |    0
 .../{busybox_1.20.2.bb => busybox_1.21.1.bb}       |   13 +--
 22 files changed, 5 insertions(+), 303 deletions(-)
 rename meta-yocto/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/poky-tiny/defconfig (100%)
 rename meta-yocto/recipes-core/busybox/{busybox_1.20.2.bbappend => busybox_1.21.1.bbappend} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/B921600.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/busybox-list-suid-and-non-suid-app-configs.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/busybox-sulogin-empty-root-password.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/busybox-udhcpc-no_deconfig.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/defconfig (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/fail_on_no_media.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/login-utilities.cfg (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/run-parts.in.usr-bin.patch (94%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/stat-usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/testsuite-du-du-k-works-fix-false-positive.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.1}/watch.in.usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.20.2.bb => busybox_1.21.1.bb} (75%)

-- 
1.7.9.5


