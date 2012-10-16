Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOFyU-0002Km-Nk
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 00:50:58 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so4131780wey.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2012 15:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MD5pDdNQrRwhJG//jovCSUtxKfKkMCOq/kqv+paQYNc=;
	b=sL4Nkl3Z6ZVDdNL7TmCHZt+7ZBPybCiUmy4wJcoeVqWvJFjhEu2ez6lcvJ/ERnnFvE
	xDXQCUEmcMglJUvF43985WVg4KUt/TZK6sbmpE5Fw/0j1hLQ6KsUC8JivyFNqYwPdTfC
	jffUqVxWLrCySnRnEUiXcswrlafvR0t81tpprS9gVwniMMmzaMNP+HHudcaH7jbsu26f
	jCy3liHq4xluuZ+rwEyBhbUBr429TkLGp6cXh+Bgb1rpP8DZbVn07rReWePsqSg8Xktl
	qGHurSm2UUdIPOZzdkdEr0rITFS0YcWiP1l2szeciBTc39cNJPbQJ1uB/tqPDc67fbf5
	Cr0A==
Received: by 10.180.93.106 with SMTP id ct10mr34740846wib.8.1350427061476;
	Tue, 16 Oct 2012 15:37:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv8sm21682882wib.0.2012.10.16.15.37.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Oct 2012 15:37:32 -0700 (PDT)
Date: Wed, 17 Oct 2012 00:37:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Marc Ferland <ferlandm@sonatest.com>
Message-ID: <20121016223739.GB3405@jama.jama.net>
References: <1350424046-18863-1-git-send-email-ferlandm@sonatest.com>
	<1350424046-18863-2-git-send-email-ferlandm@sonatest.com>
MIME-Version: 1.0
In-Reply-To: <1350424046-18863-2-git-send-email-ferlandm@sonatest.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lmsensors: Initial commit.
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
X-List-Received-Date: Tue, 16 Oct 2012 22:50:58 -0000
X-Groupsio-MsgNum: 30613
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2012 at 05:47:26PM -0400, Marc Ferland wrote:
> Adds the lm_sensors applications. These consists of:

Is it really needed in oe-core? why not meta-oe?

> *libsensors: the main application library
> *sensors: cmd line tool to list current sensors values
> *sensord: sensors logging daemon
> *fancontrol: fan speed regulation daemon
> *sensorsdetect: script to autodetect sensors
> *sensorsconfconvert: converts lm_sensorsv2 to lm_sensorsv3 config files
> *pwmconfig: script to configure fancontrol
> *isatools: get/set isa registers
>=20
> This patch also adds the rrdtool program which is needed by sensord.
> ---
>  meta/recipes-bsp/lm_sensors/files/fancontrol       |    2 +
>  meta/recipes-bsp/lm_sensors/files/fancontrol.sh    |   48 ++++++
>  meta/recipes-bsp/lm_sensors/files/sensord.cgi      |   10 ++
>  meta/recipes-bsp/lm_sensors/files/sensord.conf     |   16 ++
>  meta/recipes-bsp/lm_sensors/files/sensord.sh       |   49 +++++++
>  meta/recipes-bsp/lm_sensors/files/sensors.conf     |    2 +
>  meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb     |  150 ++++++++++++++=
++++++
>  meta/recipes-support/rrdtool/files/automake.patch  |   15 ++
>  meta/recipes-support/rrdtool/files/configure.patch |   19 +++
>  meta/recipes-support/rrdtool/rrdtool_1.4.7.bb      |   31 ++++
>  10 files changed, 342 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-bsp/lm_sensors/files/fancontrol
>  create mode 100644 meta/recipes-bsp/lm_sensors/files/fancontrol.sh
>  create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.cgi
>  create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.conf
>  create mode 100644 meta/recipes-bsp/lm_sensors/files/sensord.sh
>  create mode 100644 meta/recipes-bsp/lm_sensors/files/sensors.conf
>  create mode 100644 meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb
>  create mode 100644 meta/recipes-support/rrdtool/files/automake.patch
>  create mode 100644 meta/recipes-support/rrdtool/files/configure.patch
>  create mode 100644 meta/recipes-support/rrdtool/rrdtool_1.4.7.bb
>=20
> diff --git a/meta/recipes-bsp/lm_sensors/files/fancontrol b/meta/recipes-=
bsp/lm_sensors/files/fancontrol
> new file mode 100644
> index 0000000..1f03a2b
> --- /dev/null
> +++ b/meta/recipes-bsp/lm_sensors/files/fancontrol
> @@ -0,0 +1,2 @@
> +# fancontrol configuration file.
> +# Place your device specific configuration in this file.
> diff --git a/meta/recipes-bsp/lm_sensors/files/fancontrol.sh b/meta/recip=
es-bsp/lm_sensors/files/fancontrol.sh
> new file mode 100644
> index 0000000..f179310
> --- /dev/null
> +++ b/meta/recipes-bsp/lm_sensors/files/fancontrol.sh
> @@ -0,0 +1,48 @@
> +#! /bin/sh
> +### BEGIN INIT INFO
> +# Provides:          fancontrol
> +# Required-Start:    $local_fs
> +# Should-Start:
> +# Required-Stop:     $local_fs
> +# Should-Stop:
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: fancontrol initscript
> +# Description:       Starts and controls the fancontrol daemon
> +### END INIT INFO
> +
> +PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
> +
> +DESC=3D"fan control daemon"
> +NAME=3D"fancontrol"
> +FANCONTROL=3D`which $NAME`
> +
> +. /etc/init.d/functions || exit 1
> +
> +# Exit if the package is not installed
> +[ -x "$FANCONTROL" ] || exit 0
> +
> +case "$1" in
> +    start)
> +        echo -n "Starting $DESC: $NAME... "
> +        /sbin/start-stop-daemon -S -x $FANCONTROL -b -- $FANCONTROL_ARGS
> +        echo "done."
> +        ;;
> +    stop)
> +        echo -n "Stopping $DESC: $NAME... "
> +        /sbin/start-stop-daemon -K -x $FANCONTROL
> +        echo "done."
> +        ;;
> +    restart)
> +        echo "Restarting $DESC: $NAME... "
> +        $0 stop
> +        $0 start
> +        echo "done."
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|restart}"
> +        exit 1
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-bsp/lm_sensors/files/sensord.cgi b/meta/recipes=
-bsp/lm_sensors/files/sensord.cgi
> new file mode 100644
> index 0000000..b1aad05
> --- /dev/null
> +++ b/meta/recipes-bsp/lm_sensors/files/sensord.cgi
> @@ -0,0 +1,10 @@
> +#!/usr/bin/rrdcgi
> +
> +<html>
> +<head>
> +<title>sensord</title>
> +</head>
> +<body>
> +Generate a valid sensord.cgi script and install it in your BSP.
> +</body>
> +</html>
> diff --git a/meta/recipes-bsp/lm_sensors/files/sensord.conf b/meta/recipe=
s-bsp/lm_sensors/files/sensord.conf
> new file mode 100644
> index 0000000..6b48cf6
> --- /dev/null
> +++ b/meta/recipes-bsp/lm_sensors/files/sensord.conf
> @@ -0,0 +1,16 @@
> +# Default sensord configuration file
> +# Syntax: sensord {options} {chips}
> +# -i, --interval <time>     -- interval between scanning alarms (default=
 60s)
> +# -l, --log-interval <time> -- interval between logging sensors (default=
 30m)
> +# -t, --rrd-interval <time> -- interval between updating RRD file (defau=
lt 5m)
> +# -T, --rrd-no-average      -- switch RRD in non-average mode
> +# -r, --rrd-file <file>     -- RRD file (default <none>)
> +# -c, --config-file <file>  -- configuration file
> +# -p, --pid-file <file>     -- PID file (default /var/run/sensord.pid)
> +# -f, --syslog-facility <f> -- syslog facility to use (default local4)
> +# -g, --rrd-cgi <img-dir>   -- output an RRD CGI script and exit
> +# -a, --load-average        -- include load average in RRD file
> +# -d, --debug               -- display some debug information
> +# -v, --version             -- display version and exit
> +# -h, --help                -- display help and exit
> +SENSORD_ARGS=3D"-i60s -l30m -t1m -r/var/lib/sensord.rrd -a"
> diff --git a/meta/recipes-bsp/lm_sensors/files/sensord.sh b/meta/recipes-=
bsp/lm_sensors/files/sensord.sh
> new file mode 100644
> index 0000000..5a09cd3
> --- /dev/null
> +++ b/meta/recipes-bsp/lm_sensors/files/sensord.sh
> @@ -0,0 +1,49 @@
> +#! /bin/sh
> +### BEGIN INIT INFO
> +# Provides:          sensord
> +# Required-Start:    $local_fs
> +# Should-Start:
> +# Required-Stop:     $local_fs
> +# Should-Stop:
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      0 1 6
> +# Short-Description: sensord initscript
> +# Description:       Starts the sensord logging daemon
> +### END INIT INFO
> +
> +PATH=3D/sbin:/usr/sbin:/bin:/usr/bin
> +
> +DESC=3D"sensors logging daemon"
> +NAME=3D"sensord"
> +SENSORD=3D`which $NAME`
> +
> +. /etc/init.d/functions || exit 1
> +. /etc/sensord.conf || exit 1
> +
> +# Exit if the package is not installed
> +[ -x "$SENSORD" ] || exit 0
> +
> +case "$1" in
> +    start)
> +        echo -n "Starting $DESC: $NAME... "
> +        start-stop-daemon -S -x $SENSORD -- $SENSORD_ARGS
> +        echo "done."
> +        ;;
> +    stop)
> +        echo -n "Stopping $DESC: $NAME... "
> +        start-stop-daemon -K -x $SENSORD
> +        echo "done."
> +        ;;
> +    restart)
> +        echo "Restarting $DESC: $NAME... "
> +        $0 stop
> +        $0 start
> +        echo "done."
> +        ;;
> +    *)
> +        echo "Usage: $0 {start|stop|restart}"
> +        exit 1
> +        ;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-bsp/lm_sensors/files/sensors.conf b/meta/recipe=
s-bsp/lm_sensors/files/sensors.conf
> new file mode 100644
> index 0000000..bb8c93d
> --- /dev/null
> +++ b/meta/recipes-bsp/lm_sensors/files/sensors.conf
> @@ -0,0 +1,2 @@
> +# sensors configuration file.
> +# Place your device specific configuration in this file.
> diff --git a/meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb b/meta/recipe=
s-bsp/lm_sensors/lmsensors_3.3.2.bb
> new file mode 100644
> index 0000000..009628e
> --- /dev/null
> +++ b/meta/recipes-bsp/lm_sensors/lmsensors_3.3.2.bb
> @@ -0,0 +1,150 @@
> +SUMMARY =3D "lm_sensors"
> +DESCRIPTION =3D "Hardware health monitoring applications"
> +HOMEPAGE =3D "http://www.lm-sensors.org/"
> +LICENSE =3D "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
> +                    file://COPYING.LGPL;md5=3D4fbd65380cdd255951079008b3=
64516c"
> +PR =3D "r0"
> +DEPENDS =3D "sysfsutils virtual/libiconv bison-native flex-native rrdtoo=
l"
> +PROVIDES =3D "\
> +${PN}-libsensors \
> +${PN}-sensors \
> +${PN}-sensord \
> +${PN}-fancontrol \
> +${PN}-sensorsdetect \
> +${PN}-sensorsconfconvert \
> +${PN}-pwmconfig \
> +${PN}-isatools \
> +"
> +
> +SRC_URI =3D "http://dl.lm-sensors.org/lm-sensors/releases/lm_sensors-${P=
V}.tar.bz2 \
> +           file://fancontrol \
> +           file://fancontrol.sh \
> +           file://sensors.conf \
> +           file://sensord.conf \
> +           file://sensord.sh \
> +           file://sensord.cgi \
> +"
> +
> +SRC_URI[md5sum] =3D "f357ba00b080ab102a170f7bf8bb2578"
> +SRC_URI[sha256sum] =3D "f13dd885406841a7352ccfb8b9ccb23c4c057abe3de4258d=
a5444c149a9e3ae1"
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_PACKAGES =3D "${PN}-fancontrol ${PN}-sensord"
> +INITSCRIPT_NAME_${PN}-fancontrol =3D "fancontrol.sh"
> +INITSCRIPT_NAME_${PN}-sensord =3D "sensord.sh"
> +INITSCRIPT_PARAMS_${PN}-fancontrol =3D "defaults 66"
> +INITSCRIPT_PARAMS_${PN}-sensord =3D "defaults 67"
> +
> +S =3D "${WORKDIR}/lm_sensors-${PV}"
> +
> +EXTRA_OEMAKE =3D 'LINUX=3D${STAGING_KERNEL_DIR} EXLDFLAGS=3D"${LDFLAGS}"=
 \
> +		MACHINE=3D${TARGET_ARCH} PREFIX=3D${prefix} CC=3D"${CC}" AR=3D"${AR}"'
> +
> +do_compile() {
> +    oe_runmake user PROG_EXTRA=3D"sensors sensord"
> +}
> +
> +do_install() {
> +    oe_runmake user_install DESTDIR=3D${D}
> +    install -m 0755 ${S}/prog/sensord/sensord ${D}${bindir}
> +    install -m 0644 ${S}/prog/sensord/sensord.8 ${D}/usr/man/man8
> +   =20
> +    # move manuals into proper place
> +    install -d ${D}${mandir}
> +    rm -rf ${D}${mandir}/*
> +    mv ${D}/usr/man/* ${D}${mandir}
> +    rmdir ${D}/usr/man
> +
> +    # Install directories
> +    install -d ${D}${sysconfdir}
> +    install -d ${D}${sysconfdir}/init.d
> +    install -d ${D}${sysconfdir}/sensors.d
> +
> +    # Install sensors.conf
> +    install -m 0644 ${WORKDIR}/sensors.conf ${D}${sysconfdir}/sensors.d
> +
> +    # Install fancontrol config file
> +    install -m 0644 ${WORKDIR}/fancontrol ${D}${sysconfdir}
> +
> +    # Install fancontrol init script
> +    install -m 0755 ${WORKDIR}/fancontrol.sh ${D}${sysconfdir}/init.d
> +
> +    # Install sensord init script
> +    install -m 0755 ${WORKDIR}/sensord.sh ${D}${sysconfdir}/init.d
> +    install -m 0644 ${WORKDIR}/sensord.conf ${D}${sysconfdir}
> +
> +    # Install sensord.cgi script and create world-writable
> +    # web-accessible sensord directory.
> +    install -d ${D}/www/pages/cgi-bin
> +    install -m 0755 ${WORKDIR}/sensord.cgi ${D}/www/pages/cgi-bin
> +    install -d -m a=3Drwxs ${D}/www/pages/sensord
> +}
> +
> +# libsensors packages
> +PACKAGES =3D+ "${PN}-libsensors ${PN}-libsensors-dbg ${PN}-libsensors-de=
v ${PN}-libsensors-staticdev ${PN}-libsensors-doc"
> +
> +# sensors command packages
> +PACKAGES =3D+ "${PN}-sensors ${PN}-sensors-dbg ${PN}-sensors-doc"
> +
> +# sensord logging daemon
> +PACKAGES =3D+ "${PN}-sensord ${PN}-sensord-dbg ${PN}-sensord-doc"
> +
> +# fancontrol script
> +PACKAGES =3D+ "${PN}-fancontrol ${PN}-fancontrol-doc"
> +
> +# sensors-detect script
> +PACKAGES =3D+ "${PN}-sensorsdetect ${PN}-sensorsdetect-doc"
> +
> +# sensors-conf-convert script
> +PACKAGES =3D+ "${PN}-sensorsconfconvert"
> +
> +# pwmconfig script
> +PACKAGES =3D+ "${PN}-pwmconfig ${PN}-pwmconfig-doc"
> +
> +# isadump and isaset helper program
> +PACKAGES =3D+ "${PN}-isatools ${PN}-isatools-dbg ${PN}-isatools-doc"
> +
> +# libsensors files
> +FILES_${PN}-libsensors =3D "${libdir}/libsensors.so.* ${sysconfdir}/sens=
ors3.conf ${sysconfdir}/sensors.d/sensors.conf"
> +FILES_${PN}-libsensors-dbg =3D "${libdir}/.debug ${prefix}/src/debug"
> +FILES_${PN}-libsensors-dev =3D "${libdir}/libsensors.so ${includedir}"
> +FILES_${PN}-libsensors-staticdev =3D "${libdir}/libsensors.a"
> +FILES_${PN}-libsensors-doc =3D "${mandir}/man3"
> +
> +# sensors command files
> +FILES_${PN}-sensors =3D "${bindir}/sensors"
> +FILES_${PN}-sensors-dbg =3D "${bindir}/.debug/sensors"
> +FILES_${PN}-sensors-doc =3D "${mandir}/man1 ${mandir}/man5"
> +RDEPENDS_${PN}-sensors =3D "${PN}-libsensors"
> +
> +# sensord logging daemon
> +FILES_${PN}-sensord =3D "${bindir}/sensord ${sysconfdir}/sensord.conf ${=
sysconfdir}/init.d/sensord.sh /www/*"
> +FILES_${PN}-sensord-dbg =3D "${bindir}/.debug/sensord"
> +FILES_${PN}-sensord-doc =3D "${mandir}/man8/sensord.8"
> +RDEPENDS_${PN}-sensord =3D "${PN}-sensors rrdtool lighttpd lighttpd-modu=
le-cgi"
> +
> +# fancontrol script files
> +FILES_${PN}-fancontrol =3D "${sbindir}/fancontrol ${sysconfdir}/fancontr=
ol ${sysconfdir}/init.d/fancontrol.sh"
> +FILES_${PN}-fancontrol-doc =3D "${mandir}/man8/fancontrol.8"
> +RDEPENDS_${PN}-fancontrol =3D "bash"
> +
> +# sensors-detect script files
> +FILES_${PN}-sensorsdetect =3D "${sbindir}/sensors-detect"
> +FILES_${PN}-sensorsdetect-doc =3D "${mandir}/man8/sensors-detect.8"
> +RDEPENDS_${PN}-sensorsdetect =3D "${PN}-sensors perl perl-modules"
> +
> +# sensors-conf-convert script files
> +FILES_${PN}-sensorsconfconvert =3D "${bindir}/sensors-conf-convert"
> +RDEPENDS_${PN}-sensorsconfconvert =3D "${PN}-sensors perl perl-modules"
> +
> +# pwmconfig script files
> +FILES_${PN}-pwmconfig =3D "${sbindir}/pwmconfig"
> +FILES_${PN}-pwmconfig-doc =3D "${mandir}/man8/pwmconfig.8"
> +RDEPENDS_${PN}-pwmconfig =3D "${PN}-fancontrol"
> +
> +# isadump and isaset helper program files
> +FILES_${PN}-isatools =3D "${sbindir}/isa*"
> +FILES_${PN}-isatools-dbg =3D "${sbindir}/.debug/isa*"
> +FILES_${PN}-isatools-doc =3D "${mandir}/man8/isa*"
> diff --git a/meta/recipes-support/rrdtool/files/automake.patch b/meta/rec=
ipes-support/rrdtool/files/automake.patch
> new file mode 100644
> index 0000000..891c5c8
> --- /dev/null
> +++ b/meta/recipes-support/rrdtool/files/automake.patch
> @@ -0,0 +1,15 @@
> +Index: bindings/tcl/Makefile.am
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rrdtool-1.4.7/bindings/tcl/Makefile.am	(r=E9vision 2287)
> ++++ rrdtool-1.4.7/bindings/tcl/Makefile.am	(copie de travail)
> +@@ -27,8 +27,8 @@
> + tclpkg_DATA =3D pkgIndex.tcl
> + tclpkg_SCRIPTS =3D ifOctets.tcl
> + else
> +-pkglib_DATA =3D pkgIndex.tcl
> +-pkglib_SCRIPTS =3D ifOctets.tcl
> ++pkgdata_DATA =3D pkgIndex.tcl
> ++pkgdata_SCRIPTS =3D ifOctets.tcl
> + endif
> +=20
> + # Automake doen't like `tclrrd$(VERSION)$(TCL_SHLIB_SUFFIX)' as
> diff --git a/meta/recipes-support/rrdtool/files/configure.patch b/meta/re=
cipes-support/rrdtool/files/configure.patch
> new file mode 100644
> index 0000000..f413bd2
> --- /dev/null
> +++ b/meta/recipes-support/rrdtool/files/configure.patch
> @@ -0,0 +1,19 @@
> +--- rrdtool-1.4.7/configure.ac	2012-01-24 05:08:48.000000000 -0500
> ++++ rrdtool-1.4.7.mine/configure.ac	2012-01-27 13:50:42.717578624 -0500
> +@@ -348,7 +348,6 @@
> + 	        AC_DEFINE(HAVE_ISFINITE)],[AC_MSG_RESULT(no)])])])
> + fi =20
> +=20
> +-AC_FULL_IEEE
> +=20
> + CONFIGURE_PART(Resolve Portability Issues)
> +=20
> +@@ -548,7 +547,7 @@
> +=20
> + fi
> + EX_CHECK_ALL(glib-2.0,   glib_check_version,            glib.h,        =
         glib-2.0,    2.28.7, ftp://ftp.gtk.org/pub/glib/2.28/, "")
> +-EX_CHECK_ALL(xml2,       xmlParseFile,                  libxml/parser.h=
,        libxml-2.0,        2.7.8,  http://xmlsoft.org/downloads.html, /usr=
/include/libxml2)
> ++EX_CHECK_ALL(xml2,       xmlParseFile,                  libxml/parser.h=
,        libxml-2.0,        2.7.8,  http://xmlsoft.org/downloads.html, "")
> +=20
> + if test "$EX_CHECK_ALL_ERR" =3D "YES"; then
> +   AC_MSG_ERROR([Please fix the library issues listed above and try agai=
n.])
> diff --git a/meta/recipes-support/rrdtool/rrdtool_1.4.7.bb b/meta/recipes=
-support/rrdtool/rrdtool_1.4.7.bb
> new file mode 100644
> index 0000000..4b60622
> --- /dev/null
> +++ b/meta/recipes-support/rrdtool/rrdtool_1.4.7.bb
> @@ -0,0 +1,31 @@
> +DESCRIPTION =3D "High performance data logging and graphing system for t=
ime series data."
> +HOMEPAGE =3D "http://oss.oetiker.ch/rrdtool/"
> +SECTION =3D "utils"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D44fee82a1d2ed0676cf35478283e0=
aa0"
> +
> +DEPENDS =3D "libpng zlib cairo glib-2.0 pango libxml2 virtual/gettext"
> +RDEPENDS =3D "liberation-fonts"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \
> +           file://configure.patch \
> +           file://automake.patch \
> +           "
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--enable-shared \
> +                --program-prefix=3D'' \
> +                --disable-libdbi \
> +                --disable-libwrap \
> +                --disable-perl \
> +                --disable-ruby \
> +                --disable-lua \
> +                --disable-tcl \
> +                --disable-python \
> +                "
> +
> +SRC_URI[md5sum] =3D "ffe369d8921b4dfdeaaf43812100c38f"
> +SRC_URI[sha256sum] =3D "956aaf431c955ba88dd7d98920ade3a8c4bad04adb1f9431=
377950a813a7af11"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB94bMACgkQN1Ujt2V2gBzc6gCfXkBLmb6jMXqfIAGQ2eCESm1v
AZYAoKN00QrWwroulDqSJ+wIgXUQZEc2
=MsV3
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
