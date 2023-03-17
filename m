Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1106CC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 07:34:37 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.13967.1679038466282497452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 00:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WZ0xMSLY;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id b10so4191595lfb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679038464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cfCs4LKazpw1wZynau/jAYLztArPlOPsedBYXJGxJe8=;
        b=WZ0xMSLYtnaPkIUmNwzZjsHKjlsJiFR83KDAoZMZ6vLbo4BYmkVDE8lqygD/JoShzP
         k/huRl46irTTN1UteQLlekYzdUWsCgklFAL1HUQ76keGH5Hh48z7yEQE7q3D/177A4bJ
         yFQsUUBsbBDL+N4useyEKNToN8XJU8MuHjTLjgUqN51we1rAoP3aeOZAvjZyb78VViPm
         0hQQUx+ogcRFzY1dXuHyODGRKqRLxNpebRO6a+5dK9O8TR3AmKn2V2dCWQT4pM9CBxsJ
         DopqxZCN7g99Rywyeb091fbLv4nFhk47s/j9jrXQeNtVChs96uJY5IM+wMXQ/7t1SonV
         jC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679038464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfCs4LKazpw1wZynau/jAYLztArPlOPsedBYXJGxJe8=;
        b=1oQjO52QBTcr+Rf7s9YI8fwftYMH+3FOKzyLDIS396pYtrJtYnr9wmaG3cOr0F445B
         awp7flHBPKcWwqKtJG8Qr04J0yUNXGd0PHOoFy2uxpPtm9wyC7ZUH2zvFP+ZsCPLEUI+
         IxaFiAuGwPkiH5nPgnp/Ix616Gn4kYpPy6PzvEEpoOvUNnMm06+Rv/EVvlww9oLXmQlr
         elPaozFKrRRVzhW7annYPWiIgGk1JirFLcyqW4Hj1iW2S62QBThJ781wkHttvTyWFtCg
         R9c3I7KDOyyOgfhkER01bdRC0gnvROs7ZXOIU05aVqJUCWWOK4vmBhBV5TwHuqnFLhET
         dSZw==
X-Gm-Message-State: AO0yUKXsC1RUzTUR/kiOv4cFTGGfmwqClCyvzBl/rBfNO0ZQEkr/w00R
	gK8/LnnAm1BPGxckJ+E/ZT29+ek+sh/kg3dPey+bAgJu
X-Google-Smtp-Source: AK7set+8PyGLei+DL6KnfJPGoi4LQiBmmRj7DVVTGBAgHoGIAFlViSnzT58JPmujszAv7YOwoBkUvPeXbUQV5KTs0f4=
X-Received: by 2002:ac2:4c3c:0:b0:4dd:fd4e:5a21 with SMTP id
 u28-20020ac24c3c000000b004ddfd4e5a21mr4084642lfq.11.1679038464360; Fri, 17
 Mar 2023 00:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230317060202.385862-1-f_l_k@t-online.de>
In-Reply-To: <20230317060202.385862-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Mar 2023 08:34:13 +0100
Message-ID: <CANNYZj9yNyno6jWJD0duOqkW_rFxfwFEsiYOApLWRQBf90Tv5Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH] Remove usage of /var/volatile/tmp
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003b862605f7139bd7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 07:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178743

--0000000000003b862605f7139bd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This patch on the other hand looks fine, but needs to go through the test
matrix. It=E2=80=99s most likely post mickledore material.

Alex

On Fri 17. Mar 2023 at 7.02, Markus Volk <f_l_k@t-online.de> wrote:

> Currently /tmp is a link to /var/tmp which breaks glib-2.0 ptest
> Systemd documentation describes tmpdir usage as follows:
>
> /tmp/ and /var/tmp/ are two world-writable directories Linux systems
> provide for temporary files. The former is
> typically on tmpfs and thus backed by RAM/swap, and flushed out on each
> reboot. The latter is typically a proper,
> persistent file system, and thus backed by physical storage.
>
> By default, systemd-tmpfiles will apply a concept of =E2=80=9Cageing=E2=
=80=9D to all files
> and directories stored in /tmp/ and
> /var/tmp/. This means that files that have neither been changed nor read
> within a specific time frame are auto-
> matically removed in regular intervals.
> (This concept is not new to systemd-tmpfiles btw, it=E2=80=99s inherited =
from
> previous subsystems such as tmpwatch.)
> By default files in /tmp/ are cleaned up after 10 days, and those in
> /var/tmp after 30 days.
>
> This commit tries to align tmpdir to what systemd expects.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/conf/bitbake.conf                        |  4 ---
>  meta/files/fs-perms-persistent-log.txt        |  2 --
>  meta/files/fs-perms.txt                       |  2 --
>  .../lib/oeqa/files/buildhistory_filelist1.txt |  1 -
>  .../lib/oeqa/files/buildhistory_filelist2.txt |  1 -
>  meta/recipes-core/base-files/base-files/fstab |  1 +
>  .../base-files/base-files_3.0.14.bb           |  4 +--
>  .../initscripts-1.0/populate-volatile.sh      |  2 +-
>  .../initscripts/initscripts-1.0/volatiles     |  5 ++-
>  .../initscripts/initscripts_1.0.bb            |  3 --
>  .../systemd/systemd/00-create-volatile.conf   |  4 +--
>  meta/recipes-core/systemd/systemd_253.1.bb    |  7 ----
>  meta/recipes-core/udev/eudev/init             |  4 ---
>  .../e2fsprogs/e2fsprogs/run-ptest             |  2 +-
>  ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch | 34 -------------------
>  .../valgrind/valgrind_3.20.0.bb               |  1 -
>  16 files changed, 8 insertions(+), 69 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.stder=
r.exp-adjust-tmp-paths.patch
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index afd9e2f552..dcf6ce99d1 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -90,10 +90,6 @@ ROOT_HOME ??=3D "/home/root"
>  # If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on
> persistent storage.
>  VOLATILE_LOG_DIR ?=3D "yes"
>
> -# if set to 'yes': /tmp links to /var/tmp which links to /var/volatile/t=
mp
> -# otherwise:       /tmp is on persistent storage
> -VOLATILE_TMP_DIR ?=3D "yes"
> -
>  BB_RENAMED_VARIABLES[PNBLACKLIST] =3D "SKIP_RECIPE"
>  BB_RENAMED_VARIABLES[CVE_CHECK_PN_WHITELIST] =3D "CVE_CHECK_SKIP_RECIPE"
>  BB_RENAMED_VARIABLES[CVE_CHECK_WHITELIST] =3D "CVE_CHECK_IGNORE"
> diff --git a/meta/files/fs-perms-persistent-log.txt
> b/meta/files/fs-perms-persistent-log.txt
> index 518c1be3c9..326c0ed092 100644
> --- a/meta/files/fs-perms-persistent-log.txt
> +++ b/meta/files/fs-perms-persistent-log.txt
> @@ -47,7 +47,6 @@ ${oldincludedir}      0755    root    root    true
> 0644    root    root
>  # Links
>  ${localstatedir}/run   link    /run
>  ${localstatedir}/lock  link    /run/lock
> -${localstatedir}/tmp   link    volatile/tmp
>
>  /home                          0755    root    root    false - - -
>  /srv                           0755    root    root    false - - -
> @@ -57,7 +56,6 @@ ${localstatedir}/local                0755    root
> root    false - - -
>  # Special permissions from base-files
>  # Set 1777
>  /tmp                           01777   root    root    false - - -
> -${localstatedir}/volatile/tmp  01777   root    root    false - - -
>
>  # Set 0700
>  ${ROOT_HOME}                   0700    root    root    false - - -
> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
> index daa4aed840..ed59311035 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms.txt
> @@ -48,7 +48,6 @@ ${oldincludedir}      0755    root    root    true
> 0644    root    root
>  ${localstatedir}/run   link    /run
>  ${localstatedir}/log   link    volatile/log
>  ${localstatedir}/lock  link    /run/lock
> -${localstatedir}/tmp   link    volatile/tmp
>
>  /home                          0755    root    root    false - - -
>  /srv                           0755    root    root    false - - -
> @@ -58,7 +57,6 @@ ${localstatedir}/local                0755    root
> root    false - - -
>  # Special permissions from base-files
>  # Set 1777
>  /tmp                           01777   root    root    false - - -
> -${localstatedir}/volatile/tmp  01777   root    root    false - - -
>
>  # Set 0700
>  ${ROOT_HOME}                   0700    root    root    false - - -
> diff --git a/meta/lib/oeqa/files/buildhistory_filelist1.txt
> b/meta/lib/oeqa/files/buildhistory_filelist1.txt
> index 8d882895ad..ec50017383 100644
> --- a/meta/lib/oeqa/files/buildhistory_filelist1.txt
> +++ b/meta/lib/oeqa/files/buildhistory_filelist1.txt
> @@ -9210,5 +9210,4 @@ lrwxrwxrwx root       root               12
> ./var/log -> volatile/log
>  lrwxrwxrwx root       root                6 ./var/run -> ../run
>  drwxr-xr-x root       root             4096 ./var/spool
>  drwxrwxr-x root       mail             4096 ./var/spool/mail
> -lrwxrwxrwx root       root               12 ./var/tmp -> volatile/tmp
>  drwxr-xr-x root       root             4096 ./var/volatile
> diff --git a/meta/lib/oeqa/files/buildhistory_filelist2.txt
> b/meta/lib/oeqa/files/buildhistory_filelist2.txt
> index ac6307060d..cedec51c38 100644
> --- a/meta/lib/oeqa/files/buildhistory_filelist2.txt
> +++ b/meta/lib/oeqa/files/buildhistory_filelist2.txt
> @@ -9213,5 +9213,4 @@ lrwxrwxrwx root       root               12
> ./var/log -> volatile/log
>  lrwxrwxrwx root       root                6 ./var/run -> ../run
>  drwxr-xr-x root       root             4096 ./var/spool
>  drwxrwxr-x root       mail             4096 ./var/spool/mail
> -lrwxrwxrwx root       root               12 ./var/tmp -> volatile/tmp
>  drwxr-xr-x root       root             4096 ./var/volatile
> diff --git a/meta/recipes-core/base-files/base-files/fstab
> b/meta/recipes-core/base-files/base-files/fstab
> index 70e400f567..7064573130 100644
> --- a/meta/recipes-core/base-files/base-files/fstab
> +++ b/meta/recipes-core/base-files/base-files/fstab
> @@ -5,6 +5,7 @@ proc                 /proc                proc
>  defaults              0  0
>  devpts               /dev/pts             devpts
>  mode=3D0620,ptmxmode=3D0666,gid=3D5      0  0
>  tmpfs                /run                 tmpfs
> mode=3D0755,nodev,nosuid,strictatime 0  0
>  tmpfs                /var/volatile        tmpfs      defaults
>   0  0
> +tmpfs                /tmp                 tmpfs      defaults
>   0  0
>
>  # uncomment this if your device has a SD/MMC/Transflash slot
>  #/dev/mmcblk0p1       /media/card          auto
>  defaults,sync,noauto  0  0
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
> b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index ff83567bd9..c2ecea0a25 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -29,7 +29,7 @@ S =3D "${WORKDIR}"
>  INHIBIT_DEFAULT_DEPS =3D "1"
>
>  docdir:append =3D "/${P}"
> -dirs1777 =3D "/tmp ${localstatedir}/volatile/tmp"
> +dirs1777 =3D "/tmp /var/tmp"
>  dirs2775 =3D ""
>  dirs555 =3D "/sys /proc"
>  dirs755 =3D "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
> @@ -53,7 +53,7 @@ dirs755-lsb =3D "/srv  \
>                 ${prefix}/lib/locale"
>  dirs2775-lsb =3D "/var/mail"
>
> -volatiles =3D "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else =
''}
> tmp"
> +volatiles =3D "${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else =
''}"
>  conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
>               ${sysconfdir}/issue /${sysconfdir}/issue.net \
>               ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
> diff --git
> a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index bc630e871c..ecfb6fdc2b 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -23,7 +23,7 @@ ROOT_DIR=3D"$(echo "$DIRNAME" | sed -ne 's:/etc/.*::p')=
"
>  [ "$ROOTFS_READ_ONLY" =3D "yes" ] && VOLATILE_ENABLE_CACHE=3Dno
>
>  CFGDIR=3D"${ROOT_DIR}/etc/default/volatiles"
> -TMPROOT=3D"${ROOT_DIR}/var/volatile/tmp"
> +TMPROOT=3D"${ROOT_DIR}/tmp"
>  COREDEF=3D"00_core"
>
>  [ "${VERBOSE}" !=3D "no" ] && echo "Populating volatile Filesystems."
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> index cd8a4be05f..7232a8ef90 100644
> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
> @@ -25,11 +25,10 @@
>  # link the file defined as /var/test will actually be created as
> /tmp/testfile.
>  d root root 1777 /run/lock none
>  d root root 0755 /var/volatile/log none
> -d root root 1777 /var/volatile/tmp none
>  l root root 1777 /var/lock /run/lock
>  l root root 0755 /var/run /run
> -l root root 1777 /var/tmp /var/volatile/tmp
> -l root root 1777 /tmp /var/tmp
> +d root root 1777 /tmp
> +d root root 1777 /var/tmp
>  d root root 0755 /var/lock/subsys none
>  f root root 0664 /var/log/wtmp none
>  f root root 0664 /var/run/utmp none
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb
> b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 4dc477bb8d..7c9d9ca4f1 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -108,9 +108,6 @@ do_install () {
>                 sed -i -e '\@^d root root 0755 /var/volatile/log none$@
> a\l root root 0755 /var/log /var/volatile/log' \
>                         ${D}${sysconfdir}/default/volatiles/00_core
>         fi
> -       if [ "${VOLATILE_TMP_DIR}" !=3D "yes" ]; then
> -               sed -i -e "/\<tmp\>/d"
> ${D}${sysconfdir}/default/volatiles/00_core
> -       fi
>         install -m 0755    ${WORKDIR}/dmesg.sh
> ${D}${sysconfdir}/init.d
>         install -m 0644    ${WORKDIR}/logrotate-dmesg.conf
> ${D}${sysconfdir}/
>
> diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> index c4277221a2..1ba9b836cf 100644
> --- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> +++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
> @@ -1,8 +1,6 @@
>  #This goes hand-in-hand with the base-files of OE-Core. The file must
> -# be sorted before 'systemd.conf' becuase this attempts to create a file
> +# be sorted before 'systemd.conf' because this attempts to create a file
>  # inside /var/log.
>
> -
>  d              /run/lock               1777    -       -       -
>  d              /var/volatile/log               -       -       -       -
> -d              /var/volatile/tmp               1777    -       -
> diff --git a/meta/recipes-core/systemd/systemd_253.1.bb
> b/meta/recipes-core/systemd/systemd_253.1.bb
> index 4a0bb18254..1084040a25 100644
> --- a/meta/recipes-core/systemd/systemd_253.1.bb
> +++ b/meta/recipes-core/systemd/systemd_253.1.bb
> @@ -289,13 +289,6 @@ do_install() {
>                 rm -rf ${D}${localstatedir}/log/journal/remote
>         fi
>
> -       # if the user requests /tmp be on persistent storage (i.e. not
> volatile)
> -       # then don't use a tmpfs for /tmp
> -       if [ "${VOLATILE_TMP_DIR}" !=3D "yes" ]; then
> -               rm -f ${D}${rootlibdir}/systemd/system/tmp.mount
> -               rm -f
> ${D}${rootlibdir}/systemd/system/local-fs.target.wants/tmp.mount
> -       fi
> -
>         install -d ${D}${systemd_system_unitdir}/graphical.target.wants
>         install -d ${D}${systemd_system_unitdir}/multi-user.target.wants
>         install -d ${D}${systemd_system_unitdir}/poweroff.target.wants
> diff --git a/meta/recipes-core/udev/eudev/init
> b/meta/recipes-core/udev/eudev/init
> index 477a525b21..2084de83ae 100644
> --- a/meta/recipes-core/udev/eudev/init
> +++ b/meta/recipes-core/udev/eudev/init
> @@ -79,10 +79,6 @@ case "$1" in
>      }
>      [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
>      [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
> -    # the automount rule for udev needs /tmp directory available, as /tm=
p
> is a symlink
> -    # to /var/tmp which in turn is a symlink to /var/volatile/tmp, we
> need to make sure
> -    # /var/volatile/tmp directory to be available.
> -    mkdir -m 1777 -p /var/volatile/tmp
>
>      # make_extra_nodes
>      kill_udevd > "/dev/null" 2>&1
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> index c97c0377e9..1f873b055e 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
> @@ -2,7 +2,7 @@
>
>  cd ./test
>  SKIP_SLOW_TESTS=3Dyes ./test_script | sed -u -e '/:[[:space:]]ok/s/^/PAS=
S:
> /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP=
:
> /'
> -rm -rf /var/volatile/tmp/*e2fsprogs*
> +rm -rf /tmp/*e2fsprogs*
>  rm -f tmp-*
>  rm -f *.tmp
>  rm -f *.ok
> diff --git
> a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.std=
err.exp-adjust-tmp-paths.patch
> b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.std=
err.exp-adjust-tmp-paths.patch
> deleted file mode 100644
> index e421ac6c80..0000000000
> ---
> a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.std=
err.exp-adjust-tmp-paths.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 24 Jan 2020 17:55:39 +0100
> -Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths
> -
> -In oe-core, /tmp is linked to /var/volatile/tmp and
> -valgrind output changes accordingly
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - none/tests/fdleak_cmsg.stderr.exp | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/none/tests/fdleak_cmsg.stderr.exp
> b/none/tests/fdleak_cmsg.stderr.exp
> -index 6e5a797b9..0ede1ab18 100644
> ---- a/none/tests/fdleak_cmsg.stderr.exp
> -+++ b/none/tests/fdleak_cmsg.stderr.exp
> -@@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null
> -
> -
> - FILE DESCRIPTORS: 6 open (3 std) at exit.
> --Open file descriptor ...: /tmp/data2
> -+Open file descriptor ...: ...
> -    ...
> -
> --Open file descriptor ...: /tmp/data1
> -+Open file descriptor ...: ...
> -    ...
> -
> - Open AF_UNIX socket ...: <unknown>
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
> b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
> index 07e50426e4..4ea173ba80 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.20.0.bb
> @@ -36,7 +36,6 @@ SRC_URI =3D "
> https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
>             file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patc=
h
> \
>             file://0001-memcheck-vgtests-remove-fullpath-after-flags.patc=
h
> \
>             file://s390x_vec_op_t.patch \
> -
>  file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch \
>             file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
>             file://0001-docs-Disable-manual-validation.patch \
>             file://0001-drd-tests-Include-missing-cstdint.patch \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178738):
> https://lists.openembedded.org/g/openembedded-core/message/178738
> Mute This Topic: https://lists.openembedded.org/mt/97667591/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003b862605f7139bd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This patch on the other hand looks fine, but needs to go =
through the test matrix. It=E2=80=99s most likely post mickledore material.=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 17. Mar=
 2023 at 7.02, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">Currently /tmp is a li=
nk to /var/tmp which breaks glib-2.0 ptest<br>
Systemd documentation describes tmpdir usage as follows:<br>
<br>
/tmp/ and /var/tmp/ are two world-writable directories Linux systems provid=
e for temporary files. The former is<br>
typically on tmpfs and thus backed by RAM/swap, and flushed out on each reb=
oot. The latter is typically a proper,<br>
persistent file system, and thus backed by physical storage.<br>
<br>
By default, systemd-tmpfiles will apply a concept of =E2=80=9Cageing=E2=80=
=9D to all files and directories stored in /tmp/ and<br>
/var/tmp/. This means that files that have neither been changed nor read wi=
thin a specific time frame are auto-<br>
matically removed in regular intervals.<br>
(This concept is not new to systemd-tmpfiles btw, it=E2=80=99s inherited fr=
om previous subsystems such as tmpwatch.)<br>
By default files in /tmp/ are cleaned up after 10 days, and those in /var/t=
mp after 30 days.<br>
<br>
This commit tries to align tmpdir to what systemd expects.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ---<br>
=C2=A0meta/files/fs-perms-persistent-log.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 --<br>
=C2=A0meta/files/fs-perms.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 --<br>
=C2=A0.../lib/oeqa/files/buildhistory_filelist1.txt |=C2=A0 1 -<br>
=C2=A0.../lib/oeqa/files/buildhistory_filelist2.txt |=C2=A0 1 -<br>
=C2=A0meta/recipes-core/base-files/base-files/fstab |=C2=A0 1 +<br>
=C2=A0.../base-files/<a href=3D"http://base-files_3.0.14.bb" rel=3D"norefer=
rer" target=3D"_blank">base-files_3.0.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 +--<br>
=C2=A0.../initscripts-1.0/populate-volatile.sh=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
=C2=A0.../initscripts/initscripts-1.0/volatiles=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
5 ++-<br>
=C2=A0.../initscripts/<a href=3D"http://initscripts_1.0.bb" rel=3D"noreferr=
er" target=3D"_blank">initscripts_1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 3 --<br>
=C2=A0.../systemd/systemd/00-create-volatile.conf=C2=A0 =C2=A0|=C2=A0 4 +--=
<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_253.1.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_253.1.bb</a>=C2=A0 =C2=A0 |=C2=A0 7 -=
---<br>
=C2=A0meta/recipes-core/udev/eudev/init=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ---<br>
=C2=A0.../e2fsprogs/e2fsprogs/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0...eak_cmsg.stderr.exp-adjust-tmp-paths.patch | 34 ------------------=
-<br>
=C2=A0.../valgrind/<a href=3D"http://valgrind_3.20.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">valgrind_3.20.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 -<br>
=C2=A016 files changed, 8 insertions(+), 69 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-=
tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index afd9e2f552..dcf6ce99d1 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -90,10 +90,6 @@ ROOT_HOME ??=3D &quot;/home/root&quot;<br>
=C2=A0# If set to boolean false (&#39;no&#39;, &#39;n&#39;, &#39;false&#39;=
, &#39;f&#39;, &#39;0&#39;), /var/log is on persistent storage.<br>
=C2=A0VOLATILE_LOG_DIR ?=3D &quot;yes&quot;<br>
<br>
-# if set to &#39;yes&#39;: /tmp links to /var/tmp which links to /var/vola=
tile/tmp<br>
-# otherwise:=C2=A0 =C2=A0 =C2=A0 =C2=A0/tmp is on persistent storage<br>
-VOLATILE_TMP_DIR ?=3D &quot;yes&quot;<br>
-<br>
=C2=A0BB_RENAMED_VARIABLES[PNBLACKLIST] =3D &quot;SKIP_RECIPE&quot;<br>
=C2=A0BB_RENAMED_VARIABLES[CVE_CHECK_PN_WHITELIST] =3D &quot;CVE_CHECK_SKIP=
_RECIPE&quot;<br>
=C2=A0BB_RENAMED_VARIABLES[CVE_CHECK_WHITELIST] =3D &quot;CVE_CHECK_IGNORE&=
quot;<br>
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-p=
ersistent-log.txt<br>
index 518c1be3c9..326c0ed092 100644<br>
--- a/meta/files/fs-perms-persistent-log.txt<br>
+++ b/meta/files/fs-perms-persistent-log.txt<br>
@@ -47,7 +47,6 @@ ${oldincludedir}=C2=A0 =C2=A0 =C2=A0 0755=C2=A0 =C2=A0 ro=
ot=C2=A0 =C2=A0 root=C2=A0 =C2=A0 true=C2=A0 =C2=A0 0644=C2=A0 =C2=A0 root=
=C2=A0 =C2=A0 root<br>
=C2=A0# Links<br>
=C2=A0${localstatedir}/run=C2=A0 =C2=A0link=C2=A0 =C2=A0 /run<br>
=C2=A0${localstatedir}/lock=C2=A0 link=C2=A0 =C2=A0 /run/lock<br>
-${localstatedir}/tmp=C2=A0 =C2=A0link=C2=A0 =C2=A0 volatile/tmp<br>
<br>
=C2=A0/home=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0755=C2=A0 =C2=A0 root=C2=A0 =C2=A0 root=C2=A0 =
=C2=A0 false - - -<br>
=C2=A0/srv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00755=C2=A0 =C2=A0 root=C2=A0 =C2=A0 root=
=C2=A0 =C2=A0 false - - -<br>
@@ -57,7 +56,6 @@ ${localstatedir}/local=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0755=C2=A0 =C2=A0 root=C2=A0 =C2=A0 root=C2=A0 =C2=A0 =
false - - -<br>
=C2=A0# Special permissions from base-files<br>
=C2=A0# Set 1777<br>
=C2=A0/tmp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A001777=C2=A0 =C2=A0root=C2=A0 =C2=A0 root=
=C2=A0 =C2=A0 false - - -<br>
-${localstatedir}/volatile/tmp=C2=A0 01777=C2=A0 =C2=A0root=C2=A0 =C2=A0 ro=
ot=C2=A0 =C2=A0 false - - -<br>
<br>
=C2=A0# Set 0700<br>
=C2=A0${ROOT_HOME}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00700=C2=A0 =C2=A0 root=C2=A0 =C2=A0 root=C2=A0 =C2=A0 false - =
- -<br>
diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt<br>
index daa4aed840..ed59311035 100644<br>
--- a/meta/files/fs-perms.txt<br>
+++ b/meta/files/fs-perms.txt<br>
@@ -48,7 +48,6 @@ ${oldincludedir}=C2=A0 =C2=A0 =C2=A0 0755=C2=A0 =C2=A0 ro=
ot=C2=A0 =C2=A0 root=C2=A0 =C2=A0 true=C2=A0 =C2=A0 0644=C2=A0 =C2=A0 root=
=C2=A0 =C2=A0 root<br>
=C2=A0${localstatedir}/run=C2=A0 =C2=A0link=C2=A0 =C2=A0 /run<br>
=C2=A0${localstatedir}/log=C2=A0 =C2=A0link=C2=A0 =C2=A0 volatile/log<br>
=C2=A0${localstatedir}/lock=C2=A0 link=C2=A0 =C2=A0 /run/lock<br>
-${localstatedir}/tmp=C2=A0 =C2=A0link=C2=A0 =C2=A0 volatile/tmp<br>
<br>
=C2=A0/home=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0755=C2=A0 =C2=A0 root=C2=A0 =C2=A0 root=C2=A0 =
=C2=A0 false - - -<br>
=C2=A0/srv=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00755=C2=A0 =C2=A0 root=C2=A0 =C2=A0 root=
=C2=A0 =C2=A0 false - - -<br>
@@ -58,7 +57,6 @@ ${localstatedir}/local=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0755=C2=A0 =C2=A0 root=C2=A0 =C2=A0 root=C2=A0 =C2=A0 =
false - - -<br>
=C2=A0# Special permissions from base-files<br>
=C2=A0# Set 1777<br>
=C2=A0/tmp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A001777=C2=A0 =C2=A0root=C2=A0 =C2=A0 root=
=C2=A0 =C2=A0 false - - -<br>
-${localstatedir}/volatile/tmp=C2=A0 01777=C2=A0 =C2=A0root=C2=A0 =C2=A0 ro=
ot=C2=A0 =C2=A0 false - - -<br>
<br>
=C2=A0# Set 0700<br>
=C2=A0${ROOT_HOME}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00700=C2=A0 =C2=A0 root=C2=A0 =C2=A0 root=C2=A0 =C2=A0 false - =
- -<br>
diff --git a/meta/lib/oeqa/files/buildhistory_filelist1.txt b/meta/lib/oeqa=
/files/buildhistory_filelist1.txt<br>
index 8d882895ad..ec50017383 100644<br>
--- a/meta/lib/oeqa/files/buildhistory_filelist1.txt<br>
+++ b/meta/lib/oeqa/files/buildhistory_filelist1.txt<br>
@@ -9210,5 +9210,4 @@ lrwxrwxrwx root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012 ./var/log -&gt; volatile=
/log<br>
=C2=A0lrwxrwxrwx root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6 ./var/run -&gt; ../run<br>
=C2=A0drwxr-xr-x root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A04096 ./var/spool<br>
=C2=A0drwxrwxr-x root=C2=A0 =C2=A0 =C2=A0 =C2=A0mail=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A04096 ./var/spool/mail<br>
-lrwxrwxrwx root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A012 ./var/tmp -&gt; volatile/tmp<br>
=C2=A0drwxr-xr-x root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A04096 ./var/volatile<br>
diff --git a/meta/lib/oeqa/files/buildhistory_filelist2.txt b/meta/lib/oeqa=
/files/buildhistory_filelist2.txt<br>
index ac6307060d..cedec51c38 100644<br>
--- a/meta/lib/oeqa/files/buildhistory_filelist2.txt<br>
+++ b/meta/lib/oeqa/files/buildhistory_filelist2.txt<br>
@@ -9213,5 +9213,4 @@ lrwxrwxrwx root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012 ./var/log -&gt; volatile=
/log<br>
=C2=A0lrwxrwxrwx root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6 ./var/run -&gt; ../run<br>
=C2=A0drwxr-xr-x root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A04096 ./var/spool<br>
=C2=A0drwxrwxr-x root=C2=A0 =C2=A0 =C2=A0 =C2=A0mail=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A04096 ./var/spool/mail<br>
-lrwxrwxrwx root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A012 ./var/tmp -&gt; volatile/tmp<br>
=C2=A0drwxr-xr-x root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A04096 ./var/volatile<br>
diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-c=
ore/base-files/base-files/fstab<br>
index 70e400f567..7064573130 100644<br>
--- a/meta/recipes-core/base-files/base-files/fstab<br>
+++ b/meta/recipes-core/base-files/base-files/fstab<br>
@@ -5,6 +5,7 @@ proc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/proc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 proc=C2=
=A0 =C2=A0 =C2=A0 =C2=A0defaults=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0=C2=A0 0<br>
=C2=A0devpts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/pts=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0devpts=C2=A0 =C2=A0 =C2=A0m=
ode=3D0620,ptmxmode=3D0666,gid=3D5=C2=A0 =C2=A0 =C2=A0 0=C2=A0 0<br>
=C2=A0tmpfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /run=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs=C2=A0 =C2=
=A0 =C2=A0 mode=3D0755,nodev,nosuid,strictatime 0=C2=A0 0<br>
=C2=A0tmpfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /var/vol=
atile=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfs=C2=A0 =C2=A0 =C2=A0 defaults=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 0<br>
+tmpfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /tmp=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfs=C2=A0 =C2=A0 =
=C2=A0 defaults=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 0<b=
r>
<br>
=C2=A0# uncomment this if your device has a SD/MMC/Transflash slot<br>
=C2=A0#/dev/mmcblk0p1=C2=A0 =C2=A0 =C2=A0 =C2=A0/media/card=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 auto=C2=A0 =C2=A0 =C2=A0 =C2=A0defaults,sync,noauto=C2=
=A0 0=C2=A0 0<br>
diff --git a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.=
14.bb" rel=3D"noreferrer" target=3D"_blank">base-files_3.0.14.bb</a> b/meta=
/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">base-files_3.0.14.bb</a><br>
index ff83567bd9..c2ecea0a25 100644<br>
--- a/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
rel=3D"noreferrer" target=3D"_blank">base-files_3.0.14.bb</a><br>
+++ b/meta/recipes-core/base-files/<a href=3D"http://base-files_3.0.14.bb" =
rel=3D"noreferrer" target=3D"_blank">base-files_3.0.14.bb</a><br>
@@ -29,7 +29,7 @@ S =3D &quot;${WORKDIR}&quot;<br>
=C2=A0INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
<br>
=C2=A0docdir:append =3D &quot;/${P}&quot;<br>
-dirs1777 =3D &quot;/tmp ${localstatedir}/volatile/tmp&quot;<br>
+dirs1777 =3D &quot;/tmp /var/tmp&quot;<br>
=C2=A0dirs2775 =3D &quot;&quot;<br>
=C2=A0dirs555 =3D &quot;/sys /proc&quot;<br>
=C2=A0dirs755 =3D &quot;/boot /dev ${base_bindir} ${base_sbindir} ${base_li=
bdir} \<br>
@@ -53,7 +53,7 @@ dirs755-lsb =3D &quot;/srv=C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${prefix}/lib/local=
e&quot;<br>
=C2=A0dirs2775-lsb =3D &quot;/var/mail&quot;<br>
<br>
-volatiles =3D &quot;${@&#39;log&#39; if oe.types.boolean(&#39;${VOLATILE_L=
OG_DIR}&#39;) else &#39;&#39;} tmp&quot;<br>
+volatiles =3D &quot;${@&#39;log&#39; if oe.types.boolean(&#39;${VOLATILE_L=
OG_DIR}&#39;) else &#39;&#39;}&quot;<br>
=C2=A0conffiles =3D &quot;${sysconfdir}/debian_version ${sysconfdir}/host.c=
onf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/issue /${sys=
confdir}/<a href=3D"http://issue.net" rel=3D"noreferrer" target=3D"_blank">=
issue.net</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/nsswitch.con=
f ${sysconfdir}/profile \<br>
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatil=
e.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh<b=
r>
index bc630e871c..ecfb6fdc2b 100755<br>
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh<br=
>
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh<br=
>
@@ -23,7 +23,7 @@ ROOT_DIR=3D&quot;$(echo &quot;$DIRNAME&quot; | sed -ne &#=
39;s:/etc/.*::p&#39;)&quot;<br>
=C2=A0[ &quot;$ROOTFS_READ_ONLY&quot; =3D &quot;yes&quot; ] &amp;&amp; VOLA=
TILE_ENABLE_CACHE=3Dno<br>
<br>
=C2=A0CFGDIR=3D&quot;${ROOT_DIR}/etc/default/volatiles&quot;<br>
-TMPROOT=3D&quot;${ROOT_DIR}/var/volatile/tmp&quot;<br>
+TMPROOT=3D&quot;${ROOT_DIR}/tmp&quot;<br>
=C2=A0COREDEF=3D&quot;00_core&quot;<br>
<br>
=C2=A0[ &quot;${VERBOSE}&quot; !=3D &quot;no&quot; ] &amp;&amp; echo &quot;=
Populating volatile Filesystems.&quot;<br>
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta=
/recipes-core/initscripts/initscripts-1.0/volatiles<br>
index cd8a4be05f..7232a8ef90 100644<br>
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles<br>
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles<br>
@@ -25,11 +25,10 @@<br>
=C2=A0# link the file defined as /var/test will actually be created as /tmp=
/testfile.<br>
=C2=A0d root root 1777 /run/lock none<br>
=C2=A0d root root 0755 /var/volatile/log none<br>
-d root root 1777 /var/volatile/tmp none<br>
=C2=A0l root root 1777 /var/lock /run/lock<br>
=C2=A0l root root 0755 /var/run /run<br>
-l root root 1777 /var/tmp /var/volatile/tmp<br>
-l root root 1777 /tmp /var/tmp<br>
+d root root 1777 /tmp<br>
+d root root 1777 /var/tmp<br>
=C2=A0d root root 0755 /var/lock/subsys none<br>
=C2=A0f root root 0664 /var/log/wtmp none<br>
=C2=A0f root root 0664 /var/run/utmp none<br>
diff --git a/meta/recipes-core/initscripts/<a href=3D"http://initscripts_1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">initscripts_1.0.bb</a> b/meta/re=
cipes-core/initscripts/<a href=3D"http://initscripts_1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">initscripts_1.0.bb</a><br>
index 4dc477bb8d..7c9d9ca4f1 100644<br>
--- a/meta/recipes-core/initscripts/<a href=3D"http://initscripts_1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">initscripts_1.0.bb</a><br>
+++ b/meta/recipes-core/initscripts/<a href=3D"http://initscripts_1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">initscripts_1.0.bb</a><br>
@@ -108,9 +108,6 @@ do_install () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;\@^d=
 root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/v=
olatile/log&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${D}${sysconfdir}/default/volatiles/00_core<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${VOLATILE_TMP_DIR}&quot; !=3D &quot=
;yes&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;/\&=
lt;tmp\&gt;/d&quot; ${D}${sysconfdir}/default/volatiles/00_core<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755=C2=A0 =C2=A0 ${WORKDIR}/dmesg.s=
h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${sysconfdir}/init.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644=C2=A0 =C2=A0 ${WORKDIR}/logrota=
te-dmesg.conf ${D}${sysconfdir}/<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/me=
ta/recipes-core/systemd/systemd/00-create-volatile.conf<br>
index c4277221a2..1ba9b836cf 100644<br>
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf<br>
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf<br>
@@ -1,8 +1,6 @@<br>
=C2=A0#This goes hand-in-hand with the base-files of OE-Core. The file must=
<br>
-# be sorted before &#39;systemd.conf&#39; becuase this attempts to create =
a file<br>
+# be sorted before &#39;systemd.conf&#39; because this attempts to create =
a file<br>
=C2=A0# inside /var/log.<br>
<br>
-<br>
=C2=A0d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /run/lock=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01777=C2=A0 =C2=A0 -=C2=A0 =C2=
=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
=C2=A0d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /var/volatile/log=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0-<br>
-d=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /var/volatile/tmp=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01777=C2=A0 =C2=A0 -=C2=A0 =
=C2=A0 =C2=A0 =C2=A0-<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_253.1.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_253.1.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_253.1.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_253.1.bb</a><br>
index 4a0bb18254..1084040a25 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_253.1.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_253.1.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_253.1.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_253.1.bb</a><br>
@@ -289,13 +289,6 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${D}${locals=
tatedir}/log/journal/remote<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# if the user requests /tmp be on persistent st=
orage (i.e. not volatile)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# then don&#39;t use a tmpfs for /tmp<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${VOLATILE_TMP_DIR}&quot; !=3D &quot=
;yes&quot; ]; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${rootlib=
dir}/systemd/system/tmp.mount<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${rootlib=
dir}/systemd/system/local-fs.target.wants/tmp.mount<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}/graphi=
cal.target.wants<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}/multi-=
user.target.wants<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${systemd_system_unitdir}/powero=
ff.target.wants<br>
diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eud=
ev/init<br>
index 477a525b21..2084de83ae 100644<br>
--- a/meta/recipes-core/udev/eudev/init<br>
+++ b/meta/recipes-core/udev/eudev/init<br>
@@ -79,10 +79,6 @@ case &quot;$1&quot; in<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0[ -e /dev/pts ] || mkdir -m 0755 /dev/pts<br>
=C2=A0 =C2=A0 =C2=A0[ -e /dev/shm ] || mkdir -m 1777 /dev/shm<br>
-=C2=A0 =C2=A0 # the automount rule for udev needs /tmp directory available=
, as /tmp is a symlink<br>
-=C2=A0 =C2=A0 # to /var/tmp which in turn is a symlink to /var/volatile/tm=
p, we need to make sure<br>
-=C2=A0 =C2=A0 # /var/volatile/tmp directory to be available.<br>
-=C2=A0 =C2=A0 mkdir -m 1777 -p /var/volatile/tmp<br>
<br>
=C2=A0 =C2=A0 =C2=A0# make_extra_nodes<br>
=C2=A0 =C2=A0 =C2=A0kill_udevd &gt; &quot;/dev/null&quot; 2&gt;&amp;1<br>
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/rec=
ipes-devtools/e2fsprogs/e2fsprogs/run-ptest<br>
index c97c0377e9..1f873b055e 100644<br>
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest<br>
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest<br>
@@ -2,7 +2,7 @@<br>
<br>
=C2=A0cd ./test<br>
=C2=A0SKIP_SLOW_TESTS=3Dyes ./test_script | sed -u -e &#39;/:[[:space:]]ok/=
s/^/PASS: /&#39; -e &#39;/:[[:space:]]failed/s/^/FAIL: /&#39; -e &#39;/:[[:=
space:]]skipped/s/^/SKIP: /&#39;<br>
-rm -rf /var/volatile/tmp/*e2fsprogs*<br>
+rm -rf /tmp/*e2fsprogs*<br>
=C2=A0rm -f tmp-*<br>
=C2=A0rm -f *.tmp<br>
=C2=A0rm -f *.ok<br>
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak=
_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/va=
lgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch<br>
deleted file mode 100644<br>
index e421ac6c80..0000000000<br>
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.s=
tderr.exp-adjust-tmp-paths.patch<br>
+++ /dev/null<br>
@@ -1,34 +0,0 @@<br>
-From f405297d3382cd98391d02f397e2387da1f42879 Mon Sep 17 00:00:00 2001<br>
-From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
-Date: Fri, 24 Jan 2020 17:55:39 +0100<br>
-Subject: [PATCH] none/tests/fdleak_cmsg.stderr.exp: adjust /tmp paths<br>
-<br>
-In oe-core, /tmp is linked to /var/volatile/tmp and<br>
-valgrind output changes accordingly<br>
-<br>
-Upstream-Status: Inappropriate [oe-core specific]<br>
-Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
----<br>
- none/tests/fdleak_cmsg.stderr.exp | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/none/tests/fdleak_cmsg.stderr.exp b/none/tests/fdleak_cmsg.st=
derr.exp<br>
-index 6e5a797b9..0ede1ab18 100644<br>
---- a/none/tests/fdleak_cmsg.stderr.exp<br>
-+++ b/none/tests/fdleak_cmsg.stderr.exp<br>
-@@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null<br>
- <br>
- <br>
- FILE DESCRIPTORS: 6 open (3 std) at exit.<br>
--Open file descriptor ...: /tmp/data2<br>
-+Open file descriptor ...: ...<br>
-=C2=A0 =C2=A0 ...<br>
- <br>
--Open file descriptor ...: /tmp/data1<br>
-+Open file descriptor ...: ...<br>
-=C2=A0 =C2=A0 ...<br>
- <br>
- Open AF_UNIX socket ...: &lt;unknown&gt;<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.20=
.0.bb" rel=3D"noreferrer" target=3D"_blank">valgrind_3.20.0.bb</a> b/meta/r=
ecipes-devtools/valgrind/<a href=3D"http://valgrind_3.20.0.bb" rel=3D"noref=
errer" target=3D"_blank">valgrind_3.20.0.bb</a><br>
index 07e50426e4..4ea173ba80 100644<br>
--- a/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">valgrind_3.20.0.bb</a><br>
+++ b/meta/recipes-devtools/valgrind/<a href=3D"http://valgrind_3.20.0.bb" =
rel=3D"noreferrer" target=3D"_blank">valgrind_3.20.0.bb</a><br>
@@ -36,7 +36,6 @@ SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/v=
algrind/valgrind-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">ht=
tps://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-valgrind-filter_xml_f=
rames-do-not-filter-usr.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-memcheck-vgtests-remo=
ve-fullpath-after-flags.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://s390x_vec_op_t.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-none-tests-fdleak_cms=
g.stderr.exp-adjust-tmp-paths.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-memcheck-tests-Fix-ti=
merfd-syscall-test.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-docs-Disable-manual-v=
alidation.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-drd-tests-Include-mis=
sing-cstdint.patch \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178738): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178738" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178738</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97667591/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97667591/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000003b862605f7139bd7--

