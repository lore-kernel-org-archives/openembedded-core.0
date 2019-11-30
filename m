Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
	[209.85.222.170])
	by mail.openembedded.org (Postfix) with ESMTP id 729FE7F7D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 15:09:24 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id v19so8641210qkv.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 07:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vP/+bRxn0e2iRAKQrX02RcRBcp+5ri6fKDKRb1kF8E0=;
	b=hLCIcnGEGGV4BLGjHeHj9C9s/aXbgz6SYl2MJH7tUvUKRsLd4tdrg2Y8TJr/V1bedi
	TaoGjw0BSYcKzLZY/aMo18XqM04t2lHBaQplDaADEawh4MwDq22v8AHlflTU6Wj+/Dyl
	E2PUD7FJyqu1RVEokSJ+nZfG7ytBUDvyPOiO2Jig0jquye+MuI8v9HOzuY+Byo2O0fje
	8gZ1mCMqMOXLhZprz6+YByJheJOYFDB3AmCUwukZ0aI4EwCGzECU0MiO2dDDE2O6UrXG
	EImiC6XAE86fqaE2VTFAIK7E2+NVhTbaO8+bnJdTHN5dn4yE5NksIvD1Q+FfldiuB3qC
	/AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vP/+bRxn0e2iRAKQrX02RcRBcp+5ri6fKDKRb1kF8E0=;
	b=MxyubTHfYjQB7pOWOll8SMZsDcHc+1H3N2MFGMKsMC+PcIShZEHZUa2CZXdD4uBjbd
	Bs5vY43ExZbs5gM42Boaq0TODHx+VgBgS4XkMCoNms+oWqtLusX0JG+Tj+y469zIUOjb
	IZB4gdsgxz1XCygWIsvmaF6ehcpOkRGPQJkeXSjwBG4/vVQOoZhYeuj4mQtd/symJ5wW
	XW6gQzPQTvxn2RIRhLaJsvwE1Lyt+Bh3pZLAkyjlF5s/ZGh5J4paI8v/8S+zcAR8qUcS
	Et5Z/Tb7EICZLoUIiP9dPkzTDSFt7FsihrIyuKNZGXaOz0ZEhHvDitEx42Du9D+HzL3m
	IiPA==
X-Gm-Message-State: APjAAAWHpy5cXvsdjrIyQXWXjIhui9nO1vYJT5ML2Flb/BchIAikrSER
	qksCDRLpK+2Eo7IVQo6JeCA3BUu3iAbkKpZBfxs=
X-Google-Smtp-Source: APXvYqxe2GqzZLaSeHe5fmyHvaZACw7o8Qsc6qA83cFFFSTc9hAwETAvsz0pX62sZpxm8OEIT9e/oBQQk3niN1JeqhY=
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr23095271qke.9.1575126564558; 
	Sat, 30 Nov 2019 07:09:24 -0800 (PST)
MIME-Version: 1.0
References: <20191130104823.584542-1-nathan@nathanrossi.com>
In-Reply-To: <20191130104823.584542-1-nathan@nathanrossi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Nov 2019 07:08:58 -0800
Message-ID: <CAMKF1sr4fS_VNm9HzHrb4MpnU7eVkuvFB3OndqhK5kQVXjdsZA@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross.inc: Remove test runner script generation
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
X-List-Received-Date: Sat, 30 Nov 2019 15:09:24 -0000
Content-Type: text/plain; charset="UTF-8"

looks good, there was similar task for glibc as well remove that too

On Sat, Nov 30, 2019 at 2:48 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> Remove the generation of the testgcc script which could be used to run
> the gcc test suite against a cross compiler with a remote execution
> target. The same functionality can now be achieved with the 'do_check'
> task of gcc-runtime or with oe-selftest (for automation of execution
> against qemu-user/qemu-system targets).
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross.inc | 90 ---------------------------------
>  1 file changed, 90 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> index 6784d9673f..c68cdd5dc4 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -77,96 +77,6 @@ do_compile () {
>
>         oe_runmake all-host configure-target-libgcc
>         (cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
> -       # now generate script to drive testing
> -       echo "#!/usr/bin/env sh" >${B}/${TARGET_PREFIX}testgcc
> -       set >> ${B}/${TARGET_PREFIX}testgcc
> -       # prune out the unneeded vars
> -       sed -i -e "/^BASH/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^USER/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^OPT/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^DIRSTACK/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^EUID/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^FUNCNAME/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^GROUPS/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^HOST/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^HOME/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^IFS/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^LC_ALL/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^LOGNAME/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^MACHTYPE/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^OSTYPE/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^PIPE/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^SHELL/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^'/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^UID/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^TERM/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^PKG_/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^POSIXLY_/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^PPID/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^PS4/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^Q/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^SHLVL/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^STAGING/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^LD_LIBRARY_PATH/d" ${B}/${TARGET_PREFIX}testgcc
> -       sed -i -e "/^PSEUDO/d" ${B}/${TARGET_PREFIX}testgcc
> -
> -       # append execution part of the script
> -cat >> ${B}/${TARGET_PREFIX}testgcc << STOP
> -target="\$1"
> -usage () {
> -       echo "Usage:"
> -       echo "\$0 user@target 'extra options to dejagnu'"
> -       echo "\$0 target 'extra options to dejagnu'"
> -       echo "\$0 target"
> -       echo "e.g. \$0 192.168.7.2 ' dg.exp=visibility-d.c'"
> -       echo "will only run visibility-d.c test case"
> -       echo "e.g. \$0 192.168.7.2 '/-mthumb dg.exp=visibility-d.c'"
> -       echo "will only run visibility-d.c test case in thumb mode"
> -       echo "You need to have dejagnu autogen expect installed"
> -       echo "on the build host"
> -    }
> -if [ "x\$target" = "x" ]
> -then
> -       echo "Please specify the target machine and remote user in form of user@target\n"
> -       usage
> -       exit 1;
> -fi
> -
> -shift
> -
> -echo "\$target" | grep "@" 2>&1 > /dev/null
> -if [ "x\$?" = "x0" ]
> -then
> -   user=\$(echo \$target | cut -d '@' -f 1)
> -   target=\$(echo \$target | cut -d '@' -f 2)
> -else
> -   user=\$USER
> -fi
> -ssh \$user@\$target date 2>&1 > /dev/null
> -if [ "x\$?" != "x0" ]
> -then
> -       echo "Failed connecting to \$user@\$target it could be because"
> -       echo "you don't have passwordless ssh setup to access \$target"
> -       echo "or sometimes host key has been changed"
> -       echo "in such case do something like below on build host"
> -       echo "ssh-keygen -f "~/.ssh/known_hosts" -R \$target"
> -       echo "and then try ssh \$user@\$target"
> -
> -       usage
> -       exit 1
> -fi
> -       echo "lappend boards_dir [pwd]/../../.." > ${B}/site.exp
> -       echo "load_generic_config \"unix\"" > ${B}/${PACKAGE_ARCH}.exp
> -       echo "set_board_info username \$user" >> ${B}/${PACKAGE_ARCH}.exp
> -       echo "set_board_info rsh_prog ssh" >> ${B}/${PACKAGE_ARCH}.exp
> -       echo "set_board_info rcp_prog scp" >> ${B}/${PACKAGE_ARCH}.exp
> -       echo "set_board_info hostname \$target" >> ${B}/${PACKAGE_ARCH}.exp
> -       DEJAGNU=${B}/site.exp make -k check RUNTESTFLAGS="--target_board=${PACKAGE_ARCH}\$@"
> -
> -STOP
> -
> -       chmod +x ${B}/${TARGET_PREFIX}testgcc
> -
>  }
>
>  INHIBIT_PACKAGE_STRIP = "1"
> ---
> 2.24.0

