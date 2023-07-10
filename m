Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF08EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 22:58:54 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.838.1689029929680413518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 15:58:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=S8icnq7b;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-783544a1c90so252099239f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 15:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689029929; x=1691621929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LoDyUIaNo/q4Ytuh+HH8A6qrYN3BF7cHbEKfUaXWHGU=;
        b=S8icnq7bpSvd8hsFllQX1twVggXD2oww8WgQ80EFLj64MW5xcC67UAd/boS7xUTzoh
         SCJwm4igbL9yZdL+Jp/MJgoDCPVsAcxbUXCll45zVH1CzbY0IGC0tlfr1OdyhJ+pNZAy
         vgWb3kTnUNJjj5jUPN1ch0Hs2OtTOrFbhj51SZ70jtw1hukl2JRwrkHNuhll9YIjeufD
         P6ANu0k0TOGRUAnCjfE5c2gItj3vqysHFg9MrnNuZfLY/TZRohLS/MNDMpHPtd8kPYcE
         s7UBlHkmMe8NEfCL4iCIe50VxidFu+8bHx8fdH6e8Lvw0VbxuUmtGWDCFeNldcX4LDBM
         Ktdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689029929; x=1691621929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoDyUIaNo/q4Ytuh+HH8A6qrYN3BF7cHbEKfUaXWHGU=;
        b=Wy/zV9nA82ibc42Q+zROH/r1r86HKKIvDmJm5RLbf+SdC5oRLa9z3qiIPsf/PPk+ky
         hLek4KvMvvk1OlCZCuRWKuPidhZQUmYOc+Jv3bjAwMuj5tdWmkrbslsleYq5i/09StQj
         VLfaINd3aInVKzw7Mur9qgHj07SqF6VdlGkEZP8YaEL9ontmZNP1LFhkXwOgQILKjc0F
         UeCgGlZswMF1vMeqly1fF6KWChHZm41SSm0QE0MNruL4L0J/AlBw+KW0RAY3Ge8KBq2n
         iShnxsRRLSUQqdUcHnho1ajfMIzayyXGGPPttmznUQNsmw0D/IfXFCrH3sKMTUIO/1lx
         PFmg==
X-Gm-Message-State: ABy/qLZ/idYxRQ64ZhIPcz9ZofABdvRPXzvZ97C/gD/2m6zZICTQtkpC
	fUf/YQK2XDmckqf9AVBGazNNBY/pOBp8YP3+tp0=
X-Google-Smtp-Source: APBJJlEnDrIp4MyrvaLs2k6xhTw+oHaM6eSvUviLuwJ6LEZT4FuSC8VNh71UMTIlksTeZZKMNf+Cmvu5smox7+aEuJI=
X-Received: by 2002:a05:6602:228a:b0:787:1557:3834 with SMTP id
 d10-20020a056602228a00b0078715573834mr3826669iod.20.1689029928909; Mon, 10
 Jul 2023 15:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
 <CDACE6FE-F991-4E69-BC69-B1BEC6B6B761@arm.com> <20230710205902398898f0@mail.local>
In-Reply-To: <20230710205902398898f0@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jul 2023 18:58:37 -0400
Message-ID: <CADkTA4P+p2papxOvsfQUEywOdtWyKOs0aQ980nePtfOGwkG-4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/15] kernel: consolidated pull request
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 22:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184105

On Mon, Jul 10, 2023 at 4:59=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 10/07/2023 14:54:50+0000, Ross Burton wrote:
> > On 10 Jul 2023, at 04:20, Bruce Ashfield via lists.openembedded.org <br=
uce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > > Here's the latest queued kernel changes. There are the expectd -stabl=
e updates
> > > 6.1, but those of course aren't the most interesting part of this que=
ue.
> >
> >
> > I=E2=80=99ve not triaged them yet as it=E2=80=99s still building, but h=
ttps://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5577 is ju=
st this branch on top of master and has some new failures/warnings.
> >
>
> It mostly worked on my branch, there is this new failure though:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/7413/st=
eps/12/logs/stdio
>
> Traceback (most recent call last):
>   File "/home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/c=
ore/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>            ^^^^^^^^^^^^^^^^^^^^^
>   File "/home/pokybuild/yocto-worker/qemuarm-oecore/build/meta/lib/oeqa/r=
untime/cases/parselogs.py", line 393, in test_parselogs
>     self.assertEqual(errcount, 0, msg=3Dself.msg)
> AssertionError: 4 !=3D 0 : No ignore list found for this machine, using d=
efault
> No ignore list found for this machine, using default
> No ignore list found for this machine, using default
> No ignore list found for this machine, using default
> No ignore list found for this machine, using default
> No ignore list found for this machine, using default
> No ignore list found for this machine, using default
> No ignore list found for this machine, using default
> Log: /home/pokybuild/yocto-worker/qemuarm-oecore/build/build/tmp-glibc/wo=
rk/qemuarm-oe-linux-gnueabi/core-image-sato/1.0-r0/target_logs/Xorg.0.log

It's odd.

I can build and test qemuarm core-image-sato and I don't get any warnings.

I wasn't able to see the exact configuration of that specific run (is
it under build-properties?).

Bruce


> -----------------------
> Central error: [    17.416] (II) FBDEV(0):      mode "640x480" test faile=
d
> ***********************
> [    17.381]    compiled for 1.21.1.8, module version =3D 0.0.2
> [    17.381]    ABI class: X.Org Video Driver, version 25.2
> [    17.384] (II) FBDEV(0): using default device
> [    17.389] (=3D=3D) FBDEV(0): Depth 24, (=3D=3D) framebuffer bpp 32
> [    17.389] (=3D=3D) FBDEV(0): RGB weight 888
> [    17.389] (=3D=3D) FBDEV(0): Default visual is TrueColor
> [    17.403] (=3D=3D) FBDEV(0): Using gamma correction (1.0, 1.0, 1.0)
> [    17.406] (II) FBDEV(0): hardware: virtio_gpudrmfb (video memory: 4000=
kB)
> [    17.407] (DB) xf86MergeOutputClassOptions unsupported bus type 0
> [    17.411] (II) FBDEV(0): checking modes against framebuffer device...
> [    17.416] (II) FBDEV(0):     mode "640x480" test failed
> [    17.417] (II) FBDEV(0):     mode "640x480" test failed
> [    17.418] (II) FBDEV(0):     mode "640x480" test failed
> [    17.419] (II) FBDEV(0):     mode "640x480" test failed
> [    17.441] (II) FBDEV(0):     mode "640x480" not found
> [    17.442] (II) FBDEV(0): checking modes against monitor...
> [    17.444] (II) FBDEV(0): Virtual size is 1280x800 (pitch 1280)
> [    17.445] (**) FBDEV(0):  Built-in mode "current"
> [    17.446] (=3D=3D) FBDEV(0): DPI set to (96, 96)
> [    17.447] (II) Loading sub module "fb"
> [    17.448] (II) LoadModule: "fb"
>
> > Ross
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184081): https://lists.openembedded.org/g/openembed=
ded-core/message/184081
> > Mute This Topic: https://lists.openembedded.org/mt/100051814/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

