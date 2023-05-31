Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F593C7EE31
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 14:04:34 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.15153.1685541872027361119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 07:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=GXBW1E7X;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-33b416c96fcso8375025ab.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 07:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685541871; x=1688133871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aAdLsl4t7zxrhg28A4j0lOnHIp78k/3L41g2HJIHcmY=;
        b=GXBW1E7X3G7Zrtt44PJP/YG56MOFm8cP8lJVuccSdJL6XrZ1kii9Yd2E9SEy4Kw3vs
         ljkfA+FxOubE8rmRqVikcE37el110Lpk4FimxWqkAdfWy88KjY4P4SPIOLGCGKo8Tuzx
         QU/yOX5yawdOw3zO+fizFz/zrronAafj9UeLY/XUl1r3O+08jHuvThO6jABigu86GYcL
         IGalAn8e5WxlM/nfr+oQVVL1rXl+ckp26iDtIxKjKrbtppOWIgfUJkuyeke6hZzmMh4C
         idrirL2wnkrEc1plMuyoMPpyI3GvqYcD8azAQdcaXJMAiyYRjfbH42RYozHHxt7n52mD
         X2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685541871; x=1688133871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aAdLsl4t7zxrhg28A4j0lOnHIp78k/3L41g2HJIHcmY=;
        b=e/C+ijy4zWcgWf7OlsVzjg8DI8bhyiON2cJgpHBScRT9nvwfWPTU3f16NUSYsunHhA
         xAHN7SnQAMn9hxFKxTMNOu0roEm/oSJ5kI4NzU10y4D47g2xxyEaqiT3BRJMs/MlZqrW
         jCjxUtRjoC7VFq4QiEbOGABHK+Z5UqEhxm1+wCP0U86rl/1ZSTOazMMEMPgwO0EKABkE
         PhggudOvqfRPOSdaT0IMxdo8TglBBKD6soO0hw48zzDCITCdDpt0CuXSZsPcdgaN2tCS
         gIB9J7jIS71Ed1eNXJC4wFzWSZChiW77dfHMFRsm0bH6sDWFcwm9+YJ5gSstNPSdK/MK
         Q0+g==
X-Gm-Message-State: AC+VfDx/YEop1JuJubsdSkCZsGLNJ+QHdk1sFN+H2/B9+BkzuSdBbrXM
	G0xUCpopk1aVOiHkj7gVYwJtdXJj4oGwlo9arMk=
X-Google-Smtp-Source: ACHHUZ7l1ZwBucmeYiVyx8ndw+5BsHGvqv962UYFGmBnDJapKBUXzLbMVPUVhg2Q4D7CO77apC2NmH6HiKaYnmb8XT8=
X-Received: by 2002:a92:c6c3:0:b0:332:b18a:7ba7 with SMTP id
 v3-20020a92c6c3000000b00332b18a7ba7mr2443483ilm.27.1685541871158; Wed, 31 May
 2023 07:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <eb184be946abaf9c76a2af279af2db9bcb43a1e0.camel@linuxfoundation.org>
In-Reply-To: <eb184be946abaf9c76a2af279af2db9bcb43a1e0.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 31 May 2023 10:04:20 -0400
Message-ID: <CADkTA4OQJLMSqBzR3nKVX0o6YV=qa9ZPaJioU63W6B6wh6=wWA@mail.gmail.com>
Subject: Re: [OE-core] python3 cryptic build failures
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Tim Orling <tim.orling@konsulko.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 14:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182011

On Wed, May 31, 2023 at 9:23=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Trevor,
>
> I thought this issue might be something you might be able to spot the
> solution with quickly.
>
> I had a failing python3-iniconfig build in a TMPDIR I've reused
> heavily:

FWIW. I see this in about 6 or 7 python recipes in my extremely
heavily reused tmpdir.

After I came back from vacation, I iterated through a -c clean on the
python packages, and they always built the second time through.

Bruce

>
> ERROR: python3-iniconfig-2.0.0-r0 do_compile: ExecutionError('/media/buil=
d/poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/r=
un.do_compile.2391637', 1, None, None)
> ERROR: Logfile of failure stored in: /media/build/poky/build/tmp/work/cor=
e2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/log.do_compile.2391637
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | * Getting build dependencies for wheel...
> |
> | Traceback (most recent call last):
> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/bui=
ld/__main__.py", line 375, in main
> |     built =3D build_call(
> |             ^^^^^^^^^^^
> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/bui=
ld/__main__.py", line 208, in build_package
> |     out =3D _build(isolation, builder, outdir, distribution, config_set=
tings, skip_dependency_check)
> |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/bui=
ld/__main__.py", line 147, in _build
> |     return _build_in_current_env(builder, outdir, distribution, config_=
settings, skip_dependency_check)
> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/bui=
ld/__main__.py", line 127, in _build_in_current_env
> |     missing =3D builder.check_dependencies(distribution)
> |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/bui=
ld/__init__.py", line 369, in check_dependencies
> |     return {u for d in dependencies for u in check_dependency(d)}
> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/bui=
ld/__init__.py", line 369, in <setcomp>
> |     return {u for d in dependencies for u in check_dependency(d)}
> |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/bui=
ld/__init__.py", line 185, in check_dependency
> |     yield from check_dependency(other_req_string, ancestral_req_strings=
 + (normalised_req_string,), req.extras)
> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/bui=
ld/__init__.py", line 179, in check_dependency
> |     if req.specifier and not req.specifier.contains(dist.version, prere=
leases=3DTrue):
> |                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^
> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pac=
kaging/specifiers.py", line 905, in contains
> |     item =3D Version(item)
> |            ^^^^^^^^^^^^^
> |   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/pac=
kaging/version.py", line 196, in __init__
> |     match =3D self._regex.search(version)
> |             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> | TypeError: expected string or bytes-like object, got 'NoneType'
> |
> | ERROR expected string or bytes-like object, got 'NoneType'
> | WARNING: exit code 1 from a shell command.
> ERROR: Task (/media/build/poky/meta/recipes-devtools/python/python3-inico=
nfig_2.0.0.bb:do_compile) failed with exit code '1'
>
> I wondered why and I isolated it down to this:
>
> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-=
iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages$ =
find -type d -empty
> ./hatchling-1.13.0.dist-info/licenses
> ./pathspec-0.11.0.dist-info
> ./importlib_metadata-6.0.0.dist-info
> ./setuptools-67.4.0.dist-info
> ./wheel-0.38.4.dist-info
> ./installer-0.6.0.dist-info
> ./setuptools-67.6.0.dist-info
> ./packaging-23.0.dist-info
> richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-=
iniconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages$ =
find -type d -empty -delete
>
> After which the compile succeeds. These empty dist-info directories
> really upset the build. They're left behind by the sstate cleanup code
> from when I have older versions of these python modules in play since
> the sstate code can race over directory removal. Is there a way to make
> python ignore them? Otherwise should we remove them somewhere?
>
> I suspect you can recreate by adding these empty directories and
> running a -c compile -f. I've seen it with plenty of other python
> modules too.
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182010): https://lists.openembedded.org/g/openembedde=
d-core/message/182010
> Mute This Topic: https://lists.openembedded.org/mt/99241972/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

