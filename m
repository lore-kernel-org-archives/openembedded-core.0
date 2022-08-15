Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA0EC00140
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 15:06:21 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web09.3312.1660575976313167477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 08:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=b45ZSQcq;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.43,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f43.google.com with SMTP id a89so9919341edf.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 08:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=AbTXejyP7hgPWUuWtf3m7jy5eJZhPO+YCyu0nd6y5vI=;
        b=b45ZSQcqwaNNq/SBPUJZt/lL5eBTeK1VsLdBnhPVm5ip9Qa3aFX4v9nhOtUkHI9tIh
         9N6Pv0U4hklp3Ra1ols3Ib6hMurDHIf9uFKcrhRsq8Q4ADv1n1p8GjyLaBis4eOuGfdp
         3p89aqogZU9mRamzH7GsUVC01yM506Z6QeQUNeJkcwo98BH5CR8RzZDaWOunh+QWBK9+
         s4wNAqI0xDQy/fOnr3k/WweTDanjY3MWUmyVleXvOZSgrV8nymJigz7x8WztDvC2d51/
         XG4Vt8qVos4DEbpIWYoK7/5i2zSCGCsZliZ0ArFryKuJ23acETI27qP+K2dyrsDGx4Hq
         /aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=AbTXejyP7hgPWUuWtf3m7jy5eJZhPO+YCyu0nd6y5vI=;
        b=y86lo2n69bi9SZTVJpcn85ArYvXt5t6POzYQOkAe2V313UYMTfaAILF3k+RHcekdrv
         vFgZBwBHn+JJ5Q8KUxu+h3Y5IRh1kANo8KFDNLrz1TKocnkrbWXw64z2whtqb+J4U7kH
         O9m9uuwmMadioOcf2fCsrwlM3Pg8/oNEcZnoPfWdUXmyElHdNujCaT5udnlNyZ08Mi1e
         df5cNzQYWEMmSi/iOa5SlHSqu0r8L0bjrChXRWwbF6/rG/Ew7gMpK1cX8PPj6KEyh/hx
         gLjTyJZkug69RCuJtJt0g0DX9hsMrT5VPpEPDcJpTQgWvKGr+WrCRTdB6LO3JwXaqa8N
         KLrg==
X-Gm-Message-State: ACgBeo0pGvexAJm/GNK6rDzrp6ElXoYO+44Wx96xRWd42MOrXByWahbs
	SwcC+/6aU4ApQGZriO5QXdBS9upw8JbJOG3C5m23Zw==
X-Google-Smtp-Source: 
 AA6agR7scdubuDC0NVXJwpgHpP2opybQutrOY+8iN+gXRvSpm2r0Q5vaIpFXq8mBHSQFZ7uLi30A06dkuqMyVRzOQj0=
X-Received: by 2002:a05:6402:5216:b0:43e:81c5:82dd with SMTP id
 s22-20020a056402521600b0043e81c582ddmr14975841edd.345.1660575974349; Mon, 15
 Aug 2022 08:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220724094145.1926740-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220724094145.1926740-1-richard.purdie@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 15 Aug 2022 05:06:03 -1000
Message-ID: 
 <CAOSpxdY=ZuXynVe_VgN9nSL313Q03kzqkeYWXg_FN5goc1DYPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vim: Upgrade 9.0.0021 -> 9.0.0063
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 15:06:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169354

On Sat, Jul 23, 2022 at 11:41 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Pulls in several CVE fixes.
> Added a patch to avoid timer_create cross compile issue (and submitted upstream).

When backporting to dunfell I get this error:

| link.sh: $LINK_AS_NEEDED set to 'yes': invoking linker directly.
|   x86_64-poky-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3
-mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=1 -Wformat
-Wformat-security -Werror=format-security
--sysroot=/home/steve/builds/poky-contrib-dunfell/build/tmp/work/core2-64-poky-linux/vim/9.0.0063-r0/recipe-sysroot
  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
-fstack-protector-strong -Wl,-z,relro,-z,now -o vim objects/alloc.o
objects/arabic.o objects/arglist.o objects/autocmd.o objects/beval.o
objects/buffer.o objects/change.o objects/blob.o objects/blowfish.o
objects/cindent.o objects/clientserver.o objects/clipboard.o
objects/cmdexpand.o objects/cmdhist.o objects/crypt.o
objects/crypt_zip.o objects/debugger.o objects/dict.o objects/diff.o
objects/digraph.o objects/drawline.o objects/drawscreen.o
objects/edit.o objects/eval.o objects/evalbuffer.o objects/evalfunc.o
objects/evalvars.o objects/evalwindow.o objects/ex_cmds.o
objects/ex_cmds2.o objects/ex_docmd.o objects/ex_eval.o
objects/ex_getln.o objects/fileio.o objects/filepath.o
objects/findfile.o objects/float.o objects/fold.o objects/getchar.o
objects/gui_xim.o objects/hardcopy.o objects/hashtab.o objects/help.o
objects/highlight.o objects/if_cscope.o objects/if_xcmdsrv.o
objects/indent.o objects/insexpand.o objects/list.o objects/locale.o
objects/map.o objects/mark.o objects/match.o objects/mbyte.o
objects/memline.o objects/menu.o objects/misc1.o objects/misc2.o
objects/mouse.o objects/move.o objects/normal.o objects/ops.o
objects/option.o objects/optionstr.o objects/os_unix.o
objects/pathdef.o objects/popupmenu.o objects/popupwin.o
objects/profiler.o objects/pty.o objects/quickfix.o objects/regexp.o
objects/register.o objects/screen.o objects/scriptfile.o
objects/search.o objects/session.o objects/sha256.o objects/sign.o
objects/sound.o objects/spell.o objects/spellfile.o
objects/spellsuggest.o objects/strings.o objects/syntax.o
objects/tag.o objects/term.o objects/terminal.o objects/testing.o
objects/textformat.o objects/textobject.o objects/textprop.o
objects/time.o objects/typval.o objects/ui.o objects/undo.o
objects/usercmd.o objects/userfunc.o objects/version.o
objects/vim9cmds.o objects/vim9compile.o objects/vim9execute.o
objects/vim9expr.o objects/vim9instr.o objects/vim9script.o
objects/vim9type.o objects/viminfo.o objects/window.o
objects/bufwrite.o objects/gui.o objects/gui_gtk.o
objects/gui_gtk_x11.o objects/gui_gtk_f.o objects/gui_beval.o
  objects/job.o objects/channel.o objects/xdiffi.o objects/xemit.o
objects/xprepare.o objects/xutils.o objects/xhistogram.o
objects/xpatience.o  objects/charset.o objects/json.o objects/main.o
objects/memfile.o objects/message.o   -lgtk-3 -lgdk-3 -lpangocairo-1.0
-lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo
-lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lSM -lICE -lXt
-lX11 -lXdmcp -lSM -lICE  -lm  -lncurses -lacl -lattr -ldl
| /home/steve/builds/poky-contrib-dunfell/build/tmp/work/core2-64-poky-linux/vim/9.0.0063-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/9.3.0/ld:
objects/os_unix.o: undefined reference to symbol
'timer_create@@GLIBC_2.3.3'
| /home/steve/builds/poky-contrib-dunfell/build/tmp/work/core2-64-poky-linux/vim/9.0.0063-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/9.3.0/ld:
/home/steve/builds/poky-contrib-dunfell/build/tmp/work/core2-64-poky-linux/vim/9.0.0063-r0/recipe-sysroot/lib/librt.so.1:
error adding symbols: DSO missing from command line
| collect2: error: ld returned 1 exit status
| link.sh: Linking failed

Any ideas?

Thanks,

Steve

> Also submit the race fix upstream.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../vim/files/crosscompile.patch              | 51 +++++++++++++++++++
>  meta/recipes-support/vim/files/racefix.patch  | 12 +++--
>  meta/recipes-support/vim/vim.inc              |  6 ++-
>  3 files changed, 63 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-support/vim/files/crosscompile.patch
>
> diff --git a/meta/recipes-support/vim/files/crosscompile.patch b/meta/recipes-support/vim/files/crosscompile.patch
> new file mode 100644
> index 00000000000..583d3fc7b01
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/crosscompile.patch
> @@ -0,0 +1,51 @@
> +configure.ac: Fix create_timer solaris test for cross compiling
> +
> +A runtime test was added for create_timer however this meant cross compiling
> +would no longer work. Allow a cache value to be specified to allow cross
> +compiling again.
> +
> +Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
> +
> +Upstream-Status: Submitted [https://github.com/vim/vim/pull/10777]
> +
> +Index: git/src/configure.ac
> +===================================================================
> +--- git.orig/src/configure.ac
> ++++ git/src/configure.ac
> +@@ -3814,7 +3814,7 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(
> + dnl Check for timer_create. It probably requires the 'rt' library.
> + dnl Run the program to find out if timer_create(CLOCK_MONOTONIC) actually
> + dnl works, on Solaris timer_create() exists but fails at runtime.
> +-AC_MSG_CHECKING([for timer_create])
> ++AC_CACHE_CHECK([for timer_create], [vim_cv_timer_create],
> + save_LIBS="$LIBS"
> + LIBS="$LIBS -lrt"
> + AC_RUN_IFELSE([AC_LANG_PROGRAM([
> +@@ -3831,7 +3831,7 @@ static void set_flag(union sigval sv) {}
> +   if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
> +     exit(1);  // cannot create a monotonic timer
> +   ])],
> +-  AC_MSG_RESULT(yes; with -lrt); AC_DEFINE(HAVE_TIMER_CREATE),
> ++  AC_MSG_NOTICE(timer_create with -lrt); vim_cv_timer_create=yes,
> +   LIBS="$save_LIBS"
> +   AC_RUN_IFELSE([AC_LANG_PROGRAM([
> + #include<signal.h>
> +@@ -3847,8 +3847,16 @@ static void set_flag(union sigval sv) {}
> +     if (timer_create(CLOCK_MONOTONIC, &action, &timer_id) < 0)
> +       exit(1);  // cannot create a monotonic timer
> +     ])],
> +-    AC_MSG_RESULT(yes); AC_DEFINE(HAVE_TIMER_CREATE),
> +-    AC_MSG_RESULT(no)))
> ++    vim_cv_timer_create=yes,
> ++    vim_cv_timer_create=no),
> ++    AC_MSG_ERROR(cross-compiling: please set 'vim_cv_timer_create')
> ++    )
> ++)
> ++
> ++if test "x$vim_cv_timer_create" = "xyes" ; then
> ++  AC_DEFINE(HAVE_TIMER_CREATE)
> ++fi
> ++
> +
> + AC_CACHE_CHECK([whether stat() ignores a trailing slash], [vim_cv_stat_ignores_slash],
> +   [
> diff --git a/meta/recipes-support/vim/files/racefix.patch b/meta/recipes-support/vim/files/racefix.patch
> index 1cb8fb442ff..34bd37d650d 100644
> --- a/meta/recipes-support/vim/files/racefix.patch
> +++ b/meta/recipes-support/vim/files/racefix.patch
> @@ -1,9 +1,13 @@
> +po/Makefile: Avoid race over LINGUAS file
> +
>  The creation of the LINGUAS file is duplicated for each desktop file
> -which can lead the commands to race against each other. Rework
> -the makefile to avoid this as the expense of leaving the file on disk.
> +which can lead the commands to race against each other. One target might
> +remove it before another has been able to use it. Rework the makefile to
> +avoid this as the expense of leaving the file on disk.
> +
> +Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
>
> -Upstream-Status: Pending
> -RP 2021/2/15
> +Upstream-Status: Submitted [https://github.com/vim/vim/pull/10776]
>
>  Index: git/src/po/Makefile
>  ===================================================================
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 7e2c624bc11..1e86306ce92 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -19,10 +19,11 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>             file://0001-src-Makefile-improve-reproducibility.patch \
>             file://no-path-adjust.patch \
>             file://racefix.patch \
> +           file://crosscompile.patch \
>             "
>
> -PV .= ".0021"
> -SRCREV = "5e59ea54c0c37c2f84770f068d95280069828774"
> +PV .= ".0063"
> +SRCREV = "d61efa50f8f5b9d9dcbc136705cc33874f0fdcb3"
>
>  # Remove when 8.3 is out
>  UPSTREAM_VERSION_UNKNOWN = "1"
> @@ -88,6 +89,7 @@ EXTRA_OECONF = " \
>      vim_cv_getcwd_broken=no \
>      vim_cv_memmove_handles_overlap=yes \
>      vim_cv_stat_ignores_slash=no \
> +    vim_cv_timer_create=yes \
>      vim_cv_terminfo=yes \
>      vim_cv_tgetent=non-zero \
>      vim_cv_toupper_broken=no \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168449): https://lists.openembedded.org/g/openembedded-core/message/168449
> Mute This Topic: https://lists.openembedded.org/mt/92581990/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

