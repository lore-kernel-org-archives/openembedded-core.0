Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30812C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 02:27:16 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web08.5397.1636597634646313242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 18:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kn0j2LBm;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id e11so8947297ljo.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 18:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+8dTph4/GtX4ObkQs+EJmBXArOFG1dCBRwBRg0PEJOM=;
        b=Kn0j2LBmh+xQXyt5Q2IDxfL/iQLTwxnus82zqEzmAYRk+5IF4hyYfSUbV4rnO+EuFy
         LfMXidWiILWW3s/84IsZwWx0pIIRgnpqdsRwZ8MZmCMJ52lRaLVxbt7KnI0PCez6YPX3
         L6wPiyaEEh5o4Aot4QNqp8Wt05NXJQvS2MveuBh7PQhVR9vUo14KYYcXnz1C+4/2mlrK
         8RD0jrVjzbDZ8QNdyB77EPyc2eIp++y1N/RzrOG+vcYXR0UyayCxH4l+uff4+lYCVLwl
         BP1BfCvhbyyt/BE7raXTbw6r0SZ1l+1l1zQQr2YVXEd0hBkcNb2/8jtJLDDRrl/wHnL1
         YZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+8dTph4/GtX4ObkQs+EJmBXArOFG1dCBRwBRg0PEJOM=;
        b=YqV/ga7Xr4sYmSnmg0bsz0uv/r1xKDWoVeJVOw02oJOL3q96/8eycU7w9BO+9tZX2u
         xR2PmbZ1EH6jyk9T5VDDPvNcqM8WuAHiiS/AUkt6S+NXM7/OMfrsuw4kQQPCT0tI/QZB
         zQzcwTWwXBQEXwORt0pEi9IsVMBMZRcEUzHQvS2gkK1PoxVDY42sdHkoyFpmp+KfsCvY
         tHMltCKqA+zipNimDJIeKf+jgjCmBFO/NA8NHlsmD9zBEGyT19F0cXTky228J6ieO+eP
         sCMbOBMJQgZLF83rWWMZOMzpwIfpGm80XkX+oitogyvO5UZnRFHBquYDrrgxCrL0Dro4
         s9Gg==
X-Gm-Message-State: AOAM530pQgihXyN7b4B83h0M+b81sgF8TxdWqPZ3WyXq+mCWJkgoHpC9
	pxmeqDzZY6KG8e1XkywtxuRIgYiBW+Lk8uMu0gA=
X-Google-Smtp-Source: 
 ABdhPJyAxdy/iUvG4xC1ydgTAPEuPWU6wwdoBXvf+gw/MwhZ4grmx+JaPONhYwLE1GGswCDmt2rmC+tqkv3jRgzE08Q=
X-Received: by 2002:a05:651c:292:: with SMTP id
 b18mr3679047ljo.220.1636597632825;
 Wed, 10 Nov 2021 18:27:12 -0800 (PST)
MIME-Version: 1.0
References: <20211111004407.3036301-1-anibal.limon@linaro.org>
 <3e7d66a3e2484c9a830a37b3d2cc91ba@axis.com>
In-Reply-To: <3e7d66a3e2484c9a830a37b3d2cc91ba@axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 10 Nov 2021 18:26:56 -0800
Message-ID: 
 <CAJ86T=USO=7jLg1G0Lh90e7ywFif6xpC5jWg6ZV_+bZ0JhkL5Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipe-graphics: Add depends on cmake-native
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Anibal Limon <anibal.limon@linaro.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 02:27:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158129

On Wed, Nov 10, 2021 at 5:41 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Anibal Limon
> > Sent: den 11 november 2021 01:44
> > To: openembedded-core@lists.openembedded.org
> > Cc: richard.purdie@linuxfoundation.org; An=C3=ADbal Lim=C3=B3n <anibal.=
limon@linaro.org>
> > Subject: [OE-core] [PATCH] recipe-graphics: Add depends on cmake-native
>
> Change "recipe-graphics" to "waffle".
>
> //Peter
>
> >
> > Fixes,
> >
> > ...
> >   File "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortex=
a53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/s=
ite-packages/mesonbuild/modules/cmake.py", line 241, in detect_cmake
> >     p, stdout, stderr =3D mesonlib.Popen_safe(cmakebin.get_command() + =
['--system-information', '-G', 'Ninja'])[0:3]
> >   File "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortex=
a53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/s=
ite-packages/mesonbuild/mesonlib/universal.py", line 1397, in Popen_safe
> >     p =3D subprocess.Popen(args, universal_newlines=3DTrue, close_fds=
=3DFalse,
> >   File "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortex=
a53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/s=
ubprocess.py", line 966, in __init__
> >     self._execute_child(args, executable, preexec_fn, close_fds,
> >   File "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortex=
a53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/s=
ubprocess.py", line 1717, in _execute_child
> >     and os.path.dirname(executable)
> >   File "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortex=
a53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/p=
osixpath.py", line 152, in dirname
> >     p =3D os.fspath(p)
> > ...
> >
> > Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> > ---
> >  meta/recipes-graphics/waffle/waffle_1.7.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/waffle/waffle_1.7.0.bb b/meta/recipe=
s-graphics/waffle/waffle_1.7.0.bb
> > index 6284af3076..ea11309940 100644
> > --- a/meta/recipes-graphics/waffle/waffle_1.7.0.bb
> > +++ b/meta/recipes-graphics/waffle/waffle_1.7.0.bb
> > @@ -17,7 +17,7 @@ S =3D "${WORKDIR}/git"
> >
> >  inherit meson features_check lib_package bash-completion pkgconfig
> >
> > -DEPENDS:append =3D " python3"
> > +DEPENDS:append =3D " python3 cmake-native"

It's unusual for a recipe to add cmake-native to DEPENDS rather than
inheriting the cmake class. Your patch comments should probably
explain why it's the correct approach.

> >  # This should be overridden per-machine to reflect the capabilities of=
 the GL
> >  # stack.
> > --
> > 2.33.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158126): https://lists.openembedded.org/g/openembedde=
d-core/message/158126
> Mute This Topic: https://lists.openembedded.org/mt/86971860/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ar=
mccurdy@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

