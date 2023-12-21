Return-Path: <cordonnier.etienne@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1846C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 20:09:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.3764.1703189369976124792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 12:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nnkI/yED;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: cordonnier.etienne@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40d05ebe642so14044015e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 12:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703189368; x=1703794168; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EctCqhNjFE13hOvF3xyG9JJt/5JFYB4yvFBuRrbTIrM=;
        b=nnkI/yEDkOcGxPC4HevUTrOOA5B918CJmrPs4nGdIQaosFIeEhKtyIohzJG1AlTWRq
         OapzaHOmnN7LYrKrr0+SWV5Bp71CSckJklHuvL3Ulk0bd6TExbFJ8WCnGQIbypzrFJrf
         lvaTNs2v4/GWu7JL/QEuN4Kw1FvzYpxD3mfdvq06JC8ayulC4HyBH1FQeQ6CnKLstNsz
         Lc7w/vjCzIFY+tRJTFxULY6FIPG5kw5f3RdgDxHxeLsc2Mtk0umaw1g40ZmSM5hQA9ff
         HrmpoqB791djifSVQUxCZdYUM5EqAMpd/l6tahLqhp/SBbjBE3OWRpWIiQlapw8NS/rq
         P4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703189368; x=1703794168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EctCqhNjFE13hOvF3xyG9JJt/5JFYB4yvFBuRrbTIrM=;
        b=kubOU/eC15SoZjv3GiOE/p+7d2fiyYr6Xv6NMdQ9Ex9fm4JwOGj/1S4zYdCxBluF8s
         lan9XAtF+ZtNVOJL5twCjP3A4+hyDHzhc9TfJbgZ3GAuRkaE45uXetoJYRIhANtkAgAE
         sy0iWVQTNhw1KwXzU1pQhSvQKe4d0kPBkfUL4PUjm4tD1TevJegGOfrIayccN8Z782m4
         qM/zOte+xbE3NvXsYQe3ETXoAcDAnsh1yY4gxcvPApqG7K7sWw/qjoH8ipl6Dj9JmAJH
         sRECvCDz1TlPryu4Oh4LB5q7g5OJthxt4WxLBmcWfIk9XkJYbyE6fqi+4X98Fs9w9CSV
         1z6A==
X-Gm-Message-State: AOJu0YyFSCfu8y7+1MLTrXgVvSCevxVIC/4cn5kH3Ho9rfMx1e5mMoGt
	SnGnmvXfL/kY401mk3+66sXmHgAWHHSgB6LOuHY=
X-Google-Smtp-Source: AGHT+IHZp/TIQKQ9Sq6stITy1Dp9fNl6+yVroUaCEezQmF3VVZDdXSo03sXJnK9QyAqqThTj4Kcr4LR0HNt0jj/3oQA=
X-Received: by 2002:a7b:cd0e:0:b0:40c:2cb4:f168 with SMTP id
 f14-20020a7bcd0e000000b0040c2cb4f168mr141090wmj.56.1703189367991; Thu, 21 Dec
 2023 12:09:27 -0800 (PST)
MIME-Version: 1.0
References: <17A23F37CD7211A7.10836@lists.openembedded.org>
 <CAHUKmYZ_czf-Zg=Mr5fN9nREnq3iE8VAiLSRS7hOAN7qRcTX5w@mail.gmail.com> <CAMKF1sqpj_PCmQ5KRevqiBMxi6up4rdp3xZ-9TwD3fLOAzhouw@mail.gmail.com>
In-Reply-To: <CAMKF1sqpj_PCmQ5KRevqiBMxi6up4rdp3xZ-9TwD3fLOAzhouw@mail.gmail.com>
From: Etienne Cordonnier <cordonnier.etienne@gmail.com>
Date: Thu, 21 Dec 2023 21:09:17 +0100
Message-ID: <CAJFWPWaSCUcjL1kQ3EWfWqd=95rbY8P9iOddxCTtoR0AE0cKQg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: Khem Raj <raj.khem@gmail.com>
Cc: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 20:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192846

Is it from https://github.com/varigit/meta-variscite-bsp-ti or
https://github.com/varigit/meta-variscite-bsp-imx ? I did not find a
repository called "meta-variscite-bsp".

On Thu, Dec 21, 2023 at 5:14=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> this fails in linux-variscrite recipe from meta-variscite-bsp
>
> https://snips.sh/f/9klGZxlCRE
>
> On Tue, Dec 19, 2023 at 5:40=E2=80=AFAM Etienne Cordonnier via
> lists.openembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org>
> wrote:
> >
> > Patch v4: use idempotent copy of the files instead of simply skipping t=
he code (see discussion under v2 of the patch).
> >
> > On Tue, Dec 19, 2023 at 2:38=E2=80=AFPM Etienne Cordonnier via lists.op=
enembedded.org <ecordonnier=3Dsnap.com@lists.openembedded.org> wrote:
> >>
> >> From: Etienne Cordonnier <ecordonnier@snap.com>
> >>
> >> The function do_symlink_kernsrc is not reentrant in the case where S i=
s defined
> >> to a non-default value. This causes build-failures e.g. when building =
linux-yocto, then updating
> >> poky to a commit which modifies kernel.bbclass, and then building linu=
x-yocto again.
> >>
> >> Bugzilla: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzi=
lla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIDAg&c=3DncDTmphkJTv=
jIDPh0hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa6=
6m67E&m=3DVB1zXAiE9q_CqM9DgoA0BbtloUxpQE_rQ7eqk7HGzBW9KzFu44K9hS1iahsqSuIk&=
s=3D9Cr8vwWgUwwGM5oCO07DB4sO9sQpMCdweS1u8CmZ0Qw&e=3D
> >>
> >> Tested with a recipe "my-custom-linux" which unpacks sources to a cust=
om ${S} directory
> >> and ran symlink_kernsrc several times:
> >> $ bitbake -f -c symlink_kernsrc my-custom-linux
> >>
> >> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> >> ---
> >>  meta/classes-recipe/kernel.bbclass | 8 +++++++-
> >>  1 file changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass
> >> index 9ff37f5c38..42c5519f81 100644
> >> --- a/meta/classes-recipe/kernel.bbclass
> >> +++ b/meta/classes-recipe/kernel.bbclass
> >> @@ -189,11 +189,17 @@ python do_symlink_kernsrc () {
> >>              # drop trailing slash, so that os.symlink(kernsrc, s) doe=
sn't use s as
> >>              # directory name and fail
> >>              s =3D s[:-1]
> >> -        if d.getVar("EXTERNALSRC"):
> >> +        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
> >>              # With EXTERNALSRC S will not be wiped so we can symlink =
to it
> >>              os.symlink(s, kernsrc)
> >>          else:
> >>              import shutil
> >> +            # perform idempotent/reentrant copy
> >> +            s_copy =3D s + ".orig"
> >> +            if not os.path.isdir(s_copy):
> >> +                shutil.copytree(s, s_copy)
> >> +            bb.utils.remove(s, recurse=3DTrue)
> >> +            shutil.copytree(s_copy, s)
> >>              shutil.move(s, kernsrc)
> >>              os.symlink(kernsrc, s)
> >>  }
> >> --
> >> 2.36.1.vfs.0.0
> >>
> >>
> >>
> >>
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192838): https://lists.openembedded.org/g/openembedde=
d-core/message/192838
> Mute This Topic: https://lists.openembedded.org/mt/103262114/7259375
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [co=
rdonnier.etienne@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

