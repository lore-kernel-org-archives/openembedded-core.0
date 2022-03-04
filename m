Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC88C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 18:04:29 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web10.1606.1646417069243213133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 10:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dzpTWD33;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id z10so3893214uaa.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 10:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iPq/ppclQmLgaQRdVorz9u42dM4t8q7vgLcy/jllaoc=;
        b=dzpTWD33ze3GnVFR3+xDt5RcIXB3iECclV9ZCUJ8EGcQFdhXtcGB6ZwMnEz83rAPJ2
         hshHmmn63Ltq/fYPTW4WXBuOiarnP6OC8nMtLLaQxoPa2Pk6cF7BlXCFo+KlcTNkdQ2D
         gxbcFmuN2I0NyNjtEfE+x+kBc2CryCfAg0SYXe46CLP2l5BCLk6vhOEgTlQdBWwLlD+s
         rYQq6pb/euGJVsXHwrZSaIhvt826V4mgRB3ti9Tr3Tpd3GA22bx6xFl2LVjFUloY6pcF
         GTE61XQWzP4lelBEDl8F64QMIQAFiIZYfk/Zpa6738pASSO9QZ0Psdks3VDFJE59PthX
         BX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iPq/ppclQmLgaQRdVorz9u42dM4t8q7vgLcy/jllaoc=;
        b=j3TtLSqKLATqeZ3DOd6w6OG1v7jKEgZRmZG8OBDUXTBjRr8sES1oDE9Gi8FIIGLIEJ
         93JsLid95AiVSRbVcL6DiITjFH5JDnCM0wRWxNQco3TK2k2p2BzAqKYpnLQKRt1nmKjw
         N5z8tRpuha0ptwExiArHs6H35Atvp3klT991CLj/INKwQZNyvwu6ZmqXLHulN1ZR6d9W
         LngzswLPiC2imNx7U+fUc4rtrFIo8sIFhQSNSXd6RCLeFaNqU/08W+mwpG81XUv5djxN
         IS4J8427yJspjiRbNHxkf7tRIoN/w80fXZGb/+9QSEJadBtjfB2wgcgA0VnYPDupq/fA
         hllw==
X-Gm-Message-State: AOAM532bmEYQwcAUqDc3p9d057yEVMR22Qkf57mJ/AnvioNG0BPMdlTh
	7988WOtuClg1+S6/8l8vui9uIld7fjCS2fLML8U=
X-Google-Smtp-Source: 
 ABdhPJy89MKpg9yL8atji4ygDa54K68yC1JNwTQz4+x2wvq8v1/I6/cbej6eR7UU07LuFFWqovktgbNrLLKAYdZ4dLk=
X-Received: by 2002:ab0:67d7:0:b0:345:6bac:4f15 with SMTP id
 w23-20020ab067d7000000b003456bac4f15mr16604470uar.43.1646417067973; Fri, 04
 Mar 2022 10:04:27 -0800 (PST)
MIME-Version: 1.0
References: 
 <0101017f50e03108-050c414c-790b-4c05-8b8d-daf41cff5a1b-000000@us-west-2.amazonses.com>
 <ee42785d-ef25-fcc8-1b2d-c1dffbc0cb6e@windriver.com>
In-Reply-To: <ee42785d-ef25-fcc8-1b2d-c1dffbc0cb6e@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Mar 2022 19:04:16 +0100
Message-ID: 
 <CANNYZj9YmuQoMUgskuxqOqk=QRBpMWAGxj7soQtZvJ-uwtA1EQ@mail.gmail.com>
Subject: Re: [AUH] rust-llvm: upgrading to 1.59.0 FAILED
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Pgowda <pgowda.cve@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 18:04:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162751

Rust is a low-risk item from feature freeze perspective, so I already
queued a patch. If a-full is ok with it, there's no reason not to
merge it in my opinion.

Alex

On Fri, 4 Mar 2022 at 18:45, Randy MacLeod <randy.macleod@windriver.com> wr=
ote:
>
>
> FYI: 1.59 release notes:
>     https://blog.rust-lang.org/2022/02/24/Rust-1.59.0.html
>
>
> While there are interesting features in 1.59, such as the inline
> assembly support,
> we are in feature freeze so I expect we'll stick with 1.58.1 .
>
> It probably also makes sense to skip 1.59 and wait for 1.60 in early May
> for 3.6
> depending on when we branch 3.5.
>
> ../Randy
>
> On 2022-03-03 12:42, auh@yoctoproject.org wrote:
> > Hello,
> >
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe *rust-llvm* to *1.59.0=
* has Failed (devtool error).
> >
> > Detailed error information:
> >
> > The following devtool command failed:  finish -f rust-llvm /home/pokybu=
ild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
> > NOTE: Starting bitbake server...
> > Loading cache...done.
> > Loaded 1521 entries from dependency cache.
> > Parsing recipes...done.
> > Parsing of 844 .bb files complete (843 cached, 1 parsed). 1523 targets,=
 34 skipped, 0 masked, 0 errors.
> >
> > ERROR: Traceback (most recent call last):
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 162, in wrapped
> >      return func(fn, *args)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 187, in parse_config_file
> >      return bb.parse.handle(fn, data, include)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 107, in handle
> >      return h['handle'](fn, data, include)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/parse_py/ConfHandler.py", line 118, in handle
> >      abs_fn =3D resolve_file(fn, data)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 131, in resolve_file
> >      raise IOError(errno.ENOENT, "file %s not found" % fn)
> > FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/buil=
d/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
> >
> > ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/pok=
y/meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybuil=
d/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.c=
onf not found
> > Traceback (most recent call last):
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 162, in wrapped
> >      return func(fn, *args)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 187, in parse_config_file
> >      return bb.parse.handle(fn, data, include)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 107, in handle
> >      return h['handle'](fn, data, include)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/parse_py/ConfHandler.py", line 118, in handle
> >      abs_fn =3D resolve_file(fn, data)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/parse/__init__.py", line 131, in resolve_file
> >      raise IOError(errno.ENOENT, "file %s not found" % fn)
> > FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/buil=
d/build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
> >
> > During handling of the above exception, another exception occurred:
> >
> > Traceback (most recent call last):
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devt=
ool", line 334, in <module>
> >      ret =3D main()
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devt=
ool", line 321, in main
> >      ret =3D args.func(args, config, basepath, workspace)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/=
devtool/standard.py", line 2108, in finish
> >      updated, appendfile, removed =3D _update_recipe(args.recipename, w=
orkspace, rd, args.mode, appendlayerdir, wildcard_version=3DTrue, no_remove=
=3DFalse, no_report_remove=3Dremoving_original, initial_rev=3Dargs.initial_=
rev, dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_overrides, for=
ce_patch_refresh=3Dargs.force_patch_refresh)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/=
devtool/standard.py", line 1814, in _update_recipe
> >      updated, appendf, removed =3D _update_recipe_patch(recipename, wor=
kspace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_repor=
t_remove, initial_rev, dry_run_outdir, force_patch_refresh)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/=
devtool/standard.py", line 1671, in _update_recipe_patch
> >      redirect_output=3Ddry_run_outdir)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/=
recipeutils.py", line 705, in bbappend_recipe
> >      appendpath, pathok =3D get_bbappend_path(rd, destlayerdir, wildcar=
dver)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/=
recipeutils.py", line 632, in get_bbappend_path
> >      confdata =3D bb.cookerdata.parse_config_file(destlayerconf, confda=
ta)
> >    File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/=
bb/cookerdata.py", line 167, in wrapped
> >      raise bb.BBHandledException()
> > bb.BBHandledException
> >
> >
> > Please review the attached files for further information and build/upda=
te failures.
> > Any problem please file a bug at https://bugzilla.yoctoproject.org/ente=
r_bug.cgi?product=3DAutomated%20Update%20Handler
> >
> > Regards,
> > The Upgrade Helper
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

