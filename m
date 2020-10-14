Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.5956.1602709125015787438
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 13:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=itYriV1l;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id h140so677656qke.7
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 13:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9U3ME06iPVw73z2xe6K6OoVdMzcvEtgLOAvnn4X+DCY=;
        b=itYriV1lt+Rkb5LitKGv8hVs9cs0SB09G0b+Ww8tbE+9dNdfDJASNwBZXEokSyHPWP
         D0XoXDY8GbvJkUQ+tlYQko1ANa5lkqIEuikCJ+mgox/+480Qoc/5mJ50BIwhJWnWCtXI
         Yo2L5l3pcjBz+4nIOnB1QycbTL8pkf4u23/C21S0TIKJUzkyue4ENPRZ+lVy1Ojnk7RP
         yO4yPjtpc9G9svo3imN0V0/B3ozYxTFcbX5iZcro8dGRU1GIsmNe1STs3o/6QFjZjAcL
         49KXtb6jsi0X7bYdkhL6fTM2Dkee6m78mPoWSMNXuF5Q49YpErUX0cCGp0/Nm2cc/UJw
         vrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9U3ME06iPVw73z2xe6K6OoVdMzcvEtgLOAvnn4X+DCY=;
        b=cjvKypbD8g++YF91gFjWd68Ur7Y3PrAFQPhjLSikxnWZeKC//xzWUfntpIclUzkmjS
         vhQye8kJl0dPikOxEnFbcZGF9Hx8gz+XYgVD3aHMuDyylwKvovR7+UehVwhXAHLV0p3B
         xIKkHtfnTyEgJ2N31HbqOH2jwilZbtYbUWQisi7D0E91iP1GewsdlPTsS+MRjDnRTkbD
         exakgHYBuwqGy/g36P5CT26Ra44YWNm1kuDpBpckk1Wmi2/ReM+rICSaAdk+QSgtaMqw
         aZohLrN+TvflriPm4KBFl85iqB610TAlAHWQqdfP6/V3yWAKCjUbbGy5ZtMmBxqYQRlu
         Egkg==
X-Gm-Message-State: AOAM5303rYvBV/pKtivNz+IrT/3SijXUQ+16LNACihX0iSitKxXo0T5D
	f2x5mXPxCu+hdZSsm92rhognvurZd4SD9qiRsCY=
X-Google-Smtp-Source: ABdhPJyc5EuSbse0HxBOAp5KItXm7oHWwWcnCGBNOS62kWDLSy5bEFWn+IluSnRBJbbbd/wAxeN3NxVljXENI8JauHA=
X-Received: by 2002:a05:620a:c07:: with SMTP id l7mr982354qki.9.1602709123973;
 Wed, 14 Oct 2020 13:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201014050821.25233-1-akuster808@gmail.com> <AM6PR08MB34615B96808A64EF05A1024B92050@AM6PR08MB3461.eurprd08.prod.outlook.com>
In-Reply-To: <AM6PR08MB34615B96808A64EF05A1024B92050@AM6PR08MB3461.eurprd08.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Oct 2020 13:58:17 -0700
Message-ID: <CAMKF1sq5U8tWGEh7zpXXp0ctd1AzTMmFADkm7jo-giK0EDfGJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kea: add init scripts
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: "akuster808@gmail.com" <akuster808@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>, 
	Ross Burton <Ross.Burton@arm.com>, =?UTF-8?Q?Kamil_Dzie=C5=BCyk?= <Kamil.Dziezyk@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 14, 2020 at 12:43 AM Diego Sueiro <diego.sueiro@arm.com> wrote:
>
> >-----Original Message-----
> >From: openembedded-core@lists.openembedded.org <openembedded-
> >core@lists.openembedded.org> On Behalf Of akuster via
> >lists.openembedded.org
> >Sent: 14 October 2020 06:08
> >To: openembedded-core@lists.openembedded.org
> >Subject: [OE-core] [PATCH] kea: add init scripts
> >
> >[ Yocto # 14074 ]
> >
> >Add init scripts for dhcp4,6 and ddns
> >
> >Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> The keactrl is not working as expected in a core-image-minimal. I'm getting the following
> output for `keactrl status`:
> ```
> /usr/sbin/keactrl: line 101: rev: not found
> /usr/sbin/keactrl: line 101: rev: not found
> DHCPv4 server: inactive
> /usr/sbin/keactrl: line 101: rev: not found
> /usr/sbin/keactrl: line 101: rev: not found
> DHCPv6 server: inactive
> /usr/sbin/keactrl: line 101: rev: not found
> /usr/sbin/keactrl: line 101: rev: not found
> DHCP DDNS: inactive
> /usr/sbin/keactrl: line 101: rev: not found
> /usr/sbin/keactrl: line 101: rev: not found
> Control Agent: inactive
> Kea DHCPv4 configuration file: /etc/kea/kea-dhcp4.conf
> Kea DHCPv6 configuration file: /etc/kea/kea-dhcp6.conf
> Kea DHCP DDNS configuration file: /etc/kea/kea-dhcp-ddns.conf
> Kea Control Agent configuration file: /etc/kea/kea-ctrl-agent.conf
> keactrl configuration file: /etc/kea/keactrl.conf
> ```
>
> And the dhcp4 server is running ` ps | grep kea-dhcp4`:
> ```
> 773 root     51000 S    /usr/sbin/kea-dhcp4 -c /etc/kea/kea-dhcp4.conf -d
> ```
>
> The problem is that the oe-core busybox does not include the `rev` applet and
> it  doesn't support `ps -p`:
> https://github.com/isc-projects/kea/blob/master/src/bin/keactrl/keactrl.in#L141
>
> We need to build the busybox `rev` and `pgreg` applets and have something like:
> ```
> --- kea-1.7.10.original/src/bin/keactrl/keactrl.in
> +++ kea-1.7.10/src/bin/keactrl/keactrl.in
> @@ -137,8 +137,8 @@
>      # Get the PID from the PID file (if it exists)
>      get_pid_from_file "${proc_name}"
>      if [ ${_pid} -gt 0 ]; then
> -        # Use ps to check if PID is alive
> -        ps -p ${_pid} 1>/dev/null
> +        # Use pgrep and grep to check if PID is alive
> +        pgrep -v 1 | grep ${_pid} 1>/dev/null
>          retcode=$?
>          if [ $retcode -eq 0 ]; then
>              # No error, so PID IS ALIVE
> ```

this looks fine to me. Another option is to depend on util-linux but I
think having a busybox applet based solution is good
and can be overwritten via u-a if util-linux is used in image. How
much size do we grow on busybox when adding rev/pgrep applets
>
> Cheers,
>
> Diego Sueiro
>
> >---
> > .../kea/files/kea-dhcp-ddns-server            | 46 ++++++++++++++++++
> > .../kea/files/kea-dhcp4-server                | 46 ++++++++++++++++++
> > .../kea/files/kea-dhcp6-server                | 47 +++++++++++++++++++
> > meta/recipes-connectivity/kea/kea_1.7.10.bb   | 13 ++++-
> > 4 files changed, 151 insertions(+), 1 deletion(-)  create mode 100644
> >meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
> > create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp4-server
> > create mode 100644 meta/recipes-connectivity/kea/files/kea-dhcp6-server
> >
> >diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
> >b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
> >new file mode 100644
> >index 00000000000..fe19179f290
> >--- /dev/null
> >+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
> >@@ -0,0 +1,46 @@
> >+#!/bin/sh
> >+### BEGIN INIT INFO
> >+# Provides:          kea-dhcp-ddns-server
> >+# Required-Start:    $local_fs $network $remote_fs $syslog
> >+# Required-Stop:     $local_fs $network $remote_fs $syslog
> >+# Default-Start:     2 3 4 5
> >+# Default-Stop:      0 1 6
> >+# Short-Description: ISC KEA DHCP IPv6 Server ### END INIT INFO
> >+
> >+PATH=/sbin:/usr/sbin:/bin:/usr/bin
> >+DESC="kea-dhcp-ddns-server"
> >+NAME=kea-dhcp-ddns
> >+DAEMON=/usr/sbin/keactrl
> >+DAEMON_ARGS=" -s dhcp_ddns"
> >+
> >+set -e
> >+
> >+# Exit if the package is not installed
> >+[ -x "$DAEMON" ] || exit 0
> >+
> >+# Source function library.
> >+. /etc/init.d/functions
> >+
> >+case "$1" in
> >+  start)
> >+        echo -n "Starting $DESC: "
> >+        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
> >+        echo "done."
> >+        ;;
> >+  stop)
> >+        echo -n "Stopping $DESC: "
> >+        kpid=`pidof $NAME`
> >+        kill $kpid
> >+        echo "done."
> >+        ;;
> >+  restart|force-reload)
> >+        #
> >+        $0 stop
> >+        $0 start
> >+        ;;
> >+  *)
> >+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
>
> status is not implemented. The same applies to the other init scripts.
>
> >+        exit 1
> >+        ;;
> >+esac
> >diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4-server
> >b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
> >new file mode 100644
> >index 00000000000..59128e530d6
> >--- /dev/null
> >+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
> >@@ -0,0 +1,46 @@
> >+#!/bin/sh
> >+### BEGIN INIT INFO
> >+# Provides:          kea-dhcp4-server
> >+# Required-Start:    $local_fs $network $remote_fs $syslog
> >+# Required-Stop:     $local_fs $network $remote_fs $syslog
> >+# Default-Start:     2 3 4 5
> >+# Default-Stop:      0 1 6
> >+# Short-Description: ISC KEA DHCP IPv6 Server ### END INIT INFO
> >+
> >+PATH=/sbin:/usr/sbin:/bin:/usr/bin
> >+DESC="kea-dhcp4-server"
> >+NAME=kea-dhcp4
> >+DAEMON=/usr/sbin/keactrl
> >+DAEMON_ARGS=" -s dhcp4"
> >+
> >+set -e
> >+
> >+# Exit if the package is not installed
> >+[ -x "$DAEMON" ] || exit 0
> >+
> >+# Source function library.
> >+. /etc/init.d/functions
> >+
> >+case "$1" in
> >+  start)
> >+        echo -n "Starting $DESC: "
> >+        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
> >+        echo "done."
> >+        ;;
> >+  stop)
> >+        echo -n "Stopping $DESC: "
> >+        kpid=`pidof $NAME`
> >+        kill $kpid
> >+        echo "done."
> >+        ;;
> >+  restart|force-reload)
> >+        #
> >+        $0 stop
> >+        $0 start
> >+        ;;
> >+  *)
> >+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
> >+        exit 1
> >+        ;;
> >+esac
> >diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6-server
> >b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
> >new file mode 100644
> >index 00000000000..e0119d6eb2e
> >--- /dev/null
> >+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
> >@@ -0,0 +1,47 @@
> >+#!/bin/sh
> >+### BEGIN INIT INFO
> >+# Provides:          kea-dhcp6-server
> >+# Required-Start:    $local_fs $network $remote_fs $syslog
> >+# Required-Stop:     $local_fs $network $remote_fs $syslog
> >+# Default-Start:     2 3 4 5
> >+# Default-Stop:      0 1 6
> >+# Short-Description: ISC KEA DHCP IPv6 Server ### END INIT INFO
> >+
> >+# PATH should only include /usr/* if it runs after the mountnfs.sh
> >+script PATH=/sbin:/usr/sbin:/bin:/usr/bin
> >+DESC="kea-dhcp6-server"
> >+NAME=kea-dhcp6
> >+DAEMON=/usr/sbin/keactrl
> >+DAEMON_ARGS=" -s dhcp6"
> >+
> >+set -e
> >+
> >+# Exit if the package is not installed
> >+[ -x "$DAEMON" ] || exit 0
> >+
> >+# Source function library.
> >+. /etc/init.d/functions
> >+
> >+case "$1" in
> >+  start)
> >+        echo -n "Starting $DESC: "
> >+        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
> >+        echo "done."
> >+        ;;
> >+  stop)
> >+        echo -n "Stopping $DESC: "
> >+        kpid=`pidof $NAME`
> >+        kill $kpid
> >+        echo "done."
> >+        ;;
> >+  restart|force-reload)
> >+        #
> >+        $0 stop
> >+        $0 start
> >+        ;;
> >+  *)
> >+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
> >+        exit 1
> >+        ;;
> >+esac
> >diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-
> >connectivity/kea/kea_1.7.10.bb
> >index 2ea4b12758e..15193aeda38 100644
> >--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
> >+++ b/meta/recipes-connectivity/kea/kea_1.7.10.bb
> >@@ -13,11 +13,17 @@ SRC_URI = "\
> >     file://kea-dhcp4.service \
> >     file://kea-dhcp6.service \
> >     file://kea-dhcp-ddns.service \
> >+    file://kea-dhcp4-server \
> >+    file://kea-dhcp6-server \
> >+    file://kea-dhcp-ddns-server \
> >     file://fix-multilib-conflict.patch \  "
> > SRC_URI[sha256sum] =
> >"4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
> >
> >-inherit autotools systemd
> >+inherit autotools systemd update-rc.d
> >+
> >+INITSCRIPT_NAME = "kea-dhcp4-server"
> >+INITSCRIPT_PARAMS = "defaults 30"
> >
> > SYSTEMD_SERVICE_${PN} = "kea-dhcp4.service kea-dhcp6.service kea-dhcp-
> >ddns.service"
> > SYSTEMD_AUTO_ENABLE = "disable"
> >@@ -44,8 +50,11 @@ do_configure_prepend() {  }
> >
> > do_install_append() {
> >+    install -d ${D}${sysconfdir}/init.d
> >     install -d ${D}${systemd_system_unitdir}
> >+
> >     install -m 0644 ${WORKDIR}/kea-dhcp*service
> >${D}${systemd_system_unitdir}
> >+    install -m 0755 ${WORKDIR}/kea-*-server ${D}${sysconfdir}/init.d
> >     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
> >            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e
> >'s,@SYSCONFDIR@,${sysconfdir},g' \
> >            ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
> >@@ -55,6 +64,8 @@ do_install_append() {
> >     rm -rf "${D}${localstatedir}"
> > }
> >
> >+CONFFILES_${PN} = "${sysconfdir}/kea/keactrl.conf"
> >+
> > FILES_${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
> > FILES_${PN} += "${libdir}/hooks/*.so"
> >
> >--
> >2.17.1
>
>
> 
>
