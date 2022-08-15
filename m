Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9CCC25B0E
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 15:14:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.3379.1660576458277563357
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 08:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bk/LQqeV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 m10-20020a05600c3b0a00b003a603fc3f81so84092wms.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 08:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=4WMkRHgtCg0MObGgsddVGY8BHqmKbpVzC8BwPvRSXz8=;
        b=Bk/LQqeVhydSzNDPA51czLXbe8l7QsoqBU3IbLthv2lvxkdQiioBLBpJGWTceS3pv+
         /Lu1M5+cnhbbHg760r84IlG3XqpWN0gZK93rejenvsLrvC+QZRddYfcR6fuMWHQh9LNF
         8Wa1EHmQh5GGsKycT0P9f5u89REfnqTfO/M3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=4WMkRHgtCg0MObGgsddVGY8BHqmKbpVzC8BwPvRSXz8=;
        b=bX6m1db0Jk46CHEH7UQvSEqAfVI9ioQDIr4kCO0hA1fB9qnwMGMKSbVzLkh/LS7ICI
         luTWhC1in1S7uImGG1DoOvwNOyCfrbVpYRzDDHWZiEfhmT0iEMZQsLDeUUV/6QQgcAYt
         iydvyo22BnDkk8ZTuiPUamYo3TJcpM+6n7ZzLClJTvy4oEC4FjQSaga6ap5WOtsxSb68
         esbHntO6WuIqfNkTVf3O2y1Ymwz2RMzgl+gV3TGjd2F0e02eFEtP4yAR85dpU/bY1b0K
         oMdN51taEQEq/BDnpGYtAFBe1JoyNPrEtjArlI4AOTL5F+zrX8OD+dh54/chIbwq/Te1
         mv4g==
X-Gm-Message-State: ACgBeo2PC55LAATgKDEIjcXcBL9maNASi2cn5VnzDJKp4crQNRB4GMVt
	zD069jk5zoy3iKsTve4nFPG3BA==
X-Google-Smtp-Source: 
 AA6agR7jOJMxw2sXVN6JqQyPLKa63ICAFxXD3fkTqZLbcXYuMcWM8kfJyNkBIgPmkyUcyNMcF/NVAw==
X-Received: by 2002:a7b:cc90:0:b0:3a5:3899:7be1 with SMTP id
 p16-20020a7bcc90000000b003a538997be1mr10199631wma.19.1660576456590;
        Mon, 15 Aug 2022 08:14:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:27d9:5f4a:b4:2f81?
 ([2001:8b0:aba:5f3c:27d9:5f4a:b4:2f81])
        by smtp.gmail.com with ESMTPSA id
 bx5-20020a5d5b05000000b00223678fe95asm9833715wrb.18.2022.08.15.08.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 08:14:16 -0700 (PDT)
Message-ID: 
 <7e07b59183cfd7fdfaa34ca3807acba17074de5a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: Upgrade 9.0.0021 -> 9.0.0063
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2022 16:14:15 +0100
In-Reply-To: 
 <CAOSpxdY=ZuXynVe_VgN9nSL313Q03kzqkeYWXg_FN5goc1DYPw@mail.gmail.com>
References: <20220724094145.1926740-1-richard.purdie@linuxfoundation.org>
	 <CAOSpxdY=ZuXynVe_VgN9nSL313Q03kzqkeYWXg_FN5goc1DYPw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 15:14:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169355

On Mon, 2022-08-15 at 05:06 -1000, Steve Sakoman wrote:
> On Sat, Jul 23, 2022 at 11:41 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > Pulls in several CVE fixes.
> > Added a patch to avoid timer_create cross compile issue (and submitted =
upstream).
>=20
> When backporting to dunfell I get this error:
>=20
> > link.sh: $LINK_AS_NEEDED set to 'yes': invoking linker directly.
> >   x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
> -mfpmath=3Dsse -fstack-protector-strong  -D_FORTIFY_SOURCE=3D1 -Wformat
> -Wformat-security -Werror=3Dformat-security
> --sysroot=3D/home/steve/builds/poky-contrib-dunfell/build/tmp/work/core2-=
64-poky-linux/vim/9.0.0063-r0/recipe-sysroot
>   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed
> -fstack-protector-strong -Wl,-z,relro,-z,now -o vim objects/alloc.o
> objects/arabic.o objects/arglist.o objects/autocmd.o objects/beval.o
> objects/buffer.o objects/change.o objects/blob.o objects/blowfish.o
> objects/cindent.o objects/clientserver.o objects/clipboard.o
> objects/cmdexpand.o objects/cmdhist.o objects/crypt.o
> objects/crypt_zip.o objects/debugger.o objects/dict.o objects/diff.o
> objects/digraph.o objects/drawline.o objects/drawscreen.o
> objects/edit.o objects/eval.o objects/evalbuffer.o objects/evalfunc.o
> objects/evalvars.o objects/evalwindow.o objects/ex_cmds.o
> objects/ex_cmds2.o objects/ex_docmd.o objects/ex_eval.o
> objects/ex_getln.o objects/fileio.o objects/filepath.o
> objects/findfile.o objects/float.o objects/fold.o objects/getchar.o
> objects/gui_xim.o objects/hardcopy.o objects/hashtab.o objects/help.o
> objects/highlight.o objects/if_cscope.o objects/if_xcmdsrv.o
> objects/indent.o objects/insexpand.o objects/list.o objects/locale.o
> objects/map.o objects/mark.o objects/match.o objects/mbyte.o
> objects/memline.o objects/menu.o objects/misc1.o objects/misc2.o
> objects/mouse.o objects/move.o objects/normal.o objects/ops.o
> objects/option.o objects/optionstr.o objects/os_unix.o
> objects/pathdef.o objects/popupmenu.o objects/popupwin.o
> objects/profiler.o objects/pty.o objects/quickfix.o objects/regexp.o
> objects/register.o objects/screen.o objects/scriptfile.o
> objects/search.o objects/session.o objects/sha256.o objects/sign.o
> objects/sound.o objects/spell.o objects/spellfile.o
> objects/spellsuggest.o objects/strings.o objects/syntax.o
> objects/tag.o objects/term.o objects/terminal.o objects/testing.o
> objects/textformat.o objects/textobject.o objects/textprop.o
> objects/time.o objects/typval.o objects/ui.o objects/undo.o
> objects/usercmd.o objects/userfunc.o objects/version.o
> objects/vim9cmds.o objects/vim9compile.o objects/vim9execute.o
> objects/vim9expr.o objects/vim9instr.o objects/vim9script.o
> objects/vim9type.o objects/viminfo.o objects/window.o
> objects/bufwrite.o objects/gui.o objects/gui_gtk.o
> objects/gui_gtk_x11.o objects/gui_gtk_f.o objects/gui_beval.o
>   objects/job.o objects/channel.o objects/xdiffi.o objects/xemit.o
> objects/xprepare.o objects/xutils.o objects/xhistogram.o
> objects/xpatience.o  objects/charset.o objects/json.o objects/main.o
> objects/memfile.o objects/message.o   -lgtk-3 -lgdk-3 -lpangocairo-1.0
> -lpango-1.0 -lharfbuzz -latk-1.0 -lcairo-gobject -lcairo
> -lgdk_pixbuf-2.0 -lgio-2.0 -lgobject-2.0 -lglib-2.0 -lSM -lICE -lXt
> -lX11 -lXdmcp -lSM -lICE  -lm  -lncurses -lacl -lattr -ldl
> > /home/steve/builds/poky-contrib-dunfell/build/tmp/work/core2-64-poky-li=
nux/vim/9.0.0063-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../l=
ibexec/x86_64-poky-linux/gcc/x86_64-poky-linux/9.3.0/ld:
> objects/os_unix.o: undefined reference to symbol
> 'timer_create@@GLIBC_2.3.3'
> > /home/steve/builds/poky-contrib-dunfell/build/tmp/work/core2-64-poky-li=
nux/vim/9.0.0063-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../l=
ibexec/x86_64-poky-linux/gcc/x86_64-poky-linux/9.3.0/ld:
> /home/steve/builds/poky-contrib-dunfell/build/tmp/work/core2-64-poky-linu=
x/vim/9.0.0063-r0/recipe-sysroot/lib/librt.so.1:
> error adding symbols: DSO missing from command line
> > collect2: error: ld returned 1 exit status
> > link.sh: Linking failed
>=20
> Any ideas?

This bit of the patch:

+# Some host distros don't have it, disable consistently
+EXTRA_OECONF:append:class-native =3D " vim_cv_timer_create=3Dno"
+EXTRA_OECONF:append:class-target =3D " vim_cv_timer_create=3Dyes"
+
 do_install() {

did you use the incorrect override syntax?

Cheers,

Richard



