Return-Path: <net147@gmail.com>
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mail.openembedded.org (Postfix) with ESMTP id 81C536065B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 00:48:58 +0000 (UTC)
Received: by mail-vb0-f53.google.com with SMTP id p13so422041vbe.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 17:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ho9TGOzCBF4RrHr0lCi8wuCd7FVoWpnfFmydyTQ/nhc=;
	b=tkbyvCLYT7Jw4DtdMWeNMptGqYkLlgn3EIeZepzUB1AbbhmXjjt3xexH9subT4ljcP
	235v3bpg3XVuGrNwlTe0cGS7xbvGSVPzZxwzIICep57oUQLwzMQUdzi7wCB2nZ8HvyLE
	mQ41ndInLDy1dM4K5tLNdsbcv8Y7NTfof6cWoY7qLYAR9QSXOZuNZ5t5YvP1vLSu5CFA
	22XsUz9WM22N6q7I+LjgyNcPgJkiaC9g7+n0vqT5CocJ0OqI5A+UiyPliZMTJ5GCu2f6
	kD3SXk7c2i7EixATQBXRBP9Bf0vqAjaJ+FXrrsfkPKMuWDrN42f7ghEmYznZQhjRHvOO
	Fujg==
MIME-Version: 1.0
X-Received: by 10.220.101.69 with SMTP id b5mr3744592vco.55.1369270138666;
	Wed, 22 May 2013 17:48:58 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Wed, 22 May 2013 17:48:58 -0700 (PDT)
In-Reply-To: <519D5A90.4030400@linux.intel.com>
References: <1369265988-32215-1-git-send-email-net147@gmail.com>
	<519D5A90.4030400@linux.intel.com>
Date: Thu, 23 May 2013 10:48:58 +1000
Message-ID: <CANwerB35h3TxRxayRoas85aZrd=zA9Wy2TYRRzYjqaASRW68_Q@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] systemd: update to 204
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
X-List-Received-Date: Thu, 23 May 2013 00:48:59 -0000
Content-Type: multipart/alternative; boundary=047d7b3a7e92378b8e04dd580c96

--047d7b3a7e92378b8e04dd580c96
Content-Type: text/plain; charset=UTF-8

On 23 May 2013 09:53, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/22/2013 04:39 PM, Jonathan Liu wrote:
>
>> Removed patches integrated upstream.
>> Added backport of fix for utmp not running at shutdown.
>> Updated serial-getty service.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   .../systemd-serialgetty/**serial-getty@.service      |  16 +-
>>   ...se-AC_CHECK_TOOL-for-**objcopy-strings-and-.patch |  41 ---
>>   ...ystemd-update-utmp-**shutdown.service-into-.patch | 367
>> +++++++++++++++++++++
>>   .../0002-readahead-chunk-on-**spinning-media.patch   | 142 --------
>>   .../systemd/systemd/0003-**readahead-cleanups.patch  |  86 -----
>>   ...ctl-Handle-missing-etc-**sysctl.conf-proper.patch |  33 --
>>   .../systemd/systemd/199-**firmware.patch             |  98 ------
>>   .../systemd/{systemd_199.bb => systemd_204.bb}     |  11 +-
>>   8 files changed, 380 insertions(+), 414 deletions(-)
>>   delete mode 100644 meta/recipes-core/systemd/**
>> systemd/0001-configure-use-AC_**CHECK_TOOL-for-objcopy-**
>> strings-and-.patch
>>   create mode 100644 meta/recipes-core/systemd/**systemd/0001-utmp-turn-*
>> *systemd-update-utmp-shutdown.**service-into-.patch
>>   delete mode 100644 meta/recipes-core/systemd/**
>> systemd/0002-readahead-chunk-**on-spinning-media.patch
>>   delete mode 100644 meta/recipes-core/systemd/**systemd/0003-readahead-*
>> *cleanups.patch
>>   delete mode 100644 meta/recipes-core/systemd/**
>> systemd/0013-systemd-sysctl-**Handle-missing-etc-sysctl.**
>> conf-proper.patch
>>   delete mode 100644 meta/recipes-core/systemd/**
>> systemd/199-firmware.patch
>>   rename meta/recipes-core/systemd/{sys**temd_199.bb<http://systemd_199.bb>=>
>> systemd_204.bb} (95%)
>>
>>
> I am having some trouble applying this patch to both my MUT and master
> branches.
>
> Sau!

It looks like it still depends on the FHS patch. The patch rename
systemd_199.bb while FHS patch modified systemd_199.bb.
I have rebased the systemd patch to come before the FHS patch and submitted
V4 which should allow you to apply to master.

Regards,
Jonathan


>
>
>
>  diff --git a/meta/recipes-core/systemd/**systemd-serialgetty/serial-**
>> getty@.service b/meta/recipes-core/systemd/**systemd-serialgetty/serial-*
>> *getty@.service
>> index 8eeaab6..1c14dfe 100644
>> --- a/meta/recipes-core/systemd/**systemd-serialgetty/serial-**getty@
>> .service
>> +++ b/meta/recipes-core/systemd/**systemd-serialgetty/serial-**getty@
>> .service
>> @@ -1,23 +1,27 @@
>>   #  This file is part of systemd.
>>   #
>>   #  systemd is free software; you can redistribute it and/or modify it
>> -#  under the terms of the GNU General Public License as published by
>> -#  the Free Software Foundation; either version 2 of the License, or
>> +#  under the terms of the GNU Lesser General Public License as published
>> by
>> +#  the Free Software Foundation; either version 2.1 of the License, or
>>   #  (at your option) any later version.
>>
>>   [Unit]
>>   Description=Serial Getty on %I
>> -BindTo=dev-%i.device
>> -After=dev-%i.device systemd-user-sessions.service
>> +Documentation=man:agetty(8) man:systemd-getty-generator(8)
>> +Documentation=http://**0pointer.de/blog/projects/**serial-console.html<http://0pointer.de/blog/projects/serial-console.html>
>> +BindsTo=dev-%i.device
>> +After=dev-%i.device systemd-user-sessions.service
>> plymouth-quit-wait.service
>> +After=rc-local.service
>>
>>   # If additional gettys are spawned during boot then we should make
>>   # sure that this is synchronized before getty.target, even though
>>   # getty.target didn't actually pull it in.
>>   Before=getty.target
>> +IgnoreOnIsolate=yes
>>
>>   [Service]
>> -Environment=TERM=vt100
>> -ExecStart=-/sbin/agetty -s %I @BAUDRATE@
>> +ExecStart=-/sbin/agetty -s %I @BAUDRATE@ vt102
>> +Type=idle
>>   Restart=always
>>   RestartSec=0
>>   UtmpIdentifier=%I
>> diff --git a/meta/recipes-core/systemd/**systemd/0001-configure-use-AC_**
>> CHECK_TOOL-for-objcopy-**strings-and-.patch b/meta/recipes-core/systemd/*
>> *systemd/0001-configure-use-AC_**CHECK_TOOL-for-objcopy-**
>> strings-and-.patch
>> deleted file mode 100644
>> index d847bbc..0000000
>> --- a/meta/recipes-core/systemd/**systemd/0001-configure-use-AC_**
>> CHECK_TOOL-for-objcopy-**strings-and-.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -From d6f92bcbbae9a577adb9588c7b2783**a5d0bf343d Mon Sep 17 00:00:00 2001
>> -From: Martin Jansa <Martin.Jansa@gmail.com>
>> -Date: Tue, 16 Apr 2013 14:20:41 +0200
>> -Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings and
>> gperf
>> -
>> -* using AC_PATH_TOOL does not allow to override it from shell environment
>> -  which is useful when cross-compiling
>> -* with external toolchain I have different HOST_PREFIX and HOST_SYS
>> -  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
>> -  which is available only as ${TARGET_PREFIX}objcopy then it tries
>> -  objcopy without prefix which is found on host, but that objcopy
>> -  does not work for !host (e.g. arm when building on x86) libs
>> -
>> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> -Upstream-Status: Submitted
>> -http://lists.freedesktop.org/**archives/systemd-devel/2013-**
>> April/010468.html<http://lists.freedesktop.org/archives/systemd-devel/2013-April/010468.html>
>> -
>> ----
>> - configure.ac | 6 +++---
>> - 1 file changed, 3 insertions(+), 3 deletions(-)
>> -
>> -diff --git a/configure.ac b/configure.ac
>> -index 33b0ca9..519f1a9 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([**1.31.1])
>> -    AM_CONDITIONAL([HAVE_**INTROSPECTION], [false])
>> -    enable_introspection=no])
>> -
>> --AC_PATH_TOOL(OBJCOPY, objcopy)
>> --AC_PATH_TOOL(STRINGS, strings)
>> --AC_PATH_TOOL(GPERF, gperf)
>> -+AC_CHECK_TOOL(OBJCOPY, objcopy)
>> -+AC_CHECK_TOOL(STRINGS, strings)
>> -+AC_CHECK_TOOL(GPERF, gperf)
>> - if test -z "$GPERF" ; then
>> -         AC_MSG_ERROR([*** gperf not found])
>> - fi
>> ---
>> -1.8.1.5
>> -
>> diff --git a/meta/recipes-core/systemd/**systemd/0001-utmp-turn-**
>> systemd-update-utmp-shutdown.**service-into-.patch
>> b/meta/recipes-core/systemd/**systemd/0001-utmp-turn-**
>> systemd-update-utmp-shutdown.**service-into-.patch
>> new file mode 100644
>> index 0000000..86fab97
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/**systemd/0001-utmp-turn-**
>> systemd-update-utmp-shutdown.**service-into-.patch
>> @@ -0,0 +1,367 @@
>> +Upstream-Status: Backport
>> +Signed-off-by: Jonathan Liu <net147@gmail.com>
>> +
>> +From 3f92e4b4b61042391bd44de4dceb18**177df0dd57 Mon Sep 17 00:00:00 2001
>> +From: Lennart Poettering <lennart@poettering.net>
>> +Date: Thu, 16 May 2013 00:19:03 +0200
>> +Subject: [PATCH] utmp: turn systemd-update-utmp-shutdown.**service into
>> a normal
>> + runtime service
>> +
>> +With this change systemd-update-utmp-shutdown.**service is replaced by
>> +systemd-update-utmp.service which is started at boot and stays around
>> +until shutdown. This allows us to properly order the unit against both
>> +/var/log and auditd.
>> +
>> +https://bugzilla.redhat.com/**show_bug.cgi?id=853104<https://bugzilla.redhat.com/show_bug.cgi?id=853104>
>> +https://bugs.freedesktop.org/**show_bug.cgi?id=64365<https://bugs.freedesktop.org/show_bug.cgi?id=64365>
>> +---
>> + Makefile-man.am                               | 12 ++---
>> + Makefile.am                                   |  8 +--
>> + man/systemd-update-utmp-**runlevel.service.xml  | 76
>> ---------------------------
>> + man/systemd-update-utmp.**service.xml           | 76
>> +++++++++++++++++++++++++++
>> + src/update-utmp/update-utmp.c                 |  2 +-
>> + units/.gitignore                              |  2 +-
>> + units/systemd-update-utmp-**runlevel.service.in<http://systemd-update-utmp-runlevel.service.in>|  8 +--
>> + units/systemd-update-utmp-**shutdown.service.in<http://systemd-update-utmp-shutdown.service.in>| 19 -------
>> + units/systemd-update-utmp.**service.in<http://systemd-update-utmp.service.in>         | 21 ++++++++
>> + 9 files changed, 114 insertions(+), 110 deletions(-)
>> + delete mode 100644 man/systemd-update-utmp-**runlevel.service.xml
>> + create mode 100644 man/systemd-update-utmp.**service.xml
>> + delete mode 100644 units/systemd-update-utmp-**shutdown.service.in<http://systemd-update-utmp-shutdown.service.in>
>> + create mode 100644 units/systemd-update-utmp.**service.in<http://systemd-update-utmp.service.in>
>> +
>> +diff --git a/Makefile-man.am b/Makefile-man.am
>> +index 7d62094..5888158 100644
>> +--- a/Makefile-man.am
>> ++++ b/Makefile-man.am
>> +@@ -72,7 +72,7 @@ MANPAGES += \
>> +       man/systemd-tmpfiles.8 \
>> +       man/systemd-tty-ask-password-**agent.1 \
>> +       man/systemd-udevd.service.8 \
>> +-      man/systemd-update-utmp-**runlevel.service.8 \
>> ++      man/systemd-update-utmp.**service.8 \
>> +       man/systemd.1 \
>> +       man/systemd.automount.5 \
>> +       man/systemd.device.5 \
>> +@@ -191,7 +191,7 @@ MANPAGES_ALIAS += \
>> +       man/systemd-udevd-control.**socket.8 \
>> +       man/systemd-udevd-kernel.**socket.8 \
>> +       man/systemd-udevd.8 \
>> +-      man/systemd-update-utmp-**shutdown.service.8 \
>> ++      man/systemd-update-utmp-**runlevel.service.8 \
>> +       man/systemd-update-utmp.8 \
>> +       man/systemd-user.conf.5
>> + man/SD_ALERT.3: man/sd-daemon.3
>> +@@ -289,8 +289,8 @@ man/systemd-tmpfiles-setup.**service.8:
>> man/systemd-tmpfiles.8
>> + man/systemd-udevd-control.**socket.8: man/systemd-udevd.service.8
>> + man/systemd-udevd-kernel.**socket.8: man/systemd-udevd.service.8
>> + man/systemd-udevd.8: man/systemd-udevd.service.8
>> +-man/systemd-update-utmp-**shutdown.service.8: man/systemd-update-utmp-*
>> *runlevel.service.8
>> +-man/systemd-update-utmp.8: man/systemd-update-utmp-**runlevel.service.8
>> ++man/systemd-update-utmp-**runlevel.service.8: man/systemd-update-utmp.*
>> *service.8
>> ++man/systemd-update-utmp.8: man/systemd-update-utmp.**service.8
>> + man/systemd-user.conf.5: man/systemd-system.conf.5
>> + man/SD_ALERT.html: man/sd-daemon.html
>> +       $(html-alias)
>> +@@ -577,10 +577,10 @@ man/systemd-udevd-kernel.**socket.html:
>> man/systemd-udevd.service.html
>> + man/systemd-udevd.html: man/systemd-udevd.service.html
>> +       $(html-alias)
>> +
>> +-man/systemd-update-utmp-**shutdown.service.html:
>> man/systemd-update-utmp-**runlevel.service.html
>> ++man/systemd-update-utmp-**runlevel.service.html:
>> man/systemd-update-utmp.**service.html
>> +       $(html-alias)
>> +
>> +-man/systemd-update-utmp.**html: man/systemd-update-utmp-**
>> runlevel.service.html
>> ++man/systemd-update-utmp.**html: man/systemd-update-utmp.**service.html
>> +       $(html-alias)
>> +
>> + man/systemd-user.conf.html: man/systemd-system.conf.html
>> +diff --git a/Makefile.am b/Makefile.am
>> +index 8d8139c..4c5e6fc 100644
>> +--- a/Makefile.am
>> ++++ b/Makefile.am
>> +@@ -417,8 +417,8 @@ nodist_systemunit_DATA = \
>> +       units/systemd-initctl.service \
>> +       units/systemd-shutdownd.**service \
>> +       units/systemd-remount-fs.**service \
>> ++      units/systemd-update-utmp.**service \
>> +       units/systemd-update-utmp-**runlevel.service \
>> +-      units/systemd-update-utmp-**shutdown.service \
>> +       units/systemd-tmpfiles-setup-**dev.service \
>> +       units/systemd-tmpfiles-setup.**service \
>> +       units/systemd-tmpfiles-clean.**service \
>> +@@ -463,8 +463,8 @@ EXTRA_DIST += \
>> +       units/systemd-initctl.service.**in<http://systemd-initctl.service.in>\
>> +       units/systemd-shutdownd.**service.in<http://systemd-shutdownd.service.in>\
>> +       units/systemd-remount-fs.**service.in<http://systemd-remount-fs.service.in>\
>> ++      units/systemd-update-utmp.**service.in<http://systemd-update-utmp.service.in>\
>> +       units/systemd-update-utmp-**runlevel.service.in<http://systemd-update-utmp-runlevel.service.in>\
>> +-      units/systemd-update-utmp-**shutdown.service.in<http://systemd-update-utmp-shutdown.service.in>\
>> +       units/systemd-tmpfiles-setup-**dev.service.in<http://systemd-tmpfiles-setup-dev.service.in>\
>> +       units/systemd-tmpfiles-setup.**service.in<http://systemd-tmpfiles-setup.service.in>\
>> +       units/systemd-tmpfiles-clean.**service.in<http://systemd-tmpfiles-clean.service.in>\
>> +@@ -4070,8 +4070,8 @@ RUNLEVEL4_TARGET_WANTS += \
>> + RUNLEVEL5_TARGET_WANTS += \
>> +       systemd-update-utmp-runlevel.**service
>> + endif
>> +-SHUTDOWN_TARGET_WANTS += \
>> +-      systemd-update-utmp-shutdown.**service
>> ++SYSINIT_TARGET_WANTS += \
>> ++      systemd-update-utmp.service
>> + LOCAL_FS_TARGET_WANTS += \
>> +       systemd-remount-fs.service \
>> +       systemd-fsck-root.service \
>> +diff --git a/man/systemd-update-utmp-**runlevel.service.xml
>> b/man/systemd-update-utmp-**runlevel.service.xml
>> +deleted file mode 100644
>> +index 867b958..0000000
>> +--- a/man/systemd-update-utmp-**runlevel.service.xml
>> ++++ /dev/null
>> +@@ -1,76 +0,0 @@
>> +-<?xml version="1.0"?>
>> +-<!--*-nxml-*-->
>> +-<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "
>> http://www.oasis-open.org/**docbook/xml/4.2/docbookx.dtd<http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd>
>> ">
>> +-<!--
>> +-  This file is part of systemd.
>> +-
>> +-  Copyright 2012 Lennart Poettering
>> +-
>> +-  systemd is free software; you can redistribute it and/or modify it
>> +-  under the terms of the GNU Lesser General Public License as published
>> by
>> +-  the Free Software Foundation; either version 2.1 of the License, or
>> +-  (at your option) any later version.
>> +-
>> +-  systemd is distributed in the hope that it will be useful, but
>> +-  WITHOUT ANY WARRANTY; without even the implied warranty of
>> +-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>> +-  Lesser General Public License for more details.
>> +-
>> +-  You should have received a copy of the GNU Lesser General Public
>> License
>> +-  along with systemd; If not, see <http://www.gnu.org/licenses/>**.
>> +--->
>> +-<refentry id="systemd-update-utmp-**runlevel.service">
>> +-
>> +-        <refentryinfo>
>> +-                <title>systemd-update-utmp-**runlevel.service</title>
>> +-                <productname>systemd</**productname>
>> +-
>> +-                <authorgroup>
>> +-                        <author>
>> +-                                <contrib>Developer</contrib>
>> +-                                <firstname>Lennart</firstname>
>> +-                                <surname>Poettering</surname>
>> +-                                <email>lennart@poettering.net<**/email>
>> +-                        </author>
>> +-                </authorgroup>
>> +-        </refentryinfo>
>> +-
>> +-        <refmeta>
>> +-                <refentrytitle>systemd-update-**utmp-runlevel.service</
>> **refentrytitle>
>> +-                <manvolnum>8</manvolnum>
>> +-        </refmeta>
>> +-
>> +-        <refnamediv>
>> +-                <refname>systemd-update-utmp-**
>> runlevel.service</refname>
>> +-                <refname>systemd-update-utmp-**
>> shutdown.service</refname>
>> +-                <refname>systemd-update-utmp</**refname>
>> +-                <refpurpose>Write audit and utmp updates at runlevel
>> +-                changes and shutdown</refpurpose>
>> +-        </refnamediv>
>> +-
>> +-        <refsynopsisdiv>
>> +-                <para><filename>systemd-**
>> update-utmp-runlevel.service</**filename></para>
>> +-                <para><filename>systemd-**
>> update-utmp-shutdown.service</**filename></para>
>> +-                <para><filename>/usr/lib/**
>> systemd/systemd-update-utmp</**filename></para>
>> +-        </refsynopsisdiv>
>> +-
>> +-        <refsect1>
>> +-                <title>Description</title>
>> +-
>> +-                <para><filename>systemd-**
>> update-utmp-runlevel.service</**filename>
>> +-                is a service that writes SysV runlevel changes to utmp
>> +-                and wtmp, as well as the audit logs, as they
>> +-                occur. <filename>systemd-update-utmp-**
>> shutdown.service</filename>
>> +-                does the same for shut-down requests.</para>
>> +-        </refsect1>
>> +-
>> +-        <refsect1>
>> +-                <title>See Also</title>
>> +-                <para>
>> +-                        <citerefentry><refentrytitle>**
>> systemd</refentrytitle><**manvolnum>1</manvolnum></**citerefentry>,
>> +-                        <citerefentry><refentrytitle>**
>> utmp</refentrytitle><**manvolnum>5</manvolnum></**citerefentry>,
>> +-                        <citerefentry><refentrytitle>**
>> auditd</refentrytitle><**manvolnum>8</manvolnum></**citerefentry>
>> +-                </para>
>> +-        </refsect1>
>> +-
>> +-</refentry>
>> +diff --git a/man/systemd-update-utmp.**service.xml
>> b/man/systemd-update-utmp.**service.xml
>> +new file mode 100644
>> +index 0000000..846fc95
>> +--- /dev/null
>> ++++ b/man/systemd-update-utmp.**service.xml
>> +@@ -0,0 +1,76 @@
>> ++<?xml version="1.0"?>
>> ++<!--*-nxml-*-->
>> ++<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "
>> http://www.oasis-open.org/**docbook/xml/4.2/docbookx.dtd<http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd>
>> ">
>> ++<!--
>> ++  This file is part of systemd.
>> ++
>> ++  Copyright 2012 Lennart Poettering
>> ++
>> ++  systemd is free software; you can redistribute it and/or modify it
>> ++  under the terms of the GNU Lesser General Public License as published
>> by
>> ++  the Free Software Foundation; either version 2.1 of the License, or
>> ++  (at your option) any later version.
>> ++
>> ++  systemd is distributed in the hope that it will be useful, but
>> ++  WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>> ++  Lesser General Public License for more details.
>> ++
>> ++  You should have received a copy of the GNU Lesser General Public
>> License
>> ++  along with systemd; If not, see <http://www.gnu.org/licenses/>**.
>> ++-->
>> ++<refentry id="systemd-update-utmp.**service">
>> ++
>> ++        <refentryinfo>
>> ++                <title>systemd-update-utmp.**service</title>
>> ++                <productname>systemd</**productname>
>> ++
>> ++                <authorgroup>
>> ++                        <author>
>> ++                                <contrib>Developer</contrib>
>> ++                                <firstname>Lennart</firstname>
>> ++                                <surname>Poettering</surname>
>> ++                                <email>lennart@poettering.net<**/email>
>> ++                        </author>
>> ++                </authorgroup>
>> ++        </refentryinfo>
>> ++
>> ++        <refmeta>
>> ++                <refentrytitle>systemd-update-**
>> utmp.service</refentrytitle>
>> ++                <manvolnum>8</manvolnum>
>> ++        </refmeta>
>> ++
>> ++        <refnamediv>
>> ++                <refname>systemd-update-utmp.**service</refname>
>> ++                <refname>systemd-update-utmp-**
>> runlevel.service</refname>
>> ++                <refname>systemd-update-utmp</**refname>
>> ++                <refpurpose>Write audit and utmp updates at bootup,
>> runlevel
>> ++                changes and shutdown</refpurpose>
>> ++        </refnamediv>
>> ++
>> ++        <refsynopsisdiv>
>> ++                <para><filename>systemd-**
>> update-utmp.service</filename>**</para>
>> ++                <para><filename>systemd-**
>> update-utmp-runlevel.service</**filename></para>
>> ++                <para><filename>/usr/lib/**
>> systemd/systemd-update-utmp</**filename></para>
>> ++        </refsynopsisdiv>
>> ++
>> ++        <refsect1>
>> ++                <title>Description</title>
>> ++
>> ++                <para><filename>systemd-**
>> update-utmp-runlevel.service</**filename>
>> ++                is a service that writes SysV runlevel changes to utmp
>> ++                and wtmp, as well as the audit logs, as they
>> ++                occur. <filename>systemd-update-utmp.**
>> service</filename>
>> ++                does the same for system reboots and shut-down
>> requests.</para>
>> ++        </refsect1>
>> ++
>> ++        <refsect1>
>> ++                <title>See Also</title>
>> ++                <para>
>> ++                        <citerefentry><refentrytitle>**
>> systemd</refentrytitle><**manvolnum>1</manvolnum></**citerefentry>,
>> ++                        <citerefentry><refentrytitle>**
>> utmp</refentrytitle><**manvolnum>5</manvolnum></**citerefentry>,
>> ++                        <citerefentry><refentrytitle>**
>> auditd</refentrytitle><**manvolnum>8</manvolnum></**citerefentry>
>> ++                </para>
>> ++        </refsect1>
>> ++
>> ++</refentry>
>> +diff --git a/src/update-utmp/update-utmp.**c
>> b/src/update-utmp/update-utmp.**c
>> +index 9184025..202aa98 100644
>> +--- a/src/update-utmp/update-utmp.**c
>> ++++ b/src/update-utmp/update-utmp.**c
>> +@@ -104,7 +104,7 @@ static int get_current_runlevel(Context *c) {
>> +                 { '3', SPECIAL_RUNLEVEL3_TARGET },
>> +                 { '4', SPECIAL_RUNLEVEL4_TARGET },
>> +                 { '2', SPECIAL_RUNLEVEL2_TARGET },
>> +-                { 'S', SPECIAL_RESCUE_TARGET },
>> ++                { '1', SPECIAL_RESCUE_TARGET },
>> +         };
>> +         const char
>> +                 *interface = "org.freedesktop.systemd1.**Unit",
>> +diff --git a/units/systemd-update-utmp-**runlevel.service.in<http://systemd-update-utmp-runlevel.service.in>b/units/
>> systemd-update-utmp-**runlevel.service.in<http://systemd-update-utmp-runlevel.service.in>
>> +index 27fae2c..99783e2 100644
>> +--- a/units/systemd-update-utmp-**runlevel.service.in<http://systemd-update-utmp-runlevel.service.in>
>> ++++ b/units/systemd-update-utmp-**runlevel.service.in<http://systemd-update-utmp-runlevel.service.in>
>> +@@ -7,12 +7,14 @@
>> +
>> + [Unit]
>> + Description=Update UTMP about System Runlevel Changes
>> +-Documentation=man:systemd-**update-utmp-runlevel.service(**8)
>> man:utmp(5)
>> ++Documentation=man:systemd-**update-utmp.service(8) man:utmp(5)
>> + DefaultDependencies=no
>> + RequiresMountsFor=/var/log/**wtmp
>> +-After=systemd-remount-fs.**service systemd-tmpfiles-setup.service
>> auditd.service
>> ++Conflicts=shutdown.target
>> ++Requisite=systemd-update-**utmp.service
>> ++After=systemd-update-utmp.**service
>> + After=runlevel1.target runlevel2.target runlevel3.target
>> runlevel4.target runlevel5.target
>> +-Before=final.target
>> ++Before=shutdown.target
>> +
>> + [Service]
>> + Type=oneshot
>> +diff --git a/units/systemd-update-utmp-**shutdown.service.in<http://systemd-update-utmp-shutdown.service.in>b/units/
>> systemd-update-utmp-**shutdown.service.in<http://systemd-update-utmp-shutdown.service.in>
>> +deleted file mode 100644
>> +index aa93562..0000000
>> +--- a/units/systemd-update-utmp-**shutdown.service.in<http://systemd-update-utmp-shutdown.service.in>
>> ++++ /dev/null
>> +@@ -1,19 +0,0 @@
>> +-#  This file is part of systemd.
>> +-#
>> +-#  systemd is free software; you can redistribute it and/or modify it
>> +-#  under the terms of the GNU Lesser General Public License as
>> published by
>> +-#  the Free Software Foundation; either version 2.1 of the License, or
>> +-#  (at your option) any later version.
>> +-
>> +-[Unit]
>> +-Description=Update UTMP about System Shutdown
>> +-Documentation=man:systemd-**update-utmp-runlevel.service(**8)
>> man:utmp(5)
>> +-DefaultDependencies=no
>> +-RequiresMountsFor=/var/log/**wtmp
>> +-After=systemd-remount-fs.**service systemd-tmpfiles-setup.service
>> auditd.service
>> +-After=systemd-update-utmp-**runlevel.service
>> +-Before=final.target
>> +-
>> +-[Service]
>> +-Type=oneshot
>> +-ExecStart=@rootlibexecdir@/**systemd-update-utmp shutdown
>> +diff --git a/units/systemd-update-utmp.**service.in<http://systemd-update-utmp.service.in>b/units/
>> systemd-update-utmp.**service.in <http://systemd-update-utmp.service.in>
>> +new file mode 100644
>> +index 0000000..e7c20a5
>> +--- /dev/null
>> ++++ b/units/systemd-update-utmp.**service.in<http://systemd-update-utmp.service.in>
>> +@@ -0,0 +1,21 @@
>> ++#  This file is part of systemd.
>> ++#
>> ++#  systemd is free software; you can redistribute it and/or modify it
>> ++#  under the terms of the GNU Lesser General Public License as
>> published by
>> ++#  the Free Software Foundation; either version 2.1 of the License, or
>> ++#  (at your option) any later version.
>> ++
>> ++[Unit]
>> ++Description=Update UTMP about System Reboot/Shutdown
>> ++Documentation=man:systemd-**update-utmp.service(8) man:utmp(5)
>> ++DefaultDependencies=no
>> ++RequiresMountsFor=/var/log/**wtmp
>> ++Conflicts=shutdown.target
>> ++After=systemd-readahead-**collect.service systemd-readahead-replay.**service
>> systemd-remount-fs.service systemd-tmpfiles-setup.service auditd.service
>> ++Before=sysinit.target shutdown.target
>> ++
>> ++[Service]
>> ++Type=oneshot
>> ++RemainAfterExit=yes
>> ++ExecStart=@rootlibexecdir@/**systemd-update-utmp reboot
>> ++ExecStop=@rootlibexecdir@/**systemd-update-utmp shutdown
>> +--
>> +1.8.2.3
>> +
>> diff --git a/meta/recipes-core/systemd/**systemd/0002-readahead-chunk-**on-spinning-media.patch
>> b/meta/recipes-core/systemd/**systemd/0002-readahead-chunk-**
>> on-spinning-media.patch
>> deleted file mode 100644
>> index d57a01c..0000000
>> --- a/meta/recipes-core/systemd/**systemd/0002-readahead-chunk-**
>> on-spinning-media.patch
>> +++ /dev/null
>> @@ -1,142 +0,0 @@
>> -Upstream-Status: Backport
>> -
>> --Khem 2013/03/28
>> -
>> -From 94243ef299425d6c7089a7a05c48c9**bb8f6cf3da Mon Sep 17 00:00:00 2001
>> -From: Auke Kok <auke-jan.h.kok@intel.com>
>> -Date: Fri, 22 Mar 2013 15:09:45 -0700
>> -Subject: [PATCH 02/17] readahead: chunk on spinning media
>> -
>> -Readahead has all sorts of bad side effects depending on your
>> -storage media. On rotating disks, it may be degrading startup
>> -performance if enough requests are queued spanning linearly
>> -over all blocks early at boot, and mount, blkid and friends
>> -want to insert reads to the start of these block devices after.
>> -
>> -The end result is that on spinning disks with ext3/4 that udev
>> -and mounts take a very long time, and nothing really happens until
>> -readahead is completely finished.
>> -
>> -This has the net effect that the CPU is almost entirely idle
>> -for the entire period that readahead is working. We could have
>> -finished starting up quite a lot of services in this time if
>> -we were smarter at how we do readahead.
>> -
>> -This patch sorts all requests into 2 second "chunks" and sub-sorts
>> -each chunk by block. This adds a single cross-drive seek per "chunk"
>> -but has the benefit that we will have a lot of the blocks we need
>> -early on in the boot sequence loaded into memory faster.
>> -
>> -For a comparison of how before/after bootcharts look (ext4 on a
>> -mobile 5400rpm 250GB drive) please look at:
>> -
>> -    http://foo-projects.org/~**sofar/blocked-tests/<http://foo-projects.org/~sofar/blocked-tests/>
>> -
>> -There are bootcharts in the "before" and "after" folders where you
>> -should be able to see that many low-level services finish 5-7
>> -seconds earlier with the patch applied (after).
>> ----
>> - Makefile.am                       |    2 +-
>> - src/readahead/readahead-**collect.c |   28 +++++++++++++++++++++++++---
>> - 2 files changed, 26 insertions(+), 4 deletions(-)
>> -
>> -diff --git a/Makefile.am b/Makefile.am
>> -index 37c1cc2..5861976 100644
>> ---- a/Makefile.am
>> -+++ b/Makefile.am
>> -@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES = \
>> - systemd_readahead_LDADD = \
>> -       libsystemd-shared.la \
>> -       libsystemd-daemon.la \
>> --      libudev.la
>> -+      libudev.la -lm
>> -
>> - dist_doc_DATA += \
>> -       src/readahead/sd-readahead.c \
>> -diff --git a/src/readahead/readahead-**collect.c
>> b/src/readahead/readahead-**collect.c
>> -index 5d07f47..5d22949 100644
>> ---- a/src/readahead/readahead-**collect.c
>> -+++ b/src/readahead/readahead-**collect.c
>> -@@ -42,6 +42,7 @@
>> - #include <sys/vfs.h>
>> - #include <getopt.h>
>> - #include <sys/inotify.h>
>> -+#include <math.h>
>> -
>> - #ifdef HAVE_FANOTIFY_INIT
>> - #include <sys/fanotify.h>
>> -@@ -67,6 +68,7 @@
>> -  */
>> -
>> - static ReadaheadShared *shared = NULL;
>> -+static struct timespec starttime;
>> -
>> - /* Avoid collisions with the NULL pointer */
>> - #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)
>> -@@ -205,6 +207,7 @@ static unsigned long fd_first_block(int fd) {
>> - struct item {
>> -         const char *path;
>> -         unsigned long block;
>> -+        unsigned long bin;
>> - };
>> -
>> - static int qsort_compare(const void *a, const void *b) {
>> -@@ -213,6 +216,13 @@ static int qsort_compare(const void *a, const void
>> *b) {
>> -         i = a;
>> -         j = b;
>> -
>> -+        /* sort by bin first */
>> -+        if (i->bin < j->bin)
>> -+                return -1;
>> -+        if (i->bin > j->bin)
>> -+                return 1;
>> -+
>> -+        /* then sort by sector */
>> -         if (i->block < j->block)
>> -                 return -1;
>> -         if (i->block > j->block)
>> -@@ -250,6 +260,8 @@ static int collect(const char *root) {
>> -                 goto finish;
>> -         }
>> -
>> -+        clock_gettime(CLOCK_MONOTONIC, &starttime);
>> -+
>> -         /* If there's no pack file yet we lower the kernel readahead
>> -          * so that mincore() is accurate. If there is a pack file
>> -          * already we assume it is accurate enough so that kernel
>> -@@ -447,10 +459,21 @@ static int collect(const char *root) {
>> -                                         free(p);
>> -                                 else {
>> -                                         unsigned long ul;
>> -+                                        struct timespec ts;
>> -+                                        struct item *entry;
>> -+
>> -+                                        entry = new0(struct item, 1);
>> -
>> -                                         ul = fd_first_block(m->fd);
>> -
>> --                                        if ((k = hashmap_put(files, p,
>> SECTOR_TO_PTR(ul))) < 0) {
>> -+                                        clock_gettime(CLOCK_MONOTONIC,
>> &ts);
>> -+
>> -+                                        entry->block = ul;
>> -+                                        entry->path = strdup(p);
>> -+                                        entry->bin = round((ts.tv_sec -
>> starttime.tv_sec +
>> -+                                                     ((ts.tv_nsec -
>> starttime.tv_nsec) / 1000000000.0)) / 2.0);
>> -+
>> -+                                        if ((k = hashmap_put(files, p,
>> entry)) < 0) {
>> -                                                 log_warning("set_put()
>> failed: %s", strerror(-k));
>> -                                                 free(p);
>> -                                         }
>> -@@ -518,8 +541,7 @@ done:
>> -
>> -                 j = ordered;
>> -                 HASHMAP_FOREACH_KEY(q, p, files, i) {
>> --                        j->path = p;
>> --                        j->block = PTR_TO_SECTOR(q);
>> -+                        memcpy(j, q, sizeof(struct item));
>> -                         j++;
>> -                 }
>> -
>> ---
>> -1.7.9.5
>> -
>> diff --git a/meta/recipes-core/systemd/**systemd/0003-readahead-**cleanups.patch
>> b/meta/recipes-core/systemd/**systemd/0003-readahead-**cleanups.patch
>> deleted file mode 100644
>> index e0b68df..0000000
>> --- a/meta/recipes-core/systemd/**systemd/0003-readahead-**cleanups.patch
>> +++ /dev/null
>> @@ -1,86 +0,0 @@
>> -Upstream-Status: Backport
>> -
>> --Khem 2013/03/28
>> -
>> -From b0640287f784a320661f7206c9ade0**7b99003fd5 Mon Sep 17 00:00:00 2001
>> -From: Auke Kok <auke-jan.h.kok@intel.com>
>> -Date: Tue, 26 Mar 2013 11:13:47 -0700
>> -Subject: [PATCH 03/17] readahead: cleanups
>> -
>> -- check for OOM
>> -- no need to use floats and round()
>> ----
>> - Makefile.am                       |    2 +-
>> - src/readahead/readahead-**collect.c |   20 ++++++++++++++------
>> - 2 files changed, 15 insertions(+), 7 deletions(-)
>> -
>> -diff --git a/Makefile.am b/Makefile.am
>> -index 5861976..37c1cc2 100644
>> ---- a/Makefile.am
>> -+++ b/Makefile.am
>> -@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES = \
>> - systemd_readahead_LDADD = \
>> -       libsystemd-shared.la \
>> -       libsystemd-daemon.la \
>> --      libudev.la -lm
>> -+      libudev.la
>> -
>> - dist_doc_DATA += \
>> -       src/readahead/sd-readahead.c \
>> -diff --git a/src/readahead/readahead-**collect.c
>> b/src/readahead/readahead-**collect.c
>> -index 5d22949..e2fd8df 100644
>> ---- a/src/readahead/readahead-**collect.c
>> -+++ b/src/readahead/readahead-**collect.c
>> -@@ -68,7 +68,7 @@
>> -  */
>> -
>> - static ReadaheadShared *shared = NULL;
>> --static struct timespec starttime;
>> -+static usec_t starttime;
>> -
>> - /* Avoid collisions with the NULL pointer */
>> - #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)
>> -@@ -260,7 +260,7 @@ static int collect(const char *root) {
>> -                 goto finish;
>> -         }
>> -
>> --        clock_gettime(CLOCK_MONOTONIC, &starttime);
>> -+        starttime = now(CLOCK_MONOTONIC);
>> -
>> -         /* If there's no pack file yet we lower the kernel readahead
>> -          * so that mincore() is accurate. If there is a pack file
>> -@@ -459,19 +459,27 @@ static int collect(const char *root) {
>> -                                         free(p);
>> -                                 else {
>> -                                         unsigned long ul;
>> --                                        struct timespec ts;
>> -+                                        usec_t entrytime;
>> -                                         struct item *entry;
>> -
>> -                                         entry = new0(struct item, 1);
>> -+                                        if (!entry) {
>> -+                                                r = log_oom();
>> -+                                                goto finish;
>> -+                                        }
>> -
>> -                                         ul = fd_first_block(m->fd);
>> -
>> --                                        clock_gettime(CLOCK_MONOTONIC,
>> &ts);
>> -+                                        entrytime =
>> now(CLOCK_MONOTONIC);
>> -
>> -                                         entry->block = ul;
>> -                                         entry->path = strdup(p);
>> --                                        entry->bin = round((ts.tv_sec -
>> starttime.tv_sec +
>> --                                                     ((ts.tv_nsec -
>> starttime.tv_nsec) / 1000000000.0)) / 2.0);
>> -+                                        if (!entry->path) {
>> -+                                                free(entry);
>> -+                                                r = log_oom();
>> -+                                                goto finish;
>> -+                                        }
>> -+                                        entry->bin = (entrytime -
>> starttime) / 2000000;
>> -
>> -                                         if ((k = hashmap_put(files, p,
>> entry)) < 0) {
>> -                                                 log_warning("set_put()
>> failed: %s", strerror(-k));
>> ---
>> -1.7.9.5
>> -
>> diff --git a/meta/recipes-core/systemd/**systemd/0013-systemd-sysctl-**
>> Handle-missing-etc-sysctl.**conf-proper.patch
>> b/meta/recipes-core/systemd/**systemd/0013-systemd-sysctl-**
>> Handle-missing-etc-sysctl.**conf-proper.patch
>> deleted file mode 100644
>> index f2c8e02..0000000
>> --- a/meta/recipes-core/systemd/**systemd/0013-systemd-sysctl-**
>> Handle-missing-etc-sysctl.**conf-proper.patch
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -Upstream-Status: Backport
>> -
>> --Khem 2013/03/28
>> -
>> -From 6f6fad96addf6b00b55c98cc0d0d80**26b0c1e7ca Mon Sep 17 00:00:00 2001
>> -From: Eelco Dolstra <eelco.dolstra@logicblox.com>
>> -Date: Wed, 27 Mar 2013 13:41:59 +0100
>> -Subject: [PATCH 13/17] systemd-sysctl: Handle missing /etc/sysctl.conf
>> - properly
>> -
>> -Since fabe5c0e5fce730aa66e10a9c4f9fd**d443d7aeda, systemd-sysctl returns
>> -a non-zero exit code if /etc/sysctl.conf does not exist, due to a
>> -broken ENOENT check.
>> ----
>> - src/sysctl/sysctl.c |    2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/src/sysctl/sysctl.c b/src/sysctl/sysctl.c
>> -index 2d43660..79f3f77 100644
>> ---- a/src/sysctl/sysctl.c
>> -+++ b/src/sysctl/sysctl.c
>> -@@ -125,7 +125,7 @@ static int parse_file(Hashmap *sysctl_options, const
>> char *path, bool ignore_eno
>> -
>> -         r = search_and_fopen_nulstr(path, "re", conf_file_dirs, &f);
>> -         if (r < 0) {
>> --                if (ignore_enoent && errno == -ENOENT)
>> -+                if (ignore_enoent && r == -ENOENT)
>> -                         return 0;
>> -
>> -                 log_error("Failed to open file '%s', ignoring: %s",
>> path, strerror(-r));
>> ---
>> -1.7.9.5
>> -
>> diff --git a/meta/recipes-core/systemd/**systemd/199-firmware.patch
>> b/meta/recipes-core/systemd/**systemd/199-firmware.patch
>> deleted file mode 100644
>> index aaab59b..0000000
>> --- a/meta/recipes-core/systemd/**systemd/199-firmware.patch
>> +++ /dev/null
>> @@ -1,98 +0,0 @@
>> -Upstream-Status: Backport
>> -http://cgit.freedesktop.org/**systemd/systemd/patch/?id=**
>> d8d4bee76cf3b40ea923bc57d44aa0**815ca9b5ff<http://cgit.freedesktop.org/systemd/systemd/patch/?id=d8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff>
>> -
>> -From d8d4bee76cf3b40ea923bc57d44aa0**815ca9b5ff Mon Sep 17 00:00:00 2001
>> -From: Kay Sievers <kay@vrfy.org>
>> -Date: Thu, 28 Mar 2013 14:28:10 +0000
>> -Subject: build-sys: fix HAVE/ENABLE_FIRMWARE
>> -
>> -https://bugs.freedesktop.org/**show_bug.cgi?id=62864<https://bugs.freedesktop.org/show_bug.cgi?id=62864>
>> ----
>> -diff --git a/configure.ac b/configure.ac
>> -index 5b88bcf..e73cd5c 100644
>> ---- a/configure.ac
>> -+++ b/configure.ac
>> -@@ -728,6 +728,7 @@ for i in $with_firmware_path; do
>> - done
>> - IFS=$OLD_IFS
>> - AC_SUBST(FIRMWARE_PATH)
>> -+AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1,
>> [Define if FIRMWARE is available]) ])
>> - AM_CONDITIONAL(ENABLE_**FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
>> -
>> - # ------------------------------**------------------------------**
>> ------------------
>> -@@ -736,7 +737,6 @@ AC_ARG_ENABLE([gudev],
>> -        [], [enable_gudev=yes])
>> - AS_IF([test "x$enable_gudev" = "xyes"], [ PKG_CHECK_MODULES([GLIB],
>> [glib-2.0 >= 2.22.0 gobject-2.0 >= 2.22.0 gio-2.0]) ])
>> - AM_CONDITIONAL([ENABLE_GUDEV], [test "x$enable_gudev" = "xyes"])
>> --
>> - AS_IF([test "x$enable_gudev" = "xyes"], [ AC_DEFINE(HAVE_GLIB, 1,
>> [Define if glib is available]) ])
>> -
>> - # ------------------------------**------------------------------**
>> ------------------
>> -diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
>> -index 13922d3..c7d4319 100644
>> ---- a/src/udev/udev-builtin.c
>> -+++ b/src/udev/udev-builtin.c
>> -@@ -34,7 +34,7 @@ static const struct udev_builtin *builtins[] = {
>> -         [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
>> - #endif
>> -         [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
>> --#ifdef ENABLE_FIRMWARE
>> -+#ifdef HAVE_FIRMWARE
>> -         [UDEV_BUILTIN_FIRMWARE] = &udev_builtin_firmware,
>> - #endif
>> -         [UDEV_BUILTIN_HWDB] = &udev_builtin_hwdb,
>> -diff --git a/src/udev/udev.h b/src/udev/udev.h
>> -index aa2edbe..906dfba 100644
>> ---- a/src/udev/udev.h
>> -+++ b/src/udev/udev.h
>> -@@ -140,7 +140,7 @@ enum udev_builtin_cmd {
>> -         UDEV_BUILTIN_BLKID,
>> - #endif
>> -         UDEV_BUILTIN_BTRFS,
>> --#ifdef ENABLE_FIRMWARE
>> -+#ifdef HAVE_FIRMWARE
>> -         UDEV_BUILTIN_FIRMWARE,
>> - #endif
>> -         UDEV_BUILTIN_HWDB,
>> -@@ -169,7 +169,7 @@ struct udev_builtin {
>> - extern const struct udev_builtin udev_builtin_blkid;
>> - #endif
>> - extern const struct udev_builtin udev_builtin_btrfs;
>> --#ifdef ENABLE_FIRMWARE
>> -+#ifdef HAVE_FIRMWARE
>> - extern const struct udev_builtin udev_builtin_firmware;
>> - #endif
>> - extern const struct udev_builtin udev_builtin_hwdb;
>> -diff --git a/src/udev/udevd.c b/src/udev/udevd.c
>> -index b30bedf..2ad7388 100644
>> ---- a/src/udev/udevd.c
>> -+++ b/src/udev/udevd.c
>> -@@ -98,7 +98,7 @@ struct event {
>> -         dev_t devnum;
>> -         int ifindex;
>> -         bool is_block;
>> --#ifdef ENABLE_FIRMWARE
>> -+#ifdef HAVE_FIRMWARE
>> -         bool nodelay;
>> - #endif
>> - };
>> -@@ -444,7 +444,7 @@ static int event_queue_insert(struct udev_device
>> *dev)
>> -         event->devnum = udev_device_get_devnum(dev);
>> -         event->is_block = streq("block", udev_device_get_subsystem(dev)
>> **);
>> -         event->ifindex = udev_device_get_ifindex(dev);
>> --#ifdef ENABLE_FIRMWARE
>> -+#ifdef HAVE_FIRMWARE
>> -         if (streq(udev_device_get_**subsystem(dev), "firmware"))
>> -                 event->nodelay = true;
>> - #endif
>> -@@ -527,7 +527,7 @@ static bool is_devpath_busy(struct event *event)
>> -                         return true;
>> -                 }
>> -
>> --#ifdef ENABLE_FIRMWARE
>> -+#ifdef HAVE_FIRMWARE
>> -                 /* allow to bypass the dependency tracking */
>> -                 if (event->nodelay)
>> -                         continue;
>> ---
>> -cgit v0.9.0.2-2-gbebe
>> diff --git a/meta/recipes-core/systemd/sy**stemd_199.bb<http://systemd_199.bb>b/meta/recipes-core/systemd/
>> sy**stemd_204.bb <http://systemd_204.bb>
>> similarity index 95%
>> rename from meta/recipes-core/systemd/syst**emd_199.bb<http://systemd_199.bb>
>> rename to meta/recipes-core/systemd/syst**emd_204.bb<http://systemd_204.bb>
>> index b8da27e..74cd3c8 100644
>> --- a/meta/recipes-core/systemd/sy**stemd_199.bb <http://systemd_199.bb>
>> +++ b/meta/recipes-core/systemd/sy**stemd_204.bb <http://systemd_204.bb>
>> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=**
>> 751419260aa954499f7abaabaa882b**be \
>>   PROVIDES = "udev"
>>
>>   PE = "1"
>> -PR = "r4"
>>
>>   DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native
>> gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0
>> qemu-native"
>>   DEPENDS += "${@base_contains('DISTRO_**FEATURES', 'pam', 'libpam', '',
>> d)}"
>> @@ -22,16 +21,12 @@ SRC_URI = "http://www.freedesktop.org/**
>> software/systemd/systemd-${PV}**.tar.xz<http://www.freedesktop.org/software/systemd/systemd-$%7BPV%7D.tar.xz>\
>>              file://touchscreen.rules \
>>              file://modprobe.rules \
>>              ${UCLIBCPATCHES} \
>> +           file://0001-utmp-turn-systemd-**update-utmp-shutdown.service-
>> **into-.patch \
>>              file://00-create-volatile.conf \
>> -           file://0002-readahead-chunk-**on-spinning-media.patch \
>> -           file://0003-readahead-**cleanups.patch \
>> -           file://0013-systemd-sysctl-**Handle-missing-etc-sysctl.**conf-proper.patch
>> \
>> -           file://0001-configure-use-AC_**CHECK_TOOL-for-objcopy-**strings-and-.patch
>> \
>> -           file://199-firmware.patch \
>>              file://init \
>>             "
>> -SRC_URI[md5sum] = "**4bb13f84ce211e93f0141774a90a23**22"
>> -SRC_URI[sha256sum] = "**8c4462a04f3ecf7f083782e5e06879**
>> 13b1d33c6444bf20fa2f31df922296**5fed"
>> +SRC_URI[md5sum] = "**a07619bb19f48164fbf0761d12fd39**a8"
>> +SRC_URI[sha256sum] = "**072c393503c7c1e55ca7acf3db659c**
>> bd28c7fe5fa94fab3db95360bafd96**731b"
>>
>>   UCLIBCPATCHES = ""
>>   UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-**check-uclibc.patch
>> \
>>
>>

--047d7b3a7e92378b8e04dd580c96
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 23 May 2013 09:53, Saul Wold <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a=
>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<div class=3D"im">On 05/22/2013 04:39 PM, Jonathan Liu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Removed patches integrated upstream.<br>
Added backport of fix for utmp not running at shutdown.<br>
Updated serial-getty service.<br>
<br>
Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com" target=
=3D"_blank">net147@gmail.com</a>&gt;<br>
---<br>
=C2=A0 .../systemd-serialgetty/<u></u>serial-getty@.service =C2=A0 =C2=A0 =
=C2=A0| =C2=A016 +-<br>
=C2=A0 ...se-AC_CHECK_TOOL-for-<u></u>objcopy-strings-and-.patch | =C2=A041=
 ---<br>
=C2=A0 ...ystemd-update-utmp-<u></u>shutdown.service-into-.patch | 367 ++++=
+++++++++++++++++<br>
=C2=A0 .../0002-readahead-chunk-on-<u></u>spinning-media.patch =C2=A0 | 142=
 --------<br>
=C2=A0 .../systemd/systemd/0003-<u></u>readahead-cleanups.patch =C2=A0| =C2=
=A086 -----<br>
=C2=A0 ...ctl-Handle-missing-etc-<u></u>sysctl.conf-proper.patch | =C2=A033=
 --<br>
=C2=A0 .../systemd/systemd/199-<u></u>firmware.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A098 ------<br>
=C2=A0 .../systemd/{<a href=3D"http://systemd_199.bb" target=3D"_blank">sys=
temd_199.bb</a> =3D&gt; <a href=3D"http://systemd_204.bb" target=3D"_blank"=
>systemd_204.bb</a>} =C2=A0 =C2=A0 | =C2=A011 +-<br>
=C2=A0 8 files changed, 380 insertions(+), 414 deletions(-)<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/<u></u>systemd/0001-con=
figure-use-AC_<u></u>CHECK_TOOL-for-objcopy-<u></u>strings-and-.patch<br>
=C2=A0 create mode 100644 meta/recipes-core/systemd/<u></u>systemd/0001-utm=
p-turn-<u></u>systemd-update-utmp-shutdown.<u></u>service-into-.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/<u></u>systemd/0002-rea=
dahead-chunk-<u></u>on-spinning-media.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/<u></u>systemd/0003-rea=
dahead-<u></u>cleanups.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/<u></u>systemd/0013-sys=
temd-sysctl-<u></u>Handle-missing-etc-sysctl.<u></u>conf-proper.patch<br>
=C2=A0 delete mode 100644 meta/recipes-core/systemd/<u></u>systemd/199-firm=
ware.patch<br>
=C2=A0 rename meta/recipes-core/systemd/{<a href=3D"http://systemd_199.bb" =
target=3D"_blank">sys<u></u>temd_199.bb</a> =3D&gt; <a href=3D"http://syste=
md_204.bb" target=3D"_blank">systemd_204.bb</a>} (95%)<br>
<br>
</blockquote>
<br></div>
I am having some trouble applying this patch to both my MUT and master bran=
ches.<br>
<br>
Sau!</blockquote><div style>It looks like it still depends on the FHS patch=
. The patch rename <a href=3D"http://systemd_199.bb">systemd_199.bb</a> whi=
le FHS patch modified <a href=3D"http://systemd_199.bb">systemd_199.bb</a>.=
</div>
<div style>I have rebased the systemd patch to come before the FHS patch an=
d submitted V4 which should allow you to apply to master.</div><div style><=
br></div><div style>Regards,</div><div style>Jonathan</div><div>=C2=A0</div=
>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
diff --git a/meta/recipes-core/systemd/<u></u>systemd-serialgetty/serial-<u=
></u>getty@.service b/meta/recipes-core/systemd/<u></u>systemd-serialgetty/=
serial-<u></u>getty@.service<br>
index 8eeaab6..1c14dfe 100644<br>
--- a/meta/recipes-core/systemd/<u></u>systemd-serialgetty/serial-<u></u>ge=
tty@.service<br>
+++ b/meta/recipes-core/systemd/<u></u>systemd-serialgetty/serial-<u></u>ge=
tty@.service<br>
@@ -1,23 +1,27 @@<br>
=C2=A0 # =C2=A0This file is part of systemd.<br>
=C2=A0 #<br>
=C2=A0 # =C2=A0systemd is free software; you can redistribute it and/or mod=
ify it<br>
-# =C2=A0under the terms of the GNU General Public License as published by<=
br>
-# =C2=A0the Free Software Foundation; either version 2 of the License, or<=
br>
+# =C2=A0under the terms of the GNU Lesser General Public License as publis=
hed by<br>
+# =C2=A0the Free Software Foundation; either version 2.1 of the License, o=
r<br>
=C2=A0 # =C2=A0(at your option) any later version.<br>
<br>
=C2=A0 [Unit]<br>
=C2=A0 Description=3DSerial Getty on %I<br>
-BindTo=3Ddev-%i.device<br>
-After=3Ddev-%i.device systemd-user-sessions.service<br>
+Documentation=3Dman:agetty(8) man:systemd-getty-generator(8)<br>
+Documentation=3D<a href=3D"http://0pointer.de/blog/projects/serial-console=
.html" target=3D"_blank">http://<u></u>0pointer.de/blog/projects/<u></u>ser=
ial-console.html</a><br>
+BindsTo=3Ddev-%i.device<br>
+After=3Ddev-%i.device systemd-user-sessions.service plymouth-quit-wait.ser=
vice<br>
+After=3Drc-local.service<br>
<br>
=C2=A0 # If additional gettys are spawned during boot then we should make<b=
r>
=C2=A0 # sure that this is synchronized before getty.target, even though<br=
>
=C2=A0 # getty.target didn&#39;t actually pull it in.<br>
=C2=A0 Before=3Dgetty.target<br>
+IgnoreOnIsolate=3Dyes<br>
<br>
=C2=A0 [Service]<br>
-Environment=3DTERM=3Dvt100<br>
-ExecStart=3D-/sbin/agetty -s %I @BAUDRATE@<br>
+ExecStart=3D-/sbin/agetty -s %I @BAUDRATE@ vt102<br>
+Type=3Didle<br>
=C2=A0 Restart=3Dalways<br>
=C2=A0 RestartSec=3D0<br>
=C2=A0 UtmpIdentifier=3D%I<br>
diff --git a/meta/recipes-core/systemd/<u></u>systemd/0001-configure-use-AC=
_<u></u>CHECK_TOOL-for-objcopy-<u></u>strings-and-.patch b/meta/recipes-cor=
e/systemd/<u></u>systemd/0001-configure-use-AC_<u></u>CHECK_TOOL-for-objcop=
y-<u></u>strings-and-.patch<br>

deleted file mode 100644<br>
index d847bbc..0000000<br>
--- a/meta/recipes-core/systemd/<u></u>systemd/0001-configure-use-AC_<u></u=
>CHECK_TOOL-for-objcopy-<u></u>strings-and-.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-From d6f92bcbbae9a577adb9588c7b2783<u></u>a5d0bf343d Mon Sep 17 00:00:00 2=
001<br>
-From: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D=
"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
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
-Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
-Upstream-Status: Submitted<br>
-<a href=3D"http://lists.freedesktop.org/archives/systemd-devel/2013-April/=
010468.html" target=3D"_blank">http://lists.freedesktop.org/<u></u>archives=
/systemd-devel/2013-<u></u>April/010468.html</a><br>
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
-@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([<u></u>1.31.1])<br>
- =C2=A0 =C2=A0AM_CONDITIONAL([HAVE_<u></u>INTROSPECTION], [false])<br>
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
diff --git a/meta/recipes-core/systemd/<u></u>systemd/0001-utmp-turn-<u></u=
>systemd-update-utmp-shutdown.<u></u>service-into-.patch b/meta/recipes-cor=
e/systemd/<u></u>systemd/0001-utmp-turn-<u></u>systemd-update-utmp-shutdown=
.<u></u>service-into-.patch<br>

new file mode 100644<br>
index 0000000..86fab97<br>
--- /dev/null<br>
+++ b/meta/recipes-core/systemd/<u></u>systemd/0001-utmp-turn-<u></u>system=
d-update-utmp-shutdown.<u></u>service-into-.patch<br>
@@ -0,0 +1,367 @@<br>
+Upstream-Status: Backport<br>
+Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com" target=
=3D"_blank">net147@gmail.com</a>&gt;<br>
+<br>
+From 3f92e4b4b61042391bd44de4dceb18<u></u>177df0dd57 Mon Sep 17 00:00:00 2=
001<br>
+From: Lennart Poettering &lt;<a href=3D"mailto:lennart@poettering.net" tar=
get=3D"_blank">lennart@poettering.net</a>&gt;<br>
+Date: Thu, 16 May 2013 00:19:03 +0200<br>
+Subject: [PATCH] utmp: turn systemd-update-utmp-shutdown.<u></u>service in=
to a normal<br>
+ runtime service<br>
+<br>
+With this change systemd-update-utmp-shutdown.<u></u>service is replaced b=
y<br>
+systemd-update-utmp.service which is started at boot and stays around<br>
+until shutdown. This allows us to properly order the unit against both<br>
+/var/log and auditd.<br>
+<br>
+<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D853104" target=3D=
"_blank">https://bugzilla.redhat.com/<u></u>show_bug.cgi?id=3D853104</a><br=
>
+<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64365" target=3D=
"_blank">https://bugs.freedesktop.org/<u></u>show_bug.cgi?id=3D64365</a><br=
>
+---<br>
+ Makefile-man.am =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++---<br>
+ Makefile.am =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A08 +--<b=
r>
+ man/systemd-update-utmp-<u></u>runlevel.service.xml =C2=A0| 76 ----------=
-----------------<br>
+ man/systemd-update-utmp.<u></u>service.xml =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 76 +++++++++++++++++++++++++++<br>
+ src/update-utmp/update-utmp.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A02 +-<br>
+ units/.gitignore =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A02 +-<br>
+ units/<a href=3D"http://systemd-update-utmp-runlevel.service.in" target=
=3D"_blank">systemd-update-utmp-<u></u>runlevel.service.in</a> | =C2=A08 +-=
-<br>
+ units/<a href=3D"http://systemd-update-utmp-shutdown.service.in" target=
=3D"_blank">systemd-update-utmp-<u></u>shutdown.service.in</a> | 19 -------=
<br>
+ units/<a href=3D"http://systemd-update-utmp.service.in" target=3D"_blank"=
>systemd-update-utmp.<u></u>service.in</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 21 ++++++++<br>
+ 9 files changed, 114 insertions(+), 110 deletions(-)<br>
+ delete mode 100644 man/systemd-update-utmp-<u></u>runlevel.service.xml<br=
>
+ create mode 100644 man/systemd-update-utmp.<u></u>service.xml<br>
+ delete mode 100644 units/<a href=3D"http://systemd-update-utmp-shutdown.s=
ervice.in" target=3D"_blank">systemd-update-utmp-<u></u>shutdown.service.in=
</a><br>
+ create mode 100644 units/<a href=3D"http://systemd-update-utmp.service.in=
" target=3D"_blank">systemd-update-utmp.<u></u>service.in</a><br>
+<br>
+diff --git a/Makefile-man.am b/Makefile-man.am<br>
+index 7d62094..5888158 100644<br>
+--- a/Makefile-man.am<br>
++++ b/Makefile-man.am<br>
+@@ -72,7 +72,7 @@ MANPAGES +=3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-tmpfiles.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-tty-ask-password-<u></u>agent.1 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-udevd.service.8 \<br>
+- =C2=A0 =C2=A0 =C2=A0man/systemd-update-utmp-<u></u>runlevel.service.8 \<=
br>
++ =C2=A0 =C2=A0 =C2=A0man/systemd-update-utmp.<u></u>service.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd.1 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd.automount.5 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd.device.5 \<br>
+@@ -191,7 +191,7 @@ MANPAGES_ALIAS +=3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-udevd-control.<u></u>socket.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-udevd-kernel.<u></u>socket.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-udevd.8 \<br>
+- =C2=A0 =C2=A0 =C2=A0man/systemd-update-utmp-<u></u>shutdown.service.8 \<=
br>
++ =C2=A0 =C2=A0 =C2=A0man/systemd-update-utmp-<u></u>runlevel.service.8 \<=
br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-update-utmp.8 \<br>
+ =C2=A0 =C2=A0 =C2=A0 man/systemd-user.conf.5<br>
+ man/SD_ALERT.3: man/sd-daemon.3<br>
+@@ -289,8 +289,8 @@ man/systemd-tmpfiles-setup.<u></u>service.8: man/syste=
md-tmpfiles.8<br>
+ man/systemd-udevd-control.<u></u>socket.8: man/systemd-udevd.service.8<br=
>
+ man/systemd-udevd-kernel.<u></u>socket.8: man/systemd-udevd.service.8<br>
+ man/systemd-udevd.8: man/systemd-udevd.service.8<br>
+-man/systemd-update-utmp-<u></u>shutdown.service.8: man/systemd-update-utm=
p-<u></u>runlevel.service.8<br>
+-man/systemd-update-utmp.8: man/systemd-update-utmp-<u></u>runlevel.servic=
e.8<br>
++man/systemd-update-utmp-<u></u>runlevel.service.8: man/systemd-update-utm=
p.<u></u>service.8<br>
++man/systemd-update-utmp.8: man/systemd-update-utmp.<u></u>service.8<br>
+ man/systemd-user.conf.5: man/systemd-system.conf.5<br>
+ man/SD_ALERT.html: man/sd-daemon.html<br>
+ =C2=A0 =C2=A0 =C2=A0 $(html-alias)<br>
+@@ -577,10 +577,10 @@ man/systemd-udevd-kernel.<u></u>socket.html: man/sys=
temd-udevd.service.html<br>
+ man/systemd-udevd.html: man/systemd-udevd.service.html<br>
+ =C2=A0 =C2=A0 =C2=A0 $(html-alias)<br>
+<br>
+-man/systemd-update-utmp-<u></u>shutdown.service.html: man/systemd-update-=
utmp-<u></u>runlevel.service.html<br>
++man/systemd-update-utmp-<u></u>runlevel.service.html: man/systemd-update-=
utmp.<u></u>service.html<br>
+ =C2=A0 =C2=A0 =C2=A0 $(html-alias)<br>
+<br>
+-man/systemd-update-utmp.<u></u>html: man/systemd-update-utmp-<u></u>runle=
vel.service.html<br>
++man/systemd-update-utmp.<u></u>html: man/systemd-update-utmp.<u></u>servi=
ce.html<br>
+ =C2=A0 =C2=A0 =C2=A0 $(html-alias)<br>
+<br>
+ man/systemd-user.conf.html: man/systemd-system.conf.html<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index 8d8139c..4c5e6fc 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -417,8 +417,8 @@ nodist_systemunit_DATA =3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-initctl.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-shutdownd.<u></u>service \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-remount-fs.<u></u>service \<br>
++ =C2=A0 =C2=A0 =C2=A0units/systemd-update-utmp.<u></u>service \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-update-utmp-<u></u>runlevel.service \<=
br>
+- =C2=A0 =C2=A0 =C2=A0units/systemd-update-utmp-<u></u>shutdown.service \<=
br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-tmpfiles-setup-<u></u>dev.service \<br=
>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-tmpfiles-setup.<u></u>service \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/systemd-tmpfiles-clean.<u></u>service \<br>
+@@ -463,8 +463,8 @@ EXTRA_DIST +=3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-initctl.service.in" =
target=3D"_blank">systemd-initctl.service.<u></u>in</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-shutdownd.service.in=
" target=3D"_blank">systemd-shutdownd.<u></u>service.in</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-remount-fs.service.i=
n" target=3D"_blank">systemd-remount-fs.<u></u>service.in</a> \<br>
++ =C2=A0 =C2=A0 =C2=A0units/<a href=3D"http://systemd-update-utmp.service.=
in" target=3D"_blank">systemd-update-utmp.<u></u>service.in</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-update-utmp-runlevel=
.service.in" target=3D"_blank">systemd-update-utmp-<u></u>runlevel.service.=
in</a> \<br>
+- =C2=A0 =C2=A0 =C2=A0units/<a href=3D"http://systemd-update-utmp-shutdown=
.service.in" target=3D"_blank">systemd-update-utmp-<u></u>shutdown.service.=
in</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-tmpfiles-setup-dev.s=
ervice.in" target=3D"_blank">systemd-tmpfiles-setup-<u></u>dev.service.in</=
a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-tmpfiles-setup.servi=
ce.in" target=3D"_blank">systemd-tmpfiles-setup.<u></u>service.in</a> \<br>
+ =C2=A0 =C2=A0 =C2=A0 units/<a href=3D"http://systemd-tmpfiles-clean.servi=
ce.in" target=3D"_blank">systemd-tmpfiles-clean.<u></u>service.in</a> \<br>
+@@ -4070,8 +4070,8 @@ RUNLEVEL4_TARGET_WANTS +=3D \<br>
+ RUNLEVEL5_TARGET_WANTS +=3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 systemd-update-utmp-runlevel.<u></u>service<br>
+ endif<br>
+-SHUTDOWN_TARGET_WANTS +=3D \<br>
+- =C2=A0 =C2=A0 =C2=A0systemd-update-utmp-shutdown.<u></u>service<br>
++SYSINIT_TARGET_WANTS +=3D \<br>
++ =C2=A0 =C2=A0 =C2=A0systemd-update-utmp.service<br>
+ LOCAL_FS_TARGET_WANTS +=3D \<br>
+ =C2=A0 =C2=A0 =C2=A0 systemd-remount-fs.service \<br>
+ =C2=A0 =C2=A0 =C2=A0 systemd-fsck-root.service \<br>
+diff --git a/man/systemd-update-utmp-<u></u>runlevel.service.xml b/man/sys=
temd-update-utmp-<u></u>runlevel.service.xml<br>
+deleted file mode 100644<br>
+index 867b958..0000000<br>
+--- a/man/systemd-update-utmp-<u></u>runlevel.service.xml<br>
++++ /dev/null<br>
+@@ -1,76 +0,0 @@<br>
+-&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
+-&lt;!--*-nxml-*--&gt;<br>
+-&lt;!DOCTYPE refentry PUBLIC &quot;-//OASIS//DTD DocBook XML V4.2//EN&quo=
t; &quot;<a href=3D"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"=
 target=3D"_blank">http://www.oasis-open.org/<u></u>docbook/xml/4.2/docbook=
x.dtd</a>&quot;&gt;<br>

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
licenses/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;<u></u>.<b=
r>
+---&gt;<br>
+-&lt;refentry id=3D&quot;systemd-update-utmp-<u></u>runlevel.service&quot;=
&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refentryinfo&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;syst=
emd-update-utmp-<u></u>runlevel.service&lt;/title&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;productname&g=
t;systemd&lt;/<u></u>productname&gt;<br>
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
nart@poettering.net" target=3D"_blank">lennart@poettering.net</a>&lt;<u></u=
>/email&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;/author&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/authorgroup&=
gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refentryinfo&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refmeta&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refentrytitle=
&gt;systemd-update-<u></u>utmp-runlevel.service&lt;/<u></u>refentrytitle&gt=
;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;manvolnum&gt;=
8&lt;/manvolnum&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refmeta&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refnamediv&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp-<u></u>runlevel.service&lt;/refname&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp-<u></u>shutdown.service&lt;/refname&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp&lt;/<u></u>refname&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refpurpose&gt=
;Write audit and utmp updates at runlevel<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0changes and shutd=
own&lt;/refpurpose&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refnamediv&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsynopsisdiv&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-<u></u>update-utmp-runlevel.service&lt;/<u></u>filename&=
gt;&lt;/para&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-<u></u>update-utmp-shutdown.service&lt;/<u></u>filename&=
gt;&lt;/para&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;/usr/lib/<u></u>systemd/systemd-update-utmp&lt;/<u></u>filename&=
gt;&lt;/para&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsynopsisdiv&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsect1&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;Desc=
ription&lt;/title&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-<u></u>update-utmp-runlevel.service&lt;/<u></u>filename&=
gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is a service that=
 writes SysV runlevel changes to utmp<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and wtmp, as well=
 as the audit logs, as they<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0occur. &lt;filena=
me&gt;systemd-update-utmp-<u></u>shutdown.service&lt;/filename&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0does the same for=
 shut-down requests.&lt;/para&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsect1&gt;<br>
+-<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsect1&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;See =
Also&lt;/title&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;<u></u>systemd&lt;/re=
fentrytitle&gt;&lt;<u></u>manvolnum&gt;1&lt;/manvolnum&gt;&lt;/<u></u>citer=
efentry&gt;,<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;<u></u>utmp&lt;/refen=
trytitle&gt;&lt;<u></u>manvolnum&gt;5&lt;/manvolnum&gt;&lt;/<u></u>citerefe=
ntry&gt;,<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;<u></u>auditd&lt;/ref=
entrytitle&gt;&lt;<u></u>manvolnum&gt;8&lt;/manvolnum&gt;&lt;/<u></u>citere=
fentry&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
+- =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsect1&gt;<br>
+-<br>
+-&lt;/refentry&gt;<br>
+diff --git a/man/systemd-update-utmp.<u></u>service.xml b/man/systemd-upda=
te-utmp.<u></u>service.xml<br>
+new file mode 100644<br>
+index 0000000..846fc95<br>
+--- /dev/null<br>
++++ b/man/systemd-update-utmp.<u></u>service.xml<br>
+@@ -0,0 +1,76 @@<br>
++&lt;?xml version=3D&quot;1.0&quot;?&gt;<br>
++&lt;!--*-nxml-*--&gt;<br>
++&lt;!DOCTYPE refentry PUBLIC &quot;-//OASIS//DTD DocBook XML V4.2//EN&quo=
t; &quot;<a href=3D"http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"=
 target=3D"_blank">http://www.oasis-open.org/<u></u>docbook/xml/4.2/docbook=
x.dtd</a>&quot;&gt;<br>

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
licenses/" target=3D"_blank">http://www.gnu.org/licenses/</a>&gt;<u></u>.<b=
r>
++--&gt;<br>
++&lt;refentry id=3D&quot;systemd-update-utmp.<u></u>service&quot;&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refentryinfo&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;syst=
emd-update-utmp.<u></u>service&lt;/title&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;productname&g=
t;systemd&lt;/<u></u>productname&gt;<br>
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
nart@poettering.net" target=3D"_blank">lennart@poettering.net</a>&lt;<u></u=
>/email&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;/author&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/authorgroup&=
gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refentryinfo&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refmeta&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refentrytitle=
&gt;systemd-update-<u></u>utmp.service&lt;/refentrytitle&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;manvolnum&gt;=
8&lt;/manvolnum&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refmeta&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refnamediv&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp.<u></u>service&lt;/refname&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp-<u></u>runlevel.service&lt;/refname&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refname&gt;sy=
stemd-update-utmp&lt;/<u></u>refname&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refpurpose&gt=
;Write audit and utmp updates at bootup, runlevel<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0changes and shutd=
own&lt;/refpurpose&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refnamediv&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsynopsisdiv&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-<u></u>update-utmp.service&lt;/filename&gt;<u></u>&lt;/p=
ara&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-<u></u>update-utmp-runlevel.service&lt;/<u></u>filename&=
gt;&lt;/para&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;/usr/lib/<u></u>systemd/systemd-update-utmp&lt;/<u></u>filename&=
gt;&lt;/para&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsynopsisdiv&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsect1&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;Desc=
ription&lt;/title&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;&lt;f=
ilename&gt;systemd-<u></u>update-utmp-runlevel.service&lt;/<u></u>filename&=
gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is a service that=
 writes SysV runlevel changes to utmp<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and wtmp, as well=
 as the audit logs, as they<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0occur. &lt;filena=
me&gt;systemd-update-utmp.<u></u>service&lt;/filename&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0does the same for=
 system reboots and shut-down requests.&lt;/para&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsect1&gt;<br>
++<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;refsect1&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;title&gt;See =
Also&lt;/title&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;<u></u>systemd&lt;/re=
fentrytitle&gt;&lt;<u></u>manvolnum&gt;1&lt;/manvolnum&gt;&lt;/<u></u>citer=
efentry&gt;,<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;<u></u>utmp&lt;/refen=
trytitle&gt;&lt;<u></u>manvolnum&gt;5&lt;/manvolnum&gt;&lt;/<u></u>citerefe=
ntry&gt;,<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&lt;citerefentry&gt;&lt;refentrytitle&gt;<u></u>auditd&lt;/ref=
entrytitle&gt;&lt;<u></u>manvolnum&gt;8&lt;/manvolnum&gt;&lt;/<u></u>citere=
fentry&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
++ =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;/refsect1&gt;<br>
++<br>
++&lt;/refentry&gt;<br>
+diff --git a/src/update-utmp/update-utmp.<u></u>c b/src/update-utmp/update=
-utmp.<u></u>c<br>
+index 9184025..202aa98 100644<br>
+--- a/src/update-utmp/update-utmp.<u></u>c<br>
++++ b/src/update-utmp/update-utmp.<u></u>c<br>
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
uot;org.freedesktop.systemd1.<u></u>Unit&quot;,<br>
+diff --git a/units/<a href=3D"http://systemd-update-utmp-runlevel.service.=
in" target=3D"_blank">systemd-update-utmp-<u></u>runlevel.service.in</a> b/=
units/<a href=3D"http://systemd-update-utmp-runlevel.service.in" target=3D"=
_blank">systemd-update-utmp-<u></u>runlevel.service.in</a><br>

+index 27fae2c..99783e2 100644<br>
+--- a/units/<a href=3D"http://systemd-update-utmp-runlevel.service.in" tar=
get=3D"_blank">systemd-update-utmp-<u></u>runlevel.service.in</a><br>
++++ b/units/<a href=3D"http://systemd-update-utmp-runlevel.service.in" tar=
get=3D"_blank">systemd-update-utmp-<u></u>runlevel.service.in</a><br>
+@@ -7,12 +7,14 @@<br>
+<br>
+ [Unit]<br>
+ Description=3DUpdate UTMP about System Runlevel Changes<br>
+-Documentation=3Dman:systemd-<u></u>update-utmp-runlevel.service(<u></u>8)=
 man:utmp(5)<br>
++Documentation=3Dman:systemd-<u></u>update-utmp.service(8) man:utmp(5)<br>
+ DefaultDependencies=3Dno<br>
+ RequiresMountsFor=3D/var/log/<u></u>wtmp<br>
+-After=3Dsystemd-remount-fs.<u></u>service systemd-tmpfiles-setup.service =
auditd.service<br>
++Conflicts=3Dshutdown.target<br>
++Requisite=3Dsystemd-update-<u></u>utmp.service<br>
++After=3Dsystemd-update-utmp.<u></u>service<br>
+ After=3Drunlevel1.target runlevel2.target runlevel3.target runlevel4.targ=
et runlevel5.target<br>
+-Before=3Dfinal.target<br>
++Before=3Dshutdown.target<br>
+<br>
+ [Service]<br>
+ Type=3Doneshot<br>
+diff --git a/units/<a href=3D"http://systemd-update-utmp-shutdown.service.=
in" target=3D"_blank">systemd-update-utmp-<u></u>shutdown.service.in</a> b/=
units/<a href=3D"http://systemd-update-utmp-shutdown.service.in" target=3D"=
_blank">systemd-update-utmp-<u></u>shutdown.service.in</a><br>

+deleted file mode 100644<br>
+index aa93562..0000000<br>
+--- a/units/<a href=3D"http://systemd-update-utmp-shutdown.service.in" tar=
get=3D"_blank">systemd-update-utmp-<u></u>shutdown.service.in</a><br>
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
+-Documentation=3Dman:systemd-<u></u>update-utmp-runlevel.service(<u></u>8)=
 man:utmp(5)<br>
+-DefaultDependencies=3Dno<br>
+-RequiresMountsFor=3D/var/log/<u></u>wtmp<br>
+-After=3Dsystemd-remount-fs.<u></u>service systemd-tmpfiles-setup.service =
auditd.service<br>
+-After=3Dsystemd-update-utmp-<u></u>runlevel.service<br>
+-Before=3Dfinal.target<br>
+-<br>
+-[Service]<br>
+-Type=3Doneshot<br>
+-ExecStart=3D@rootlibexecdir@/<u></u>systemd-update-utmp shutdown<br>
+diff --git a/units/<a href=3D"http://systemd-update-utmp.service.in" targe=
t=3D"_blank">systemd-update-utmp.<u></u>service.in</a> b/units/<a href=3D"h=
ttp://systemd-update-utmp.service.in" target=3D"_blank">systemd-update-utmp=
.<u></u>service.in</a><br>

+new file mode 100644<br>
+index 0000000..e7c20a5<br>
+--- /dev/null<br>
++++ b/units/<a href=3D"http://systemd-update-utmp.service.in" target=3D"_b=
lank">systemd-update-utmp.<u></u>service.in</a><br>
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
++Documentation=3Dman:systemd-<u></u>update-utmp.service(8) man:utmp(5)<br>
++DefaultDependencies=3Dno<br>
++RequiresMountsFor=3D/var/log/<u></u>wtmp<br>
++Conflicts=3Dshutdown.target<br>
++After=3Dsystemd-readahead-<u></u>collect.service systemd-readahead-replay=
.<u></u>service systemd-remount-fs.service systemd-tmpfiles-setup.service a=
uditd.service<br>
++Before=3Dsysinit.target shutdown.target<br>
++<br>
++[Service]<br>
++Type=3Doneshot<br>
++RemainAfterExit=3Dyes<br>
++ExecStart=3D@rootlibexecdir@/<u></u>systemd-update-utmp reboot<br>
++ExecStop=3D@rootlibexecdir@/<u></u>systemd-update-utmp shutdown<br>
+--<br>
+1.8.2.3<br>
+<br>
diff --git a/meta/recipes-core/systemd/<u></u>systemd/0002-readahead-chunk-=
<u></u>on-spinning-media.patch b/meta/recipes-core/systemd/<u></u>systemd/0=
002-readahead-chunk-<u></u>on-spinning-media.patch<br>
deleted file mode 100644<br>
index d57a01c..0000000<br>
--- a/meta/recipes-core/systemd/<u></u>systemd/0002-readahead-chunk-<u></u>=
on-spinning-media.patch<br>
+++ /dev/null<br>
@@ -1,142 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
--Khem 2013/03/28<br>
-<br>
-From 94243ef299425d6c7089a7a05c48c9<u></u>bb8f6cf3da Mon Sep 17 00:00:00 2=
001<br>
-From: Auke Kok &lt;<a href=3D"mailto:auke-jan.h.kok@intel.com" target=3D"_=
blank">auke-jan.h.kok@intel.com</a>&gt;<br>
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
rget=3D"_blank">http://foo-projects.org/~<u></u>sofar/blocked-tests/</a><br=
>
-<br>
-There are bootcharts in the &quot;before&quot; and &quot;after&quot; folde=
rs where you<br>
-should be able to see that many low-level services finish 5-7<br>
-seconds earlier with the patch applied (after).<br>
----<br>
- Makefile.am =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-<br>
- src/readahead/readahead-<u></u>collect.c | =C2=A0 28 ++++++++++++++++++++=
+++++---<br>
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
-diff --git a/src/readahead/readahead-<u></u>collect.c b/src/readahead/read=
ahead-<u></u>collect.c<br>
-index 5d07f47..5d22949 100644<br>
---- a/src/readahead/readahead-<u></u>collect.c<br>
-+++ b/src/readahead/readahead-<u></u>collect.c<br>
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
diff --git a/meta/recipes-core/systemd/<u></u>systemd/0003-readahead-<u></u=
>cleanups.patch b/meta/recipes-core/systemd/<u></u>systemd/0003-readahead-<=
u></u>cleanups.patch<br>
deleted file mode 100644<br>
index e0b68df..0000000<br>
--- a/meta/recipes-core/systemd/<u></u>systemd/0003-readahead-<u></u>cleanu=
ps.patch<br>
+++ /dev/null<br>
@@ -1,86 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
--Khem 2013/03/28<br>
-<br>
-From b0640287f784a320661f7206c9ade0<u></u>7b99003fd5 Mon Sep 17 00:00:00 2=
001<br>
-From: Auke Kok &lt;<a href=3D"mailto:auke-jan.h.kok@intel.com" target=3D"_=
blank">auke-jan.h.kok@intel.com</a>&gt;<br>
-Date: Tue, 26 Mar 2013 11:13:47 -0700<br>
-Subject: [PATCH 03/17] readahead: cleanups<br>
-<br>
-- check for OOM<br>
-- no need to use floats and round()<br>
----<br>
- Makefile.am =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-<br>
- src/readahead/readahead-<u></u>collect.c | =C2=A0 20 ++++++++++++++------=
<br>
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
-diff --git a/src/readahead/readahead-<u></u>collect.c b/src/readahead/read=
ahead-<u></u>collect.c<br>
-index 5d22949..e2fd8df 100644<br>
---- a/src/readahead/readahead-<u></u>collect.c<br>
-+++ b/src/readahead/readahead-<u></u>collect.c<br>
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
diff --git a/meta/recipes-core/systemd/<u></u>systemd/0013-systemd-sysctl-<=
u></u>Handle-missing-etc-sysctl.<u></u>conf-proper.patch b/meta/recipes-cor=
e/systemd/<u></u>systemd/0013-systemd-sysctl-<u></u>Handle-missing-etc-sysc=
tl.<u></u>conf-proper.patch<br>

deleted file mode 100644<br>
index f2c8e02..0000000<br>
--- a/meta/recipes-core/systemd/<u></u>systemd/0013-systemd-sysctl-<u></u>H=
andle-missing-etc-sysctl.<u></u>conf-proper.patch<br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
--Khem 2013/03/28<br>
-<br>
-From 6f6fad96addf6b00b55c98cc0d0d80<u></u>26b0c1e7ca Mon Sep 17 00:00:00 2=
001<br>
-From: Eelco Dolstra &lt;<a href=3D"mailto:eelco.dolstra@logicblox.com" tar=
get=3D"_blank">eelco.dolstra@logicblox.com</a>&gt;<br>
-Date: Wed, 27 Mar 2013 13:41:59 +0100<br>
-Subject: [PATCH 13/17] systemd-sysctl: Handle missing /etc/sysctl.conf<br>
- properly<br>
-<br>
-Since fabe5c0e5fce730aa66e10a9c4f9fd<u></u>d443d7aeda, systemd-sysctl retu=
rns<br>
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
diff --git a/meta/recipes-core/systemd/<u></u>systemd/199-firmware.patch b/=
meta/recipes-core/systemd/<u></u>systemd/199-firmware.patch<br>
deleted file mode 100644<br>
index aaab59b..0000000<br>
--- a/meta/recipes-core/systemd/<u></u>systemd/199-firmware.patch<br>
+++ /dev/null<br>
@@ -1,98 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<a href=3D"http://cgit.freedesktop.org/systemd/systemd/patch/?id=3Dd8d4bee=
76cf3b40ea923bc57d44aa0815ca9b5ff" target=3D"_blank">http://cgit.freedeskto=
p.org/<u></u>systemd/systemd/patch/?id=3D<u></u>d8d4bee76cf3b40ea923bc57d44=
aa0<u></u>815ca9b5ff</a><br>

-<br>
-From d8d4bee76cf3b40ea923bc57d44aa0<u></u>815ca9b5ff Mon Sep 17 00:00:00 2=
001<br>
-From: Kay Sievers &lt;<a href=3D"mailto:kay@vrfy.org" target=3D"_blank">ka=
y@vrfy.org</a>&gt;<br>
-Date: Thu, 28 Mar 2013 14:28:10 +0000<br>
-Subject: build-sys: fix HAVE/ENABLE_FIRMWARE<br>
-<br>
-<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D62864" target=3D=
"_blank">https://bugs.freedesktop.org/<u></u>show_bug.cgi?id=3D62864</a><br=
>
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
- AM_CONDITIONAL(ENABLE_<u></u>FIRMWARE, [test &quot;x${FIRMWARE_PATH}&quot=
; !=3D &quot;x&quot;])<br>
-<br>
- # ------------------------------<u></u>------------------------------<u><=
/u>------------------<br>
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
- # ------------------------------<u></u>------------------------------<u><=
/u>------------------<br>
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
;, udev_device_get_subsystem(dev)<u></u>);<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 event-&gt;ifindex =3D udev_device_get_ifindex=
(dev);<br>
--#ifdef ENABLE_FIRMWARE<br>
-+#ifdef HAVE_FIRMWARE<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (streq(udev_device_get_<u></u>subsystem(de=
v), &quot;firmware&quot;))<br>
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
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" ta=
rget=3D"_blank">sy<u></u>stemd_199.bb</a> b/meta/recipes-core/systemd/<a hr=
ef=3D"http://systemd_204.bb" target=3D"_blank">sy<u></u>stemd_204.bb</a><br=
>
similarity index 95%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" tar=
get=3D"_blank">syst<u></u>emd_199.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" targe=
t=3D"_blank">syst<u></u>emd_204.bb</a><br>
index b8da27e..74cd3c8 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_199.bb" target=3D=
"_blank">sy<u></u>stemd_199.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_204.bb" target=3D=
"_blank">sy<u></u>stemd_204.bb</a><br>
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D<u></u=
>751419260aa954499f7abaabaa882b<u></u>be \<br>
=C2=A0 PROVIDES =3D &quot;udev&quot;<br>
<br>
=C2=A0 PE =3D &quot;1&quot;<br>
-PR =3D &quot;r4&quot;<br>
<br>
=C2=A0 DEPENDS =3D &quot;kmod docbook-sgml-dtd-4.1-native intltool-native g=
perf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-n=
ative&quot;<br>
=C2=A0 DEPENDS +=3D &quot;${@base_contains(&#39;DISTRO_<u></u>FEATURES&#39;=
, &#39;pam&#39;, &#39;libpam&#39;, &#39;&#39;, d)}&quot;<br>
@@ -22,16 +21,12 @@ SRC_URI =3D &quot;<a href=3D"http://www.freedesktop.org=
/software/systemd/systemd-$%7BPV%7D.tar.xz" target=3D"_blank">http://www.fr=
eedesktop.org/<u></u>software/systemd/systemd-${PV}<u></u>.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://touchscreen.rules \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://modprobe.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${UCLIBCPATCHES} \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-utmp-turn-systemd-<u></u>u=
pdate-utmp-shutdown.service-<u></u>into-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://00-create-volatile.c=
onf \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-readahead-chunk-<u></u>on-=
spinning-media.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-readahead-<u></u>cleanups.=
patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0013-systemd-sysctl-<u></u>Hand=
le-missing-etc-sysctl.<u></u>conf-proper.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure-use-AC_<u></u>CH=
ECK_TOOL-for-objcopy-<u></u>strings-and-.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://199-firmware.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://init \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;<u></u>4bb13f84ce211e93f0141774a90a23<u></u>22&q=
uot;<br>
-SRC_URI[sha256sum] =3D &quot;<u></u>8c4462a04f3ecf7f083782e5e06879<u></u>1=
3b1d33c6444bf20fa2f31df922296<u></u>5fed&quot;<br>
+SRC_URI[md5sum] =3D &quot;<u></u>a07619bb19f48164fbf0761d12fd39<u></u>a8&q=
uot;<br>
+SRC_URI[sha256sum] =3D &quot;<u></u>072c393503c7c1e55ca7acf3db659c<u></u>b=
d28c7fe5fa94fab3db95360bafd96<u></u>731b&quot;<br>
<br>
=C2=A0 UCLIBCPATCHES =3D &quot;&quot;<br>
=C2=A0 UCLIBCPATCHES_libc-uclibc =3D &quot;file://systemd-pam-configure-<u>=
</u>check-uclibc.patch \<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--047d7b3a7e92378b8e04dd580c96--
