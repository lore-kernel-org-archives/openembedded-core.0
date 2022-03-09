Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27595C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 15:51:35 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web08.1794.1646841094292169158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 07:51:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GDauPZTN;
 spf=pass (domain: gmail.com, ip: 209.85.221.173,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id d6so1475319vkn.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 07:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5MHMXXqNkNIOqBRse9XX4D6cDdlRmqXGiWL/w1CRbs=;
        b=GDauPZTNjaxg2LHY30z7KT7f7k27Pw67ksbiJDvhqbEe/OPIqX1H7ulIgDIFSls8BJ
         eOkNd8jqCOYLCmYCXQ1Evtq3KJp6OXRXKTIkCx7ulLNe7NPfh7lDFakJHwfBtvi4thQi
         X4z4Usqq6Nx7ul/F4E+iKFGIZphGF+cH/bPUIJdLn0Vgj6CKAf11zebdfI+S//gB2+Bb
         Z38H4BFY2GhRnd8hX6bd7nA8KVKaAg7hNaZiE+BLaE46aWIAP9GsEbU7dMOqzY8VrDRP
         u9Rjx8m5OWqqApb44WnIdk3EYKUu8z2JBoGMrl9sD7gcD7++akA7FVF95XJUIfJ41If3
         APnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5MHMXXqNkNIOqBRse9XX4D6cDdlRmqXGiWL/w1CRbs=;
        b=s6fv7Pza6eBZ0ERqx9GVGQwuQQh1tgptU2sb7dCe+hsGfiuOWfek4wegsKy57OgpUh
         EdAuOJSRb14u8Wz58vbYfwgw3IeroQaKIcBL4VKI214VM/k3+rxJLOvFsJHt0TLp0Cos
         PuDmmGm0274DvF03xmUC72HdwPCVSThwshPzwDcT0GB7Je44gz41mupUEZ1ilp6H8b/j
         cbYLjQ/YM2e2wIFU1SeMqq7xhyHYeheEUfL79inMEH5p0tUhkBIoGcu9/aSJHohkfffn
         HIhO5+jSJWx51bpDyzB0ejBsn3o+cjn1HRRy4keszwIMYfODTovPDKmKrd1kRmXKp9gS
         oRZw==
X-Gm-Message-State: AOAM53390zrmcpbOQLKRdBQ68B6hZlsiSWeZC+WYMnj8SziSWZSBA/1Z
	sLJAGi1U55rD/XfWSxqfPkqPqmtVxrGm8T5yX1LE9GaH
X-Google-Smtp-Source: 
 ABdhPJxnBskzJzDuJJjKnXvUNhgSWqxOGYnOeTO6aCwr5Nw7wSuSShPggMe4bKZzYDHgWeutzvP0yIdoFsAhPj2r89s=
X-Received: by 2002:a05:6122:130b:b0:337:bd1a:7f74 with SMTP id
 e11-20020a056122130b00b00337bd1a7f74mr206867vkp.4.1646841093040; Wed, 09 Mar
 2022 07:51:33 -0800 (PST)
MIME-Version: 1.0
References: <20220308093224.3436483-1-alex@linutronix.de>
 <20220308093224.3436483-3-alex@linutronix.de>
 <CAAnfSTupWXPF34RZ4qw+38XfL29CnG2zv8xCcES4dqCPERFZXw@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTupWXPF34RZ4qw+38XfL29CnG2zv8xCcES4dqCPERFZXw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Mar 2022 16:51:20 +0100
Message-ID: 
 <CANNYZj8UnxaMikzLxxQKKirHn-ut=CQ0qTKW928q1Zv6CwYrjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 03/16] dbus: update 1.12.22 -> 1.14.0
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 15:51:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162966

It's atomic with dbus gaining a glib dependency unfortunately. I don't
want to break bisection.

Alex

On Wed, 9 Mar 2022 at 13:33, Ross Burton <ross@burtonini.com> wrote:
>
> Can you split the glib change out into a separate patch, as it's quite
> important but hidden in the dbus upgrade.
>
> Ross
>
> On Tue, 8 Mar 2022 at 09:32, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> >
> > Drop patches:
> > clear-guid_from_server-if-send_negotiate_unix_f.patch
> > stop_using_selinux_set_mapping.patch
> > (both merged upstream)
> >
> > python-config.patch
> > (patched code removed upstream)
> >
> > Merge dbus-test recipe into the main recipe. The reason it was separate
> > is that there is a peculiar circular dependency: dbus tests require glib,
> > while some of glib's gdbus tests require dbus. So dbus was built with
> > tests disabled and without glib dependency, then glib was built with
> > dbus dependency, then dbus was built again with glib dependency and tests
> > enabled, only for the purpose of installing those tests. I find that
> > brittle and hacky, so this removes dbus dependecy from glib (the fallout
> > is that some gdbus tests are no longer being executed), and dbus and its
> > tests are built once, after glib.
> >
> > Also, dbus ptest installation is no longer using custom code,
> > and dbus run-ptest simply uses standard installed tests execution mechanism
> > from gnome.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |   1 -
> >  .../distro/include/ptest-packagelists.inc     |   2 +-
> >  meta/recipes-core/dbus/dbus-test_1.12.22.bb   |  64 --------
> >  meta/recipes-core/dbus/dbus.inc               |  34 ----
> >  ...from_server-if-send_negotiate_unix_f.patch | 104 ------------
> >  .../dbus/dbus/python-config.patch             |  34 ----
> >  meta/recipes-core/dbus/dbus/run-ptest         |  34 +---
> >  .../dbus/stop_using_selinux_set_mapping.patch | 148 ------------------
> >  .../dbus/{dbus_1.12.22.bb => dbus_1.14.0.bb}  |  48 ++++--
> >  meta/recipes-core/glib-2.0/glib.inc           |   2 +-
> >  10 files changed, 42 insertions(+), 429 deletions(-)
> >  delete mode 100644 meta/recipes-core/dbus/dbus-test_1.12.22.bb
> >  delete mode 100644 meta/recipes-core/dbus/dbus.inc
> >  delete mode 100644 meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch
> >  delete mode 100644 meta/recipes-core/dbus/dbus/python-config.patch
> >  delete mode 100644 meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch
> >  rename meta/recipes-core/dbus/{dbus_1.12.22.bb => dbus_1.14.0.bb} (74%)
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > index 3fceb6701b..a8eceaadf4 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -134,7 +134,6 @@ RECIPE_MAINTAINER:pn-cwautomacros = "Ross Burton <ross.burton@arm.com>"
> >  RECIPE_MAINTAINER:pn-db = "Unassigned <unassigned@yoctoproject.org>"
> >  RECIPE_MAINTAINER:pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
> >  RECIPE_MAINTAINER:pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
> > -RECIPE_MAINTAINER:pn-dbus-test = "Chen Qi <Qi.Chen@windriver.com>"
> >  RECIPE_MAINTAINER:pn-dbus-wait = "Chen Qi <Qi.Chen@windriver.com>"
> >  RECIPE_MAINTAINER:pn-debianutils = "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER:pn-dejagnu = "Nathan Rossi <nathan@nathanrossi.com>"
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> > index c503a6a594..402fb87a3c 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -76,7 +76,7 @@ PTESTS_SLOW = "\
> >      babeltrace2-ptest \
> >      busybox-ptest \
> >      coreutils-ptest \
> > -    dbus-test-ptest \
> > +    dbus-ptest \
> >      e2fsprogs-ptest \
> >      findutils-ptest \
> >      glib-2.0-ptest \
> > diff --git a/meta/recipes-core/dbus/dbus-test_1.12.22.bb b/meta/recipes-core/dbus/dbus-test_1.12.22.bb
> > deleted file mode 100644
> > index ae70301431..0000000000
> > --- a/meta/recipes-core/dbus/dbus-test_1.12.22.bb
> > +++ /dev/null
> > @@ -1,64 +0,0 @@
> > -SUMMARY = "D-Bus test package (for D-bus functionality testing only)"
> > -HOMEPAGE = "http://dbus.freedesktop.org"
> > -SECTION = "base"
> > -
> > -require dbus.inc
> > -
> > -SRC_URI += "file://run-ptest \
> > -            file://python-config.patch \
> > -           "
> > -
> > -DEPENDS = "dbus glib-2.0"
> > -
> > -RDEPENDS:${PN}-dev = ""
> > -
> > -S="${WORKDIR}/dbus-${PV}"
> > -FILESEXTRAPATHS =. "${FILE_DIRNAME}/dbus:"
> > -
> > -inherit ptest
> > -
> > -EXTRA_OECONF += "--enable-tests \
> > -                --enable-modular-tests \
> > -                --enable-installed-tests \
> > -                --enable-checks \
> > -                --enable-asserts \
> > -                --with-dbus-test-dir=${PTEST_PATH} \
> > -                --enable-embedded-tests \
> > -             "
> > -
> > -do_install() {
> > -    :
> > -}
> > -
> > -do_install_ptest() {
> > -       install -d ${D}${PTEST_PATH}/test
> > -       l="shell printf refs syslog marshal syntax corrupt dbus-daemon dbus-daemon-eavesdrop loopback relay \
> > -          variant uid-permissions syntax spawn sd-activation names monitor message fdpass service shell-service"
> > -       for i in $l; do install ${B}/test/.libs/test-$i ${D}${PTEST_PATH}/test; done
> > -
> > -       l="bus bus-system bus-launch-helper"
> > -       for i in $l; do install ${B}/bus/.libs/test-$i ${D}${PTEST_PATH}/test; done
> > -
> > -       install -d ${D}${PTEST_PATH}/bus
> > -       install ${B}/bus/.libs/dbus-daemon-launch-helper-test ${D}${PTEST_PATH}/bus
> > -
> > -       install ${B}/test/test-segfault ${D}${PTEST_PATH}/test
> > -
> > -       cp -r ${B}/test/data ${D}${PTEST_PATH}/test
> > -       install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
> > -
> > -       install -d ${D}${PTEST_PATH}/test/.libs
> > -       cp -a ${B}/dbus/.libs/*.so* ${D}${PTEST_PATH}/test/.libs
> > -
> > -       # Remove build host references...
> > -       find "${D}${PTEST_PATH}/test/data" \( -name *.service -o -name *.conf -o -name "*.aaprofile" \) -type f -exec \
> > -               sed -i \
> > -                -e 's:${B}:${PTEST_PATH}:g' \
> > -                {} +
> > -        sed -i -e 's;@PTEST_PATH@;${PTEST_PATH};g'  ${D}${PTEST_PATH}/run-ptest
> > -}
> > -
> > -RDEPENDS:${PN}-ptest += "bash make dbus"
> > -RDEPENDS:${PN}-ptest:remove = "${PN}"
> > -
> > -PRIVATE_LIBS:${PN}-ptest = "libdbus-1.so.3"
> > diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> > deleted file mode 100644
> > index cb4c56db92..0000000000
> > --- a/meta/recipes-core/dbus/dbus.inc
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -inherit autotools pkgconfig gettext upstream-version-is-even
> > -
> > -LICENSE = "AFL-2.1 | GPL-2.0-or-later"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> > -                    file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
> > -
> > -SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
> > -           file://tmpdir.patch \
> > -           file://dbus-1.init \
> > -           file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
> > -           file://stop_using_selinux_set_mapping.patch \
> > -"
> > -
> > -SRC_URI[sha256sum] = "8d25785c798ec4f892e6f9d177fb0ceeb8b29867b119798f9d5228561d3ad474"
> > -
> > -EXTRA_OECONF = "--disable-xml-docs \
> > -                --disable-doxygen-docs \
> > -                --enable-largefile \
> > -                --with-system-socket=/run/dbus/system_bus_socket \
> > -                "
> > -EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
> > -
> > -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
> > -                   user-session \
> > -                  "
> > -PACKAGECONFIG:class-native = ""
> > -PACKAGECONFIG:class-nativesdk = ""
> > -
> > -PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
> > -PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
> > -PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
> > -PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
> > -PACKAGECONFIG[audit] = "--enable-libaudit,--disable-libaudit,audit"
> > -PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
> > diff --git a/meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch b/meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch
> > deleted file mode 100644
> > index 6bb6d9c82e..0000000000
> > --- a/meta/recipes-core/dbus/dbus/clear-guid_from_server-if-send_negotiate_unix_f.patch
> > +++ /dev/null
> > @@ -1,104 +0,0 @@
> > -From b8f84bd39485d3977625c9a8b8e8cff5d23be56f Mon Sep 17 00:00:00 2001
> > -From: Roy Li <rongqing.li@windriver.com>
> > -Date: Thu, 27 Feb 2014 09:05:02 +0800
> > -Subject: [PATCH] dbus: clear guid_from_server if send_negotiate_unix_fd
> > - failed
> > -
> > -Upstream-Status: Submitted
> > -
> > -bus-test dispatch test failed with below information:
> > -    ./bus/bus-test: Running message dispatch test
> > -    Activating service name='org.freedesktop.DBus.TestSuiteEchoService'
> > -    Successfully activated service 'org.freedesktop.DBus.TestSuiteEchoService'
> > -    6363: assertion failed "_dbus_string_get_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server) == 0" file "dbus-auth.c" line 1545 function process_ok
> > -      ./bus/bus-test(_dbus_print_backtrace+0x29) [0x80cb969]
> > -      ./bus/bus-test(_dbus_abort+0x14) [0x80cfb44]
> > -      ./bus/bus-test(_dbus_real_assert+0x53) [0x80b52c3]
> > -      ./bus/bus-test() [0x80e24da]
> > -      ./bus/bus-test(_dbus_auth_do_work+0x388) [0x80e3848]
> > -      ./bus/bus-test() [0x80aea49]
> > -      ./bus/bus-test() [0x80affde]
> > -      ./bus/bus-test(_dbus_transport_handle_watch+0xb1) [0x80ad841]
> > -      ./bus/bus-test(_dbus_connection_handle_watch+0x104) [0x8089174]
> > -      ./bus/bus-test(dbus_watch_handle+0xd8) [0x80b15e8]
> > -      ./bus/bus-test(_dbus_loop_iterate+0x4a9) [0x80d1509]
> > -      ./bus/bus-test(bus_test_run_clients_loop+0x5d) [0x808129d]
> > -      ./bus/bus-test() [0x806cab0]
> > -      ./bus/bus-test() [0x806e0ca]
> > -      ./bus/bus-test() [0x806da6f]
> > -      ./bus/bus-test(_dbus_test_oom_handling+0x18c) [0x80b5c8c]
> > -      ./bus/bus-test() [0x806f723]
> > -      ./bus/bus-test(bus_dispatch_test+0x3c) [0x8071aac]
> > -      ./bus/bus-test(main+0x1b7) [0x805acc7]
> > -      /lib/libc.so.6(__libc_start_main+0xf3) [0x45f919b3]
> > -      ./bus/bus-test() [0x805ae39]
> > -
> > -The stack is below:
> > -    #0  0xffffe425 in __kernel_vsyscall ()
> > -    #1  0x45fa62d6 in raise () from /lib/libc.so.6
> > -    #2  0x45fa9653 in abort () from /lib/libc.so.6
> > -    #3  0x080cfb65 in _dbus_abort () at dbus-sysdeps.c:94
> > -    #4  0x080b52c3 in _dbus_real_assert (condition=0,
> > -        condition_text=condition_text@entry=0x8117a38 "_dbus_string_get_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server) == 0",
> > -        file=file@entry=0x8117273 "dbus-auth.c", line=line@entry=1545,
> > -        func=func@entry=0x8117f8e <__FUNCTION__.3492> "process_ok")
> > -        data=0x8157290) at dbus-connection.c:1515
> > -    #0  0x00000033fee353e9 in raise () from /lib64/libc.so.6
> > -    #1  0x00000033fee38508 in abort () from /lib64/libc.so.6
> > -    #2  0x000000000047d585 in _dbus_abort () at dbus-sysdeps.c:94
> > -    #3  0x0000000000466486 in _dbus_real_assert (condition=<optimized out>,
> > -        condition_text=condition_text@entry=0x4c2988 "_dbus_string_get_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server) == 0",
> > -        file=file@entry=0x4c21a5 "dbus-auth.c", line=line@entry=1546,
> > -        func=func@entry=0x4c2fce <__FUNCTION__.3845> "process_ok")
> > -        at dbus-internals.c:931
> > -    #4  0x000000000048d424 in process_ok (args_from_ok=0x7fffffffe480,
> > -        auth=0x6ff340) at dbus-auth.c:1546
> > -    #5  handle_client_state_waiting_for_data (auth=0x6ff340,
> > -        command=<optimized out>, args=0x7fffffffe480) at dbus-auth.c:1996
> > -    #6  0x000000000048e789 in process_command (auth=0x6ff340) at dbus-auth.c:2208
> > -    #7  _dbus_auth_do_work (auth=0x6ff340) at dbus-auth.c:2458
> > -    #8  0x000000000046091d in do_authentication (
> > -        transport=transport@entry=0x6ffaa0, do_reading=do_reading@entry=1,
> > -        do_writing=do_writing@entry=0,
> > -        auth_completed=auth_completed@entry=0x7fffffffe55c)
> > -        at dbus-transport-socket.c:442
> > -    #9  0x0000000000461d08 in socket_handle_watch (transport=0x6ffaa0,
> > -        watch=0x6f4190, flags=1) at dbus-transport-socket.c:921
> > -    #10 0x000000000045fa3a in _dbus_transport_handle_watch (transport=0x6ffaa0,
> > -
> > -Once send_negotiate_unix_fd failed, this failure will happen, since
> > -auth->guid_from_server has been set to some value before
> > -send_negotiate_unix_fd. send_negotiate_unix_fd failure will lead to
> > -this auth be handled by process_ok again, but this auth->guid_from_server
> > -is not zero.
> > -
> > -So we should clear auth->guid_from_server if send_negotiate_unix_fd failed
> > -
> > -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > ----
> > - dbus/dbus-auth.c |    9 +++++++--
> > - 1 file changed, 7 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/dbus/dbus-auth.c b/dbus/dbus-auth.c
> > -index d2c37a7..37b45c6 100644
> > ---- a/dbus/dbus-auth.c
> > -+++ b/dbus/dbus-auth.c
> > -@@ -1571,8 +1571,13 @@ process_ok(DBusAuth *auth,
> > -   _dbus_verbose ("Got GUID '%s' from the server\n",
> > -                  _dbus_string_get_const_data (& DBUS_AUTH_CLIENT (auth)->guid_from_server));
> > -
> > --  if (auth->unix_fd_possible)
> > --    return send_negotiate_unix_fd(auth);
> > -+  if (auth->unix_fd_possible) {
> > -+     if (!send_negotiate_unix_fd(auth)) {
> > -+         _dbus_string_set_length (& DBUS_AUTH_CLIENT (auth)->guid_from_server, 0);
> > -+         return FALSE;
> > -+     }
> > -+     return TRUE;
> > -+  }
> > -
> > -   _dbus_verbose("Not negotiating unix fd passing, since not possible\n");
> > -   return send_begin (auth);
> > ---
> > -1.7.10.4
> > -
> > diff --git a/meta/recipes-core/dbus/dbus/python-config.patch b/meta/recipes-core/dbus/dbus/python-config.patch
> > deleted file mode 100644
> > index da2f10c726..0000000000
> > --- a/meta/recipes-core/dbus/dbus/python-config.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -When building the dbus-ptest package, we have to enable python.  However
> > -checking if the host-system python has the necessary library isn't useful.
> > -
> > -Disable the python module check for cross compiling.
> > -
> > -Upstream-Status: Inappropriate [oe specific]
> > -
> > -Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> > -
> > ----
> > - configure.ac | 7 -------
> > - 1 file changed, 7 deletions(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index 80d27b4..becc1cc 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -279,13 +279,6 @@ if test "x$enable_tests" = xyes; then
> > -   # full test coverage is required, Python is a hard dependency
> > -   AC_MSG_NOTICE([Full test coverage (--enable-tests=yes) requires Python, dbus-python, pygi])
> > -   AM_PATH_PYTHON([2.6])
> > --  AC_MSG_CHECKING([for Python modules for full test coverage])
> > --  if "$PYTHON" -c "import dbus, gi.repository.GObject, dbus.mainloop.glib"; then
> > --    AC_MSG_RESULT([yes])
> > --  else
> > --    AC_MSG_RESULT([no])
> > --    AC_MSG_ERROR([cannot import dbus, gi.repository.GObject, dbus.mainloop.glib Python modules])
> > --  fi
> > - else
> > -   # --enable-tests not given: do not abort if Python is missing
> > -   AM_PATH_PYTHON([2.6], [], [:])
> > ---
> > -1.9.1
> > -
> > diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
> > index d3eec08235..54f43e1f68 100755
> > --- a/meta/recipes-core/dbus/dbus/run-ptest
> > +++ b/meta/recipes-core/dbus/dbus/run-ptest
> > @@ -1,35 +1,3 @@
> >  #!/bin/sh
> > -
> > -output() {
> > -  retcode=$?
> > -  if [ $retcode -eq 0 ]
> > -    then echo "PASS: $i"
> > -  elif [ $retcode -eq 77 ]
> > -    then echo "SKIP: $i"
> > -  else echo "FAIL: $i"
> > -  fi
> > -}
> > -
> > -export DBUS_TEST_HOMEDIR=./test
> > -export XDG_RUNTIME_DIR=./test
> > -export LD_LIBRARY_PATH=@PTEST_PATH@/test/.libs
> > -
> > -files=`ls test/test-*`
> > -
> > -for i in $files
> > -do
> > -     #these programs are used by testcase test-bus, don't run here
> > -     #additionally, test-names needs to be run under X
> > -     if [ $i = "test/test-service" ] \
> > -        || [ $i = "test/test-shell-service" ] \
> > -        || [ $i = "test/test-segfault" ] \
> > -        || [ $i = "test/test-bus" ] \
> > -        || [ $i = "test/test-names" ]
> > -     then
> > -         continue
> > -     fi
> > -
> > -     ./$i ./test/data >/dev/null 2>&1
> > -     output
> > -done
> > +gnome-desktop-testing-runner dbus
> >
> > diff --git a/meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch b/meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch
> > deleted file mode 100644
> > index 7035098e41..0000000000
> > --- a/meta/recipes-core/dbus/dbus/stop_using_selinux_set_mapping.patch
> > +++ /dev/null
> > @@ -1,148 +0,0 @@
> > -From 6072f8b24153d844a3033108a17bcd0c1a967816 Mon Sep 17 00:00:00 2001
> > -From: Laurent Bigonville <bigon@bigon.be>
> > -Date: Sat, 3 Mar 2018 11:15:23 +0100
> > -Subject: [PATCH] Stop using selinux_set_mapping() function
> > -
> > -Currently, if the "dbus" security class or the associated AV doesn't
> > -exist, dbus-daemon fails to initialize and exits immediately. Also the
> > -security classes or access vector cannot be reordered in the policy.
> > -This can be a problem for people developing their own policy or trying
> > -to access a machine where, for some reasons, there is not policy defined
> > -at all.
> > -
> > -The code here copy the behaviour of the selinux_check_access() function.
> > -We cannot use this function here as it doesn't allow us to define the
> > -AVC entry reference.
> > -
> > -See the discussion at https://marc.info/?l=selinux&m=152163374332372&w=2
> > -
> > -Resolves: https://gitlab.freedesktop.org/dbus/dbus/issues/198
> > ----
> > - bus/selinux.c | 75 ++++++++++++++++++++++++++++-----------------------
> > - 1 file changed, 42 insertions(+), 33 deletions(-)
> > -
> > -
> > -Upstream-Status: Backport
> > -Signed-off-by: Nisha.Parrakat <Nisha.Parrakat@kpit.com>
> > -diff --git a/bus/selinux.c b/bus/selinux.c
> > -
> > ---- a/bus/selinux.c    2021-08-11 14:45:59.048513026 +0000
> > -+++ b/bus/selinux.c    2021-08-11 14:57:47.144846966 +0000
> > -@@ -311,24 +311,6 @@
> > - #endif
> > - }
> > -
> > --/*
> > -- * Private Flask definitions; the order of these constants must
> > -- * exactly match that of the structure array below!
> > -- */
> > --/* security dbus class constants */
> > --#define SECCLASS_DBUS       1
> > --
> > --/* dbus's per access vector constants */
> > --#define DBUS__ACQUIRE_SVC   1
> > --#define DBUS__SEND_MSG      2
> > --
> > --#ifdef HAVE_SELINUX
> > --static struct security_class_mapping dbus_map[] = {
> > --  { "dbus", { "acquire_svc", "send_msg", NULL } },
> > --  { NULL }
> > --};
> > --#endif /* HAVE_SELINUX */
> > --
> > - /**
> > -  * Establish dynamic object class and permission mapping and
> > -  * initialize the user space access vector cache (AVC) for D-Bus and set up
> > -@@ -350,13 +332,6 @@
> > -
> > -   _dbus_verbose ("SELinux is enabled in this kernel.\n");
> > -
> > --  if (selinux_set_mapping (dbus_map) < 0)
> > --    {
> > --      _dbus_warn ("Failed to set up security class mapping (selinux_set_mapping():%s).",
> > --                   strerror (errno));
> > --      return FALSE;
> > --    }
> > --
> > -   avc_entry_ref_init (&aeref);
> > -   if (avc_init ("avc", &mem_cb, &log_cb, &thread_cb, &lock_cb) < 0)
> > -     {
> > -@@ -421,19 +396,53 @@
> > - static dbus_bool_t
> > - bus_selinux_check (BusSELinuxID        *sender_sid,
> > -                    BusSELinuxID        *override_sid,
> > --                   security_class_t     target_class,
> > --                   access_vector_t      requested,
> > -+                   const char          *target_class,
> > -+                   const char          *requested,
> > -                  DBusString          *auxdata)
> > - {
> > -+  int saved_errno;
> > -+  security_class_t security_class;
> > -+  access_vector_t requested_access;
> > -+
> > -   if (!selinux_enabled)
> > -     return TRUE;
> > -
> > -+  security_class = string_to_security_class (target_class);
> > -+  if (security_class == 0)
> > -+    {
> > -+      saved_errno = errno;
> > -+      log_callback (SELINUX_ERROR, "Unknown class %s", target_class);
> > -+      if (security_deny_unknown () == 0)
> > -+        {
> > -+          return TRUE;
> > -+      }
> > -+
> > -+      _dbus_verbose ("Unknown class %s\n", target_class);
> > -+      errno = saved_errno;
> > -+      return FALSE;
> > -+    }
> > -+
> > -+  requested_access = string_to_av_perm (security_class, requested);
> > -+  if (requested_access == 0)
> > -+    {
> > -+      saved_errno = errno;
> > -+      log_callback (SELINUX_ERROR, "Unknown permission %s for class %s", requested, target_class);
> > -+      if (security_deny_unknown () == 0)
> > -+        {
> > -+          return TRUE;
> > -+      }
> > -+
> > -+      _dbus_verbose ("Unknown permission %s for class %s\n", requested, target_class);
> > -+      errno = saved_errno;
> > -+      return FALSE;
> > -+    }
> > -+
> > -   /* Make the security check.  AVC checks enforcing mode here as well. */
> > -   if (avc_has_perm (SELINUX_SID_FROM_BUS (sender_sid),
> > -                     override_sid ?
> > -                     SELINUX_SID_FROM_BUS (override_sid) :
> > -                     bus_sid,
> > --                    target_class, requested, &aeref, auxdata) < 0)
> > -+                    security_class, requested_access, &aeref, auxdata) < 0)
> > -     {
> > -     switch (errno)
> > -       {
> > -@@ -500,8 +509,8 @@
> > -
> > -   ret = bus_selinux_check (connection_sid,
> > -                          service_sid,
> > --                         SECCLASS_DBUS,
> > --                         DBUS__ACQUIRE_SVC,
> > -+                         "dbus",
> > -+                         "acquire_svc",
> > -                          &auxdata);
> > -
> > -   _dbus_string_free (&auxdata);
> > -@@ -629,8 +638,8 @@
> > -
> > -   ret = bus_selinux_check (sender_sid,
> > -                          recipient_sid,
> > --                         SECCLASS_DBUS,
> > --                         DBUS__SEND_MSG,
> > -+                         "dbus",
> > -+                         "send_msg",
> > -                          &auxdata);
> > -
> > -   _dbus_string_free (&auxdata);
> > diff --git a/meta/recipes-core/dbus/dbus_1.12.22.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
> > similarity index 74%
> > rename from meta/recipes-core/dbus/dbus_1.12.22.bb
> > rename to meta/recipes-core/dbus/dbus_1.14.0.bb
> > index 48947209d9..7598c45f8e 100644
> > --- a/meta/recipes-core/dbus/dbus_1.12.22.bb
> > +++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
> > @@ -3,12 +3,44 @@ DESCRIPTION = "D-Bus is a message bus system, a simple way for applications to t
> >  HOMEPAGE = "https://dbus.freedesktop.org"
> >  SECTION = "base"
> >
> > -require dbus.inc
> > +inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
> >
> > -DEPENDS = "expat virtual/libintl autoconf-archive"
> > -PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest', '', d)}"
> > -ALLOW_EMPTY:dbus-ptest = "1"
> > -RDEPENDS:dbus-ptest:class-target = "dbus-test-ptest"
> > +LICENSE = "AFL-2.1 | GPL-2.0-or-later"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> > +                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8"
> > +
> > +SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
> > +           file://run-ptest \
> > +           file://tmpdir.patch \
> > +           file://dbus-1.init \
> > +"
> > +
> > +SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
> > +
> > +EXTRA_OECONF = "--disable-xml-docs \
> > +                --disable-doxygen-docs \
> > +                --enable-largefile \
> > +                --with-system-socket=/run/dbus/system_bus_socket \
> > +                --enable-tests \
> > +                --enable-checks \
> > +                --enable-asserts \
> > +                "
> > +EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
> > +
> > +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
> > +                   user-session \
> > +                  "
> > +PACKAGECONFIG:class-native = ""
> > +PACKAGECONFIG:class-nativesdk = ""
> > +
> > +PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_system_unitdir},--disable-systemd --without-systemdsystemunitdir,systemd"
> > +PACKAGECONFIG[x11] = "--enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
> > +PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
> > +PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
> > +PACKAGECONFIG[audit] = "--enable-libaudit,--disable-libaudit,audit"
> > +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
> > +
> > +DEPENDS = "expat virtual/libintl autoconf-archive glib-2.0"
> >  RDEPENDS:${PN} += "${PN}-common ${PN}-tools"
> >  RDEPENDS:${PN}:class-native = ""
> >
> > @@ -73,6 +105,8 @@ FILES:${PN}-lib = "${libdir}/lib*.so.*"
> >  RRECOMMENDS:${PN}-lib = "${PN}"
> >  FILES:${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-test-tool ${datadir}/xml/dbus-1"
> >
> > +RDEPENDS:${PN}-ptest += "bash make dbus"
> > +
> >  PACKAGE_WRITE_DEPS += "${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-systemctl-native','',d)}"
> >  pkg_postinst:dbus() {
> >         # If both systemd and sysvinit are enabled, mask the dbus-1 init script
> > @@ -89,8 +123,6 @@ pkg_postinst:dbus() {
> >  }
> >
> >
> > -EXTRA_OECONF += "--disable-tests"
> > -
> >  do_install() {
> >         autotools_do_install
> >
> > @@ -149,5 +181,3 @@ do_install:class-nativesdk() {
> >         rm -rf ${D}${localstatedir}/run
> >  }
> >  BBCLASSEXTEND = "native nativesdk"
> > -
> > -INSANE_SKIP:${PN}-ptest += "build-deps"
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> > index 268e48a088..6e20d40dac 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -43,7 +43,7 @@ PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux"
> >  PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
> >  # libelf is auto-detected without a configuration option
> >  PACKAGECONFIG[libelf] = ",,elfutils"
> > -PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,dbus"
> > +PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,"
> >  PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
> >
> >  EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false"
> > --
> > 2.30.2
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162880): https://lists.openembedded.org/g/openembedded-core/message/162880
> > Mute This Topic: https://lists.openembedded.org/mt/89633519/1676615
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

