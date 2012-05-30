Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZlsO-0005Nw-UC for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 18:36:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGPgmM023390
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:25:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21779-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:25:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGPX4S023384
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:25:34 +0100
Message-ID: <1338395134.20169.158.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 17:25:34 +0100
In-Reply-To: <1338361866-4176-1-git-send-email-radu.moisan@intel.com>
References: <1338361866-4176-1-git-send-email-radu.moisan@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q4UGPgmM023390
Subject: Re: [PATCH v2] dbus: update to version 1.4.20
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
X-List-Received-Date: Wed, 30 May 2012 16:36:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-30 at 10:11 +0300, Radu Moisan wrote:
> Unstable version 1.5.12 also supported
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  .../dbus/{dbus-1.4.16 =3D> dbus-1.4.20}/dbus-1.init  |    0
>  .../dbus/{dbus-1.4.16 =3D> dbus-1.4.20}/tmpdir.patch |    0
>  meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init     |  121 ++++++++++++=
++++++++
>  meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch    |   44 +++++++
>  meta/recipes-core/dbus/dbus_1.4.16.bb              |    7 --
>  meta/recipes-core/dbus/dbus_1.4.20.bb              |    6 +
>  meta/recipes-core/dbus/dbus_1.5.12.bb              |    9 ++
>  7 files changed, 180 insertions(+), 7 deletions(-)
>  rename meta/recipes-core/dbus/{dbus-1.4.16 =3D> dbus-1.4.20}/dbus-1.in=
it (100%)
>  rename meta/recipes-core/dbus/{dbus-1.4.16 =3D> dbus-1.4.20}/tmpdir.pa=
tch (100%)
>  create mode 100644 meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
>  create mode 100644 meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch
>  delete mode 100644 meta/recipes-core/dbus/dbus_1.4.16.bb
>  create mode 100644 meta/recipes-core/dbus/dbus_1.4.20.bb
>  create mode 100644 meta/recipes-core/dbus/dbus_1.5.12.bb
>=20
> diff --git a/meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init b/meta/reci=
pes-core/dbus/dbus-1.4.20/dbus-1.init
> similarity index 100%
> rename from meta/recipes-core/dbus/dbus-1.4.16/dbus-1.init
> rename to meta/recipes-core/dbus/dbus-1.4.20/dbus-1.init
> diff --git a/meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch b/meta/rec=
ipes-core/dbus/dbus-1.4.20/tmpdir.patch
> similarity index 100%
> rename from meta/recipes-core/dbus/dbus-1.4.16/tmpdir.patch
> rename to meta/recipes-core/dbus/dbus-1.4.20/tmpdir.patch
> diff --git a/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init b/meta/reci=
pes-core/dbus/dbus-1.5.12/dbus-1.init
> new file mode 100644
> index 0000000..4abc4cb
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus-1.5.12/dbus-1.init
> @@ -0,0 +1,121 @@
> +#! /bin/sh
> +### BEGIN INIT INFO
> +# Provides:          dbus
> +# Required-Start:    $remote_fs $syslog
> +# Required-Stop:     $remote_fs $syslog
> +# Default-Start:     2 3 4 5
> +# Default-Stop:      1
> +# Short-Description: D-Bus systemwide message bus
> +# Description:       D-Bus is a simple interprocess messaging system, =
used
> +#                    for sending messages between applications.
> +### END INIT INFO
> +#
> +# -*- coding: utf-8 -*-
> +# Debian init.d script for D-BUS
> +# Copyright =C2=A9 2003 Colin Walters <walters@debian.org>
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
> +  . /etc/default/dbus
> +fi
> +
> +test "$ENABLED" !=3D "0" || exit 0
> +
> +start_it_up()
> +{
> +  if [ ! -d $PIDDIR ]; then
> +    mkdir -p $PIDDIR
> +    chown $DAEMONUSER $PIDDIR
> +    chgrp $DAEMONUSER $PIDDIR
> +  fi
> +  if [ -e $PIDFILE ]; then
> +    PIDDIR=3D/proc/$(cat $PIDFILE)
> +    if [ -d ${PIDDIR} -a  "$(readlink -f ${PIDDIR}/exe)" =3D "${DAEMON=
}" ]; then=20
> +      echo "$DESC already started; not starting."
> +    else
> +      echo "Removing stale PID file $PIDFILE."
> +      rm -f $PIDFILE
> +    fi
> +  fi
> +
> +  if [ ! -d $UUIDDIR ]; then
> +    mkdir -p $UUIDDIR
> +    chown $DAEMONUSER $UUIDDIR
> +    chgrp $DAEMONUSER $UUIDDIR
> +  fi
> +=20
> +  dbus-uuidgen --ensure =20
> +
> +  echo -n "Starting $DESC: "
> +  start-stop-daemon --start --quiet --pidfile $PIDFILE \
> +    --user $DAEMONUSER --exec $DAEMON -- --system $PARAMS
> +  echo "$NAME."
> +  if [ -d $EVENTDIR ]; then
> +      run-parts --arg=3Dstart $EVENTDIR
> +  fi
> +}
> +
> +shut_it_down()
> +{
> +  if [ -d $EVENTDIR ]; then
> +      # TODO: --reverse when busybox supports it
> +      run-parts --arg=3Dstop $EVENTDIR
> +  fi
> +  echo -n "Stopping $DESC: "
> +  start-stop-daemon --stop  --quiet --pidfile $PIDFILE \
> +    --user $DAEMONUSER
> +  # We no longer include these arguments so that start-stop-daemon
> +  # can do its job even given that we may have been upgraded.
> +  # We rely on the pidfile being sanely managed
> +  # --exec $DAEMON -- --system $PARAMS
> +  echo "$NAME."
> +  rm -f $PIDFILE
> +}
> +
> +reload_it()
> +{
> +  echo -n "Reloading $DESC config: "
> +  dbus-send --print-reply --system --type=3Dmethod_call \
> +            --dest=3Dorg.freedesktop.DBus \
> +            / org.freedesktop.DBus.ReloadConfig > /dev/null
> +  # hopefully this is enough time for dbus to reload it's config file.
> +  echo "done."
> +}
> +
> +case "$1" in
> +  start)
> +    start_it_up
> +  ;;
> +  stop)
> +    shut_it_down
> +  ;;
> +  reload|force-reload)
> +    reload_it
> +  ;;
> +  restart)
> +    shut_it_down
> +    sleep 1
> +    start_it_up
> +  ;;
> +  *)
> +    echo "Usage: /etc/init.d/$NAME {start|stop|restart|reload|force-re=
load}" >&2
> +    exit 1
> +  ;;
> +esac
> +
> +exit 0
> diff --git a/meta/recipes-core/dbus/dbus-1.5.12/tmpdir.patch b/meta/rec=
ipes-core/dbus/dbus-1.5.12/tmpdir.patch
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
> +	avoid to check tmp dir at build time. instead uses hard coded /tmp he=
re
> +	comment added by Kevin Tian <kevin.tian@intel.com>
> +---
> + configure.ac |   11 +----------
> + 1 files changed, 1 insertions(+), 10 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 408054b..6d26180 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1483,16 +1483,7 @@ AC_SUBST(TEST_LAUNCH_HELPER_BINARY)
> + AC_DEFINE_UNQUOTED(DBUS_TEST_LAUNCH_HELPER_BINARY, "$TEST_LAUNCH_HELP=
ER_BINARY",
> +                    [Full path to the launch helper test program in th=
e builddir])
> +=20
> +-#### Find socket directories
> +-if ! test -z "$TMPDIR" ; then
> +-   DEFAULT_SOCKET_DIR=3D$TMPDIR
> +-elif ! test -z "$TEMP" ; then
> +-   DEFAULT_SOCKET_DIR=3D$TEMP
> +-elif ! test -z "$TMP" ; then
> +-   DEFAULT_SOCKET_DIR=3D$TMP
> +-else
> +-   DEFAULT_SOCKET_DIR=3D/tmp
> +-fi
> ++DEFAULT_SOCKET_DIR=3D/tmp
> +=20
> + DEFAULT_SOCKET_DIR=3D`echo $DEFAULT_SOCKET_DIR | sed 's/+/%2B/g'`
> +=20
> +--=20
> +1.6.6.1
> +
> diff --git a/meta/recipes-core/dbus/dbus_1.4.16.bb b/meta/recipes-core/=
dbus/dbus_1.4.16.bb
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
> -SRC_URI[sha256sum] =3D "1d8ee6262f8cc2148f06578eee522c755ba0896206b346=
4ca9bdc84f411b29c6"
> -
> diff --git a/meta/recipes-core/dbus/dbus_1.4.20.bb b/meta/recipes-core/=
dbus/dbus_1.4.20.bb
> new file mode 100644
> index 0000000..1df49b7
> --- /dev/null
> +++ b/meta/recipes-core/dbus/dbus_1.4.20.bb
> @@ -0,0 +1,6 @@
> +include dbus.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +RC_URI[md5sum] =3D "79eca2f2c1894ac347acce128314428b"

There is a typo here...

Cheers,

Richard


> +SRC_URI[sha256sum] =3D "103bdcd261a13140730b5fa69f56a98ab5c89ba3f0116e=
a62fcfd639520d5aaf"
> diff --git a/meta/recipes-core/dbus/dbus_1.5.12.bb b/meta/recipes-core/=
dbus/dbus_1.5.12.bb
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
> +SRC_URI[sha256sum] =3D "5d3e09a831259ca64b15357cfa1c60a5a7ab06ef469d5b=
82c2308de9cadf1094"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +




