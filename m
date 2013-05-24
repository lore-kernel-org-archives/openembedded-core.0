Return-Path: <net147@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 273E261F47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 09:01:18 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id jz10so3141192veb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 02:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4SzmitcOmG6nKmJhhlA81WrHF/SZtI9L/IUMH3zsMKU=;
	b=ieYpuDs/8tJc2UEurbas6pwI7Z7hS3oicmL/lOV7G0ZLjHS0JwX7rGdo0RASR6JQp4
	sls1bfEBrP/DxthX7cJ2wPJZKAzyE7ciTTiUkGLyqkj4VqKS//eG4djGFuADgj7RnWhO
	CVoP1SSsQQgFoZIAgCKj1Log4U09oqk/KGdSTKIWekQ6Fzp9rebNZj3Ow3eFvcdaqd1w
	HsnuJ4lDvD+6fUgVmOGyhrCY4ti8Lb9WdRmcAMJjWf+Cd5vuz/y2W1hVuWC+5f5nAM/1
	7NXj912t8QfQhFXdakxlfv4WKkNFPUlv1KQi/hwq/Hlu+V8QZRa+ENU6rgShEgaTGVsI
	JD0g==
MIME-Version: 1.0
X-Received: by 10.52.236.135 with SMTP id uu7mr6645254vdc.61.1369386078583;
	Fri, 24 May 2013 02:01:18 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Fri, 24 May 2013 02:01:18 -0700 (PDT)
In-Reply-To: <1369357283-10759-1-git-send-email-net147@gmail.com>
References: <1369357283-10759-1-git-send-email-net147@gmail.com>
Date: Fri, 24 May 2013 19:01:18 +1000
Message-ID: <CANwerB04tFePUeq8-XgvwgL_zabRcX9=hQP+VCSbq54OKi+Z8A@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] systemd: update to 204
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
X-List-Received-Date: Fri, 24 May 2013 09:01:18 -0000
Content-Type: multipart/alternative; boundary=089e011822e0c6416904dd730a7a

--089e011822e0c6416904dd730a7a
Content-Type: text/plain; charset=UTF-8

Please ignore V5 patch as uClibc patch should be applied separately.

Regards,
Jonathan

On 24 May 2013 11:01, Jonathan Liu <net147@gmail.com> wrote:

> Removed patches integrated upstream.
> Added backport of fix for utmp not running at shutdown.
> Updated serial-getty service.
> Added missing util-linux dependency.
> Updated uClibc patches.
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
>  .../systemd/systemd/systemd-pam-fix-mkostemp.patch | 110 +++---
>  .../systemd/systemd/systemd-pam-fix-msformat.patch |  86 ++---
>  .../systemd/{systemd_199.bb => systemd_204.bb}     |  13 +-
>  10 files changed, 480 insertions(+), 512 deletions(-)
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
>  create mode 100644
> meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
>  delete mode 100644 meta/recipes-core/systemd/systemd/199-firmware.patch
>  rename meta/recipes-core/systemd/{systemd_199.bb => systemd_204.bb} (95%)
>
> diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
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
>  Description=Serial Getty on %I
> -BindTo=dev-%i.device
> -After=dev-%i.device systemd-user-sessions.service
> +Documentation=man:agetty(8) man:systemd-getty-generator(8)
> +Documentation=http://0pointer.de/blog/projects/serial-console.html
> +BindsTo=dev-%i.device
> +After=dev-%i.device systemd-user-sessions.service
> plymouth-quit-wait.service
> +After=rc-local.service
>
>  # If additional gettys are spawned during boot then we should make
>  # sure that this is synchronized before getty.target, even though
>  # getty.target didn't actually pull it in.
>  Before=getty.target
> +IgnoreOnIsolate=yes
>
>  [Service]
> -Environment=TERM=vt100
> -ExecStart=-/sbin/agetty -s %I @BAUDRATE@
> +ExecStart=-/sbin/agetty -s %I @BAUDRATE@ vt102
> +Type=idle
>  Restart=always
>  RestartSec=0
>  UtmpIdentifier=%I
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> deleted file mode 100644
> index d847bbc..0000000
> ---
> a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -From d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <Martin.Jansa@gmail.com>
> -Date: Tue, 16 Apr 2013 14:20:41 +0200
> -Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings and
> gperf
> -
> -* using AC_PATH_TOOL does not allow to override it from shell environment
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
> http://lists.freedesktop.org/archives/systemd-devel/2013-April/010468.html
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
> -    enable_introspection=no])
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
> a/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
> b/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
> new file mode 100644
> index 0000000..86fab97
> --- /dev/null
> +++
> b/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
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
> +https://bugzilla.redhat.com/show_bug.cgi?id=853104
> +https://bugs.freedesktop.org/show_bug.cgi?id=64365
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
> +@@ -72,7 +72,7 @@ MANPAGES += \
> +       man/systemd-tmpfiles.8 \
> +       man/systemd-tty-ask-password-agent.1 \
> +       man/systemd-udevd.service.8 \
> +-      man/systemd-update-utmp-runlevel.service.8 \
> ++      man/systemd-update-utmp.service.8 \
> +       man/systemd.1 \
> +       man/systemd.automount.5 \
> +       man/systemd.device.5 \
> +@@ -191,7 +191,7 @@ MANPAGES_ALIAS += \
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
> +@@ -417,8 +417,8 @@ nodist_systemunit_DATA = \
> +       units/systemd-initctl.service \
> +       units/systemd-shutdownd.service \
> +       units/systemd-remount-fs.service \
> ++      units/systemd-update-utmp.service \
> +       units/systemd-update-utmp-runlevel.service \
> +-      units/systemd-update-utmp-shutdown.service \
> +       units/systemd-tmpfiles-setup-dev.service \
> +       units/systemd-tmpfiles-setup.service \
> +       units/systemd-tmpfiles-clean.service \
> +@@ -463,8 +463,8 @@ EXTRA_DIST += \
> +       units/systemd-initctl.service.in \
> +       units/systemd-shutdownd.service.in \
> +       units/systemd-remount-fs.service.in \
> ++      units/systemd-update-utmp.service.in \
> +       units/systemd-update-utmp-runlevel.service.in \
> +-      units/systemd-update-utmp-shutdown.service.in \
> +       units/systemd-tmpfiles-setup-dev.service.in \
> +       units/systemd-tmpfiles-setup.service.in \
> +       units/systemd-tmpfiles-clean.service.in \
> +@@ -4070,8 +4070,8 @@ RUNLEVEL4_TARGET_WANTS += \
> + RUNLEVEL5_TARGET_WANTS += \
> +       systemd-update-utmp-runlevel.service
> + endif
> +-SHUTDOWN_TARGET_WANTS += \
> +-      systemd-update-utmp-shutdown.service
> ++SYSINIT_TARGET_WANTS += \
> ++      systemd-update-utmp.service
> + LOCAL_FS_TARGET_WANTS += \
> +       systemd-remount-fs.service \
> +       systemd-fsck-root.service \
> +diff --git a/man/systemd-update-utmp-runlevel.service.xml
> b/man/systemd-update-utmp-runlevel.service.xml
> +deleted file mode 100644
> +index 867b958..0000000
> +--- a/man/systemd-update-utmp-runlevel.service.xml
> ++++ /dev/null
> +@@ -1,76 +0,0 @@
> +-<?xml version="1.0"?>
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
> +-<refentry id="systemd-update-utmp-runlevel.service">
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
>  <citerefentry><refentrytitle>systemd</refentrytitle><manvolnum>1</manvolnum></citerefentry>,
> +-
>  <citerefentry><refentrytitle>utmp</refentrytitle><manvolnum>5</manvolnum></citerefentry>,
> +-
>  <citerefentry><refentrytitle>auditd</refentrytitle><manvolnum>8</manvolnum></citerefentry>
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
> ++<?xml version="1.0"?>
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
> ++<refentry id="systemd-update-utmp.service">
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
>  <citerefentry><refentrytitle>systemd</refentrytitle><manvolnum>1</manvolnum></citerefentry>,
> ++
>  <citerefentry><refentrytitle>utmp</refentrytitle><manvolnum>5</manvolnum></citerefentry>,
> ++
>  <citerefentry><refentrytitle>auditd</refentrytitle><manvolnum>8</manvolnum></citerefentry>
> ++                </para>
> ++        </refsect1>
> ++
> ++</refentry>
> +diff --git a/src/update-utmp/update-utmp.c b/src/update-utmp/update-utmp.c
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
> +                 *interface = "org.freedesktop.systemd1.Unit",
> +diff --git a/units/systemd-update-utmp-runlevel.service.in b/units/
> systemd-update-utmp-runlevel.service.in
> +index 27fae2c..99783e2 100644
> +--- a/units/systemd-update-utmp-runlevel.service.in
> ++++ b/units/systemd-update-utmp-runlevel.service.in
> +@@ -7,12 +7,14 @@
> +
> + [Unit]
> + Description=Update UTMP about System Runlevel Changes
> +-Documentation=man:systemd-update-utmp-runlevel.service(8) man:utmp(5)
> ++Documentation=man:systemd-update-utmp.service(8) man:utmp(5)
> + DefaultDependencies=no
> + RequiresMountsFor=/var/log/wtmp
> +-After=systemd-remount-fs.service systemd-tmpfiles-setup.service
> auditd.service
> ++Conflicts=shutdown.target
> ++Requisite=systemd-update-utmp.service
> ++After=systemd-update-utmp.service
> + After=runlevel1.target runlevel2.target runlevel3.target
> runlevel4.target runlevel5.target
> +-Before=final.target
> ++Before=shutdown.target
> +
> + [Service]
> + Type=oneshot
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
> +-#  under the terms of the GNU Lesser General Public License as published
> by
> +-#  the Free Software Foundation; either version 2.1 of the License, or
> +-#  (at your option) any later version.
> +-
> +-[Unit]
> +-Description=Update UTMP about System Shutdown
> +-Documentation=man:systemd-update-utmp-runlevel.service(8) man:utmp(5)
> +-DefaultDependencies=no
> +-RequiresMountsFor=/var/log/wtmp
> +-After=systemd-remount-fs.service systemd-tmpfiles-setup.service
> auditd.service
> +-After=systemd-update-utmp-runlevel.service
> +-Before=final.target
> +-
> +-[Service]
> +-Type=oneshot
> +-ExecStart=@rootlibexecdir@/systemd-update-utmp shutdown
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
> ++#  under the terms of the GNU Lesser General Public License as published
> by
> ++#  the Free Software Foundation; either version 2.1 of the License, or
> ++#  (at your option) any later version.
> ++
> ++[Unit]
> ++Description=Update UTMP about System Reboot/Shutdown
> ++Documentation=man:systemd-update-utmp.service(8) man:utmp(5)
> ++DefaultDependencies=no
> ++RequiresMountsFor=/var/log/wtmp
> ++Conflicts=shutdown.target
> ++After=systemd-readahead-collect.service systemd-readahead-replay.service
> systemd-remount-fs.service systemd-tmpfiles-setup.service auditd.service
> ++Before=sysinit.target shutdown.target
> ++
> ++[Service]
> ++Type=oneshot
> ++RemainAfterExit=yes
> ++ExecStart=@rootlibexecdir@/systemd-update-utmp reboot
> ++ExecStop=@rootlibexecdir@/systemd-update-utmp shutdown
> +--
> +1.8.2.3
> +
> diff --git
> a/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
> b/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
> deleted file mode 100644
> index d57a01c..0000000
> ---
> a/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
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
> -@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES = \
> - systemd_readahead_LDADD = \
> -       libsystemd-shared.la \
> -       libsystemd-daemon.la \
> --      libudev.la
> -+      libudev.la -lm
> -
> - dist_doc_DATA += \
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
> - static ReadaheadShared *shared = NULL;
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
> -         i = a;
> -         j = b;
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
> -+                                        entry = new0(struct item, 1);
> -
> -                                         ul = fd_first_block(m->fd);
> -
> --                                        if ((k = hashmap_put(files, p,
> SECTOR_TO_PTR(ul))) < 0) {
> -+                                        clock_gettime(CLOCK_MONOTONIC,
> &ts);
> -+
> -+                                        entry->block = ul;
> -+                                        entry->path = strdup(p);
> -+                                        entry->bin = round((ts.tv_sec -
> starttime.tv_sec +
> -+                                                     ((ts.tv_nsec -
> starttime.tv_nsec) / 1000000000.0)) / 2.0);
> -+
> -+                                        if ((k = hashmap_put(files, p,
> entry)) < 0) {
> -                                                 log_warning("set_put()
> failed: %s", strerror(-k));
> -                                                 free(p);
> -                                         }
> -@@ -518,8 +541,7 @@ done:
> -
> -                 j = ordered;
> -                 HASHMAP_FOREACH_KEY(q, p, files, i) {
> --                        j->path = p;
> --                        j->block = PTR_TO_SECTOR(q);
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
> -@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES = \
> - systemd_readahead_LDADD = \
> -       libsystemd-shared.la \
> -       libsystemd-daemon.la \
> --      libudev.la -lm
> -+      libudev.la
> -
> - dist_doc_DATA += \
> -       src/readahead/sd-readahead.c \
> -diff --git a/src/readahead/readahead-collect.c
> b/src/readahead/readahead-collect.c
> -index 5d22949..e2fd8df 100644
> ---- a/src/readahead/readahead-collect.c
> -+++ b/src/readahead/readahead-collect.c
> -@@ -68,7 +68,7 @@
> -  */
> -
> - static ReadaheadShared *shared = NULL;
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
> -+        starttime = now(CLOCK_MONOTONIC);
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
> -                                         entry = new0(struct item, 1);
> -+                                        if (!entry) {
> -+                                                r = log_oom();
> -+                                                goto finish;
> -+                                        }
> -
> -                                         ul = fd_first_block(m->fd);
> -
> --                                        clock_gettime(CLOCK_MONOTONIC,
> &ts);
> -+                                        entrytime = now(CLOCK_MONOTONIC);
> -
> -                                         entry->block = ul;
> -                                         entry->path = strdup(p);
> --                                        entry->bin = round((ts.tv_sec -
> starttime.tv_sec +
> --                                                     ((ts.tv_nsec -
> starttime.tv_nsec) / 1000000000.0)) / 2.0);
> -+                                        if (!entry->path) {
> -+                                                free(entry);
> -+                                                r = log_oom();
> -+                                                goto finish;
> -+                                        }
> -+                                        entry->bin = (entrytime -
> starttime) / 2000000;
> -
> -                                         if ((k = hashmap_put(files, p,
> entry)) < 0) {
> -                                                 log_warning("set_put()
> failed: %s", strerror(-k));
> ---
> -1.7.9.5
> -
> diff --git
> a/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
> b/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
> deleted file mode 100644
> index f2c8e02..0000000
> ---
> a/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
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
> -         r = search_and_fopen_nulstr(path, "re", conf_file_dirs, &f);
> -         if (r < 0) {
> --                if (ignore_enoent && errno == -ENOENT)
> -+                if (ignore_enoent && r == -ENOENT)
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
> http://cgit.freedesktop.org/systemd/systemd/patch/?id=d8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff
> -
> -From d8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff Mon Sep 17 00:00:00 2001
> -From: Kay Sievers <kay@vrfy.org>
> -Date: Thu, 28 Mar 2013 14:28:10 +0000
> -Subject: build-sys: fix HAVE/ENABLE_FIRMWARE
> -
> -https://bugs.freedesktop.org/show_bug.cgi?id=62864
> ----
> -diff --git a/configure.ac b/configure.ac
> -index 5b88bcf..e73cd5c 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -728,6 +728,7 @@ for i in $with_firmware_path; do
> - done
> - IFS=$OLD_IFS
> - AC_SUBST(FIRMWARE_PATH)
> -+AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1,
> [Define if FIRMWARE is available]) ])
> - AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
> -
> - #
> ------------------------------------------------------------------------------
> -@@ -736,7 +737,6 @@ AC_ARG_ENABLE([gudev],
> -        [], [enable_gudev=yes])
> - AS_IF([test "x$enable_gudev" = "xyes"], [ PKG_CHECK_MODULES([GLIB],
> [glib-2.0 >= 2.22.0 gobject-2.0 >= 2.22.0 gio-2.0]) ])
> - AM_CONDITIONAL([ENABLE_GUDEV], [test "x$enable_gudev" = "xyes"])
> --
> - AS_IF([test "x$enable_gudev" = "xyes"], [ AC_DEFINE(HAVE_GLIB, 1,
> [Define if glib is available]) ])
> -
> - #
> ------------------------------------------------------------------------------
> -diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
> -index 13922d3..c7d4319 100644
> ---- a/src/udev/udev-builtin.c
> -+++ b/src/udev/udev-builtin.c
> -@@ -34,7 +34,7 @@ static const struct udev_builtin *builtins[] = {
> -         [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
> - #endif
> -         [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
> --#ifdef ENABLE_FIRMWARE
> -+#ifdef HAVE_FIRMWARE
> -         [UDEV_BUILTIN_FIRMWARE] = &udev_builtin_firmware,
> - #endif
> -         [UDEV_BUILTIN_HWDB] = &udev_builtin_hwdb,
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
> -@@ -444,7 +444,7 @@ static int event_queue_insert(struct udev_device *dev)
> -         event->devnum = udev_device_get_devnum(dev);
> -         event->is_block = streq("block", udev_device_get_subsystem(dev));
> -         event->ifindex = udev_device_get_ifindex(dev);
> --#ifdef ENABLE_FIRMWARE
> -+#ifdef HAVE_FIRMWARE
> -         if (streq(udev_device_get_subsystem(dev), "firmware"))
> -                 event->nodelay = true;
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
> diff --git
> a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
> b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
> index fb8443d..0ea2da3 100644
> --- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
> @@ -1,72 +1,74 @@
>  Upstream-Status: Denied [no desire for uclibc support]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: git/src/journal/journal-send.c
> +Index: systemd-204/src/journal/journal-send.c
>  ===================================================================
> ---- git.orig/src/journal/journal-send.c        2012-09-02
> 00:10:08.748768268 -0700
> -+++ git/src/journal/journal-send.c     2012-09-02 00:10:10.508768335 -0700
> -@@ -34,6 +34,8 @@
> -
> - #define SNDBUF_SIZE (8*1024*1024)
> +--- systemd-204.orig/src/journal/journal-send.c        2013-05-06
> 12:06:04.000000000 -0700
> ++++ systemd-204/src/journal/journal-send.c     2013-05-23
> 11:21:14.500338688 -0700
> +@@ -46,6 +46,8 @@
> +                 memcpy(*_f + 10, _func, _fl);     \
> +         } while(false)
>
>  +#include "config.h"
>  +
>   /* We open a single fd, and we'll share it with the current process,
>    * all its threads, and all its subprocesses. This means we need to
>    * initialize it atomically, and need to operate on it atomically
> -@@ -293,7 +295,12 @@
> +@@ -312,8 +314,13 @@
> +         /* Message doesn't fit... Let's dump the data in a temporary
>            * file and just pass a file descriptor of it to the other
>            * side */
> -
> +-
>  +#ifdef HAVE_MKOSTEMP
>           buffer_fd = mkostemp(path, O_CLOEXEC|O_RDWR);
>  +#else
> -+      buffer_fd = mkstemp(path);
> -+      if (buffer_fd >= 0) fcntl(buffer_fd, F_SETFD, FD_CLOEXEC);
> -+#endif        /* HAVE_MKOSTEMP */
> -         if (buffer_fd < 0) {
> -                 r = -errno;
> -                 goto finish;
> -Index: git/src/core/manager.c
> ++        buffer_fd = mkstemp(path);
> ++        if (buffer_fd >= 0) fcntl(buffer_fd, F_SETFD, FD_CLOEXEC);
> ++#endif /* HAVE_MKOSTEMP */
> ++
> +         if (buffer_fd < 0)
> +                 return -errno;
> +
> +Index: systemd-204/src/core/manager.c
>  ===================================================================
> ---- git.orig/src/core/manager.c        2012-09-02 00:10:08.732768266 -0700
> -+++ git/src/core/manager.c     2012-09-02 00:10:10.512768334 -0700
> -@@ -67,6 +67,8 @@
> - #include "cgroup-util.h"
> - #include "path-util.h"
> +--- systemd-204.orig/src/core/manager.c        2013-04-25
> 17:53:56.000000000 -0700
> ++++ systemd-204/src/core/manager.c     2013-05-23 11:23:15.864340878 -0700
> +@@ -72,6 +72,8 @@
> + #include "audit-fd.h"
> + #include "env-util.h"
>
>  +#include "config.h"
>  +
>   /* As soon as 16 units are in our GC queue, make sure to run a gc sweep
> */
>   #define GC_QUEUE_ENTRIES_MAX 16
>
> -@@ -1701,7 +1703,12 @@
> +@@ -1973,7 +1975,12 @@
>                   return -ENOMEM;
>
> -         saved_umask = umask(0077);
> +         RUN_WITH_UMASK(0077) {
>  +#ifdef HAVE_MKOSTEMP
> -         fd = mkostemp(path, O_RDWR|O_CLOEXEC);
> +                 fd = mkostemp(path, O_RDWR|O_CLOEXEC);
>  +#else
> -+      fd = mkstemp(path);
> -+      if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> -+#endif        /* HAVE_MKOSTEMP */
> -         umask(saved_umask);
> ++                fd = mkstemp(path);
> ++                if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> ++#endif /* HAVE_MKOSTEMP */
> +         }
>
>           if (fd < 0) {
> -Index: git/src/shared/util.c
> +Index: systemd-204/src/shared/util.c
>  ===================================================================
> ---- git.orig/src/shared/util.c 2012-09-02 00:10:08.784768269 -0700
> -+++ git/src/shared/util.c      2012-09-02 00:10:10.512768334 -0700
> -@@ -68,6 +68,8 @@
> - #include "exit-status.h"
> - #include "hashmap.h"
> +--- systemd-204.orig/src/shared/util.c 2013-05-07 12:07:22.000000000 -0700
> ++++ systemd-204/src/shared/util.c      2013-05-23 11:19:35.028336822 -0700
> +@@ -74,6 +74,8 @@
> + #include "env-util.h"
> + #include "fileio.h"
>
>  +#include "config.h"
>  +
>   int saved_argc = 0;
>   char **saved_argv = NULL;
>
> -@@ -4519,7 +4521,12 @@
> +@@ -3921,7 +3923,12 @@
>           t[k] = '.';
>           stpcpy(stpcpy(t+k+1, fn), "XXXXXX");
>
> @@ -79,10 +81,10 @@ Index: git/src/shared/util.c
>           if (fd < 0) {
>                   free(t);
>                   return -errno;
> -Index: git/src/shared/ask-password-api.c
> +Index: systemd-204/src/shared/ask-password-api.c
>  ===================================================================
> ---- git.orig/src/shared/ask-password-api.c     2012-09-02
> 00:10:08.772768268 -0700
> -+++ git/src/shared/ask-password-api.c  2012-09-02 00:10:10.512768334 -0700
> +--- systemd-204.orig/src/shared/ask-password-api.c     2013-04-08
> 08:26:34.000000000 -0700
> ++++ systemd-204/src/shared/ask-password-api.c  2013-05-23
> 11:24:43.456342451 -0700
>  @@ -37,6 +37,8 @@
>
>   #include "ask-password-api.h"
> @@ -92,24 +94,24 @@ Index: git/src/shared/ask-password-api.c
>   static void backspace_chars(int ttyfd, size_t p) {
>
>           if (ttyfd < 0)
> -@@ -326,7 +328,12 @@
> +@@ -325,7 +327,12 @@
>           mkdir_p_label("/run/systemd/ask-password", 0755);
>
> -         u = umask(0022);
> +         RUN_WITH_UMASK(0022) {
>  +#ifdef HAVE_MKOSTEMP
> -         fd = mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY);
> +                 fd = mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY);
>  +#else
> -+      fd = mkstemp(temp);
> -+      if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> -+#endif        /* HAVE_MKOSTEMP */
> -         umask(u);
> ++                fd = mkstemp(temp);
> ++                if (fd >= 0) fcntl(fd, F_SETFD, FD_CLOEXEC);
> ++#endif /* HAVE_MKOSTEMP */
> +         }
>
>           if (fd < 0) {
> -Index: git/src/journal/journalctl.c
> +Index: systemd-204/src/journal/journalctl.c
>  ===================================================================
> ---- git.orig/src/journal/journalctl.c  2012-09-02 00:10:08.752768267 -0700
> -+++ git/src/journal/journalctl.c       2012-09-02 00:18:41.928787779 -0700
> -@@ -540,7 +540,13 @@
> +--- systemd-204.orig/src/journal/journalctl.c  2013-05-07
> 12:07:22.000000000 -0700
> ++++ systemd-204/src/journal/journalctl.c       2013-05-23
> 11:19:35.028336822 -0700
> +@@ -755,7 +755,13 @@
>           n /= arg_interval;
>
>           close_nointr_nofail(fd);
> @@ -123,11 +125,11 @@ Index: git/src/journal/journalctl.c
>           if (fd < 0) {
>                   log_error("Failed to open %s: %m", k);
>                   r = -errno;
> -Index: git/src/journal/journal-verify.c
> +Index: systemd-204/src/journal/journal-verify.c
>  ===================================================================
> ---- git.orig/src/journal/journal-verify.c      2012-09-02
> 00:10:08.752768267 -0700
> -+++ git/src/journal/journal-verify.c   2012-09-02 00:24:10.268800268 -0700
> -@@ -693,8 +693,12 @@
> +--- systemd-204.orig/src/journal/journal-verify.c      2012-11-20
> 13:42:23.000000000 -0800
> ++++ systemd-204/src/journal/journal-verify.c   2013-05-23
> 11:19:35.032336822 -0700
> +@@ -700,8 +700,12 @@
>   #endif
>           } else if (f->seal)
>                   return -ENOKEY;
> @@ -141,7 +143,7 @@ Index: git/src/journal/journal-verify.c
>           if (data_fd < 0) {
>                   log_error("Failed to create data file: %m");
>                   r = -errno;
> -@@ -702,7 +706,12 @@
> +@@ -709,7 +713,12 @@
>           }
>           unlink(data_path);
>
> @@ -154,7 +156,7 @@ Index: git/src/journal/journal-verify.c
>           if (entry_fd < 0) {
>                   log_error("Failed to create entry file: %m");
>                   r = -errno;
> -@@ -710,7 +719,12 @@
> +@@ -717,7 +726,12 @@
>           }
>           unlink(entry_path);
>
> diff --git
> a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
> b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
> index 8d1aa7d..77bb305 100644
> --- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
> +++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
> @@ -1,10 +1,10 @@
>  Upstream-Status: Denied [no desire for uclibc support]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: systemd-198/src/fsck/fsck.c
> +Index: systemd-204/src/fsck/fsck.c
>  ===================================================================
> ---- systemd-198.orig/src/fsck/fsck.c   2013-03-07 13:18:34.000000000 -0800
> -+++ systemd-198/src/fsck/fsck.c        2013-03-09 14:49:03.756572873 -0800
> +--- systemd-204.orig/src/fsck/fsck.c   2013-04-02 05:48:49.000000000 -0700
> ++++ systemd-204/src/fsck/fsck.c        2013-05-23 11:26:51.776345015 -0700
>  @@ -37,6 +37,8 @@
>   #include "virt.h"
>   #include "fileio.h"
> @@ -14,7 +14,7 @@ Index: systemd-198/src/fsck/fsck.c
>   static bool arg_skip = false;
>   static bool arg_force = false;
>   static bool arg_show_progress = false;
> -@@ -203,9 +205,16 @@
> +@@ -198,9 +200,16 @@
>                   char *device;
>                   double p;
>                   usec_t t;
> @@ -33,10 +33,10 @@ Index: systemd-198/src/fsck/fsck.c
>
>                   /* Only show one progress counter at max */
>                   if (!locked) {
> -Index: systemd-198/src/core/swap.c
> +Index: systemd-204/src/core/swap.c
>  ===================================================================
> ---- systemd-198.orig/src/core/swap.c   2013-03-07 13:18:34.000000000 -0800
> -+++ systemd-198/src/core/swap.c        2013-03-09 14:49:03.756572873 -0800
> +--- systemd-204.orig/src/core/swap.c   2013-05-06 12:06:04.000000000 -0700
> ++++ systemd-204/src/core/swap.c        2013-05-23 11:26:51.780345015 -0700
>  @@ -41,6 +41,8 @@
>   #include "path-util.h"
>   #include "virt.h"
> @@ -46,7 +46,7 @@ Index: systemd-198/src/core/swap.c
>   static const UnitActiveState state_translation_table[_SWAP_STATE_MAX] = {
>           [SWAP_DEAD] = UNIT_INACTIVE,
>           [SWAP_ACTIVATING] = UNIT_ACTIVATING,
> -@@ -1037,6 +1039,7 @@
> +@@ -1055,6 +1057,7 @@
>                   char *dev = NULL, *d;
>                   int prio = 0, k;
>
> @@ -54,7 +54,7 @@ Index: systemd-198/src/core/swap.c
>                   k = fscanf(m->proc_swaps,
>                              "%ms "  /* device/file */
>                              "%*s "  /* type of swap */
> -@@ -1044,6 +1047,16 @@
> +@@ -1062,6 +1065,16 @@
>                              "%*s "  /* used */
>                              "%i\n", /* priority */
>                              &dev, &prio);
> @@ -71,10 +71,10 @@ Index: systemd-198/src/core/swap.c
>                   if (k != 2) {
>                           if (k == EOF)
>                                   break;
> -Index: systemd-198/src/core/mount-setup.c
> +Index: systemd-204/src/core/mount-setup.c
>  ===================================================================
> ---- systemd-198.orig/src/core/mount-setup.c    2013-03-07
> 13:18:34.000000000 -0800
> -+++ systemd-198/src/core/mount-setup.c 2013-03-09 14:49:03.760572872 -0800
> +--- systemd-204.orig/src/core/mount-setup.c    2013-04-24
> 06:34:38.000000000 -0700
> ++++ systemd-204/src/core/mount-setup.c 2013-05-23 11:26:51.780345015 -0700
>  @@ -28,6 +28,7 @@
>   #include <assert.h>
>   #include <unistd.h>
> @@ -92,7 +92,7 @@ Index: systemd-198/src/core/mount-setup.c
>   #ifndef TTY_GID
>   #define TTY_GID 5
>   #endif
> -@@ -231,9 +234,12 @@
> +@@ -233,9 +236,12 @@
>           for (;;) {
>                   char *controller;
>                   int enabled = 0;
> @@ -107,11 +107,11 @@ Index: systemd-198/src/core/mount-setup.c
>                           if (feof(f))
>                                   break;
>
> -Index: systemd-198/src/core/mount.c
> +Index: systemd-204/src/core/mount.c
>  ===================================================================
> ---- systemd-198.orig/src/core/mount.c  2013-03-07 13:18:34.000000000 -0800
> -+++ systemd-198/src/core/mount.c       2013-03-09 14:49:03.760572872 -0800
> -@@ -42,6 +42,8 @@
> +--- systemd-204.orig/src/core/mount.c  2013-05-06 12:06:04.000000000 -0700
> ++++ systemd-204/src/core/mount.c       2013-05-23 11:26:51.780345015 -0700
> +@@ -43,6 +43,8 @@
>   #include "exit-status.h"
>   #include "def.h"
>
> @@ -120,7 +120,7 @@ Index: systemd-198/src/core/mount.c
>   static const UnitActiveState state_translation_table[_MOUNT_STATE_MAX] =
> {
>           [MOUNT_DEAD] = UNIT_INACTIVE,
>           [MOUNT_MOUNTING] = UNIT_ACTIVATING,
> -@@ -1584,7 +1586,7 @@
> +@@ -1626,7 +1628,7 @@
>                   int k;
>
>                   device = path = options = options2 = fstype = d = p = o
> = NULL;
> @@ -129,7 +129,7 @@ Index: systemd-198/src/core/mount.c
>                   if ((k = fscanf(m->proc_self_mountinfo,
>                                   "%*s "       /* (1) mount id */
>                                   "%*s "       /* (2) parent id */
> -@@ -1603,7 +1605,31 @@
> +@@ -1645,7 +1647,31 @@
>                                   &fstype,
>                                   &device,
>                                   &options2)) != 5) {
> @@ -162,10 +162,10 @@ Index: systemd-198/src/core/mount.c
>                           if (k == EOF)
>                                   break;
>
> -Index: systemd-198/src/core/umount.c
> +Index: systemd-204/src/core/umount.c
>  ===================================================================
> ---- systemd-198.orig/src/core/umount.c 2013-03-07 13:18:34.000000000 -0800
> -+++ systemd-198/src/core/umount.c      2013-03-09 14:49:03.760572872 -0800
> +--- systemd-204.orig/src/core/umount.c 2013-04-18 08:14:11.000000000 -0700
> ++++ systemd-204/src/core/umount.c      2013-05-23 11:26:51.780345015 -0700
>  @@ -36,6 +36,8 @@
>   #include "util.h"
>   #include "virt.h"
> @@ -235,10 +235,10 @@ Index: systemd-198/src/core/umount.c
>                           if (k == EOF)
>                                   break;
>
> -Index: systemd-198/src/shared/socket-util.c
> +Index: systemd-204/src/shared/socket-util.c
>  ===================================================================
> ---- systemd-198.orig/src/shared/socket-util.c  2013-03-07
> 13:18:34.000000000 -0800
> -+++ systemd-198/src/shared/socket-util.c       2013-03-09
> 14:49:03.760572872 -0800
> +--- systemd-204.orig/src/shared/socket-util.c  2013-04-18
> 08:14:11.000000000 -0700
> ++++ systemd-204/src/shared/socket-util.c       2013-05-23
> 11:30:53.528348084 -0700
>  @@ -40,6 +40,8 @@
>   #include "missing.h"
>   #include "fileio.h"
> @@ -252,25 +252,25 @@ Index: systemd-198/src/shared/socket-util.c
>           a->type = SOCK_RAW;
>
>           errno = 0;
> --        if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
>  +#ifdef HAVE_MSFORMAT
> -+      if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
> +         if (sscanf(s, "%ms %u", &sfamily, &group) < 1)
> +-                return errno > 0 ? -errno : -EINVAL;
>  +                return errno ? -errno : -EINVAL;
>  +#else
> -+      sfamily = malloc(257);
> -+      if (sscanf(s, "%256s %u", sfamily, &group) < 1) {
> -+              free(sfamily);
> -                 return errno ? -errno : -EINVAL;
> -+      }
> ++        sfamily = malloc(257);
> ++        if (sscanf(s, "%256s %u", sfamily, &group) < 1) {
> ++                 free(sfamily);
> ++                 return errno ? -errno : -EINVAL;
> ++        }
>  +#endif /* HAVE_MSFORMAT */
>
>           family = netlink_family_from_string(sfamily);
>           if (family < 0)
> -Index: systemd-198/src/tmpfiles/tmpfiles.c
> +Index: systemd-204/src/tmpfiles/tmpfiles.c
>  ===================================================================
> ---- systemd-198.orig/src/tmpfiles/tmpfiles.c   2013-03-07
> 13:18:34.000000000 -0800
> -+++ systemd-198/src/tmpfiles/tmpfiles.c        2013-03-09
> 14:55:40.772566599 -0800
> -@@ -51,6 +51,8 @@
> +--- systemd-204.orig/src/tmpfiles/tmpfiles.c   2013-04-24
> 06:34:38.000000000 -0700
> ++++ systemd-204/src/tmpfiles/tmpfiles.c        2013-05-23
> 11:26:51.784345016 -0700
> +@@ -52,6 +52,8 @@
>   #include "conf-files.h"
>   #include "capability.h"
>
> @@ -279,7 +279,7 @@ Index: systemd-198/src/tmpfiles/tmpfiles.c
>   /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
>    * them in the file system. This is intended to be used to create
>    * properly owned directories beneath /tmp, /var/tmp, /run, which are
> -@@ -993,6 +995,7 @@
> +@@ -1029,6 +1031,7 @@
>           if (!i)
>                   return log_oom();
>
> @@ -287,7 +287,7 @@ Index: systemd-198/src/tmpfiles/tmpfiles.c
>           r = sscanf(buffer,
>                      "%c %ms %ms %ms %ms %ms %n",
>                      &type,
> -@@ -1002,6 +1005,29 @@
> +@@ -1038,6 +1041,29 @@
>                      &group,
>                      &age,
>                      &n);
> @@ -316,11 +316,11 @@ Index: systemd-198/src/tmpfiles/tmpfiles.c
>  +
>           if (r < 2) {
>                   log_error("[%s:%u] Syntax error.", fname, line);
> -                 r = -EIO;
> -Index: systemd-198/src/cryptsetup/cryptsetup-generator.c
> +                 return -EIO;
> +Index: systemd-204/src/cryptsetup/cryptsetup-generator.c
>  ===================================================================
> ---- systemd-198.orig/src/cryptsetup/cryptsetup-generator.c     2013-03-07
> 13:18:34.000000000 -0800
> -+++ systemd-198/src/cryptsetup/cryptsetup-generator.c  2013-03-09
> 14:51:33.080571639 -0800
> +--- systemd-204.orig/src/cryptsetup/cryptsetup-generator.c     2013-05-06
> 12:06:04.000000000 -0700
> ++++ systemd-204/src/cryptsetup/cryptsetup-generator.c  2013-05-23
> 11:26:51.784345016 -0700
>  @@ -31,6 +31,8 @@
>   #include "strv.h"
>   #include "fileio.h"
> @@ -330,7 +330,7 @@ Index:
> systemd-198/src/cryptsetup/cryptsetup-generator.c
>   static const char *arg_dest = "/tmp";
>   static bool arg_enabled = true;
>   static bool arg_read_crypttab = true;
> -@@ -395,7 +397,16 @@
> +@@ -398,7 +400,16 @@
>                           if (*l == '#' || *l == 0)
>                                   continue;
>
> diff --git a/meta/recipes-core/systemd/systemd_199.bbb/meta/recipes-core/systemd/
> systemd_204.bb
> similarity index 95%
> rename from meta/recipes-core/systemd/systemd_199.bb
> rename to meta/recipes-core/systemd/systemd_204.bb
> index b1cc046..ec5be1f 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_204.bb
> @@ -9,9 +9,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>  PROVIDES = "udev"
>
>  PE = "1"
> -PR = "r4"
>
> -DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
> acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-native"
> +DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native
> acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-native
> util-linux"
>  DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>
>  SECTION = "base/shell"
> @@ -23,16 +22,12 @@ SRC_URI = "
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
> -SRC_URI[md5sum] = "4bb13f84ce211e93f0141774a90a2322"
> -SRC_URI[sha256sum] =
> "8c4462a04f3ecf7f083782e5e0687913b1d33c6444bf20fa2f31df9222965fed"
> +SRC_URI[md5sum] = "a07619bb19f48164fbf0761d12fd39a8"
> +SRC_URI[sha256sum] =
> "072c393503c7c1e55ca7acf3db659cbd28c7fe5fa94fab3db95360bafd96731b"
>
>  UCLIBCPATCHES = ""
>  UCLIBCPATCHES_libc-uclibc =
> "file://systemd-pam-configure-check-uclibc.patch \
> --
> 1.8.2.3
>
>

--089e011822e0c6416904dd730a7a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please ignore V5 patch as uClibc patch should be applied s=
eparately.<div><br></div><div style>Regards,</div><div style>Jonathan</div>=
<div class=3D"gmail_extra"><br>On 24 May 2013 11:01, Jonathan Liu <span dir=
=3D"ltr">&lt;<a href=3D"mailto:net147@gmail.com" target=3D"_blank">net147@g=
mail.com</a>&gt;</span> wrote:<br>
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"im"=
>Removed patches integrated upstream.<br>
Added backport of fix for utmp not running at shutdown.<br>
Updated serial-getty service.<br>
Added missing util-linux dependency.<br>
</div>Updated uClibc patches.<br>
<div class=3D"im"><br>
Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com">net147@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0.../systemd-serialgetty/serial-getty@.service =C2=A0 =C2=A0 =C2=A0| =
=C2=A016 +-<br>
=C2=A0...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch | =C2=A041 ---<br>
=C2=A0...ystemd-update-utmp-shutdown.service-into-.patch | 367 ++++++++++++=
+++++++++<br>
=C2=A0.../0002-readahead-chunk-on-spinning-media.patch =C2=A0 | 142 -------=
-<br>
=C2=A0.../systemd/systemd/0003-readahead-cleanups.patch =C2=A0| =C2=A086 --=
---<br>
=C2=A0...ctl-Handle-missing-etc-sysctl.conf-proper.patch | =C2=A033 --<br>
=C2=A0.../systemd/systemd/199-firmware.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A098 ------<br>
</div>=C2=A0.../systemd/systemd/systemd-pam-fix-mkostemp.patch | 110 +++---=
<br>
=C2=A0.../systemd/systemd/systemd-pam-fix-msformat.patch | =C2=A086 ++---<b=
r>
<div class=3D"im">=C2=A0.../systemd/{<a href=3D"http://systemd_199.bb" targ=
et=3D"_blank">systemd_199.bb</a> =3D&gt; <a href=3D"http://systemd_204.bb" =
target=3D"_blank">systemd_204.bb</a>} =C2=A0 =C2=A0 | =C2=A013 +-<br>
</div>=C2=A010 files changed, 480 insertions(+), 512 deletions(-)<br>
<div><div class=3D"h5">=C2=A0delete mode 100644 meta/recipes-core/systemd/s=
ystemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch<br>
=C2=A0create mode 100644 meta/recipes-core/systemd/systemd/0001-utmp-turn-s=
ystemd-update-utmp-shutdown.service-into-.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0002-readahead-c=
hunk-on-spinning-media.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0003-readahead-c=
leanups.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0013-systemd-sys=
ctl-Handle-missing-etc-sysctl.conf-proper.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/199-firmware.pat=
ch<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_199.bb" t=
arget=3D"_blank">systemd_199.bb</a> =3D&gt; <a href=3D"http://systemd_204.b=
b" target=3D"_blank">systemd_204.bb</a>} (95%)<br>
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
=C2=A0# =C2=A0This file is part of systemd.<br>
=C2=A0#<br>
=C2=A0# =C2=A0systemd is free software; you can redistribute it and/or modi=
fy it<br>
-# =C2=A0under the terms of the GNU General Public License as published by<=
br>
-# =C2=A0the Free Software Foundation; either version 2 of the License, or<=
br>
+# =C2=A0under the terms of the GNU Lesser General Public License as publis=
hed by<br>
+# =C2=A0the Free Software Foundation; either version 2.1 of the License, o=
r<br>
=C2=A0# =C2=A0(at your option) any later version.<br>
<br>
=C2=A0[Unit]<br>
=C2=A0Description=3DSerial Getty on %I<br>
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
=C2=A0# If additional gettys are spawned during boot then we should make<br=
>
=C2=A0# sure that this is synchronized before getty.target, even though<br>
=C2=A0# getty.target didn&#39;t actually pull it in.<br>
=C2=A0Before=3Dgetty.target<br>
+IgnoreOnIsolate=3Dyes<br>
<br>
=C2=A0[Service]<br>
-Environment=3DTERM=3Dvt100<br>
-ExecStart=3D-/sbin/agetty -s %I @BAUDRATE@<br>
+ExecStart=3D-/sbin/agetty -s %I @BAUDRATE@ vt102<br>
+Type=3Didle<br>
=C2=A0Restart=3Dalways<br>
=C2=A0RestartSec=3D0<br>
=C2=A0UtmpIdentifier=3D%I<br>
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
- =C2=A0which is useful when cross-compiling<br>
-* with external toolchain I have different HOST_PREFIX and HOST_SYS<br>
- =C2=A0AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy<=
br>
- =C2=A0which is available only as ${TARGET_PREFIX}objcopy then it tries<br=
>
- =C2=A0objcopy without prefix which is found on host, but that objcopy<br>
- =C2=A0does not work for !host (e.g. arm when building on x86) libs<br>
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
- =C2=A0 =C2=A0AM_CONDITIONAL([HAVE_INTROSPECTION], [false])<br>
- =C2=A0 =C2=A0enable_introspection=3Dno])<br>
-<br>
--AC_PATH_TOOL(OBJCOPY, objcopy)<br>
--AC_PATH_TOOL(STRINGS, strings)<br>
--AC_PATH_TOOL(GPERF, gperf)<br>
-+AC_CHECK_TOOL(OBJCOPY, objcopy)<br>
-+AC_CHECK_TOOL(STRINGS, strings)<br>
-+AC_CHECK_TOOL(GPERF, gperf)<br>
- if test -z &quot;$GPERF&quot; ; then<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_ERROR([*** gperf not found])<br>
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
+ Makefile-man.am =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++---<br>
+ Makefile.am =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A08 +--<b=
r>
+ man/systemd-update-utmp-runlevel.service.xml =C2=A0| 76 -----------------=
----------<br>
+ man/systemd-update-utmp.service.xml =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
76 +++++++++++++++++++++++++++<br>
+ src/update-utmp/update-utmp.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A02 +-<br>
+ units/.gitignore =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>
+ units/<a href=3D"http://systemd-update-utmp-runlevel.service.in" target=
=3D"_blank">systemd-update-utmp-runlevel.service.in</a> | =C2=A08 +--<br>
+ units/<a href=3D"http://systemd-update-utmp-shutdown.service.in" target=
=3D"_blank">systemd-update-utmp-shutdown.service.in</a> | 19 -------<br>
+ units/<a href=3D"http://systemd-update-utmp.service.in" target=3D"_blank"=
>systemd-update-utmp.service.in</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 =
++++++++<br>
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
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-tmpfiles.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-tty-ask-password-agent.1 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-udevd.service.8 \<br>
+- =C2=A0 =C2=A0 =C2=A0man/systemd-update-utmp-runlevel.service.8 \<br>
++ =C2=A0 =C2=A0 =C2=A0man/systemd-update-utmp.service.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd.1 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd.automount.5 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd.device.5 \<br>
+@@ -191,7 +191,7 @@ MANPAGES_ALIAS +=3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-udevd-control.socket.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-udevd-kernel.socket.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-udevd.8 \<br>
+- =C2=A0 =C2=A0 =C2=A0man/systemd-update-utmp-shutdown.service.8 \<br>
++ =C2=A0 =C2=A0 =C2=A0man/systemd-update-utmp-runlevel.service.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-update-utmp.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-user.conf.5<br>
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
+ =C2=A0 =C2=A0 =C2=A0 $(html-alias)<br>
+@@ -577,10 +577,10 @@ man/systemd-udevd-kernel.socket.html: man/systemd-ud=
evd.service.html<br>
+ man/systemd-udevd.html: man/systemd-udevd.service.html<br>
+ =C2=A0 =C2=A0 =C2=A0 $(html-alias)<br>
+<br>
+-man/systemd-update-utmp-shutdown.service.html: man/systemd-update-utmp-ru=
nlevel.service.html<br>
++man/systemd-update-utmp-runlevel.service.html: man/systemd-update-utmp.se=
rvice.html<br>
+ =C2=A0 =C2=A0 =C2=A0 $(html-alias)<br>
+<br>
+-man/systemd-update-utmp.html: man/systemd-update-utmp-runlevel.service.ht=
ml<br>
++man/systemd-update-utmp.html: man/systemd-update-utmp.service.html<br>
+ =C2=A0 =C2=A0 =C2=A0 $(html-alias)<br>
+<br>
+ man/systemd-user.conf.html: man/systemd-system.conf.html<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index 8d8139c..4c5e6fc 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -417,8 +417,8 @@ nodist_systemunit_DATA =3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-initctl.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-shutdownd.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-remount-fs.service \<br>
++ =C2=A0 =C2=A0 =C2=A0units/systemd-update-utmp.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-update-utmp-runlevel.service \<br>
+- =C2=A0 =C2=A0 =C2=A0units/systemd-update-utmp-shutdown.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-tmpfiles-setup-dev.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-tmpfiles-setup.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-tmpfiles-clean.service \<br>
+@@ -463,8 +463,8 @@ EXTRA_DIST +=3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-initctl.service.in" =
target=3D"_blank">systemd-initctl.service.in</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-shutdownd.service.in=
" target=3D"_blank">systemd-shutdownd.service.in</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-remount-fs.service.i=
n" target=3D"_blank">systemd-remount-fs.service.in</a> \<br>
++ =C2=A0 =C2=A0 =C2=A0units/<a href=3D"http://systemd-update-utmp.service.=
in" target=3D"_blank">systemd-update-utmp.service.in</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-update-utmp-runlevel=
.service.in" target=3D"_blank">systemd-update-utmp-runlevel.service.in</a> =
\<br>
+- =C2=A0 =C2=A0 =C2=A0units/<a href=3D"http://systemd-update-utmp-shutdown=
.service.in" target=3D"_blank">systemd-update-utmp-shutdown.service.in</a> =
\<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-tmpfiles-setup-dev.s=
ervice.in" target=3D"_blank">systemd-tmpfiles-setup-dev.service.in</a> \<br=
>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-tmpfiles-setup.servi=
ce.in" target=3D"_blank">systemd-tmpfiles-setup.service.in</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-tmpfiles-clean.servi=
ce.in" target=3D"_blank">systemd-tmpfiles-clean.service.in</a> \<br>
+@@ -4070,8 +4070,8 @@ RUNLEVEL4_TARGET_WANTS +=3D \<br>
+ RUNLEVEL5_TARGET_WANTS +=3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 systemd-update-utmp-runlevel.service<br>
+ endif<br>
+-SHUTDOWN_TARGET_WANTS +=3D \<br>
+- =C2=A0 =C2=A0 =C2=A0systemd-update-utmp-shutdown.service<br>
++SYSINIT_TARGET_WANTS +=3D \<br>
++ =C2=A0 =C2=A0 =C2=A0systemd-update-utmp.service<br>
+ LOCAL_FS_TARGET_WANTS +=3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 systemd-remount-fs.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 systemd-fsck-root.service \<br>
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
+- =C2=A0This file is part of systemd.<br>
+-<br>
+- =C2=A0Copyright 2012 Lennart Poettering<br>
+-<br>
+- =C2=A0systemd is free software; you can redistribute it and/or modify it=
<br>
+- =C2=A0under the terms of the GNU Lesser General Public License as publis=
hed by<br>
+- =C2=A0the Free Software Foundation; either version 2.1 of the License, o=
r<br>
+- =C2=A0(at your option) any later version.<br>
+-<br>
+- =C2=A0systemd is distributed in the hope that it will be useful, but<br>
+- =C2=A0WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+- =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU<b=
r>
+- =C2=A0Lesser General Public License for more details.<br>
+-<br>
+- =C2=A0You should have received a copy of the GNU Lesser General Public L=
icense<br>
+- =C2=A0along with systemd; If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
+---&gt;<br>
+-&lt;refentry id=3D&quot;systemd-update-utmp-runlevel.service&quot;&gt;<br=
>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refentryinfo&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;syst=
emd-update-utmp-runlevel.service&lt;/title&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;productname&g=
t;systemd&lt;/productname&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;authorgroup&g=
t;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;author&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;contrib&gt;Developer&lt;/contr=
ib&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;firstname&gt;Lennart&lt;/first=
name&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;surname&gt;Poettering&lt;/surn=
ame&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;email&gt;<a href=3D"mailto:len=
nart@poettering.net">lennart@poettering.net</a>&lt;/email&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;/author&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/authorgroup&=
gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refentryinfo&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refmeta&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refentrytitle=
&gt;systemd-update-utmp-runlevel.service&lt;/refentrytitle&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;manvolnum&gt;=
8&lt;/manvolnum&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refmeta&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refnamediv&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp-runlevel.service&lt;/refname&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp-shutdown.service&lt;/refname&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp&lt;/refname&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refpurpose&gt=
;Write audit and utmp updates at runlevel<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0changes and shutd=
own&lt;/refpurpose&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refnamediv&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsynopsisdiv&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-update-utmp-runlevel.service&lt;/filename&gt;&lt;/para&g=
t;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-update-utmp-shutdown.service&lt;/filename&gt;&lt;/para&g=
t;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;/usr/lib/systemd/systemd-update-utmp&lt;/filename&gt;&lt;/para&g=
t;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsynopsisdiv&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsect1&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;Desc=
ription&lt;/title&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-update-utmp-runlevel.service&lt;/filename&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is a service that=
 writes SysV runlevel changes to utmp<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and wtmp, as well=
 as the audit logs, as they<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0occur. &lt;filena=
me&gt;systemd-update-utmp-shutdown.service&lt;/filename&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0does the same for=
 shut-down requests.&lt;/para&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsect1&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsect1&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;See =
Also&lt;/title&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;systemd&lt;/refentryt=
itle&gt;&lt;manvolnum&gt;1&lt;/manvolnum&gt;&lt;/citerefentry&gt;,<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;utmp&lt;/refentrytitl=
e&gt;&lt;manvolnum&gt;5&lt;/manvolnum&gt;&lt;/citerefentry&gt;,<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;auditd&lt;/refentryti=
tle&gt;&lt;manvolnum&gt;8&lt;/manvolnum&gt;&lt;/citerefentry&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsect1&gt;<br>
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
++ =C2=A0This file is part of systemd.<br>
++<br>
++ =C2=A0Copyright 2012 Lennart Poettering<br>
++<br>
++ =C2=A0systemd is free software; you can redistribute it and/or modify it=
<br>
++ =C2=A0under the terms of the GNU Lesser General Public License as publis=
hed by<br>
++ =C2=A0the Free Software Foundation; either version 2.1 of the License, o=
r<br>
++ =C2=A0(at your option) any later version.<br>
++<br>
++ =C2=A0systemd is distributed in the hope that it will be useful, but<br>
++ =C2=A0WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ =C2=A0MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU<b=
r>
++ =C2=A0Lesser General Public License for more details.<br>
++<br>
++ =C2=A0You should have received a copy of the GNU Lesser General Public L=
icense<br>
++ =C2=A0along with systemd; If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.<br>
++--&gt;<br>
++&lt;refentry id=3D&quot;systemd-update-utmp.service&quot;&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refentryinfo&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;syst=
emd-update-utmp.service&lt;/title&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;productname&g=
t;systemd&lt;/productname&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;authorgroup&g=
t;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;author&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;contrib&gt;Developer&lt;/contr=
ib&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;firstname&gt;Lennart&lt;/first=
name&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;surname&gt;Poettering&lt;/surn=
ame&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;email&gt;<a href=3D"mailto:len=
nart@poettering.net">lennart@poettering.net</a>&lt;/email&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;/author&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/authorgroup&=
gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refentryinfo&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refmeta&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refentrytitle=
&gt;systemd-update-utmp.service&lt;/refentrytitle&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;manvolnum&gt;=
8&lt;/manvolnum&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refmeta&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refnamediv&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp.service&lt;/refname&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp-runlevel.service&lt;/refname&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp&lt;/refname&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refpurpose&gt=
;Write audit and utmp updates at bootup, runlevel<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0changes and shutd=
own&lt;/refpurpose&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refnamediv&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsynopsisdiv&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-update-utmp.service&lt;/filename&gt;&lt;/para&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-update-utmp-runlevel.service&lt;/filename&gt;&lt;/para&g=
t;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;/usr/lib/systemd/systemd-update-utmp&lt;/filename&gt;&lt;/para&g=
t;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsynopsisdiv&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsect1&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;Desc=
ription&lt;/title&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-update-utmp-runlevel.service&lt;/filename&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is a service that=
 writes SysV runlevel changes to utmp<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and wtmp, as well=
 as the audit logs, as they<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0occur. &lt;filena=
me&gt;systemd-update-utmp.service&lt;/filename&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0does the same for=
 system reboots and shut-down requests.&lt;/para&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsect1&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsect1&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;See =
Also&lt;/title&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;systemd&lt;/refentryt=
itle&gt;&lt;manvolnum&gt;1&lt;/manvolnum&gt;&lt;/citerefentry&gt;,<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;utmp&lt;/refentrytitl=
e&gt;&lt;manvolnum&gt;5&lt;/manvolnum&gt;&lt;/citerefentry&gt;,<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;auditd&lt;/refentryti=
tle&gt;&lt;manvolnum&gt;8&lt;/manvolnum&gt;&lt;/citerefentry&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsect1&gt;<br>
++<br>
++&lt;/refentry&gt;<br>
+diff --git a/src/update-utmp/update-utmp.c b/src/update-utmp/update-utmp.c=
<br>
+index 9184025..202aa98 100644<br>
+--- a/src/update-utmp/update-utmp.c<br>
++++ b/src/update-utmp/update-utmp.c<br>
+@@ -104,7 +104,7 @@ static int get_current_runlevel(Context *c) {<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;3&#39;, SP=
ECIAL_RUNLEVEL3_TARGET },<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;4&#39;, SP=
ECIAL_RUNLEVEL4_TARGET },<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;2&#39;, SP=
ECIAL_RUNLEVEL2_TARGET },<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;S&#39;, SP=
ECIAL_RESCUE_TARGET },<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;1&#39;, SP=
ECIAL_RESCUE_TARGET },<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *interface =3D &q=
uot;org.freedesktop.systemd1.Unit&quot;,<br>
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
+-# =C2=A0This file is part of systemd.<br>
+-#<br>
+-# =C2=A0systemd is free software; you can redistribute it and/or modify i=
t<br>
+-# =C2=A0under the terms of the GNU Lesser General Public License as publi=
shed by<br>
+-# =C2=A0the Free Software Foundation; either version 2.1 of the License, =
or<br>
+-# =C2=A0(at your option) any later version.<br>
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
++# =C2=A0This file is part of systemd.<br>
++#<br>
++# =C2=A0systemd is free software; you can redistribute it and/or modify i=
t<br>
++# =C2=A0under the terms of the GNU Lesser General Public License as publi=
shed by<br>
++# =C2=A0the Free Software Foundation; either version 2.1 of the License, =
or<br>
++# =C2=A0(at your option) any later version.<br>
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
- =C2=A0 =C2=A0<a href=3D"http://foo-projects.org/~sofar/blocked-tests/" ta=
rget=3D"_blank">http://foo-projects.org/~sofar/blocked-tests/</a><br>
-<br>
-There are bootcharts in the &quot;before&quot; and &quot;after&quot; folde=
rs where you<br>
-should be able to see that many low-level services finish 5-7<br>
-seconds earlier with the patch applied (after).<br>
----<br>
- Makefile.am =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-<br>
- src/readahead/readahead-collect.c | =C2=A0 28 +++++++++++++++++++++++++--=
-<br>
- 2 files changed, 26 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/Makefile.am b/Makefile.am<br>
-index 37c1cc2..5861976 100644<br>
---- a/Makefile.am<br>
-+++ b/Makefile.am<br>
-@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES =3D \<br>
- systemd_readahead_LDADD =3D \<br>
- =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://libsystemd-shared.la" target=3D"_b=
lank">libsystemd-shared.la</a> \<br>
- =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://libsystemd-daemon.la" target=3D"_b=
lank">libsystemd-daemon.la</a> \<br>
-- =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libudev.la" target=3D"_blank">libu=
dev.la</a><br>
-+ =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libudev.la" target=3D"_blank">libu=
dev.la</a> -lm<br>
-<br>
- dist_doc_DATA +=3D \<br>
- =C2=A0 =C2=A0 =C2=A0 src/readahead/sd-readahead.c \<br>
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
- =C2=A0*/<br>
-<br>
- static ReadaheadShared *shared =3D NULL;<br>
-+static struct timespec starttime;<br>
-<br>
- /* Avoid collisions with the NULL pointer */<br>
- #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)<br>
-@@ -205,6 +207,7 @@ static unsigned long fd_first_block(int fd) {<br>
- struct item {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *path;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long block;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long bin;<br>
- };<br>
-<br>
- static int qsort_compare(const void *a, const void *b) {<br>
-@@ -213,6 +216,13 @@ static int qsort_compare(const void *a, const void *b=
) {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 i =3D a;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 j =3D b;<br>
-<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* sort by bin first */<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i-&gt;bin &lt; j-&gt;bin)<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i-&gt;bin &gt; j-&gt;bin)<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
-+<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* then sort by sector */<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i-&gt;block &lt; j-&gt;block)<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i-&gt;block &gt; j-&gt;block)<br>
-@@ -250,6 +260,8 @@ static int collect(const char *root) {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto finish;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0clock_gettime(CLOCK_MONOTONIC, &amp;starttime=
);<br>
-+<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If there&#39;s no pack file yet we lower t=
he kernel readahead<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* so that mincore() is accurate. If the=
re is a pack file<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* already we assume it is accurate enou=
gh so that kernel<br>
-@@ -447,10 +459,21 @@ static int collect(const char *root) {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(p);=
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=
 long ul;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 timespec ts;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 item *entry;<br>
-+<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry =
=3D new0(struct item, 1);<br>
-<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ul =3D f=
d_first_block(m-&gt;fd);<br>
-<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((k=
 =3D hashmap_put(files, p, SECTOR_TO_PTR(ul))) &lt; 0) {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock_=
gettime(CLOCK_MONOTONIC, &amp;ts);<br>
-+<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-=
&gt;block =3D ul;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-=
&gt;path =3D strdup(p);<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-=
&gt;bin =3D round((ts.tv_sec - starttime.tv_sec +<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((ts.tv_nsec - starttime.tv_nsec) / =
1000000000.0)) / 2.0);<br>
-+<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((k=
 =3D hashmap_put(files, p, entry)) &lt; 0) {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 log_warning(&quot;set_put() failed: %s&quot;, strerror=
(-k));<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 free(p);<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-@@ -518,8 +541,7 @@ done:<br>
-<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 j =3D ordered;<br=
>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HASHMAP_FOREACH_K=
EY(q, p, files, i) {<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0j-&gt;path =3D p;<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0j-&gt;block =3D PTR_TO_SECTOR(q);<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0memcpy(j, q, sizeof(struct item));<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 j++;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
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
- Makefile.am =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-<br>
- src/readahead/readahead-collect.c | =C2=A0 20 ++++++++++++++------<br>
- 2 files changed, 15 insertions(+), 7 deletions(-)<br>
-<br>
-diff --git a/Makefile.am b/Makefile.am<br>
-index 5861976..37c1cc2 100644<br>
---- a/Makefile.am<br>
-+++ b/Makefile.am<br>
-@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES =3D \<br>
- systemd_readahead_LDADD =3D \<br>
- =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://libsystemd-shared.la" target=3D"_b=
lank">libsystemd-shared.la</a> \<br>
- =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://libsystemd-daemon.la" target=3D"_b=
lank">libsystemd-daemon.la</a> \<br>
-- =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libudev.la" target=3D"_blank">libu=
dev.la</a> -lm<br>
-+ =C2=A0 =C2=A0 =C2=A0<a href=3D"http://libudev.la" target=3D"_blank">libu=
dev.la</a><br>
-<br>
- dist_doc_DATA +=3D \<br>
- =C2=A0 =C2=A0 =C2=A0 src/readahead/sd-readahead.c \<br>
-diff --git a/src/readahead/readahead-collect.c b/src/readahead/readahead-c=
ollect.c<br>
-index 5d22949..e2fd8df 100644<br>
---- a/src/readahead/readahead-collect.c<br>
-+++ b/src/readahead/readahead-collect.c<br>
-@@ -68,7 +68,7 @@<br>
- =C2=A0*/<br>
-<br>
- static ReadaheadShared *shared =3D NULL;<br>
--static struct timespec starttime;<br>
-+static usec_t starttime;<br>
-<br>
- /* Avoid collisions with the NULL pointer */<br>
- #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)<br>
-@@ -260,7 +260,7 @@ static int collect(const char *root) {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto finish;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0clock_gettime(CLOCK_MONOTONIC, &amp;starttime=
);<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0starttime =3D now(CLOCK_MONOTONIC);<br>
-<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If there&#39;s no pack file yet we lower t=
he kernel readahead<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* so that mincore() is accurate. If the=
re is a pack file<br>
-@@ -459,19 +459,27 @@ static int collect(const char *root) {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(p);=
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=
 long ul;<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 timespec ts;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usec_t=
 entrytime;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct i=
tem *entry;<br>
-<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry =
=3D new0(struct item, 1);<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!e=
ntry) {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0r =3D log_oom();<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0goto finish;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ul =3D f=
d_first_block(m-&gt;fd);<br>
-<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock_=
gettime(CLOCK_MONOTONIC, &amp;ts);<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entryt=
ime =3D now(CLOCK_MONOTONIC);<br>
-<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&g=
t;block =3D ul;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry-&g=
t;path =3D strdup(p);<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-=
&gt;bin =3D round((ts.tv_sec - starttime.tv_sec +<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((ts.tv_nsec - starttime.tv_nsec) / =
1000000000.0)) / 2.0);<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!e=
ntry-&gt;path) {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0free(entry);<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0r =3D log_oom();<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0goto finish;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry-=
&gt;bin =3D (entrytime - starttime) / 2000000;<br>
-<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((k =
=3D hashmap_put(files, p, entry)) &lt; 0) {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 log_warning(&quot;set_put() failed: %s&quot;, strerror=
(-k));<br>
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
- src/sysctl/sysctl.c | =C2=A0 =C2=A02 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/sysctl/sysctl.c b/src/sysctl/sysctl.c<br>
-index 2d43660..79f3f77 100644<br>
---- a/src/sysctl/sysctl.c<br>
-+++ b/src/sysctl/sysctl.c<br>
-@@ -125,7 +125,7 @@ static int parse_file(Hashmap *sysctl_options, const c=
har *path, bool ignore_eno<br>
-<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D search_and_fopen_nulstr(path, &quot;re&=
quot;, conf_file_dirs, &amp;f);<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 0) {<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ignore_enoent=
 &amp;&amp; errno =3D=3D -ENOENT)<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ignore_enoent=
 &amp;&amp; r =3D=3D -ENOENT)<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;<br>
-<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error(&quot;F=
ailed to open file &#39;%s&#39;, ignoring: %s&quot;, path, strerror(-r));<b=
r>
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
- =C2=A0 =C2=A0 =C2=A0 =C2=A0[], [enable_gudev=3Dyes])<br>
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
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 [UDEV_BUILTIN_BLKID] =3D &amp;udev_builtin_bl=
kid,<br>
- #endif<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 [UDEV_BUILTIN_BTRFS] =3D &amp;udev_builtin_bt=
rfs,<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 [UDEV_BUILTIN_FIRMWARE] =3D &amp;udev_builtin=
_firmware,<br>
- #endif<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 [UDEV_BUILTIN_HWDB] =3D &amp;udev_builtin_hwd=
b,<br>
-diff --git a/src/udev/udev.h b/src/udev/udev.h<br>
-index aa2edbe..906dfba 100644<br>
---- a/src/udev/udev.h<br>
-+++ b/src/udev/udev.h<br>
-@@ -140,7 +140,7 @@ enum udev_builtin_cmd {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 UDEV_BUILTIN_BLKID,<br>
- #endif<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 UDEV_BUILTIN_BTRFS,<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 UDEV_BUILTIN_FIRMWARE,<br>
- #endif<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 UDEV_BUILTIN_HWDB,<br>
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
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_t devnum;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 int ifindex;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_block;<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool nodelay;<br>
- #endif<br>
- };<br>
-@@ -444,7 +444,7 @@ static int event_queue_insert(struct udev_device *dev)=
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 event-&gt;devnum =3D udev_device_get_devnum(d=
ev);<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 event-&gt;is_block =3D streq(&quot;block&quot=
;, udev_device_get_subsystem(dev));<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 event-&gt;ifindex =3D udev_device_get_ifindex=
(dev);<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (streq(udev_device_get_subsystem(dev), &qu=
ot;firmware&quot;))<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event-&gt;nodelay=
 =3D true;<br>
- #endif<br>
-@@ -527,7 +527,7 @@ static bool is_devpath_busy(struct event *event)<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return true;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* allow to bypas=
s the dependency tracking */<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (event-&gt;nod=
elay)<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
---<br>
-cgit v0.9.0.2-2-gbebe<br>
</div></div>diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-=
mkostemp.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp=
.patch<br>
index fb8443d..0ea2da3 100644<br>
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch<br>
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch<br>
@@ -1,72 +1,74 @@<br>
=C2=A0Upstream-Status: Denied [no desire for uclibc support]<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
<br>
-Index: git/src/journal/journal-send.c<br>
+Index: systemd-204/src/journal/journal-send.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/journal/journal-send.c =C2=A0 =C2=A0 =C2=A0 =C2=A02012-09=
-02 00:10:08.748768268 -0700<br>
-+++ git/src/journal/journal-send.c =C2=A0 =C2=A0 2012-09-02 00:10:10.50876=
8335 -0700<br>
-@@ -34,6 +34,8 @@<br>
-<br>
- #define SNDBUF_SIZE (8*1024*1024)<br>
+--- systemd-204.orig/src/journal/journal-send.c =C2=A0 =C2=A0 =C2=A0 =C2=
=A02013-05-06 12:06:04.000000000 -0700<br>
++++ systemd-204/src/journal/journal-send.c =C2=A0 =C2=A0 2013-05-23 11:21:=
14.500338688 -0700<br>
+@@ -46,6 +46,8 @@<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(*_f + 10, =
_func, _fl); =C2=A0 =C2=A0 \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 } while(false)<br>
<br>
=C2=A0+#include &quot;config.h&quot;<br>
=C2=A0+<br>
=C2=A0 /* We open a single fd, and we&#39;ll share it with the current proc=
ess,<br>
=C2=A0 =C2=A0* all its threads, and all its subprocesses. This means we nee=
d to<br>
=C2=A0 =C2=A0* initialize it atomically, and need to operate on it atomical=
ly<br>
-@@ -293,7 +295,12 @@<br>
+@@ -312,8 +314,13 @@<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Message doesn&#39;t fit... Let&#39;s dump =
the data in a temporary<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* file and just pass a file descri=
ptor of it to the other<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* side */<br>
-<br>
+-<br>
=C2=A0+#ifdef HAVE_MKOSTEMP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer_fd =3D mkostemp(path, O_CLOEXEC|O=
_RDWR);<br>
=C2=A0+#else<br>
-+ =C2=A0 =C2=A0 =C2=A0buffer_fd =3D mkstemp(path);<br>
-+ =C2=A0 =C2=A0 =C2=A0if (buffer_fd &gt;=3D 0) fcntl(buffer_fd, F_SETFD, F=
D_CLOEXEC);<br>
-+#endif =C2=A0 =C2=A0 =C2=A0 =C2=A0/* HAVE_MKOSTEMP */<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buffer_fd &lt; 0) {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D -errno;<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto finish;<br>
-Index: git/src/core/manager.c<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0buffer_fd =3D mkstemp(path);<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (buffer_fd &gt;=3D 0) fcntl(buffer_fd, F_S=
ETFD, FD_CLOEXEC);<br>
++#endif /* HAVE_MKOSTEMP */<br>
++<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buffer_fd &lt; 0)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errno;<br=
>
+<br>
+Index: systemd-204/src/core/manager.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/core/manager.c =C2=A0 =C2=A0 =C2=A0 =C2=A02012-09-02 00:1=
0:08.732768266 -0700<br>
-+++ git/src/core/manager.c =C2=A0 =C2=A0 2012-09-02 00:10:10.512768334 -07=
00<br>
-@@ -67,6 +67,8 @@<br>
- #include &quot;cgroup-util.h&quot;<br>
- #include &quot;path-util.h&quot;<br>
+--- systemd-204.orig/src/core/manager.c =C2=A0 =C2=A0 =C2=A0 =C2=A02013-04=
-25 17:53:56.000000000 -0700<br>
++++ systemd-204/src/core/manager.c =C2=A0 =C2=A0 2013-05-23 11:23:15.86434=
0878 -0700<br>
+@@ -72,6 +72,8 @@<br>
+ #include &quot;audit-fd.h&quot;<br>
+ #include &quot;env-util.h&quot;<br>
<br>
=C2=A0+#include &quot;config.h&quot;<br>
=C2=A0+<br>
=C2=A0 /* As soon as 16 units are in our GC queue, make sure to run a gc sw=
eep */<br>
=C2=A0 #define GC_QUEUE_ENTRIES_MAX 16<br>
<br>
-@@ -1701,7 +1703,12 @@<br>
+@@ -1973,7 +1975,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOM=
EM;<br>
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 saved_umask =3D umask(0077);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 RUN_WITH_UMASK(0077) {<br>
=C2=A0+#ifdef HAVE_MKOSTEMP<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D mkostemp(path, O_RDWR|O_CLOEXEC);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D mkostemp(p=
ath, O_RDWR|O_CLOEXEC);<br>
=C2=A0+#else<br>
-+ =C2=A0 =C2=A0 =C2=A0fd =3D mkstemp(path);<br>
-+ =C2=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0) fcntl(fd, F_SETFD, FD_CLOEXEC);<br=
>
-+#endif =C2=A0 =C2=A0 =C2=A0 =C2=A0/* HAVE_MKOSTEMP */<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 umask(saved_umask);<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D mkstemp(pa=
th);<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0)=
 fcntl(fd, F_SETFD, FD_CLOEXEC);<br>
++#endif /* HAVE_MKOSTEMP */<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
-Index: git/src/shared/util.c<br>
+Index: systemd-204/src/shared/util.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/shared/util.c 2012-09-02 00:10:08.784768269 -0700<br>
-+++ git/src/shared/util.c =C2=A0 =C2=A0 =C2=A02012-09-02 00:10:10.51276833=
4 -0700<br>
-@@ -68,6 +68,8 @@<br>
- #include &quot;exit-status.h&quot;<br>
- #include &quot;hashmap.h&quot;<br>
+--- systemd-204.orig/src/shared/util.c 2013-05-07 12:07:22.000000000 -0700=
<br>
++++ systemd-204/src/shared/util.c =C2=A0 =C2=A0 =C2=A02013-05-23 11:19:35.=
028336822 -0700<br>
+@@ -74,6 +74,8 @@<br>
+ #include &quot;env-util.h&quot;<br>
+ #include &quot;fileio.h&quot;<br>
<br>
=C2=A0+#include &quot;config.h&quot;<br>
=C2=A0+<br>
=C2=A0 int saved_argc =3D 0;<br>
=C2=A0 char **saved_argv =3D NULL;<br>
<br>
-@@ -4519,7 +4521,12 @@<br>
+@@ -3921,7 +3923,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t[k] =3D &#39;.&#39;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stpcpy(stpcpy(t+k+1, fn), &quot;XXXXXX&q=
uot;);<br>
<br>
@@ -79,10 +81,10 @@ Index: git/src/shared/util.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(t);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -errn=
o;<br>
-Index: git/src/shared/ask-password-api.c<br>
+Index: systemd-204/src/shared/ask-password-api.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/shared/ask-password-api.c =C2=A0 =C2=A0 2012-09-02 00:10:=
08.772768268 -0700<br>
-+++ git/src/shared/ask-password-api.c =C2=A02012-09-02 00:10:10.512768334 =
-0700<br>
+--- systemd-204.orig/src/shared/ask-password-api.c =C2=A0 =C2=A0 2013-04-0=
8 08:26:34.000000000 -0700<br>
++++ systemd-204/src/shared/ask-password-api.c =C2=A02013-05-23 11:24:43.45=
6342451 -0700<br>
=C2=A0@@ -37,6 +37,8 @@<br>
<br>
=C2=A0 #include &quot;ask-password-api.h&quot;<br>
@@ -92,24 +94,24 @@ Index: git/src/shared/ask-password-api.c<br>
=C2=A0 static void backspace_chars(int ttyfd, size_t p) {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ttyfd &lt; 0)<br>
-@@ -326,7 +328,12 @@<br>
+@@ -325,7 +327,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir_p_label(&quot;/run/systemd/ask-pas=
sword&quot;, 0755);<br>
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 u =3D umask(0022);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 RUN_WITH_UMASK(0022) {<br>
=C2=A0+#ifdef HAVE_MKOSTEMP<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRO=
NLY);<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =3D mkostemp(t=
emp, O_CLOEXEC|O_CREAT|O_WRONLY);<br>
=C2=A0+#else<br>
-+ =C2=A0 =C2=A0 =C2=A0fd =3D mkstemp(temp);<br>
-+ =C2=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0) fcntl(fd, F_SETFD, FD_CLOEXEC);<br=
>
-+#endif =C2=A0 =C2=A0 =C2=A0 =C2=A0/* HAVE_MKOSTEMP */<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 umask(u);<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D mkstemp(te=
mp);<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd &gt;=3D 0)=
 fcntl(fd, F_SETFD, FD_CLOEXEC);<br>
++#endif /* HAVE_MKOSTEMP */<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
-Index: git/src/journal/journalctl.c<br>
+Index: systemd-204/src/journal/journalctl.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/journal/journalctl.c =C2=A02012-09-02 00:10:08.752768267 =
-0700<br>
-+++ git/src/journal/journalctl.c =C2=A0 =C2=A0 =C2=A0 2012-09-02 00:18:41.=
928787779 -0700<br>
-@@ -540,7 +540,13 @@<br>
+--- systemd-204.orig/src/journal/journalctl.c =C2=A02013-05-07 12:07:22.00=
0000000 -0700<br>
++++ systemd-204/src/journal/journalctl.c =C2=A0 =C2=A0 =C2=A0 2013-05-23 1=
1:19:35.028336822 -0700<br>
+@@ -755,7 +755,13 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n /=3D arg_interval;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close_nointr_nofail(fd);<br>
@@ -123,11 +125,11 @@ Index: git/src/journal/journalctl.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error(&q=
uot;Failed to open %s: %m&quot;, k);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D -errno=
;<br>
-Index: git/src/journal/journal-verify.c<br>
+Index: systemd-204/src/journal/journal-verify.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- git.orig/src/journal/journal-verify.c =C2=A0 =C2=A0 =C2=A02012-09-02 0=
0:10:08.752768267 -0700<br>
-+++ git/src/journal/journal-verify.c =C2=A0 2012-09-02 00:24:10.268800268 =
-0700<br>
-@@ -693,8 +693,12 @@<br>
+--- systemd-204.orig/src/journal/journal-verify.c =C2=A0 =C2=A0 =C2=A02012=
-11-20 13:42:23.000000000 -0800<br>
++++ systemd-204/src/journal/journal-verify.c =C2=A0 2013-05-23 11:19:35.03=
2336822 -0700<br>
+@@ -700,8 +700,12 @@<br>
=C2=A0 #endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (f-&gt;seal)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOK=
EY;<br>
@@ -141,7 +143,7 @@ Index: git/src/journal/journal-verify.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (data_fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error(&q=
uot;Failed to create data file: %m&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D -errno=
;<br>
-@@ -702,7 +706,12 @@<br>
+@@ -709,7 +713,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlink(data_path);<br>
<br>
@@ -154,7 +156,7 @@ Index: git/src/journal/journal-verify.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (entry_fd &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error(&q=
uot;Failed to create entry file: %m&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D -errno=
;<br>
-@@ -710,7 +719,12 @@<br>
+@@ -717,7 +726,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlink(entry_path);<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.pat=
ch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch<br>
index 8d1aa7d..77bb305 100644<br>
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch<br>
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch<br>
@@ -1,10 +1,10 @@<br>
=C2=A0Upstream-Status: Denied [no desire for uclibc support]<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj=
.khem@gmail.com</a>&gt;<br>
<br>
-Index: systemd-198/src/fsck/fsck.c<br>
+Index: systemd-204/src/fsck/fsck.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-198.orig/src/fsck/fsck.c =C2=A0 2013-03-07 13:18:34.000000000 =
-0800<br>
-+++ systemd-198/src/fsck/fsck.c =C2=A0 =C2=A0 =C2=A0 =C2=A02013-03-09 14:4=
9:03.756572873 -0800<br>
+--- systemd-204.orig/src/fsck/fsck.c =C2=A0 2013-04-02 05:48:49.000000000 =
-0700<br>
++++ systemd-204/src/fsck/fsck.c =C2=A0 =C2=A0 =C2=A0 =C2=A02013-05-23 11:2=
6:51.776345015 -0700<br>
=C2=A0@@ -37,6 +37,8 @@<br>
=C2=A0 #include &quot;virt.h&quot;<br>
=C2=A0 #include &quot;fileio.h&quot;<br>
@@ -14,7 +14,7 @@ Index: systemd-198/src/fsck/fsck.c<br>
=C2=A0 static bool arg_skip =3D false;<br>
=C2=A0 static bool arg_force =3D false;<br>
=C2=A0 static bool arg_show_progress =3D false;<br>
-@@ -203,9 +205,16 @@<br>
+@@ -198,9 +200,16 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *device=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 double p;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usec_t t;<br=
>
@@ -33,10 +33,10 @@ Index: systemd-198/src/fsck/fsck.c<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Only show=
 one progress counter at max */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!locked)=
 {<br>
-Index: systemd-198/src/core/swap.c<br>
+Index: systemd-204/src/core/swap.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-198.orig/src/core/swap.c =C2=A0 2013-03-07 13:18:34.000000000 =
-0800<br>
-+++ systemd-198/src/core/swap.c =C2=A0 =C2=A0 =C2=A0 =C2=A02013-03-09 14:4=
9:03.756572873 -0800<br>
+--- systemd-204.orig/src/core/swap.c =C2=A0 2013-05-06 12:06:04.000000000 =
-0700<br>
++++ systemd-204/src/core/swap.c =C2=A0 =C2=A0 =C2=A0 =C2=A02013-05-23 11:2=
6:51.780345015 -0700<br>
=C2=A0@@ -41,6 +41,8 @@<br>
=C2=A0 #include &quot;path-util.h&quot;<br>
=C2=A0 #include &quot;virt.h&quot;<br>
@@ -46,7 +46,7 @@ Index: systemd-198/src/core/swap.c<br>
=C2=A0 static const UnitActiveState state_translation_table[_SWAP_STATE_MAX=
] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [SWAP_DEAD] =3D UNIT_INACTIVE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [SWAP_ACTIVATING] =3D UNIT_ACTIVATING,<b=
r>
-@@ -1037,6 +1039,7 @@<br>
+@@ -1055,6 +1057,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *dev =
=3D NULL, *d;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int prio =3D=
 0, k;<br>
<br>
@@ -54,7 +54,7 @@ Index: systemd-198/src/core/swap.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k =3D fscanf=
(m-&gt;proc_swaps,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%ms &quot; =C2=A0/* device/file */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%*s &quot; =C2=A0/* type of swap */<br=
>
-@@ -1044,6 +1047,16 @@<br>
+@@ -1062,6 +1065,16 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%*s &quot; =C2=A0/* used */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%i\n&quot;, /* priority */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;dev, &amp;prio);<br>
@@ -71,10 +71,10 @@ Index: systemd-198/src/core/swap.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (k !=3D 2=
) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (k =3D=3D EOF)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-Index: systemd-198/src/core/mount-setup.c<br>
+Index: systemd-204/src/core/mount-setup.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-198.orig/src/core/mount-setup.c =C2=A0 =C2=A02013-03-07 13:18:=
34.000000000 -0800<br>
-+++ systemd-198/src/core/mount-setup.c 2013-03-09 14:49:03.760572872 -0800=
<br>
+--- systemd-204.orig/src/core/mount-setup.c =C2=A0 =C2=A02013-04-24 06:34:=
38.000000000 -0700<br>
++++ systemd-204/src/core/mount-setup.c 2013-05-23 11:26:51.780345015 -0700=
<br>
=C2=A0@@ -28,6 +28,7 @@<br>
=C2=A0 #include &lt;assert.h&gt;<br>
=C2=A0 #include &lt;unistd.h&gt;<br>
@@ -92,7 +92,7 @@ Index: systemd-198/src/core/mount-setup.c<br>
=C2=A0 #ifndef TTY_GID<br>
=C2=A0 #define TTY_GID 5<br>
=C2=A0 #endif<br>
-@@ -231,9 +234,12 @@<br>
+@@ -233,9 +236,12 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (;;) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *contro=
ller;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int enabled =
=3D 0;<br>
@@ -107,11 +107,11 @@ Index: systemd-198/src/core/mount-setup.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (feof(f))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
-Index: systemd-198/src/core/mount.c<br>
+Index: systemd-204/src/core/mount.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-198.orig/src/core/mount.c =C2=A02013-03-07 13:18:34.000000000 =
-0800<br>
-+++ systemd-198/src/core/mount.c =C2=A0 =C2=A0 =C2=A0 2013-03-09 14:49:03.=
760572872 -0800<br>
-@@ -42,6 +42,8 @@<br>
+--- systemd-204.orig/src/core/mount.c =C2=A02013-05-06 12:06:04.000000000 =
-0700<br>
++++ systemd-204/src/core/mount.c =C2=A0 =C2=A0 =C2=A0 2013-05-23 11:26:51.=
780345015 -0700<br>
+@@ -43,6 +43,8 @@<br>
=C2=A0 #include &quot;exit-status.h&quot;<br>
=C2=A0 #include &quot;def.h&quot;<br>
<br>
@@ -120,7 +120,7 @@ Index: systemd-198/src/core/mount.c<br>
=C2=A0 static const UnitActiveState state_translation_table[_MOUNT_STATE_MA=
X] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [MOUNT_DEAD] =3D UNIT_INACTIVE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [MOUNT_MOUNTING] =3D UNIT_ACTIVATING,<br=
>
-@@ -1584,7 +1586,7 @@<br>
+@@ -1626,7 +1628,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int k;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 device =3D p=
ath =3D options =3D options2 =3D fstype =3D d =3D p =3D o =3D NULL;<br>
@@ -129,7 +129,7 @@ Index: systemd-198/src/core/mount.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((k =3D f=
scanf(m-&gt;proc_self_mountinfo,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%*s &quot; =C2=A0 =C2=
=A0 =C2=A0 /* (1) mount id */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%*s &quot; =C2=A0 =C2=
=A0 =C2=A0 /* (2) parent id */<br>
-@@ -1603,7 +1605,31 @@<br>
+@@ -1645,7 +1647,31 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;fstype,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;device,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;options2)) !=3D 5) {<br>
@@ -162,10 +162,10 @@ Index: systemd-198/src/core/mount.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (k =3D=3D EOF)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
-Index: systemd-198/src/core/umount.c<br>
+Index: systemd-204/src/core/umount.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-198.orig/src/core/umount.c 2013-03-07 13:18:34.000000000 -0800=
<br>
-+++ systemd-198/src/core/umount.c =C2=A0 =C2=A0 =C2=A02013-03-09 14:49:03.=
760572872 -0800<br>
+--- systemd-204.orig/src/core/umount.c 2013-04-18 08:14:11.000000000 -0700=
<br>
++++ systemd-204/src/core/umount.c =C2=A0 =C2=A0 =C2=A02013-05-23 11:26:51.=
780345015 -0700<br>
=C2=A0@@ -36,6 +36,8 @@<br>
=C2=A0 #include &quot;util.h&quot;<br>
=C2=A0 #include &quot;virt.h&quot;<br>
@@ -235,10 +235,10 @@ Index: systemd-198/src/core/umount.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (k =3D=3D EOF)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
<br>
-Index: systemd-198/src/shared/socket-util.c<br>
+Index: systemd-204/src/shared/socket-util.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-198.orig/src/shared/socket-util.c =C2=A02013-03-07 13:18:34.00=
0000000 -0800<br>
-+++ systemd-198/src/shared/socket-util.c =C2=A0 =C2=A0 =C2=A0 2013-03-09 1=
4:49:03.760572872 -0800<br>
+--- systemd-204.orig/src/shared/socket-util.c =C2=A02013-04-18 08:14:11.00=
0000000 -0700<br>
++++ systemd-204/src/shared/socket-util.c =C2=A0 =C2=A0 =C2=A0 2013-05-23 1=
1:30:53.528348084 -0700<br>
=C2=A0@@ -40,6 +40,8 @@<br>
=C2=A0 #include &quot;missing.h&quot;<br>
=C2=A0 #include &quot;fileio.h&quot;<br>
@@ -252,25 +252,25 @@ Index: systemd-198/src/shared/socket-util.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a-&gt;type =3D SOCK_RAW;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D 0;<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sscanf(s, &quot;%ms %u&quot;, &amp;sfamil=
y, &amp;group) &lt; 1)<br>
=C2=A0+#ifdef HAVE_MSFORMAT<br>
-+ =C2=A0 =C2=A0 =C2=A0if (sscanf(s, &quot;%ms %u&quot;, &amp;sfamily, &amp=
;group) &lt; 1)<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(s, &quot;%ms %u&quot;, &amp;sfamil=
y, &amp;group) &lt; 1)<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return errno &gt;=
 0 ? -errno : -EINVAL;<br>
=C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return errno=
 ? -errno : -EINVAL;<br>
=C2=A0+#else<br>
-+ =C2=A0 =C2=A0 =C2=A0sfamily =3D malloc(257);<br>
-+ =C2=A0 =C2=A0 =C2=A0if (sscanf(s, &quot;%256s %u&quot;, sfamily, &amp;gr=
oup) &lt; 1) {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(sfamily);<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return errno ? -e=
rrno : -EINVAL;<br>
-+ =C2=A0 =C2=A0 =C2=A0}<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0sfamily =3D malloc(257);<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sscanf(s, &quot;%256s %u&quot;, sfamily, =
&amp;group) &lt; 1) {<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(sfamily);<b=
r>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return errno ? -=
errno : -EINVAL;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0+#endif /* HAVE_MSFORMAT */<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 family =3D netlink_family_from_string(sf=
amily);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (family &lt; 0)<br>
-Index: systemd-198/src/tmpfiles/tmpfiles.c<br>
+Index: systemd-204/src/tmpfiles/tmpfiles.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-198.orig/src/tmpfiles/tmpfiles.c =C2=A0 2013-03-07 13:18:34.00=
0000000 -0800<br>
-+++ systemd-198/src/tmpfiles/tmpfiles.c =C2=A0 =C2=A0 =C2=A0 =C2=A02013-03=
-09 14:55:40.772566599 -0800<br>
-@@ -51,6 +51,8 @@<br>
+--- systemd-204.orig/src/tmpfiles/tmpfiles.c =C2=A0 2013-04-24 06:34:38.00=
0000000 -0700<br>
++++ systemd-204/src/tmpfiles/tmpfiles.c =C2=A0 =C2=A0 =C2=A0 =C2=A02013-05=
-23 11:26:51.784345016 -0700<br>
+@@ -52,6 +52,8 @@<br>
=C2=A0 #include &quot;conf-files.h&quot;<br>
=C2=A0 #include &quot;capability.h&quot;<br>
<br>
@@ -279,7 +279,7 @@ Index: systemd-198/src/tmpfiles/tmpfiles.c<br>
=C2=A0 /* This reads all files listed in /etc/tmpfiles.d/?*.conf and create=
s<br>
=C2=A0 =C2=A0* them in the file system. This is intended to be used to crea=
te<br>
=C2=A0 =C2=A0* properly owned directories beneath /tmp, /var/tmp, /run, whi=
ch are<br>
-@@ -993,6 +995,7 @@<br>
+@@ -1029,6 +1031,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!i)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return log_o=
om();<br>
<br>
@@ -287,7 +287,7 @@ Index: systemd-198/src/tmpfiles/tmpfiles.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D sscanf(buffer,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;%c %ms %ms %ms %ms %ms %n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;type,<br>
-@@ -1002,6 +1005,29 @@<br>
+@@ -1038,6 +1041,29 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;group,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;age,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&amp;n);<br>
@@ -316,11 +316,11 @@ Index: systemd-198/src/tmpfiles/tmpfiles.c<br>
=C2=A0+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r &lt; 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_error(&q=
uot;[%s:%u] Syntax error.&quot;, fname, line);<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D -EIO;<br>
-Index: systemd-198/src/cryptsetup/cryptsetup-generator.c<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;<br>
+Index: systemd-204/src/cryptsetup/cryptsetup-generator.c<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-198.orig/src/cryptsetup/cryptsetup-generator.c =C2=A0 =C2=A0 2=
013-03-07 13:18:34.000000000 -0800<br>
-+++ systemd-198/src/cryptsetup/cryptsetup-generator.c =C2=A02013-03-09 14:=
51:33.080571639 -0800<br>
+--- systemd-204.orig/src/cryptsetup/cryptsetup-generator.c =C2=A0 =C2=A0 2=
013-05-06 12:06:04.000000000 -0700<br>
++++ systemd-204/src/cryptsetup/cryptsetup-generator.c =C2=A02013-05-23 11:=
26:51.784345016 -0700<br>
=C2=A0@@ -31,6 +31,8 @@<br>
=C2=A0 #include &quot;strv.h&quot;<br>
=C2=A0 #include &quot;fileio.h&quot;<br>
@@ -330,7 +330,7 @@ Index: systemd-198/src/cryptsetup/cryptsetup-generator.=
c<br>
=C2=A0 static const char *arg_dest =3D &quot;/tmp&quot;;<br>
=C2=A0 static bool arg_enabled =3D true;<br>
=C2=A0 static bool arg_read_crypttab =3D true;<br>
-@@ -395,7 +397,16 @@<br>
+@@ -398,7 +400,16 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (*l =3D=3D &#39;#&#39; || *l =3D=3D 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" ta=
rget=3D"_blank">systemd_199.bb</a> b/meta/recipes-core/systemd/<a href=3D"h=
ttp://systemd_204.bb" target=3D"_blank">systemd_204.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" tar=
get=3D"_blank">systemd_199.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" targe=
t=3D"_blank">systemd_204.bb</a><br>
index b1cc046..ec5be1f 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" target=3D=
"_blank">systemd_199.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=3D=
"_blank">systemd_204.bb</a><br>
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D751419=
260aa954499f7abaabaa882bbe \<br>
=C2=A0PROVIDES =3D &quot;udev&quot;<br>
<br>
=C2=A0PE =3D &quot;1&quot;<br>
-PR =3D &quot;r4&quot;<br>
<br>
-DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-native&=
quot;<br>
+DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native intltool-native gperf-n=
ative acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-native =
util-linux&quot;<br>
=C2=A0DEPENDS +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;p=
am&#39;, &#39;libpam&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0SECTION =3D &quot;base/shell&quot;<br>
@@ -23,16 +22,12 @@ SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org=
/software/systemd/systemd-${PV}.tar.xz" target=3D"_blank">http://www.freede=
sktop.org/software/systemd/systemd-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://modprobe.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://var-run.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${UCLIBCPATCHES} \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-utmp-turn-systemd-update-u=
tmp-shutdown.service-into-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00-create-volatile.conf \<=
br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-readahead-chunk-on-spinnin=
g-media.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-readahead-cleanups.patch \=
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0013-systemd-sysctl-Handle-miss=
ing-etc-sysctl.conf-proper.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure-use-AC_CHECK_TOO=
L-for-objcopy-strings-and-.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://199-firmware.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;4bb13f84ce211e93f0141774a90a2322&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8c4462a04f3ecf7f083782e5e0687913b1d33c6444bf2=
0fa2f31df9222965fed&quot;<br>
+SRC_URI[md5sum] =3D &quot;a07619bb19f48164fbf0761d12fd39a8&quot;<br>
+SRC_URI[sha256sum] =3D &quot;072c393503c7c1e55ca7acf3db659cbd28c7fe5fa94fa=
b3db95360bafd96731b&quot;<br>
<br>
=C2=A0UCLIBCPATCHES =3D &quot;&quot;<br>
=C2=A0UCLIBCPATCHES_libc-uclibc =3D &quot;file://systemd-pam-configure-chec=
k-uclibc.patch \<br>
--<br>
1.8.2.3<br>
<br>
</div></div></blockquote></div><br></div></div>

--089e011822e0c6416904dd730a7a--
