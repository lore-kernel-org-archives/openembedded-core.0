Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595A6C001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 17:55:16 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web11.2092.1689789309311838797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 10:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=RQWcW4Qp;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3461053677eso2871225ab.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 10:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689789308; x=1692381308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaMRLT+duz+ViYtnoRkjJ96AEUI/7L9ov9ofnyUbYwo=;
        b=RQWcW4Qp/RlFK/e5NusSxj2wrWVcbA/qLf8fpyl9b7icVfmBBfHJXZCioQo9E2yu5V
         bguCc9IePm+jcEUDW+kAilswcWYBsqSjnwEiccPADkDu4sk0GvZVGrAMZQJqEQxgtXh0
         PEoHV516BRw5XHw/4b+t+X4NKYL8wugHFUCeT7rb0XSnpxQHgr35MGcFV3apsHiCK24p
         DGLIwOnrg2WoCrq9jSBvMHEnGYBst7YhDdAvVwt7GyMo9GoK8x7xsQGeHsQj77qDpz2V
         w3qYk5reFHeYFnGFXXj/A14LevySWmC1LlTgfTiVOKgn6Z64POq2cyCHBoUd8oD8mOeT
         njOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689789308; x=1692381308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaMRLT+duz+ViYtnoRkjJ96AEUI/7L9ov9ofnyUbYwo=;
        b=LHMUHHGy6ldJfASR8Ltqw3yGvpyEf62L8TcHlxMYmbyIajM7immAXUVsybT2TynGMj
         iLBN8pie8jHIAk0yoKq81QbbzrMTx6EPt0IJ8FsJF7FFb5dB+lQEM+/Vo26peTOdQpb2
         cgJyjvMt+j1TUhEI+lKZM4DJmnzq4mXRrslL33YUGL/6rddc2TCO6dkrJX4AVRtTC8k4
         RLnre1KOi7Yl9MGYRzo02CAAk63a7lQhBvV7KhIm9029HIuoNkY4sc0USkS5JpkKiWjC
         j/FEPnPaAUPk4z0FpKF2FXPoY0MyajtSlKEJArWdxiecnwew5OSv/kp40NF5zYOuwjYN
         iidA==
X-Gm-Message-State: ABy/qLZqi3Y9TsDinDg/Xt5oDfOUI1O3DtoYTTP+al82mkFqCiR29hsS
	LPuvyrQ7LlgdaUlNoww9thAc6dWlJsGcX/AEr+w=
X-Google-Smtp-Source: APBJJlHamGhCFcvmLaWR8/WLGW1Nzdrxr+mxqRgFOqCOnxDvJwUDTfZIOn/6jpRUBG8rGYnOZiG4Sz06KQnrlB/Uwz0=
X-Received: by 2002:a92:c56e:0:b0:348:a537:8e99 with SMTP id
 b14-20020a92c56e000000b00348a5378e99mr538718ilj.1.1689789308432; Wed, 19 Jul
 2023 10:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <177355D8B98610E8.12709@lists.openembedded.org>
In-Reply-To: <177355D8B98610E8.12709@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jul 2023 13:54:57 -0400
Message-ID: <CADkTA4PnCd-_+8LRA2hikyDTXw3FtymcPGxDk4ZqDr9n+C9rWQ@mail.gmail.com>
Subject: Re: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
To: bruce.ashfield@gmail.com
Cc: Petr Gotthard <petr.gotthard@advantech.cz>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 17:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184592

On Wed, Jul 19, 2023 at 1:44=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Wed, Jul 19, 2023 at 1:32=E2=80=AFPM Petr Gotthard
> <petr.gotthard@advantech.cz> wrote:
> >
> > Hello,
> > the out-of-tree kernel modules built with latest master have broken "ve=
rmagic" and thus cannot be loaded.
> >
> > The patch https://git.yoctoproject.org/poky/commit/?id=3Dbb0f9e87700aa4=
0ec8db880ede3c018c1d055786
> > added to meta/classes-recipe/kernel-arch.bbclass:
> >         export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
> > so when somebody sets the KERNEL_LOCALVERSION, the kernel is build with=
 this suffix. So far so good.
> >
> > The problem is that the "make-mod-scripts" doesn't know the KERNEL_LOCA=
LVERSION, so it does not set the LOCALVERSION.
> > When the LOCALVERSION is not set, one suffix used to build the kernel i=
s missing, the module "vermagic" doesn't match the kernel and the out-of-tr=
ee modules fail to load.
> > For example, after building the kernel the "kernel-build-artifacts/incl=
ude/generated/utsrelease.h" contains "6.1.33-g8f7f371be2", however after ru=
nning "make-mod-scripts" it's only "6.1.33".
> >
>
> Hmm.
>
> I explicitly tested this scenario to make sure it worked, since you
> run into the same issue when building modules on-target.
>
> make-mod-scripts is running out of the same SCM as the main kernel
> build, so it should match, and did in my testing (otherwise
> lttng-modules wouldn't work).

'er wait, I think I see the issue. I have a local change that isn't ready f=
or
submission that changes the way make-mod-scripts build, which may
have masked things. Plus, I'm never letting the SCM information be
automatically picked up into the localversion.

Which goes back to me being interested in your kernel recipe, version,
etc. This is less of an issue with that commit, versus an issue with newer
kernel versions (without that change, you always get a "+" added to the
local version, which ensures that absolutely nothing built out of tree
ever loads).

To answer your other question, we can't really store the SCM version
anywhere else, as it is not always correct when you consider all of the
ways we build kernel modules. That's why I'm inhibiting the localversion
and making sure it is explicitly set.

Bruce


>
> Can you send the exact steps, which kernel recipe you are using, etc.
> That way I can reproduce the problem locally.
>
> Bruce
>
>
> > One solution to this would be to store the KERNEL_LOCALVERSION somewher=
e and then restore it by the "make-mod-scripts" to make sure the build envi=
ronment is initialized properly. I am just not sure where is the right stor=
age for this.
> >
> >
> > Petr
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184591): https://lists.openembedded.org/g/openembedde=
d-core/message/184591
> Mute This Topic: https://lists.openembedded.org/mt/100240236/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

