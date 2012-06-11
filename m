Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8uQ-0000zZ-Fb
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 20:00:11 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:48:31 -0700
Received: by lahj13 with SMTP id j13so2486967lah.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=UVYtfDgpqB4E0t9R1ZpvxJT7/q2AHLNCF2uAQtE51js=;
	b=KGybVuzXpdnDQybwHGknSCzfXBDksTw7yiPPRZeGVigntUupTS5CRlfrF4pgeCbWeH
	Bxh59nnevzdqO7QniYeP5LQqUMuJAuGzpLIj5Q7mKxA5Ypn0wKLfQOk99fDpGDLBg4be
	E//bp6Gv0s2BWt7bf3TixZlbi/o9Rnd+/9YGD71Kb70XYXZnCDgtoDRsCwnCKS3+Y8LK
	s3S9ZqIfqrUFJxAnMvPR1HEYm3xt2UFZgvdUz0sIMDXtUsdpBwEuXDdnj1e9mrcp8AVp
	0npT6TpKaOOCg7nU7xn9WCzDq+MWhbnZxxOSIhLHVZC2wyMXnBVXolAjcH7UfHTHaZnA
	ZHoQ==
MIME-Version: 1.0
Received: by 10.112.100.234 with SMTP id fb10mr3605850lbb.12.1339436909759;
	Mon, 11 Jun 2012 10:48:29 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:48:29 -0700 (PDT)
In-Reply-To: <1338455868-31804-1-git-send-email-radu.moisan@intel.com>
References: <1338455868-31804-1-git-send-email-radu.moisan@intel.com>
Date: Mon, 11 Jun 2012 10:48:29 -0700
Message-ID: <CAPhnLPAafMU=+4BX2iCp3O8ZoDr+r4vDrRuKOQpUS6CqSnhLKA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmTN8ha2g3xhVlhTg1AarfEzizvlDfu6uO+FBNaRXMCbBMnVdyqM8dQ++w7awlTVhMhEPpL
Subject: Re: [PATCH v3] dbus: update to version 1.4.20
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
X-List-Received-Date: Mon, 11 Jun 2012 18:00:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2012 at 2:17 AM, Radu Moisan <radu.moisan@intel.com> wrote:
> Unstable version 1.5.12 also supported
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
> =A0.../dbus/{dbus-1.4.16 =3D> dbus-1.4.20}/dbus-1.init =A0| =A0 =A00
> =A0.../dbus/{dbus-1.4.16 =3D> dbus-1.4.20}/tmpdir.patch | =A0 =A00
> =A0meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init =A0 =A0 | =A0121 ++++++=
++++++++++++++
> =A0meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch =A0 =A0| =A0 44 ++++++=
+
> =A0meta/recipes-core/dbus/dbus_1.4.16.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A07 --
> =A0meta/recipes-core/dbus/dbus_1.4.20.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A06 +
> =A0meta/recipes-core/dbus/dbus_1.5.12.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A09 ++
> =A07 files changed, 180 insertions(+), 7 deletions(-)
> =A0rename meta/recipes-core/dbus/{dbus-1.4.16 =3D> dbus-1.4.20}/dbus-1.in=
it (100%)
> =A0rename meta/recipes-core/dbus/{dbus-1.4.16 =3D> dbus-1.4.20}/tmpdir.pa=
tch (100%)
> =A0create mode 100644 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
> =A0create mode 100644 meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
> =A0delete mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb
> =A0create mode 100644 meta/recipes-core/dbus/dbus_1.4.20.bb
> =A0create mode 100644 meta/recipes-core/dbus/dbus_1.5.12.bb
>
> diff --git a/meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init b/meta/recipe=
s-core/dbus/dbus-1.4.20/dbus-1.init
> similarity index 100%
> rename from meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init
> rename to meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
> diff --git a/meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch b/meta/recip=
es-core/dbus/dbus-1.4.20/tmpdir.patch
> similarity index 100%
> rename from meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch
> rename to meta/recipes-core/dbus/dbus-1.4.20/tmpdir.patch
> diff --git a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init b/meta/recipe=
s-core/dbus/dbus-1.5.12/dbus-1.init
> new file mode 100644
> index 0000000..4abc4cb
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
> @@ -0,0 +1,121 @@
> +#! /bin/sh
> +### BEGIN INIT INFO
> +# Provides: =A0 =A0 =A0 =A0 =A0dbus
> +# Required-Start: =A0 =A0$remote_fs $syslog
> +# Required-Stop: =A0 =A0 $remote_fs $syslog
> +# Default-Start: =A0 =A0 2 3 4 5
> +# Default-Stop: =A0 =A0 =A01
> +# Short-Description: D-Bus systemwide message bus
> +# Description: =A0 =A0 =A0 D-Bus is a simple interprocess messaging syst=
em, used
> +# =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for sending messages between ap=
plications.
> +### END INIT INFO
> +#
> +# -*- coding: utf-8 -*-
> +# Debian init.d script for D-BUS
> +# Copyright =A9 2003 Colin Walters <walters@debian.org>
> +
> +set -e
> +
> +DAEMON=3D/usr/bin/dbus-daemon
> +NAME=3Ddbus
> +DAEMONUSER=3Dmessagebus
> +PIDDIR=3D/var/run/dbus
> +PIDFILE=3D$PIDDIR/pid
> +UUIDDIR=3D/var/lib/dbus
> +DESC=3D"system message bus"
> +EVENTDIR=3D/etc/dbus-1/event.d
> +
> +test -x $DAEMON || exit 0
> +
> +# Source defaults file; edit that file to configure this script.
> +ENABLED=3D1
> +PARAMS=3D""
> +if [ -e /etc/default/dbus ]; then
> + =A0. /etc/default/dbus
> +fi
> +
> +test "$ENABLED" !=3D "0" || exit 0
> +
> +start_it_up()
> +{
> + =A0if [ ! -d $PIDDIR ]; then
> + =A0 =A0mkdir -p $PIDDIR
> + =A0 =A0chown $DAEMONUSER $PIDDIR
> + =A0 =A0chgrp $DAEMONUSER $PIDDIR
> + =A0fi
> + =A0if [ -e $PIDFILE ]; then
> + =A0 =A0PIDDIR=3D/proc/$(cat $PIDFILE)
> + =A0 =A0if [ -d ${PIDDIR} -a =A0"$(readlink -f ${PIDDIR}/exe)" =3D "${DA=
EMON}" ]; then
> + =A0 =A0 =A0echo "$DESC already started; not starting."
> + =A0 =A0else
> + =A0 =A0 =A0echo "Removing stale PID file $PIDFILE."
> + =A0 =A0 =A0rm -f $PIDFILE
> + =A0 =A0fi
> + =A0fi
> +
> + =A0if [ ! -d $UUIDDIR ]; then
> + =A0 =A0mkdir -p $UUIDDIR
> + =A0 =A0chown $DAEMONUSER $UUIDDIR
> + =A0 =A0chgrp $DAEMONUSER $UUIDDIR
> + =A0fi
> +
> + =A0dbus-uuidgen --ensure
> +
> + =A0echo -n "Starting $DESC: "
> + =A0start-stop-daemon --start --quiet --pidfile $PIDFILE \
> + =A0 =A0--user $DAEMONUSER --exec $DAEMON -- --system $PARAMS
> + =A0echo "$NAME."
> + =A0if [ -d $EVENTDIR ]; then
> + =A0 =A0 =A0run-parts --arg=3Dstart $EVENTDIR
> + =A0fi
> +}
> +
> +shut_it_down()
> +{
> + =A0if [ -d $EVENTDIR ]; then
> + =A0 =A0 =A0# TODO: --reverse when busybox supports it
> + =A0 =A0 =A0run-parts --arg=3Dstop $EVENTDIR
> + =A0fi
> + =A0echo -n "Stopping $DESC: "
> + =A0start-stop-daemon --stop =A0--quiet --pidfile $PIDFILE \
> + =A0 =A0--user $DAEMONUSER
> + =A0# We no longer include these arguments so that start-stop-daemon
> + =A0# can do its job even given that we may have been upgraded.
> + =A0# We rely on the pidfile being sanely managed
> + =A0# --exec $DAEMON -- --system $PARAMS
> + =A0echo "$NAME."
> + =A0rm -f $PIDFILE
> +}
> +
> +reload_it()
> +{
> + =A0echo -n "Reloading $DESC config: "
> + =A0dbus-send --print-reply --system --type=3Dmethod_call \
> + =A0 =A0 =A0 =A0 =A0 =A0--dest=3Dorg.freedesktop.DBus \
> + =A0 =A0 =A0 =A0 =A0 =A0/ org.freedesktop.DBus.ReloadConfig > /dev/null
> + =A0# hopefully this is enough time for dbus to reload it's config file.
> + =A0echo "done."
> +}
> +
> +case "$1" in
> + =A0start)
> + =A0 =A0start_it_up
> + =A0;;
> + =A0stop)
> + =A0 =A0shut_it_down
> + =A0;;
> + =A0reload|force-reload)
> + =A0 =A0reload_it
> + =A0;;
> + =A0restart)
> + =A0 =A0shut_it_down
> + =A0 =A0sleep 1
> + =A0 =A0start_it_up
> + =A0;;
> + =A0*)
> + =A0 =A0echo "Usage: /etc/init.d/$NAME {start|stop|restart|reload|force-=
reload}" >&2
> + =A0 =A0exit 1
> + =A0;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch b/meta/recip=
es-core/dbus/dbus-1.5.12/tmpdir.patch
> new file mode 100644
> index 0000000..bf086e1
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
> @@ -0,0 +1,44 @@
> +From 5105fedd7fa13dadd2d0d864fb77873b83b79a4b Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Thu, 23 Jun 2011 13:52:09 +0200
> +Subject: [PATCH] buildsys: hardcode socketdir to /tmp
> +
> +the TMPDIR env var isn't always pointing to the right target path
> +
> +Upstream-Status: Inappropriate [embedded]
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +
> +Original comment:
> +
> + =A0 =A0 =A0 avoid to check tmp dir at build time. instead uses hard cod=
ed /tmp here
> + =A0 =A0 =A0 comment added by Kevin Tian <kevin.tian@intel.com>
> +---
> + configure.ac | =A0 11 +----------
> + 1 files changed, 1 insertions(+), 10 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 408054b..6d26180 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1483,16 +1483,7 @@ AC_SUBST(TEST_LAUNCH_HELPER_BINARY)
> + AC_DEFINE_UNQUOTED(DBUS_TEST_LAUNCH_HELPER_BINARY, "$TEST_LAUNCH_HELPER=
_BINARY",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0[Full path to the launch helper =
test program in the builddir])
> +
> +-#### Find socket directories
> +-if ! test -z "$TMPDIR" ; then
> +- =A0 DEFAULT_SOCKET_DIR=3D$TMPDIR
> +-elif ! test -z "$TEMP" ; then
> +- =A0 DEFAULT_SOCKET_DIR=3D$TEMP
> +-elif ! test -z "$TMP" ; then
> +- =A0 DEFAULT_SOCKET_DIR=3D$TMP
> +-else
> +- =A0 DEFAULT_SOCKET_DIR=3D/tmp
> +-fi
> ++DEFAULT_SOCKET_DIR=3D/tmp
> +
> + DEFAULT_SOCKET_DIR=3D`echo $DEFAULT_SOCKET_DIR | sed 's/+/%2B/g'`
> +
> +--
> +1.6.6.1
> +
> diff --git a/meta/recipes-core/dbus/dbus_1.4.16.bb b/meta/recipes-core/db=
us/dbus_1.4.16.bb
> deleted file mode 100644
> index 3cf8bb8..0000000
> --- a/meta/recipes-core/dbus/dbus_1.4.16.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -include dbus.inc
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI[md5sum] =3D "44a2a10678e7e50460879c3eb4453a65"
> -SRC_URI[sha256sum] =3D "1d8ee6262f8cc2148f06578eee522c755ba0896206b3464c=
a9bdc84f411b29c6"
> -
> diff --git a/meta/recipes-core/dbus/dbus_1.4.20.bb b/meta/recipes-core/db=
us/dbus_1.4.20.bb
> new file mode 100644
> index 0000000..c0da998
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus_1.4.20.bb
> @@ -0,0 +1,6 @@
> +include dbus.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "79eca2f2c1894ac347acce128314428b"
> +SRC_URI[sha256sum] =3D "103bdcd261a13140730b5fa69f56a98ab5c89ba3f0116ea6=
2fcfd639520d5aaf"
> diff --git a/meta/recipes-core/dbus/dbus_1.5.12.bb b/meta/recipes-core/db=
us/dbus_1.5.12.bb
> new file mode 100644
> index 0000000..f41d170
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus_1.5.12.bb
> @@ -0,0 +1,9 @@
> +include dbus.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[md5sum] =3D "ddf18c86fd86ca0d766e18a514e368fd"
> +SRC_URI[sha256sum] =3D "5d3e09a831259ca64b15357cfa1c60a5a7ab06ef469d5b82=
c2308de9cadf1094"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Merged into OE-Core

Thanks

-b



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


