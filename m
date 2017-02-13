Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 89B05731AF;
	Mon, 13 Feb 2017 19:53:09 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id k90so157555865wrc.3;
	Mon, 13 Feb 2017 11:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=DVxnN6mpLacO+xf/2OTwzlBNc0WuumaSdMiPDw4OcCU=;
	b=GXrvfpujK/H7+Yxx+l0AUoe1VULMtOhxH4s7m13IFF+Mwdm9D/BULjQAyvjij6vdvs
	NAHDOERthWZQz3bMpUXlFIhj2j1Gxib2jhBYyQd48+fiMoJTKX2bhjPKAv2UfSb12x8n
	mlAPtI8uwNlRMwQkYswPvMGDGiEIvqqyg+B2sRrGXuzf0pNIXs+2gxgIPS/siBiA9sLL
	bZyZSrq3ouvYHYJ/FePXqaJj7of7skJ1uBGmsZkHUmTWYHcQVIe2+t2ix7GIj3m7Iy0a
	hQhGuvWfbmk/7iyLEzCR68IfRyN+57fO1eZp+c0xgTOZ8OuWw/tAfyLb9uNQbQsaFQqu
	XwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=DVxnN6mpLacO+xf/2OTwzlBNc0WuumaSdMiPDw4OcCU=;
	b=n6YWU3yTpbN40EUOqIg+Yxp8HuE7LQlJQedwPxIA4XaGxLdYXYXFGcP+jxU9HhxLW8
	G9IVAlR8dhQegUqMnATukxbAlx1ZYt4kmVDmKyD1eIZtyYPhz0IQ5JWvztsaVeW7yFZR
	zTlLP4oYlVYIfTb1hGbom7h1Mzn1paqOEAasWX6cSHNOD+DioR969dGlQQMhFSvCvJNq
	ONEcMFVHOL/Pinj2Fl8AlxISycqBAkqc5FwQcR0Vd59xQbRiFoA4rhpvNkU8xd7NuhRb
	rUD8Z/sqRY5wXR0w3ojrb/cG0+k4XhzdrAP8c9arUSZupqgAHcli9/e+bcQT/GLrEyF/
	Q1ig==
X-Gm-Message-State: AMke39nksavECvdJUStMIR2qwQTGrDSlxqyvuZB4qVhBEjWNQtTrS4OfAqw2fRPaTpxexY1q3ySCzp8GvWmK0Q==
X-Received: by 10.223.150.34 with SMTP id b31mr22031030wra.196.1487015587997; 
	Mon, 13 Feb 2017 11:53:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Mon, 13 Feb 2017 11:53:06 -0800 (PST)
In-Reply-To: <20170213193327.GB856@jama>
References: <20170213193327.GB856@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 20:53:06 +0100
Message-ID: <CA+chaQduZp3g1uDqhFfowFJtoxARdx4zJ2xsoAEjVYYXY2=7KA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-02-13
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
X-List-Received-Date: Mon, 13 Feb 2017 19:53:11 -0000
Content-Type: multipart/alternative; boundary=001a11477bfee5f27105486ecb47

--001a11477bfee5f27105486ecb47
Content-Type: text/plain; charset=UTF-8

I found an issue in the report generation, that it didn't show failures for
BBCLASSEXTENDed recipes, I've fixed it in jenkins-job.sh and the updated
report would look like this:

INFO: jenkins-job.sh-1.8.17 Complete log available at
http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170213_094715.log

=== common (2) ===
    * virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb:do_configure
    * virtual:native:meta-openembedded/meta-oe/recipes-support/system-config-keyboard/system-config-keyboard_1.4.0.bb:do_compile

=== common-x86 (9) ===
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_compile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:do_compile
    * meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:do_prepare_recipe_sysroot
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/pimlico/contacts_git.bb:do_configure
    * meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.29.bb:do_configure
    * meta-openembedded/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb:do_compile
    * meta-openembedded/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb:do_configure
    * virtual:native:meta-openembedded/meta-oe/recipes-extended/efivar/efivar_0.24.bb:do_compile

=== qemuarm (1) ===
    * meta-openembedded/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb:do_fetch

=== qemux86 (0) ===

=== qemux86_64 (0) ===


And qemuarm is showing less issues, because it was triggered later and has
even more PNBLACKLISTs.

I'll also stop sending the list of PNBLACKLISTs and QA issues and included
changes to the ML, because it's too long and sometimes I've noticed that
there are copy&paste issues when I'm pasting very long text (not sure if
it's mangled by vim in paste mode or already in chromium when doing
Ctrl+C). Interested people can still see it all in the "complete log" which
is lined above the report.

On Mon, Feb 13, 2017 at 8:33 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> == Number of issues - stats ==
> {| class='wikitable'
> !|Date               !!colspan='3'|Failed tasks
>  !!colspan='6'|Failed depencencies                    !!|Signatures
>     !!colspan='12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64
> ||qemuarm||max||min     ||qemux86||max||min     ||all   ||already-stripped
>     ||libdir        ||textrel       ||build-deps    ||file-rdeps
> ||version-going-backwards       ||host-user-contaminated
> ||installed-vs-shipped  ||unknown-configure-option
> ||symlink-to-sysroot    ||invalid-pkgconfig     ||pkgname       ||
> |-
> ||2017-02-13    ||1     ||8     ||8     ||N/A   ||N/A   ||N/A   ||N/A
>  ||N/A   ||N/A   ||0     ||0             ||0             ||0
>  ||0             ||0             ||680           ||0             ||0
>      ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2017-02-13 ==
>
> INFO: jenkins-job.sh-1.8.16 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> report.20170213_093040.log
>
> === common () ===
>
> === common-x86 (8) ===
>     * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:
> do_compile
>     * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143
> .bb:do_compile
>     * meta-openembedded/meta-filesystems/recipes-
> filesystems/smbnetfs/smbnetfs_git.bb:do_prepare_recipe_sysroot
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-
> utility/gnome-disk-utility_2.32.0.bb:do_compile
>     * meta-openembedded/meta-gnome/recipes-gnome/pimlico/contacts_git.bb:
> do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.29.bb:
> do_configure
>     * meta-openembedded/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb:
> do_compile
>     * meta-openembedded/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb:
> do_configure
>
> === qemuarm (1) ===
>     * meta-openembedded/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb:
> do_fetch
>
> === qemux86 (0) ===
>
> === qemux86_64 (0) ===
>
> === Number of failed tasks (17) ===
> {| class=wikitable
> |-
> || qemuarm      || 1     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemuarm.20170213_081827.log/ ||
> http://errors.yoctoproject.org/Errors/Build/32344/
> |-
> || qemux86      || 8     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86.20170213_054153.log/ ||
> http://errors.yoctoproject.org/Errors/Build/32332/
> |-
> || qemux86_64   || 8     || http://logs.nslu2-linux.org/
> buildlogs/oe/world/pyro/log.world.qemux86-64.20170213_072647.log/ ||
> http://errors.yoctoproject.org/Errors/Build/32343/
> |}
> === PNBLACKLISTs (460) ===
>
> === QA issues (680) ===
> {| class=wikitable
> !| Count                ||Issue
> |-
> ||0     ||already-stripped
> |-
> ||0     ||build-deps
> |-
> ||0     ||file-rdeps
> |-
> ||0     ||host-user-contaminated
> |-
> ||0     ||installed-vs-shipped
> |-
> ||0     ||invalid-pkgconfig
> |-
> ||0     ||libdir
> |-
> ||0     ||pkgname
> |-
> ||0     ||symlink-to-sysroot
> |-
> ||0     ||textrel
> |-
> ||0     ||unknown-configure-option
> |-
> ||680   ||version-going-backwards
> |}
>
>
>
> === Incorrect PACKAGE_ARCH or sstate signatures (0) ===
>
> Complete log: http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.
> signatures.20170213_071600.log/
>
>     * ERROR: Nothing RPROVIDES 'fsoaudiod' (but /home/jenkins/oe/world/shr-
> core/openembedded-core/meta/recipes-core/packagegroups/pac
> kagegroup-base.bb RDEPENDS on or otherwise requires it)
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86copy in
> /home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>     * ERROR: Nothing RPROVIDES 'fsoaudiod' (but /home/jenkins/oe/world/shr-
> core/openembedded-core/meta/recipes-core/packagegroups/pac
> kagegroup-base.bb RDEPENDS on or otherwise requires it)
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>     * ERROR: no sigdata files were generated for MACHINE qemux86 in
> /home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>     * ERROR: Nothing RPROVIDES 'fsoaudiod' (but /home/jenkins/oe/world/shr-
> core/openembedded-core/meta/recipes-core/packagegroups/pac
> kagegroup-base.bb RDEPENDS on or otherwise requires it)
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depends on
> blacklisted libfso-glib
>     * ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>     * ERROR: no sigdata files were generated for MACHINE qemuarm in
> /home/jenkins/oe/world/shr-core/tmp-glibc/stamps
>
>
> PNBLACKLISTs:
> openembedded-core/:
> meta-browser:
> recipes-browser/chromium/cef3_280796.bb:PNBLACKLIST[cef3] ?= "BROKEN:
> fails to build with gcc-6"
> recipes-browser/chromium/chromium-wayland_53.0.2785.143.bb:PNBLACKLIST[chromium-wayland]
> ?= "Fails to build http://errors.yoctoproject.org/Errors/Details/132830/"
> recipes-browser/chromium/chromium_52.0.2743.76.bb:PNBLACKLIST[chromium]
> ?= "Fails to build http://errors.yoctoproject.org/Errors/Details/132831/"
> meta-openembedded:
> meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb:PNBLACKLIST[python-edbus]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130600/"
> meta-efl/recipes-devtools/python/python-efl_1.15.0.bb:PNBLACKLIST[python-efl]
> ?= "Depends on blacklisted elementary"
> meta-efl/recipes-devtools/python/python-efl_git.bb:PNBLACKLIST[python-efl]
> ?= "Depends on blacklisted elementary"
> meta-efl/recipes-efl/e17/cpu_svn.bb:PNBLACKLIST[cpu] ?= "Depends on
> blacklisted e-wm"
> meta-efl/recipes-efl/e17/diskio_svn.bb:PNBLACKLIST[diskio] ?= "broken:
> switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/
> and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58.
> invalid state name: 'off'. "default" state must always be first."
> meta-efl/recipes-efl/e17/e-tasks_git.bb:PNBLACKLIST[e-tasks] ?= "Depends
> on blacklisted elementary"
> meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b-and-w]
> ?= "Runtime depends on blacklisted e-wm"
> meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b-and-w]
> ?= "Runtime depends on blacklisted e-wm-theme-b-and-w"
> meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb:PNBLACKLIST[e-wm-theme-b-and-w]
> ?= "Runtime depends on blacklisted e-wm-theme-b-and-w-dev"
> meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:P
> NBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted
> e-wm"
> meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb:P
> NBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted
> e-wm-theme-illume-efenniht"
> meta-efl/recipes-efl/e17/e-wm_0.18.8.bb:PNBLACKLIST[e-wm] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/e-wm_0.19.10.bb:PNBLACKLIST[e-wm] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/e-wm_git.bb:PNBLACKLIST[e-wm] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/edje-viewer_svn.bb:PNBLACKLIST[edje-viewer] ?=
> "Depends on blacklisted elementary"
> meta-efl/recipes-efl/e17/elbow_git.bb:PNBLACKLIST[elbow] ?= "Depends on
> blacklisted webkit-efl"
> meta-efl/recipes-efl/e17/elfe_git.bb:PNBLACKLIST[elfe] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/elmdentica_svn.bb:PNBLACKLIST[elmdentica] ?=
> "OLD and depends on broken azy"
> meta-efl/recipes-efl/e17/emprint_svn.bb:PNBLACKLIST[emprint] ?= "if you
> want to use these modules with E18, then you need to update it to git
> recipe fetching newer sources from http://git.enlightenment.org/
> apps/emprint.git/"
> meta-efl/recipes-efl/e17/enjoy_git.bb:PNBLACKLIST[enjoy] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/ephoto_svn.bb:PNBLACKLIST[ephoto] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/exalt-client_svn.bb:PNBLACKLIST[exalt-client] ?=
> "Depends on blacklisted elementary"
> meta-efl/recipes-efl/e17/exalt_svn.bb:PNBLACKLIST[exalt] ?= "Depends on
> blacklisted elementary"
> meta-efl/recipes-efl/e17/exquisite_svn.bb:PNBLACKLIST[exquisite] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130619/"
> meta-efl/recipes-efl/e17/flame_svn.bb:PNBLACKLIST[flame] ?= "Depends on
> blacklisted e-wm"
> meta-efl/recipes-efl/e17/forecasts_svn.bb:PNBLACKLIST[forecasts] ?=
> "Depends on blacklisted e-wm"
> meta-efl/recipes-efl/e17/news_svn.bb:PNBLACKLIST[news] ?= "if you want to
> use these modules with E18, then you need to update it to git recipe
> fetching newer sources from http://git.enlightenment.org/
> enlightenment/modules/news.git/"
> meta-efl/recipes-efl/e17/places_svn.bb:PNBLACKLIST[places] ?= "Depends on
> blacklisted e-wm"
> meta-efl/recipes-efl/e17/rage_svn.bb:PNBLACKLIST[rage] ?= "if you want to
> use these modules with E18, then you need to update it to git recipe
> fetching newer sources from  http://git.enlightenment.org/apps/rage.git/"
> meta-efl/recipes-efl/e17/rain_svn.bb:PNBLACKLIST[rain] ?= "Depends on
> blacklisted e-wm"
> meta-efl/recipes-efl/e17/screenshot_svn.bb:PNBLACKLIST[screenshot] ?=
> "depends on blacklisted emprint"
> meta-efl/recipes-efl/e17/terminology_0.9.1.bb:PNBLACKLIST[terminology] ?=
> "Depends on blacklisted elementary"
> meta-efl/recipes-efl/e17/uptime_svn.bb:PNBLACKLIST[uptime] ?= "Depends on
> blacklisted e-wm"
> meta-efl/recipes-efl/efl/azy_svn.bb:PNBLACKLIST[azy] ?= "OLD and doesn't
> build with gcc-5"
> meta-efl/recipes-efl/efl/elementary_1.15.1.bb:PNBLACKLIST[elementary] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130584/"
> meta-efl/recipes-efl/efl/engrave_svn.bb:PNBLACKLIST[engrave] ?= "BROKEN:
> fails to build with latest oe-core"
> meta-efl/recipes-efl/efl/entrance_svn.bb:PNBLACKLIST[entrance] ?=
> "broken: switch to https://git.enlightenment.org/misc/entrance.git and
> fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid
> state name: 'defaault'. "default" state must always be first."
> meta-efl/recipes-efl/efl/libeflvala_svn.bb:PNBLACKLIST[libeflvala] ?=
> "Depends on blacklisted elementary"
> meta-efl/recipes-efl/efl/libeweather_svn.bb:PNBLACKLIST[libeweather] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130649/"
> meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb:PNBLACKLIST[packagegroup-efl-sdk]
> ?= "Runtime depends on blacklisted elementary-dev"
> meta-efl/recipes-efl/packagegroups/packagegroup-
> efl-standalone-sdk-target.bb:PNBLACKLIST[packagegroup-efl-standalone-sdk-target]
> ?= "Runtime depends on blacklisted elementary-dev"
> meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[packagegroup-x11-illume]
> ?= "Runtime depends on blacklisted e-wm"
> meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[packagegroup-x11-illume]
> ?= "Runtime depends on blacklisted e-wm-config-mobile"
> meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb:PNBLACKLIST[packagegroup-x11-illume]
> ?= "Runtime depends on blacklisted e-wm-theme-default"
> meta-efl/recipes-efl/webkit/webkit-efl.inc:PNBLACKLIST[webkit-efl] ?=
> "Old and unmaintaned fork with many security issues"
> meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb:PNBLACKLIST[mcnavi] ?=
> "BROKEN: latest version 0.3.4 is 3 years old and now broken with more
> strict ejde_cc from efl-1.13"
> meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb:PNBLACKLIST[smbnetfs]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/132827/"
> meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb:
> PNBLACKLIST[unionfs-fuse] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130648/"
> meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb:PNBLACKLIST[dmapi]
> ?= "Depends on broken xfsprogs"
> meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb:PNBLACKLIST[xfsdump]
> ?= "Depends on broken xfsprogs"
> meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb:PNBLACKLIST[xfsprogs]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130663/"
> meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=
> "Depends on blacklisted gstreamer"
> meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb:PNBLACKLIST[cheese] ?=
> "Depends on blacklisted gnome-desktop"
> meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb:PNBLACKLIST[epdfview]
> ?= "BROKEN: images are not displayed anymore"
> meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb:PNBLACKLIST[gmtk] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130661/"
> meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb:PNBLACKLIST[gnome-mplayer]
> ?= "rdepends on blacklisted mplayer"
> meta-gnome/recipes-extended/gparted/gparted_0.27.0.bb:PNBLACKLIST[gparted]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/131634/"
> meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb:
> PNBLACKLIST[gtk-theme-torturer] ?= "BROKEN: gmacros.h:182:53: error: size
> of array '_GStaticAssertCompileTimeAssertion_2' is negative"
> meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb:PNBLACKLIST[abiword] ?=
> "Depends on blacklisted gtkmathview"
> meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb:PNBLACKLIST[libbonobo]
> ?= "Depends on blacklisted orbit2"
> meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb:PNBLACKLIST[libbonoboui]
> ?= "Depends on blacklisted libgnome"
> meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb:PNBLACKLIST[libbonoboui]
> ?= "Depends on blacklisted libbonobo"
> meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb:PNBLACKLIST[devilspie2]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130666/"
> meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb:PNBLACKLIST[gcalctool]
> ?= "broken at least since April 2013 http://permalink.gmane.org/
> gmane.comp.handhelds.openembedded/57920 and nobody complained, it's also
> replaced by gnome calculator"
> meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb:PNBLACKLIST[gdm] ?= "Depends
> on broken gnome-panel"
> meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb:PNBLACKLIST[gedit] ?=
> "Depends on blacklisted gtksourceview2"
> meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb:
> PNBLACKLIST[gnome-backgrounds] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130647/"
> meta-gnome/recipes-gnome/gnome-control-center/gnome-
> control-center_2.32.1.bb:PNBLACKLIST[gnome-control-center] ?= "Depends on
> broken gnome-menus"
> meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb:
> PNBLACKLIST[gnome-desktop] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130595/"
> meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb:
> PNBLACKLIST[gnome-disk-utility] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/132824/"
> meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb:
> PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from
> oe-core"
> meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb:PNBLACKLIST[gnome-menus]
> ?= "BROKEN: fails to build because of python + conflicts with gnome-menu3"
> meta-gnome/recipes-gnome/gnome-mime-data/gnome-mime-data_2.18.0.bb:
> PNBLACKLIST[gnome-mime-data] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130589/"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
> ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb:PNBLACKLIST[gnome-panel3]
> ?= "Depends on broken gnome-menus"
> meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb:PNBLACKLIST[gnome-panel]
> ?= "Depends on broken libgweather"
> meta-gnome/recipes-gnome/gnome-power-manager/gnome-
> power-manager_2.32.0.bb:PNBLACKLIST[gnome-power-manager] ?= "BROKEN: not
> compatible with current libnotify"
> meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb:
> PNBLACKLIST[gnome-session] ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-
> settings-daemon_2.32.1.bb:PNBLACKLIST[gnome-settings-daemon] ?= "Depends
> on blacklisted libgnomekbd"
> meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-
> settings-daemon_2.32.1.bb:PNBLACKLIST[gnome-settings-daemon] ?= "Depends
> on blacklisted gnome-desktop"
> meta-gnome/recipes-gnome/gnome-system-monitor/gnome-
> system-monitor_2.28.2.bb:PNBLACKLIST[gnome-system-monitor] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/131635/"
> meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb:PNBLACKLIST[gnome-vfs]
> ?= "Depends on blacklisted gnome-mime-data"
> meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb:PNBLACKLIST[gnome-terminal]
> ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb:PNBLACKLIST[libgnomecups]
> ?= "Depends on blacklisted libgnomeui"
> meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb:PNBLACKLIST[libgnomeprint]
> ?= "Depends on broken libgnomecups"
> meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb:PNBLACKLIST[gnumeric]
> ?= "Depends on broken libgnomeprint"
> meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb:PNBLACKLIST[gthumb] ?=
> "Depends on blacklisted gstreamer"
> meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb:PNBLACKLIST[gtk-engines]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130602/"
> meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb:
> PNBLACKLIST[gtksourceview2] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130597/"
> meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb:PNBLACKLIST[libgweather3]
> ?= "CONFLICT: 876 files are conflicting with libgweather"
> meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb:PNBLACKLIST[libgweather]
> ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb:PNBLACKLIST[libgnome]
> ?= "Depends on blacklisted gnome-vfs"
> meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb:PNBLACKLIST[libgnomekbd]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130608/"
> meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.5.bb:PNBLACKLIST[libgnomeui]
> ?= "Depends on blacklisted libgnome"
> meta-gnome/recipes-gnome/libidl/libidl-native_0.8.14.bb:PNBLACKLIST[libidl-native]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130582/"
> meta-gnome/recipes-gnome/libidl/libidl_0.8.14.bb:PNBLACKLIST[libidl] ?=
> "Depends on blacklisted libidl-native"
> meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb:PNBLACKLIST[nautilus3]
> ?= "BROKEN: fails to build, maybe missing dependency on
> gnome-desktop-utils.h provider"
> meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb:PNBLACKLIST[nautilus]
> ?= "Depends on blacklisted gnome-desktop"
> meta-gnome/recipes-gnome/orbit2/orbit2_2.14.19.bb:PNBLACKLIST[orbit2] ?=
> "Depends on blacklisted libidl-native"
> meta-gnome/recipes-gnome/pimlico/contacts_git.bb:PNBLACKLIST[contacts] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/132826/"
> meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb:PNBLACKLIST[tasks] ?=
> "Fails to build with gcc-6"
> meta-gnome/recipes-gnome/pimlico/tasks_git.bb:PNBLACKLIST[tasks] ?=
> "Fails to build with gcc-6"
> meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb:
> PNBLACKLIST[system-tools-backends] ?= "does not build with distroless
> qemuarm as reported in 'State of bitbake world' thread, nobody volunteered
> to fix them"
> meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb:PNBLACKLIST[gnome-themes]
> ?= "Depends on blacklisted gtk-engines"
> meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb:PNBLACKLIST[zenity] ?=
> "BROKEN: doesn't build with B!=S"
> meta-gnome/recipes-support/florence/florence_0.5.4.bb:PNBLACKLIST[florence]
> ?= "Depends on blacklisted gstreamer"
> meta-gnome/recipes-support/goffice/goffice_0.10.1.bb:PNBLACKLIST[goffice]
> ?= "BROKEN: fails to build with gcc-6"
> meta-gnome/recipes-support/onboard/onboard_1.3.0.bb:PNBLACKLIST[onboard]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130637/"
> meta-gnome/recipes-support/tracker/tracker_0.14.2.bb:PNBLACKLIST[tracker]
> ?= "BROKEN: fails to build with new binutils-2.27"
> meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb:PNBLACKLIST[gpe-scap]
> ?= "Depends on blacklisted libgpewidget"
> meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb:PNBLACKLIST[libgpewidget]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130594/"
> meta-gpe/recipes-graphics/minilite/minilite_0.50.bb:PNBLACKLIST[minilite]
> ?= "Depends on blacklisted libgpewidget"
> meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb:PNBLACKLIST[fbreader]
> ?= "Depends on blacklisted libgpewidget"
> meta-gpe/recipes-support/fbreader/fbreader_git.bb:PNBLACKLIST[fbreader]
> ?= "BROKEN: fails to build with gcc-6"
> meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb:PNBLACKLIST[kexecboot]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/132823/"
> meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.4.bb:
> PNBLACKLIST[klibc-utils] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130679/"
> meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb:
> PNBLACKLIST[ubi-utils-klibc] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130665/"
> meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.
> bb:PNBLACKLIST[kexec-tools-klibc] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130674/"
> meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb:
> PNBLACKLIST[gupnp-igd] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130645/"
> meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb:
> PNBLACKLIST[gupnp-tools] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130670/"
> meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb:PNBLACKLIST[dvb-apps]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130603/"
> meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb:PNBLACKLIST[tvheadend]
> ?= "Depends on blacklisted dvb-apps"
> meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb:
> PNBLACKLIST[kodi-addon-pvr-hts] ?= "Depends on blacklisted kodi"
> meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb:PNBLACKLIST[kodi-platform]
> ?= "Depends on blacklisted kodi"
> meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-startup]
> ?= "Runtime depends on blacklisted kodi"
> meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb:PNBLACKLIST[kodi-startup]
> ?= "Runtime depends on blacklisted kodi-startup-dev"
> meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb:PNBLACKLIST[kodi] ?=
> "Depends on blacklisted libsdl-mixer"
> meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb:PNBLACKLIST[mkvtoolnix]
> ?= "BROKEN: Failx to build with gcc-5"
> meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb:
> PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because
> libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
> meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb:
> PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S
> (trying to install rendererconsole.py from ${B} instead of ${S})"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb:
> PNBLACKLIST[gst-ffmpeg] ?= "Not compatible with currently used ffmpeg 3"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> fluendo-mp3_0.10.31.bb:PNBLACKLIST[gst-fluendo-mp3] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> fluendo-mpegdemux_0.10.85.bb:PNBLACKLIST[gst-fluendo-mpegdemux] ?=
> "Depends on blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb:
> PNBLACKLIST[gst-meta-base] ?= "Depends on blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-openmax_0.10.1.bb:
> PNBLACKLIST[gst-openmax] ?= "Depends on blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-bad_0.10.23.bb:PNBLACKLIST[gst-plugins-bad] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-base_0.10.36.bb:PNBLACKLIST[gst-plugins-base] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-gl_0.10.3.bb:PNBLACKLIST[gst-plugins-gl] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-good_0.10.31.bb:PNBLACKLIST[gst-plugins-good] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-
> plugins-ugly_0.10.19.bb:PNBLACKLIST[gst-plugins-ugly] ?= "Depends on
> blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-rtsp_0.10.8.bb:
> PNBLACKLIST[gst-rtsp] ?= "Depends on blacklisted gstreamer"
> meta-multimedia/recipes-multimedia/gstreamer-0.10/gstreamer_0.10.36.bb:
> PNBLACKLIST[gstreamer] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130583/"
> meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb:PNBLACKLIST[gst123]
> ?= "gst123 is still "sometimes" using wrong sysroot"
> meta-multimedia/recipes-multimedia/musicpd/mpd_0.19.21.bb:PNBLACKLIST[mpd]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130612/"
> meta-networking/recipes-connectivity/crda/crda_3.18.bb:PNBLACKLIST[crda]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130675/"
> meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb:PNBLACKLIST[dnrd] ?=
> "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were
> installed but not shipped in any package:"
> meta-networking/recipes-kernel/netmap/netmap-modules_git.bb:
> PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default
> kernel version 4.8"
> meta-networking/recipes-kernel/netmap/netmap_git.bb:PNBLACKLIST[netmap]
> ?= "BROKEN: Tries to build kernel module and fails, either it should be
> disabled or there should be dependency on kernel like in netmap-modules"
> meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb:PNBLACKLIST[accel-ppp]
> ?= "BROKEN: fails to build with new binutils-2.27"
> meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb:
> PNBLACKLIST[lksctp-tools] ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
> meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb:
> PNBLACKLIST[netcat-openbsd] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130673/"
> meta-networking/recipes-support/nis/ypbind-mt_2.2.bb:PNBLACKLIST[ypbind-mt]
> ?= "BROKEN: Depends on broken yp-tools"
> meta-networking/recipes-support/wireshark/wireshark_2.2.4.bb:PNBLACKLIST[wireshark]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130671/"
> meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-
> test-suite_6.6.1.bb:PNBLACKLIST[phoronix-test-suite] ?= "Runtime depends
> on blacklisted php-cli"
> meta-oe/recipes-benchmark/pmbw/pmbw_git.bb:PNBLACKLIST[pmbw] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130568/"
> meta-oe/)}"
> meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb:PNBLACKLIST[bluez4] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:
> PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in
> DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb:PNBLACKLIST[gnokii]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130662/"
> meta-oe/recipes-connectivity/libmbim/libmbim_1.14.0.bb:PNBLACKLIST[libmbim]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130590/"
> meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb:PNBLACKLIST[libqmi]
> ?= "Depends on blacklisted libmbim"
> meta-oe/recipes-connectivity/modemmanager/modemmanager_1.6.4.bb:PNBLACKLIST[modemmanager]
> ?= "Depends on blacklisted libmbim"
> meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb:PNBLACKLIST[mosh] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130653/"
> meta-oe/recipes-connectivity/networkmanager/networkmanager-
> openvpn_1.2.6.bb:PNBLACKLIST[networkmanager-openvpn] ?= "Fails to build
> with RSS http://errors.yoctoproject.org/Errors/Details/130667/"
> meta-oe/recipes-connectivity/soft66/soft66_git.bb:PNBLACKLIST[soft66] ?=
> "BROKEN: depends on broken libftdi"
> meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb:PNBLACKLIST[libtelepathy]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130609/"
> meta-oe/recipes-connectivity/telepathy/telepathy-mission-
> control_5.16.1.bb:PNBLACKLIST[telepathy-mission-control] ?= "Depends on
> blacklisted libtelepathy"
> meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb:PNBLACKLIST[wvdial] ?=
> "Depends on broken wvstreams"
> meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb:PNBLACKLIST[wvstreams]
> ?= "BROKEN: fails to build with gcc-6"
> meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb:PNBLACKLIST[zeroc-ice]
> ?= "BROKEN: not compatible with default db version"
> meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb:PNBLACKLIST[dbus-daemon-proxy]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130613/"
> meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb:PNBLACKLIST[libdbus-c++]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130644/"
> meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb:PNBLACKLIST[fakeroot] ?=
> "BROKEN: QA Issue: -dev package contains non-symlink .so"
> meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:PNBLACKLIST[packagegroup-cli-tools]
> ?= "Runtime depends on blacklisted dbus-daemon-proxy"
> meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb:PNBLACKLIST[packagegroup-cli-tools]
> ?= "Runtime depends on blacklisted packagegroup-cli-tools"
> meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb:PNBLACKLIST[cloud9] ?= "Not
> comatible with current nodejs 0.12, but upstream is working on it for v3"
> meta-oe/recipes-devtools/geany/geany-plugins_1.29.bb:PNBLACKLIST[geany-plugins]
> ?= "Depends on blacklisted geany"
> meta-oe/recipes-devtools/geany/geany_1.29.bb:PNBLACKLIST[geany] ?= "Fails
> to build with RSS http://errors.yoctoproject.org/Errors/Details/132822/"
> meta-oe/recipes-devtools/glade/glade3_3.8.5.bb:PNBLACKLIST[glade3] ?=
> "Depends on blacklisted libbonoboui"
> meta-oe/recipes-devtools/glade/glade3_3.8.5.bb:PNBLACKLIST[glade3] ?=
> "Depends on blacklisted libgnomeui"
> meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb:PNBLACKLIST[ltp-ddt]
> ?=ls/php/php_5.6.26.bb:PNBLACKLIST[php] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/131630/"
> meta-oe/recipes-devtools/php/php_7.1.0.bb:PNBLACKLIST[php] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130601/"
> meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-
> binding-tool_0.4.0.bb:PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/131628/"
> meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-
> binding-tool_git.bb:PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130581/"
> meta-oe/recipes-extended/collectd/collectd_5.5.0.bb:PNBLACKLIST[collectd]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130654/"
> meta-oe/recipes-extended/efibootmgr/efibootmgr_0.12.bb:PNBLACKLIST[efibootmgr]
> ?= "Depends on blacklisted efivar"
> meta-oe/recipes-extended/efivar/efivar_0.24.bb:PNBLACKLIST[efivar] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/132821/"
> meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb:PNBLACKLIST[libgxim] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130604/"
> meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb:PNBLACKLIST[gtkmathview]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/131636/"
> meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb:
> PNBLACKLIST[openlmi-networking] ?= "Depends on blacklisted
> openlmi-providers"
> meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb:
> PNBLACKLIST[openlmi-providers] ?= "Depends on blacklisted lmsensors"
> meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.
> bb:PNBLACKLIST[openlmi-storage] ?= "Depends on blacklisted pywbem"
> meta-oe/recipes-extended/openlmi/openlmi-tools_0.10.5.bb:PNBLACKLIST[openlmi-tools]
> ?= "Depends on blacklisted pywbem"
> meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb:PNBLACKLIST[pywbem] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130596/"
> meta-oe/recipes-extended/pywbem/pywbem_0.8.0.bb:PNBLACKLIST[pywbem] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130681/"
> meta-oe/recipes-extended/subsurface/subsurface_git.bb:PNBLACKLIST[subsurface]
> ?= "Needs to be upgraded for compatibility with new libdivecomputer"
> meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb:PNBLACKLIST[gtkextra] ?=
> "BROKEN: Fails to build with gcc-5"
> meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb:PNBLACKLIST[gtkhtml2] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130633/"
> meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb:PNBLACKLIST[clutter-box2d]
> ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-graphics/fbida/fbida_2.10.bb:PNBLACKLIST[fbida] ?= "Fails
> to build with RSS http://errors.yoctoproject.org/Errors/Details/130677/"
> meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb:PNBLACKLIST[fim] ?= "BROKEN:
> doesn't build with B!=S (flex: can't open lex.lex)"
> meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb:PNBLACKLIST[fontforge]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130639/"
> meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb:PNBLACKLIST[gimp] ?= "Fails
> to build with RSS http://errors.yoctoproject.org/Errors/Details/132825/"
> meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb:PNBLACKLIST[libsexy]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130607/"
> meta-oe/recipes-graphics/slim/slim_1.3.2.bb:PNBLACKLIST[slim] ?= "does
> not build with distroless qemuarm as repetails/130632/"
> meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb:PNBLACKLIST[xstdcmap]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130660/"
> meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb:PNBLACKLIST[xf86-input-mtev]
> ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb:
> PNBLACKLIST[xf86-video-geode] ?= "BROKEN, fails to build"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.
> bb:PNBLACKLIST[xf86-video-glamo] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130629/"
> meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb:
> PNBLACKLIST[xf86-video-nouveau] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130657/"
> meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.
> bb:PNBLACKLIST[font-adobe-100dpi] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130621/"
> meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb:
> PNBLACKLIST[font-adobe-utopia-100dpi] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130623/"
> meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb:PNBLACKLIST[font-bh-100dpi]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130624/"
> meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-
> 100dpi_1.0.3.bb:PNBLACKLIST[font-bh-lucidatypewriter-100dpi] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130625/"
> meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb:PNBLACKLIST[font-misc-misc]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130628/"
> meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
> ?= "Runtime depends on blacklisted font-adobe-100dpi"
> meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
> ?= "Runtime depends on blacklisted xorg-fonts-100dpi"
> meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
> ?= "Runtime depends on blacklisted font-bh-100dpi"
> meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
> ?= "Runtime depends on blacklisted font-adobe-utopia-100dpi"
> meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb:PNBLACKLIST[xorg-fonts-100dpi]
> ?= "Runtime depends on blacklisted font-bh-lucidatypewriter-100dpi"
> meta-oe/recipes-kernel/crash/crash_7.1.5.bb:PNBLACKLIST[crash] ?= "Fails
> to build with RSS http://errors.yoctoproject.org/Errors/Details/130678/"
> meta-oe/recipes-kernel/ktap/ktap-module_git.bb:PNBLACKLIST[ktap-module]
> ?= "Not compatible with 3.19 kernel"
> meta-oe/recipes-kernel/ktap/ktap_git.bb:PNBLACKLIST[ktap] ?= "Depends on
> blacklisted kernel-module-ktapvm"
> meta-oe/recipes-multimedia/jack/a2jmidid_8.bb:PNBLACKLIST[a2jmidid] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130646/"
> meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb:
> PNBLACKLIST[libsdl-mixer] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130592/"
> meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.1.bb:
> PNBLACKLIST[libsdl2-mixer] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130659/"
> meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb:PNBLACKLIST[minidlna]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130630/"
> meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb:PNBLACKLIST[mplayer2]
> ?= "Not compatible with currently used ffmpeg 3"pends on blacklisted
> modemmanager"
> meta-oe/recipes-navigation/gypsy/gypsy.inc:PNBLACKLIST[gypsy] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-navigation/navit/navit.inc:PNBLACKLIST[navit] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb:PNBLACKLIST[claws-mail]
> ?= "depends on blacklisted libetpan"
> meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb:
> PNBLACKLIST[claws-plugin-gtkhtml2-viewer] ?= "depends on blacklisted
> claws-mail"
> meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb:
> PNBLACKLIST[claws-plugin-mailmbox] ?= "depends on blacklisted claws-mail"
> meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.
> bb:PNBLACKLIST[claws-plugin-rssyl] ?= "depends on blacklisted claws-mail"
> meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb:PNBLACKLIST[sylpheed]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130651/"
> meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb:PNBLACKLIST[apcupsd]
> ?= "BROKEN: doesn't build with B!=S"
> meta-oe/recipes-support/emacs/emacs_23.4.bb:PNBLACKLIST[emacs] ?= "qemu:
> uncaught target signal 11 (Segmentation fault) - core dumped"
> meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]
> ?= "Depends on blacklisted gstreamer"
> meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]
> ?= "Depends on blacklisted libnice"
> meta-oe/recipes-support/farsight/farsight2_0.0.22.bb:PNBLACKLIST[farsight2]
> ?= "Depends on blacklisted gst-plugins-base"
> meta-oe/recipes-support/farsight/libnice_0.0.13.bb:PNBLACKLIST[libnice]
> ?= "Depends on blacklisted gstreamer"
> meta-oe/recipes-support/fftw/benchfft_3.1.bb:PNBLACKLIST[benchfft] ?=
> "does not build with distroless qemuarm as reported in 'State of bitbake
> world' thread, nobody volunteered to fix them"
> meta-oe/recipes-support/iksemel/iksemel_1.4.bb:PNBLACKLIST[iksemel] ?=
> "Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/ipmiutil/ipmiutil_2.9.6.bb:PNBLACKLIST[ipmiutil]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130641/"
> meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb:PNBLACKLIST[libdbi-drivers]
> ?= "BROKEN: fails to build with gcc-5"
> meta-oe/recipes-support/libetpan/libetpan_0.57.bb:PNBLACKLIST[libetpan]
> ?= "Not compatible with gnutls version 3.4 currently in oe-core"
> meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb:PNBLACKLIST[libsdl-ttf]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130598/"
> meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb:PNBLACKLIST[libsdl2-ttf]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130656/"
> meta-oe/recipes-support/lm_sensors/lmsensors_3.4.0.bb:PNBLACKLIST[lmsensors]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/131629/"
> meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb:
> PNBLACKLIST[multipath-tools] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130529/"
> meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130599/"
> meta-oe/recipes-support/ode/ode_0.13.bb:PNBLACKLIST[ode] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/130620/"
> meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb:PNBLACKLIST[open-vcdiff]
> ?gin/pidgin-otr_4.0.0.bb:PNBLACKLIST[pidgin-otr] ?= "depends on
> blacklisted pidgin"
> meta-oe/recipes-support/pidgin/pidgin_2.11.0.bb:PNBLACKLIST[pidgin] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130634/"
> meta-oe/recipes-support/postgresql/postgresql_9.4.10.bb:PNBLACKLIST[postgresql]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/131632/"
> meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb:PNBLACKLIST[psqlodbc]
> ?= "Depends on blacklisted postgresql"
> meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb:PNBLACKLIST[syslog-ng]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130631/"
> meta-oe/recipes-support/system-config-keyboard/system-
> config-keyboard_1.4.0.bb:PNBLACKLIST[system-config-keyboard] ?= "Fails to
> build with RSS http://errors.yoctoproject.org/Errors/Details/132829/"
> meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb:
> PNBLACKLIST[usb-modeswitch-data] ?= "Runtime depends on blacklisted
> usb-modeswitch"
> meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb:
> PNBLACKLIST[usb-modeswitch-data] ?= "Runtime depends on blacklisted
> usb-modeswitch-data"
> meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb:
> PNBLACKLIST[usb-modeswitch] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130620/"
> meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb:PNBLACKLIST[vala-terminal]
> ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No
> such file or directory"
> meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb:PNBLACKLIST[vboxguestdrivers]
> ?= "BROKEN: not compatible with default kernel version 4.8"
> meta-oe/recipes-support/xchat/xchat_2.8.8.bb:PNBLACKLIST[xchat] ?=
> "Depends on blacklisted libsexy"
> meta-oe/recipes-support/xdg-user-dirs/xdg-user-dirs_0.15.bb:PNBLACKLIST[xdg-user-dirs]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130635/"
> meta-python/recipes-connectivity/gateone/gateone_git.bb:PNBLACKLIST[gateone]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130642/"
> meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb:
> PNBLACKLIST[python-cryptography-vectors] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130664/"
> meta-python/recipes-devtools/python/python-pbr_1.10.0.bb:PNBLACKLIST[python-pbr]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130650/"
> meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb:
> PNBLACKLIST[python3-cryptography-vectors] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130626/"
> meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.4.2.bb:
> PNBLACKLIST[python3-ndg-httpsclient] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130615/"
> meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb:PNBLACKLIST[python3-pymisp]
> ?= "Runtime depends on blacklisted python3-pymisp"
> meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb:PNBLACKLIST[python3-pymisp]
> ?= "Runtime depends on blacklisted python3-pymisp-dev"
> meta-python/recipes-devtools/python/python3-requests_2.13.0.bb:
> PNBLACKLIST[python3-requests] ?= "Runtime depends on blacklisted
> python3-ndg-httpsclient"
> meta-python/recipes-devtools/python/python3-requests_2.13.0.bb:
> PNBLACKLIST[python3-requests] ?= "Runtime depends on blacklisted
> python3-requests-dev"
> meta-ruby/recipes-devtools/ruby/bundler_git.bb:PNBLACKLIST[bundler] ?=
> "Fails to build with RSS http://errors.yoctoprojecds on blacklisted
> tumbler"
> meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb:PNBLACKLIST[ristretto]
> ?= "Runtime depends on blacklisted ristretto-dev"
> meta-xfce/recipes-apps/ristretto/ristretto_0.8.1.bb:PNBLACKLIST[ristretto]
> ?= "Runtime depends on blacklisted ristretto"
> meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb:PNBLACKLIST[xfce4-mixer]
> ?= "Depends on blacklisted gst-plugins-base"
> meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb:PNBLACKLIST[openzone]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130682/"
> meta-xfce/recipes-extended/imsettings/imsettings_1.7.1.bb:PNBLACKLIST[imsettings]
> ?= "Depends on blacklisted libgxim"
> meta-xfce/recipes-multimedia/packagegroups/packagegroup-
> xfce-multimedia.bb:PNBLACKLIST[packagegroup-xfce-multimedia] ?= "Runtime
> depends on blacklisted xfce4-mpc-plugin"
> meta-xfce/recipes-multimedia/packagegroups/packagegroup-
> xfce-multimedia.bb:PNBLACKLIST[packagegroup-xfce-multimedia] ?= "Runtime
> depends on blacklisted packagegroup-xfce-multimedia"
> meta-xfce/recipes-multimedia/packagegroups/packagegroup-
> xfce-multimedia.bb:PNBLACKLIST[packagegroup-xfce-multimedia] ?= "Runtime
> depends on blacklisted xfmpc"
> meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb:
> PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted mpd"
> meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb:
> PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted
> xfce4-mpc-plugin"
> meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb:
> PNBLACKLIST[xfce4-mpc-plugin] ?= "Runtime depends on blacklisted
> xfce4-mpc-plugin-dev"
> meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb:PNBLACKLIST[xfmpc] ?=
> "Runtime depends on blacklisted mpd"
> meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb:PNBLACKLIST[xfmpc] ?=
> "Runtime depends on blacklisted xfmpc-dev"
> meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb:PNBLACKLIST[xfmpc] ?=
> "Runtime depends on blacklisted xfmpc"
> meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.2.6.bb:
> PNBLACKLIST[xfce4-sensors-plugin] ?= "Depends on blacklisted lmsensors"
> meta-xfce/recipes-panel-plugins/verve/xfce4-verve-plugin_1.1.0.bb:
> PNBLACKLIST[xfce4-verve-plugin] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130622/"
> meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-
> whiskermenu-plugin_2.0.3.bb:PNBLACKLIST[xfce4-whiskermenu-plugin] ?=
> "Runtime depends on blacklisted menulibre"
> meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb:
> PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on
> blacklisted xfce4-mixer"
> meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb:
> PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on
> blacklisted xfce4-verve-plugin"
> meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb:
> PNBLACKLIST[packagegroup-xfce-extended] ?= "Runtime depends on
> blacklisted ristretto"
> meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb:PNBLACKLIST[tumbler] ?=
> "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/132828/"
> meta-qt5:
> meta-smartphone:
> meta-fso/recipes-freesmartphone/cornucopia/fso-apm_git.bb:PNBLACKLIST[fso-apm]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsoaudiod_0.12.0.bb:PNBLACKLIST[fsoaudiod]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsoaudiod_git.bb:PNBLACKLIST[fsoaudiod]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsodatad_0.12.0.bb:PNBLACKLIST[fsodatad]
> ?= "Depends on blands on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsonetworkd_0.12.0.bb:PNBLACKLIST[fsonetworkd]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsonetworkd_git.bb:PNBLACKLIST[fsonetworkd]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsoraw_git.bb:PNBLACKLIST[fsoraw]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsotdld_0.12.0.bb:PNBLACKLIST[fsotdld]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsotdld_git.bb:PNBLACKLIST[fsotdld]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsousaged_0.12.0.bb:PNBLACKLIST[fsousaged]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/fsousaged_git.bb:PNBLACKLIST[fsousaged]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_0.12.0.bb:PNBLACKLIST[libfsoframework]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/libfsoframework_git.bb:PNBLACKLIST[libfsoframework]
> ?= "Depends on blacklisted libfso-glib"
> meta-fso/recipes-freesmartphone/cornucopia/mkdump_git.bb:PNBLACKLIST[mkdump]
> ?= "Depends on blacklisted libfsoframework"
> meta-fso/recipes-freesmartphone/cornucopia/mterm2_git.bb:PNBLACKLIST[mterm2]
> ?= "Depends on blacklisted libfsoframework"
> meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_0.10.1.bb:
> PNBLACKLIST[frameworkd] ?= "Runtime depends on blacklisted fsousaged"
> meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_git.bb:
> PNBLACKLIST[frameworkd] ?= "Runtime depends on blacklisted fsousaged"
> meta-fso/recipes-freesmartphone/freesmartphone/frameworkd_git.bb:
> PNBLACKLIST[frameworkd] ?= "Runtime depends on blacklisted frameworkd-dev"
> meta-fso/recipes-freesmartphone/freesmartphone/fso-gpsd_git.bb:
> PNBLACKLIST[fso-gpsd] ?= "Runtime depends on blacklisted fso-gpsd-dev"
> meta-fso/recipes-freesmartphone/freesmartphone/fso-gsm0710muxd_git.bb:
> PNBLACKLIST[fso-gsm0710muxd] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130517/"
> meta-fso/recipes-freesmartphone/freesmartphone/libframeworkd-glib_git.bb:
> PNBLACKLIST[libframeworkd-glib] ?= "BROKEN: many errors when building
> with gcc-6"
> meta-fso/recipes-freesmartphone/freesmartphone/
> libfso-glib_2012.07.27.2.bb:PNBLACKLIST[libfso-glib] ?= "Depends on
> blacklisted vala-dbus-binding-tool"
> meta-fso/recipes-freesmartphone/freesmartphone/libfso-glib_git.bb:
> PNBLACKLIST[libfso-glib] ?= "Depends on blacklisted
> vala-dbus-binding-tool"
> meta-fso/recipes-freesmartphone/freesmartphone/mickeyterm_git.bb:
> PNBLACKLIST[mickeyterm] ?= "Runtime depends on blacklisted
> fso-gsm0710muxd"
> meta-fso/recipes-freesmartphone/freesmartphone/opimd-utils_git.bb:
> PNBLACKLIST[opimd-utils] ?= "Runtime depends on blacklisted ffphonelog"
> meta-fso/recipes-freesmartphone/freesmartphone/zhone_git.bb:PNBLACKLIST[zhone]
> ?= "rdepends on python-pycairo which was removed"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted fsoaudiod-config"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted mkdump"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted fsonetworkd"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACs on blacklisted fsogsmd"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted mterm2"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted fsodeviced"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted fsotdld"
> meta-fso/recipes-freesmartphone/packagegroups/
> packagegroup-fso2-compliance.bb:PNBLACKLIST[packagegroup-fso2-compliance]
> ?= "Runtime depends on blacklisted fsousaged"
> meta-shr/recipes-shr/3rdparty/advancedcaching_git.bb:PNBLACKLIST[advancedcaching]
> ?= "RDEPENDS on python-pygtk was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/atd-over-fso_0.70.bb:PNBLACKLIST[atd-over-fso]
> ?= "Fails to build with RSS http://errors.yoctoproject.
> org/Errors/Details/130540/"
> meta-shr/recipes-shr/3rdparty/atrack_svn.bb:PNBLACKLIST[atrack] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/babiloo-efl_2.0.9-10.bb:PNBLACKLIST[babiloo-efl]
> ?= "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl]
> ?= "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl]
> ?= "Runtime depends on blacklisted babiloo-efl"
> meta-shr/recipes-shr/3rdparty/babiloo-efl_bzr.bb:PNBLACKLIST[babiloo-efl]
> ?= "Runtime depends on blacklisted babiloo-efl-dev"
> meta-shr/recipes-shr/3rdparty/chroneo_svn.bb:PNBLACKLIST[chroneo] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/ecalc_git.bb:PNBLACKLIST[ecalc] ?= "Runtime
> depends on blacklisted python-edbus"
> meta-shr/recipes-shr/3rdparty/ecalc_git.bb:PNBLACKLIST[ecalc] ?= "Runtime
> depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/emtooth2_svn.bb:PNBLACKLIST[emtooth2] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/estardict_0.7.bb:PNBLACKLIST[estardict] ?=
> "Depends on blacklisted elementary"
> meta-shr/recipes-shr/3rdparty/ffalarms_git.bb:PNBLACKLIST[ffalarms] =
> "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/ffphonelog_git.bb:PNBLACKLIST[ffphonelog]
> ?= "Depends on blacklisted libeflvala"
> meta-shr/recipes-shr/3rdparty/guitartune_svn.bb:PNBLACKLIST[guitartune]
> ?= "Depends on blacklisted libglade"
> meta-shr/recipes-shr/3rdparty/gwaterpas_0.3.bb:PNBLACKLIST[gwaterpas] ?=
> "broken: depends on blacklisted fltk"
> meta-shr/recipes-shr/3rdparty/iliwi_git.bb:PNBLACKLIST[iliwi] = "Doesn't
> build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/intone_git.bb:PNBLACKLIST[intone] =
> "rdepends on blacklisted mplayer2"
> meta-shr/recipes-shr/3rdparty/jefliks_git.bb:PNBLACKLIST[jefliks] ?=
> "depends on blacklisted iksemel"
> meta-shr/recipes-shr/3rdparty/minneo_svn.bb:PNBLACKLIST[minneo] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/mokojeweled_git.bb:PNBLACKLIST[mokojeweled]
> ?= "Depends on blacklisted elementary"
> meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=
> "Runtime depends on blacklisted python-edbus"
> meta-shr/recipes-shr/3rdparty/neolight_svn.bb:PNBLACKLIST[neolight] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/neomis_svn.bb:PNBLACKLIST[neomi depends on
> blacklisted om-neon"
> meta-shr/recipes-shr/3rdparty/omext_0.2.bb:PNBLACKLIST[omext] ?= "Fails
> to build with RSS http://errors.yoctoproject.org/Errors/Details/130539/"
> meta-shr/recipes-shr/3rdparty/openmoko-gps_svn.bb:PNBLACKLIST[openmoko-gps]
> ?= "RDEPENDS on python-pygtk which was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/pisi_0.5.3.bb:PNBLACKLIST[pisi] ?=
> "RDEPENDS on python-pygtk which was removed from oe-core"
> meta-shr/recipes-shr/3rdparty/podboy_svn.bb:PNBLACKLIST[podboy] ?=
> "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with
> bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
> meta-shr/recipes-shr/3rdparty/rtmom_0.1.3.bb:PNBLACKLIST[rtmom] ?=
> "Depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/sensmon_git.bb:PNBLACKLIST[sensmon] =
> "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/3rdparty/spojegui_svn.bb:PNBLACKLIST[spojegui] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/3rdparty/vagalume_0.8.5.bb:PNBLACKLIST[vagalume] ?=
> "Depends on blacklisted gstreamer"
> meta-shr/recipes-shr/3rdparty/valacompass_git.bb:PNBLACKLIST[valacompass]
> = "Doesn't build after vala upgrade from 0.24.0 to 0.26.1"
> meta-shr/recipes-shr/games/aceofpenguins_1.4.bb:PNBLACKLIST[aceofpenguins]
> ?= "BROKEN: fails to build with new binutils-2.27"
> meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=
> "Depends on blacklisted libsdl-ttf"
> meta-shr/recipes-shr/games/mokomaze_0.5.5.bb:PNBLACKLIST[mokomaze] ?=
> "Depends on blacklisted ode"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted mokomaze"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted dates"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted dbus-daemon-proxy"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted guitartune"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted illume-keyboard-default-numeric"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted e-tasks"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted enjoy"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted mokojeweled"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted estardict"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted gpe-scap"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted ffphonelog"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted om-neon"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-feed.bb:PNBLACKLIST[packagegroup-shr-feed]
> ?= "Runtime depends on blacklisted elfe"
> meta-shr/recipes-shpends on blacklisted libphone-ui-shr"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr-minimal.bb:
> PNBLACKLIST[packagegroup-shr-minimal] ?= "Runtime depends on blacklisted
> ffphonelog"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
> ?= "Runtime depends on blacklisted packagegroup-cli-tools-debug"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
> ?= "Runtime depends on blacklisted packagegroup-shr-minimal-cli"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
> ?= "Runtime depends on blacklisted packagegroup-cli-tools"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
> ?= "Runtime depends on blacklisted packagegroup-shr-minimal-apps"
> meta-shr/recipes-shr/packagegroups/packagegroup-shr.bb:PNBLACKLIST[packagegroup-shr]
> ?= "Runtime depends on blacklisted vagalume"
> meta-shr/recipes-shr/shr/e-wm-config-illume2-shr_git.bb:PNBL
> ACKLIST[e-wm-config-illume2-shr] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130520/"
> meta-shr/recipes-shr/shr/libphone-ui-shr_git.bb:PNBLACKLIST[libphone-ui-shr]
> ?= "Depends on blacklisted elementary"
> meta-shr/recipes-shr/shr/libphone-ui_git.bb:PNBLACKLIST[libphone-ui] ?=
> "Depends on blacklisted libfso-glib"
> meta-shr/recipes-shr/shr/phonefsod_git.bb:PNBLACKLIST[phonefsod] ?=
> "Depends on blacklisted libfso-glib"
> meta-shr/recipes-shr/shr/phoneuid_git.bb:PNBLACKLIST[phoneuid] ?=
> "Depends on blacklisted libfso-glib"
> meta-shr/recipes-shr/shr/shr-e-gadgets_git.bb:PNBLACKLIST[shr-e-gadgets]
> ?= "Depends on blacklisted elementary"
> meta-shr/recipes-shr/shr/shr-installer_git.bb:PNBLACKLIST[shr-installer]
> ?= "Depends on blacklisted packagekit"
> meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings] ?=
> "Runtime depends on blacklisted python-edbus"
> meta-shr/recipes-shr/shr/shr-settings_git.bb:PNBLACKLIST[shr-settings] ?=
> "Runtime depends on blacklisted python-elementary"
> meta-shr/recipes-shr/shr/shr-wizard_git.bb:PNBLACKLIST[shr-wizard] ?=
> "Depends on blacklisted e-wm"
> meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNB
> LACKLIST[e-wm-theme-illume-neo] ?= "Runtime depends on blacklisted e-wm"
> meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNB
> LACKLIST[e-wm-theme-illume-neo] ?= "Runtime depends on blacklisted
> e-wm-theme-illume-neo-dev"
> meta-shr/recipes-shr/themes/e-wm-theme-illume-neo_git.bb:PNB
> LACKLIST[e-wm-theme-illume-neo] ?= "Runtime depends on blacklisted
> e-wm-theme-illume-neo"
> meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:
> PNBLACKLIST[gtk-theme-clearlooks-gtkrc] ?= "Runtime depends on
> blacklisted gtk-theme-clearlooks"
> meta-shr/recipes-shr/themes/gtk-theme-clearlooks-gtkrc.bb:
> PNBLACKLIST[gtk-theme-clearlooks-gtkrc] ?= "Runtime depends on
> blacklisted gtk-theme-clearlooks-gtkrc-dev"
> meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-neo]
> ?= "Runtime depends on blacklisted e-wm"
> meta-shr/recipes-shr/themes/icon-theme-neo_git.bb:PNBLACKLIST[icon-theme-neo]
> ?= "Runtime depends on blacklisted icon-theme-neo-dev"
> meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:P
> NBLACKLIST[phoneui-shr-theme-neo] ?= "Runtime depends on blacklisted
> libphone-ui-shr"
> meta-shr/recipes-shr/themes/phoneui-shr-theme-neo_git.bb:P
> NBLACKLIST[phoneui-shr-theme-neo] ?= "Runtime depends on blacklisted
> phoneui-shr-theme-neo-dev"
> meta-shr/recipes-shr/themes/phoneui-shr-theme-niebiee_git.
> bb:PNBLACKLIST[phoneui-shr-theme-niebiee] ?= "Runtime depends on
> blacklisted libphone-ui-shr"
> meta-shr/recipes-shr/themes/phoneui-LIST[shr-theme-niebiee] ?= "Runtime
> depends on blacklisted phoneui-shr-theme-niebiee"
> meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-niebiee]
> ?= "Runtime depends on blacklisted shr-theme-niebiee"
> meta-shr/recipes-shr/themes/shr-theme-niebiee.bb:PNBLACKLIST[shr-theme-niebiee]
> ?= "Runtime depends on blacklisted shr-theme-niebiee-dev"
> meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2] ?=
> "Runtime depends on blacklisted phoneui-shr-theme-o2"
> meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2] ?=
> "Runtime depends on blacklisted shr-theme-o2"
> meta-shr/recipes-shr/themes/shr-theme-o2.bb:PNBLACKLIST[shr-theme-o2] ?=
> "Runtime depends on blacklisted shr-theme-o2-dev"
> meta-webos-ports:
> meta-luneos/recipes-luneos/luna-webappmanager/luna-webappmanager.bb:
> PNBLACKLIST[luna-webappmanager] ?= "BROKEN: needs to be adapted to new
> qt-5.7"
> meta-luneui/recipes-luneui/luna-next/luna-next.bb:PNBLACKLIST[luna-next]
> ?= "BROKEN: needs to be adapted to new qtwayland-5.7"
> PNBLACKLIST[android-system] = "depends on lxc from meta-virtualiazation
> which isn't included in my world builds"
> PNBLACKLIST[bigbuckbunny-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[bigbuckbunny-480p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[bigbuckbunny-720p] = "big and doesn't really need to be tested
> so much"
> PNBLACKLIST[tearsofsteel-1080p] = "big and doesn't really need to be
> tested so much"
> PNBLACKLIST[build-appliance-image] = "tries to include whole downloads
> directory in /home/builder/poky :/"
> PNBLACKLIST[linux-yocto-tiny-kexecboot] = "does weird sh!t breaking other
> kernels and modules - broken for years"
> PNBLACKLIST[linux-yocto-tiny] = "does weird sh!t breaking other kernels
> and modules - broken for years"
>
>
> QA issues by type:
> count: 0        issue: already-stripped
>
>
> count: 0        issue: libdir
>
>
> count: 0        issue: textrel
>
>
> count: 0        issue: build-deps
>
>
> count: 0        issue: file-rdeps
>
> count: 680      issue: version-going-backwards
> audiofile-0.3.6: Package version for package audiofile-bin went backwards
> which would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-bin went backwards
> which would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-dbg went backwards
> which would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-dbg went backwards
> which would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-dev went backwards
> which would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-dev went backwards
> which would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-doc went backwards
> which would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-doc went backwards
> which would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0)
> [version-going-backwards]
> audiofile-0.3.6: Package version for package audiofile-locale went
> backwards which would break package feeds from (0:0.3.6-r0.4 to
> 0:0.3.6-r0.0) [version-g0:0.3.6-r0.5 to 0:0.3.6-r0.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-dbg
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-dbg
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-dev
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-dev
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-doc
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates-doc
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ca went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ca went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-cs went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-cs went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-da went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-da went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-de went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-de went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-en-gb went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-en-gb went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0) )
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-eu went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-eu went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-fi went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-fi went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-fr went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-fr went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-gl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-gl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-hu went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-hu went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-id went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-id went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-it went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-it went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ja went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ja went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0kage
> version for package dates-locale-nl went backwards which would break
> package feeds from (0:0.4.11+git0+514185dc1f-r9.55 to
> 0:0.4.11+git0+514185dc1f-r9.0) [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-nl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pa went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pa went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pt-br went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-pt-br went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ru went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-ru went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-sl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-sl went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-sv went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-sv went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-th went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-locale-th went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1reak package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-staticdev went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package
> dates-staticdev went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.55 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> dates-0.4.11+gitAUTOINC+514185dc1f: Package version for package dates
> went backwards which would break package feeds from
> (0:0.4.11+git0+514185dc1f-r9.65 to 0:0.4.11+git0+514185dc1f-r9.0)
> [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-dbg went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-dbg went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-dev went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-dev went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-doc went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-doc went backwards
> which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-eolian went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-eolian went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-locale went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-locale went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-staticdev went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-staticdev went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.57 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-tests went
> backwards which would break package feeds from (2:0.1.0+svnr82070-r0.47 to
> 2:0.1.0+svnr82070-r0.0) [version-going-backwards]
> epdf-0.1.0+svnr82070: Package version for package epdf-tests went
> backwards which would break package feeds fh would break package feeds from
> (0:0.2.36-r1.58 to 0:0.2.36-r1.0) [version-going-backwards]
> esound-0.2.36: Package version for package esd-utils went backwards which
> would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esd-utils went backwards which
> would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esd went backwards which would
> break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esd went backwards which would
> break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-dbg went backwards which
> would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-dbg went backwards which
> would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-dev went backwards which
> would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-dev went backwards which
> would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-doc went backwards which
> would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-doc went backwards which
> would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-locale went backwards
> which would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-locale went backwards
> which would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-staticdev went backwards
> which would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound-staticdev went backwards
> which would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound went backwards which
> would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0)
> [version-going-backwards]
> esound-0.2.36: Package version for package esound went backwards which
> would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-browser-plugin went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-browser-plugin went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-dbg went backwards which
> would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-dbg went backwards which
> would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-dev went backwards which
> would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-ds]
> evince-3.18.2: Package version for package evince-locale-an went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-an went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ar went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ar went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ast went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ast went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-as went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-as went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-be+latin went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-be+latin went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-be went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-be went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bg went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bg went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bn-in went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bn-in went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bn went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bn went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-br went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-br went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-bs went backwards
> which would break package feeds from (0:3.18. would break package feeds
> from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-cs went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-cy went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-cy went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-da went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-da went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-de went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-de went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-dz went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-dz went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-el went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-el went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en-ca went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en-ca went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en-gb went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en-gb went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en+shaw went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-en+shaw went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-eo went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-eo went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-es went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package versionckage evince-locale-fa went backwards which
> would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fi went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fi went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fr went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fr went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fur went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-fur went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ga went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ga went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gd went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gd went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gl went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gl went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gu went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-gu went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-he went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-he went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-hi went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-hi went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-hu went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-hu went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-ckwards]
> evince-3.18.2: Package version for package evince-locale-it went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ja went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ja went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ka went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ka went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-kk went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-kk went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-km went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-km went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-kn went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-kn went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ko went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ko went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ks went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ks went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ku went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ku went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-lt went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-lt went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-lv went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-lv went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ml went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ml went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-mn went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-mn went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-mr went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-mr went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ms went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ms went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-my went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-my went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nb went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nb went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nds went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nds went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ne went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ne went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nl went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nl went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nn went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-nn went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-oc went backwards
> which would break pa18.2-r5.65 to 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pl went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pl went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ps went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ps went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pt-br went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pt-br went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pt went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-pt went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ro went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ro went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ru went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ru went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-rw went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-rw went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-si went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-si went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sk went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sk went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sl went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sl went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sq went backwards
> which wokwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-sv went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ta went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ta went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-te went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-te went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-tg went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-tg went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-th went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-th went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-tr went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-tr went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ug went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-ug went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-uk went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-uk went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-vi went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-vi went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-wa went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-wa went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-zh-cn went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for pauld break package feeds from
> (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-locale-zu went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-nautilus-extension went
> backwards which would break package feeds from (0:3.18.2-r5.56 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-nautilus-extension went
> backwards which would break package feeds from (0:3.18.2-r5.65 to
> 0:3.18.2-r5.0) [version-going-backwards]
> evince-3.18.2: Package version for package evince-staticdev went backwards
> which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince-staticdev went backwards
> which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince went backwards which
> would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evince-3.18.2: Package version for package evince went backwards which
> would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-dbg went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-dbg went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-dev went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-dev went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-doc went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-doc went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-am went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-am went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ar went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: POINC+a9e4e74ec4:
> Package version for package evolution-data-server-locale-as went
> backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-as went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-az went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-az went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-be went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-be went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bg went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bg went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bn-in went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bn-in went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bs went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-bs went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version
> for.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ca went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-cs went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-cs went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-cy went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-cy went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-da went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-da went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-de went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-de went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-dz went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-dz went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-el went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-el went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-en-au went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goingversion-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-en-gb went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-en-gb went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-en+shaw went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-en+shaw went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-eo went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-eo went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-es went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-es went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-et went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-et went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-eu went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-eu went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-fa went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-fa went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> ec4: Package version for package evolution-data-server-locale-fr went
> backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ga went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ga went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-gl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-gl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-gu went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-gu went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-he went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-he went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-hi went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-hi went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-hr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-hr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-hu went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-le-is went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-is went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-it went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-it went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ja went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ja went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ka went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ka went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-kn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-kn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ko went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ko went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ku went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ku went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-lt went backwards which would break
> pac for package evolution-data-server-locale-lv went backwards which
> would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mai went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mai went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ml went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ml went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-mr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ms went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ms went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-nb went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-local4ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-nl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-nn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-nn went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-oc went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-oc went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-or went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-or went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pa went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pa went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pt-br went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pt-br went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-pt went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ecata-server-locale-ro went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ru went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ru went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-rw went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-rw went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-si went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-si went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sl went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sq went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sq went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sr+latin went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sr+latin went back74ec4: Package
> version for package evolution-data-server-locale-sv went backwards which
> would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-sv went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ta went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ta went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-te went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-te went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-th went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-th went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-tr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-tr went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ug went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-ug went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-uk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-uk went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolutiage version for package evolution-data-server-locale-wa
> went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-xh went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-xh went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-cn went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-cn went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-hk went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-hk went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-tw went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-locale-zh-tw went backwards which would
> break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-staticdev went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server-staticdev went backwards which would break
> package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to
> 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package evolution-data-server went backwards which would break package
> feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libcamel-dev went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libcamel-dev went backwards which woulda9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libebook-dev went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libebook went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libebook went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libecal-dev went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libecal-dev went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libecal went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libecal went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-book-dev went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-book-dev went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-book went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-book went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-cal-dev went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-cal-dev went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-cal went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedata-cal went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+git-r0.0) [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedataserverui-dev went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedataserverui went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedataserverui went backwards which would break package feeds
> from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedataserver went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: Package version for
> package libedataserver went backwards which would break package feeds from
> (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-dbg went backwards
> which would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-dbg went backwards
> which would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-dev went backwards
> which would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-dev went backwards
> which would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-doc went backwards
> which would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-doc went backwards
> which would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-locale went backwards
> which would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-locale went backwards
> which would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-staticdev went
> backwards which would break package feeds from (0:1.9.6-r0.26 to
> 0:1.9.6-r0.0) [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo-staticdev went
> backwards which would break package feeds from (0:1.9.6-r0.29 to
> 0:1.9.6-r0.0) [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo went backwards which
> would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0)
> [version-going-backwards]
> nostromo-1.9.6: Package version for package nostromo went backwards which
> would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0)
> [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-dbg went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-dbg went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> opencon0.57 to 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-bs went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-bs went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-cs went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-cs went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-de went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-de went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-el went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-el went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-en-gb
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-en-gb
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-en-us
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-en-us
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-es went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-es went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-eu went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-eu went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-fi went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-fi went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-fr went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-fr went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> opencld break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0)
> [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-id went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-lt went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-lt went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-nl went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-nl went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pa went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pa went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pl went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pl went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pt-br
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pt-br
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pt went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-pt went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sk went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sk went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sl went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sl went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sr+latin
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sr+latin
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-sr went
> backwards which would break package feeds from (0:7.06-r0.50 to 0feeds from
> (0:7.06-r0.57 to 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-uk went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-uk went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-zh-cn
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-zh-cn
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-zh-tw
> went backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-locale-zh-tw
> went backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-staticdev went
> backwards which would break package feeds from (0:7.06-r0.50 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect-staticdev went
> backwards which would break package feeds from (0:7.06-r0.57 to
> 0:7.06-r0.0) [version-going-backwards]
> openconnect-7.06: Package version for package openconnect went backwards
> which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0)
> [version-going-backwards]
> openconnect-7.06: Package version for package openconnect went backwards
> which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-dbg went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-dbg went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-dev went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-dev went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-doc went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-doc went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-locale went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Package version for package
> openflow-locale went backwards which would break package feeds from
> (0:1.0+git0+c84f33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0)
> [version-going-backwards]
> openflow-1.0+gitAUTOINC+c84f33f09d: Pacpd-2.27.0: Package version for
> package sthttpd-dbg went backwards which would break package feeds from
> (0:2.27.0-r0.35 to 0:2.27.0-r0.0) [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-dbg went backwards
> which would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-dev went backwards
> which would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-dev went backwards
> which would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-doc went backwards
> which would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-doc went backwards
> which would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-locale went backwards
> which would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-locale went backwards
> which would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-staticdev went
> backwards which would break package feeds from (0:2.27.0-r0.35 to
> 0:2.27.0-r0.0) [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd-staticdev went
> backwards which would break package feeds from (0:2.27.0-r0.40 to
> 0:2.27.0-r0.0) [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd went backwards which
> would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0)
> [version-going-backwards]
> sthttpd-2.27.0: Package version for package sthttpd went backwards which
> would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0)
> [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-dbg went
> backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-dev went
> backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-doc went
> backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ar
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ast
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-bg
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ca
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-cs
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-da
> went backwards which would break package feeds from version for package
> xfce4-notifyd-locale-es went backwards which would break package feeds from
> (0:0.3.4-r0.7 to 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-eu
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-fi
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-fr
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-gl
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-he
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-hr
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-hu
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-id
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-is
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-it
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ja
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-kk
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ko
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-lt
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-lv
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ms
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-nb
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-nl
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-oc
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0-0.3.4: Package version for package xfce4-notifyd-locale-ru
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-si
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sk
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sl
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sq
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sr
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sv
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-th
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-tr
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ug
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-uk
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-vi
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package
> xfce4-notifyd-locale-zh-cn went backwards which would break package feeds
> from (0:0.3.4-r0.7 to 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package
> xfce4-notifyd-locale-zh-tw went backwards which would break package feeds
> from (0:0.3.4-r0.7 to 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-staticdev
> went backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
> xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd went
> backwards which would break package feeds from (0:0.3.4-r0.7 to
> 0:0.3.4-r0.0) [version-going-backwards]
>
> count: 0        issue: host-user-contaminated
>
>
> count: 0        issue: installed-vs-shipped
>
>
> count: 0        issue: unknown-configure-option
>
>
> count: 0        issue: symlink-to-sysroot
>
>
> count: 0        issue: invalid-pkgconfig
>
>
> count: 0        issue: pkgname
>
>
>
> == Tested changes (not included in master yet) - bitbake ==
> latest upstream commit:
> 95deeca bitbake: Update version to 1.33.1
> not included in master yet:
> 092fbe1 world-image: add extra target
>
> == Tested changes (not included in master yet) - openembedded-core ==
> latest upstream commit:
> d110937 nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH
> not included in master yet:
> 9ba4e6b qemux86: Add identical qemux86copy variant for tests
> 8133fcb sstate-sysroot-cruft.sh: Extend the whitelist
> 000825b recipes: Replace "cp -a" with "cp -R --no-dereference
> --preserve=mode,links"
> 439c821 buildhistory.bbclass: metadata-revs show repo parent
> fbae6ba metadata-revs: provide more information
> 2a382e6 report-error: Allow to upload reports automatically
> 6484b5c flex: upgrade to 2.6.3
> f2f4b7a Revert "flex: upgrade to 2.6.3"
> 8594575 Revert "flex: upgrade to 2.6.2"
> 74a17cc core-image-tiny-initramfs: drop wic from IMAGE_FSTYPES
> 6154e0d libxslt: Add build fix (with ld-is-gold)
>
> == Tested changes (not included in master yet) - meta-openembedded ==
> latest upstream commit:
> 5ecbf9b poppler: update to 0.51.0
> not included in master yet:
> ab4369c kodi: Add krypton/17.0 recipe
> 99fce36 kodi: Fix build with pic on x86_64
> eb45dac kodi-17: Add packageconfig for lcms support
> 610e094 kodi-17: Fix build with musl
> bd28b29 kodi-17: Upgrade 17.0 release
> 54edcc5 kodi-17: Recommend python-ctpes for addons to work
> e5d5867 kodi-17: Fix build for qemuarm and update to latest
> 300d230 rsyslog: use atomic builtins to avoid race issue
> b9c6c88 fwts: upgrade to 17.01.00 release
> d77049f picocom: Fix build
> 370553b onboard: initial add 1.3.0
> 4a7fe83 nginx: update to version 1.11.8
> a239276 python-ipaddress: update to version 1.0.18
> b74c656 python-flask-bootstrap: update to version 3.3.7.1
> 585dd41 python-netaddr: update to version 0.7.19
> fcc4940 tremor: add (from oe-core)
> 5601936 xfce: add dbus-glib-native to DEPENDS to fix do_configure
> 18771a9 luajit: mips and mipsel are 32bit targets too
> 9fb591a libgphoto2: remove bash runtime dependency.
> 8241ef0 python-selectors34: add new recipe for version 1.1
> ebe26af python-serpent: add new recipe for version 1.16
> b7eb68c python-pyro4: update to version 4.53
> 7cada0a python-psutil: upgrade to version 5.0.1
> f091501 python-click: update to version 6.7
> 396efbc python-cffi: Fix build for per-recipe sysroot.
> 7e7fd56 python-ndg-httpsclient: Fix build for per recipe sysroot.
> 0db057d python-pyopenssl: Fix build for per recipe sysroot.
> d307c4f jack: add ARM NEON support for sample conversions
> e79566f nano: upgrade to 2.7.4
> ebef449 remove some more True options to getVar calls
> 960acf8 multipath-tools: fix building of shared objects
> bc34c97 multipath-tools: update to 0.6.4
> dc1d8fa opencv: Configure freetype via PACKAGECONFIG
> a0f5552 libnet-ssleay-perl: fix build error
> 47d1e27 python-cffi: Don't overwrite inherited dependencies
> b4acda8 python-pyopenssl: Don't overwrite inherited dependencies
> 63bdd4f python3-multidict: make repeated builds work even without sphinx
> e8d5a1b python-pyyaml: add dependency on python
> 91d4dd4 python-pytz: update to 2016.10
> f4559c4 gst-instruments: add recipe
> 0d80e47 vboxguestdrivers: upgrade to 5.1.14 to fix compatibility with 4.9
> kernel
> a975cd8 geoclue: add missing dependency on gobject-introspection-native
> 83b9dc3 typing: add version 3.5.3.0
> f7aaa34 m2crypto: depend on typing
> bab0cf6 udisks2: add libxslt-native to DEPENDS for xsltproc to be in
> sysroot
> db9b1ea python-idna: update to version 2.2
> fbda6b5 python-pybind11: Update to version 2.0.1
> 1c376ec python-pyudev: update to version 0.21.0
> cc255f9 python-cryptography-vectors: add to the DEPENDS rather than replace
> a8a0efe python-ndg-httpsclient: add to the DEPENDS rather than replace
> bda2d65 python-requests: update to version 2.13.0
> 131008e python-lxml: update to version 3.7.2
> 2c21e3b python-pytest: update version to 3.0.6
> 1d1a43b nginx: handle systemd service file
> 2ede2eb postgresgl: update to 9.4.10 and build fix
> 3527257 libatasmart: unify the complier and CFLAGS for host build
> 8a0667b ipmiutil: fix build issue
> 2b6cad9 iperf: remove depricated package
> a625494 python-pycrypto: add app to meta-python
> 7c0c45c lm_sensors: update SRC_URI
> 8731b65 udisks: add missing hard dependency
> 547c047 initramfs-kexecboot-image: disable runtime dependency on
> run-postinsts
> 8c03a06 linux-yocto-tiny-kexecboot: remove obsoleted recipe
> 2def6f6 lvm2: remove unbuildable 2.02.138
> f732d17 fuse: support native compilation
> 4071e6b lvm2: enable native compilation
> 2ef3979 cryptsetup: enable native compilation
> 338980d procmail: avoid bashism in do_install
> 85fac0e python-pbr: change the dependency to be a RDEPENDS and fix build
> issues
> 927657d gateone: correct the inherit to use setuptools
> 09d3d56 python-pyalsaaudio: update to version 0.8.2
> c0416d4 python-thrift: update to version 0.10.0
> 4d5e97e python-werkzeug: update to version 0.11.15
> 773200a python-sqlalchemy: update to version 1.1.5
> 3b1ea98 python-py: update to version 1.4.32
> dfbe6cf apache: use the APACHE_MIRROR variable in the SRC_URI
> 79c03f5 nginx: update to version 1.10.3
> 663f827 nginx: update to version 1.11.9
> 26e52a2 udisks: Make use of bitbake variables for sbin, lib locations.
> d614f8c dconf: depends on dbus
> f2b6681 dconf: fix bash completion in wrong package
> f93ea40 dconf: make gtk+3 dependency optional
> 63d64b8 libev: Add recipe for version 4.24
> 28528c4 libuv: Add recipe for version 1.10.2
> 7013979 libwebsockets: Add recipe for version 2.1.0
> f87a2b0 glibmm: add dependency on glib-2.0-native
> 93a44df exfat-utils: update SRC_URI
> 765ac51 audiofile: add alsa-lib to DEPENDS
> f35f4fb esound: fix build
> 928849a libglade: fix build and cleanup
> ca8ddbe poppler: add qttools-native to qt5 dependency to fix build
> 6f9b762 evolution-data-server: fix build
> 786d11d libgnomeui: fix build
> d34a32c gegl: fix build
> 6bb7f37 gedit: fix build
> ffd750f abiword: fix build
> f501f7a geany: fix build
> 7b62fe8 xfce4-notifyd: add dbus-glib-native to DEPENDS
> 38813ff sthttpd: add base-passwd to DEPENDS
> cfad4ba nostromo: add base-passwd to DEPENDS
> 92a1d82 gnome-disk-utility: add dbus-glib-native to DEPENDS
> b7f480c python-edbus exquisite elementary libeweather unionfs-fuse
> xfsprogs gmtk devilspie2 gnome-backgrounds gnome-desktop gnome-mime-data
> gtk-engines gtksourceview2 libgnomekbd libidl-native onboard libgpewidget
> ubi-utils-klibc kexec-tools-klibc gupnp-igd gupnp-tools dvb-apps gstreamer
> mpd crda netcat-openbsd wireshark gnokii libmbim mosh
> networkmanager-openvpn libtelepathy dbus-daemon-proxy libdbus-c++ php
> vala-dbus-binding-tool collectd libgxim pywbem gtkhtml2 fbida fontforge
> libsexy wayland-fits xstdcmap xf86-video-glamo font-adobe-100dpi
> font-adobe-utopia-100dpi font-bh-100dpi font-bh-lucidatypewriter-100dpi
> font-misc-misc crash a2jmidid libsdl2-mixer libsdl-mixer minidlna sylpheed
> libsdl2-ttf libsdl-ttf ode pidgin postgresql syslog-ng usb-modeswitch
> xdg-user-dirs gateone python3-cryptography-vectors python3-ndg-httpsclient
> python-cryptography-vectors python-pbr bundler netdata menulibre openzone
> xfce4-verve-plugin iperf terminus-font xf86-video-nouveau ipmiutil
> klibc-utils pmbw multipath-tools gparted, gnome-system-monitor, php,
> vala-dbus-binding-tool, gtkmathview, lmsensors, postgresql: Blacklist
> 00ba7da recipes: blacklist recipes depending on blacklisted recipes
> 7f3176f recipes: blacklist recipes runtime depending on blacklisted recipes
> af69342 opensaf: 5.0.0 -> 5.1.0
> 30667c6 lftp: update to 4.7.5 and change SRC_URI source
> ac3d39c tcpdump: upgrade to 4.8.1
> fcd51a9 iscsitarget: Fix call trace of ahash API calling
> 64ccdf5 relayd: derive PV from SRCPV
> a559daa dibbler: fix SRC_URI from ${P} to ${BP}
> c7cff14 iscsitarget: fix inconsistent crash while login to iscsi target
> from initiator
> f9dce8d iscsitarget: use upstream to build with linux kernel >= 4.3
> 67c4b8c iscsitarget: update patch to contain changes required to build
> with only linux v4.8 and above
> 94f3f50 wireshark: update package to 2.2.4
> e13378a inetutils: register hostname.1 man page as an alternate
> 5e9a6d6 lldpd: Update to version 0.9.6
> 698f000 wireshark: fix build issue
> dddbb4d libtdb: fix SRC_URI - http has gone
> 99ff1b5 libtevent: fix SRC_URI - http has gone
> 0a68a21 netkit-ruser: update SRC_URI
> 78a8125 ipsec-tools: change SRC_URI fetcher.
> d7b2bd1 tcpdump: update to 4.9.0 for security fixes
> 038f127 Samba: use built-in libtevent
> 3dbbd50 fetchmail: update SRC_URI
> 5a2ced7 libtalloc: fix SRC_URI to use https instead of http
> dc42430 openflow: inherit pkgconfig
> 78b4921 openconnect: add gettext-native to DEPENDS
> 304cd77 smbnetfs gnome-disk-utility contacts kexecboot geany geany-plugins
> efivar efibootmgr gimp system-config-keyboard tumbler: Blacklist
>
> == Tested changes (not included in master yet) - meta-qt5 ==
> latest upstream commit:
> 8ba2814 qtwebkit: depends on gperf-native
> not included in master yet:
> efa8aaf qmake5_base.bbclass: set qt.conf by environment variable again
> 5acf4e1 populate_sdk_qt5: use _append operator
>
> == Tested changes (not included in master yet) - meta-browser ==
> latest upstream commit:
> dac70ab chromium: split patch 'Remove hard coded values for CC and CXX'
> not included in master yet:
> 7e31067 firefox*: add missing dependencies on zip-native and unzip-native
> 9808dd1 firefox-addon-webconverger: add also unzip-native dependency
> 2747754 chromium-wayland: fix compilation problem on non-X11 builds
> 15b61fd chromium, chromium-wayland: blacklist
>
> == Tested changes (not included in master yet) - meta-webos-ports ==
> latest upstream commit:
> b848230 luneos-package: inhibit default deps and limit do_deploy deps
> not included in master yet:
>
> == Tested changes (not included in master yet) - meta-smartphone ==
> latest upstream commit:
> a04ef72 android-system: restore mount for hal-droid
> not included in master yet:
> 4203314 libhybris: add dependency on wayland-native
> a95e27a fso-gsm0710muxd, atd-over-fso, omext, e-wm-config-illume2-shr:
> Blacklist
> f2dc1e1 recipes: blacklist recipes depending on blacklisted recipes
> 914596e recipes: blacklist recipes runtime depending on blacklisted recipes
>

--001a11477bfee5f27105486ecb47
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I found an issue in the report generation, that it didn&#3=
9;t show failures for BBCLASSEXTENDed recipes, I&#39;ve fixed it in jenkins=
-job.sh and the updated report would look like this:<div><br></div><div><pr=
e style=3D"box-sizing:border-box;white-space:pre-wrap;word-wrap:break-word;=
margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);font-size:14px">INFO: =
jenkins-job.sh-1.8.17 Complete log available at <a href=3D"http://logs.nslu=
2-linux.org/buildlogs/oe/world/pyro/log.report.20170213_094715.log" style=
=3D"box-sizing:border-box;word-wrap:break-word;color:rgb(92,53,102)">http:/=
/logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170213_094715.lo=
g</a>

=3D=3D=3D common (2) =3D=3D=3D
    * virtual:klibc:meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/=
kexecboot_0.6.bb:do_configure
    * virtual:native:meta-openembedded/meta-oe/recipes-support/system-confi=
g-keyboard/system-config-keyboard_1.4.0.bb:do_compile

=3D=3D=3D common-x86 (9) =3D=3D=3D
    * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_com=
pile
    * meta-browser/recipes-browser/chromium/chromium-wayland_53.0.2785.143.=
bb:do_compile
    * meta-openembedded/meta-filesystems/recipes-filesystems/smbnetfs/smbne=
tfs_git.bb:do_prepare_recipe_sysroot
    * meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-d=
isk-utility_2.32.0.bb:do_compile
    * meta-openembedded/meta-gnome/recipes-gnome/pimlico/contacts_git.bb:do=
_configure
    * meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.29.bb:do_con=
figure
    * meta-openembedded/meta-oe/recipes-graphics/gimp/gimp_2.8.18.bb:do_com=
pile
    * meta-openembedded/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb:do=
_configure
    * virtual:native:meta-openembedded/meta-oe/recipes-extended/efivar/efiv=
ar_0.24.bb:do_compile

=3D=3D=3D qemuarm (1) =3D=3D=3D
    * meta-openembedded/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb:do=
_fetch

=3D=3D=3D qemux86 (0) =3D=3D=3D

=3D=3D=3D qemux86_64 (0) =3D=3D=3D
</pre></div><div><br></div><div>And qemuarm is showing less issues, because=
 it was triggered later and has even more PNBLACKLISTs.</div><div><br></div=
><div>I&#39;ll also stop sending the list of PNBLACKLISTs and QA issues and=
 included changes to the ML, because it&#39;s too long and sometimes I&#39;=
ve noticed that there are copy&amp;paste issues when I&#39;m pasting very l=
ong text (not sure if it&#39;s mangled by vim in paste mode or already in c=
hromium when doing Ctrl+C). Interested people can still see it all in the &=
quot;complete log&quot; which is lined above the report.</div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Feb 13, 2017 at =
8:33 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@=
gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">=3D=3D Number of issues - stats =3D=3D<br>
{| class=3D&#39;wikitable&#39;<br>
!|Date=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#=
39;3&#39;|Failed tasks=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0!!colspan=3D&#39;6&#39;|Failed depencencies=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!|Signature=
s=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !!colspan=3D&#39;12&#39;|QA !!Co=
mment<br>
|-<br>
||=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||qemuarm=C2=A0 =C2=A0 =
=C2=A0 =C2=A0||qemux86=C2=A0 =C2=A0 =C2=A0 =C2=A0||qemux86_64=C2=A0 =C2=A0 =
||qemuarm||max||min=C2=A0 =C2=A0 =C2=A0||qemux86||max||min=C2=A0 =C2=A0 =C2=
=A0||all=C2=A0 =C2=A0||already-stripped=C2=A0 =C2=A0 =C2=A0 ||libdir=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ||textrel=C2=A0 =C2=A0 =C2=A0 =C2=A0||build-deps=C2=A0=
 =C2=A0 ||file-rdeps=C2=A0 =C2=A0 ||version-going-backwards=C2=A0 =C2=A0 =
=C2=A0 =C2=A0||host-user-contaminated=C2=A0 =C2=A0 =C2=A0 =C2=A0 ||installe=
d-vs-shipped=C2=A0 ||unknown-configure-option=C2=A0 =C2=A0 =C2=A0 ||symlink=
-to-sysroot=C2=A0 =C2=A0 ||invalid-pkgconfig=C2=A0 =C2=A0 =C2=A0||pkgname=
=C2=A0 =C2=A0 =C2=A0 =C2=A0||<br>
|-<br>
||2017-02-13=C2=A0 =C2=A0 ||1=C2=A0 =C2=A0 =C2=A0||8=C2=A0 =C2=A0 =C2=A0||8=
=C2=A0 =C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0|=
|N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||N/A=C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=
=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||680=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0||0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0||<br>
|}<br>
<br>
<a href=3D"http://www.openembedded.org/wiki/Bitbake_World_Status" rel=3D"no=
referrer" target=3D"_blank">http://www.openembedded.org/<wbr>wiki/Bitbake_W=
orld_Status</a><br>
<br>
=3D=3D Failed tasks 2017-02-13 =3D=3D<br>
<br>
INFO: jenkins-job.sh-1.8.16 Complete log available at <a href=3D"http://log=
s.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170213_093040.log" r=
el=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/<wbr>buildl=
ogs/oe/world/pyro/log.<wbr>report.20170213_093040.log</a><br>
<br>
=3D=3D=3D common () =3D=3D=3D<br>
<br>
=3D=3D=3D common-x86 (8) =3D=3D=3D<br>
=C2=A0 =C2=A0 * meta-browser/recipes-browser/<wbr>chromium/chromium_52.0.27=
43.<wbr>76.bb:do_compile<br>
=C2=A0 =C2=A0 * meta-browser/recipes-browser/<wbr>chromium/chromium-wayland=
_<a href=3D"tel:53.0.2785.143" value=3D"+15302785143">53.0.2785.143</a>.bb:=
<wbr>do_compile<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-<wbr>filesystems/recipes-<wbr>filesy=
stems/smbnetfs/smbnetfs_<wbr>git.bb:do_prepare_recipe_<wbr>sysroot<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-gnome/<wbr>recipes-gnome/gnome-disk-=
<wbr>utility/gnome-disk-utility_2.<wbr>32.0.bb:do_compile<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-gnome/<wbr>recipes-gnome/pimlico/<wb=
r>contacts_git.bb:do_configure<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-oe/<wbr>recipes-devtools/geany/geany=
_<wbr>1.29.bb:do_configure<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-oe/<wbr>recipes-graphics/gimp/gimp_2=
.<wbr>8.18.bb:do_compile<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-xfce/<wbr>recipes-xfce/tumbler/tumbl=
er_<wbr>0.1.31.bb:do_configure<br>
<br>
=3D=3D=3D qemuarm (1) =3D=3D=3D<br>
=C2=A0 =C2=A0 * meta-openembedded/meta-gnome/<wbr>recipes-gnome/pimlico/<wb=
r>contacts_0.9.bb:do_fetch<br>
<br>
=3D=3D=3D qemux86 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D qemux86_64 (0) =3D=3D=3D<br>
<br>
=3D=3D=3D Number of failed tasks (17) =3D=3D=3D<br>
{| class=3Dwikitable<br>
|-<br>
|| qemuarm=C2=A0 =C2=A0 =C2=A0 || 1=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemuarm.20170213_08=
1827.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org=
/<wbr>buildlogs/oe/world/pyro/log.<wbr>world.qemuarm.20170213_081827.<wbr>l=
og/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/32344/" r=
el=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Err=
ors/Build/32344/</a><br>
|-<br>
|| qemux86=C2=A0 =C2=A0 =C2=A0 || 8=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http:/=
/logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86.20170213_05=
4153.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org=
/<wbr>buildlogs/oe/world/pyro/log.<wbr>world.qemux86.20170213_054153.<wbr>l=
og/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/32332/" r=
el=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Err=
ors/Build/32332/</a><br>
|-<br>
|| qemux86_64=C2=A0 =C2=A0|| 8=C2=A0 =C2=A0 =C2=A0|| <a href=3D"http://logs=
.nslu2-linux.org/buildlogs/oe/world/pyro/log.world.qemux86-64.20170213_0726=
47.log/" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/<=
wbr>buildlogs/oe/world/pyro/log.<wbr>world.qemux86-64.20170213_<wbr>072647.=
log/</a> || <a href=3D"http://errors.yoctoproject.org/Errors/Build/32343/" =
rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Er=
rors/Build/32343/</a><br>
|}<br>
=3D=3D=3D PNBLACKLISTs (460) =3D=3D=3D<br>
<br>
=3D=3D=3D QA issues (680) =3D=3D=3D<br>
{| class=3Dwikitable<br>
!| Count=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ||Issue<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||already-stripped<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||build-deps<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||file-rdeps<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||host-user-contaminated<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||installed-vs-shipped<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||invalid-pkgconfig<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||libdir<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||pkgname<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||symlink-to-sysroot<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||textrel<br>
|-<br>
||0=C2=A0 =C2=A0 =C2=A0||unknown-configure-option<br>
|-<br>
||680=C2=A0 =C2=A0||version-going-backwards<br>
|}<br>
<br>
<br>
<br>
=3D=3D=3D Incorrect PACKAGE_ARCH or sstate signatures (0) =3D=3D=3D<br>
<br>
Complete log: <a href=3D"http://logs.nslu2-linux.org/buildlogs/oe/world/pyr=
o/log.signatures.20170213_071600.log/" rel=3D"noreferrer" target=3D"_blank"=
>http://logs.nslu2-linux.org/<wbr>buildlogs/oe/world/pyro/log.<wbr>signatur=
es.20170213_071600.<wbr>log/</a><br>
<br>
=C2=A0 =C2=A0 * ERROR: Nothing RPROVIDES &#39;fsoaudiod&#39; (but /home/jen=
kins/oe/world/shr-<wbr>core/openembedded-core/meta/<wbr>recipes-core/packag=
egroups/<a href=3D"http://packagegroup-base.bb" rel=3D"noreferrer" target=
=3D"_blank">pac<wbr>kagegroup-base.bb</a> RDEPENDS on or otherwise requires=
 it)<br>
=C2=A0 =C2=A0 * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depend=
s on blacklisted libfso-glib<br>
=C2=A0 =C2=A0 * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depend=
s on blacklisted libfso-glib<br>
=C2=A0 =C2=A0 * ERROR: Required build target &#39;meta-world-pkgdata&#39; h=
as no buildable providers.<br>
=C2=A0 =C2=A0 * ERROR: no sigdata files were generated for MACHINE qemux86c=
opy in /home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/stamps<br>
=C2=A0 =C2=A0 * ERROR: Nothing RPROVIDES &#39;fsoaudiod&#39; (but /home/jen=
kins/oe/world/shr-<wbr>core/openembedded-core/meta/<wbr>recipes-core/packag=
egroups/<a href=3D"http://packagegroup-base.bb" rel=3D"noreferrer" target=
=3D"_blank">pac<wbr>kagegroup-base.bb</a> RDEPENDS on or otherwise requires=
 it)<br>
=C2=A0 =C2=A0 * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depend=
s on blacklisted libfso-glib<br>
=C2=A0 =C2=A0 * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depend=
s on blacklisted libfso-glib<br>
=C2=A0 =C2=A0 * ERROR: Required build target &#39;meta-world-pkgdata&#39; h=
as no buildable providers.<br>
=C2=A0 =C2=A0 * ERROR: no sigdata files were generated for MACHINE qemux86 =
in /home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/stamps<br>
=C2=A0 =C2=A0 * ERROR: Nothing RPROVIDES &#39;fsoaudiod&#39; (but /home/jen=
kins/oe/world/shr-<wbr>core/openembedded-core/meta/<wbr>recipes-core/packag=
egroups/<a href=3D"http://packagegroup-base.bb" rel=3D"noreferrer" target=
=3D"_blank">pac<wbr>kagegroup-base.bb</a> RDEPENDS on or otherwise requires=
 it)<br>
=C2=A0 =C2=A0 * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depend=
s on blacklisted libfso-glib<br>
=C2=A0 =C2=A0 * ERROR: fsoaudiod was skipped: Recipe is blacklisted: Depend=
s on blacklisted libfso-glib<br>
=C2=A0 =C2=A0 * ERROR: Required build target &#39;meta-world-pkgdata&#39; h=
as no buildable providers.<br>
=C2=A0 =C2=A0 * ERROR: no sigdata files were generated for MACHINE qemuarm =
in /home/jenkins/oe/world/shr-<wbr>core/tmp-glibc/stamps<br>
<br>
<br>
PNBLACKLISTs:<br>
openembedded-core/:<br>
meta-browser:<br>
recipes-browser/chromium/cef3_<wbr>280796.bb:PNBLACKLIST[cef3] ?=3D &quot;B=
ROKEN: fails to build with gcc-6&quot;<br>
recipes-browser/chromium/<wbr>chromium-wayland_<a href=3D"tel:53.0.2785.143=
" value=3D"+15302785143">53.0.2785.143</a>.bb:PNBLACKLI<wbr>ST[chromium-way=
land] ?=3D &quot;Fails to build <a href=3D"http://errors.yoctoproject.org/E=
rrors/Details/132830/" rel=3D"noreferrer" target=3D"_blank">http://errors.y=
octoproject.<wbr>org/Errors/Details/132830/</a>&quot;<br>
recipes-browser/chromium/<wbr>chromium_52.0.2743.76.bb:PNBLA<wbr>CKLIST[chr=
omium] ?=3D &quot;Fails to build <a href=3D"http://errors.yoctoproject.org/=
Errors/Details/132831/" rel=3D"noreferrer" target=3D"_blank">http://errors.=
yoctoproject.<wbr>org/Errors/Details/132831/</a>&quot;<br>
meta-openembedded:<br>
meta-efl/recipes-devtools/<wbr>python/python-edbus_1.7.0.bb:P<wbr>NBLACKLIS=
T[python-edbus] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors=
.yoctoproject.org/Errors/Details/130600/" rel=3D"noreferrer" target=3D"_bla=
nk">http://errors.yoctoproject.<wbr>org/Errors/Details/130600/</a>&quot;<br=
>
meta-efl/recipes-devtools/<wbr>python/python-efl_1.15.0.bb:PN<wbr>BLACKLIST=
[python-efl] ?=3D &quot;Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-devtools/<wbr>python/python-efl_git.bb:PNBLA<wbr>CKLIST[py=
thon-efl] ?=3D &quot;Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/cpu_<wbr>svn.bb:PNBLACKLIST[cpu] ?=3D &quot;Depend=
s on blacklisted e-wm&quot;<br>
meta-efl/recipes-efl/e17/<wbr>diskio_svn.bb:PNBLACKLIST[<wbr>diskio] ?=3D &=
quot;broken: switch to <a href=3D"https://git.enlightenment.org/enlightenme=
nt/modules/diskio.git/" rel=3D"noreferrer" target=3D"_blank">https://git.en=
lightenment.org/<wbr>enlightenment/modules/diskio.<wbr>git/</a> and fix 0.0=
.1+svnr82070-r0.0/E-<wbr>MODULES-EXTRA/diskio/e-module-<wbr>diskio.edc:58. =
invalid state name: &#39;off&#39;. &quot;default&quot; state must always be=
 first.&quot;<br>
meta-efl/recipes-efl/e17/e-<wbr>tasks_git.bb:PNBLACKLIST[e-<wbr>tasks] ?=3D=
 &quot;Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/e-wm-<wbr>theme-b-and-w_svn.bb:PNBLACKLI<wbr>ST[e-=
wm-theme-b-and-w] ?=3D &quot;Runtime depends on blacklisted e-wm&quot;<br>
meta-efl/recipes-efl/e17/e-wm-<wbr>theme-b-and-w_svn.bb:PNBLACKLI<wbr>ST[e-=
wm-theme-b-and-w] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-b-an=
d-w&quot;<br>
meta-efl/recipes-efl/e17/e-wm-<wbr>theme-b-and-w_svn.bb:PNBLACKLI<wbr>ST[e-=
wm-theme-b-and-w] ?=3D &quot;Runtime depends on blacklisted e-wm-theme-b-an=
d-w-dev&quot;<br>
meta-efl/recipes-efl/e17/e-wm-<wbr>theme-illume-efenniht_svn.bb:P<wbr>NBLAC=
KLIST[e-wm-theme-illume-<wbr>efenniht] ?=3D &quot;Runtime depends on blackl=
isted e-wm&quot;<br>
meta-efl/recipes-efl/e17/e-wm-<wbr>theme-illume-efenniht_svn.bb:P<wbr>NBLAC=
KLIST[e-wm-theme-illume-<wbr>efenniht] ?=3D &quot;Runtime depends on blackl=
isted e-wm-theme-illume-efenniht&quot;<br>
meta-efl/recipes-efl/e17/e-wm_<wbr>0.18.8.bb:PNBLACKLIST[e-wm] ?=3D &quot;D=
epends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/e-wm_<wbr>0.19.10.bb:PNBLACKLIST[e-wm] ?=3D &quot;=
Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/e-wm_<wbr>git.bb:PNBLACKLIST[e-wm] ?=3D &quot;Depe=
nds on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/edje-<wbr>viewer_svn.bb:PNBLACKLIST[<wbr>edje-view=
er] ?=3D &quot;Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/<wbr>elbow_git.bb:PNBLACKLIST[<wbr>elbow] ?=3D &qu=
ot;Depends on blacklisted webkit-efl&quot;<br>
meta-efl/recipes-efl/e17/elfe_<wbr>git.bb:PNBLACKLIST[elfe] ?=3D &quot;Depe=
nds on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/<wbr>elmdentica_svn.bb:PNBLACKLIST[<wbr>elmdentica=
] ?=3D &quot;OLD and depends on broken azy&quot;<br>
meta-efl/recipes-efl/e17/<wbr>emprint_svn.bb:PNBLACKLIST[<wbr>emprint] ?=3D=
 &quot;if you want to use these modules with E18, then you need to update i=
t to git recipe fetching newer sources from <a href=3D"http://git.enlighten=
ment.org/apps/emprint.git/" rel=3D"noreferrer" target=3D"_blank">http://git=
.enlightenment.org/<wbr>apps/emprint.git/</a>&quot;<br>
meta-efl/recipes-efl/e17/<wbr>enjoy_git.bb:PNBLACKLIST[<wbr>enjoy] ?=3D &qu=
ot;Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/<wbr>ephoto_svn.bb:PNBLACKLIST[<wbr>ephoto] ?=3D &=
quot;Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/<wbr>exalt-client_svn.bb:PNBLACKLIS<wbr>T[exalt-cl=
ient] ?=3D &quot;Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/<wbr>exalt_svn.bb:PNBLACKLIST[<wbr>exalt] ?=3D &qu=
ot;Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/<wbr>exquisite_svn.bb:PNBLACKLIST[<wbr>exquisite] =
?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.or=
g/Errors/Details/130619/" rel=3D"noreferrer" target=3D"_blank">http://error=
s.yoctoproject.<wbr>org/Errors/Details/130619/</a>&quot;<br>
meta-efl/recipes-efl/e17/<wbr>flame_svn.bb:PNBLACKLIST[<wbr>flame] ?=3D &qu=
ot;Depends on blacklisted e-wm&quot;<br>
meta-efl/recipes-efl/e17/<wbr>forecasts_svn.bb:PNBLACKLIST[<wbr>forecasts] =
?=3D &quot;Depends on blacklisted e-wm&quot;<br>
meta-efl/recipes-efl/e17/news_<wbr>svn.bb:PNBLACKLIST[news] ?=3D &quot;if y=
ou want to use these modules with E18, then you need to update it to git re=
cipe fetching newer sources from <a href=3D"http://git.enlightenment.org/en=
lightenment/modules/news.git/" rel=3D"noreferrer" target=3D"_blank">http://=
git.enlightenment.org/<wbr>enlightenment/modules/news.<wbr>git/</a>&quot;<b=
r>
meta-efl/recipes-efl/e17/<wbr>places_svn.bb:PNBLACKLIST[<wbr>places] ?=3D &=
quot;Depends on blacklisted e-wm&quot;<br>
meta-efl/recipes-efl/e17/rage_<wbr>svn.bb:PNBLACKLIST[rage] ?=3D &quot;if y=
ou want to use these modules with E18, then you need to update it to git re=
cipe fetching newer sources from=C2=A0 <a href=3D"http://git.enlightenment.=
org/apps/rage.git/" rel=3D"noreferrer" target=3D"_blank">http://git.enlight=
enment.org/<wbr>apps/rage.git/</a>&quot;<br>
meta-efl/recipes-efl/e17/rain_<wbr>svn.bb:PNBLACKLIST[rain] ?=3D &quot;Depe=
nds on blacklisted e-wm&quot;<br>
meta-efl/recipes-efl/e17/<wbr>screenshot_svn.bb:PNBLACKLIST[<wbr>screenshot=
] ?=3D &quot;depends on blacklisted emprint&quot;<br>
meta-efl/recipes-efl/e17/<wbr>terminology_0.9.1.bb:PNBLACKLI<wbr>ST[termino=
logy] ?=3D &quot;Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/e17/<wbr>uptime_svn.bb:PNBLACKLIST[<wbr>uptime] ?=3D &=
quot;Depends on blacklisted e-wm&quot;<br>
meta-efl/recipes-efl/efl/azy_<wbr>svn.bb:PNBLACKLIST[azy] ?=3D &quot;OLD an=
d doesn&#39;t build with gcc-5&quot;<br>
meta-efl/recipes-efl/efl/<wbr>elementary_1.15.1.bb:PNBLACKLI<wbr>ST[element=
ary] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproje=
ct.org/Errors/Details/130584/" rel=3D"noreferrer" target=3D"_blank">http://=
errors.yoctoproject.<wbr>org/Errors/Details/130584/</a>&quot;<br>
meta-efl/recipes-efl/efl/<wbr>engrave_svn.bb:PNBLACKLIST[<wbr>engrave] ?=3D=
 &quot;BROKEN: fails to build with latest oe-core&quot;<br>
meta-efl/recipes-efl/efl/<wbr>entrance_svn.bb:PNBLACKLIST[<wbr>entrance] ?=
=3D &quot;broken: switch to <a href=3D"https://git.enlightenment.org/misc/e=
ntrance.git" rel=3D"noreferrer" target=3D"_blank">https://git.enlightenment=
.org/<wbr>misc/entrance.git</a> and fix 0.0.4+svnr82070-r7/entrance/<wbr>da=
ta/themes/old/default.edc:<wbr>678. invalid state name: &#39;defaault&#39;.=
 &quot;default&quot; state must always be first.&quot;<br>
meta-efl/recipes-efl/efl/<wbr>libeflvala_svn.bb:PNBLACKLIST[<wbr>libeflvala=
] ?=3D &quot;Depends on blacklisted elementary&quot;<br>
meta-efl/recipes-efl/efl/<wbr>libeweather_svn.bb:PNBLACKLIST<wbr>[libeweath=
er] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoprojec=
t.org/Errors/Details/130649/" rel=3D"noreferrer" target=3D"_blank">http://e=
rrors.yoctoproject.<wbr>org/Errors/Details/130649/</a>&quot;<br>
meta-efl/recipes-efl/<wbr>packagegroups/packagegroup-<wbr>efl-sdk.bb:PNBLAC=
KLIST[<wbr>packagegroup-efl-sdk] ?=3D &quot;Runtime depends on blacklisted =
elementary-dev&quot;<br>
meta-efl/recipes-efl/<wbr>packagegroups/packagegroup-<wbr>efl-standalone-sd=
k-target.bb:P<wbr>NBLACKLIST[packagegroup-efl-<wbr>standalone-sdk-target] ?=
=3D &quot;Runtime depends on blacklisted elementary-dev&quot;<br>
meta-efl/recipes-efl/<wbr>packagegroups/packagegroup-<wbr>x11-illume.bb:PNB=
LACKLIST[<wbr>packagegroup-x11-illume] ?=3D &quot;Runtime depends on blackl=
isted e-wm&quot;<br>
meta-efl/recipes-efl/<wbr>packagegroups/packagegroup-<wbr>x11-illume.bb:PNB=
LACKLIST[<wbr>packagegroup-x11-illume] ?=3D &quot;Runtime depends on blackl=
isted e-wm-config-mobile&quot;<br>
meta-efl/recipes-efl/<wbr>packagegroups/packagegroup-<wbr>x11-illume.bb:PNB=
LACKLIST[<wbr>packagegroup-x11-illume] ?=3D &quot;Runtime depends on blackl=
isted e-wm-theme-default&quot;<br>
meta-efl/recipes-efl/webkit/<wbr>webkit-efl.inc:PNBLACKLIST[<wbr>webkit-efl=
] ?=3D &quot;Old and unmaintaned fork with many security issues&quot;<br>
meta-efl/recipes-navigation/<wbr>mcnavi/mcnavi_0.3.4.bb:PNBLACK<wbr>LIST[mc=
navi] ?=3D &quot;BROKEN: latest version 0.3.4 is 3 years old and now broken=
 with more strict ejde_cc from efl-1.13&quot;<br>
meta-filesystems/recipes-<wbr>filesystems/smbnetfs/smbnetfs_<wbr>git.bb:PNB=
LACKLIST[smbnetfs] ?=3D &quot;Fails to build with RSS <a href=3D"http://err=
ors.yoctoproject.org/Errors/Details/132827/" rel=3D"noreferrer" target=3D"_=
blank">http://errors.yoctoproject.<wbr>org/Errors/Details/132827/</a>&quot;=
<br>
meta-filesystems/recipes-<wbr>filesystems/unionfs-fuse/<wbr>unionfs-fuse_0.=
26.bb:PNBLACKLI<wbr>ST[unionfs-fuse] ?=3D &quot;Fails to build with RSS <a =
href=3D"http://errors.yoctoproject.org/Errors/Details/130648/" rel=3D"noref=
errer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details=
/130648/</a>&quot;<br>
meta-filesystems/recipes-<wbr>utils/dmapi/dmapi_2.2.12.bb:PN<wbr>BLACKLIST[=
dmapi] ?=3D &quot;Depends on broken xfsprogs&quot;<br>
meta-filesystems/recipes-<wbr>utils/xfsdump/xfsdump_3.1.4.<wbr>bb:PNBLACKLI=
ST[xfsdump] ?=3D &quot;Depends on broken xfsprogs&quot;<br>
meta-filesystems/recipes-<wbr>utils/xfsprogs/xfsprogs_4.8.0.<wbr>bb:PNBLACK=
LIST[xfsprogs] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.=
yoctoproject.org/Errors/Details/130663/" rel=3D"noreferrer" target=3D"_blan=
k">http://errors.yoctoproject.<wbr>org/Errors/Details/130663/</a>&quot;<br>
meta-gnome/recipes-apps/<wbr>cheese/cheese_2.30.1.bb:PNBLAC<wbr>KLIST[chees=
e] ?=3D &quot;Depends on blacklisted gstreamer&quot;<br>
meta-gnome/recipes-apps/<wbr>cheese/cheese_2.30.1.bb:PNBLAC<wbr>KLIST[chees=
e] ?=3D &quot;Depends on blacklisted gnome-desktop&quot;<br>
meta-gnome/recipes-apps/<wbr>epdfview/epdfview_0.1.8.bb:PNB<wbr>LACKLIST[ep=
dfview] ?=3D &quot;BROKEN: images are not displayed anymore&quot;<br>
meta-gnome/recipes-apps/gnome-<wbr>mplayer/gmtk_1.0.5.bb:PNBLACKL<wbr>IST[g=
mtk] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproje=
ct.org/Errors/Details/130661/" rel=3D"noreferrer" target=3D"_blank">http://=
errors.yoctoproject.<wbr>org/Errors/Details/130661/</a>&quot;<br>
meta-gnome/recipes-apps/gnome-<wbr>mplayer/gnome-mplayer_1.0.5.<wbr>bb:PNBL=
ACKLIST[gnome-mplayer] ?=3D &quot;rdepends on blacklisted mplayer&quot;<br>
meta-gnome/recipes-extended/<wbr>gparted/gparted_0.27.0.bb:PNBL<wbr>ACKLIST=
[gparted] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yocto=
project.org/Errors/Details/131634/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://errors.yoctoproject.<wbr>org/Errors/Details/131634/</a>&quot;<br>
meta-gnome/recipes-extended/<wbr>gtk-theme-torturer/gtk-theme-<wbr>torturer=
_git.bb:PNBLACKLIST[<wbr>gtk-theme-torturer] ?=3D &quot;BROKEN: gmacros.h:1=
82:53: error: size of array &#39;_<wbr>GStaticAssertCompileTimeAssert<wbr>i=
on_2&#39; is negative&quot;<br>
meta-gnome/recipes-gnome/<wbr>abiword/abiword_3.0.1.bb:PNBLA<wbr>CKLIST[abi=
word] ?=3D &quot;Depends on blacklisted gtkmathview&quot;<br>
meta-gnome/recipes-gnome/<wbr>bonobo/libbonobo_2.32.1.bb:PNB<wbr>LACKLIST[l=
ibbonobo] ?=3D &quot;Depends on blacklisted orbit2&quot;<br>
meta-gnome/recipes-gnome/<wbr>bonobo/libbonoboui_2.24.5.bb:P<wbr>NBLACKLIST=
[libbonoboui] ?=3D &quot;Depends on blacklisted libgnome&quot;<br>
meta-gnome/recipes-gnome/<wbr>bonobo/libbonoboui_2.24.5.bb:P<wbr>NBLACKLIST=
[libbonoboui] ?=3D &quot;Depends on blacklisted libbonobo&quot;<br>
meta-gnome/recipes-gnome/<wbr>devilspie/devilspie2_0.33.bb:P<wbr>NBLACKLIST=
[devilspie2] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yo=
ctoproject.org/Errors/Details/130666/" rel=3D"noreferrer" target=3D"_blank"=
>http://errors.yoctoproject.<wbr>org/Errors/Details/130666/</a>&quot;<br>
meta-gnome/recipes-gnome/<wbr>gcalctool/<a href=3D"http://gcalctool_5.32.0.=
bb">gcalctool_5.32.0.bb</a>:<wbr>PNBLACKLIST[gcalctool] ?=3D &quot;broken a=
t least since April 2013 <a href=3D"http://permalink.gmane.org/gmane.comp.h=
andhelds.openembedded/57920" rel=3D"noreferrer" target=3D"_blank">http://pe=
rmalink.gmane.org/<wbr>gmane.comp.handhelds.<wbr>openembedded/57920</a> and=
 nobody complained, it&#39;s also replaced by gnome calculator&quot;<br>
meta-gnome/recipes-gnome/gdm/<wbr>gdm_2.32.2.bb:PNBLACKLIST[gdm] ?=3D &quot=
;Depends on broken gnome-panel&quot;<br>
meta-gnome/recipes-gnome/<wbr>gedit/gedit_2.30.4.bb:PNBLACKL<wbr>IST[gedit]=
 ?=3D &quot;Depends on blacklisted gtksourceview2&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-backgrounds/gnome-<wbr>backgrounds_2.32=
.0.bb:PNBLACKL<wbr>IST[gnome-backgrounds] ?=3D &quot;Fails to build with RS=
S <a href=3D"http://errors.yoctoproject.org/Errors/Details/130647/" rel=3D"=
noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/De=
tails/130647/</a>&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-control-center/gnome-<wbr>control-cente=
r_2.32.1.bb:PNBLA<wbr>CKLIST[gnome-control-center] ?=3D &quot;Depends on br=
oken gnome-menus&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-desktop/gnome-desktop_2.<wbr>32.1.bb:PN=
BLACKLIST[gnome-<wbr>desktop] ?=3D &quot;Fails to build with RSS <a href=3D=
"http://errors.yoctoproject.org/Errors/Details/130595/" rel=3D"noreferrer" =
target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130595=
/</a>&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-disk-utility/gnome-disk-<wbr>utility_2.=
32.0.bb:PNBLACKLIST[<wbr>gnome-disk-utility] ?=3D &quot;Fails to build with=
 RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/132824/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Details/132824/</a>&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-keyring/gnome-keyring_2.<wbr>32.1.bb:PN=
BLACKLIST[gnome-<wbr>keyring] ?=3D &quot;This version conflicts with gcr fr=
om oe-core&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-menus/gnome-menus_2.30.<wbr>5.bb:PNBLAC=
KLIST[gnome-menus] ?=3D &quot;BROKEN: fails to build because of python + co=
nflicts with gnome-menu3&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-mime-data/gnome-mime-<wbr>data_2.18.0.b=
b:PNBLACKLIST[<wbr>gnome-mime-data] ?=3D &quot;Fails to build with RSS <a h=
ref=3D"http://errors.yoctoproject.org/Errors/Details/130589/" rel=3D"norefe=
rrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/=
130589/</a>&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-panel/gnome-panel3_3.0.<wbr>2.bb:PNBLAC=
KLIST[gnome-panel3] ?=3D &quot;CONFLICT: depends on libgweather3 which conf=
licts with libgweather&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-panel/gnome-panel3_3.0.<wbr>2.bb:PNBLAC=
KLIST[gnome-panel3] ?=3D &quot;Depends on broken gnome-menus&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-panel/gnome-panel_2.32.<wbr>1.bb:PNBLAC=
KLIST[gnome-panel] ?=3D &quot;Depends on broken libgweather&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-power-manager/gnome-<wbr>power-manager_=
2.32.0.bb:PNBLAC<wbr>KLIST[gnome-power-manager] ?=3D &quot;BROKEN: not comp=
atible with current libnotify&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-session/gnome-session_2.<wbr>32.1.bb:PN=
BLACKLIST[gnome-<wbr>session] ?=3D &quot;BROKEN: fails to build with gcc-6&=
quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-settings-daemon/gnome-<wbr>settings-dae=
mon_2.32.1.bb:PNBL<wbr>ACKLIST[gnome-settings-daemon] ?=3D &quot;Depends on=
 blacklisted libgnomekbd&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-settings-daemon/gnome-<wbr>settings-dae=
mon_2.32.1.bb:PNBL<wbr>ACKLIST[gnome-settings-daemon] ?=3D &quot;Depends on=
 blacklisted gnome-desktop&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-system-monitor/gnome-<wbr>system-monito=
r_2.28.2.bb:PNBLA<wbr>CKLIST[gnome-system-monitor] ?=3D &quot;Fails to buil=
d with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/131635/=
" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/=
Errors/Details/131635/</a>&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome-vfs/<a href=3D"http://gnome-vfs_2.24.4.=
bb">gnome-vfs_2.24.4.bb</a>:<wbr>PNBLACKLIST[gnome-vfs] ?=3D &quot;Depends =
on blacklisted gnome-mime-data&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome/gnome-terminal_2.30.2.<wbr>bb:PNBLACKLI=
ST[gnome-terminal] ?=3D &quot;BROKEN: fails to build with gcc-6&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome/libgnomecups_0.2.3.bb:PN<wbr>BLACKLIST[=
libgnomecups] ?=3D &quot;Depends on blacklisted libgnomeui&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnome/<a href=3D"http://libgnomeprint_2.18.8.=
bb">libgnomeprint_2.18.8.bb</a>:<wbr>PNBLACKLIST[libgnomeprint] ?=3D &quot;=
Depends on broken libgnomecups&quot;<br>
meta-gnome/recipes-gnome/<wbr>gnumeric/gnumeric_1.12.0.bb:PN<wbr>BLACKLIST[=
gnumeric] ?=3D &quot;Depends on broken libgnomeprint&quot;<br>
meta-gnome/recipes-gnome/<wbr>gthumb/gthumb_2.12.4.bb:PNBLAC<wbr>KLIST[gthu=
mb] ?=3D &quot;Depends on blacklisted gstreamer&quot;<br>
meta-gnome/recipes-gnome/gtk-<wbr>engines/<a href=3D"http://gtk-engines_2.2=
0.2.bb">gtk-engines_2.20.2.bb</a>:<wbr>PNBLACKLIST[gtk-engines] ?=3D &quot;=
Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/De=
tails/130602/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproj=
ect.<wbr>org/Errors/Details/130602/</a>&quot;<br>
meta-gnome/recipes-gnome/<wbr>gtksourceview/gtksourceview2_<wbr>2.10.5.bb:P=
NBLACKLIST[<wbr>gtksourceview2] ?=3D &quot;Fails to build with RSS <a href=
=3D"http://errors.yoctoproject.org/Errors/Details/130597/" rel=3D"noreferre=
r" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130=
597/</a>&quot;<br>
meta-gnome/recipes-gnome/<wbr>gweather/libgweather3_3.0.2.<wbr>bb:PNBLACKLI=
ST[libgweather3] ?=3D &quot;CONFLICT: 876 files are conflicting with libgwe=
ather&quot;<br>
meta-gnome/recipes-gnome/<wbr>gweather/libgweather_2.30.3.<wbr>bb:PNBLACKLI=
ST[libgweather] ?=3D &quot;BROKEN: fails to build with gcc-6&quot;<br>
meta-gnome/recipes-gnome/<wbr>libgnome/libgnome_2.32.1.bb:PN<wbr>BLACKLIST[=
libgnome] ?=3D &quot;Depends on blacklisted gnome-vfs&quot;<br>
meta-gnome/recipes-gnome/<wbr>libgnome/libgnomekbd_2.32.0.<wbr>bb:PNBLACKLI=
ST[libgnomekbd] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors=
.yoctoproject.org/Errors/Details/130608/" rel=3D"noreferrer" target=3D"_bla=
nk">http://errors.yoctoproject.<wbr>org/Errors/Details/130608/</a>&quot;<br=
>
meta-gnome/recipes-gnome/<wbr>libgnome/<a href=3D"http://libgnomeui_2.24.5.=
bb">libgnomeui_2.24.5.bb</a>:<wbr>PNBLACKLIST[libgnomeui] ?=3D &quot;Depend=
s on blacklisted libgnome&quot;<br>
meta-gnome/recipes-gnome/<wbr>libidl/libidl-native_0.8.14.<wbr>bb:PNBLACKLI=
ST[libidl-native] ?=3D &quot;Fails to build with RSS <a href=3D"http://erro=
rs.yoctoproject.org/Errors/Details/130582/" rel=3D"noreferrer" target=3D"_b=
lank">http://errors.yoctoproject.<wbr>org/Errors/Details/130582/</a>&quot;<=
br>
meta-gnome/recipes-gnome/<wbr>libidl/libidl_0.8.14.bb:PNBLAC<wbr>KLIST[libi=
dl] ?=3D &quot;Depends on blacklisted libidl-native&quot;<br>
meta-gnome/recipes-gnome/<wbr>nautilus/nautilus3_3.2.1.bb:PN<wbr>BLACKLIST[=
nautilus3] ?=3D &quot;BROKEN: fails to build, maybe missing dependency on g=
nome-desktop-utils.h provider&quot;<br>
meta-gnome/recipes-gnome/<wbr>nautilus/nautilus_2.32.2.bb:PN<wbr>BLACKLIST[=
nautilus] ?=3D &quot;Depends on blacklisted gnome-desktop&quot;<br>
meta-gnome/recipes-gnome/<wbr>orbit2/orbit2_2.14.19.bb:PNBLA<wbr>CKLIST[orb=
it2] ?=3D &quot;Depends on blacklisted libidl-native&quot;<br>
meta-gnome/recipes-gnome/<wbr>pimlico/contacts_git.bb:PNBLAC<wbr>KLIST[cont=
acts] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproj=
ect.org/Errors/Details/132826/" rel=3D"noreferrer" target=3D"_blank">http:/=
/errors.yoctoproject.<wbr>org/Errors/Details/132826/</a>&quot;<br>
meta-gnome/recipes-gnome/<wbr>pimlico/tasks_0.19.bb:PNBLACKL<wbr>IST[tasks]=
 ?=3D &quot;Fails to build with gcc-6&quot;<br>
meta-gnome/recipes-gnome/<wbr>pimlico/tasks_git.bb:PNBLACKLI<wbr>ST[tasks] =
?=3D &quot;Fails to build with gcc-6&quot;<br>
meta-gnome/recipes-gnome/<wbr>system-tools/system-tools-<wbr>backends_2.10.=
2.bb:PNBLACKLIST<wbr>[system-tools-backends] ?=3D &quot;does not build with=
 distroless qemuarm as reported in &#39;State of bitbake world&#39; thread,=
 nobody volunteered to fix them&quot;<br>
meta-gnome/recipes-gnome/<wbr>themes/<a href=3D"http://gnome-themes_2.32.1.=
bb">gnome-themes_2.32.1.bb</a>:<wbr>PNBLACKLIST[gnome-themes] ?=3D &quot;De=
pends on blacklisted gtk-engines&quot;<br>
meta-gnome/recipes-gnome/<wbr>zenity/zenity_2.32.1.bb:PNBLAC<wbr>KLIST[zeni=
ty] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS&quot;<br>
meta-gnome/recipes-support/<wbr>florence/florence_0.5.4.bb:PNB<wbr>LACKLIST=
[florence] ?=3D &quot;Depends on blacklisted gstreamer&quot;<br>
meta-gnome/recipes-support/<wbr>goffice/goffice_0.10.1.bb:PNBL<wbr>ACKLIST[=
goffice] ?=3D &quot;BROKEN: fails to build with gcc-6&quot;<br>
meta-gnome/recipes-support/<wbr>onboard/onboard_1.3.0.bb:PNBLA<wbr>CKLIST[o=
nboard] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctopr=
oject.org/Errors/Details/130637/" rel=3D"noreferrer" target=3D"_blank">http=
://errors.yoctoproject.<wbr>org/Errors/Details/130637/</a>&quot;<br>
meta-gnome/recipes-support/<wbr>tracker/tracker_0.14.2.bb:PNBL<wbr>ACKLIST[=
tracker] ?=3D &quot;BROKEN: fails to build with new binutils-2.27&quot;<br>
meta-gpe/recipes-graphics/gpe-<wbr>scap/gpe-scap_1.4.bb:PNBLACKLI<wbr>ST[gp=
e-scap] ?=3D &quot;Depends on blacklisted libgpewidget&quot;<br>
meta-gpe/recipes-graphics/<wbr>libgpewidget/libgpewidget_0.<wbr>117.bb:PNBL=
ACKLIST[<wbr>libgpewidget] ?=3D &quot;Fails to build with RSS <a href=3D"ht=
tp://errors.yoctoproject.org/Errors/Details/130594/" rel=3D"noreferrer" tar=
get=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130594/</=
a>&quot;<br>
meta-gpe/recipes-graphics/<wbr>minilite/minilite_0.50.bb:PNBL<wbr>ACKLIST[m=
inilite] ?=3D &quot;Depends on blacklisted libgpewidget&quot;<br>
meta-gpe/recipes-support/<wbr>fbreader/fbreader_0.12.10.bb:P<wbr>NBLACKLIST=
[fbreader] ?=3D &quot;Depends on blacklisted libgpewidget&quot;<br>
meta-gpe/recipes-support/<wbr>fbreader/fbreader_git.bb:PNBLA<wbr>CKLIST[fbr=
eader] ?=3D &quot;BROKEN: fails to build with gcc-6&quot;<br>
meta-initramfs/recipes-bsp/<wbr>kexecboot/kexecboot_0.6.bb:PNB<wbr>LACKLIST=
[kexecboot] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoc=
toproject.org/Errors/Details/132823/" rel=3D"noreferrer" target=3D"_blank">=
http://errors.yoctoproject.<wbr>org/Errors/Details/132823/</a>&quot;<br>
meta-initramfs/recipes-<wbr>devtools/klibc/klibc-utils_2.<wbr>0.4.bb:PNBLAC=
KLIST[klibc-<wbr>utils] ?=3D &quot;Fails to build with RSS <a href=3D"http:=
//errors.yoctoproject.org/Errors/Details/130679/" rel=3D"noreferrer" target=
=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130679/</a>&=
quot;<br>
meta-initramfs/recipes-<wbr>devtools/mtd/ubi-utils-klibc_<wbr>1.5.1.bb:PNBL=
ACKLIST[ubi-<wbr>utils-klibc] ?=3D &quot;Fails to build with RSS <a href=3D=
"http://errors.yoctoproject.org/Errors/Details/130665/" rel=3D"noreferrer" =
target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130665=
/</a>&quot;<br>
meta-initramfs/recipes-kernel/<wbr>kexec/kexec-tools-klibc_2.0.2.<wbr>bb:PN=
BLACKLIST[kexec-tools-<wbr>klibc] ?=3D &quot;Fails to build with RSS <a hre=
f=3D"http://errors.yoctoproject.org/Errors/Details/130674/" rel=3D"noreferr=
er" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/13=
0674/</a>&quot;<br>
meta-multimedia/recipes-<wbr>connectivity/gupnp/gupnp-igd_<wbr>0.2.2.bb:PNB=
LACKLIST[gupnp-<wbr>igd] ?=3D &quot;Fails to build with RSS <a href=3D"http=
://errors.yoctoproject.org/Errors/Details/130645/" rel=3D"noreferrer" targe=
t=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130645/</a>=
&quot;<br>
meta-multimedia/recipes-<wbr>connectivity/gupnp/gupnp-<wbr>tools_0.8.10.bb:=
PNBLACKLIST[<wbr>gupnp-tools] ?=3D &quot;Fails to build with RSS <a href=3D=
"http://errors.yoctoproject.org/Errors/Details/130670/" rel=3D"noreferrer" =
target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130670=
/</a>&quot;<br>
meta-multimedia/recipes-dvb/<wbr>dvb-apps/dvb-apps_1.1.1.bb:PNB<wbr>LACKLIS=
T[dvb-apps] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoc=
toproject.org/Errors/Details/130603/" rel=3D"noreferrer" target=3D"_blank">=
http://errors.yoctoproject.<wbr>org/Errors/Details/130603/</a>&quot;<br>
meta-multimedia/recipes-dvb/<wbr>tvheadend/tvheadend_git.bb:PNB<wbr>LACKLIS=
T[tvheadend] ?=3D &quot;Depends on blacklisted dvb-apps&quot;<br>
meta-multimedia/recipes-<wbr>mediacenter/kodi/kodi-addon-<wbr>pvr-hts_git.b=
b:PNBLACKLIST[<wbr>kodi-addon-pvr-hts] ?=3D &quot;Depends on blacklisted ko=
di&quot;<br>
meta-multimedia/recipes-<wbr>mediacenter/kodi/kodi-<wbr>platform_git.bb:PNB=
LACKLIST[<wbr>kodi-platform] ?=3D &quot;Depends on blacklisted kodi&quot;<b=
r>
meta-multimedia/recipes-<wbr>mediacenter/kodi/kodi-startup.<wbr>bb:PNBLACKL=
IST[kodi-startup] ?=3D &quot;Runtime depends on blacklisted kodi&quot;<br>
meta-multimedia/recipes-<wbr>mediacenter/kodi/kodi-startup.<wbr>bb:PNBLACKL=
IST[kodi-startup] ?=3D &quot;Runtime depends on blacklisted kodi-startup-de=
v&quot;<br>
meta-multimedia/recipes-<wbr>mediacenter/kodi/kodi_17.bb:PN<wbr>BLACKLIST[k=
odi] ?=3D &quot;Depends on blacklisted libsdl-mixer&quot;<br>
meta-multimedia/recipes-mkv/<wbr>mkvtoolnix/mkvtoolnix_git.bb:P<wbr>NBLACKL=
IST[mkvtoolnix] ?=3D &quot;BROKEN: Failx to build with gcc-5&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/coriander/<wbr>coriander_2.0.2.bb:P=
NBLACKLIST<wbr>[coriander] ?=3D &quot;BROKEN: fails to use SDL probably bec=
ause libsdl-config was removed, error: unknown type name &#39;SDL_Overlay&#=
39;&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/dleyna/renderer-<wbr>service-upnp_0=
.3.0.bb:PNBLACKL<wbr>IST[renderer-service-upnp] ?=3D &quot;BROKEN: doesn&#3=
9;t build with B!=3DS (trying to install rendererconsole.py from ${B} inste=
ad of ${S})&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>ffmpeg_0.10=
.13.bb:PNBLACKLIST[<wbr>gst-ffmpeg] ?=3D &quot;Not compatible with currentl=
y used ffmpeg 3&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>fluendo-mp3=
_0.10.31.bb:PNBLACK<wbr>LIST[gst-fluendo-mp3] ?=3D &quot;Depends on blackli=
sted gstreamer&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>fluendo-mpe=
gdemux_0.10.85.bb:P<wbr>NBLACKLIST[gst-fluendo-<wbr>mpegdemux] ?=3D &quot;D=
epends on blacklisted gstreamer&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>meta-base_0=
.10.bb:PNBLACKLIST[<wbr>gst-meta-base] ?=3D &quot;Depends on blacklisted gs=
treamer&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>openmax_0.1=
0.1.bb:PNBLACKLIST[<wbr>gst-openmax] ?=3D &quot;Depends on blacklisted gstr=
eamer&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>plugins-bad=
_0.10.23.bb:PNBLACK<wbr>LIST[gst-plugins-bad] ?=3D &quot;Depends on blackli=
sted gstreamer&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>plugins-bas=
e_0.10.36.bb:PNBLAC<wbr>KLIST[gst-plugins-base] ?=3D &quot;Depends on black=
listed gstreamer&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>plugins-gl_=
0.10.3.bb:PNBLACKLI<wbr>ST[gst-plugins-gl] ?=3D &quot;Depends on blackliste=
d gstreamer&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>plugins-goo=
d_0.10.31.bb:PNBLAC<wbr>KLIST[gst-plugins-good] ?=3D &quot;Depends on black=
listed gstreamer&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>plugins-ugl=
y_0.10.19.bb:PNBLAC<wbr>KLIST[gst-plugins-ugly] ?=3D &quot;Depends on black=
listed gstreamer&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/gst-<wbr>rtsp_0.10.8=
.bb:PNBLACKLIST[<wbr>gst-rtsp] ?=3D &quot;Depends on blacklisted gstreamer&=
quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer-0.10/<wbr>gstreamer_0.10.=
36.bb:PNBLACKLI<wbr>ST[gstreamer] ?=3D &quot;Fails to build with RSS <a hre=
f=3D"http://errors.yoctoproject.org/Errors/Details/130583/" rel=3D"noreferr=
er" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/13=
0583/</a>&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/gstreamer/gst123_0.<wbr>3.1.bb:PNBL=
ACKLIST[gst123] ?=3D &quot;gst123 is still &quot;sometimes&quot; using wron=
g sysroot&quot;<br>
meta-multimedia/recipes-<wbr>multimedia/musicpd/mpd_0.19.<wbr>21.bb:PNBLACK=
LIST[mpd] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yocto=
project.org/Errors/Details/130612/" rel=3D"noreferrer" target=3D"_blank">ht=
tp://errors.yoctoproject.<wbr>org/Errors/Details/130612/</a>&quot;<br>
meta-networking/recipes-<wbr>connectivity/crda/crda_3.18.<wbr>bb:PNBLACKLIS=
T[crda] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctopr=
oject.org/Errors/Details/130675/" rel=3D"noreferrer" target=3D"_blank">http=
://errors.yoctoproject.<wbr>org/Errors/Details/130675/</a>&quot;<br>
meta-networking/recipes-<wbr>daemons/dnrd/dnrd_2.20.3.bb:PN<wbr>BLACKLIST[d=
nrd] ?=3D &quot;BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/di=
rectories were installed but not shipped in any package:&quot;<br>
meta-networking/recipes-<wbr>kernel/netmap/netmap-modules_<wbr>git.bb:PNBLA=
CKLIST[netmap-<wbr>modules] ?=3D &quot;BROKEN: not compatible with default =
kernel version 4.8&quot;<br>
meta-networking/recipes-<wbr>kernel/netmap/netmap_git.bb:PN<wbr>BLACKLIST[n=
etmap] ?=3D &quot;BROKEN: Tries to build kernel module and fails, either it=
 should be disabled or there should be dependency on kernel like in netmap-=
modules&quot;<br>
meta-networking/recipes-<wbr>protocols/accel-ppp/accel-ppp_<wbr>git.bb:PNBL=
ACKLIST[accel-ppp] ?=3D &quot;BROKEN: fails to build with new binutils-2.27=
&quot;<br>
meta-networking/recipes-<wbr>support/lksctp-tools/lksctp-<wbr>tools_1.0.17.=
bb:PNBLACKLIST[<wbr>lksctp-tools] ?=3D &quot;${@bb.utils.contains(&#39;DIST=
RO_<wbr>FEATURES&#39;, &#39;ld-is-gold&#39;, &quot;BROKEN: fails to link ag=
ainst sctp_connectx symbol&quot;, &#39;&#39;, d)}&quot;<br>
meta-networking/recipes-<wbr>support/netcat/netcat-openbsd_<wbr>1.105.bb:PN=
BLACKLIST[netcat-<wbr>openbsd] ?=3D &quot;Fails to build with RSS <a href=
=3D"http://errors.yoctoproject.org/Errors/Details/130673/" rel=3D"noreferre=
r" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130=
673/</a>&quot;<br>
meta-networking/recipes-<wbr>support/nis/ypbind-mt_2.2.bb:P<wbr>NBLACKLIST[=
ypbind-mt] ?=3D &quot;BROKEN: Depends on broken yp-tools&quot;<br>
meta-networking/recipes-<wbr>support/wireshark/wireshark_2.<wbr>2.4.bb:PNBL=
ACKLIST[wireshark] ?=3D &quot;Fails to build with RSS <a href=3D"http://err=
ors.yoctoproject.org/Errors/Details/130671/" rel=3D"noreferrer" target=3D"_=
blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130671/</a>&quot;=
<br>
meta-oe/recipes-benchmark/<wbr>phoronix-test-suite/phoronix-<wbr>test-suite=
_6.6.1.bb:PNBLACKLIS<wbr>T[phoronix-test-suite] ?=3D &quot;Runtime depends =
on blacklisted php-cli&quot;<br>
meta-oe/recipes-benchmark/<wbr>pmbw/pmbw_git.bb:PNBLACKLIST[<wbr>pmbw] ?=3D=
 &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Er=
rors/Details/130568/" rel=3D"noreferrer" target=3D"_blank">http://errors.yo=
ctoproject.<wbr>org/Errors/Details/130568/</a>&quot;<br>
meta-oe/)}&quot;<br>
meta-oe/recipes-connectivity/<wbr>bluez/bluez4_4.101.bb:PNBLACKL<wbr>IST[bl=
uez4] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;=
bluez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DI=
STRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-oe/recipes-connectivity/<wbr>bluez/gst-plugin-bluetooth_4.<wbr>101.bb:=
PNBLACKLIST[gst-plugin-<wbr>bluetooth] ?=3D &quot;${@bb.utils.contains(&#39=
;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5&#39;, &#39;bluez5 conflicts with bl=
uez4 and bluez5 is selected in DISTRO_FEATURES&#39;, &#39;&#39;, d)}&quot;<=
br>
meta-oe/recipes-connectivity/<wbr>gnokii/gnokii_0.6.31.bb:PNBLAC<wbr>KLIST[=
gnokii] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctopr=
oject.org/Errors/Details/130662/" rel=3D"noreferrer" target=3D"_blank">http=
://errors.yoctoproject.<wbr>org/Errors/Details/130662/</a>&quot;<br>
meta-oe/recipes-connectivity/<wbr>libmbim/libmbim_1.14.0.bb:PNBL<wbr>ACKLIS=
T[libmbim] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoct=
oproject.org/Errors/Details/130590/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://errors.yoctoproject.<wbr>org/Errors/Details/130590/</a>&quot;<br>
meta-oe/recipes-connectivity/<wbr>libqmi/libqmi_1.16.0.bb:PNBLAC<wbr>KLIST[=
libqmi] ?=3D &quot;Depends on blacklisted libmbim&quot;<br>
meta-oe/recipes-connectivity/<wbr>modemmanager/modemmanager_1.6.<wbr>4.bb:P=
NBLACKLIST[modemmanager] ?=3D &quot;Depends on blacklisted libmbim&quot;<br=
>
meta-oe/recipes-connectivity/<wbr>mosh/mosh_1.2.4.bb:PNBLACKLIST<wbr>[mosh]=
 ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.o=
rg/Errors/Details/130653/" rel=3D"noreferrer" target=3D"_blank">http://erro=
rs.yoctoproject.<wbr>org/Errors/Details/130653/</a>&quot;<br>
meta-oe/recipes-connectivity/<wbr>networkmanager/networkmanager-<wbr>openvp=
n_1.2.6.bb:PNBLACKLIST[<wbr>networkmanager-openvpn] ?=3D &quot;Fails to bui=
ld with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/130667=
/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org=
/Errors/Details/130667/</a>&quot;<br>
meta-oe/recipes-connectivity/<wbr>soft66/soft66_git.bb:PNBLACKLI<wbr>ST[sof=
t66] ?=3D &quot;BROKEN: depends on broken libftdi&quot;<br>
meta-oe/recipes-connectivity/<wbr>telepathy/libtelepathy_0.3.3.<wbr>bb:PNBL=
ACKLIST[libtelepathy] ?=3D &quot;Fails to build with RSS <a href=3D"http://=
errors.yoctoproject.org/Errors/Details/130609/" rel=3D"noreferrer" target=
=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130609/</a>&=
quot;<br>
meta-oe/recipes-connectivity/<wbr>telepathy/telepathy-mission-<wbr>control_=
5.16.1.bb:PNBLACKLIST[<wbr>telepathy-mission-control] ?=3D &quot;Depends on=
 blacklisted libtelepathy&quot;<br>
meta-oe/recipes-connectivity/<wbr>wvdial/wvdial_1.61.bb:PNBLACKL<wbr>IST[wv=
dial] ?=3D &quot;Depends on broken wvstreams&quot;<br>
meta-oe/recipes-connectivity/<wbr>wvdial/wvstreams_4.6.1.bb:PNBL<wbr>ACKLIS=
T[wvstreams] ?=3D &quot;BROKEN: fails to build with gcc-6&quot;<br>
meta-oe/recipes-connectivity/<wbr>zeroc-ice/zeroc-ice_3.5.1.bb:P<wbr>NBLACK=
LIST[zeroc-ice] ?=3D &quot;BROKEN: not compatible with default db version&q=
uot;<br>
meta-oe/recipes-core/dbus/<wbr>dbus-daemon-proxy_git.bb:PNBLA<wbr>CKLIST[db=
us-daemon-proxy] ?=3D &quot;Fails to build with RSS <a href=3D"http://error=
s.yoctoproject.org/Errors/Details/130613/" rel=3D"noreferrer" target=3D"_bl=
ank">http://errors.yoctoproject.<wbr>org/Errors/Details/130613/</a>&quot;<b=
r>
meta-oe/recipes-core/dbus/<wbr>libdbus-c++_0.9.0.bb:PNBLACKLI<wbr>ST[libdbu=
s-c++] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctopro=
ject.org/Errors/Details/130644/" rel=3D"noreferrer" target=3D"_blank">http:=
//errors.yoctoproject.<wbr>org/Errors/Details/130644/</a>&quot;<br>
meta-oe/recipes-core/fakeroot/<wbr>fakeroot_1.18.4.bb:PNBLACKLIST<wbr>[fake=
root] ?=3D &quot;BROKEN: QA Issue: -dev package contains non-symlink .so&qu=
ot;<br>
meta-oe/recipes-core/<wbr>packagegroups/packagegroup-<wbr>cli-tools.bb:PNBL=
ACKLIST[<wbr>packagegroup-cli-tools] ?=3D &quot;Runtime depends on blacklis=
ted dbus-daemon-proxy&quot;<br>
meta-oe/recipes-core/<wbr>packagegroups/packagegroup-<wbr>cli-tools.bb:PNBL=
ACKLIST[<wbr>packagegroup-cli-tools] ?=3D &quot;Runtime depends on blacklis=
ted packagegroup-cli-tools&quot;<br>
meta-oe/recipes-devtools/<wbr>cloud9/cloud9_0.6.bb:PNBLACKLI<wbr>ST[cloud9]=
 ?=3D &quot;Not comatible with current nodejs 0.12, but upstream is working=
 on it for v3&quot;<br>
meta-oe/recipes-devtools/<wbr>geany/geany-plugins_1.29.bb:PN<wbr>BLACKLIST[=
geany-plugins] ?=3D &quot;Depends on blacklisted geany&quot;<br>
meta-oe/recipes-devtools/<wbr>geany/geany_1.29.bb:PNBLACKLIS<wbr>T[geany] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/132822/" rel=3D"noreferrer" target=3D"_blank">http://errors=
.yoctoproject.<wbr>org/Errors/Details/132822/</a>&quot;<br>
meta-oe/recipes-devtools/<wbr>glade/glade3_3.8.5.bb:PNBLACKL<wbr>IST[glade3=
] ?=3D &quot;Depends on blacklisted libbonoboui&quot;<br>
meta-oe/recipes-devtools/<wbr>glade/glade3_3.8.5.bb:PNBLACKL<wbr>IST[glade3=
] ?=3D &quot;Depends on blacklisted libgnomeui&quot;<br>
meta-oe/recipes-devtools/ltp-<wbr>ddt/ltp-ddt_1.0.0.bb:PNBLACKLI<wbr>ST[ltp=
-ddt] ?=3Dls/php/php_5.6.26.bb:PNBLACK<wbr>LIST[php] ?=3D &quot;Fails to bu=
ild with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/13163=
0/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>or=
g/Errors/Details/131630/</a>&quot;<br>
meta-oe/recipes-devtools/php/<wbr>php_7.1.0.bb:PNBLACKLIST[php] ?=3D &quot;=
Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/De=
tails/130601/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproj=
ect.<wbr>org/Errors/Details/130601/</a>&quot;<br>
meta-oe/recipes-devtools/vala-<wbr>dbus-binding-tool/vala-dbus-<wbr>binding=
-tool_0.4.0.bb:PNBLACKL<wbr>IST[vala-dbus-binding-tool] ?=3D &quot;Fails to=
 build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/13=
1628/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr=
>org/Errors/Details/131628/</a>&quot;<br>
meta-oe/recipes-devtools/vala-<wbr>dbus-binding-tool/vala-dbus-<wbr>binding=
-tool_git.bb:PNBLACKLIS<wbr>T[vala-dbus-binding-tool] ?=3D &quot;Fails to b=
uild with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/1305=
81/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>o=
rg/Errors/Details/130581/</a>&quot;<br>
meta-oe/recipes-extended/<wbr>collectd/collectd_5.5.0.bb:PNB<wbr>LACKLIST[c=
ollectd] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctop=
roject.org/Errors/Details/130654/" rel=3D"noreferrer" target=3D"_blank">htt=
p://errors.yoctoproject.<wbr>org/Errors/Details/130654/</a>&quot;<br>
meta-oe/recipes-extended/<wbr>efibootmgr/<a href=3D"http://efibootmgr_0.12.=
bb">efibootmgr_0.12.bb</a>:<wbr>PNBLACKLIST[efibootmgr] ?=3D &quot;Depends =
on blacklisted efivar&quot;<br>
meta-oe/recipes-extended/<wbr>efivar/efivar_0.24.bb:PNBLACKL<wbr>IST[efivar=
] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.=
org/Errors/Details/132821/" rel=3D"noreferrer" target=3D"_blank">http://err=
ors.yoctoproject.<wbr>org/Errors/Details/132821/</a>&quot;<br>
meta-oe/recipes-extended/<wbr>libgxim/libgxim_0.5.0.bb:PNBLA<wbr>CKLIST[lib=
gxim] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproj=
ect.org/Errors/Details/130604/" rel=3D"noreferrer" target=3D"_blank">http:/=
/errors.yoctoproject.<wbr>org/Errors/Details/130604/</a>&quot;<br>
meta-oe/recipes-extended/mml-<wbr>widget/gtkmathview_0.8.0.bb:PN<wbr>BLACKL=
IST[gtkmathview] ?=3D &quot;Fails to build with RSS <a href=3D"http://error=
s.yoctoproject.org/Errors/Details/131636/" rel=3D"noreferrer" target=3D"_bl=
ank">http://errors.yoctoproject.<wbr>org/Errors/Details/131636/</a>&quot;<b=
r>
meta-oe/recipes-extended/<wbr>openlmi/openlmi-networking_0.<wbr>3.1.bb:PNBL=
ACKLIST[openlmi-<wbr>networking] ?=3D &quot;Depends on blacklisted openlmi-=
providers&quot;<br>
meta-oe/recipes-extended/<wbr>openlmi/openlmi-providers_0.6.<wbr>0.bb:PNBLA=
CKLIST[openlmi-<wbr>providers] ?=3D &quot;Depends on blacklisted lmsensors&=
quot;<br>
meta-oe/recipes-extended/<wbr>openlmi/openlmi-storage_0.8.1.<wbr>bb:PNBLACK=
LIST[openlmi-<wbr>storage] ?=3D &quot;Depends on blacklisted pywbem&quot;<b=
r>
meta-oe/recipes-extended/<wbr>openlmi/openlmi-tools_0.10.5.<wbr>bb:PNBLACKL=
IST[openlmi-tools] ?=3D &quot;Depends on blacklisted pywbem&quot;<br>
meta-oe/recipes-extended/<wbr>pywbem/pywbem_0.8.0.bb:PNBLACK<wbr>LIST[pywbe=
m] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject=
.org/Errors/Details/130596/" rel=3D"noreferrer" target=3D"_blank">http://er=
rors.yoctoproject.<wbr>org/Errors/Details/130596/</a>&quot;<br>
meta-oe/recipes-extended/<wbr>pywbem/pywbem_0.8.0.bb:PNBLACK<wbr>LIST[pywbe=
m] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject=
.org/Errors/Details/130681/" rel=3D"noreferrer" target=3D"_blank">http://er=
rors.yoctoproject.<wbr>org/Errors/Details/130681/</a>&quot;<br>
meta-oe/recipes-extended/<wbr>subsurface/subsurface_git.bb:P<wbr>NBLACKLIST=
[subsurface] ?=3D &quot;Needs to be upgraded for compatibility with new lib=
divecomputer&quot;<br>
meta-oe/recipes-gnome/<wbr>gtkextra/gtkextra_3.0.5.bb:PNB<wbr>LACKLIST[gtke=
xtra] ?=3D &quot;BROKEN: Fails to build with gcc-5&quot;<br>
meta-oe/recipes-gnome/<wbr>gtkhtml2/gtkhtml2_svn.bb:PNBLA<wbr>CKLIST[gtkhtm=
l2] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoprojec=
t.org/Errors/Details/130633/" rel=3D"noreferrer" target=3D"_blank">http://e=
rrors.yoctoproject.<wbr>org/Errors/Details/130633/</a>&quot;<br>
meta-oe/recipes-graphics/<wbr>clutter/clutter-box2d_git.bb:P<wbr>NBLACKLIST=
[clutter-box2d] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS&quot;<br>
meta-oe/recipes-graphics/<wbr>fbida/fbida_2.10.bb:PNBLACKLIS<wbr>T[fbida] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130677/" rel=3D"noreferrer" target=3D"_blank">http://errors=
.yoctoproject.<wbr>org/Errors/Details/130677/</a>&quot;<br>
meta-oe/recipes-graphics/fim/<wbr>fim_0.4-rc1.bb:PNBLACKLIST[<wbr>fim] ?=3D=
 &quot;BROKEN: doesn&#39;t build with B!=3DS (flex: can&#39;t open lex.lex)=
&quot;<br>
meta-oe/recipes-graphics/<wbr>fontforge/fontforge_20150824.<wbr>bb:PNBLACKL=
IST[fontforge] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.=
yoctoproject.org/Errors/Details/130639/" rel=3D"noreferrer" target=3D"_blan=
k">http://errors.yoctoproject.<wbr>org/Errors/Details/130639/</a>&quot;<br>
meta-oe/recipes-graphics/gimp/<wbr>gimp_2.8.18.bb:PNBLACKLIST[<wbr>gimp] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/132825/" rel=3D"noreferrer" target=3D"_blank">http://errors=
.yoctoproject.<wbr>org/Errors/Details/132825/</a>&quot;<br>
meta-oe/recipes-graphics/<wbr>libsexy/libsexy_0.1.11.bb:PNBL<wbr>ACKLIST[li=
bsexy] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctopro=
ject.org/Errors/Details/130607/" rel=3D"noreferrer" target=3D"_blank">http:=
//errors.yoctoproject.<wbr>org/Errors/Details/130607/</a>&quot;<br>
meta-oe/recipes-graphics/slim/<wbr>slim_1.3.2.bb:PNBLACKLIST[<wbr>slim] ?=
=3D &quot;does not build with distroless qemuarm as repetails/130632/&quot;=
<br>
meta-oe/recipes-graphics/xorg-<wbr>app/xstdcmap_1.0.3.bb:PNBLACKL<wbr>IST[x=
stdcmap] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctop=
roject.org/Errors/Details/130660/" rel=3D"noreferrer" target=3D"_blank">htt=
p://errors.yoctoproject.<wbr>org/Errors/Details/130660/</a>&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>driver/<a href=3D"http://xf86-input-mtev=
_git.bb">xf86-input-mtev_git.bb</a>:<wbr>PNBLACKLIST[xf86-input-mtev] ?=3D =
&quot;BROKEN: doesn&#39;t build with B!=3DS (Makefile without ${S} in sed c=
all)&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>driver/xf86-video-geode_2.11.<wbr>16.bb:=
PNBLACKLIST[xf86-video-<wbr>geode] ?=3D &quot;BROKEN, fails to build&quot;<=
br>
meta-oe/recipes-graphics/xorg-<wbr>driver/xf86-video-glamo_git.<wbr>bb:PNBL=
ACKLIST[xf86-video-<wbr>glamo] ?=3D &quot;Fails to build with RSS <a href=
=3D"http://errors.yoctoproject.org/Errors/Details/130629/" rel=3D"noreferre=
r" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130=
629/</a>&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>driver/xf86-video-nouveau_1.0.<wbr>12.bb=
:PNBLACKLIST[xf86-video-<wbr>nouveau] ?=3D &quot;Fails to build with RSS <a=
 href=3D"http://errors.yoctoproject.org/Errors/Details/130657/" rel=3D"nore=
ferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Detail=
s/130657/</a>&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>font/font-adobe-100dpi_1.0.3.<wbr>bb:PNB=
LACKLIST[font-adobe-<wbr>100dpi] ?=3D &quot;Fails to build with RSS <a href=
=3D"http://errors.yoctoproject.org/Errors/Details/130621/" rel=3D"noreferre=
r" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130=
621/</a>&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>font/font-adobe-utopia-100dpi_<wbr>1.0.4=
.bb:PNBLACKLIST[font-<wbr>adobe-utopia-100dpi] ?=3D &quot;Fails to build wi=
th RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/130623/" re=
l=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Erro=
rs/Details/130623/</a>&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>font/font-bh-100dpi_1.0.3.bb:P<wbr>NBLAC=
KLIST[font-bh-100dpi] ?=3D &quot;Fails to build with RSS <a href=3D"http://=
errors.yoctoproject.org/Errors/Details/130624/" rel=3D"noreferrer" target=
=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130624/</a>&=
quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>font/font-bh-lucidatypewriter-<wbr>100dp=
i_1.0.3.bb:PNBLACKLIST[<wbr>font-bh-lucidatypewriter-<wbr>100dpi] ?=3D &quo=
t;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/=
Details/130625/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctopr=
oject.<wbr>org/Errors/Details/130625/</a>&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>font/font-misc-misc_1.1.2.bb:P<wbr>NBLAC=
KLIST[font-misc-misc] ?=3D &quot;Fails to build with RSS <a href=3D"http://=
errors.yoctoproject.org/Errors/Details/130628/" rel=3D"noreferrer" target=
=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130628/</a>&=
quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>font/xorg-fonts-100dpi.bb:PNBL<wbr>ACKLI=
ST[xorg-fonts-100dpi] ?=3D &quot;Runtime depends on blacklisted font-adobe-=
100dpi&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>font/xorg-fonts-100dpi.bb:PNBL<wbr>ACKLI=
ST[xorg-fonts-100dpi] ?=3D &quot;Runtime depends on blacklisted xorg-fonts-=
100dpi&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>font/xorg-fonts-100dpi.bb:PNBL<wbr>ACKLI=
ST[xorg-fonts-100dpi] ?=3D &quot;Runtime depends on blacklisted font-bh-100=
dpi&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>font/xorg-fonts-100dpi.bb:PNBL<wbr>ACKLI=
ST[xorg-fonts-100dpi] ?=3D &quot;Runtime depends on blacklisted font-adobe-=
utopia-100dpi&quot;<br>
meta-oe/recipes-graphics/xorg-<wbr>font/xorg-fonts-100dpi.bb:PNBL<wbr>ACKLI=
ST[xorg-fonts-100dpi] ?=3D &quot;Runtime depends on blacklisted font-bh-luc=
idatypewriter-<wbr>100dpi&quot;<br>
meta-oe/recipes-kernel/crash/<wbr>crash_7.1.5.bb:PNBLACKLIST[<wbr>crash] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130678/" rel=3D"noreferrer" target=3D"_blank">http://errors=
.yoctoproject.<wbr>org/Errors/Details/130678/</a>&quot;<br>
meta-oe/recipes-kernel/ktap/<wbr>ktap-module_git.bb:PNBLACKLIST<wbr>[ktap-m=
odule] ?=3D &quot;Not compatible with 3.19 kernel&quot;<br>
meta-oe/recipes-kernel/ktap/<wbr>ktap_git.bb:PNBLACKLIST[ktap] ?=3D &quot;D=
epends on blacklisted kernel-module-ktapvm&quot;<br>
meta-oe/recipes-multimedia/<wbr>jack/a2jmidid_8.bb:PNBLACKLIST<wbr>[a2jmidi=
d] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject=
.org/Errors/Details/130646/" rel=3D"noreferrer" target=3D"_blank">http://er=
rors.yoctoproject.<wbr>org/Errors/Details/130646/</a>&quot;<br>
meta-oe/recipes-multimedia/<wbr>libsdl-mixer/libsdl-mixer_1.2.<wbr>12.bb:PN=
BLACKLIST[libsdl-<wbr>mixer] ?=3D &quot;Fails to build with RSS <a href=3D"=
http://errors.yoctoproject.org/Errors/Details/130592/" rel=3D"noreferrer" t=
arget=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130592/=
</a>&quot;<br>
meta-oe/recipes-multimedia/<wbr>libsdl-mixer/libsdl2-mixer_2.<wbr>0.1.bb:PN=
BLACKLIST[libsdl2-<wbr>mixer] ?=3D &quot;Fails to build with RSS <a href=3D=
"http://errors.yoctoproject.org/Errors/Details/130659/" rel=3D"noreferrer" =
target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130659=
/</a>&quot;<br>
meta-oe/recipes-multimedia/<wbr>minidlna/minidlna_1.1.5.bb:PNB<wbr>LACKLIST=
[minidlna] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoct=
oproject.org/Errors/Details/130630/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://errors.yoctoproject.<wbr>org/Errors/Details/130630/</a>&quot;<br>
meta-oe/recipes-multimedia/<wbr>mplayer/mplayer2_git.bb:PNBLAC<wbr>KLIST[mp=
layer2] ?=3D &quot;Not compatible with currently used ffmpeg 3&quot;pends o=
n blacklisted modemmanager&quot;<br>
meta-oe/recipes-navigation/<wbr>gypsy/gypsy.inc:PNBLACKLIST[<wbr>gypsy] ?=
=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5&=
#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FE=
ATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-oe/recipes-navigation/<wbr>navit/navit.inc:PNBLACKLIST[<wbr>navit] ?=
=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5&=
#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FE=
ATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-oe/recipes-sato/claws-<wbr>mail/claws-mail_3.9.0.bb:PNBLA<wbr>CKLIST[c=
laws-mail] ?=3D &quot;depends on blacklisted libetpan&quot;<br>
meta-oe/recipes-sato/claws-<wbr>mail/claws-plugin-gtkhtml2-<wbr>viewer_0.31=
.bb:PNBLACKLIST[<wbr>claws-plugin-gtkhtml2-viewer] ?=3D &quot;depends on bl=
acklisted claws-mail&quot;<br>
meta-oe/recipes-sato/claws-<wbr>mail/claws-plugin-mailmbox_1.<wbr>15.bb:PNB=
LACKLIST[claws-<wbr>plugin-mailmbox] ?=3D &quot;depends on blacklisted claw=
s-mail&quot;<br>
meta-oe/recipes-sato/claws-<wbr>mail/claws-plugin-rssyl_0.34.<wbr>bb:PNBLAC=
KLIST[claws-plugin-<wbr>rssyl] ?=3D &quot;depends on blacklisted claws-mail=
&quot;<br>
meta-oe/recipes-sato/claws-<wbr>mail/sylpheed_2.7.1.bb:PNBLACK<wbr>LIST[syl=
pheed] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctopro=
ject.org/Errors/Details/130651/" rel=3D"noreferrer" target=3D"_blank">http:=
//errors.yoctoproject.<wbr>org/Errors/Details/130651/</a>&quot;<br>
meta-oe/recipes-support/<wbr>apcupsd/apcupsd_3.14.10.bb:PNB<wbr>LACKLIST[ap=
cupsd] ?=3D &quot;BROKEN: doesn&#39;t build with B!=3DS&quot;<br>
meta-oe/recipes-support/emacs/<wbr>emacs_23.4.bb:PNBLACKLIST[<wbr>emacs] ?=
=3D &quot;qemu: uncaught target signal 11 (Segmentation fault) - core dumpe=
d&quot;<br>
meta-oe/recipes-support/<wbr>farsight/farsight2_0.0.22.bb:P<wbr>NBLACKLIST[=
farsight2] ?=3D &quot;Depends on blacklisted gstreamer&quot;<br>
meta-oe/recipes-support/<wbr>farsight/farsight2_0.0.22.bb:P<wbr>NBLACKLIST[=
farsight2] ?=3D &quot;Depends on blacklisted libnice&quot;<br>
meta-oe/recipes-support/<wbr>farsight/farsight2_0.0.22.bb:P<wbr>NBLACKLIST[=
farsight2] ?=3D &quot;Depends on blacklisted gst-plugins-base&quot;<br>
meta-oe/recipes-support/<wbr>farsight/libnice_0.0.13.bb:PNB<wbr>LACKLIST[li=
bnice] ?=3D &quot;Depends on blacklisted gstreamer&quot;<br>
meta-oe/recipes-support/fftw/<wbr>benchfft_3.1.bb:PNBLACKLIST[<wbr>benchfft=
] ?=3D &quot;does not build with distroless qemuarm as reported in &#39;Sta=
te of bitbake world&#39; thread, nobody volunteered to fix them&quot;<br>
meta-oe/recipes-support/<wbr>iksemel/iksemel_1.4.bb:PNBLACK<wbr>LIST[ikseme=
l] ?=3D &quot;Not compatible with gnutls version 3.4 currently in oe-core&q=
uot;<br>
meta-oe/recipes-support/<wbr>ipmiutil/ipmiutil_2.9.6.bb:PNB<wbr>LACKLIST[ip=
miutil] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctopr=
oject.org/Errors/Details/130641/" rel=3D"noreferrer" target=3D"_blank">http=
://errors.yoctoproject.<wbr>org/Errors/Details/130641/</a>&quot;<br>
meta-oe/recipes-support/<wbr>libdbi/libdbi-drivers_0.8.3-1.<wbr>bb:PNBLACKL=
IST[libdbi-drivers] ?=3D &quot;BROKEN: fails to build with gcc-5&quot;<br>
meta-oe/recipes-support/<wbr>libetpan/libetpan_0.57.bb:PNBL<wbr>ACKLIST[lib=
etpan] ?=3D &quot;Not compatible with gnutls version 3.4 currently in oe-co=
re&quot;<br>
meta-oe/recipes-support/<wbr>libsdl-ttf/libsdl-ttf_2.0.11.<wbr>bb:PNBLACKLI=
ST[libsdl-ttf] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.=
yoctoproject.org/Errors/Details/130598/" rel=3D"noreferrer" target=3D"_blan=
k">http://errors.yoctoproject.<wbr>org/Errors/Details/130598/</a>&quot;<br>
meta-oe/recipes-support/<wbr>libsdl-ttf/libsdl2-ttf_2.0.14.<wbr>bb:PNBLACKL=
IST[libsdl2-ttf] ?=3D &quot;Fails to build with RSS <a href=3D"http://error=
s.yoctoproject.org/Errors/Details/130656/" rel=3D"noreferrer" target=3D"_bl=
ank">http://errors.yoctoproject.<wbr>org/Errors/Details/130656/</a>&quot;<b=
r>
meta-oe/recipes-support/lm_<wbr>sensors/lmsensors_3.4.0.bb:PNB<wbr>LACKLIST=
[lmsensors] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoc=
toproject.org/Errors/Details/131629/" rel=3D"noreferrer" target=3D"_blank">=
http://errors.yoctoproject.<wbr>org/Errors/Details/131629/</a>&quot;<br>
meta-oe/recipes-support/<wbr>multipath-tools/multipath-<wbr>tools_git.bb:PN=
BLACKLIST[<wbr>multipath-tools] ?=3D &quot;Fails to build with RSS <a href=
=3D"http://errors.yoctoproject.org/Errors/Details/130529/" rel=3D"noreferre=
r" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130=
529/</a>&quot;<br>
meta-oe/recipes-support/ode/<wbr>ode_0.13.bb:PNBLACKLIST[ode] ?=3D &quot;Fa=
ils to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Deta=
ils/130599/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoprojec=
t.<wbr>org/Errors/Details/130599/</a>&quot;<br>
meta-oe/recipes-support/ode/<wbr>ode_0.13.bb:PNBLACKLIST[ode] ?=3D &quot;Fa=
ils to build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Deta=
ils/130620/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoprojec=
t.<wbr>org/Errors/Details/130620/</a>&quot;<br>
meta-oe/recipes-support/open-<wbr>vcdiff/open-vcdiff_0.8.4.bb:PN<wbr>BLACKL=
IST[open-vcdiff] ?gin/pidgin-otr_4.0.0.bb:PNBLA<wbr>CKLIST[pidgin-otr] ?=3D=
 &quot;depends on blacklisted pidgin&quot;<br>
meta-oe/recipes-support/<wbr>pidgin/pidgin_2.11.0.bb:PNBLAC<wbr>KLIST[pidgi=
n] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject=
.org/Errors/Details/130634/" rel=3D"noreferrer" target=3D"_blank">http://er=
rors.yoctoproject.<wbr>org/Errors/Details/130634/</a>&quot;<br>
meta-oe/recipes-support/<wbr>postgresql/postgresql_9.4.10.<wbr>bb:PNBLACKLI=
ST[postgresql] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.=
yoctoproject.org/Errors/Details/131632/" rel=3D"noreferrer" target=3D"_blan=
k">http://errors.yoctoproject.<wbr>org/Errors/Details/131632/</a>&quot;<br>
meta-oe/recipes-support/<wbr>psqlodbc/psqlodbc_09.05.0300.<wbr>bb:PNBLACKLI=
ST[psqlodbc] ?=3D &quot;Depends on blacklisted postgresql&quot;<br>
meta-oe/recipes-support/<wbr>syslog-ng/syslog-ng_3.6.4.bb:P<wbr>NBLACKLIST[=
syslog-ng] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoct=
oproject.org/Errors/Details/130631/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://errors.yoctoproject.<wbr>org/Errors/Details/130631/</a>&quot;<br>
meta-oe/recipes-support/<wbr>system-config-keyboard/system-<wbr>config-keyb=
oard_1.4.0.bb:PNBLA<wbr>CKLIST[system-config-keyboard] ?=3D &quot;Fails to =
build with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/132=
829/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>=
org/Errors/Details/132829/</a>&quot;<br>
meta-oe/recipes-support/usb-<wbr>modeswitch/usb-modeswitch-<wbr>data_201405=
29.bb:PNBLACKLIST[<wbr>usb-modeswitch-data] ?=3D &quot;Runtime depends on b=
lacklisted usb-modeswitch&quot;<br>
meta-oe/recipes-support/usb-<wbr>modeswitch/usb-modeswitch-<wbr>data_201405=
29.bb:PNBLACKLIST[<wbr>usb-modeswitch-data] ?=3D &quot;Runtime depends on b=
lacklisted usb-modeswitch-data&quot;<br>
meta-oe/recipes-support/usb-<wbr>modeswitch/usb-modeswitch_2.2.<wbr>0.bb:PN=
BLACKLIST[usb-<wbr>modeswitch] ?=3D &quot;Fails to build with RSS <a href=
=3D"http://errors.yoctoproject.org/Errors/Details/130620/" rel=3D"noreferre=
r" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130=
620/</a>&quot;<br>
meta-oe/recipes-support/vala-<wbr>terminal/<a href=3D"http://vala-terminal_=
git.bb">vala-terminal_git.bb</a>:<wbr>PNBLACKLIST[vala-terminal] ?=3D &quot=
;BROKEN: Doesn&#39;t work with B!=3DS, touch: cannot touch `src/.stamp&#39;=
: No such file or directory&quot;<br>
meta-oe/recipes-support/<wbr>vboxguestdrivers/<wbr>vboxguestdrivers_4.3.36.=
bb:PNB<wbr>LACKLIST[vboxguestdrivers] ?=3D &quot;BROKEN: not compatible wit=
h default kernel version 4.8&quot;<br>
meta-oe/recipes-support/xchat/<wbr>xchat_2.8.8.bb:PNBLACKLIST[<wbr>xchat] ?=
=3D &quot;Depends on blacklisted libsexy&quot;<br>
meta-oe/recipes-support/xdg-<wbr>user-dirs/xdg-user-dirs_0.15.<wbr>bb:PNBLA=
CKLIST[xdg-user-dirs] ?=3D &quot;Fails to build with RSS <a href=3D"http://=
errors.yoctoproject.org/Errors/Details/130635/" rel=3D"noreferrer" target=
=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130635/</a>&=
quot;<br>
meta-python/recipes-<wbr>connectivity/gateone/gateone_<wbr>git.bb:PNBLACKLI=
ST[gateone] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoc=
toproject.org/Errors/Details/130642/" rel=3D"noreferrer" target=3D"_blank">=
http://errors.yoctoproject.<wbr>org/Errors/Details/130642/</a>&quot;<br>
meta-python/recipes-devtools/<wbr>python/python-cryptography-<wbr>vectors_1=
.6.bb:PNBLACKLIST[<wbr>python-cryptography-vectors] ?=3D &quot;Fails to bui=
ld with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/130664=
/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org=
/Errors/Details/130664/</a>&quot;<br>
meta-python/recipes-devtools/<wbr>python/python-pbr_1.10.0.bb:PN<wbr>BLACKL=
IST[python-pbr] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors=
.yoctoproject.org/Errors/Details/130650/" rel=3D"noreferrer" target=3D"_bla=
nk">http://errors.yoctoproject.<wbr>org/Errors/Details/130650/</a>&quot;<br=
>
meta-python/recipes-devtools/<wbr>python/python3-cryptography-<wbr>vectors_=
1.6.bb:PNBLACKLIST[<wbr>python3-cryptography-vectors] ?=3D &quot;Fails to b=
uild with RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/1306=
26/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>o=
rg/Errors/Details/130626/</a>&quot;<br>
meta-python/recipes-devtools/<wbr>python/python3-ndg-<wbr>httpsclient_0.4.2=
.bb:PNBLACKLI<wbr>ST[python3-ndg-httpsclient] ?=3D &quot;Fails to build wit=
h RSS <a href=3D"http://errors.yoctoproject.org/Errors/Details/130615/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Error=
s/Details/130615/</a>&quot;<br>
meta-python/recipes-devtools/<wbr>python/python3-pymisp_2.4.54.<wbr>bb:PNBL=
ACKLIST[python3-pymisp] ?=3D &quot;Runtime depends on blacklisted python3-p=
ymisp&quot;<br>
meta-python/recipes-devtools/<wbr>python/python3-pymisp_2.4.54.<wbr>bb:PNBL=
ACKLIST[python3-pymisp] ?=3D &quot;Runtime depends on blacklisted python3-p=
ymisp-dev&quot;<br>
meta-python/recipes-devtools/<wbr>python/python3-requests_2.13.<wbr>0.bb:PN=
BLACKLIST[python3-<wbr>requests] ?=3D &quot;Runtime depends on blacklisted =
python3-ndg-httpsclient&quot;<br>
meta-python/recipes-devtools/<wbr>python/python3-requests_2.13.<wbr>0.bb:PN=
BLACKLIST[python3-<wbr>requests] ?=3D &quot;Runtime depends on blacklisted =
python3-requests-dev&quot;<br>
meta-ruby/recipes-devtools/<wbr>ruby/bundler_git.bb:PNBLACKLIS<wbr>T[bundle=
r] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoprojecd=
s" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoprojecds</a> on =
blacklisted tumbler&quot;<br>
meta-xfce/recipes-apps/<wbr>ristretto/ristretto_0.8.1.bb:P<wbr>NBLACKLIST[r=
istretto] ?=3D &quot;Runtime depends on blacklisted ristretto-dev&quot;<br>
meta-xfce/recipes-apps/<wbr>ristretto/ristretto_0.8.1.bb:P<wbr>NBLACKLIST[r=
istretto] ?=3D &quot;Runtime depends on blacklisted ristretto&quot;<br>
meta-xfce/recipes-apps/xfce4-<wbr>mixer/xfce4-mixer_4.11.0.bb:PN<wbr>BLACKL=
IST[xfce4-mixer] ?=3D &quot;Depends on blacklisted gst-plugins-base&quot;<b=
r>
meta-xfce/recipes-art/cursor-<wbr>themes/openzone_1.2.3.bb:PNBLA<wbr>CKLIST=
[openzone] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoct=
oproject.org/Errors/Details/130682/" rel=3D"noreferrer" target=3D"_blank">h=
ttp://errors.yoctoproject.<wbr>org/Errors/Details/130682/</a>&quot;<br>
meta-xfce/recipes-extended/<wbr>imsettings/imsettings_1.7.1.<wbr>bb:PNBLACK=
LIST[imsettings] ?=3D &quot;Depends on blacklisted libgxim&quot;<br>
meta-xfce/recipes-multimedia/<wbr>packagegroups/packagegroup-<wbr>xfce-mult=
imedia.bb:PNBLACKLIST<wbr>[packagegroup-xfce-multimedia] ?=3D &quot;Runtime=
 depends on blacklisted xfce4-mpc-plugin&quot;<br>
meta-xfce/recipes-multimedia/<wbr>packagegroups/packagegroup-<wbr>xfce-mult=
imedia.bb:PNBLACKLIST<wbr>[packagegroup-xfce-multimedia] ?=3D &quot;Runtime=
 depends on blacklisted packagegroup-xfce-multimedia&quot;<br>
meta-xfce/recipes-multimedia/<wbr>packagegroups/packagegroup-<wbr>xfce-mult=
imedia.bb:PNBLACKLIST<wbr>[packagegroup-xfce-multimedia] ?=3D &quot;Runtime=
 depends on blacklisted xfmpc&quot;<br>
meta-xfce/recipes-multimedia/<wbr>xfce4-mpc-plugin/xfce4-mpc-<wbr>plugin_0.=
5.0.bb:PNBLACKLIST[<wbr>xfce4-mpc-plugin] ?=3D &quot;Runtime depends on bla=
cklisted mpd&quot;<br>
meta-xfce/recipes-multimedia/<wbr>xfce4-mpc-plugin/xfce4-mpc-<wbr>plugin_0.=
5.0.bb:PNBLACKLIST[<wbr>xfce4-mpc-plugin] ?=3D &quot;Runtime depends on bla=
cklisted xfce4-mpc-plugin&quot;<br>
meta-xfce/recipes-multimedia/<wbr>xfce4-mpc-plugin/xfce4-mpc-<wbr>plugin_0.=
5.0.bb:PNBLACKLIST[<wbr>xfce4-mpc-plugin] ?=3D &quot;Runtime depends on bla=
cklisted xfce4-mpc-plugin-dev&quot;<br>
meta-xfce/recipes-multimedia/<wbr>xfmpc/xfmpc_0.2.3.bb:PNBLACKLI<wbr>ST[xfm=
pc] ?=3D &quot;Runtime depends on blacklisted mpd&quot;<br>
meta-xfce/recipes-multimedia/<wbr>xfmpc/xfmpc_0.2.3.bb:PNBLACKLI<wbr>ST[xfm=
pc] ?=3D &quot;Runtime depends on blacklisted xfmpc-dev&quot;<br>
meta-xfce/recipes-multimedia/<wbr>xfmpc/xfmpc_0.2.3.bb:PNBLACKLI<wbr>ST[xfm=
pc] ?=3D &quot;Runtime depends on blacklisted xfmpc&quot;<br>
meta-xfce/recipes-panel-<wbr>plugins/sensors/xfce4-sensors-<wbr>plugin_1.2.=
6.bb:PNBLACKLIST[<wbr>xfce4-sensors-plugin] ?=3D &quot;Depends on blacklist=
ed lmsensors&quot;<br>
meta-xfce/recipes-panel-<wbr>plugins/verve/xfce4-verve-<wbr>plugin_1.1.0.bb=
:PNBLACKLIST[<wbr>xfce4-verve-plugin] ?=3D &quot;Fails to build with RSS <a=
 href=3D"http://errors.yoctoproject.org/Errors/Details/130622/" rel=3D"nore=
ferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Detail=
s/130622/</a>&quot;<br>
meta-xfce/recipes-panel-<wbr>plugins/whiskermenu/xfce4-<wbr>whiskermenu-plu=
gin_2.0.3.bb:PN<wbr>BLACKLIST[xfce4-whiskermenu-<wbr>plugin] ?=3D &quot;Run=
time depends on blacklisted menulibre&quot;<br>
meta-xfce/recipes-xfce/<wbr>packagegroups/packagegroup-<wbr>xfce-extended.b=
b:PNBLACKLIST[<wbr>packagegroup-xfce-extended] ?=3D &quot;Runtime depends o=
n blacklisted xfce4-mixer&quot;<br>
meta-xfce/recipes-xfce/<wbr>packagegroups/packagegroup-<wbr>xfce-extended.b=
b:PNBLACKLIST[<wbr>packagegroup-xfce-extended] ?=3D &quot;Runtime depends o=
n blacklisted xfce4-verve-plugin&quot;<br>
meta-xfce/recipes-xfce/<wbr>packagegroups/packagegroup-<wbr>xfce-extended.b=
b:PNBLACKLIST[<wbr>packagegroup-xfce-extended] ?=3D &quot;Runtime depends o=
n blacklisted ristretto&quot;<br>
meta-xfce/recipes-xfce/<wbr>tumbler/tumbler_0.1.31.bb:PNBL<wbr>ACKLIST[tumb=
ler] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproje=
ct.org/Errors/Details/132828/" rel=3D"noreferrer" target=3D"_blank">http://=
errors.yoctoproject.<wbr>org/Errors/Details/132828/</a>&quot;<br>
meta-qt5:<br>
meta-smartphone:<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/fso-<wbr>apm_git.bb:PNBLACK=
LIST[fso-<wbr>apm] ?=3D &quot;Depends on blacklisted libfso-glib&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>fsoaudiod_0.12.0.bb:PN=
BLACKLIS<wbr>T[fsoaudiod] ?=3D &quot;Depends on blacklisted libfso-glib&quo=
t;<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>fsoaudiod_git.bb:PNBLA=
CKLIST[<wbr>fsoaudiod] ?=3D &quot;Depends on blacklisted libfso-glib&quot;<=
br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>fsodatad_0.12.0.bb:PNB=
LACKLIST<wbr>[fsodatad] ?=3D &quot;Depends on blands on blacklisted libfso-=
glib&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>fsonetworkd_0.12.0.bb:=
PNBLACKL<wbr>IST[fsonetworkd] ?=3D &quot;Depends on blacklisted libfso-glib=
&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>fsonetworkd_git.bb:PNB=
LACKLIST<wbr>[fsonetworkd] ?=3D &quot;Depends on blacklisted libfso-glib&qu=
ot;<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>fsoraw_git.bb:PNBLACKL=
IST[<wbr>fsoraw] ?=3D &quot;Depends on blacklisted libfso-glib&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>fsotdld_0.12.0.bb:PNBL=
ACKLIST[<wbr>fsotdld] ?=3D &quot;Depends on blacklisted libfso-glib&quot;<b=
r>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>fsotdld_git.bb:PNBLACK=
LIST[<wbr>fsotdld] ?=3D &quot;Depends on blacklisted libfso-glib&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>fsousaged_0.12.0.bb:PN=
BLACKLIS<wbr>T[fsousaged] ?=3D &quot;Depends on blacklisted libfso-glib&quo=
t;<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>fsousaged_git.bb:PNBLA=
CKLIST[<wbr>fsousaged] ?=3D &quot;Depends on blacklisted libfso-glib&quot;<=
br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>libfsoframework_0.12.0=
.bb:PNBL<wbr>ACKLIST[libfsoframework] ?=3D &quot;Depends on blacklisted lib=
fso-glib&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>libfsoframework_git.bb=
:PNBLACK<wbr>LIST[libfsoframework] ?=3D &quot;Depends on blacklisted libfso=
-glib&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>mkdump_git.bb:PNBLACKL=
IST[<wbr>mkdump] ?=3D &quot;Depends on blacklisted libfsoframework&quot;<br=
>
meta-fso/recipes-<wbr>freesmartphone/cornucopia/<wbr>mterm2_git.bb:PNBLACKL=
IST[<wbr>mterm2] ?=3D &quot;Depends on blacklisted libfsoframework&quot;<br=
>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>frameworkd_0.10.1.=
bb:PNBLACKLI<wbr>ST[frameworkd] ?=3D &quot;Runtime depends on blacklisted f=
sousaged&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>frameworkd_git.bb:=
PNBLACKLIST[<wbr>frameworkd] ?=3D &quot;Runtime depends on blacklisted fsou=
saged&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>frameworkd_git.bb:=
PNBLACKLIST[<wbr>frameworkd] ?=3D &quot;Runtime depends on blacklisted fram=
eworkd-dev&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>fso-gpsd_git.bb:PN=
BLACKLIST[<wbr>fso-gpsd] ?=3D &quot;Runtime depends on blacklisted fso-gpsd=
-dev&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>fso-gsm0710muxd_gi=
t.bb:PNBLACK<wbr>LIST[fso-gsm0710muxd] ?=3D &quot;Fails to build with RSS <=
a href=3D"http://errors.yoctoproject.org/Errors/Details/130517/" rel=3D"nor=
eferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Detai=
ls/130517/</a>&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>libframeworkd-glib=
_git.bb:PNBL<wbr>ACKLIST[libframeworkd-glib] ?=3D &quot;BROKEN: many errors=
 when building with gcc-6&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>libfso-glib_2012.0=
7.27.2.bb:PN<wbr>BLACKLIST[libfso-glib] ?=3D &quot;Depends on blacklisted v=
ala-dbus-binding-tool&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>libfso-glib_git.bb=
:PNBLACKLIST<wbr>[libfso-glib] ?=3D &quot;Depends on blacklisted vala-dbus-=
binding-tool&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>mickeyterm_git.bb:=
PNBLACKLIST[<wbr>mickeyterm] ?=3D &quot;Runtime depends on blacklisted fso-=
gsm0710muxd&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>opimd-utils_git.bb=
:PNBLACKLIST<wbr>[opimd-utils] ?=3D &quot;Runtime depends on blacklisted ff=
phonelog&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/freesmartphone/<wbr>zhone_git.bb:PNBLA=
CKLIST[<wbr>zhone] ?=3D &quot;rdepends on python-pycairo which was removed&=
quot;<br>
meta-fso/recipes-<wbr>freesmartphone/packagegroups/<wbr>packagegroup-fso2-c=
ompliance.<wbr>bb:PNBLACKLIST[packagegroup-<wbr>fso2-compliance] ?=3D &quot=
;Runtime depends on blacklisted fsoaudiod-config&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/packagegroups/<wbr>packagegroup-fso2-c=
ompliance.<wbr>bb:PNBLACKLIST[packagegroup-<wbr>fso2-compliance] ?=3D &quot=
;Runtime depends on blacklisted mkdump&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/packagegroups/<wbr>packagegroup-fso2-c=
ompliance.<wbr>bb:PNBLACKLIST[packagegroup-<wbr>fso2-compliance] ?=3D &quot=
;Runtime depends on blacklisted fsonetworkd&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/packagegroups/<wbr>packagegroup-fso2-c=
ompliance.<wbr>bb:PNBLACs on blacklisted fsogsmd&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/packagegroups/<wbr>packagegroup-fso2-c=
ompliance.<wbr>bb:PNBLACKLIST[packagegroup-<wbr>fso2-compliance] ?=3D &quot=
;Runtime depends on blacklisted mterm2&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/packagegroups/<wbr>packagegroup-fso2-c=
ompliance.<wbr>bb:PNBLACKLIST[packagegroup-<wbr>fso2-compliance] ?=3D &quot=
;Runtime depends on blacklisted fsodeviced&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/packagegroups/<wbr>packagegroup-fso2-c=
ompliance.<wbr>bb:PNBLACKLIST[packagegroup-<wbr>fso2-compliance] ?=3D &quot=
;Runtime depends on blacklisted fsotdld&quot;<br>
meta-fso/recipes-<wbr>freesmartphone/packagegroups/<wbr>packagegroup-fso2-c=
ompliance.<wbr>bb:PNBLACKLIST[packagegroup-<wbr>fso2-compliance] ?=3D &quot=
;Runtime depends on blacklisted fsousaged&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>advancedcaching_git.bb:PNBLACK<wbr>LIST[=
advancedcaching] ?=3D &quot;RDEPENDS on python-pygtk was removed from oe-co=
re&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>atd-over-fso_0.70.bb:PNBLACKLI<wbr>ST[at=
d-over-fso] ?=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoc=
toproject.org/Errors/Details/130540/" rel=3D"noreferrer" target=3D"_blank">=
http://errors.yoctoproject.<wbr>org/Errors/Details/130540/</a>&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>atrack_svn.bb:PNBLACKLIST[<wbr>atrack] ?=
=3D &quot;Runtime depends on blacklisted python-elementary&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>babiloo-efl_2.0.9-10.bb:PNBLAC<wbr>KLIST=
[babiloo-efl] ?=3D &quot;Runtime depends on blacklisted python-elementary&q=
uot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>babiloo-efl_bzr.bb:PNBLACKLIST<wbr>[babi=
loo-efl] ?=3D &quot;Runtime depends on blacklisted python-elementary&quot;<=
br>
meta-shr/recipes-shr/3rdparty/<wbr>babiloo-efl_bzr.bb:PNBLACKLIST<wbr>[babi=
loo-efl] ?=3D &quot;Runtime depends on blacklisted babiloo-efl&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>babiloo-efl_bzr.bb:PNBLACKLIST<wbr>[babi=
loo-efl] ?=3D &quot;Runtime depends on blacklisted babiloo-efl-dev&quot;<br=
>
meta-shr/recipes-shr/3rdparty/<wbr>chroneo_svn.bb:PNBLACKLIST[<wbr>chroneo]=
 ?=3D &quot;Runtime depends on blacklisted python-elementary&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>ecalc_git.bb:PNBLACKLIST[<wbr>ecalc] ?=
=3D &quot;Runtime depends on blacklisted python-edbus&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>ecalc_git.bb:PNBLACKLIST[<wbr>ecalc] ?=
=3D &quot;Runtime depends on blacklisted python-elementary&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>emtooth2_svn.bb:PNBLACKLIST[<wbr>emtooth=
2] ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;blu=
ez5&#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTR=
O_FEATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>estardict_0.7.bb:PNBLACKLIST[<wbr>estard=
ict] ?=3D &quot;Depends on blacklisted elementary&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>ffalarms_git.bb:PNBLACKLIST[<wbr>ffalarm=
s] =3D &quot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1&quo=
t;<br>
meta-shr/recipes-shr/3rdparty/<wbr>ffphonelog_git.bb:PNBLACKLIST[<wbr>ffpho=
nelog] ?=3D &quot;Depends on blacklisted libeflvala&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>guitartune_svn.bb:PNBLACKLIST[<wbr>guita=
rtune] ?=3D &quot;Depends on blacklisted libglade&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>gwaterpas_0.3.bb:PNBLACKLIST[<wbr>gwater=
pas] ?=3D &quot;broken: depends on blacklisted fltk&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>iliwi_git.bb:PNBLACKLIST[<wbr>iliwi] =3D=
 &quot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>intone_git.bb:PNBLACKLIST[<wbr>intone] =
=3D &quot;rdepends on blacklisted mplayer2&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>jefliks_git.bb:PNBLACKLIST[<wbr>jefliks]=
 ?=3D &quot;depends on blacklisted iksemel&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>minneo_svn.bb:PNBLACKLIST[<wbr>minneo] ?=
=3D &quot;Runtime depends on blacklisted python-elementary&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>mokojeweled_git.bb:PNBLACKLIST<wbr>[moko=
jeweled] ?=3D &quot;Depends on blacklisted elementary&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>neolight_svn.bb:PNBLACKLIST[<wbr>neoligh=
t] ?=3D &quot;Runtime depends on blacklisted python-edbus&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>neolight_svn.bb:PNBLACKLIST[<wbr>neoligh=
t] ?=3D &quot;Runtime depends on blacklisted python-elementary&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>neomis_svn.bb:PNBLACKLIST[<wbr>neomi dep=
ends on blacklisted om-neon&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>omext_0.2.bb:PNBLACKLIST[<wbr>omext] ?=
=3D &quot;Fails to build with RSS <a href=3D"http://errors.yoctoproject.org=
/Errors/Details/130539/" rel=3D"noreferrer" target=3D"_blank">http://errors=
.yoctoproject.<wbr>org/Errors/Details/130539/</a>&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>openmoko-gps_svn.bb:PNBLACKLIS<wbr>T[ope=
nmoko-gps] ?=3D &quot;RDEPENDS on python-pygtk which was removed from oe-co=
re&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>pisi_0.5.3.bb:PNBLACKLIST[<wbr>pisi] ?=
=3D &quot;RDEPENDS on python-pygtk which was removed from oe-core&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>podboy_svn.bb:PNBLACKLIST[<wbr>podboy] ?=
=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;bluez5&=
#39;, &#39;bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FE=
ATURES&#39;, &#39;&#39;, d)}&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>rtmom_0.1.3.bb:PNBLACKLIST[<wbr>rtmom] ?=
=3D &quot;Depends on blacklisted python-elementary&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>sensmon_git.bb:PNBLACKLIST[<wbr>sensmon]=
 =3D &quot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26.1&quot;=
<br>
meta-shr/recipes-shr/3rdparty/<wbr>spojegui_svn.bb:PNBLACKLIST[<wbr>spojegu=
i] ?=3D &quot;Runtime depends on blacklisted python-elementary&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>vagalume_0.8.5.bb:PNBLACKLIST[<wbr>vagal=
ume] ?=3D &quot;Depends on blacklisted gstreamer&quot;<br>
meta-shr/recipes-shr/3rdparty/<wbr>valacompass_git.bb:PNBLACKLIST<wbr>[vala=
compass] =3D &quot;Doesn&#39;t build after vala upgrade from 0.24.0 to 0.26=
.1&quot;<br>
meta-shr/recipes-shr/games/<wbr>aceofpenguins_1.4.bb:PNBLACKLI<wbr>ST[aceof=
penguins] ?=3D &quot;BROKEN: fails to build with new binutils-2.27&quot;<br=
>
meta-shr/recipes-shr/games/<wbr>mokomaze_0.5.5.bb:PNBLACKLIST[<wbr>mokomaze=
] ?=3D &quot;Depends on blacklisted libsdl-ttf&quot;<br>
meta-shr/recipes-shr/games/<wbr>mokomaze_0.5.5.bb:PNBLACKLIST[<wbr>mokomaze=
] ?=3D &quot;Depends on blacklisted ode&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d mokomaze&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d dates&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d dbus-daemon-proxy&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d guitartune&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d illume-keyboard-default-<wbr>numeric&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d e-tasks&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d enjoy&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d mokojeweled&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d estardict&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d gpe-scap&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d ffphonelog&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d om-neon&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d python-elementary&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-feed.bb:PNBLA=
CKLIST[<wbr>packagegroup-shr-feed] ?=3D &quot;Runtime depends on blackliste=
d elfe&quot;<br>
meta-shr/recipes-shpends on blacklisted libphone-ui-shr&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr-minimal.bb:PN=
BLACKLIST[<wbr>packagegroup-shr-minimal] ?=3D &quot;Runtime depends on blac=
klisted ffphonelog&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr.bb:PNBLACKLIS=
T[<wbr>packagegroup-shr] ?=3D &quot;Runtime depends on blacklisted packageg=
roup-cli-tools-debug&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr.bb:PNBLACKLIS=
T[<wbr>packagegroup-shr] ?=3D &quot;Runtime depends on blacklisted packageg=
roup-shr-minimal-cli&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr.bb:PNBLACKLIS=
T[<wbr>packagegroup-shr] ?=3D &quot;Runtime depends on blacklisted packageg=
roup-cli-tools&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr.bb:PNBLACKLIS=
T[<wbr>packagegroup-shr] ?=3D &quot;Runtime depends on blacklisted packageg=
roup-shr-minimal-apps&quot;<br>
meta-shr/recipes-shr/<wbr>packagegroups/packagegroup-<wbr>shr.bb:PNBLACKLIS=
T[<wbr>packagegroup-shr] ?=3D &quot;Runtime depends on blacklisted vagalume=
&quot;<br>
meta-shr/recipes-shr/shr/e-wm-<wbr>config-illume2-shr_git.bb:PNBL<wbr>ACKLI=
ST[e-wm-config-illume2-<wbr>shr] ?=3D &quot;Fails to build with RSS <a href=
=3D"http://errors.yoctoproject.org/Errors/Details/130520/" rel=3D"noreferre=
r" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/Details/130=
520/</a>&quot;<br>
meta-shr/recipes-shr/shr/<wbr>libphone-ui-shr_git.bb:PNBLACK<wbr>LIST[libph=
one-ui-shr] ?=3D &quot;Depends on blacklisted elementary&quot;<br>
meta-shr/recipes-shr/shr/<wbr>libphone-ui_git.bb:PNBLACKLIST<wbr>[libphone-=
ui] ?=3D &quot;Depends on blacklisted libfso-glib&quot;<br>
meta-shr/recipes-shr/shr/<wbr>phonefsod_git.bb:PNBLACKLIST[<wbr>phonefsod] =
?=3D &quot;Depends on blacklisted libfso-glib&quot;<br>
meta-shr/recipes-shr/shr/<wbr>phoneuid_git.bb:PNBLACKLIST[<wbr>phoneuid] ?=
=3D &quot;Depends on blacklisted libfso-glib&quot;<br>
meta-shr/recipes-shr/shr/shr-<wbr>e-gadgets_git.bb:PNBLACKLIST[<wbr>shr-e-g=
adgets] ?=3D &quot;Depends on blacklisted elementary&quot;<br>
meta-shr/recipes-shr/shr/shr-<wbr>installer_git.bb:PNBLACKLIST[<wbr>shr-ins=
taller] ?=3D &quot;Depends on blacklisted packagekit&quot;<br>
meta-shr/recipes-shr/shr/shr-<wbr>settings_git.bb:PNBLACKLIST[<wbr>shr-sett=
ings] ?=3D &quot;Runtime depends on blacklisted python-edbus&quot;<br>
meta-shr/recipes-shr/shr/shr-<wbr>settings_git.bb:PNBLACKLIST[<wbr>shr-sett=
ings] ?=3D &quot;Runtime depends on blacklisted python-elementary&quot;<br>
meta-shr/recipes-shr/shr/shr-<wbr>wizard_git.bb:PNBLACKLIST[shr-<wbr>wizard=
] ?=3D &quot;Depends on blacklisted e-wm&quot;<br>
meta-shr/recipes-shr/themes/e-<wbr>wm-theme-illume-neo_git.bb:PNB<wbr>LACKL=
IST[e-wm-theme-illume-<wbr>neo] ?=3D &quot;Runtime depends on blacklisted e=
-wm&quot;<br>
meta-shr/recipes-shr/themes/e-<wbr>wm-theme-illume-neo_git.bb:PNB<wbr>LACKL=
IST[e-wm-theme-illume-<wbr>neo] ?=3D &quot;Runtime depends on blacklisted e=
-wm-theme-illume-neo-dev&quot;<br>
meta-shr/recipes-shr/themes/e-<wbr>wm-theme-illume-neo_git.bb:PNB<wbr>LACKL=
IST[e-wm-theme-illume-<wbr>neo] ?=3D &quot;Runtime depends on blacklisted e=
-wm-theme-illume-neo&quot;<br>
meta-shr/recipes-shr/themes/<wbr><a href=3D"http://gtk-theme-clearlooks-gtk=
rc.bb">gtk-theme-clearlooks-gtkrc.bb</a>:<wbr>PNBLACKLIST[gtk-theme-<wbr>cl=
earlooks-gtkrc] ?=3D &quot;Runtime depends on blacklisted gtk-theme-clearlo=
oks&quot;<br>
meta-shr/recipes-shr/themes/<wbr><a href=3D"http://gtk-theme-clearlooks-gtk=
rc.bb">gtk-theme-clearlooks-gtkrc.bb</a>:<wbr>PNBLACKLIST[gtk-theme-<wbr>cl=
earlooks-gtkrc] ?=3D &quot;Runtime depends on blacklisted gtk-theme-clearlo=
oks-gtkrc-<wbr>dev&quot;<br>
meta-shr/recipes-shr/themes/<wbr>icon-theme-neo_git.bb:PNBLACKL<wbr>IST[ico=
n-theme-neo] ?=3D &quot;Runtime depends on blacklisted e-wm&quot;<br>
meta-shr/recipes-shr/themes/<wbr>icon-theme-neo_git.bb:PNBLACKL<wbr>IST[ico=
n-theme-neo] ?=3D &quot;Runtime depends on blacklisted icon-theme-neo-dev&q=
uot;<br>
meta-shr/recipes-shr/themes/<wbr>phoneui-shr-theme-neo_git.bb:P<wbr>NBLACKL=
IST[phoneui-shr-theme-<wbr>neo] ?=3D &quot;Runtime depends on blacklisted l=
ibphone-ui-shr&quot;<br>
meta-shr/recipes-shr/themes/<wbr>phoneui-shr-theme-neo_git.bb:P<wbr>NBLACKL=
IST[phoneui-shr-theme-<wbr>neo] ?=3D &quot;Runtime depends on blacklisted p=
honeui-shr-theme-neo-dev&quot;<br>
meta-shr/recipes-shr/themes/<wbr>phoneui-shr-theme-niebiee_git.<wbr>bb:PNBL=
ACKLIST[phoneui-shr-<wbr>theme-niebiee] ?=3D &quot;Runtime depends on black=
listed libphone-ui-shr&quot;<br>
meta-shr/recipes-shr/themes/<wbr>phoneui-LIST[shr-theme-<wbr>niebiee] ?=3D =
&quot;Runtime depends on blacklisted phoneui-shr-theme-niebiee&quot;<br>
meta-shr/recipes-shr/themes/<wbr>shr-theme-niebiee.bb:PNBLACKLI<wbr>ST[shr-=
theme-niebiee] ?=3D &quot;Runtime depends on blacklisted shr-theme-niebiee&=
quot;<br>
meta-shr/recipes-shr/themes/<wbr>shr-theme-niebiee.bb:PNBLACKLI<wbr>ST[shr-=
theme-niebiee] ?=3D &quot;Runtime depends on blacklisted shr-theme-niebiee-=
dev&quot;<br>
meta-shr/recipes-shr/themes/<wbr>shr-theme-o2.bb:PNBLACKLIST[<wbr>shr-theme=
-o2] ?=3D &quot;Runtime depends on blacklisted phoneui-shr-theme-o2&quot;<b=
r>
meta-shr/recipes-shr/themes/<wbr>shr-theme-o2.bb:PNBLACKLIST[<wbr>shr-theme=
-o2] ?=3D &quot;Runtime depends on blacklisted shr-theme-o2&quot;<br>
meta-shr/recipes-shr/themes/<wbr>shr-theme-o2.bb:PNBLACKLIST[<wbr>shr-theme=
-o2] ?=3D &quot;Runtime depends on blacklisted shr-theme-o2-dev&quot;<br>
meta-webos-ports:<br>
meta-luneos/recipes-luneos/<wbr>luna-webappmanager/luna-<wbr>webappmanager.=
bb:PNBLACKLIST[<wbr>luna-webappmanager] ?=3D &quot;BROKEN: needs to be adap=
ted to new qt-5.7&quot;<br>
meta-luneui/recipes-luneui/<wbr>luna-next/luna-next.bb:PNBLACK<wbr>LIST[lun=
a-next] ?=3D &quot;BROKEN: needs to be adapted to new qtwayland-5.7&quot;<b=
r>
PNBLACKLIST[android-system] =3D &quot;depends on lxc from meta-virtualiazat=
ion which isn&#39;t included in my world builds&quot;<br>
PNBLACKLIST[bigbuckbunny-<wbr>1080p] =3D &quot;big and doesn&#39;t really n=
eed to be tested so much&quot;<br>
PNBLACKLIST[bigbuckbunny-480p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;<br>
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;<br>
PNBLACKLIST[bigbuckbunny-720p] =3D &quot;big and doesn&#39;t really need to=
 be tested so much&quot;<br>
PNBLACKLIST[tearsofsteel-<wbr>1080p] =3D &quot;big and doesn&#39;t really n=
eed to be tested so much&quot;<br>
PNBLACKLIST[build-appliance-<wbr>image] =3D &quot;tries to include whole do=
wnloads directory in /home/builder/poky :/&quot;<br>
PNBLACKLIST[linux-yocto-tiny-<wbr>kexecboot] =3D &quot;does weird sh!t brea=
king other kernels and modules - broken for years&quot;<br>
PNBLACKLIST[linux-yocto-tiny] =3D &quot;does weird sh!t breaking other kern=
els and modules - broken for years&quot;<br>
<br>
<br>
QA issues by type:<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: already-stripped<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: libdir<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: textrel<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: build-deps<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: file-rdeps<br>
<br>
count: 680=C2=A0 =C2=A0 =C2=A0 issue: version-going-backwards<br>
audiofile-0.3.6: Package version for package audiofile-bin went backwards w=
hich would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0) [version=
-going-backwards]<br>
audiofile-0.3.6: Package version for package audiofile-bin went backwards w=
hich would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0) [version=
-going-backwards]<br>
audiofile-0.3.6: Package version for package audiofile-dbg went backwards w=
hich would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0) [version=
-going-backwards]<br>
audiofile-0.3.6: Package version for package audiofile-dbg went backwards w=
hich would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0) [version=
-going-backwards]<br>
audiofile-0.3.6: Package version for package audiofile-dev went backwards w=
hich would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0) [version=
-going-backwards]<br>
audiofile-0.3.6: Package version for package audiofile-dev went backwards w=
hich would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0) [version=
-going-backwards]<br>
audiofile-0.3.6: Package version for package audiofile-doc went backwards w=
hich would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0) [version=
-going-backwards]<br>
audiofile-0.3.6: Package version for package audiofile-doc went backwards w=
hich would break package feeds from (0:0.3.6-r0.5 to 0:0.3.6-r0.0) [version=
-going-backwards]<br>
audiofile-0.3.6: Package version for package audiofile-locale went backward=
s which would break package feeds from (0:0.3.6-r0.4 to 0:0.3.6-r0.0) [vers=
ion-g0:0.3.6-r0.5 to 0:0.3.6-r0.0) [version-going-backwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
dbg went backwards which would break package feeds from (0:0.4.11+git0+5141=
85dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-backward=
s]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
dbg went backwards which would break package feeds from (0:0.4.11+git0+5141=
85dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-backward=
s]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
dev went backwards which would break package feeds from (0:0.4.11+git0+5141=
85dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-backward=
s]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
dev went backwards which would break package feeds from (0:0.4.11+git0+5141=
85dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-backward=
s]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
doc went backwards which would break package feeds from (0:0.4.11+git0+5141=
85dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-backward=
s]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
doc went backwards which would break package feeds from (0:0.4.11+git0+5141=
85dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-backward=
s]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-ca went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-ca went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-cs went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-cs went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-da went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-da went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-de went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-de went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-en-gb went backwards which would break package feeds from (0:0.4.11+=
git0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going=
-backwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-en-gb went backwards which would break package feeds from (0:0.4.11+=
git0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) ) [version-goi=
ng-backwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-eu went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-eu went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-fi went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-fi went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-fr went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-fr went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-gl went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-gl went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-hu went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-hu went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-id went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-id went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-it went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-it went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-ja went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-ja went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.<wbr>0kage version f=
or package dates-locale-nl went backwards which would break package feeds f=
rom (0:0.4.11+git0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) =
[version-going-backwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-nl went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-pa went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-pa went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-pl went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-pl went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-pt-br went backwards which would break package feeds from (0:0.4.11+=
git0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going=
-backwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-pt-br went backwards which would break package feeds from (0:0.4.11+=
git0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going=
-backwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-ru went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-ru went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-sl went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-sl went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-sv went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-sv went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-th went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
locale-th went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1reak package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
staticdev went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates-=
staticdev went backwards which would break package feeds from (0:0.4.11+git=
0+514185dc1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-ba=
ckwards]<br>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates =
went backwards which would break package feeds from (0:0.4.11+git0+514185dc=
1f-r9.<wbr>55 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-backwards]<b=
r>
dates-0.4.11+gitAUTOINC+<wbr>514185dc1f: Package version for package dates =
went backwards which would break package feeds from (0:0.4.11+git0+514185dc=
1f-r9.<wbr>65 to 0:0.4.11+git0+514185dc1f-r9.0) [version-going-backwards]<b=
r>
epdf-0.1.0+svnr82070: Package version for package epdf-dbg went backwards w=
hich would break package feeds from (2:0.1.0+svnr82070-r0.47 to 2:0.1.0+svn=
r82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-dbg went backwards w=
hich would break package feeds from (2:0.1.0+svnr82070-r0.57 to 2:0.1.0+svn=
r82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-dev went backwards w=
hich would break package feeds from (2:0.1.0+svnr82070-r0.47 to 2:0.1.0+svn=
r82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-dev went backwards w=
hich would break package feeds from (2:0.1.0+svnr82070-r0.57 to 2:0.1.0+svn=
r82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-doc went backwards w=
hich would break package feeds from (2:0.1.0+svnr82070-r0.47 to 2:0.1.0+svn=
r82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-doc went backwards w=
hich would break package feeds from (2:0.1.0+svnr82070-r0.57 to 2:0.1.0+svn=
r82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-eolian went backward=
s which would break package feeds from (2:0.1.0+svnr82070-r0.47 to 2:0.1.0+=
svnr82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-eolian went backward=
s which would break package feeds from (2:0.1.0+svnr82070-r0.57 to 2:0.1.0+=
svnr82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-locale went backward=
s which would break package feeds from (2:0.1.0+svnr82070-r0.47 to 2:0.1.0+=
svnr82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-locale went backward=
s which would break package feeds from (2:0.1.0+svnr82070-r0.57 to 2:0.1.0+=
svnr82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-staticdev went backw=
ards which would break package feeds from (2:0.1.0+svnr82070-r0.47 to 2:0.1=
.0+svnr82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-staticdev went backw=
ards which would break package feeds from (2:0.1.0+svnr82070-r0.57 to 2:0.1=
.0+svnr82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-tests went backwards=
 which would break package feeds from (2:0.1.0+svnr82070-r0.47 to 2:0.1.0+s=
vnr82070-r0.0) [version-going-backwards]<br>
epdf-0.1.0+svnr82070: Package version for package epdf-tests went backwards=
 which would break package feeds fh would break package feeds from (0:0.2.3=
6-r1.58 to 0:0.2.36-r1.0) [version-going-backwards]<br>
esound-0.2.36: Package version for package esd-utils went backwards which w=
ould break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0) [version-go=
ing-backwards]<br>
esound-0.2.36: Package version for package esd-utils went backwards which w=
ould break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0) [version-go=
ing-backwards]<br>
esound-0.2.36: Package version for package esd went backwards which would b=
reak package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0) [version-going-ba=
ckwards]<br>
esound-0.2.36: Package version for package esd went backwards which would b=
reak package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0) [version-going-ba=
ckwards]<br>
esound-0.2.36: Package version for package esound-dbg went backwards which =
would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0) [version-g=
oing-backwards]<br>
esound-0.2.36: Package version for package esound-dbg went backwards which =
would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0) [version-g=
oing-backwards]<br>
esound-0.2.36: Package version for package esound-dev went backwards which =
would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0) [version-g=
oing-backwards]<br>
esound-0.2.36: Package version for package esound-dev went backwards which =
would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0) [version-g=
oing-backwards]<br>
esound-0.2.36: Package version for package esound-doc went backwards which =
would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0) [version-g=
oing-backwards]<br>
esound-0.2.36: Package version for package esound-doc went backwards which =
would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0) [version-g=
oing-backwards]<br>
esound-0.2.36: Package version for package esound-locale went backwards whi=
ch would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0) [versio=
n-going-backwards]<br>
esound-0.2.36: Package version for package esound-locale went backwards whi=
ch would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0) [versio=
n-going-backwards]<br>
esound-0.2.36: Package version for package esound-staticdev went backwards =
which would break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0) [ver=
sion-going-backwards]<br>
esound-0.2.36: Package version for package esound-staticdev went backwards =
which would break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0) [ver=
sion-going-backwards]<br>
esound-0.2.36: Package version for package esound went backwards which woul=
d break package feeds from (0:0.2.36-r1.50 to 0:0.2.36-r1.0) [version-going=
-backwards]<br>
esound-0.2.36: Package version for package esound went backwards which woul=
d break package feeds from (0:0.2.36-r1.58 to 0:0.2.36-r1.0) [version-going=
-backwards]<br>
evince-3.18.2: Package version for package evince-browser-plugin went backw=
ards which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)=
 [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-browser-plugin went backw=
ards which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)=
 [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-dbg went backwards which =
would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [version-g=
oing-backwards]<br>
evince-3.18.2: Package version for package evince-dbg went backwards which =
would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [version-g=
oing-backwards]<br>
evince-3.18.2: Package version for package evince-dev went backwards which =
would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [version-g=
oing-ds]<br>
evince-3.18.2: Package version for package evince-locale-an went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-an went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ar went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ar went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ast went backwards=
 which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ve=
rsion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ast went backwards=
 which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ve=
rsion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-as went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-as went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-be+latin went back=
wards which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0=
) [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-be+latin went back=
wards which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0=
) [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-be went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-be went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-bg went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-bg went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-bn-in went backwar=
ds which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [=
version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-bn-in went backwar=
ds which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [=
version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-bn went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-bn went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-br went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-br went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-bs went backwards =
which would break package feeds from (0:3.18. would break package feeds fro=
m (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-cs went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-cy went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-cy went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-da went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-da went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-de went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-de went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-dz went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-dz went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-el went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-el went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-en-ca went backwar=
ds which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [=
version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-en-ca went backwar=
ds which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [=
version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-en-gb went backwar=
ds which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [=
version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-en-gb went backwar=
ds which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [=
version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-en+shaw went backw=
ards which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0)=
 [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-en+shaw went backw=
ards which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0)=
 [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-eo went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-eo went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-es went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package versionckage evince-locale-fa went backwards which w=
ould break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [version-go=
ing-backwards]<br>
evince-3.18.2: Package version for package evince-locale-fi went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-fi went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-fr went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-fr went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-fur went backwards=
 which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ve=
rsion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-fur went backwards=
 which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ve=
rsion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ga went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ga went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-gd went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-gd went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-gl went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-gl went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-gu went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-gu went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-he went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-he went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-hi went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-hi went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-hu went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-hu went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-ckwards]<br>
evince-3.18.2: Package version for package evince-locale-it went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ja went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ja went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ka went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ka went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-kk went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-kk went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-km went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-km went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-kn went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-kn went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ko went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ko went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ks went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ks went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ku went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ku went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-lt went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-lt went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-lv went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-lv went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.65 to 0:3.18.2-=
r5.0) [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ml went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ml went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-mn went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-mn went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-mr went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-mr went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ms went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ms went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-my went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-my went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-nb went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-nb went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-nds went backwards=
 which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ve=
rsion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-nds went backwards=
 which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ve=
rsion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ne went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ne went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-nl went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-nl went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-nn went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-nn went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-oc went backwards =
which would break pa18.2-r5.65 to 0:3.18.2-r5.0) [version-going-backwards]<=
br>
evince-3.18.2: Package version for package evince-locale-pl went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-pl went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ps went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ps went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-pt-br went backwar=
ds which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [=
version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-pt-br went backwar=
ds which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [=
version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-pt went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-pt went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ro went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ro went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ru went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ru went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-rw went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-rw went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-si went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-si went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-sk went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-sk went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-sl went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-sl went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-sq went backwards =
which wokwards which would break package feeds from (0:3.18.2-r5.56 to 0:3.=
18.2-r5.0) [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-sv went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ta went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ta went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-te went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-te went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-tg went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-tg went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-th went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-th went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-tr went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-tr went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ug went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-ug went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-uk went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-uk went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-vi went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-vi went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-wa went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-wa went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-zh-cn went backwar=
ds which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [=
version-going-backwards]<br>
evince-3.18.2: Package version for pauld break package feeds from (0:3.18.2=
-r5.56 to 0:3.18.2-r5.0) [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-locale-zu went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-nautilus-extension went b=
ackwards which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r=
5.0) [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-nautilus-extension went b=
ackwards which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r=
5.0) [version-going-backwards]<br>
evince-3.18.2: Package version for package evince-staticdev went backwards =
which would break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince-staticdev went backwards =
which would break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [ver=
sion-going-backwards]<br>
evince-3.18.2: Package version for package evince went backwards which woul=
d break package feeds from (0:3.18.2-r5.56 to 0:3.18.2-r5.0) [version-going=
-backwards]<br>
evince-3.18.2: Package version for package evince went backwards which woul=
d break package feeds from (0:3.18.2-r5.65 to 0:3.18.2-r5.0) [version-going=
-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-dbg went backwards which would break package=
 feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)=
 [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-dbg went backwards which would break package=
 feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)=
 [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-dev went backwards which would break package=
 feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)=
 [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-dev went backwards which would break package=
 feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)=
 [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-doc went backwards which would break package=
 feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0)=
 [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-doc went backwards which would break package=
 feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0)=
 [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>am went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>am went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ar went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: POINC+a9e4e74ec4: P=
ackage version for package evolution-data-server-locale-<wbr>as went backwa=
rds which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to =
0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>as went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>az went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>az went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>be went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>be went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>bg went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>bg went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>bn-in went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>bn-in went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>bn went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>bn went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>bs went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>bs went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ca went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>cs went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>cs went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>cy went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>cy went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>da went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>da went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>de went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>de went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>dz went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>dz went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>el went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>el went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>en-au went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-goingversion-going-<wbr>backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>en-gb went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>en-gb went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>en+shaw went backwards which wou=
ld break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+=
a9e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>en+shaw went backwards which wou=
ld break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+=
a9e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>eo went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>eo went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>es went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>es went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>et went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>et went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>eu went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>eu went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>fa went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>fa went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
ec4: Package version for package evolution-data-server-locale-<wbr>fr went =
backwards which would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.=
66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ga went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ga went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>gl went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>gl went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>gu went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>gu went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>he went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>he went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>hi went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>hi went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>hr went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>hr went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>hu went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-le-is went backwards which would break package feeds fro=
m (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-=
going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>is went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>it went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>it went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ja went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ja went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ka went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ka went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>kn went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>kn went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ko went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ko went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ku went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ku went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>lt went backwards which would br=
eak pac for package evolution-data-server-locale-<wbr>lv went backwards whi=
ch would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3=
+git0+a9e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>mai went backwards which would b=
reak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4=
e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>mai went backwards which would b=
reak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4=
e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>mk went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>mk went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ml went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ml went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>mn went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>mn went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>mr went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>mr went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ms went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ms went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>nb went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-<wbr>local4ec4-r0.55 to 0:3.2.3+git0+a9e4e74=
ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>nl went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>nn went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>nn went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>oc went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>oc went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>or went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>or went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>pa went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>pa went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>pl went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>pl went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>pt-br went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>pt-br went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>pt went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ecata-<wbr>server-locale-ro went backwards which would break package feed=
s from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [ver=
sion-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ru went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ru went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>rw went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>rw went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>si went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>si went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>sk went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>sk went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>sl went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>sl went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>sq went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>sq went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>sr+latin went backwards which wo=
uld break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0=
+a9e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>sr+latin went back74ec4: Package=
 version for package evolution-data-server-locale-<wbr>sv went backwards wh=
ich would break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.=
3+git0+a9e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>sv went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ta went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ta went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>te went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>te went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>th went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>th went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>tr went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>tr went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ug went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>ug went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>uk went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>uk went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolutiage version for package evolution-data-server-locale-<wbr>w=
a went backwards which would break package feeds from (0:3.2.3+git0+a9e4e74=
ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>xh went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>xh went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>zh-cn went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>zh-cn went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>zh-hk went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>zh-hk went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>zh-tw went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-locale-<wbr>zh-tw went backwards which would=
 break package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9=
e4e74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-<wbr>staticdev went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server-<wbr>staticdev went backwards which would br=
eak package feeds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e=
74ec4-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server went backwards which would break package fee=
ds from (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [ve=
rsion-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package evolution-data-server went backwards which would break package fee=
ds from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [ve=
rsion-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libcamel-dev went backwards which would break package feeds from (=
0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goi=
ng-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libcamel-dev went backwards which woulda9e4e74ec4-r0.0) [version-g=
oing-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libebook-dev went backwards which would break package feeds from (=
0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goi=
ng-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libebook went backwards which would break package feeds from (0:3.=
2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-b=
ackwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libebook went backwards which would break package feeds from (0:3.=
2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-b=
ackwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libecal-dev went backwards which would break package feeds from (0=
:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goin=
g-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libecal-dev went backwards which would break package feeds from (0=
:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goin=
g-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libecal went backwards which would break package feeds from (0:3.2=
.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-ba=
ckwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libecal went backwards which would break package feeds from (0:3.2=
.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-going-ba=
ckwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedata-book-dev went backwards which would break package feeds f=
rom (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [versio=
n-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedata-book-dev went backwards which would break package feeds f=
rom (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [versio=
n-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedata-book went backwards which would break package feeds from =
(0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-go=
ing-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedata-book went backwards which would break package feeds from =
(0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-go=
ing-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedata-cal-dev went backwards which would break package feeds fr=
om (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version=
-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedata-cal-dev went backwards which would break package feeds fr=
om (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version=
-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedata-cal went backwards which would break package feeds from (=
0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goi=
ng-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedata-cal went backwards which would break package feeds from (=
0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-goi=
ng-backwards]<br>
evolution-data-server-3.2.3+<wbr>git-r0.0) [version-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedataserverui-dev went backwards which would break package feed=
s from (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [ver=
sion-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedataserverui went backwards which would break package feeds fr=
om (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version=
-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedataserverui went backwards which would break package feeds fr=
om (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version=
-going-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedataserver went backwards which would break package feeds from=
 (0:3.2.3+git0+a9e4e74ec4-r0.55 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-g=
oing-backwards]<br>
evolution-data-server-3.2.3+<wbr>gitAUTOINC+a9e4e74ec4: Package version for=
 package libedataserver went backwards which would break package feeds from=
 (0:3.2.3+git0+a9e4e74ec4-r0.66 to 0:3.2.3+git0+a9e4e74ec4-r0.0) [version-g=
oing-backwards]<br>
nostromo-1.9.6: Package version for package nostromo-dbg went backwards whi=
ch would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0) [version-=
going-backwards]<br>
nostromo-1.9.6: Package version for package nostromo-dbg went backwards whi=
ch would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0) [version-=
going-backwards]<br>
nostromo-1.9.6: Package version for package nostromo-dev went backwards whi=
ch would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0) [version-=
going-backwards]<br>
nostromo-1.9.6: Package version for package nostromo-dev went backwards whi=
ch would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0) [version-=
going-backwards]<br>
nostromo-1.9.6: Package version for package nostromo-doc went backwards whi=
ch would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0) [version-=
going-backwards]<br>
nostromo-1.9.6: Package version for package nostromo-doc went backwards whi=
ch would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0) [version-=
going-backwards]<br>
nostromo-1.9.6: Package version for package nostromo-locale went backwards =
which would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0) [versi=
on-going-backwards]<br>
nostromo-1.9.6: Package version for package nostromo-locale went backwards =
which would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0) [versi=
on-going-backwards]<br>
nostromo-1.9.6: Package version for package nostromo-staticdev went backwar=
ds which would break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0) [ve=
rsion-going-backwards]<br>
nostromo-1.9.6: Package version for package nostromo-staticdev went backwar=
ds which would break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0) [ve=
rsion-going-backwards]<br>
nostromo-1.9.6: Package version for package nostromo went backwards which w=
ould break package feeds from (0:1.9.6-r0.26 to 0:1.9.6-r0.0) [version-goin=
g-backwards]<br>
nostromo-1.9.6: Package version for package nostromo went backwards which w=
ould break package feeds from (0:1.9.6-r0.29 to 0:1.9.6-r0.0) [version-goin=
g-backwards]<br>
openconnect-7.06: Package version for package openconnect-dbg went backward=
s which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) [versi=
on-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-dbg went backward=
s which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) [versi=
on-going-backwards]<br>
opencon0.57 to 0:7.06-r0.0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-bs went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-bs went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-cs went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-cs went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-de went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-de went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-el went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-el went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-en-gb went=
 backwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.=
0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-en-gb went=
 backwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.=
0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-en-us went=
 backwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.=
0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-en-us went=
 backwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.=
0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-es went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-es went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-eu went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-eu went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-fi went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-fi went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-fr went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-fr went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
opencld break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) [version-goi=
ng-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-id went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-lt went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-lt went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-nl went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-nl went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-pa went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-pa went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-pl went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-pl went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-pt-br went=
 backwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.=
0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-pt-br went=
 backwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.=
0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-pt went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-pt went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-sk went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-sk went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-sl went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-sl went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-sr+latin w=
ent backwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-=
r0.0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-sr+latin w=
ent backwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-=
r0.0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-sr went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0feeds from (=
0:7.06-r0.57 to 0:7.06-r0.0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-uk went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-uk went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-zh-cn went=
 backwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.=
0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-zh-cn went=
 backwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.=
0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-zh-tw went=
 backwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.=
0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-locale-zh-tw went=
 backwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.=
0) [version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-staticdev went ba=
ckwards which would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect-staticdev went ba=
ckwards which would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) =
[version-going-backwards]<br>
openconnect-7.06: Package version for package openconnect went backwards wh=
ich would break package feeds from (0:7.06-r0.50 to 0:7.06-r0.0) [version-g=
oing-backwards]<br>
openconnect-7.06: Package version for package openconnect went backwards wh=
ich would break package feeds from (0:7.06-r0.57 to 0:7.06-r0.0) [version-g=
oing-backwards]<br>
openflow-1.0+gitAUTOINC+<wbr>c84f33f09d: Package version for package openfl=
ow-dbg went backwards which would break package feeds from (0:1.0+git0+c84f=
33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0) [version-going-backwards]<br>
openflow-1.0+gitAUTOINC+<wbr>c84f33f09d: Package version for package openfl=
ow-dbg went backwards which would break package feeds from (0:1.0+git0+c84f=
33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0) [version-going-backwards]<br>
openflow-1.0+gitAUTOINC+<wbr>c84f33f09d: Package version for package openfl=
ow-dev went backwards which would break package feeds from (0:1.0+git0+c84f=
33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0) [version-going-backwards]<br>
openflow-1.0+gitAUTOINC+<wbr>c84f33f09d: Package version for package openfl=
ow-dev went backwards which would break package feeds from (0:1.0+git0+c84f=
33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0) [version-going-backwards]<br>
openflow-1.0+gitAUTOINC+<wbr>c84f33f09d: Package version for package openfl=
ow-doc went backwards which would break package feeds from (0:1.0+git0+c84f=
33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0) [version-going-backwards]<br>
openflow-1.0+gitAUTOINC+<wbr>c84f33f09d: Package version for package openfl=
ow-doc went backwards which would break package feeds from (0:1.0+git0+c84f=
33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0) [version-going-backwards]<br>
openflow-1.0+gitAUTOINC+<wbr>c84f33f09d: Package version for package openfl=
ow-locale went backwards which would break package feeds from (0:1.0+git0+c=
84f33f09d-r0.48 to 0:1.0+git0+c84f33f09d-r0.0) [version-going-backwards]<br=
>
openflow-1.0+gitAUTOINC+<wbr>c84f33f09d: Package version for package openfl=
ow-locale went backwards which would break package feeds from (0:1.0+git0+c=
84f33f09d-r0.54 to 0:1.0+git0+c84f33f09d-r0.0) [version-going-backwards]<br=
>
openflow-1.0+gitAUTOINC+<wbr>c84f33f09d: Pacpd-2.27.0: Package version for =
package sthttpd-dbg went backwards which would break package feeds from (0:=
2.27.0-r0.35 to 0:2.27.0-r0.0) [version-going-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd-dbg went backwards whic=
h would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0) [version=
-going-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd-dev went backwards whic=
h would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0) [version=
-going-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd-dev went backwards whic=
h would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0) [version=
-going-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd-doc went backwards whic=
h would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0) [version=
-going-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd-doc went backwards whic=
h would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0) [version=
-going-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd-locale went backwards w=
hich would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0) [vers=
ion-going-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd-locale went backwards w=
hich would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0) [vers=
ion-going-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd-staticdev went backward=
s which would break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0) [v=
ersion-going-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd-staticdev went backward=
s which would break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0) [v=
ersion-going-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd went backwards which wo=
uld break package feeds from (0:2.27.0-r0.35 to 0:2.27.0-r0.0) [version-goi=
ng-backwards]<br>
sthttpd-2.27.0: Package version for package sthttpd went backwards which wo=
uld break package feeds from (0:2.27.0-r0.40 to 0:2.27.0-r0.0) [version-goi=
ng-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-dbg went bac=
kwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-r0.0) =
[version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-dev went bac=
kwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-r0.0) =
[version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-doc went bac=
kwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-r0.0) =
[version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ar we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ast w=
ent backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4=
-r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-bg we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ca we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-cs we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-da we=
nt backwards which would break package feeds from version for package xfce4=
-notifyd-locale-es went backwards which would break package feeds from (0:0=
.3.4-r0.7 to 0:0.3.4-r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-eu we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-fi we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-fr we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-gl we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-he we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-hr we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-hu we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-id we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-is we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-it we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ja we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-kk we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ko we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-lt we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-lv we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ms we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-nb we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-nl we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-oc we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0-0.3.4: Package version for package xfce4-notifyd-locale-ru went backwa=
rds which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-r0.0) [ve=
rsion-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-si we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sk we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sl we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sq we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sr we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-sv we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-th we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-tr we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-ug we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-uk we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-vi we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-zh-cn=
 went backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3=
.4-r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-locale-zh-tw=
 went backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3=
.4-r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd-staticdev we=
nt backwards which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-=
r0.0) [version-going-backwards]<br>
xfce4-notifyd-0.3.4: Package version for package xfce4-notifyd went backwar=
ds which would break package feeds from (0:0.3.4-r0.7 to 0:0.3.4-r0.0) [ver=
sion-going-backwards]<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: host-user-contaminated<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: installed-vs-shipped<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: unknown-configure-option<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: symlink-to-sysroot<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: invalid-pkgconfig<br>
<br>
<br>
count: 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 issue: pkgname<br>
<br>
<br>
<br>
=3D=3D Tested changes (not included in master yet) - bitbake =3D=3D<br>
latest upstream commit:<br>
95deeca bitbake: Update version to 1.33.1<br>
not included in master yet:<br>
092fbe1 world-image: add extra target<br>
<br>
=3D=3D Tested changes (not included in master yet) - openembedded-core =3D=
=3D<br>
latest upstream commit:<br>
d110937 nss: Fix nss-native so the checksum doesn&#39;t change with BUILD_A=
RCH<br>
not included in master yet:<br>
9ba4e6b qemux86: Add identical qemux86copy variant for tests<br>
8133fcb sstate-sysroot-cruft.sh: Extend the whitelist<br>
000825b recipes: Replace &quot;cp -a&quot; with &quot;cp -R --no-dereferenc=
e --preserve=3Dmode,links&quot;<br>
439c821 buildhistory.bbclass: metadata-revs show repo parent<br>
fbae6ba metadata-revs: provide more information<br>
2a382e6 report-error: Allow to upload reports automatically<br>
6484b5c flex: upgrade to 2.6.3<br>
f2f4b7a Revert &quot;flex: upgrade to 2.6.3&quot;<br>
8594575 Revert &quot;flex: upgrade to 2.6.2&quot;<br>
74a17cc core-image-tiny-initramfs: drop wic from IMAGE_FSTYPES<br>
6154e0d libxslt: Add build fix (with ld-is-gold)<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-openembedded =3D=
=3D<br>
latest upstream commit:<br>
5ecbf9b poppler: update to 0.51.0<br>
not included in master yet:<br>
ab4369c kodi: Add krypton/17.0 recipe<br>
99fce36 kodi: Fix build with pic on x86_64<br>
eb45dac kodi-17: Add packageconfig for lcms support<br>
610e094 kodi-17: Fix build with musl<br>
bd28b29 kodi-17: Upgrade 17.0 release<br>
54edcc5 kodi-17: Recommend python-ctpes for addons to work<br>
e5d5867 kodi-17: Fix build for qemuarm and update to latest<br>
300d230 rsyslog: use atomic builtins to avoid race issue<br>
b9c6c88 fwts: upgrade to 17.01.00 release<br>
d77049f picocom: Fix build<br>
370553b onboard: initial add 1.3.0<br>
4a7fe83 nginx: update to version 1.11.8<br>
a239276 python-ipaddress: update to version 1.0.18<br>
b74c656 python-flask-bootstrap: update to version 3.3.7.1<br>
585dd41 python-netaddr: update to version 0.7.19<br>
fcc4940 tremor: add (from oe-core)<br>
5601936 xfce: add dbus-glib-native to DEPENDS to fix do_configure<br>
18771a9 luajit: mips and mipsel are 32bit targets too<br>
9fb591a libgphoto2: remove bash runtime dependency.<br>
8241ef0 python-selectors34: add new recipe for version 1.1<br>
ebe26af python-serpent: add new recipe for version 1.16<br>
b7eb68c python-pyro4: update to version 4.53<br>
7cada0a python-psutil: upgrade to version 5.0.1<br>
f091501 python-click: update to version 6.7<br>
396efbc python-cffi: Fix build for per-recipe sysroot.<br>
7e7fd56 python-ndg-httpsclient: Fix build for per recipe sysroot.<br>
0db057d python-pyopenssl: Fix build for per recipe sysroot.<br>
d307c4f jack: add ARM NEON support for sample conversions<br>
e79566f nano: upgrade to 2.7.4<br>
ebef449 remove some more True options to getVar calls<br>
960acf8 multipath-tools: fix building of shared objects<br>
bc34c97 multipath-tools: update to 0.6.4<br>
dc1d8fa opencv: Configure freetype via PACKAGECONFIG<br>
a0f5552 libnet-ssleay-perl: fix build error<br>
47d1e27 python-cffi: Don&#39;t overwrite inherited dependencies<br>
b4acda8 python-pyopenssl: Don&#39;t overwrite inherited dependencies<br>
63bdd4f python3-multidict: make repeated builds work even without sphinx<br=
>
e8d5a1b python-pyyaml: add dependency on python<br>
91d4dd4 python-pytz: update to 2016.10<br>
f4559c4 gst-instruments: add recipe<br>
0d80e47 vboxguestdrivers: upgrade to 5.1.14 to fix compatibility with 4.9 k=
ernel<br>
a975cd8 geoclue: add missing dependency on gobject-introspection-native<br>
83b9dc3 typing: add version 3.5.3.0<br>
f7aaa34 m2crypto: depend on typing<br>
bab0cf6 udisks2: add libxslt-native to DEPENDS for xsltproc to be in sysroo=
t<br>
db9b1ea python-idna: update to version 2.2<br>
fbda6b5 python-pybind11: Update to version 2.0.1<br>
1c376ec python-pyudev: update to version 0.21.0<br>
cc255f9 python-cryptography-vectors: add to the DEPENDS rather than replace=
<br>
a8a0efe python-ndg-httpsclient: add to the DEPENDS rather than replace<br>
bda2d65 python-requests: update to version 2.13.0<br>
131008e python-lxml: update to version 3.7.2<br>
2c21e3b python-pytest: update version to 3.0.6<br>
1d1a43b nginx: handle systemd service file<br>
2ede2eb postgresgl: update to 9.4.10 and build fix<br>
3527257 libatasmart: unify the complier and CFLAGS for host build<br>
8a0667b ipmiutil: fix build issue<br>
2b6cad9 iperf: remove depricated package<br>
a625494 python-pycrypto: add app to meta-python<br>
7c0c45c lm_sensors: update SRC_URI<br>
8731b65 udisks: add missing hard dependency<br>
547c047 initramfs-kexecboot-image: disable runtime dependency on run-postin=
sts<br>
8c03a06 linux-yocto-tiny-kexecboot: remove obsoleted recipe<br>
2def6f6 lvm2: remove unbuildable 2.02.138<br>
f732d17 fuse: support native compilation<br>
4071e6b lvm2: enable native compilation<br>
2ef3979 cryptsetup: enable native compilation<br>
338980d procmail: avoid bashism in do_install<br>
85fac0e python-pbr: change the dependency to be a RDEPENDS and fix build is=
sues<br>
927657d gateone: correct the inherit to use setuptools<br>
09d3d56 python-pyalsaaudio: update to version 0.8.2<br>
c0416d4 python-thrift: update to version 0.10.0<br>
4d5e97e python-werkzeug: update to version 0.11.15<br>
773200a python-sqlalchemy: update to version 1.1.5<br>
3b1ea98 python-py: update to version 1.4.32<br>
dfbe6cf apache: use the APACHE_MIRROR variable in the SRC_URI<br>
79c03f5 nginx: update to version 1.10.3<br>
663f827 nginx: update to version 1.11.9<br>
26e52a2 udisks: Make use of bitbake variables for sbin, lib locations.<br>
d614f8c dconf: depends on dbus<br>
f2b6681 dconf: fix bash completion in wrong package<br>
f93ea40 dconf: make gtk+3 dependency optional<br>
63d64b8 libev: Add recipe for version 4.24<br>
28528c4 libuv: Add recipe for version 1.10.2<br>
7013979 libwebsockets: Add recipe for version 2.1.0<br>
f87a2b0 glibmm: add dependency on glib-2.0-native<br>
93a44df exfat-utils: update SRC_URI<br>
765ac51 audiofile: add alsa-lib to DEPENDS<br>
f35f4fb esound: fix build<br>
928849a libglade: fix build and cleanup<br>
ca8ddbe poppler: add qttools-native to qt5 dependency to fix build<br>
6f9b762 evolution-data-server: fix build<br>
786d11d libgnomeui: fix build<br>
d34a32c gegl: fix build<br>
6bb7f37 gedit: fix build<br>
ffd750f abiword: fix build<br>
f501f7a geany: fix build<br>
7b62fe8 xfce4-notifyd: add dbus-glib-native to DEPENDS<br>
38813ff sthttpd: add base-passwd to DEPENDS<br>
cfad4ba nostromo: add base-passwd to DEPENDS<br>
92a1d82 gnome-disk-utility: add dbus-glib-native to DEPENDS<br>
b7f480c python-edbus exquisite elementary libeweather unionfs-fuse xfsprogs=
 gmtk devilspie2 gnome-backgrounds gnome-desktop gnome-mime-data gtk-engine=
s gtksourceview2 libgnomekbd libidl-native onboard libgpewidget ubi-utils-k=
libc kexec-tools-klibc gupnp-igd gupnp-tools dvb-apps gstreamer mpd crda ne=
tcat-openbsd wireshark gnokii libmbim mosh networkmanager-openvpn libtelepa=
thy dbus-daemon-proxy libdbus-c++ php vala-dbus-binding-tool collectd libgx=
im pywbem gtkhtml2 fbida fontforge libsexy wayland-fits xstdcmap xf86-video=
-glamo font-adobe-100dpi font-adobe-utopia-100dpi font-bh-100dpi font-bh-lu=
cidatypewriter-<wbr>100dpi font-misc-misc crash a2jmidid libsdl2-mixer libs=
dl-mixer minidlna sylpheed libsdl2-ttf libsdl-ttf ode pidgin postgresql sys=
log-ng usb-modeswitch xdg-user-dirs gateone python3-cryptography-vectors py=
thon3-ndg-httpsclient python-cryptography-vectors python-pbr bundler netdat=
a menulibre openzone xfce4-verve-plugin iperf terminus-font xf86-video-nouv=
eau ipmiutil klibc-utils pmbw multipath-tools gparted, gnome-system-monitor=
, php, vala-dbus-binding-tool, gtkmathview, lmsensors, postgresql: Blacklis=
t<br>
00ba7da recipes: blacklist recipes depending on blacklisted recipes<br>
7f3176f recipes: blacklist recipes runtime depending on blacklisted recipes=
<br>
af69342 opensaf: 5.0.0 -&gt; 5.1.0<br>
30667c6 lftp: update to 4.7.5 and change SRC_URI source<br>
ac3d39c tcpdump: upgrade to 4.8.1<br>
fcd51a9 iscsitarget: Fix call trace of ahash API calling<br>
64ccdf5 relayd: derive PV from SRCPV<br>
a559daa dibbler: fix SRC_URI from ${P} to ${BP}<br>
c7cff14 iscsitarget: fix inconsistent crash while login to iscsi target fro=
m initiator<br>
f9dce8d iscsitarget: use upstream to build with linux kernel &gt;=3D 4.3<br=
>
67c4b8c iscsitarget: update patch to contain changes required to build with=
 only linux v4.8 and above<br>
94f3f50 wireshark: update package to 2.2.4<br>
e13378a inetutils: register hostname.1 man page as an alternate<br>
5e9a6d6 lldpd: Update to version 0.9.6<br>
698f000 wireshark: fix build issue<br>
dddbb4d libtdb: fix SRC_URI - http has gone<br>
99ff1b5 libtevent: fix SRC_URI - http has gone<br>
0a68a21 netkit-ruser: update SRC_URI<br>
78a8125 ipsec-tools: change SRC_URI fetcher.<br>
d7b2bd1 tcpdump: update to 4.9.0 for security fixes<br>
038f127 Samba: use built-in libtevent<br>
3dbbd50 fetchmail: update SRC_URI<br>
5a2ced7 libtalloc: fix SRC_URI to use https instead of http<br>
dc42430 openflow: inherit pkgconfig<br>
78b4921 openconnect: add gettext-native to DEPENDS<br>
304cd77 smbnetfs gnome-disk-utility contacts kexecboot geany geany-plugins =
efivar efibootmgr gimp system-config-keyboard tumbler: Blacklist<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-qt5 =3D=3D<br>
latest upstream commit:<br>
8ba2814 qtwebkit: depends on gperf-native<br>
not included in master yet:<br>
efa8aaf qmake5_base.bbclass: set qt.conf by environment variable again<br>
5acf4e1 populate_sdk_qt5: use _append operator<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-browser =3D=3D<br=
>
latest upstream commit:<br>
dac70ab chromium: split patch &#39;Remove hard coded values for CC and CXX&=
#39;<br>
not included in master yet:<br>
7e31067 firefox*: add missing dependencies on zip-native and unzip-native<b=
r>
9808dd1 firefox-addon-webconverger: add also unzip-native dependency<br>
2747754 chromium-wayland: fix compilation problem on non-X11 builds<br>
15b61fd chromium, chromium-wayland: blacklist<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-webos-ports =3D=
=3D<br>
latest upstream commit:<br>
b848230 luneos-package: inhibit default deps and limit do_deploy deps<br>
not included in master yet:<br>
<br>
=3D=3D Tested changes (not included in master yet) - meta-smartphone =3D=3D=
<br>
latest upstream commit:<br>
a04ef72 android-system: restore mount for hal-droid<br>
not included in master yet:<br>
4203314 libhybris: add dependency on wayland-native<br>
a95e27a fso-gsm0710muxd, atd-over-fso, omext, e-wm-config-illume2-shr: Blac=
klist<br>
f2dc1e1 recipes: blacklist recipes depending on blacklisted recipes<br>
914596e recipes: blacklist recipes runtime depending on blacklisted recipes=
<br>
</blockquote></div><br></div>

--001a11477bfee5f27105486ecb47--
