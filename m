Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B943EC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:38:31 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.16432.1741876704480484341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ctQ+566Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8fce04655so9824146d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 07:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741876703; x=1742481503; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+pd4ZTfB3DVJWc56TqyESIgO8YKJ6xRJjvzeJNU06Gc=;
        b=ctQ+566ZIfg/kCFlU1kJ7ge5x2EGfBEmYziDull41z8eaNhRHYWuBESR0HG91eMjwW
         lEWyhjG36OtQaPEgDjLAlAno4LVAf3Sww0utLtqYcqS8vWvjL+ve8y26E2mf6WubFXZZ
         bmnc93IpgAO/QpdTiSwoVdVAc6/HDHoCPEjXxWl/bq9nI6txofCMoWxa3EHdZWgKkc6r
         wYAhXDSBMJlqWr8VL50mNB6067d75gwJDg6W4H0sBU49sgPQulkqH4HxrOWzzJQGkZ9a
         MZ5iCMNDWFueJ4UYqzQDeiVuGs9Ruy4150GtM+JMJeo1UCwFbmHly2BHj4oyfGFEDW+4
         QYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741876703; x=1742481503;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pd4ZTfB3DVJWc56TqyESIgO8YKJ6xRJjvzeJNU06Gc=;
        b=I2Oh6kzvwjOdm1lopVwKBmlUXiTpBv9J+hsQIsnsRuxImREFCRjJOdzHnzh3WfDAYR
         iotzMVqetwVs4bgwh9oDxdBxKyQ8fybth5rr7nAAaWJPR5llxCepk/RWc4B7EUIiwbYZ
         QImHgpjndhUrS6wN6aYrC6epUkRPl4ieX9Mfaljg9XO/3QiEhelPBseV9nOD3/opOXW7
         VbOHRu/RKRXYmlmlzH/DpxktURVwaZw6BMck7RiwST4XQWDNFouKAfbb8cZJR90W9Cty
         YS/7xf56mU2h81DxFS4s7BR6OvypOpr/ioQilinisyaBpsAxLfjl2xp+e1qltXMAPDSD
         ABQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9g4eYEdrmeSYrt4qxhrtcfSGj5lghzm1+g/bZt+m/Mf0jNwrlqR7etRi8CNx6fu4WAtzJSlQ/eceBy/g3NM6YsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzb47049vvby6gbKsf4VgerYibVNVt8dqn9s9r2O6wzzCbj4Gj8
	IfYXGtxnLl2bDYYcg/mAIEgP7eYg1uT2COk6LdLC6t7hAbn6Rd7krAkPKRjTqzz51oXsFjokh4H
	16y11gsRH9687dsA8VZB2NGgGINU=
X-Gm-Gg: ASbGnctiHJpUQ5Cm4UuEVhwfZ1h1l4p1pt4c0eCqwYPs9tZs8OcVqbh7ajpvKOZhqSz
	9nsqdOaGurhxQOEcY58wYyfIoo/uUdPmzyAlIFDTMYNvG+3rQ5GMhwBRFHDoy5Z8Lrh2Q/Gt/Ia
	AERDbFTu7dItH0PWSFKNXbk692gN9tDaKSidCml8CJmTXkArK91Uni26TgpCKt
X-Google-Smtp-Source: AGHT+IEdjSopOXO9mkUuXvs5ZfmCTT0os8VhGtCRSs6lSRtFYJStyUZE9cKb+yrAxm9fPUNBB0Rbxx+/fWH7IUybJfg=
X-Received: by 2002:ad4:5bab:0:b0:6e8:fee2:aae7 with SMTP id
 6a1803df08f44-6ea3a6a4d35mr183085706d6.39.1741876703220; Thu, 13 Mar 2025
 07:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250312201316.1060199-2-rs@ti.com> <20250312201316.1060199-4-rs@ti.com>
In-Reply-To: <20250312201316.1060199-4-rs@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Mar 2025 15:38:11 +0100
X-Gm-Features: AQ5f1JqBE4rJx7F6GASv5S_zkrVZtMj_Xoxt7OHhGQE0PYrnAFRyHFj721k744U
Message-ID: <CANNYZj9TjaeQH8rNk5Ofio447QRHJt4ytSaKVG=5FzxRpDeYuA@mail.gmail.com>
Subject: Re: [oe-core][scarthgap][RFC 2/2] weston-init: convert to virtual-emptty-conf
To: rs@ti.com
Cc: otavio.salvador@ossystems.com.br, richard.purdie@linuxfoundation.org, 
	ross.burton@arm.com, alex@linutronix.de, otavio@ossystems.com.br, 
	kexin.hao@windriver.com, afd@ti.com, detheridge@ti.com, denis@denix.org, 
	reatmon@ti.com, openembedded-core@lists.openembedded.org, vijayp@ti.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 14:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212785

If you rebase this on master, I can spin that on the autobuilder to
see what breaks, if anything. We're in a feature freeze now, so any
formal proposal has to wait until after that.

Alex

On Wed, 12 Mar 2025 at 21:15, <rs@ti.com> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> Convert this script package into a simple config for emptty using the
> same weston user but leveraging the nopasswdlogin session provided by
> emptty. Runtime provide virtual-emptty-conf as we need to set parameters
> for the default session.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta/recipes-graphics/wayland/weston-init.bb  | 59 +++-----------
>  .../wayland/weston-init/emptty.conf           | 77 +++++++++++++++++++
>  .../recipes-graphics/wayland/weston-init/init | 54 -------------
>  .../wayland/weston-init/weston-autologin      | 11 ---
>  .../wayland/weston-init/weston-socket.sh      | 20 -----
>  .../wayland/weston-init/weston-start          | 71 -----------------
>  .../wayland/weston-init/weston.env            |  0
>  .../wayland/weston-init/weston.service        | 71 -----------------
>  .../wayland/weston-init/weston.socket         | 14 ----
>  9 files changed, 88 insertions(+), 289 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/weston-init/emptty.conf
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/init
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston-autologin
>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh
>  delete mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.env
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service
>  delete mode 100644 meta/recipes-graphics/wayland/weston-init/weston.socket
>
> diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
> index 34b7eb78d2..0d2e467177 100644
> --- a/meta/recipes-graphics/wayland/weston-init.bb
> +++ b/meta/recipes-graphics/wayland/weston-init.bb
> @@ -4,14 +4,10 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -SRC_URI = "file://init \
> -           file://weston.env \
> +SRC_URI = "\
>             file://weston.ini \
> -           file://weston.service \
> -           file://weston.socket \
> -           file://weston-socket.sh \
> -           file://weston-autologin \
> -           file://weston-start"
> +           file://emptty.conf \
> +"
>
>  S = "${WORKDIR}"
>
> @@ -27,32 +23,8 @@ DEFAULTBACKEND ??= ""
>  DEFAULTBACKEND:qemuall ?= "drm"
>
>  do_install() {
> -       # Install weston-start script
> -       if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
> -               install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
> -               sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
> -               sed -i 's,@LOCALSTATEDIR@,${localstatedir},g' ${D}${bindir}/weston-start
> -               install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
> -               sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}/${sysconfdir}/init.d/weston
> -       fi
> -
> -       # Install Weston systemd service
> -       if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -               install -D -p -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
> -               install -D -p -m0644 ${WORKDIR}/weston.socket ${D}${systemd_system_unitdir}/weston.socket
> -               install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
> -               sed -i -e s:/etc:${sysconfdir}:g \
> -                       -e s:/usr/bin:${bindir}:g \
> -                       -e s:/var:${localstatedir}:g \
> -                       ${D}${systemd_system_unitdir}/weston.service
> -       fi
> -
> -       if [ "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}" ]; then
> -               install -D -p -m0644 ${WORKDIR}/weston-autologin ${D}${sysconfdir}/pam.d/weston-autologin
> -       fi
> -
>         install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
> -       install -Dm644 ${WORKDIR}/weston.env ${D}${sysconfdir}/default/weston
> +       install -D -p -m0644 ${WORKDIR}/emptty.conf ${D}${sysconfdir}/emptty/conf
>
>         if [ -n "${DEFAULTBACKEND}" ]; then
>                 sed -i -e "/^\[core\]/a backend=${DEFAULTBACKEND}-backend.so" ${D}${sysconfdir}/xdg/weston/weston.ini
> @@ -73,9 +45,7 @@ do_install() {
>         install -dm 755 -o weston -g weston ${D}/home/weston
>  }
>
> -INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
> -
> -inherit update-rc.d systemd useradd
> +inherit useradd
>
>  USERADD_PACKAGES = "${PN}"
>
> @@ -83,24 +53,17 @@ USERADD_PACKAGES = "${PN}"
>  #
>  require ${THISDIR}/required-distro-features.inc
>
> -RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
> -
> -INITSCRIPT_NAME = "weston"
> -INITSCRIPT_PARAMS = "start 9 5 2 . stop 20 0 1 6 ."
> +RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)} emptty"
>
>  FILES:${PN} += "\
>      ${sysconfdir}/xdg/weston/weston.ini \
> -    ${sysconfdir}/profile.d/weston-socket.sh \
> -    ${systemd_system_unitdir}/weston.service \
> -    ${systemd_system_unitdir}/weston.socket \
> -    ${sysconfdir}/default/weston \
> -    ${sysconfdir}/pam.d/ \
> +    ${sysconfdir}/emptty/conf \
>      /home/weston \
>      "
>
> -CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
> +CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/emptty/conf"
> +RPROVIDES:${PN}:append = " virtual-emptty-conf"
>
> -SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
> -USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,wayland weston"
> -GROUPADD_PARAM:${PN} = "-r wayland; -r render"
> +USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render,nopasswdlogin weston"
> +GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r nopasswdlogin"
>
> diff --git a/meta/recipes-graphics/wayland/weston-init/emptty.conf b/meta/recipes-graphics/wayland/weston-init/emptty.conf
> new file mode 100644
> index 0000000000..7520bc0b9c
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston-init/emptty.conf
> @@ -0,0 +1,77 @@
> +# TTY, where emptty will start.
> +TTY_NUMBER=7
> +
> +# Enables switching to defined TTY number.
> +SWITCH_TTY=true
> +
> +# Enables printing of /etc/issue in daemon mode.
> +PRINT_ISSUE=true
> +
> +# Enables printing of default motd, /etc/emptty/motd or /etc/emptty/motd-gen.sh.
> +PRINT_MOTD=true
> +
> +# Preselected user, if AUTOLOGIN is enabled, this user is logged in.
> +DEFAULT_USER=weston
> +
> +# Enables Autologin, if DEFAULT_USER is defined and part of nopasswdlogin group. Possible values are "true" or "false".
> +AUTOLOGIN=true
> +
> +# The default session used, if Autologin is enabled. If session is not found in list of session, it proceeds to manual selection.
> +AUTOLOGIN_SESSION=Weston
> +
> +# If Autologin is enabled and session does not start correctly, the number of retries in short period is kept to eventually stop the infinite loop of restarts. -1 is for infinite retries, 0 is for no retry.
> +AUTOLOGIN_MAX_RETRY=0
> +
> +# Default LANG, if user does not have set own in init script.
> +#LANG=en_US.UTF-8
> +
> +# Starts desktop with calling "dbus-launch".
> +DBUS_LAUNCH=true
> +
> +# Starts Xorg desktop with calling "~/.xinitrc" script, if is true, file exists and selected WM/DE is Xorg session, it overrides DBUS_LAUNCH.
> +XINITRC_LAUNCH=false
> +
> +# Prints available WM/DE each on new line instead of printing on single line.
> +VERTICAL_SELECTION=false
> +
> +# Defines the way, how is logging handled. Possible values are "rotate", "appending" or "disabled".
> +#LOGGING=rotate
> +
> +# Overrides path of log file
> +#LOGGING_FILE=/var/log/emptty/[TTY_NUMBER].log
> +
> +# Arguments passed to Xorg server.
> +#XORG_ARGS=
> +
> +# Allows to use dynamic motd script to generate custom MOTD.
> +#DYNAMIC_MOTD=false
> +
> +# Allows to override default path to dynamic motd.
> +#DYNAMIC_MOTD_PATH=/etc/emptty/motd-gen.sh
> +
> +# Allows to override default path to static motd.
> +#MOTD_PATH=/etc/emptty/motd
> +
> +# Foreground color, available only in daemon mode.
> +#FG_COLOR=LIGHT_BLACK
> +
> +# Background color, available only in daemon mode.
> +#BG_COLOR=BLACK
> +
> +# Enables numlock in daemon mode. Possible values are "true" or "false".
> +#ENABLE_NUMLOCK=false
> +
> +# Defines the way, how is logging of session errors handled. Possible values are "rotate", "appending" or "disabled".
> +SESSION_ERROR_LOGGING=rotate
> +
> +# Overrides path of session errors log file
> +#SESSION_ERROR_LOGGING_FILE=/var/log/emptty/session-errors.[TTY_NUMBER].log
> +
> +# If set true, it will not use `.emptty-xauth` file, but the standard `~/.Xauthority` file. This allows to handle xauth issues.
> +#DEFAULT_XAUTHORITY=false
> +
> +#If set true, Xorg will be started as rootless, if system allows and emptty is running in daemon mode.
> +#ROOTLESS_XORG=false
> +
> +#If set true, environmental groups are printed to differ Xorg/Wayland/Custom/UserCustom desktops.
> +IDENTIFY_ENVS=false
> diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
> deleted file mode 100644
> index a5c54e001e..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/init
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -#!/bin/sh
> -#
> -### BEGIN INIT INFO
> -# Provides: weston
> -# Required-Start: $local_fs $remote_fs
> -# Required-Stop: $local_fs $remote_fs
> -# Default-Start:     2 3 4 5
> -# Default-Stop:      0 1 6
> -### END INIT INFO
> -
> -if test -e /etc/default/weston ; then
> -        . /etc/default/weston
> -fi
> -
> -killproc() {
> -        pid=`/bin/pidof $1`
> -        [ "$pid" != "" ] && kill $pid
> -}
> -
> -read CMDLINE < /proc/cmdline
> -for x in $CMDLINE; do
> -        case $x in
> -        weston=false)
> -               echo "Weston disabled"
> -               exit 0;
> -                ;;
> -        esac
> -done
> -
> -case "$1" in
> -  start)
> -        . /etc/profile
> -             export HOME=ROOTHOME
> -
> -        WESTON_USER=weston weston-start $OPTARGS &
> -  ;;
> -
> -  stop)
> -        echo "Stopping Weston"
> -        killproc weston
> -  ;;
> -
> -  restart)
> -       $0 stop
> -        sleep 1
> -        $0 start
> -  ;;
> -
> -  *)
> -        echo "usage: $0 { start | stop | restart }"
> -  ;;
> -esac
> -
> -exit 0
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-autologin b/meta/recipes-graphics/wayland/weston-init/weston-autologin
> deleted file mode 100644
> index f6e6d106de..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/weston-autologin
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -auth      required  pam_nologin.so
> -auth      required  pam_unix.so     try_first_pass nullok
> -
> -account   required  pam_nologin.so
> -account   required  pam_unix.so
> -
> -session   required  pam_env.so
> -session   required  pam_unix.so
> --session  optional  pam_systemd.so type=wayland class=user desktop=weston
> --session  optional  pam_loginuid.so
> -
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh b/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
> deleted file mode 100755
> index 86389d63a3..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/weston-socket.sh
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -
> -# set weston variables for use with global weston socket
> -global_socket="/run/wayland-0"
> -if [ -e "$global_socket" ]; then
> -       weston_group=$(stat -c "%G" "$global_socket")
> -       if [ "$(id -u)" = "0" ]; then
> -               export WAYLAND_DISPLAY="$global_socket"
> -       else
> -               case "$(groups "$USER")" in
> -                       *"$weston_group"*)
> -                               export WAYLAND_DISPLAY="$global_socket"
> -                               ;;
> -                       *)
> -                               ;;
> -               esac
> -       fi
> -       unset weston_group
> -fi
> -unset global_socket
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
> deleted file mode 100755
> index 01670cd4f5..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/weston-start
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -#!/bin/sh
> -# Copyright (C) 2016 O.S. Systems Software LTDA.
> -# Copyright (C) 2016 Freescale Semiconductor
> -
> -export PATH="/sbin:/usr/sbin:/bin:/usr/bin"
> -
> -usage() {
> -       cat <<EOF
> -       $0 [<weston options>]
> -EOF
> -}
> -
> -## Module support
> -modules_dir=@DATADIR@/weston-start
> -
> -# Add weston extra argument
> -add_weston_argument() {
> -       weston_args="$weston_args $1"
> -}
> -
> -## Add module to --modules argument
> -add_weston_module() {
> -       if [[ "x${weston_modules}" == "x" ]]; then
> -               weston_modules="--modules "
> -       fi;
> -       weston_modules+="${1},"
> -}
> -
> -if [ -n "$WAYLAND_DISPLAY" ]; then
> -       echo "ERROR: A Wayland compositor is already running, nested Weston instance is not supported yet."
> -       exit 1
> -fi
> -
> -if [ -n "$WESTON_USER" ]; then
> -       if [ -z "$WESTON_GROUP" ]; then
> -               # no explicit WESTON_GROUP given, therefore use WESTON_USER
> -               export WESTON_GROUP="${WESTON_USER}"
> -       fi
> -fi
> -
> -weston_args=$*
> -
> -# Load and run modules
> -if [ -d "$modules_dir" ]; then
> -       for m in "$modules_dir"/*; do
> -               # Skip backup files
> -               if [ "`echo $m | sed -e 's/\~$//'`" != "$m" ]; then
> -                       continue
> -               fi
> -
> -               # process module
> -               . $m
> -               if [[ x"{$weston_modules}" != "x" ]]; then
> -                       add_weston_argument "${weston_modules}"
> -               fi;
> -       done
> -fi
> -
> -if test -z "$XDG_RUNTIME_DIR"; then
> -       export XDG_RUNTIME_DIR=/run/user/`id -u ${WESTON_USER}`
> -       if ! test -d "$XDG_RUNTIME_DIR"; then
> -               mkdir --parents $XDG_RUNTIME_DIR
> -               chmod 0700 $XDG_RUNTIME_DIR
> -       fi
> -       if [ -n "$WESTON_USER" ]
> -       then
> -               chown $WESTON_USER:$WESTON_GROUP $XDG_RUNTIME_DIR
> -       fi
> -fi
> -
> -su -c "XDG_RUNTIME_DIR=/run/user/`id -u ${WESTON_USER}` weston $weston_args --log=/tmp/weston.log" $WESTON_USER
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.env b/meta/recipes-graphics/wayland/weston-init/weston.env
> deleted file mode 100644
> index e69de29bb2..0000000000
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.service b/meta/recipes-graphics/wayland/weston-init/weston.service
> deleted file mode 100644
> index 80745998ed..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/weston.service
> +++ /dev/null
> @@ -1,71 +0,0 @@
> -# This is a system unit for launching Weston with auto-login as the
> -# user configured here.
> -#
> -# Weston must be built with systemd support, and your weston.ini must load
> -# the plugin systemd-notify.so.
> -[Unit]
> -Description=Weston, a Wayland compositor, as a system service
> -Documentation=man:weston(1) man:weston.ini(5)
> -Documentation=http://wayland.freedesktop.org/
> -
> -# Make sure we are started after logins are permitted.
> -Requires=systemd-user-sessions.service
> -After=systemd-user-sessions.service
> -
> -# If Plymouth is used, we want to start when it is on its way out.
> -After=plymouth-quit-wait.service
> -
> -# D-Bus is necessary for contacting logind. Logind is required.
> -Wants=dbus.socket
> -After=dbus.socket
> -
> -# Ensure the socket is present
> -Requires=weston.socket
> -
> -# Since we are part of the graphical session, make sure we are started before
> -# it is complete.
> -Before=graphical.target
> -
> -# Prevent starting on systems without virtual consoles, Weston requires one
> -# for now.
> -ConditionPathExists=/dev/tty0
> -
> -[Service]
> -# Requires systemd-notify.so Weston plugin.
> -Type=notify
> -EnvironmentFile=/etc/default/weston
> -ExecStart=/usr/bin/weston --modules=systemd-notify.so
> -
> -# Optional watchdog setup
> -#TimeoutStartSec=60
> -#WatchdogSec=20
> -
> -# The user to run Weston as.
> -User=weston
> -Group=weston
> -
> -# Make sure the working directory is the users home directory
> -WorkingDirectory=/home/weston
> -
> -# Set up a full user session for the user, required by Weston.
> -PAMName=weston-autologin
> -
> -# A virtual terminal is needed.
> -TTYPath=/dev/tty7
> -TTYReset=yes
> -TTYVHangup=yes
> -TTYVTDisallocate=yes
> -
> -# Fail to start if not controlling the tty.
> -StandardInput=tty-fail
> -StandardOutput=journal
> -StandardError=journal
> -
> -# Log this user with utmp, letting it show up with commands 'w' and 'who'.
> -UtmpIdentifier=tty7
> -UtmpMode=user
> -
> -[Install]
> -# Note: If you only want weston to start on-demand, remove this line with a
> -# service drop file
> -WantedBy=graphical.target
> diff --git a/meta/recipes-graphics/wayland/weston-init/weston.socket b/meta/recipes-graphics/wayland/weston-init/weston.socket
> deleted file mode 100644
> index c1bdc83c05..0000000000
> --- a/meta/recipes-graphics/wayland/weston-init/weston.socket
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -[Unit]
> -Description=Weston socket
> -RequiresMountsFor=/run
> -
> -[Socket]
> -ListenStream=/run/wayland-0
> -SocketMode=0775
> -SocketUser=weston
> -SocketGroup=wayland
> -RemoveOnStop=yes
> -
> -[Install]
> -WantedBy=sockets.target
> -
> --
> 2.48.1
>

