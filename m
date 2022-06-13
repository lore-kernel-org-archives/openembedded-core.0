Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC362C43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 08:15:45 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.3374.1655108143464677917
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 01:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lux+FFW3;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id e4so5349845ljl.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 01:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=W8Prio7aB/dO9Y6MJwlYIrr7q/z8GemllVpbOty+rB4=;
        b=lux+FFW3gjzgaPBurqiwGWnORAS74lyKuXo69y1ceJxxGSzKZ4e7DPLhjzC0mFKpie
         wxgYLBoZxPdvwO0DoLZ694DlHgHmdeXl6pqiCM4paq2m6CWXBoMuZMC/SFLUBFIWqOxQ
         9X7aMK8swIb2FAHA2G0CvAERx/2GXSxVVXsYz5XZ1/n9+bY9URN5+YVhWClxI1BiaR7N
         geiciaVgiAFq8Jpnw4gigFjiHI6N5X5DslRObvzh6h1IagHEb8sc30+DEcjYUrRzdV82
         StFq1aHFoMvE5zuahpBqZY7eNraG6/VR+dsBkFmNIarU3fuqLNyNXe5vCbE15FzmEAnd
         R0LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=W8Prio7aB/dO9Y6MJwlYIrr7q/z8GemllVpbOty+rB4=;
        b=BuZnyTLZZl8CCmEhk4bZ/688KTu79cV54ashYd0CF9eafb52n4zWxKluJYFoOIAFsJ
         xnDK286CFJLoZAlCItr0iCAxVf46Xo5tg6n3y3VKiolx1V6ky6vrPGhu3ZmYs6ak1lbv
         oizp3DTFQsCqb89LnTu7Oztxe/3TSz0tdcDAqTvTi6SWmWkkBXNR9unof3aqqUEyzoFL
         LgC/eYZrYL6+E8NvDlsuqARAwsM/4eVG0LGia5zpQkBbxdY+A9MWPBXEQ/+G8xdhPPqq
         tuMjlQ46sgg97dbjvbYQi6SgVGetE2cKJIDWx6bfuRFyZNOAgZqA9NXALafOVbCqkokn
         Ks8w==
X-Gm-Message-State: AOAM530b4eFk/p3GqWBDYRzCx66U8np/By+QwhkHS4IKAWxrNEIvwxkB
	I3TgdhFdOoShO8uuc0HVlpNrY15QqVoyQ221IXE=
X-Google-Smtp-Source: 
 ABdhPJzV9C+JrpPw/iGlz3A1eqK7Ukhssg6Ztfw3CUn/CVNfYSz9oB29qs1UbwbbCYYInAiNGXUf9xQrHb5XgFaZRyk=
X-Received: by 2002:a2e:a812:0:b0:255:4aaf:c1fc with SMTP id
 l18-20020a2ea812000000b002554aafc1fcmr40828841ljq.257.1655108141505; Mon, 13
 Jun 2022 01:15:41 -0700 (PDT)
MIME-Version: 1.0
References: 
 <01010181200fec93-2abce4ac-3ed8-402a-8127-c076f733d788-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <01010181200fec93-2abce4ac-3ed8-402a-8127-c076f733d788-000000@us-west-2.amazonses.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Jun 2022 10:15:30 +0200
Message-ID: 
 <CANNYZj9cfUQkS+oDpW7hK5Zi4JWnsmYnEeU5+X-9onRcMSw0fA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] rust-llvm: upgrading to 1.61.0 FAILED
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 08:15:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166833

Rust 1.61 is held by rust-native regressing on red hat distros; fedora
34/35, centos/alma 8 all show this:
https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/3151

Alex

On Wed, 1 Jun 2022 at 18:19, Auto Upgrade Helper <auh@yoctoproject.org> wro=
te:
>
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *rust-llvm* to *1.61.0* =
has Failed (devtool error).
>
> Detailed error information:
>
> The following devtool command failed:  finish -f rust-llvm /home/pokybuil=
d/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust
> NOTE: Starting bitbake server...
> WARNING: Host distribution "almalinux-8.6" has not been validated with th=
is version of the build system; you may possibly experience unexpected fail=
ures. It is recommended that you use a tested distribution.
> Loading cache...done.
> Loaded 1643 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 884 .bb files complete (883 cached, 1 parsed). 1644 targets, 3=
5 skipped, 0 masked, 0 errors.
>
> Summary: There was 1 WARNING message.
>
> ERROR: Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
cookerdata.py", line 162, in wrapped
>     return func(fn, *args)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
cookerdata.py", line 187, in parse_config_file
>     return bb.parse.handle(fn, data, include)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
parse/__init__.py", line 107, in handle
>     return h['handle'](fn, data, include)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
parse/parse_py/ConfHandler.py", line 118, in handle
>     abs_fn =3D resolve_file(fn, data)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
parse/__init__.py", line 133, in resolve_file
>     raise IOError(errno.ENOENT, "file %s not found" % fn)
> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>
> ERROR: Unable to parse /home/pokybuild/yocto-worker/auh/build/build/poky/=
meta/recipes-devtools/rust/conf/layer.conf: [Errno 2] file /home/pokybuild/=
yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/conf/layer.con=
f not found
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
cookerdata.py", line 162, in wrapped
>     return func(fn, *args)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
cookerdata.py", line 187, in parse_config_file
>     return bb.parse.handle(fn, data, include)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
parse/__init__.py", line 107, in handle
>     return h['handle'](fn, data, include)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
parse/parse_py/ConfHandler.py", line 118, in handle
>     abs_fn =3D resolve_file(fn, data)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
parse/__init__.py", line 133, in resolve_file
>     raise IOError(errno.ENOENT, "file %s not found" % fn)
> FileNotFoundError: [Errno 2] file /home/pokybuild/yocto-worker/auh/build/=
build/poky/meta/recipes-devtools/rust/conf/layer.conf not found
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool=
", line 334, in <module>
>     ret =3D main()
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool=
", line 321, in main
>     ret =3D args.func(args, config, basepath, workspace)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/dev=
tool/standard.py", line 2108, in finish
>     updated, appendfile, removed =3D _update_recipe(args.recipename, work=
space, rd, args.mode, appendlayerdir, wildcard_version=3DTrue, no_remove=3D=
False, no_report_remove=3Dremoving_original, initial_rev=3Dargs.initial_rev=
, dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_overrides, force_=
patch_refresh=3Dargs.force_patch_refresh)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/dev=
tool/standard.py", line 1814, in _update_recipe
>     updated, appendf, removed =3D _update_recipe_patch(recipename, worksp=
ace, srctree, crd, appendlayerdir, wildcard_version, no_remove, no_report_r=
emove, initial_rev, dry_run_outdir, force_patch_refresh)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/dev=
tool/standard.py", line 1671, in _update_recipe_patch
>     redirect_output=3Ddry_run_outdir)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/rec=
ipeutils.py", line 705, in bbappend_recipe
>     appendpath, pathok =3D get_bbappend_path(rd, destlayerdir, wildcardve=
r)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/meta/lib/oe/rec=
ipeutils.py", line 632, in get_bbappend_path
>     confdata =3D bb.cookerdata.parse_config_file(destlayerconf, confdata)
>   File "/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/lib/bb/=
cookerdata.py", line 167, in wrapped
>     raise bb.BBHandledException()
> bb.BBHandledException
>
>
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166404): https://lists.openembedded.org/g/openembedde=
d-core/message/166404
> Mute This Topic: https://lists.openembedded.org/mt/91480159/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

