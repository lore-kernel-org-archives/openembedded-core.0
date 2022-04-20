Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FBAC38A2B
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web08.4780.1650436623218431381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 23:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RW8kcIuy;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id x17so1052487lfa.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 23:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LkVOVBYFJiDo+6VReoRHEaTNk12fSq6lMHbCjTievh0=;
        b=RW8kcIuyYOz67ZEU5O7YdGzFwxXJ2jZlUEQPAuxBiZ6PvSN4EnJd6PQKYhr9XyviYK
         20l9+ePxJkMMx3g4nC6JNiUsdCZ/qEoa/qVB6svXbyjAQEzm3q38Ibmd++3ZLkRH7ymO
         3NS9QaYY7iZy0Jv0T8svq22UauEw7fFkFnIhH/mlC4l5z0cSiReZcqavYYZWdFIJufjC
         R4Ayjan80BBxpMm1vLMTu85Vqz5LwzbzHmI3DBoJONL4FwdPPGaKXpAOXCLyOLVHMhx/
         udaE+wh1/DtWSmSfaVfhXlQJXzaKuvoww6kZYFOcGs0eTQIwCK/B4R5jqM7D0OarTPCF
         P3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LkVOVBYFJiDo+6VReoRHEaTNk12fSq6lMHbCjTievh0=;
        b=mi2+wPx11oy5gmvfjocIM4c2wsY07NAvBQJD74FkhkIhdcT7ofRzFpfoQ2XLK7qQYT
         H444QJkohyeb4o9ZTWhufeKluDMZUeYNPR6kyZyAqgNdfnGhdky2uHCp0pznY4ZFn4uv
         uuPpBMYPcYxBHXdAZ6BlQaUnnCVPXtIDIeN6mEf1d5hupeDEx2DOJhO9gvzpHIUwworL
         s1W4cKDLQoqSWNqD62YbktGojrLaa/9P+cytJ/dXsclnIRwNrgSXRaBAJJqBayRvHicJ
         nuBK4cLv/nYHNKw/30p57sDiTpZnvXSuk9P6Pmk52D8RXY6IDCZKOk8YJa/EadXhKsEQ
         yFgw==
X-Gm-Message-State: AOAM532MRRFgB3yk+jfuvr+ThO9KkigEeasADyFAEz5BZS5vLVl83pLS
	PBIxaY/0irBbaUDHboLSHxTBLTg+kSmO4Dlwr10=
X-Google-Smtp-Source: 
 ABdhPJxpcKVDKqx/vNa9Ydq2Sbgb2fqo4ar2AL33fDTshnGq/sk0dN3BZUE1XFOce73M5cQ5OpS3PCzbtk/s85YgvAs=
X-Received: by 2002:a05:6512:b8d:b0:471:8afd:f8e1 with SMTP id
 b13-20020a0565120b8d00b004718afdf8e1mr10028003lfv.534.1650436621297; Tue, 19
 Apr 2022 23:37:01 -0700 (PDT)
MIME-Version: 1.0
References: 
 <010101802ecde680-777fdb10-0998-402c-a718-2e3ebe7e6cc8-000000@us-west-2.amazonses.com>
 <74f47f87-14ca-6313-131d-7bc71daebd7b@windriver.com>
In-Reply-To: <74f47f87-14ca-6313-131d-7bc71daebd7b@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Apr 2022 08:36:49 +0200
Message-ID: 
 <CANNYZj82yeWndpG=6gFVVLZce3cv_gxjYVst=jzxQvFnDhcHrw@mail.gmail.com>
Subject: Re: [AUH] rust-llvm: upgrading to 1.60.0 FAILED
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	"Gowda, Naveen" <naveen.gowda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164659

Please start the work, I do not have anything queued. Generally, it's
better to just notify and get on with it: I don't mind if someone else
starts doing the same update, and actually prefer it, as the more we
distribute the upgrade work, the better.

Alex

On Mon, 18 Apr 2022 at 22:23, Randy MacLeod <randy.macleod@windriver.com> w=
rote:
>
> On 2022-04-15 15:58, auh@yoctoproject.org wrote:
> > Hello,
> >
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe *rust-llvm* to *1.60.0=
* has Failed (devtool error).
>
>
> Alex,
>
> Do you have this Rust/Cargo/... update in a branch somewhere or
> should Naveen work on the 1.60 update?
>
> Naveen will also update the rust test patches that we've been hoping
> to get merged for some time.
>
> ../Randy
>
>
> >
> > Detailed error information:
> >
> > The following devtool command failed:  finish -f rust-llvm /home/pokybu=
ild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
> > NOTE: Starting bitbake server...
> > Loading cache...done.
> > Loaded 1640 entries from dependency cache.
> > Parsing recipes...done.
> > Parsing of 883 .bb files complete (882 cached, 1 parsed). 1642 targets,=
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
bb/parse/__init__.py", line 133, in resolve_file
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
bb/parse/__init__.py", line 133, in resolve_file
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

