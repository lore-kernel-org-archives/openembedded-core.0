Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q29lk-0005YH-66
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 23:09:40 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q29jy-0003AS-0x from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Mar 2011 15:07:50 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 22 Mar 2011 15:07:49 -0700
Received: from localhost.localdomain ([172.30.80.248]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 22 Mar 2011 16:07:48 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:07:24 -0700
Message-Id: <cover.1300831551.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 22 Mar 2011 22:07:48.0950 (UTC)
	FILETIME=[94A5C760:01CBE8DD]
Subject: [PATCH 0/7] Consistent MIRROR usage
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
X-List-Received-Date: Tue, 22 Mar 2011 22:09:40 -0000

The following series updates the recipes in oe-core that fetch from
a site we have a MIRROR variable for (gnu.org, sourceforge, etc) but
were fetching directly rather than via the mirror variable.  Part of
this is making use of KERNELORG_MIRROR consistent (mirrors.bbclass included
/pub but the main variable did not) and finally we kill off checksums.ini.

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: trini/use-mirrors-consistently
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/use-mirrors-consistently

Thanks,
    Tom Rini <tom_rini@mentor.com>
---


Tom Rini (7):
  net-tools: Switch to using DEBIAN_MIRROR
  Various: Switch to GNOME_MIRROR
  Various: Switch to using GNU_MIRROR
  Various: Switch to KERNELORG_MIRROR
  Various: Update KERNELORG_MIRROR for consistency
  Various: Switch to SOURCEFORGE_MIRROR
  checksums.ini: Delete

 .../recipes-support/openobex/openobex_1.5.bb       |    2 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/checksums.ini                            |15076 --------------------
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    2 +-
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    2 +-
 meta/recipes-connectivity/bluez/bluez4_4.82.bb     |    2 +-
 .../connman/connman-gnome_0.5.bb                   |    2 +-
 meta/recipes-connectivity/connman/connman_0.65.bb  |    2 +-
 meta/recipes-connectivity/ofono/ofono_0.37.bb      |    2 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    2 +-
 meta/recipes-core/coreutils/coreutils_8.9.bb       |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    2 +-
 meta/recipes-core/glibc/glibc_2.10.1.bb            |    6 +-
 meta/recipes-core/udev/udev-new.inc                |    2 +-
 meta/recipes-core/udev/udev_145.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    2 +-
 meta/recipes-devtools/git/git.inc                  |    2 +-
 meta/recipes-devtools/guilt/guilt-native_0.33.bb   |    2 +-
 .../python/python-pygobject_2.27.0.bb              |    2 +-
 meta/recipes-devtools/syslinux/syslinux_4.03.bb    |    2 +-
 meta/recipes-extended/bash/bash_3.2.48.bb          |    6 +-
 meta/recipes-extended/bash/bash_4.1.bb             |   14 +-
 meta/recipes-extended/groff/groff_1.18.1.4.bb      |    2 +-
 meta/recipes-extended/libidn/libidn_1.19.bb        |    2 +-
 meta/recipes-extended/lsb/lsb_1.4.bb               |    2 +-
 meta/recipes-extended/man-pages/man-pages_3.32.bb  |    2 +-
 meta/recipes-extended/mdadm/mdadm_3.1.4.bb         |    2 +-
 .../net-tools/net-tools_1.60-23.bb                 |    4 +-
 meta/recipes-extended/pam/libpam_1.1.3.bb          |    2 +-
 meta/recipes-extended/quota/quota_4.00-pre1.bb     |    2 +-
 meta/recipes-extended/which/which_2.20.bb          |    2 +-
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     |    2 +-
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |    2 +-
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb           |    2 +-
 meta/recipes-kernel/kexec/kexec-tools.inc          |    2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |    2 +-
 .../module-init-tools/module-init-tools.inc        |    2 +-
 meta/recipes-kernel/modutils/modutils_2.4.27.bb    |    2 +-
 meta/recipes-support/aspell/aspell_0.60.6.bb       |    2 +-
 meta/recipes-support/gmp/gmp.inc                   |    2 +-
 meta/recipes-support/gmp/gmp_4.2.1.bb              |    2 +-
 meta/recipes-support/libcap/libcap.inc             |    2 +-
 meta/recipes-support/libiconv/libiconv_1.9.2.bb    |    2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.32.1.bb |    2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.4.1.bb  |    2 +-
 meta/recipes-support/libsoup/libsoup_2.2.100.bb    |    2 +-
 47 files changed, 57 insertions(+), 15133 deletions(-)
 delete mode 100644 meta/conf/checksums.ini



