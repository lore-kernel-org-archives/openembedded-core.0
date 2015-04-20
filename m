Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id EC11F72E49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 15:12:21 +0000 (UTC)
Received: by wizk4 with SMTP id k4so103499725wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=vgU0fbrId9HiEpirOwH/tG04luaduQK+Y7puO3GDLZk=;
	b=0txLfaH2aph3RihY9GWlFZ6FebvkzIJ/ZZlxcIcfY+qOB4kTGrSYIbWUHEWmlHuap5
	rq6VnycJFet99NBSQ954c2HCgoYnmSAKFtZ8NwJgyCqTAlvalMF7Z8h2VL9/hSlvQjW7
	KU1pUOLzhx+L00l+HWO+mTu4UhoaAeCD/ty3gJEHRQJX8fsCtf4GGAZO39FUYwWKrM7y
	pNRGoBLA2W8NSt4cYT9NJZJlj62MX8qOfbQh6DUgbBK3nQfO50A71j4S5yPCDttNh2YB
	VZd7b2JgpoBNV7Mz0TSUrYOIZ8RvF9ypCRfb/L3KwhKFkrMzK4LVXWPx2YwcT77gegLC
	ZXzg==
X-Received: by 10.180.100.227 with SMTP id fb3mr25729394wib.90.1429542742181; 
	Mon, 20 Apr 2015 08:12:22 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	g14sm24195024wjs.47.2015.04.20.08.12.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Apr 2015 08:12:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Apr 2015 17:12:26 +0200
To: Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20150420151226.GE3686@jama>
References: <cover.1429540534.git.cristian.iorga@intel.com>
	<edfdcd549c391dd7b6ddfa5a1f7a1027b1ce6dc7.1429540534.git.cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <edfdcd549c391dd7b6ddfa5a1f7a1027b1ce6dc7.1429540534.git.cristian.iorga@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/4] bluez: remove recipe
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
X-List-Received-Date: Mon, 20 Apr 2015 15:12:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2015 at 05:46:45PM +0300, Cristian Iorga wrote:
> BlueZ 4.x and associated
> recipes are now obsolete (bluez4,
> bluez-hcidump, gst-plugin-bluetooth).
> Will be moved into meta-networking

No, the patches are adding it to recipes-connectivity, not to
meta-networking.

> collection of meta-openembedded.
> BlueZ 4.x is still usable in oe-core.

Is it? How without a recipe in oe-core?

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  .../obsolete_automake_macros.patch                 |  14 ---
>  .../bluez/bluez-hcidump_2.5.bb                     |  22 -----
>  .../bluez/bluez4-4.101/bluetooth.conf              |  16 ---
>  .../bluez/bluez4-4.101/fix-udev-paths.patch        |  37 -------
>  .../bluez/bluez4-4.101/fix_encrypt_collision.patch | 110 ---------------=
------
>  .../bluez/bluez4-4.101/install-test-script.patch   |  26 -----
>  ...ork-fix-network-Connect-method-parameters.patch |  30 ------
>  .../bluez4-4.101/obsolete_automake_macros.patch    |  14 ---
>  .../bluez/bluez4-4.101/sbc_mmx.patch               |  24 -----
>  ...pygobject-instead-ofgobject-introspection.patch |  27 -----
>  meta/recipes-connectivity/bluez/bluez4.inc         |  46 ---------
>  meta/recipes-connectivity/bluez/bluez4_4.101.bb    |  47 ---------
>  .../bluez/gst-plugin-bluetooth_4.101.bb            |  39 --------
>  13 files changed, 452 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obs=
olete_automake_macros.patch
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/bluetoot=
h.conf
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev=
-paths.patch
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/fix_encr=
ypt_collision.patch
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/install-=
test-script.patch
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/network-=
fix-network-Connect-method-parameters.patch
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/obsolete=
_automake_macros.patch
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.=
patch
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez4-4.101/use-lega=
cy-pygobject-instead-ofgobject-introspection.patch
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez4.inc
>  delete mode 100644 meta/recipes-connectivity/bluez/bluez4_4.101.bb
>  delete mode 100644 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_=
4.101.bb
>=20
> diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_a=
utomake_macros.patch b/meta/recipes-connectivity/bluez/bluez-hcidump-2.5/ob=
solete_automake_macros.patch
> deleted file mode 100644
> index 0c77f1a..0000000
> --- a/meta/recipes-connectivity/bluez/bluez-hcidump-2.5/obsolete_automake=
_macros.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Upstream-Status: Pending [package obsolete/not maintained by upstream]
> -
> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd bluez-hcidump-2.5/configure.ac bluez-hcidump-2.5/configure.ac
> ---- bluez-hcidump-2.5/configure.ac	2012-11-30 10:29:41.000000000 +0200
> -+++ bluez-hcidump-2.5/configure.ac	2013-01-12 10:02:10.609511463 +0200
> -@@ -2,7 +2,7 @@
> - AC_INIT(bluez-hcidump, 2.5)
> -
> - AM_INIT_AUTOMAKE([foreign subdir-objects])
> --AM_CONFIG_HEADER(config.h)
> -+AC_CONFIG_HEADERS(config.h)
> -
> - m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/meta/=
recipes-connectivity/bluez/bluez-hcidump_2.5.bb
> deleted file mode 100644
> index 3950630..0000000
> --- a/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -SUMMARY =3D "Linux Bluetooth Stack HCI Debugger Tool"
> -DESCRIPTION =3D "The hcidump tool reads raw HCI data coming from and goi=
ng to a Bluetooth device \
> -and displays the commands, events and data in a human-readable form."
> -
> -SECTION =3D "console"
> -# hcidump was integrated into bluez5
> -DEPENDS =3D "bluez4"
> -RCONFLICTS_${PN} =3D "bluez5"
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
> -                    file://src/hcidump.c;beginline=3D1;endline=3D23;md5=
=3D3bee3a162dff43a5be7470710b99fbcf"
> -PR =3D "r1"
> -
> -SRC_URI =3D "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${P=
V}.tar.gz \
> -           file://obsolete_automake_macros.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "2eab54bbd2b59a2ed4274ebb9390cf18"
> -SRC_URI[sha256sum] =3D "9b7c52b375081883738cf049ecabc103b97d094b19c6544f=
b241267905d88881"
> -S =3D "${WORKDIR}/bluez-hcidump-${PV}"
> -
> -inherit autotools
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf =
b/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> deleted file mode 100644
> index ca5e9e4..0000000
> --- a/meta/recipes-connectivity/bluez/bluez4-4.101/bluetooth.conf
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -<!-- This configuration file specifies the required security policies
> -     for Bluetooth core daemon to work. -->
> -
> -<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration =
1.0//EN"
> - "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> -<busconfig>
> -
> -  <!-- ../system.conf have denied everything, so we just punch some hole=
s -->
> -
> -  <policy context=3D"default">
> -    <allow own=3D"org.bluez"/>
> -    <allow send_destination=3D"org.bluez"/>
> -    <allow send_interface=3D"org.bluez.Agent"/>
> -  </policy>
> -
> -</busconfig>
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.=
patch b/meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
> deleted file mode 100644
> index 8089914..0000000
> --- a/meta/recipes-connectivity/bluez/bluez4-4.101/fix-udev-paths.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Add udevdir/udevrulesdir options
> -
> -Upstream-Status: Inappropriate [configuration]
> -Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> -
> -Index: bluez-4.101/Makefile.am
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- bluez-4.101.orig/Makefile.am
> -+++ bluez-4.101/Makefile.am
> -@@ -395,7 +395,7 @@ EXTRA_DIST +=3D audio/bluetooth.conf
> - include Makefile.tools
> -=20
> - if DATAFILES
> --rulesdir =3D @UDEV_DIR@/rules.d
> -+rulesdir =3D @UDEV_RULES_DIR@
> -=20
> - udev_files =3D
> -=20
> -Index: bluez-4.101/configure.ac
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- bluez-4.101.orig/configure.ac
> -+++ bluez-4.101/configure.ac
> -@@ -61,4 +61,14 @@ if (test -n "${path_systemdunit}"); then
> - fi
> - AM_CONDITIONAL(SYSTEMD, test -n "${path_systemdunit}")
> -=20
> -+AC_ARG_WITH([udevdir],
> -+    AS_HELP_STRING([--with-udevdir=3DDIR], [udev directory]),
> -+    [], [with_udevdir=3D/lib/udev/])
> -+AC_SUBST([UDEV_DIR], [$with_udevdir])
> -+
> -+AC_ARG_WITH([udevrulesdir],
> -+    AS_HELP_STRING([--with-udevrulesdir=3DDIR], [udev rules directory]),
> -+    [], [with_udevrulesdir=3D/lib/udev/rules.d])
> -+AC_SUBST([UDEV_RULES_DIR], [$with_udevrulesdir])
> -+
> - AC_OUTPUT(Makefile doc/version.xml src/bluetoothd.8 src/bluetooth.servi=
ce bluez.pc)
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_col=
lision.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_col=
lision.patch
> deleted file mode 100644
> index 1bc390f..0000000
> --- a/meta/recipes-connectivity/bluez/bluez4-4.101/fix_encrypt_collision.=
patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -Avoid namepspace collision with encrypt function from libc
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Index: bluez-4.101/test/l2test.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- bluez-4.101.orig/test/l2test.c
> -+++ bluez-4.101/test/l2test.c
> -@@ -107,7 +107,7 @@ static char *filename =3D NULL;
> - static int rfcmode =3D 0;
> - static int master =3D 0;
> - static int auth =3D 0;
> --static int encrypt =3D 0;
> -+static int encryption_request =3D 0;
> - static int secure =3D 0;
> - static int socktype =3D SOCK_SEQPACKET;
> - static int linger =3D 0;
> -@@ -340,7 +340,7 @@ static int do_connect(char *svr)
> - 		opt |=3D L2CAP_LM_MASTER;
> - 	if (auth)
> - 		opt |=3D L2CAP_LM_AUTH;
> --	if (encrypt)
> -+	if (encryption_request)
> - 		opt |=3D L2CAP_LM_ENCRYPT;
> - 	if (secure)
> - 		opt |=3D L2CAP_LM_SECURE;
> -@@ -475,7 +475,7 @@ static void do_listen(void (*handler)(in
> - 		opt |=3D L2CAP_LM_MASTER;
> - 	if (auth)
> - 		opt |=3D L2CAP_LM_AUTH;
> --	if (encrypt)
> -+	if (encryption_request)
> - 		opt |=3D L2CAP_LM_ENCRYPT;
> - 	if (secure)
> - 		opt |=3D L2CAP_LM_SECURE;
> -@@ -1407,7 +1407,7 @@ int main(int argc, char *argv[])
> - 			break;
> -=20
> - 		case 'E':
> --			encrypt =3D 1;
> -+			encryption_request =3D 1;
> - 			break;
> -=20
> - 		case 'S':
> -Index: bluez-4.101/test/rctest.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- bluez-4.101.orig/test/rctest.c
> -+++ bluez-4.101/test/rctest.c
> -@@ -79,7 +79,7 @@ static char *filename =3D NULL;
> -=20
> - static int master =3D 0;
> - static int auth =3D 0;
> --static int encrypt =3D 0;
> -+static int encryption_request =3D 0;
> - static int secure =3D 0;
> - static int socktype =3D SOCK_STREAM;
> - static int linger =3D 0;
> -@@ -200,7 +200,7 @@ static int do_connect(const char *svr)
> - 		opt |=3D RFCOMM_LM_MASTER;
> - 	if (auth)
> - 		opt |=3D RFCOMM_LM_AUTH;
> --	if (encrypt)
> -+	if (encryption_request)
> - 		opt |=3D RFCOMM_LM_ENCRYPT;
> - 	if (secure)
> - 		opt |=3D RFCOMM_LM_SECURE;
> -@@ -291,7 +291,7 @@ static void do_listen(void (*handler)(in
> - 		opt |=3D RFCOMM_LM_MASTER;
> - 	if (auth)
> - 		opt |=3D RFCOMM_LM_AUTH;
> --	if (encrypt)
> -+	if (encryption_request)
> - 		opt |=3D RFCOMM_LM_ENCRYPT;
> - 	if (secure)
> - 		opt |=3D RFCOMM_LM_SECURE;
> -@@ -701,7 +701,7 @@ int main(int argc, char *argv[])
> - 			break;
> -=20
> - 		case 'E':
> --			encrypt =3D 1;
> -+			encryption_request =3D 1;
> - 			break;
> -=20
> - 		case 'S':
> -Index: bluez-4.101/src/textfile.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- bluez-4.101.orig/src/textfile.h
> -+++ bluez-4.101/src/textfile.h
> -@@ -24,6 +24,8 @@
> - #ifndef __TEXTFILE_H
> - #define __TEXTFILE_H
> -=20
> -+#include <sys/types.h>
> -+
> - int create_dirs(const char *filename, const mode_t mode);
> - int create_file(const char *filename, const mode_t mode);
> - int create_name(char *buf, size_t size, const char *path,
> -Index: bluez-4.101/test/attest.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- bluez-4.101.orig/test/attest.c
> -+++ bluez-4.101/test/attest.c
> -@@ -34,6 +34,7 @@
> - #include <termios.h>
> - #include <sys/ioctl.h>
> - #include <sys/socket.h>
> -+#include <sys/select.h>
> -=20
> - #include <bluetooth/bluetooth.h>
> - #include <bluetooth/rfcomm.h>
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-sc=
ript.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-scri=
pt.patch
> deleted file mode 100644
> index 23f7d99..0000000
> --- a/meta/recipes-connectivity/bluez/bluez4-4.101/install-test-script.pa=
tch
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -Upstream-Status: Inappropriate
> -
> -Install the bluez's test scripts
> -
> -Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> -diff -Nurd bluez-4.101.orig/Makefile.tools bluez-4.101/Makefile.tools
> ---- bluez-4.101.orig/Makefile.tools	2013-11-19 15:49:07.688838000 +0800
> -+++ bluez-4.101/Makefile.tools	2013-11-19 15:50:09.256837848 +0800
> -@@ -227,6 +227,17 @@
> - 		test/service-spp.xml test/service-opp.xml test/service-ftp.xml \
> - 		test/simple-player test/test-nap
> -=20
> -+bluez4_testdir =3D $(libdir)/bluez4/test/
> -+dist_bluez4_test_SCRIPTS =3D test/sap-client test/hsplay test/hsmicro \
> -+		test/monitor-bluetooth test/list-devices \
> -+		test/test-discovery test/test-manager test/test-adapter \
> -+		test/test-device test/test-service test/test-serial \
> -+		test/test-telephony test/test-network test/simple-agent \
> -+		test/simple-service test/simple-endpoint test/test-audio \
> -+		test/test-input test/test-sap-server test/test-oob \
> -+		test/test-attrib test/test-proximity test/test-thermometer \
> -+		test/test-serial-proxy test/test-health test/test-health-sink \
> -+		test/simple-player test/test-nap
> - if HIDD
> - bin_PROGRAMS +=3D compat/hidd
> -=20
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-net=
work-Connect-method-parameters.patch b/meta/recipes-connectivity/bluez/blue=
z4-4.101/network-fix-network-Connect-method-parameters.patch
> deleted file mode 100644
> index 37f9199..0000000
> --- a/meta/recipes-connectivity/bluez/bluez4-4.101/network-fix-network-Co=
nnect-method-parameters.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> -
> -From 57170b311f1468330f4a9961dc0b3ac45f97bc13 Mon Sep 17 00:00:00 2001
> -From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> -Date: Sat, 30 Jun 2012 00:39:05 -0300
> -Subject: [PATCH] network: fix network Connect() method parameters
> -
> ----
> - network/connection.c |    4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/network/connection.c b/network/connection.c
> -index 544ec3a..59423a9 100644
> ---- a/network/connection.c
> -+++ b/network/connection.c
> -@@ -554,7 +554,9 @@ static void path_unregister(void *data)
> -=20
> - static const GDBusMethodTable connection_methods[] =3D {
> - 	{ GDBUS_ASYNC_METHOD("Connect",
> --			NULL, NULL, connection_connect) },
> -+				GDBUS_ARGS({"uuid", "s"}),
> -+				GDBUS_ARGS({"interface", "s"}),
> -+				connection_connect) },
> - 	{ GDBUS_METHOD("Disconnect",
> - 			NULL, NULL, connection_disconnect) },
> - 	{ GDBUS_METHOD("GetProperties",
> ---=20
> -1.7.9.5
> -
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_automa=
ke_macros.patch b/meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_aut=
omake_macros.patch
> deleted file mode 100644
> index 1068f24..0000000
> --- a/meta/recipes-connectivity/bluez/bluez4-4.101/obsolete_automake_macr=
os.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Upstream-Status: Backport
> -
> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
> -diff -Nurd bluez-4.101/configure.ac bluez-4.101/configure.ac
> ---- bluez-4.101/configure.ac	2012-06-22 19:36:49.000000000 +0300
> -+++ bluez-4.101/configure.ac	2013-01-07 06:13:18.385888966 +0200
> -@@ -2,7 +2,7 @@
> - AC_INIT(bluez, 4.101)
> -
> - AM_INIT_AUTOMAKE([foreign subdir-objects color-tests])
> --AM_CONFIG_HEADER(config.h)
> -+AC_CONFIG_HEADERS(config.h)
> -
> - m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch b=
/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> deleted file mode 100644
> index 98fab45..0000000
> --- a/meta/recipes-connectivity/bluez/bluez4-4.101/sbc_mmx.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -on x86 and x86_64 gcc 4.7 complains
> -
> -sbc/sbc_primitives_mmx.c: In function 'sbc_calc_scalefactors_mmx':
> -sbc/sbc_primitives_mmx.c:294:4: warning: asm operand 2 probably doesn't =
match constraints [enabled by default]
> -sbc/sbc_primitives_mmx.c:294:4: error: impossible constraint in 'asm'
> -
> -This patch is taken from https://bugs.launchpad.net/ubuntu/+source/bluez=
/+bug/911871
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -Index: bluez-4.98/sbc/sbc_primitives_mmx.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- bluez-4.98.orig/sbc/sbc_primitives_mmx.c	2011-12-21 14:53:54.0000000=
00 -0800
> -+++ bluez-4.98/sbc/sbc_primitives_mmx.c	2012-02-24 10:07:03.422073800 -0=
800
> -@@ -318,7 +318,7 @@
> - 				"movl          %k0, 4(%3)\n"
> - 			: "+r" (blk)
> - 			: "r" (&sb_sample_f[0][ch][sb]),
> --				"i" ((char *) &sb_sample_f[1][0][0] -
> -+				"r" ((char *) &sb_sample_f[1][0][0] -
> - 					(char *) &sb_sample_f[0][0][0]),
> - 				"r" (&scale_factor[ch][sb]),
> - 				"r" (&consts),
> diff --git a/meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygo=
bject-instead-ofgobject-introspection.patch b/meta/recipes-connectivity/blu=
ez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
> deleted file mode 100644
> index 37037f5..0000000
> --- a/meta/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-i=
nstead-ofgobject-introspection.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Upstream-Status: Inappropriate
> -
> -use legacy pygobject instead of gobject-introspection
> -
> -Signed-off-by: Zhong Hongbo <hongbo.zhong@windriver.com>
> ----
> -diff -Nurd bluez-4.101.orig/test/simple-agent bluez-4.101/test/simple-ag=
ent
> ---- bluez-4.101.orig/test/simple-agent	2013-11-13 17:14:08.138118159 +08=
00
> -+++ bluez-4.101/test/simple-agent	2013-11-13 17:14:29.034118107 +0800
> -@@ -2,7 +2,7 @@
> -=20
> - from __future__ import absolute_import, print_function, unicode_literals
> -=20
> --from gi.repository import GObject
> -+import gobject
> -=20
> - import sys
> - import dbus
> -@@ -122,7 +122,7 @@
> - 	path =3D "/test/agent"
> - 	agent =3D Agent(bus, path)
> -=20
> --	mainloop =3D GObject.MainLoop()
> -+	mainloop =3D gobject.MainLoop()
> -=20
> - 	if len(args) > 1:
> - 		if len(args) > 2:
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-co=
nnectivity/bluez/bluez4.inc
> deleted file mode 100644
> index 11c9616..0000000
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -SUMMARY =3D "Linux Bluetooth Stack Userland V4"
> -DESCRIPTION =3D "Linux Bluetooth stack V4 userland components.  These in=
clude a system configurations, daemons, tools and system libraries."
> -HOMEPAGE =3D "http://www.bluez.org"
> -SECTION =3D "libs"
> -LICENSE =3D "GPLv2+ & LGPLv2.1+"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e \
> -                    file://COPYING.LIB;md5=3Dfb504b67c50331fc78734fed90f=
b0e09 \
> -                    file://src/main.c;beginline=3D1;endline=3D24;md5=3D9=
bc54b93cd7e17bf03f52513f39f926e \
> -                    file://sbc/sbc.c;beginline=3D1;endline=3D25;md5=3D1a=
40781ed30d50d8639323a184aeb191"
> -DEPENDS =3D "udev libusb dbus-glib glib-2.0 libcheck readline libsndfile=
1"
> -RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> -
> -PACKAGECONFIG ??=3D "\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
> -"
> -PACKAGECONFIG[alsa] =3D "--enable-alsa,--disable-alsa,alsa-lib"
> -PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,"
> -
> -ASNEEDED =3D ""
> -
> -SRC_URI =3D "\
> -  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
> -"
> -S =3D "${WORKDIR}/bluez-${PV}"
> -
> -inherit autotools-brokensep pkgconfig
> -
> -EXTRA_OECONF =3D "\
> -  --disable-gstreamer \
> -  --enable-usb \
> -  --enable-tools \
> -  --enable-bccmd \
> -  --enable-hid2hci \
> -  --enable-dfutool \
> -  --disable-hidd \
> -  --disable-pand \
> -  --disable-dund \
> -  --disable-cups \
> -  --enable-test \
> -  --enable-datafiles \
> -  --with-udevdir=3D`pkg-config --variable=3Dudevdir udev` \
> -  --with-udevrulesdir=3D`pkg-config --variable=3Dudevdir udev`/rules.d \
> -"
> -
> -EXCLUDE_FROM_WORLD =3D "1"
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.101.bb b/meta/recip=
es-connectivity/bluez/bluez4_4.101.bb
> deleted file mode 100644
> index f900c7c..0000000
> --- a/meta/recipes-connectivity/bluez/bluez4_4.101.bb
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -require bluez4.inc
> -
> -PR =3D "r11"
> -
> -SRC_URI +=3D "file://bluetooth.conf \
> -            file://sbc_mmx.patch \
> -            file://fix-udev-paths.patch \
> -            file://obsolete_automake_macros.patch \
> -            file://network-fix-network-Connect-method-parameters.patch \
> -            file://install-test-script.patch \
> -            file://use-legacy-pygobject-instead-ofgobject-introspection.=
patch \
> -            file://fix_encrypt_collision.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "fb42cb7038c380eb0e2fa208987c96ad"
> -SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4=
ad75fe52846f7487"
> -
> -RCONFLICTS_${PN} =3D "bluez5"
> -
> -do_install_append() {
> -	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
> -	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
> -	install -m 0644 ${S}/input/input.conf ${D}/${sysconfdir}/bluetooth/
> -	# at_console doesn't really work with the current state of OE, so punch=
 some more holes so people can actually use BT
> -	install -m 0644 ${WORKDIR}/bluetooth.conf ${D}/${sysconfdir}/dbus-1/sys=
tem.d/
> -}
> -
> -RDEPENDS_${PN}-dev =3D "bluez-hcidump"
> -RDEPENDS_${PN}-testtools +=3D "python python-dbus python-pygobject"
> -
> -ALLOW_EMPTY_libasound-module-bluez =3D "1"
> -PACKAGES =3D+ "libasound-module-bluez ${PN}-testtools"
> -
> -FILES_libasound-module-bluez =3D "${libdir}/alsa-lib/lib*.so ${datadir}/=
alsa"
> -FILES_${PN} +=3D "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugin=
s/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}=
/ ${datadir}/dbus-1"
> -FILES_${PN}-dev +=3D "\
> -  ${libdir}/bluetooth/plugins/*.la \
> -  ${libdir}/alsa-lib/*.la \
> -"
> -
> -FILES_${PN}-testtools =3D "${libdir}/bluez4/test/*"
> -
> -FILES_${PN}-dbg +=3D "\
> -  ${libdir}/bluetooth/plugins/.debug \
> -  ${libdir}/*/.debug \
> -  */udev/.debug \
> -  "
> diff --git a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.b=
b b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
> deleted file mode 100644
> index c71d612..0000000
> --- a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -require bluez4.inc
> -require recipes-multimedia/gstreamer/gst-plugins-package.inc
> -
> -PR =3D "r1"
> -
> -SRC_URI[md5sum] =3D "fb42cb7038c380eb0e2fa208987c96ad"
> -SRC_URI[sha256sum] =3D "59738410ade9f0e61a13c0f77d9aaffaafe49ba9418107e4=
ad75fe52846f7487"
> -
> -DEPENDS =3D "bluez4 gst-plugins-base"
> -
> -EXTRA_OECONF =3D "\
> -  --enable-gstreamer \
> -"
> -
> -# clean unwanted files
> -do_install_append() {
> -	rm -rf ${D}${bindir}
> -	rm -rf ${D}${sbindir}
> -	rm -f  ${D}${libdir}/lib*
> -	rm -rf ${D}${libdir}/pkgconfig
> -	rm -rf ${D}${sysconfdir}
> -	rm -rf ${D}${base_libdir}
> -	rm -rf ${D}${libdir}/bluetooth
> -	rm -rf ${D}${localstatedir}
> -  	rm -rf ${D}${libdir}/alsa-lib
> -  	rm -rf ${D}${datadir}
> -	rm -rf ${D}${includedir}
> -	rm -rf ${D}${nonarch_base_libdir}
> -}
> -
> -FILES_${PN} =3D "${libdir}/gstreamer-0.10/lib*.so"
> -FILES_${PN}-dev +=3D "\
> -  ${libdir}/gstreamer-0.10/*.la \
> -"
> -
> -FILES_${PN}-dbg +=3D "\
> -  ${libdir}/*/.debug \
> -"
> -
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

