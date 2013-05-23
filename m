Return-Path: <erik.boto@pelagicore.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 04FDB6089F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 08:27:55 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id wp18so3501565obc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 01:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=zRJgcGaHVPiHJYOKB4qGv4Q5Ek+lTZONHcG/84flNWc=;
	b=ONTlT8LwwLIAutLnaWlWwY2HXBaT3Nw1D2Pu1yFyrVhEgt6WjRw6U4+2C3EvNPtYSw
	LXSSPkVmLumGRqrvc4jNy+MmRQpj/xG2sKlds6RkVx7Xn0eqne1c6EhVQGqH/FLutLEL
	UVJRMljU4b/AtCrnPOERHkE3oRGT+0UpFO0z3xjmVykVYH4iOaQEkXsNX2qwt8eBcA3z
	HZqAcc4M+eo7NSDp4ugZrHQ4oRbaFhTz5AEt+6kJlFld6T2kIeq6pph9IVS3xGhj6Raz
	3BTrLmYyU025aFaBTtWid4cjZWbybDHB80ZYTVarnPb8Z5EezrAPSwT1m44anaHjCV7v
	SU6Q==
MIME-Version: 1.0
X-Received: by 10.60.133.202 with SMTP id pe10mr1334317oeb.56.1369297676199;
	Thu, 23 May 2013 01:27:56 -0700 (PDT)
Received: by 10.76.141.6 with HTTP; Thu, 23 May 2013 01:27:56 -0700 (PDT)
In-Reply-To: <1369270777-2932-1-git-send-email-net147@gmail.com>
References: <1369270777-2932-1-git-send-email-net147@gmail.com>
Date: Thu, 23 May 2013 10:27:56 +0200
Message-ID: <CA+AhUGxnKoTeEFYZUAZTtzEfOQ2sUEy1S_Hdz7SBo=hZVYkP=g@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQkQCTKIYWfdwKM7Ke7f5JTARLj9Yaar9c5F1Gm9LWC8r/0IOWDX+QDU/ED0BmhPmboyo6vN
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] systemd: update to 204
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
X-List-Received-Date: Thu, 23 May 2013 08:27:56 -0000
Content-Type: multipart/alternative; boundary=047d7b47249a95454304dd5e758e

--047d7b47249a95454304dd5e758e
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I'd like util-linux added to DEPENDS to avoid the issue described in
http://lists.openembedded.org/pipermail/openembedded-core/2013-May/078641.h=
tml
 .

Most of the times util-linux seems to be staged in sysroot due to other
dependencies, but I guess this is sort of a race situation where it's not
guaranteed to be there.

Cheers,
Erik Bot=F6


On Thu, May 23, 2013 at 2:59 AM, Jonathan Liu <net147@gmail.com> wrote:

> Removed patches integrated upstream.
> Added backport of fix for utmp not running at shutdown.
> Updated serial-getty service.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  .../systemd-serialgetty/serial-getty@.service      |  16 +-
>  ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch |  41 ---
>  ...ystemd-update-utmp-shutdown.service-into-.patch | 367
> +++++++++++++++++++++
>  .../0002-readahead-chunk-on-spinning-media.patch   | 142 --------
>  .../systemd/systemd/0003-readahead-cleanups.patch  |  86 -----
>  ...ctl-Handle-missing-etc-sysctl.conf-proper.patch |  33 --
>  .../systemd/systemd/199-firmware.patch             |  98 ------
>  .../systemd/{systemd_199.bb =3D> systemd_204.bb}     |  11 +-
>  8 files changed, 380 insertions(+), 414 deletions(-)
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-ob=
jcopy-strings-and-.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shut=
down.service-into-.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.=
patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-=
sysctl.conf-proper.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/199-firmware.patch
>  rename meta/recipes-core/systemd/{systemd_199.bb =3D> systemd_204.bb} (9=
5%)
>
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.=
service
> b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> index 8eeaab6..1c14dfe 100644
> --- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> +++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
> @@ -1,23 +1,27 @@
>  #  This file is part of systemd.
>  #
>  #  systemd is free software; you can redistribute it and/or modify it
> -#  under the terms of the GNU General Public License as published by
> -#  the Free Software Foundation; either version 2 of the License, or
> +#  under the terms of the GNU Lesser General Public License as published
> by
> +#  the Free Software Foundation; either version 2.1 of the License, or
>  #  (at your option) any later version.
>
>  [Unit]
>  Description=3DSerial Getty on %I
> -BindTo=3Ddev-%i.device
> -After=3Ddev-%i.device systemd-user-sessions.service
> +Documentation=3Dman:agetty(8) man:systemd-getty-generator(8)
> +Documentation=3Dhttp://0pointer.de/blog/projects/serial-console.html
> +BindsTo=3Ddev-%i.device
> +After=3Ddev-%i.device systemd-user-sessions.service
> plymouth-quit-wait.service
> +After=3Drc-local.service
>
>  # If additional gettys are spawned during boot then we should make
>  # sure that this is synchronized before getty.target, even though
>  # getty.target didn't actually pull it in.
>  Before=3Dgetty.target
> +IgnoreOnIsolate=3Dyes
>
>  [Service]
> -Environment=3DTERM=3Dvt100
> -ExecStart=3D-/sbin/agetty -s %I @BAUDRATE@
> +ExecStart=3D-/sbin/agetty -s %I @BAUDRATE@ vt102
> +Type=3Didle
>  Restart=3Dalways
>  RestartSec=3D0
>  UtmpIdentifier=3D%I
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-=
objcopy-strings-and-.patch
> b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-=
objcopy-strings-and-.patch
> deleted file mode 100644
> index d847bbc..0000000
> ---
> a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-=
objcopy-strings-and-.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Tue, 16 Apr 2013 14:20:41 +0200
> -Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings and
> gperf
> -
> -* using AC_PATH_TOOL does not allow to override it from shell environmen=
t
> -  which is useful when cross-compiling
> -* with external toolchain I have different HOST_PREFIX and HOST_SYS
> -  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
> -  which is available only as ${TARGET_PREFIX}objcopy then it tries
> -  objcopy without prefix which is found on host, but that objcopy
> -  does not work for !host (e.g. arm when building on x86) libs
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -Upstream-Status: Submitted
> -
> http://lists.freedesktop.org/archives/systemd-devel/2013-April/010468.htm=
l
> -
> ----
> - configure.ac | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 33b0ca9..519f1a9 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([1.31.1])
> -    AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
> -    enable_introspection=3Dno])
> -
> --AC_PATH_TOOL(OBJCOPY, objcopy)
> --AC_PATH_TOOL(STRINGS, strings)
> --AC_PATH_TOOL(GPERF, gperf)
> -+AC_CHECK_TOOL(OBJCOPY, objcopy)
> -+AC_CHECK_TOOL(STRINGS, strings)
> -+AC_CHECK_TOOL(GPERF, gperf)
> - if test -z "$GPERF" ; then
> -         AC_MSG_ERROR([*** gperf not found])
> - fi
> ---
> -1.8.1.5
> -
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-sh=
utdown.service-into-.patch
> b/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-sh=
utdown.service-into-.patch
> new file mode 100644
> index 0000000..86fab97
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-sh=
utdown.service-into-.patch
> @@ -0,0 +1,367 @@
> +Upstream-Status: Backport
> +Signed-off-by: Jonathan Liu <net147@gmail.com>
> +
> +From 3f92e4b4b61042391bd44de4dceb18177df0dd57 Mon Sep 17 00:00:00 2001
> +From: Lennart Poettering <lennart@poettering.net>
> +Date: Thu, 16 May 2013 00:19:03 +0200
> +Subject: [PATCH] utmp: turn systemd-update-utmp-shutdown.service into a
> normal
> + runtime service
> +
> +With this change systemd-update-utmp-shutdown.service is replaced by
> +systemd-update-utmp.service which is started at boot and stays around
> +until shutdown. This allows us to properly order the unit against both
> +/var/log and auditd.
> +
> +https://bugzilla.redhat.com/show_bug.cgi?id=3D853104
> +https://bugs.freedesktop.org/show_bug.cgi?id=3D64365
> +---
> + Makefile-man.am                               | 12 ++---
> + Makefile.am                                   |  8 +--
> + man/systemd-update-utmp-runlevel.service.xml  | 76
> ---------------------------
> + man/systemd-update-utmp.service.xml           | 76
> +++++++++++++++++++++++++++
> + src/update-utmp/update-utmp.c                 |  2 +-
> + units/.gitignore                              |  2 +-
> + units/systemd-update-utmp-runlevel.service.in |  8 +--
> + units/systemd-update-utmp-shutdown.service.in | 19 -------
> + units/systemd-update-utmp.service.in          | 21 ++++++++
> + 9 files changed, 114 insertions(+), 110 deletions(-)
> + delete mode 100644 man/systemd-update-utmp-runlevel.service.xml
> + create mode 100644 man/systemd-update-utmp.service.xml
> + delete mode 100644 units/systemd-update-utmp-shutdown.service.in
> + create mode 100644 units/systemd-update-utmp.service.in
> +
> +diff --git a/Makefile-man.am b/Makefile-man.am
> +index 7d62094..5888158 100644
> +--- a/Makefile-man.am
> ++++ b/Makefile-man.am
> +@@ -72,7 +72,7 @@ MANPAGES +=3D \
> +       man/systemd-tmpfiles.8 \
> +       man/systemd-tty-ask-password-agent.1 \
> +       man/systemd-udevd.service.8 \
> +-      man/systemd-update-utmp-runlevel.service.8 \
> ++      man/systemd-update-utmp.service.8 \
> +       man/systemd.1 \
> +       man/systemd.automount.5 \
> +       man/systemd.device.5 \
> +@@ -191,7 +191,7 @@ MANPAGES_ALIAS +=3D \
> +       man/systemd-udevd-control.socket.8 \
> +       man/systemd-udevd-kernel.socket.8 \
> +       man/systemd-udevd.8 \
> +-      man/systemd-update-utmp-shutdown.service.8 \
> ++      man/systemd-update-utmp-runlevel.service.8 \
> +       man/systemd-update-utmp.8 \
> +       man/systemd-user.conf.5
> + man/SD_ALERT.3: man/sd-daemon.3
> +@@ -289,8 +289,8 @@ man/systemd-tmpfiles-setup.service.8:
> man/systemd-tmpfiles.8
> + man/systemd-udevd-control.socket.8: man/systemd-udevd.service.8
> + man/systemd-udevd-kernel.socket.8: man/systemd-udevd.service.8
> + man/systemd-udevd.8: man/systemd-udevd.service.8
> +-man/systemd-update-utmp-shutdown.service.8:
> man/systemd-update-utmp-runlevel.service.8
> +-man/systemd-update-utmp.8: man/systemd-update-utmp-runlevel.service.8
> ++man/systemd-update-utmp-runlevel.service.8:
> man/systemd-update-utmp.service.8
> ++man/systemd-update-utmp.8: man/systemd-update-utmp.service.8
> + man/systemd-user.conf.5: man/systemd-system.conf.5
> + man/SD_ALERT.html: man/sd-daemon.html
> +       $(html-alias)
> +@@ -577,10 +577,10 @@ man/systemd-udevd-kernel.socket.html:
> man/systemd-udevd.service.html
> + man/systemd-udevd.html: man/systemd-udevd.service.html
> +       $(html-alias)
> +
> +-man/systemd-update-utmp-shutdown.service.html:
> man/systemd-update-utmp-runlevel.service.html
> ++man/systemd-update-utmp-runlevel.service.html:
> man/systemd-update-utmp.service.html
> +       $(html-alias)
> +
> +-man/systemd-update-utmp.html:
> man/systemd-update-utmp-runlevel.service.html
> ++man/systemd-update-utmp.html: man/systemd-update-utmp.service.html
> +       $(html-alias)
> +
> + man/systemd-user.conf.html: man/systemd-system.conf.html
> +diff --git a/Makefile.am b/Makefile.am
> +index 8d8139c..4c5e6fc 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -417,8 +417,8 @@ nodist_systemunit_DATA =3D \
> +       units/systemd-initctl.service \
> +       units/systemd-shutdownd.service \
> +       units/systemd-remount-fs.service \
> ++      units/systemd-update-utmp.service \
> +       units/systemd-update-utmp-runlevel.service \
> +-      units/systemd-update-utmp-shutdown.service \
> +       units/systemd-tmpfiles-setup-dev.service \
> +       units/systemd-tmpfiles-setup.service \
> +       units/systemd-tmpfiles-clean.service \
> +@@ -463,8 +463,8 @@ EXTRA_DIST +=3D \
> +       units/systemd-initctl.service.in \
> +       units/systemd-shutdownd.service.in \
> +       units/systemd-remount-fs.service.in \
> ++      units/systemd-update-utmp.service.in \
> +       units/systemd-update-utmp-runlevel.service.in \
> +-      units/systemd-update-utmp-shutdown.service.in \
> +       units/systemd-tmpfiles-setup-dev.service.in \
> +       units/systemd-tmpfiles-setup.service.in \
> +       units/systemd-tmpfiles-clean.service.in \
> +@@ -4070,8 +4070,8 @@ RUNLEVEL4_TARGET_WANTS +=3D \
> + RUNLEVEL5_TARGET_WANTS +=3D \
> +       systemd-update-utmp-runlevel.service
> + endif
> +-SHUTDOWN_TARGET_WANTS +=3D \
> +-      systemd-update-utmp-shutdown.service
> ++SYSINIT_TARGET_WANTS +=3D \
> ++      systemd-update-utmp.service
> + LOCAL_FS_TARGET_WANTS +=3D \
> +       systemd-remount-fs.service \
> +       systemd-fsck-root.service \
> +diff --git a/man/systemd-update-utmp-runlevel.service.xml
> b/man/systemd-update-utmp-runlevel.service.xml
> +deleted file mode 100644
> +index 867b958..0000000
> +--- a/man/systemd-update-utmp-runlevel.service.xml
> ++++ /dev/null
> +@@ -1,76 +0,0 @@
> +-<?xml version=3D"1.0"?>
> +-<!--*-nxml-*-->
> +-<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "
> http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">
> +-<!--
> +-  This file is part of systemd.
> +-
> +-  Copyright 2012 Lennart Poettering
> +-
> +-  systemd is free software; you can redistribute it and/or modify it
> +-  under the terms of the GNU Lesser General Public License as published
> by
> +-  the Free Software Foundation; either version 2.1 of the License, or
> +-  (at your option) any later version.
> +-
> +-  systemd is distributed in the hope that it will be useful, but
> +-  WITHOUT ANY WARRANTY; without even the implied warranty of
> +-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> +-  Lesser General Public License for more details.
> +-
> +-  You should have received a copy of the GNU Lesser General Public
> License
> +-  along with systemd; If not, see <http://www.gnu.org/licenses/>.
> +--->
> +-<refentry id=3D"systemd-update-utmp-runlevel.service">
> +-
> +-        <refentryinfo>
> +-                <title>systemd-update-utmp-runlevel.service</title>
> +-                <productname>systemd</productname>
> +-
> +-                <authorgroup>
> +-                        <author>
> +-                                <contrib>Developer</contrib>
> +-                                <firstname>Lennart</firstname>
> +-                                <surname>Poettering</surname>
> +-                                <email>lennart@poettering.net</email>
> +-                        </author>
> +-                </authorgroup>
> +-        </refentryinfo>
> +-
> +-        <refmeta>
> +-
>  <refentrytitle>systemd-update-utmp-runlevel.service</refentrytitle>
> +-                <manvolnum>8</manvolnum>
> +-        </refmeta>
> +-
> +-        <refnamediv>
> +-                <refname>systemd-update-utmp-runlevel.service</refname>
> +-                <refname>systemd-update-utmp-shutdown.service</refname>
> +-                <refname>systemd-update-utmp</refname>
> +-                <refpurpose>Write audit and utmp updates at runlevel
> +-                changes and shutdown</refpurpose>
> +-        </refnamediv>
> +-
> +-        <refsynopsisdiv>
> +-
>  <para><filename>systemd-update-utmp-runlevel.service</filename></para>
> +-
>  <para><filename>systemd-update-utmp-shutdown.service</filename></para>
> +-
>  <para><filename>/usr/lib/systemd/systemd-update-utmp</filename></para>
> +-        </refsynopsisdiv>
> +-
> +-        <refsect1>
> +-                <title>Description</title>
> +-
> +-
>  <para><filename>systemd-update-utmp-runlevel.service</filename>
> +-                is a service that writes SysV runlevel changes to utmp
> +-                and wtmp, as well as the audit logs, as they
> +-                occur.
> <filename>systemd-update-utmp-shutdown.service</filename>
> +-                does the same for shut-down requests.</para>
> +-        </refsect1>
> +-
> +-        <refsect1>
> +-                <title>See Also</title>
> +-                <para>
> +-
>  <citerefentry><refentrytitle>systemd</refentrytitle><manvolnum>1</manvol=
num></citerefentry>,
> +-
>  <citerefentry><refentrytitle>utmp</refentrytitle><manvolnum>5</manvolnum=
></citerefentry>,
> +-
>  <citerefentry><refentrytitle>auditd</refentrytitle><manvolnum>8</manvoln=
um></citerefentry>
> +-                </para>
> +-        </refsect1>
> +-
> +-</refentry>
> +diff --git a/man/systemd-update-utmp.service.xml
> b/man/systemd-update-utmp.service.xml
> +new file mode 100644
> +index 0000000..846fc95
> +--- /dev/null
> ++++ b/man/systemd-update-utmp.service.xml
> +@@ -0,0 +1,76 @@
> ++<?xml version=3D"1.0"?>
> ++<!--*-nxml-*-->
> ++<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "
> http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">
> ++<!--
> ++  This file is part of systemd.
> ++
> ++  Copyright 2012 Lennart Poettering
> ++
> ++  systemd is free software; you can redistribute it and/or modify it
> ++  under the terms of the GNU Lesser General Public License as published
> by
> ++  the Free Software Foundation; either version 2.1 of the License, or
> ++  (at your option) any later version.
> ++
> ++  systemd is distributed in the hope that it will be useful, but
> ++  WITHOUT ANY WARRANTY; without even the implied warranty of
> ++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
> ++  Lesser General Public License for more details.
> ++
> ++  You should have received a copy of the GNU Lesser General Public
> License
> ++  along with systemd; If not, see <http://www.gnu.org/licenses/>.
> ++-->
> ++<refentry id=3D"systemd-update-utmp.service">
> ++
> ++        <refentryinfo>
> ++                <title>systemd-update-utmp.service</title>
> ++                <productname>systemd</productname>
> ++
> ++                <authorgroup>
> ++                        <author>
> ++                                <contrib>Developer</contrib>
> ++                                <firstname>Lennart</firstname>
> ++                                <surname>Poettering</surname>
> ++                                <email>lennart@poettering.net</email>
> ++                        </author>
> ++                </authorgroup>
> ++        </refentryinfo>
> ++
> ++        <refmeta>
> ++
>  <refentrytitle>systemd-update-utmp.service</refentrytitle>
> ++                <manvolnum>8</manvolnum>
> ++        </refmeta>
> ++
> ++        <refnamediv>
> ++                <refname>systemd-update-utmp.service</refname>
> ++                <refname>systemd-update-utmp-runlevel.service</refname>
> ++                <refname>systemd-update-utmp</refname>
> ++                <refpurpose>Write audit and utmp updates at bootup,
> runlevel
> ++                changes and shutdown</refpurpose>
> ++        </refnamediv>
> ++
> ++        <refsynopsisdiv>
> ++
>  <para><filename>systemd-update-utmp.service</filename></para>
> ++
>  <para><filename>systemd-update-utmp-runlevel.service</filename></para>
> ++
>  <para><filename>/usr/lib/systemd/systemd-update-utmp</filename></para>
> ++        </refsynopsisdiv>
> ++
> ++        <refsect1>
> ++                <title>Description</title>
> ++
> ++
>  <para><filename>systemd-update-utmp-runlevel.service</filename>
> ++                is a service that writes SysV runlevel changes to utmp
> ++                and wtmp, as well as the audit logs, as they
> ++                occur. <filename>systemd-update-utmp.service</filename>
> ++                does the same for system reboots and shut-down
> requests.</para>
> ++        </refsect1>
> ++
> ++        <refsect1>
> ++                <title>See Also</title>
> ++                <para>
> ++
>  <citerefentry><refentrytitle>systemd</refentrytitle><manvolnum>1</manvol=
num></citerefentry>,
> ++
>  <citerefentry><refentrytitle>utmp</refentrytitle><manvolnum>5</manvolnum=
></citerefentry>,
> ++
>  <citerefentry><refentrytitle>auditd</refentrytitle><manvolnum>8</manvoln=
um></citerefentry>
> ++                </para>
> ++        </refsect1>
> ++
> ++</refentry>
> +diff --git a/src/update-utmp/update-utmp.c b/src/update-utmp/update-utmp=
.c
> +index 9184025..202aa98 100644
> +--- a/src/update-utmp/update-utmp.c
> ++++ b/src/update-utmp/update-utmp.c
> +@@ -104,7 +104,7 @@ static int get_current_runlevel(Context *c) {
> +                 { '3', SPECIAL_RUNLEVEL3_TARGET },
> +                 { '4', SPECIAL_RUNLEVEL4_TARGET },
> +                 { '2', SPECIAL_RUNLEVEL2_TARGET },
> +-                { 'S', SPECIAL_RESCUE_TARGET },
> ++                { '1', SPECIAL_RESCUE_TARGET },
> +         };
> +         const char
> +                 *interface =3D "org.freedesktop.systemd1.Unit",
> +diff --git a/units/systemd-update-utmp-runlevel.service.in b/units/
> systemd-update-utmp-runlevel.service.in
> +index 27fae2c..99783e2 100644
> +--- a/units/systemd-update-utmp-runlevel.service.in
> ++++ b/units/systemd-update-utmp-runlevel.service.in
> +@@ -7,12 +7,14 @@
> +
> + [Unit]
> + Description=3DUpdate UTMP about System Runlevel Changes
> +-Documentation=3Dman:systemd-update-utmp-runlevel.service(8) man:utmp(5)
> ++Documentation=3Dman:systemd-update-utmp.service(8) man:utmp(5)
> + DefaultDependencies=3Dno
> + RequiresMountsFor=3D/var/log/wtmp
> +-After=3Dsystemd-remount-fs.service systemd-tmpfiles-setup.service
> auditd.service
> ++Conflicts=3Dshutdown.target
> ++Requisite=3Dsystemd-update-utmp.service
> ++After=3Dsystemd-update-utmp.service
> + After=3Drunlevel1.target runlevel2.target runlevel3.target
> runlevel4.target runlevel5.target
> +-Before=3Dfinal.target
> ++Before=3Dshutdown.target
> +
> + [Service]
> + Type=3Doneshot
> +diff --git a/units/systemd-update-utmp-shutdown.service.in b/units/
> systemd-update-utmp-shutdown.service.in
> +deleted file mode 100644
> +index aa93562..0000000
> +--- a/units/systemd-update-utmp-shutdown.service.in
> ++++ /dev/null
> +@@ -1,19 +0,0 @@
> +-#  This file is part of systemd.
> +-#
> +-#  systemd is free software; you can redistribute it and/or modify it
> +-#  under the terms of the GNU Lesser General Public License as publishe=
d
> by
> +-#  the Free Software Foundation; either version 2.1 of the License, or
> +-#  (at your option) any later version.
> +-
> +-[Unit]
> +-Description=3DUpdate UTMP about System Shutdown
> +-Documentation=3Dman:systemd-update-utmp-runlevel.service(8) man:utmp(5)
> +-DefaultDependencies=3Dno
> +-RequiresMountsFor=3D/var/log/wtmp
> +-After=3Dsystemd-remount-fs.service systemd-tmpfiles-setup.service
> auditd.service
> +-After=3Dsystemd-update-utmp-runlevel.service
> +-Before=3Dfinal.target
> +-
> +-[Service]
> +-Type=3Doneshot
> +-ExecStart=3D@rootlibexecdir@/systemd-update-utmp shutdown
> +diff --git a/units/systemd-update-utmp.service.in b/units/
> systemd-update-utmp.service.in
> +new file mode 100644
> +index 0000000..e7c20a5
> +--- /dev/null
> ++++ b/units/systemd-update-utmp.service.in
> +@@ -0,0 +1,21 @@
> ++#  This file is part of systemd.
> ++#
> ++#  systemd is free software; you can redistribute it and/or modify it
> ++#  under the terms of the GNU Lesser General Public License as publishe=
d
> by
> ++#  the Free Software Foundation; either version 2.1 of the License, or
> ++#  (at your option) any later version.
> ++
> ++[Unit]
> ++Description=3DUpdate UTMP about System Reboot/Shutdown
> ++Documentation=3Dman:systemd-update-utmp.service(8) man:utmp(5)
> ++DefaultDependencies=3Dno
> ++RequiresMountsFor=3D/var/log/wtmp
> ++Conflicts=3Dshutdown.target
> ++After=3Dsystemd-readahead-collect.service systemd-readahead-replay.serv=
ice
> systemd-remount-fs.service systemd-tmpfiles-setup.service auditd.service
> ++Before=3Dsysinit.target shutdown.target
> ++
> ++[Service]
> ++Type=3Doneshot
> ++RemainAfterExit=3Dyes
> ++ExecStart=3D@rootlibexecdir@/systemd-update-utmp reboot
> ++ExecStop=3D@rootlibexecdir@/systemd-update-utmp shutdown
> +--
> +1.8.2.3
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-medi=
a.patch
> b/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-medi=
a.patch
> deleted file mode 100644
> index d57a01c..0000000
> ---
> a/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-medi=
a.patch
> +++ /dev/null
> @@ -1,142 +0,0 @@
> -Upstream-Status: Backport
> -
> --Khem 2013/03/28
> -
> -From 94243ef299425d6c7089a7a05c48c9bb8f6cf3da Mon Sep 17 00:00:00 2001
> -From: Auke Kok <auke-jan.h.kok@intel.com>
> -Date: Fri, 22 Mar 2013 15:09:45 -0700
> -Subject: [PATCH 02/17] readahead: chunk on spinning media
> -
> -Readahead has all sorts of bad side effects depending on your
> -storage media. On rotating disks, it may be degrading startup
> -performance if enough requests are queued spanning linearly
> -over all blocks early at boot, and mount, blkid and friends
> -want to insert reads to the start of these block devices after.
> -
> -The end result is that on spinning disks with ext3/4 that udev
> -and mounts take a very long time, and nothing really happens until
> -readahead is completely finished.
> -
> -This has the net effect that the CPU is almost entirely idle
> -for the entire period that readahead is working. We could have
> -finished starting up quite a lot of services in this time if
> -we were smarter at how we do readahead.
> -
> -This patch sorts all requests into 2 second "chunks" and sub-sorts
> -each chunk by block. This adds a single cross-drive seek per "chunk"
> -but has the benefit that we will have a lot of the blocks we need
> -early on in the boot sequence loaded into memory faster.
> -
> -For a comparison of how before/after bootcharts look (ext4 on a
> -mobile 5400rpm 250GB drive) please look at:
> -
> -    http://foo-projects.org/~sofar/blocked-tests/
> -
> -There are bootcharts in the "before" and "after" folders where you
> -should be able to see that many low-level services finish 5-7
> -seconds earlier with the patch applied (after).
> ----
> - Makefile.am                       |    2 +-
> - src/readahead/readahead-collect.c |   28 +++++++++++++++++++++++++---
> - 2 files changed, 26 insertions(+), 4 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 37c1cc2..5861976 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES =3D \
> - systemd_readahead_LDADD =3D \
> -       libsystemd-shared.la \
> -       libsystemd-daemon.la \
> --      libudev.la
> -+      libudev.la -lm
> -
> - dist_doc_DATA +=3D \
> -       src/readahead/sd-readahead.c \
> -diff --git a/src/readahead/readahead-collect.c
> b/src/readahead/readahead-collect.c
> -index 5d07f47..5d22949 100644
> ---- a/src/readahead/readahead-collect.c
> -+++ b/src/readahead/readahead-collect.c
> -@@ -42,6 +42,7 @@
> - #include <sys/vfs.h>
> - #include <getopt.h>
> - #include <sys/inotify.h>
> -+#include <math.h>
> -
> - #ifdef HAVE_FANOTIFY_INIT
> - #include <sys/fanotify.h>
> -@@ -67,6 +68,7 @@
> -  */
> -
> - static ReadaheadShared *shared =3D NULL;
> -+static struct timespec starttime;
> -
> - /* Avoid collisions with the NULL pointer */
> - #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)
> -@@ -205,6 +207,7 @@ static unsigned long fd_first_block(int fd) {
> - struct item {
> -         const char *path;
> -         unsigned long block;
> -+        unsigned long bin;
> - };
> -
> - static int qsort_compare(const void *a, const void *b) {
> -@@ -213,6 +216,13 @@ static int qsort_compare(const void *a, const void
> *b) {
> -         i =3D a;
> -         j =3D b;
> -
> -+        /* sort by bin first */
> -+        if (i->bin < j->bin)
> -+                return -1;
> -+        if (i->bin > j->bin)
> -+                return 1;
> -+
> -+        /* then sort by sector */
> -         if (i->block < j->block)
> -                 return -1;
> -         if (i->block > j->block)
> -@@ -250,6 +260,8 @@ static int collect(const char *root) {
> -                 goto finish;
> -         }
> -
> -+        clock_gettime(CLOCK_MONOTONIC, &starttime);
> -+
> -         /* If there's no pack file yet we lower the kernel readahead
> -          * so that mincore() is accurate. If there is a pack file
> -          * already we assume it is accurate enough so that kernel
> -@@ -447,10 +459,21 @@ static int collect(const char *root) {
> -                                         free(p);
> -                                 else {
> -                                         unsigned long ul;
> -+                                        struct timespec ts;
> -+                                        struct item *entry;
> -+
> -+                                        entry =3D new0(struct item, 1);
> -
> -                                         ul =3D fd_first_block(m->fd);
> -
> --                                        if ((k =3D hashmap_put(files, p=
,
> SECTOR_TO_PTR(ul))) < 0) {
> -+                                        clock_gettime(CLOCK_MONOTONIC,
> &ts);
> -+
> -+                                        entry->block =3D ul;
> -+                                        entry->path =3D strdup(p);
> -+                                        entry->bin =3D round((ts.tv_sec=
 -
> starttime.tv_sec +
> -+                                                     ((ts.tv_nsec -
> starttime.tv_nsec) / 1000000000.0)) / 2.0);
> -+
> -+                                        if ((k =3D hashmap_put(files, p=
,
> entry)) < 0) {
> -                                                 log_warning("set_put()
> failed: %s", strerror(-k));
> -                                                 free(p);
> -                                         }
> -@@ -518,8 +541,7 @@ done:
> -
> -                 j =3D ordered;
> -                 HASHMAP_FOREACH_KEY(q, p, files, i) {
> --                        j->path =3D p;
> --                        j->block =3D PTR_TO_SECTOR(q);
> -+                        memcpy(j, q, sizeof(struct item));
> -                         j++;
> -                 }
> -
> ---
> -1.7.9.5
> -
> diff --git
> a/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
> b/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
> deleted file mode 100644
> index e0b68df..0000000
> --- a/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -Upstream-Status: Backport
> -
> --Khem 2013/03/28
> -
> -From b0640287f784a320661f7206c9ade07b99003fd5 Mon Sep 17 00:00:00 2001
> -From: Auke Kok <auke-jan.h.kok@intel.com>
> -Date: Tue, 26 Mar 2013 11:13:47 -0700
> -Subject: [PATCH 03/17] readahead: cleanups
> -
> -- check for OOM
> -- no need to use floats and round()
> ----
> - Makefile.am                       |    2 +-
> - src/readahead/readahead-collect.c |   20 ++++++++++++++------
> - 2 files changed, 15 insertions(+), 7 deletions(-)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 5861976..37c1cc2 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES =3D \
> - systemd_readahead_LDADD =3D \
> -       libsystemd-shared.la \
> -       libsystemd-daemon.la \
> --      libudev.la -lm
> -+      libudev.la
> -
> - dist_doc_DATA +=3D \
> -       src/readahead/sd-readahead.c \
> -diff --git a/src/readahead/readahead-collect.c
> b/src/readahead/readahead-collect.c
> -index 5d22949..e2fd8df 100644
> ---- a/src/readahead/readahead-collect.c
> -+++ b/src/readahead/readahead-collect.c
> -@@ -68,7 +68,7 @@
> -  */
> -
> - static ReadaheadShared *shared =3D NULL;
> --static struct timespec starttime;
> -+static usec_t starttime;
> -
> - /* Avoid collisions with the NULL pointer */
> - #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)
> -@@ -260,7 +260,7 @@ static int collect(const char *root) {
> -                 goto finish;
> -         }
> -
> --        clock_gettime(CLOCK_MONOTONIC, &starttime);
> -+        starttime =3D now(CLOCK_MONOTONIC);
> -
> -         /* If there's no pack file yet we lower the kernel readahead
> -          * so that mincore() is accurate. If there is a pack file
> -@@ -459,19 +459,27 @@ static int collect(const char *root) {
> -                                         free(p);
> -                                 else {
> -                                         unsigned long ul;
> --                                        struct timespec ts;
> -+                                        usec_t entrytime;
> -                                         struct item *entry;
> -
> -                                         entry =3D new0(struct item, 1);
> -+                                        if (!entry) {
> -+                                                r =3D log_oom();
> -+                                                goto finish;
> -+                                        }
> -
> -                                         ul =3D fd_first_block(m->fd);
> -
> --                                        clock_gettime(CLOCK_MONOTONIC,
> &ts);
> -+                                        entrytime =3D now(CLOCK_MONOTON=
IC);
> -
> -                                         entry->block =3D ul;
> -                                         entry->path =3D strdup(p);
> --                                        entry->bin =3D round((ts.tv_sec=
 -
> starttime.tv_sec +
> --                                                     ((ts.tv_nsec -
> starttime.tv_nsec) / 1000000000.0)) / 2.0);
> -+                                        if (!entry->path) {
> -+                                                free(entry);
> -+                                                r =3D log_oom();
> -+                                                goto finish;
> -+                                        }
> -+                                        entry->bin =3D (entrytime -
> starttime) / 2000000;
> -
> -                                         if ((k =3D hashmap_put(files, p=
,
> entry)) < 0) {
> -                                                 log_warning("set_put()
> failed: %s", strerror(-k));
> ---
> -1.7.9.5
> -
> diff --git
> a/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-et=
c-sysctl.conf-proper.patch
> b/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-et=
c-sysctl.conf-proper.patch
> deleted file mode 100644
> index f2c8e02..0000000
> ---
> a/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-et=
c-sysctl.conf-proper.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -Upstream-Status: Backport
> -
> --Khem 2013/03/28
> -
> -From 6f6fad96addf6b00b55c98cc0d0d8026b0c1e7ca Mon Sep 17 00:00:00 2001
> -From: Eelco Dolstra <eelco.dolstra@logicblox.com>
> -Date: Wed, 27 Mar 2013 13:41:59 +0100
> -Subject: [PATCH 13/17] systemd-sysctl: Handle missing /etc/sysctl.conf
> - properly
> -
> -Since fabe5c0e5fce730aa66e10a9c4f9fdd443d7aeda, systemd-sysctl returns
> -a non-zero exit code if /etc/sysctl.conf does not exist, due to a
> -broken ENOENT check.
> ----
> - src/sysctl/sysctl.c |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/sysctl/sysctl.c b/src/sysctl/sysctl.c
> -index 2d43660..79f3f77 100644
> ---- a/src/sysctl/sysctl.c
> -+++ b/src/sysctl/sysctl.c
> -@@ -125,7 +125,7 @@ static int parse_file(Hashmap *sysctl_options, const
> char *path, bool ignore_eno
> -
> -         r =3D search_and_fopen_nulstr(path, "re", conf_file_dirs, &f);
> -         if (r < 0) {
> --                if (ignore_enoent && errno =3D=3D -ENOENT)
> -+                if (ignore_enoent && r =3D=3D -ENOENT)
> -                         return 0;
> -
> -                 log_error("Failed to open file '%s', ignoring: %s",
> path, strerror(-r));
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-core/systemd/systemd/199-firmware.patch
> b/meta/recipes-core/systemd/systemd/199-firmware.patch
> deleted file mode 100644
> index aaab59b..0000000
> --- a/meta/recipes-core/systemd/systemd/199-firmware.patch
> +++ /dev/null
> @@ -1,98 +0,0 @@
> -Upstream-Status: Backport
> -
> http://cgit.freedesktop.org/systemd/systemd/patch/?id=3Dd8d4bee76cf3b40ea=
923bc57d44aa0815ca9b5ff
> -
> -From d8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff Mon Sep 17 00:00:00 2001
> -From: Kay Sievers <kay@vrfy.org>
> -Date: Thu, 28 Mar 2013 14:28:10 +0000
> -Subject: build-sys: fix HAVE/ENABLE_FIRMWARE
> -
> -https://bugs.freedesktop.org/show_bug.cgi?id=3D62864
> ----
> -diff --git a/configure.ac b/configure.ac
> -index 5b88bcf..e73cd5c 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -728,6 +728,7 @@ for i in $with_firmware_path; do
> - done
> - IFS=3D$OLD_IFS
> - AC_SUBST(FIRMWARE_PATH)
> -+AS_IF([test "x${FIRMWARE_PATH}" !=3D "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1=
,
> [Define if FIRMWARE is available]) ])
> - AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" !=3D "x"])
> -
> - #
> -------------------------------------------------------------------------=
-----
> -@@ -736,7 +737,6 @@ AC_ARG_ENABLE([gudev],
> -        [], [enable_gudev=3Dyes])
> - AS_IF([test "x$enable_gudev" =3D "xyes"], [ PKG_CHECK_MODULES([GLIB],
> [glib-2.0 >=3D 2.22.0 gobject-2.0 >=3D 2.22.0 gio-2.0]) ])
> - AM_CONDITIONAL([ENABLE_GUDEV], [test "x$enable_gudev" =3D "xyes"])
> --
> - AS_IF([test "x$enable_gudev" =3D "xyes"], [ AC_DEFINE(HAVE_GLIB, 1,
> [Define if glib is available]) ])
> -
> - #
> -------------------------------------------------------------------------=
-----
> -diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
> -index 13922d3..c7d4319 100644
> ---- a/src/udev/udev-builtin.c
> -+++ b/src/udev/udev-builtin.c
> -@@ -34,7 +34,7 @@ static const struct udev_builtin *builtins[] =3D {
> -         [UDEV_BUILTIN_BLKID] =3D &udev_builtin_blkid,
> - #endif
> -         [UDEV_BUILTIN_BTRFS] =3D &udev_builtin_btrfs,
> --#ifdef ENABLE_FIRMWARE
> -+#ifdef HAVE_FIRMWARE
> -         [UDEV_BUILTIN_FIRMWARE] =3D &udev_builtin_firmware,
> - #endif
> -         [UDEV_BUILTIN_HWDB] =3D &udev_builtin_hwdb,
> -diff --git a/src/udev/udev.h b/src/udev/udev.h
> -index aa2edbe..906dfba 100644
> ---- a/src/udev/udev.h
> -+++ b/src/udev/udev.h
> -@@ -140,7 +140,7 @@ enum udev_builtin_cmd {
> -         UDEV_BUILTIN_BLKID,
> - #endif
> -         UDEV_BUILTIN_BTRFS,
> --#ifdef ENABLE_FIRMWARE
> -+#ifdef HAVE_FIRMWARE
> -         UDEV_BUILTIN_FIRMWARE,
> - #endif
> -         UDEV_BUILTIN_HWDB,
> -@@ -169,7 +169,7 @@ struct udev_builtin {
> - extern const struct udev_builtin udev_builtin_blkid;
> - #endif
> - extern const struct udev_builtin udev_builtin_btrfs;
> --#ifdef ENABLE_FIRMWARE
> -+#ifdef HAVE_FIRMWARE
> - extern const struct udev_builtin udev_builtin_firmware;
> - #endif
> - extern const struct udev_builtin udev_builtin_hwdb;
> -diff --git a/src/udev/udevd.c b/src/udev/udevd.c
> -index b30bedf..2ad7388 100644
> ---- a/src/udev/udevd.c
> -+++ b/src/udev/udevd.c
> -@@ -98,7 +98,7 @@ struct event {
> -         dev_t devnum;
> -         int ifindex;
> -         bool is_block;
> --#ifdef ENABLE_FIRMWARE
> -+#ifdef HAVE_FIRMWARE
> -         bool nodelay;
> - #endif
> - };
> -@@ -444,7 +444,7 @@ static int event_queue_insert(struct udev_device *de=
v)
> -         event->devnum =3D udev_device_get_devnum(dev);
> -         event->is_block =3D streq("block", udev_device_get_subsystem(de=
v));
> -         event->ifindex =3D udev_device_get_ifindex(dev);
> --#ifdef ENABLE_FIRMWARE
> -+#ifdef HAVE_FIRMWARE
> -         if (streq(udev_device_get_subsystem(dev), "firmware"))
> -                 event->nodelay =3D true;
> - #endif
> -@@ -527,7 +527,7 @@ static bool is_devpath_busy(struct event *event)
> -                         return true;
> -                 }
> -
> --#ifdef ENABLE_FIRMWARE
> -+#ifdef HAVE_FIRMWARE
> -                 /* allow to bypass the dependency tracking */
> -                 if (event->nodelay)
> -                         continue;
> ---
> -cgit v0.9.0.2-2-gbebe
> diff --git a/meta/recipes-core/systemd/systemd_199.bbb/meta/recipes-core/=
systemd/
> systemd_204.bb
> similarity index 95%
> rename from meta/recipes-core/systemd/systemd_199.bb
> rename to meta/recipes-core/systemd/systemd_204.bb
> index b1cc046..8536b2b 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_204.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa882bbe \
>  PROVIDES =3D "udev"
>
>  PE =3D "1"
> -PR =3D "r4"
>
>  DEPENDS =3D "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-nati=
ve
> acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-native"
>  DEPENDS +=3D "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d=
)}"
> @@ -23,16 +22,12 @@ SRC_URI =3D "
> http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>             file://modprobe.rules \
>             file://var-run.conf \
>             ${UCLIBCPATCHES} \
> +
> file://0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch \
>             file://00-create-volatile.conf \
> -           file://0002-readahead-chunk-on-spinning-media.patch \
> -           file://0003-readahead-cleanups.patch \
> -
> file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch \
> -
> file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch \
> -           file://199-firmware.patch \
>             file://init \
>            "
> -SRC_URI[md5sum] =3D "4bb13f84ce211e93f0141774a90a2322"
> -SRC_URI[sha256sum] =3D
> "8c4462a04f3ecf7f083782e5e0687913b1d33c6444bf20fa2f31df9222965fed"
> +SRC_URI[md5sum] =3D "a07619bb19f48164fbf0761d12fd39a8"
> +SRC_URI[sha256sum] =3D
> "072c393503c7c1e55ca7acf3db659cbd28c7fe5fa94fab3db95360bafd96731b"
>
>  UCLIBCPATCHES =3D ""
>  UCLIBCPATCHES_libc-uclibc =3D
> "file://systemd-pam-configure-check-uclibc.patch \
> --
> 1.8.2.3
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b47249a95454304dd5e758e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=A0<div><br></div><div>I&#39;d like util-linux added to=
 DEPENDS to avoid the issue described in=A0<a href=3D"http://lists.openembe=
dded.org/pipermail/openembedded-core/2013-May/078641.html">http://lists.ope=
nembedded.org/pipermail/openembedded-core/2013-May/078641.html</a>=A0.</div=
>
<div><br></div><div>Most of the times util-linux seems to be staged in sysr=
oot due to other dependencies, but I guess this is sort of a race situation=
 where it&#39;s not guaranteed to be there.=A0</div><div><br></div><div>Che=
ers,=A0</div>
<div>Erik Bot=F6<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_=
quote">On Thu, May 23, 2013 at 2:59 AM, Jonathan Liu <span dir=3D"ltr">&lt;=
<a href=3D"mailto:net147@gmail.com" target=3D"_blank">net147@gmail.com</a>&=
gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Removed patches integrated upstream.<br>
Added backport of fix for utmp not running at shutdown.<br>
Updated serial-getty service.<br>
<br>
Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@=
gmail.com</a>&gt;<br>
---<br>
=A0.../systemd-serialgetty/serial-getty@.service =A0 =A0 =A0| =A016 +-<br>
=A0...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch | =A041 ---<br>
=A0...ystemd-update-utmp-shutdown.service-into-.patch | 367 +++++++++++++++=
++++++<br>
=A0.../0002-readahead-chunk-on-spinning-media.patch =A0 | 142 --------<br>
=A0.../systemd/systemd/0003-readahead-cleanups.patch =A0| =A086 -----<br>
=A0...ctl-Handle-missing-etc-sysctl.conf-proper.patch | =A033 --<br>
=A0.../systemd/systemd/199-firmware.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A098 -=
-----<br>
=A0.../systemd/{<a href=3D"http://systemd_199.bb" target=3D"_blank">systemd=
_199.bb</a> =3D&gt; <a href=3D"http://systemd_204.bb" target=3D"_blank">sys=
temd_204.bb</a>} =A0 =A0 | =A011 +-<br>
=A08 files changed, 380 insertions(+), 414 deletions(-)<br>
=A0delete mode 100644 meta/recipes-core/systemd/systemd/0001-configure-use-=
AC_CHECK_TOOL-for-objcopy-strings-and-.patch<br>
=A0create mode 100644 meta/recipes-core/systemd/systemd/0001-utmp-turn-syst=
emd-update-utmp-shutdown.service-into-.patch<br>
=A0delete mode 100644 meta/recipes-core/systemd/systemd/0002-readahead-chun=
k-on-spinning-media.patch<br>
=A0delete mode 100644 meta/recipes-core/systemd/systemd/0003-readahead-clea=
nups.patch<br>
=A0delete mode 100644 meta/recipes-core/systemd/systemd/0013-systemd-sysctl=
-Handle-missing-etc-sysctl.conf-proper.patch<br>
=A0delete mode 100644 meta/recipes-core/systemd/systemd/199-firmware.patch<=
br>
=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_199.bb" targ=
et=3D"_blank">systemd_199.bb</a> =3D&gt; <a href=3D"http://systemd_204.bb" =
target=3D"_blank">systemd_204.bb</a>} (95%)<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.se=
rvice b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service=
<br>
index 8eeaab6..1c14dfe 100644<br>
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service<b=
r>
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service<b=
r>
@@ -1,23 +1,27 @@<br>
=A0# =A0This file is part of systemd.<br>
=A0#<br>
=A0# =A0systemd is free software; you can redistribute it and/or modify it<=
br>
-# =A0under the terms of the GNU General Public License as published by<br>
-# =A0the Free Software Foundation; either version 2 of the License, or<br>
+# =A0under the terms of the GNU Lesser General Public License as published=
 by<br>
+# =A0the Free Software Foundation; either version 2.1 of the License, or<b=
r>
=A0# =A0(at your option) any later version.<br>
<br>
=A0[Unit]<br>
=A0Description=3DSerial Getty on %I<br>
-BindTo=3Ddev-%i.device<br>
-After=3Ddev-%i.device systemd-user-sessions.service<br>
+Documentation=3Dman:agetty(8) man:systemd-getty-generator(8)<br>
+Documentation=3D<a href=3D"http://0pointer.de/blog/projects/serial-console=
.html" target=3D"_blank">http://0pointer.de/blog/projects/serial-console.ht=
ml</a><br>
+BindsTo=3Ddev-%i.device<br>
+After=3Ddev-%i.device systemd-user-sessions.service plymouth-quit-wait.ser=
vice<br>
+After=3Drc-local.service<br>
<br>
=A0# If additional gettys are spawned during boot then we should make<br>
=A0# sure that this is synchronized before getty.target, even though<br>
=A0# getty.target didn&#39;t actually pull it in.<br>
=A0Before=3Dgetty.target<br>
+IgnoreOnIsolate=3Dyes<br>
<br>
=A0[Service]<br>
-Environment=3DTERM=3Dvt100<br>
-ExecStart=3D-/sbin/agetty -s %I @BAUDRATE@<br>
+ExecStart=3D-/sbin/agetty -s %I @BAUDRATE@ vt102<br>
+Type=3Didle<br>
=A0Restart=3Dalways<br>
=A0RestartSec=3D0<br>
=A0UtmpIdentifier=3D%I<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_=
TOOL-for-objcopy-strings-and-.patch b/meta/recipes-core/systemd/systemd/000=
1-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch<br>
deleted file mode 100644<br>
index d847bbc..0000000<br>
--- a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-fo=
r-objcopy-strings-and-.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-From d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00 2001<br>
-From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">Martin.Ja=
nsa@gmail.com</a>&gt;<br>
-Date: Tue, 16 Apr 2013 14:20:41 +0200<br>
-Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings and gpe=
rf<br>
-<br>
-* using AC_PATH_TOOL does not allow to override it from shell environment<=
br>
- =A0which is useful when cross-compiling<br>
-* with external toolchain I have different HOST_PREFIX and HOST_SYS<br>
- =A0AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy<br>
- =A0which is available only as ${TARGET_PREFIX}objcopy then it tries<br>
- =A0objcopy without prefix which is found on host, but that objcopy<br>
- =A0does not work for !host (e.g. arm when building on x86) libs<br>
-<br>
-Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">=
Martin.Jansa@gmail.com</a>&gt;<br>
-Upstream-Status: Submitted<br>
-<a href=3D"http://lists.freedesktop.org/archives/systemd-devel/2013-April/=
010468.html" target=3D"_blank">http://lists.freedesktop.org/archives/system=
d-devel/2013-April/010468.html</a><br>
-<br>
----<br>
- <a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a> | 6 ++=
+---<br>
- 1 file changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" target=3D"_blank">configure.a=
c</a> b/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a><=
br>
-index 33b0ca9..519f1a9 100644<br>
---- a/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a><b=
r>
-+++ b/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a><b=
r>
-@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([1.31.1])<br>
- =A0 =A0AM_CONDITIONAL([HAVE_INTROSPECTION], [false])<br>
- =A0 =A0enable_introspection=3Dno])<br>
-<br>
--AC_PATH_TOOL(OBJCOPY, objcopy)<br>
--AC_PATH_TOOL(STRINGS, strings)<br>
--AC_PATH_TOOL(GPERF, gperf)<br>
-+AC_CHECK_TOOL(OBJCOPY, objcopy)<br>
-+AC_CHECK_TOOL(STRINGS, strings)<br>
-+AC_CHECK_TOOL(GPERF, gperf)<br>
- if test -z &quot;$GPERF&quot; ; then<br>
- =A0 =A0 =A0 =A0 AC_MSG_ERROR([*** gperf not found])<br>
- fi<br>
---<br>
-1.8.1.5<br>
-<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-updat=
e-utmp-shutdown.service-into-.patch b/meta/recipes-core/systemd/systemd/000=
1-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch<br>
new file mode 100644<br>
index 0000000..86fab97<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-=
shutdown.service-into-.patch<br>
@@ -0,0 +1,367 @@<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147=
@gmail.com</a>&gt;<br>
+<br>
+From 3f92e4b4b61042391bd44de4dceb18177df0dd57 Mon Sep 17 00:00:00 2001<br>
+From: Lennart Poettering &lt;<a href=3D"mailto:lennart@poettering.net">len=
nart@poettering.net</a>&gt;<br>
+Date: Thu, 16 May 2013 00:19:03 +0200<br>
+Subject: [PATCH] utmp: turn systemd-update-utmp-shutdown.service into a no=
rmal<br>
+ runtime service<br>
+<br>
+With this change systemd-update-utmp-shutdown.service is replaced by<br>
+systemd-update-utmp.service which is started at boot and stays around<br>
+until shutdown. This allows us to properly order the unit against both<br>
+/var/log and auditd.<br>
+<br>
+<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D853104" target=3D=
"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D853104</a><br>
+<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64365" target=3D=
"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D64365</a><br>
+---<br>
+ Makefile-man.am =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | 12 ++---<br>
+ Makefile.am =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A08 +--<br>
+ man/systemd-update-utmp-runlevel.service.xml =A0| 76 --------------------=
-------<br>
+ man/systemd-update-utmp.service.xml =A0 =A0 =A0 =A0 =A0 | 76 ++++++++++++=
+++++++++++++++<br>
+ src/update-utmp/update-utmp.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A02 +-<b=
r>
+ units/.gitignore =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A02 +-<br>
+ units/<a href=3D"http://systemd-update-utmp-runlevel.service.in" target=
=3D"_blank">systemd-update-utmp-runlevel.service.in</a> | =A08 +--<br>
+ units/<a href=3D"http://systemd-update-utmp-shutdown.service.in" target=
=3D"_blank">systemd-update-utmp-shutdown.service.in</a> | 19 -------<br>
+ units/<a href=3D"http://systemd-update-utmp.service.in" target=3D"_blank"=
>systemd-update-utmp.service.in</a> =A0 =A0 =A0 =A0 =A0| 21 ++++++++<br>
+ 9 files changed, 114 insertions(+), 110 deletions(-)<br>
+ delete mode 100644 man/systemd-update-utmp-runlevel.service.xml<br>
+ create mode 100644 man/systemd-update-utmp.service.xml<br>
+ delete mode 100644 units/<a href=3D"http://systemd-update-utmp-shutdown.s=
ervice.in" target=3D"_blank">systemd-update-utmp-shutdown.service.in</a><br=
>
+ create mode 100644 units/<a href=3D"http://systemd-update-utmp.service.in=
" target=3D"_blank">systemd-update-utmp.service.in</a><br>
+<br>
+diff --git a/Makefile-man.am b/Makefile-man.am<br>
+index 7d62094..5888158 100644<br>
+--- a/Makefile-man.am<br>
++++ b/Makefile-man.am<br>
+@@ -72,7 +72,7 @@ MANPAGES +=3D \<br>
+ =A0 =A0 =A0 man/systemd-tmpfiles.8 \<br>
+ =A0 =A0 =A0 man/systemd-tty-ask-password-agent.1 \<br>
+ =A0 =A0 =A0 man/systemd-udevd.service.8 \<br>
+- =A0 =A0 =A0man/systemd-update-utmp-runlevel.service.8 \<br>
++ =A0 =A0 =A0man/systemd-update-utmp.service.8 \<br>
+ =A0 =A0 =A0 man/systemd.1 \<br>
+ =A0 =A0 =A0 man/systemd.automount.5 \<br>
+ =A0 =A0 =A0 man/systemd.device.5 \<br>
+@@ -191,7 +191,7 @@ MANPAGES_ALIAS +=3D \<br>
+ =A0 =A0 =A0 man/systemd-udevd-control.socket.8 \<br>
+ =A0 =A0 =A0 man/systemd-udevd-kernel.socket.8 \<br>
+ =A0 =A0 =A0 man/systemd-udevd.8 \<br>
+- =A0 =A0 =A0man/systemd-update-utmp-shutdown.service.8 \<br>
++ =A0 =A0 =A0man/systemd-update-utmp-runlevel.service.8 \<br>
+ =A0 =A0 =A0 man/systemd-update-utmp.8 \<br>
+ =A0 =A0 =A0 man/systemd-user.conf.5<br>
+ man/SD_ALERT.3: man/sd-daemon.3<br>
+@@ -289,8 +289,8 @@ man/systemd-tmpfiles-setup.service.8: man/systemd-tmpf=
iles.8<br>
+ man/systemd-udevd-control.socket.8: man/systemd-udevd.service.8<br>
+ man/systemd-udevd-kernel.socket.8: man/systemd-udevd.service.8<br>
+ man/systemd-udevd.8: man/systemd-udevd.service.8<br>
+-man/systemd-update-utmp-shutdown.service.8: man/systemd-update-utmp-runle=
vel.service.8<br>
+-man/systemd-update-utmp.8: man/systemd-update-utmp-runlevel.service.8<br>
++man/systemd-update-utmp-runlevel.service.8: man/systemd-update-utmp.servi=
ce.8<br>
++man/systemd-update-utmp.8: man/systemd-update-utmp.service.8<br>
+ man/systemd-user.conf.5: man/systemd-system.conf.5<br>
+ man/SD_ALERT.html: man/sd-daemon.html<br>
+ =A0 =A0 =A0 $(html-alias)<br>
+@@ -577,10 +577,10 @@ man/systemd-udevd-kernel.socket.html: man/systemd-ud=
evd.service.html<br>
+ man/systemd-udevd.html: man/systemd-udevd.service.html<br>
+ =A0 =A0 =A0 $(html-alias)<br>
+<br>
+-man/systemd-update-utmp-shutdown.service.html: man/systemd-update-utmp-ru=
nlevel.service.html<br>
++man/systemd-update-utmp-runlevel.service.html: man/systemd-update-utmp.se=
rvice.html<br>
+ =A0 =A0 =A0 $(html-alias)<br>
+<br>
+-man/systemd-update-utmp.html: man/systemd-update-utmp-runlevel.service.ht=
ml<br>
++man/systemd-update-utmp.html: man/systemd-update-utmp.service.html<br>
+ =A0 =A0 =A0 $(html-alias)<br>
+<br>
+ man/systemd-user.conf.html: man/systemd-system.conf.html<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index 8d8139c..4c5e6fc 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -417,8 +417,8 @@ nodist_systemunit_DATA =3D \<br>
+ =A0 =A0 =A0 units/systemd-initctl.service \<br>
+ =A0 =A0 =A0 units/systemd-shutdownd.service \<br>
+ =A0 =A0 =A0 units/systemd-remount-fs.service \<br>
++ =A0 =A0 =A0units/systemd-update-utmp.service \<br>
+ =A0 =A0 =A0 units/systemd-update-utmp-runlevel.service \<br>
+- =A0 =A0 =A0units/systemd-update-utmp-shutdown.service \<br>
+ =A0 =A0 =A0 units/systemd-tmpfiles-setup-dev.service \<br>
+ =A0 =A0 =A0 units/systemd-tmpfiles-setup.service \<br>
+ =A0 =A0 =A0 units/systemd-tmpfiles-clean.service \<br>
+@@ -463,8 +463,8 @@ EXTRA_DIST +=3D \<br>
+ =A0 =A0 =A0 units/<a href=3D"http://systemd-initctl.service.in" target=3D=
"_blank">systemd-initctl.service.in</a> \<br>
+ =A0 =A0 =A0 units/<a href=3D"http://systemd-shutdownd.service.in" target=
=3D"_blank">systemd-shutdownd.service.in</a> \<br>
+ =A0 =A0 =A0 units/<a href=3D"http://systemd-remount-fs.service.in" target=
=3D"_blank">systemd-remount-fs.service.in</a> \<br>
++ =A0 =A0 =A0units/<a href=3D"http://systemd-update-utmp.service.in" targe=
t=3D"_blank">systemd-update-utmp.service.in</a> \<br>
+ =A0 =A0 =A0 units/<a href=3D"http://systemd-update-utmp-runlevel.service.=
in" target=3D"_blank">systemd-update-utmp-runlevel.service.in</a> \<br>
+- =A0 =A0 =A0units/<a href=3D"http://systemd-update-utmp-shutdown.service.=
in" target=3D"_blank">systemd-update-utmp-shutdown.service.in</a> \<br>
+ =A0 =A0 =A0 units/<a href=3D"http://systemd-tmpfiles-setup-dev.service.in=
" target=3D"_blank">systemd-tmpfiles-setup-dev.service.in</a> \<br>
+ =A0 =A0 =A0 units/<a href=3D"http://systemd-tmpfiles-setup.service.in" ta=
rget=3D"_blank">systemd-tmpfiles-setup.service.in</a> \<br>
+ =A0 =A0 =A0 units/<a href=3D"http://systemd-tmpfiles-clean.service.in" ta=
rget=3D"_blank">systemd-tmpfiles-clean.service.in</a> \<br>
+@@ -4070,8 +4070,8 @@ RUNLEVEL4_TARGET_WANTS +=3D \<br>
+ RUNLEVEL5_TARGET_WANTS +=3D \<br>
+ =A0 =A0 =A0 systemd-update-utmp-runlevel.service<br>
+ endif<br>
+-SHUTDOWN_TARGET_WANTS +=3D \<br>
+- =A0 =A0 =A0systemd-update-utmp-shutdown.service<br>
++SYSINIT_TARGET_WANTS +=3D \<br>
++ =A0 =A0 =A0systemd-update-utmp.service<br>
+ LOCAL_FS_TARGET_WANTS +=3D \<br>
+ =A0 =A0 =A0 systemd-remount-fs.service \<br>
+ =A0 =A0 =A0 systemd-fsck-root.service \<br>
+diff --git a/man/systemd-update-utmp-runlevel.service.xml b/man/systemd-up=
date-utmp-runlevel.service.xml<br>
+deleted file mode 100644<br>
+index 867b958..0000000<br>
+--- a/man/systemd-update-utmp-runlevel.service.xml<br>
++++ /dev/null<br>
+@@ -1,76 +0,0 @@<br>
+-&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
+-&lt;!--*-nxml-*--&gt;<br>
+-&lt;!DOCTYPE refentry PUBLIC &quot;-//OASIS//DTD DocBook XML V4.2//EN&quo=
t; &quot;<a href=3D"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"=
 target=3D"_blank">http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd</=
a>&quot;&gt;<br>

+-&lt;!--<br>
+- =A0This file is part of systemd.<br>
+-<br>
+- =A0Copyright 2012 Lennart Poettering<br>
+-<br>
+- =A0systemd is free software; you can redistribute it and/or modify it<br=
>
+- =A0under the terms of the GNU Lesser General Public License as published=
 by<br>
+- =A0the Free Software Foundation; either version 2.1 of the License, or<b=
r>
+- =A0(at your option) any later version.<br>
+-<br>
+- =A0systemd is distributed in the hope that it will be useful, but<br>
+- =A0WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+- =A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU<br>
+- =A0Lesser General Public License for more details.<br>
+-<br>
+- =A0You should have received a copy of the GNU Lesser General Public Lice=
nse<br>
+- =A0along with systemd; If not, see &lt;<a href=3D"http://www.gnu.org/lic=
enses/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
+---&gt;<br>
+-&lt;refentry id=3D&quot;systemd-update-utmp-runlevel.service&quot;&gt;<br=
>
+-<br>
+- =A0 =A0 =A0 =A0&lt;refentryinfo&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;title&gt;systemd-update-utmp-runlevel=
.service&lt;/title&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;productname&gt;systemd&lt;/productnam=
e&gt;<br>
+-<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;authorgroup&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;author&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;contr=
ib&gt;Developer&lt;/contrib&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;first=
name&gt;Lennart&lt;/firstname&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;surna=
me&gt;Poettering&lt;/surname&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;email=
&gt;<a href=3D"mailto:lennart@poettering.net">lennart@poettering.net</a>&lt=
;/email&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;/author&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;/authorgroup&gt;<br>
+- =A0 =A0 =A0 =A0&lt;/refentryinfo&gt;<br>
+-<br>
+- =A0 =A0 =A0 =A0&lt;refmeta&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;refentrytitle&gt;systemd-update-utmp-=
runlevel.service&lt;/refentrytitle&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;manvolnum&gt;8&lt;/manvolnum&gt;<br>
+- =A0 =A0 =A0 =A0&lt;/refmeta&gt;<br>
+-<br>
+- =A0 =A0 =A0 =A0&lt;refnamediv&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;refname&gt;systemd-update-utmp-runlev=
el.service&lt;/refname&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;refname&gt;systemd-update-utmp-shutdo=
wn.service&lt;/refname&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;refname&gt;systemd-update-utmp&lt;/re=
fname&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;refpurpose&gt;Write audit and utmp up=
dates at runlevel<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0changes and shutdown&lt;/refpurpose&gt;<b=
r>
+- =A0 =A0 =A0 =A0&lt;/refnamediv&gt;<br>
+-<br>
+- =A0 =A0 =A0 =A0&lt;refsynopsisdiv&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;para&gt;&lt;filename&gt;systemd-updat=
e-utmp-runlevel.service&lt;/filename&gt;&lt;/para&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;para&gt;&lt;filename&gt;systemd-updat=
e-utmp-shutdown.service&lt;/filename&gt;&lt;/para&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;para&gt;&lt;filename&gt;/usr/lib/syst=
emd/systemd-update-utmp&lt;/filename&gt;&lt;/para&gt;<br>
+- =A0 =A0 =A0 =A0&lt;/refsynopsisdiv&gt;<br>
+-<br>
+- =A0 =A0 =A0 =A0&lt;refsect1&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;title&gt;Description&lt;/title&gt;<br=
>
+-<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;para&gt;&lt;filename&gt;systemd-updat=
e-utmp-runlevel.service&lt;/filename&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0is a service that writes SysV runlevel ch=
anges to utmp<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0and wtmp, as well as the audit logs, as t=
hey<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0occur. &lt;filename&gt;systemd-update-utm=
p-shutdown.service&lt;/filename&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0does the same for shut-down requests.&lt;=
/para&gt;<br>
+- =A0 =A0 =A0 =A0&lt;/refsect1&gt;<br>
+-<br>
+- =A0 =A0 =A0 =A0&lt;refsect1&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;title&gt;See Also&lt;/title&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;para&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;citerefentry&gt;&lt;r=
efentrytitle&gt;systemd&lt;/refentrytitle&gt;&lt;manvolnum&gt;1&lt;/manvoln=
um&gt;&lt;/citerefentry&gt;,<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;citerefentry&gt;&lt;r=
efentrytitle&gt;utmp&lt;/refentrytitle&gt;&lt;manvolnum&gt;5&lt;/manvolnum&=
gt;&lt;/citerefentry&gt;,<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;citerefentry&gt;&lt;r=
efentrytitle&gt;auditd&lt;/refentrytitle&gt;&lt;manvolnum&gt;8&lt;/manvolnu=
m&gt;&lt;/citerefentry&gt;<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;/para&gt;<br>
+- =A0 =A0 =A0 =A0&lt;/refsect1&gt;<br>
+-<br>
+-&lt;/refentry&gt;<br>
+diff --git a/man/systemd-update-utmp.service.xml b/man/systemd-update-utmp=
.service.xml<br>
+new file mode 100644<br>
+index 0000000..846fc95<br>
+--- /dev/null<br>
++++ b/man/systemd-update-utmp.service.xml<br>
+@@ -0,0 +1,76 @@<br>
++&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
++&lt;!--*-nxml-*--&gt;<br>
++&lt;!DOCTYPE refentry PUBLIC &quot;-//OASIS//DTD DocBook XML V4.2//EN&quo=
t; &quot;<a href=3D"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"=
 target=3D"_blank">http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd</=
a>&quot;&gt;<br>

++&lt;!--<br>
++ =A0This file is part of systemd.<br>
++<br>
++ =A0Copyright 2012 Lennart Poettering<br>
++<br>
++ =A0systemd is free software; you can redistribute it and/or modify it<br=
>
++ =A0under the terms of the GNU Lesser General Public License as published=
 by<br>
++ =A0the Free Software Foundation; either version 2.1 of the License, or<b=
r>
++ =A0(at your option) any later version.<br>
++<br>
++ =A0systemd is distributed in the hope that it will be useful, but<br>
++ =A0WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ =A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU<br>
++ =A0Lesser General Public License for more details.<br>
++<br>
++ =A0You should have received a copy of the GNU Lesser General Public Lice=
nse<br>
++ =A0along with systemd; If not, see &lt;<a href=3D"http://www.gnu.org/lic=
enses/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
++--&gt;<br>
++&lt;refentry id=3D&quot;systemd-update-utmp.service&quot;&gt;<br>
++<br>
++ =A0 =A0 =A0 =A0&lt;refentryinfo&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;title&gt;systemd-update-utmp.service&=
lt;/title&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;productname&gt;systemd&lt;/productnam=
e&gt;<br>
++<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;authorgroup&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;author&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;contr=
ib&gt;Developer&lt;/contrib&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;first=
name&gt;Lennart&lt;/firstname&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;surna=
me&gt;Poettering&lt;/surname&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;email=
&gt;<a href=3D"mailto:lennart@poettering.net">lennart@poettering.net</a>&lt=
;/email&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;/author&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;/authorgroup&gt;<br>
++ =A0 =A0 =A0 =A0&lt;/refentryinfo&gt;<br>
++<br>
++ =A0 =A0 =A0 =A0&lt;refmeta&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;refentrytitle&gt;systemd-update-utmp.=
service&lt;/refentrytitle&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;manvolnum&gt;8&lt;/manvolnum&gt;<br>
++ =A0 =A0 =A0 =A0&lt;/refmeta&gt;<br>
++<br>
++ =A0 =A0 =A0 =A0&lt;refnamediv&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;refname&gt;systemd-update-utmp.servic=
e&lt;/refname&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;refname&gt;systemd-update-utmp-runlev=
el.service&lt;/refname&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;refname&gt;systemd-update-utmp&lt;/re=
fname&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;refpurpose&gt;Write audit and utmp up=
dates at bootup, runlevel<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0changes and shutdown&lt;/refpurpose&gt;<b=
r>
++ =A0 =A0 =A0 =A0&lt;/refnamediv&gt;<br>
++<br>
++ =A0 =A0 =A0 =A0&lt;refsynopsisdiv&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;para&gt;&lt;filename&gt;systemd-updat=
e-utmp.service&lt;/filename&gt;&lt;/para&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;para&gt;&lt;filename&gt;systemd-updat=
e-utmp-runlevel.service&lt;/filename&gt;&lt;/para&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;para&gt;&lt;filename&gt;/usr/lib/syst=
emd/systemd-update-utmp&lt;/filename&gt;&lt;/para&gt;<br>
++ =A0 =A0 =A0 =A0&lt;/refsynopsisdiv&gt;<br>
++<br>
++ =A0 =A0 =A0 =A0&lt;refsect1&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;title&gt;Description&lt;/title&gt;<br=
>
++<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;para&gt;&lt;filename&gt;systemd-updat=
e-utmp-runlevel.service&lt;/filename&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0is a service that writes SysV runlevel ch=
anges to utmp<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0and wtmp, as well as the audit logs, as t=
hey<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0occur. &lt;filename&gt;systemd-update-utm=
p.service&lt;/filename&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0does the same for system reboots and shut=
-down requests.&lt;/para&gt;<br>
++ =A0 =A0 =A0 =A0&lt;/refsect1&gt;<br>
++<br>
++ =A0 =A0 =A0 =A0&lt;refsect1&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;title&gt;See Also&lt;/title&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;para&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;citerefentry&gt;&lt;r=
efentrytitle&gt;systemd&lt;/refentrytitle&gt;&lt;manvolnum&gt;1&lt;/manvoln=
um&gt;&lt;/citerefentry&gt;,<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;citerefentry&gt;&lt;r=
efentrytitle&gt;utmp&lt;/refentrytitle&gt;&lt;manvolnum&gt;5&lt;/manvolnum&=
gt;&lt;/citerefentry&gt;,<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;citerefentry&gt;&lt;r=
efentrytitle&gt;auditd&lt;/refentrytitle&gt;&lt;manvolnum&gt;8&lt;/manvolnu=
m&gt;&lt;/citerefentry&gt;<br>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&lt;/para&gt;<br>
++ =A0 =A0 =A0 =A0&lt;/refsect1&gt;<br>
++<br>
++&lt;/refentry&gt;<br>
+diff --git a/src/update-utmp/update-utmp.c b/src/update-utmp/update-utmp.c=
<br>
+index 9184025..202aa98 100644<br>
+--- a/src/update-utmp/update-utmp.c<br>
++++ b/src/update-utmp/update-utmp.c<br>
+@@ -104,7 +104,7 @@ static int get_current_runlevel(Context *c) {<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 { &#39;3&#39;, SPECIAL_RUNLEVEL3_TARGET }=
,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 { &#39;4&#39;, SPECIAL_RUNLEVEL4_TARGET }=
,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 { &#39;2&#39;, SPECIAL_RUNLEVEL2_TARGET }=
,<br>
+- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{ &#39;S&#39;, SPECIAL_RESCUE_TARGET },<b=
r>
++ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0{ &#39;1&#39;, SPECIAL_RESCUE_TARGET },<b=
r>
+ =A0 =A0 =A0 =A0 };<br>
+ =A0 =A0 =A0 =A0 const char<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *interface =3D &quot;org.freedesktop.syst=
emd1.Unit&quot;,<br>
+diff --git a/units/<a href=3D"http://systemd-update-utmp-runlevel.service.=
in" target=3D"_blank">systemd-update-utmp-runlevel.service.in</a> b/units/<=
a href=3D"http://systemd-update-utmp-runlevel.service.in" target=3D"_blank"=
>systemd-update-utmp-runlevel.service.in</a><br>

+index 27fae2c..99783e2 100644<br>
+--- a/units/<a href=3D"http://systemd-update-utmp-runlevel.service.in" tar=
get=3D"_blank">systemd-update-utmp-runlevel.service.in</a><br>
++++ b/units/<a href=3D"http://systemd-update-utmp-runlevel.service.in" tar=
get=3D"_blank">systemd-update-utmp-runlevel.service.in</a><br>
+@@ -7,12 +7,14 @@<br>
+<br>
+ [Unit]<br>
+ Description=3DUpdate UTMP about System Runlevel Changes<br>
+-Documentation=3Dman:systemd-update-utmp-runlevel.service(8) man:utmp(5)<b=
r>
++Documentation=3Dman:systemd-update-utmp.service(8) man:utmp(5)<br>
+ DefaultDependencies=3Dno<br>
+ RequiresMountsFor=3D/var/log/wtmp<br>
+-After=3Dsystemd-remount-fs.service systemd-tmpfiles-setup.service auditd.=
service<br>
++Conflicts=3Dshutdown.target<br>
++Requisite=3Dsystemd-update-utmp.service<br>
++After=3Dsystemd-update-utmp.service<br>
+ After=3Drunlevel1.target runlevel2.target runlevel3.target runlevel4.targ=
et runlevel5.target<br>
+-Before=3Dfinal.target<br>
++Before=3Dshutdown.target<br>
+<br>
+ [Service]<br>
+ Type=3Doneshot<br>
+diff --git a/units/<a href=3D"http://systemd-update-utmp-shutdown.service.=
in" target=3D"_blank">systemd-update-utmp-shutdown.service.in</a> b/units/<=
a href=3D"http://systemd-update-utmp-shutdown.service.in" target=3D"_blank"=
>systemd-update-utmp-shutdown.service.in</a><br>

+deleted file mode 100644<br>
+index aa93562..0000000<br>
+--- a/units/<a href=3D"http://systemd-update-utmp-shutdown.service.in" tar=
get=3D"_blank">systemd-update-utmp-shutdown.service.in</a><br>
++++ /dev/null<br>
+@@ -1,19 +0,0 @@<br>
+-# =A0This file is part of systemd.<br>
+-#<br>
+-# =A0systemd is free software; you can redistribute it and/or modify it<b=
r>
+-# =A0under the terms of the GNU Lesser General Public License as publishe=
d by<br>
+-# =A0the Free Software Foundation; either version 2.1 of the License, or<=
br>
+-# =A0(at your option) any later version.<br>
+-<br>
+-[Unit]<br>
+-Description=3DUpdate UTMP about System Shutdown<br>
+-Documentation=3Dman:systemd-update-utmp-runlevel.service(8) man:utmp(5)<b=
r>
+-DefaultDependencies=3Dno<br>
+-RequiresMountsFor=3D/var/log/wtmp<br>
+-After=3Dsystemd-remount-fs.service systemd-tmpfiles-setup.service auditd.=
service<br>
+-After=3Dsystemd-update-utmp-runlevel.service<br>
+-Before=3Dfinal.target<br>
+-<br>
+-[Service]<br>
+-Type=3Doneshot<br>
+-ExecStart=3D@rootlibexecdir@/systemd-update-utmp shutdown<br>
+diff --git a/units/<a href=3D"http://systemd-update-utmp.service.in" targe=
t=3D"_blank">systemd-update-utmp.service.in</a> b/units/<a href=3D"http://s=
ystemd-update-utmp.service.in" target=3D"_blank">systemd-update-utmp.servic=
e.in</a><br>

+new file mode 100644<br>
+index 0000000..e7c20a5<br>
+--- /dev/null<br>
++++ b/units/<a href=3D"http://systemd-update-utmp.service.in" target=3D"_b=
lank">systemd-update-utmp.service.in</a><br>
+@@ -0,0 +1,21 @@<br>
++# =A0This file is part of systemd.<br>
++#<br>
++# =A0systemd is free software; you can redistribute it and/or modify it<b=
r>
++# =A0under the terms of the GNU Lesser General Public License as publishe=
d by<br>
++# =A0the Free Software Foundation; either version 2.1 of the License, or<=
br>
++# =A0(at your option) any later version.<br>
++<br>
++[Unit]<br>
++Description=3DUpdate UTMP about System Reboot/Shutdown<br>
++Documentation=3Dman:systemd-update-utmp.service(8) man:utmp(5)<br>
++DefaultDependencies=3Dno<br>
++RequiresMountsFor=3D/var/log/wtmp<br>
++Conflicts=3Dshutdown.target<br>
++After=3Dsystemd-readahead-collect.service systemd-readahead-replay.servic=
e systemd-remount-fs.service systemd-tmpfiles-setup.service auditd.service<=
br>
++Before=3Dsysinit.target shutdown.target<br>
++<br>
++[Service]<br>
++Type=3Doneshot<br>
++RemainAfterExit=3Dyes<br>
++ExecStart=3D@rootlibexecdir@/systemd-update-utmp reboot<br>
++ExecStop=3D@rootlibexecdir@/systemd-update-utmp shutdown<br>
+--<br>
+1.8.2.3<br>
+<br>
diff --git a/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spin=
ning-media.patch b/meta/recipes-core/systemd/systemd/0002-readahead-chunk-o=
n-spinning-media.patch<br>
deleted file mode 100644<br>
index d57a01c..0000000<br>
--- a/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-me=
dia.patch<br>
+++ /dev/null<br>
@@ -1,142 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
--Khem 2013/03/28<br>
-<br>
-From 94243ef299425d6c7089a7a05c48c9bb8f6cf3da Mon Sep 17 00:00:00 2001<br>
-From: Auke Kok &lt;<a href=3D"mailto:auke-jan.h.kok@intel.com">auke-jan.h.=
kok@intel.com</a>&gt;<br>
-Date: Fri, 22 Mar 2013 15:09:45 -0700<br>
-Subject: [PATCH 02/17] readahead: chunk on spinning media<br>
-<br>
-Readahead has all sorts of bad side effects depending on your<br>
-storage media. On rotating disks, it may be degrading startup<br>
-performance if enough requests are queued spanning linearly<br>
-over all blocks early at boot, and mount, blkid and friends<br>
-want to insert reads to the start of these block devices after.<br>
-<br>
-The end result is that on spinning disks with ext3/4 that udev<br>
-and mounts take a very long time, and nothing really happens until<br>
-readahead is completely finished.<br>
-<br>
-This has the net effect that the CPU is almost entirely idle<br>
-for the entire period that readahead is working. We could have<br>
-finished starting up quite a lot of services in this time if<br>
-we were smarter at how we do readahead.<br>
-<br>
-This patch sorts all requests into 2 second &quot;chunks&quot; and sub-sor=
ts<br>
-each chunk by block. This adds a single cross-drive seek per &quot;chunk&q=
uot;<br>
-but has the benefit that we will have a lot of the blocks we need<br>
-early on in the boot sequence loaded into memory faster.<br>
-<br>
-For a comparison of how before/after bootcharts look (ext4 on a<br>
-mobile 5400rpm 250GB drive) please look at:<br>
-<br>
- =A0 =A0<a href=3D"http://foo-projects.org/~sofar/blocked-tests/" target=
=3D"_blank">http://foo-projects.org/~sofar/blocked-tests/</a><br>
-<br>
-There are bootcharts in the &quot;before&quot; and &quot;after&quot; folde=
rs where you<br>
-should be able to see that many low-level services finish 5-7<br>
-seconds earlier with the patch applied (after).<br>
----<br>
- Makefile.am =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>
- src/readahead/readahead-collect.c | =A0 28 +++++++++++++++++++++++++---<b=
r>
- 2 files changed, 26 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/Makefile.am b/Makefile.am<br>
-index 37c1cc2..5861976 100644<br>
---- a/Makefile.am<br>
-+++ b/Makefile.am<br>
-@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES =3D \<br>
- systemd_readahead_LDADD =3D \<br>
- =A0 =A0 =A0 <a href=3D"http://libsystemd-shared.la" target=3D"_blank">lib=
systemd-shared.la</a> \<br>
- =A0 =A0 =A0 <a href=3D"http://libsystemd-daemon.la" target=3D"_blank">lib=
systemd-daemon.la</a> \<br>
-- =A0 =A0 =A0<a href=3D"http://libudev.la" target=3D"_blank">libudev.la</a=
><br>
-+ =A0 =A0 =A0<a href=3D"http://libudev.la" target=3D"_blank">libudev.la</a=
> -lm<br>
-<br>
- dist_doc_DATA +=3D \<br>
- =A0 =A0 =A0 src/readahead/sd-readahead.c \<br>
-diff --git a/src/readahead/readahead-collect.c b/src/readahead/readahead-c=
ollect.c<br>
-index 5d07f47..5d22949 100644<br>
---- a/src/readahead/readahead-collect.c<br>
-+++ b/src/readahead/readahead-collect.c<br>
-@@ -42,6 +42,7 @@<br>
- #include &lt;sys/vfs.h&gt;<br>
- #include &lt;getopt.h&gt;<br>
- #include &lt;sys/inotify.h&gt;<br>
-+#include &lt;math.h&gt;<br>
-<br>
- #ifdef HAVE_FANOTIFY_INIT<br>
- #include &lt;sys/fanotify.h&gt;<br>
-@@ -67,6 +68,7 @@<br>
- =A0*/<br>
-<br>
- static ReadaheadShared *shared =3D NULL;<br>
-+static struct timespec starttime;<br>
-<br>
- /* Avoid collisions with the NULL pointer */<br>
- #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)<br>
-@@ -205,6 +207,7 @@ static unsigned long fd_first_block(int fd) {<br>
- struct item {<br>
- =A0 =A0 =A0 =A0 const char *path;<br>
- =A0 =A0 =A0 =A0 unsigned long block;<br>
-+ =A0 =A0 =A0 =A0unsigned long bin;<br>
- };<br>
-<br>
- static int qsort_compare(const void *a, const void *b) {<br>
-@@ -213,6 +216,13 @@ static int qsort_compare(const void *a, const void *b=
) {<br>
- =A0 =A0 =A0 =A0 i =3D a;<br>
- =A0 =A0 =A0 =A0 j =3D b;<br>
-<br>
-+ =A0 =A0 =A0 =A0/* sort by bin first */<br>
-+ =A0 =A0 =A0 =A0if (i-&gt;bin &lt; j-&gt;bin)<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;<br>
-+ =A0 =A0 =A0 =A0if (i-&gt;bin &gt; j-&gt;bin)<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 1;<br>
-+<br>
-+ =A0 =A0 =A0 =A0/* then sort by sector */<br>
- =A0 =A0 =A0 =A0 if (i-&gt;block &lt; j-&gt;block)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;<br>
- =A0 =A0 =A0 =A0 if (i-&gt;block &gt; j-&gt;block)<br>
-@@ -250,6 +260,8 @@ static int collect(const char *root) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto finish;<br>
- =A0 =A0 =A0 =A0 }<br>
-<br>
-+ =A0 =A0 =A0 =A0clock_gettime(CLOCK_MONOTONIC, &amp;starttime);<br>
-+<br>
- =A0 =A0 =A0 =A0 /* If there&#39;s no pack file yet we lower the kernel re=
adahead<br>
- =A0 =A0 =A0 =A0 =A0* so that mincore() is accurate. If there is a pack fi=
le<br>
- =A0 =A0 =A0 =A0 =A0* already we assume it is accurate enough so that kern=
el<br>
-@@ -447,10 +459,21 @@ static int collect(const char *root) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 free(p);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else {<br=
>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 unsigned long ul;<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0struct timespec ts;<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0struct item *entry;<br>
-+<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0entry =3D new0(struct item, 1);<br>
-<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 ul =3D fd_first_block(m-&gt;fd);<br>
-<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0if ((k =3D hashmap_put(files, p, SECTOR_TO_PTR(ul))) &lt; 0) {<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0clock_gettime(CLOCK_MONOTONIC, &amp;ts);<br>
-+<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0entry-&gt;block =3D ul;<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0entry-&gt;path =3D strdup(p);<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0entry-&gt;bin =3D round((ts.tv_sec - starttime.tv_sec +<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((ts.tv_nsec - starttime.tv_nsec) / 1000000=
000.0)) / 2.0);<br>
-+<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0if ((k =3D hashmap_put(files, p, entry)) &lt; 0) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 log_warning(&quot;set_put() failed: %s&quot;, strer=
ror(-k));<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 free(p);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 }<br>
-@@ -518,8 +541,7 @@ done:<br>
-<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 j =3D ordered;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 HASHMAP_FOREACH_KEY(q, p, files, i) {<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0j-&gt;path =3D p;<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0j-&gt;block =3D PTR_TO_SE=
CTOR(q);<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(j, q, sizeof(struc=
t item));<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 j++;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
-<br>
---<br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patc=
h b/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch<br>
deleted file mode 100644<br>
index e0b68df..0000000<br>
--- a/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch<br>
+++ /dev/null<br>
@@ -1,86 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
--Khem 2013/03/28<br>
-<br>
-From b0640287f784a320661f7206c9ade07b99003fd5 Mon Sep 17 00:00:00 2001<br>
-From: Auke Kok &lt;<a href=3D"mailto:auke-jan.h.kok@intel.com">auke-jan.h.=
kok@intel.com</a>&gt;<br>
-Date: Tue, 26 Mar 2013 11:13:47 -0700<br>
-Subject: [PATCH 03/17] readahead: cleanups<br>
-<br>
-- check for OOM<br>
-- no need to use floats and round()<br>
----<br>
- Makefile.am =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-<br>
- src/readahead/readahead-collect.c | =A0 20 ++++++++++++++------<br>
- 2 files changed, 15 insertions(+), 7 deletions(-)<br>
-<br>
-diff --git a/Makefile.am b/Makefile.am<br>
-index 5861976..37c1cc2 100644<br>
---- a/Makefile.am<br>
-+++ b/Makefile.am<br>
-@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES =3D \<br>
- systemd_readahead_LDADD =3D \<br>
- =A0 =A0 =A0 <a href=3D"http://libsystemd-shared.la" target=3D"_blank">lib=
systemd-shared.la</a> \<br>
- =A0 =A0 =A0 <a href=3D"http://libsystemd-daemon.la" target=3D"_blank">lib=
systemd-daemon.la</a> \<br>
-- =A0 =A0 =A0<a href=3D"http://libudev.la" target=3D"_blank">libudev.la</a=
> -lm<br>
-+ =A0 =A0 =A0<a href=3D"http://libudev.la" target=3D"_blank">libudev.la</a=
><br>
-<br>
- dist_doc_DATA +=3D \<br>
- =A0 =A0 =A0 src/readahead/sd-readahead.c \<br>
-diff --git a/src/readahead/readahead-collect.c b/src/readahead/readahead-c=
ollect.c<br>
-index 5d22949..e2fd8df 100644<br>
---- a/src/readahead/readahead-collect.c<br>
-+++ b/src/readahead/readahead-collect.c<br>
-@@ -68,7 +68,7 @@<br>
- =A0*/<br>
-<br>
- static ReadaheadShared *shared =3D NULL;<br>
--static struct timespec starttime;<br>
-+static usec_t starttime;<br>
-<br>
- /* Avoid collisions with the NULL pointer */<br>
- #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)<br>
-@@ -260,7 +260,7 @@ static int collect(const char *root) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto finish;<br>
- =A0 =A0 =A0 =A0 }<br>
-<br>
-- =A0 =A0 =A0 =A0clock_gettime(CLOCK_MONOTONIC, &amp;starttime);<br>
-+ =A0 =A0 =A0 =A0starttime =3D now(CLOCK_MONOTONIC);<br>
-<br>
- =A0 =A0 =A0 =A0 /* If there&#39;s no pack file yet we lower the kernel re=
adahead<br>
- =A0 =A0 =A0 =A0 =A0* so that mincore() is accurate. If there is a pack fi=
le<br>
-@@ -459,19 +459,27 @@ static int collect(const char *root) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 free(p);<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else {<br=
>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 unsigned long ul;<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0struct timespec ts;<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0usec_t entrytime;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 struct item *entry;<br>
-<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 entry =3D new0(struct item, 1);<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0if (!entry) {<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0r =3D log_oom();<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0goto finish;<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0}<br>
-<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 ul =3D fd_first_block(m-&gt;fd);<br>
-<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0clock_gettime(CLOCK_MONOTONIC, &amp;ts);<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0entrytime =3D now(CLOCK_MONOTONIC);<br>
-<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 entry-&gt;block =3D ul;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 entry-&gt;path =3D strdup(p);<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0entry-&gt;bin =3D round((ts.tv_sec - starttime.tv_sec +<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((ts.tv_nsec - starttime.tv_nsec) / 1000000=
000.0)) / 2.0);<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0if (!entry-&gt;path) {<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0free(entry);<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0r =3D log_oom();<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0goto finish;<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0}<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0entry-&gt;bin =3D (entrytime - starttime) / 2000000;<br>
-<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 if ((k =3D hashmap_put(files, p, entry)) &lt; 0) {<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 log_warning(&quot;set_put() failed: %s&quot;, strer=
ror(-k));<br>
---<br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-m=
issing-etc-sysctl.conf-proper.patch b/meta/recipes-core/systemd/systemd/001=
3-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch<br>
deleted file mode 100644<br>
index f2c8e02..0000000<br>
--- a/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-=
etc-sysctl.conf-proper.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
--Khem 2013/03/28<br>
-<br>
-From 6f6fad96addf6b00b55c98cc0d0d8026b0c1e7ca Mon Sep 17 00:00:00 2001<br>
-From: Eelco Dolstra &lt;<a href=3D"mailto:eelco.dolstra@logicblox.com">eel=
co.dolstra@logicblox.com</a>&gt;<br>
-Date: Wed, 27 Mar 2013 13:41:59 +0100<br>
-Subject: [PATCH 13/17] systemd-sysctl: Handle missing /etc/sysctl.conf<br>
- properly<br>
-<br>
-Since fabe5c0e5fce730aa66e10a9c4f9fdd443d7aeda, systemd-sysctl returns<br>
-a non-zero exit code if /etc/sysctl.conf does not exist, due to a<br>
-broken ENOENT check.<br>
----<br>
- src/sysctl/sysctl.c | =A0 =A02 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/sysctl/sysctl.c b/src/sysctl/sysctl.c<br>
-index 2d43660..79f3f77 100644<br>
---- a/src/sysctl/sysctl.c<br>
-+++ b/src/sysctl/sysctl.c<br>
-@@ -125,7 +125,7 @@ static int parse_file(Hashmap *sysctl_options, const c=
har *path, bool ignore_eno<br>
-<br>
- =A0 =A0 =A0 =A0 r =3D search_and_fopen_nulstr(path, &quot;re&quot;, conf_=
file_dirs, &amp;f);<br>
- =A0 =A0 =A0 =A0 if (r &lt; 0) {<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ignore_enoent &amp;&amp; errno =3D=3D=
 -ENOENT)<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ignore_enoent &amp;&amp; r =3D=3D -EN=
OENT)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;<br>
-<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 log_error(&quot;Failed to open file &#39;=
%s&#39;, ignoring: %s&quot;, path, strerror(-r));<br>
---<br>
-1.7.9.5<br>
-<br>
diff --git a/meta/recipes-core/systemd/systemd/199-firmware.patch b/meta/re=
cipes-core/systemd/systemd/199-firmware.patch<br>
deleted file mode 100644<br>
index aaab59b..0000000<br>
--- a/meta/recipes-core/systemd/systemd/199-firmware.patch<br>
+++ /dev/null<br>
@@ -1,98 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<a href=3D"http://cgit.freedesktop.org/systemd/systemd/patch/?id=3Dd8d4bee=
76cf3b40ea923bc57d44aa0815ca9b5ff" target=3D"_blank">http://cgit.freedeskto=
p.org/systemd/systemd/patch/?id=3Dd8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff<=
/a><br>

-<br>
-From d8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff Mon Sep 17 00:00:00 2001<br>
-From: Kay Sievers &lt;<a href=3D"mailto:kay@vrfy.org">kay@vrfy.org</a>&gt;=
<br>
-Date: Thu, 28 Mar 2013 14:28:10 +0000<br>
-Subject: build-sys: fix HAVE/ENABLE_FIRMWARE<br>
-<br>
-<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D62864" target=3D=
"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D62864</a><br>
----<br>
-diff --git a/<a href=3D"http://configure.ac" target=3D"_blank">configure.a=
c</a> b/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a><=
br>
-index 5b88bcf..e73cd5c 100644<br>
---- a/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a><b=
r>
-+++ b/<a href=3D"http://configure.ac" target=3D"_blank">configure.ac</a><b=
r>
-@@ -728,6 +728,7 @@ for i in $with_firmware_path; do<br>
- done<br>
- IFS=3D$OLD_IFS<br>
- AC_SUBST(FIRMWARE_PATH)<br>
-+AS_IF([test &quot;x${FIRMWARE_PATH}&quot; !=3D &quot;x&quot;], [ AC_DEFIN=
E(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])<br>
- AM_CONDITIONAL(ENABLE_FIRMWARE, [test &quot;x${FIRMWARE_PATH}&quot; !=3D =
&quot;x&quot;])<br>
-<br>
- # -----------------------------------------------------------------------=
-------<br>
-@@ -736,7 +737,6 @@ AC_ARG_ENABLE([gudev],<br>
- =A0 =A0 =A0 =A0[], [enable_gudev=3Dyes])<br>
- AS_IF([test &quot;x$enable_gudev&quot; =3D &quot;xyes&quot;], [ PKG_CHECK=
_MODULES([GLIB], [glib-2.0 &gt;=3D 2.22.0 gobject-2.0 &gt;=3D 2.22.0 gio-2.=
0]) ])<br>
- AM_CONDITIONAL([ENABLE_GUDEV], [test &quot;x$enable_gudev&quot; =3D &quot=
;xyes&quot;])<br>
--<br>
- AS_IF([test &quot;x$enable_gudev&quot; =3D &quot;xyes&quot;], [ AC_DEFINE=
(HAVE_GLIB, 1, [Define if glib is available]) ])<br>
-<br>
- # -----------------------------------------------------------------------=
-------<br>
-diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c<br>
-index 13922d3..c7d4319 100644<br>
---- a/src/udev/udev-builtin.c<br>
-+++ b/src/udev/udev-builtin.c<br>
-@@ -34,7 +34,7 @@ static const struct udev_builtin *builtins[] =3D {<br>
- =A0 =A0 =A0 =A0 [UDEV_BUILTIN_BLKID] =3D &amp;udev_builtin_blkid,<br>
- #endif<br>
- =A0 =A0 =A0 =A0 [UDEV_BUILTIN_BTRFS] =3D &amp;udev_builtin_btrfs,<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =A0 =A0 =A0 =A0 [UDEV_BUILTIN_FIRMWARE] =3D &amp;udev_builtin_firmware,<b=
r>
- #endif<br>
- =A0 =A0 =A0 =A0 [UDEV_BUILTIN_HWDB] =3D &amp;udev_builtin_hwdb,<br>
-diff --git a/src/udev/udev.h b/src/udev/udev.h<br>
-index aa2edbe..906dfba 100644<br>
---- a/src/udev/udev.h<br>
-+++ b/src/udev/udev.h<br>
-@@ -140,7 +140,7 @@ enum udev_builtin_cmd {<br>
- =A0 =A0 =A0 =A0 UDEV_BUILTIN_BLKID,<br>
- #endif<br>
- =A0 =A0 =A0 =A0 UDEV_BUILTIN_BTRFS,<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =A0 =A0 =A0 =A0 UDEV_BUILTIN_FIRMWARE,<br>
- #endif<br>
- =A0 =A0 =A0 =A0 UDEV_BUILTIN_HWDB,<br>
-@@ -169,7 +169,7 @@ struct udev_builtin {<br>
- extern const struct udev_builtin udev_builtin_blkid;<br>
- #endif<br>
- extern const struct udev_builtin udev_builtin_btrfs;<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- extern const struct udev_builtin udev_builtin_firmware;<br>
- #endif<br>
- extern const struct udev_builtin udev_builtin_hwdb;<br>
-diff --git a/src/udev/udevd.c b/src/udev/udevd.c<br>
-index b30bedf..2ad7388 100644<br>
---- a/src/udev/udevd.c<br>
-+++ b/src/udev/udevd.c<br>
-@@ -98,7 +98,7 @@ struct event {<br>
- =A0 =A0 =A0 =A0 dev_t devnum;<br>
- =A0 =A0 =A0 =A0 int ifindex;<br>
- =A0 =A0 =A0 =A0 bool is_block;<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =A0 =A0 =A0 =A0 bool nodelay;<br>
- #endif<br>
- };<br>
-@@ -444,7 +444,7 @@ static int event_queue_insert(struct udev_device *dev)=
<br>
- =A0 =A0 =A0 =A0 event-&gt;devnum =3D udev_device_get_devnum(dev);<br>
- =A0 =A0 =A0 =A0 event-&gt;is_block =3D streq(&quot;block&quot;, udev_devi=
ce_get_subsystem(dev));<br>
- =A0 =A0 =A0 =A0 event-&gt;ifindex =3D udev_device_get_ifindex(dev);<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =A0 =A0 =A0 =A0 if (streq(udev_device_get_subsystem(dev), &quot;firmware&=
quot;))<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 event-&gt;nodelay =3D true;<br>
- #endif<br>
-@@ -527,7 +527,7 @@ static bool is_devpath_busy(struct event *event)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return true;<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
-<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* allow to bypass the dependency trackin=
g */<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (event-&gt;nodelay)<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;<br>
---<br>
-cgit v0.9.0.2-2-gbebe<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" ta=
rget=3D"_blank">systemd_199.bb</a> b/meta/recipes-core/systemd/<a href=3D"h=
ttp://systemd_204.bb" target=3D"_blank">systemd_204.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" tar=
get=3D"_blank">systemd_199.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" targe=
t=3D"_blank">systemd_204.bb</a><br>
index b1cc046..8536b2b 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" target=3D=
"_blank">systemd_199.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=3D=
"_blank">systemd_204.bb</a><br>
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D751419=
260aa954499f7abaabaa882bbe \<br>
=A0PROVIDES =3D &quot;udev&quot;<br>
<br>
=A0PE =3D &quot;1&quot;<br>
-PR =3D &quot;r4&quot;<br>
<br>
=A0DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native intltool-native gperf=
-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-nativ=
e&quot;<br>
=A0DEPENDS +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;pam&=
#39;, &#39;libpam&#39;, &#39;&#39;, d)}&quot;<br>
@@ -23,16 +22,12 @@ SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org=
/software/systemd/systemd-${PV}.tar.xz" target=3D"_blank">http://www.freede=
sktop.org/software/systemd/systemd-${PV}.tar.xz</a> \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://modprobe.rules \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://var-run.conf \<br>
=A0 =A0 =A0 =A0 =A0 =A0 ${UCLIBCPATCHES} \<br>
+ =A0 =A0 =A0 =A0 =A0 file://0001-utmp-turn-systemd-update-utmp-shutdown.se=
rvice-into-.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://00-create-volatile.conf \<br>
- =A0 =A0 =A0 =A0 =A0 file://0002-readahead-chunk-on-spinning-media.patch \=
<br>
- =A0 =A0 =A0 =A0 =A0 file://0003-readahead-cleanups.patch \<br>
- =A0 =A0 =A0 =A0 =A0 file://0013-systemd-sysctl-Handle-missing-etc-sysctl.=
conf-proper.patch \<br>
- =A0 =A0 =A0 =A0 =A0 file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-s=
trings-and-.patch \<br>
- =A0 =A0 =A0 =A0 =A0 file://199-firmware.patch \<br>
=A0 =A0 =A0 =A0 =A0 =A0 file://init \<br>
=A0 =A0 =A0 =A0 =A0 =A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;4bb13f84ce211e93f0141774a90a2322&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8c4462a04f3ecf7f083782e5e0687913b1d33c6444bf2=
0fa2f31df9222965fed&quot;<br>
+SRC_URI[md5sum] =3D &quot;a07619bb19f48164fbf0761d12fd39a8&quot;<br>
+SRC_URI[sha256sum] =3D &quot;072c393503c7c1e55ca7acf3db659cbd28c7fe5fa94fa=
b3db95360bafd96731b&quot;<br>
<br>
=A0UCLIBCPATCHES =3D &quot;&quot;<br>
=A0UCLIBCPATCHES_libc-uclibc =3D &quot;file://systemd-pam-configure-check-u=
clibc.patch \<br>
<span class=3D""><font color=3D"#888888">--<br>
1.8.2.3<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br><br></div></div></div>

--047d7b47249a95454304dd5e758e--
