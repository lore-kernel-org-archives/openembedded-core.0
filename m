Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CD8C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 13:51:40 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.19207.1708091498684994890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 05:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MyLyDOyu;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: andreaskleist@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3de25186fbso74292666b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 05:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708091497; x=1708696297; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Rq36aaWBRYVYBvemg+wcE3d18UBLxeInoP/Er4II/Ko=;
        b=MyLyDOyuDRJ5q8BId3xWmNHT0WylLJzxy1D171YCjfh+hvi7PGQk9xlTittgqFgeu2
         Q3/l4sTPPeqG0IsGKOH9+oExrZ9SLaYAQ0pBS2JDYFHmSA16g8rD6GwPdYdOT7eQZZnQ
         BKYfK4EiQPYYEgu28TWZuTUGR9rJFTLRdapvEUsU4KIEtiYESLtOLaNckUQWDdoDYitE
         ARpvTkxrw0MK4QS/vrWKuqkX3FGtDuAH2bL7nPutmRwT6invoKFPAKeedwXhwMNhVF1n
         nHYRXV8WsoIBs2OOeJN/IAaPVGwMZh21rlOKi86yKvyrtXy22cYWcEQN493ZC8ZjpVv8
         8acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708091497; x=1708696297;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rq36aaWBRYVYBvemg+wcE3d18UBLxeInoP/Er4II/Ko=;
        b=bUv3URMHXRSDFYcLw5rP0DWQE33FTEVue7kfiOE9xn5h+cE4tkJGIENoMlS1Cl27Gl
         Jgfn88HFyus7AncIeOrRdy7aYzVzH86qJelB19/7XXRybARNP4fQNaVDdNvFv5gUbUMQ
         t+cbj4NiIBKbCtkz/PfjhxZ+wJzYvmjqDgCQFNa4EtX40sHD8QaPPyaDOMCLdNiyO94y
         oKYPlDPnWrwF7JNqUsbaDJmDmeyVImWtvv+Y4oQCRNVqpAcgTL7s6v/imfJ/xYIpPwFX
         mjBXndvnJuUinYyny3N6X2ZEP9+PP3LpKF55gUIl1CnqTY/apKlKPHsUqP5qHDpkSSpV
         VLvA==
X-Gm-Message-State: AOJu0Yy1XKp+f5TmcSWHASQMMcy578DyG7ASyJpOkGgOQZjASqJFbBoj
	CJ/gitxTNFoPQ130L/9XC8Mkk6jsaXLguAmQUg6geFsI0/K1W0nz
X-Google-Smtp-Source: AGHT+IFs8UwSBmo/3QePJHXrUcIdzo+r/ltJElFBr807nHPijEqz7mv5iDXHeuNEVmJBWEU2YtFodg==
X-Received: by 2002:a17:906:8c6:b0:a3d:d9a1:e84e with SMTP id o6-20020a17090608c600b00a3dd9a1e84emr1378995eje.38.1708091496792;
        Fri, 16 Feb 2024 05:51:36 -0800 (PST)
Received: from [192.168.50.250] (c-x5996889d.customers.hiper-net.dk. [89.150.136.157])
        by smtp.gmail.com with ESMTPSA id cu12-20020a170906ba8c00b00a3cb30d6271sm1585855ejd.143.2024.02.16.05.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:51:36 -0800 (PST)
Message-ID: <bc5ae7215cb00d5f61e2c9870a5f4c9ec0b2854d.camel@gmail.com>
Subject: Re: [OE-core][kirkstone 7/8] kernel: fix localversion in v6.3+
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: reatmon@ti.com, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 16 Feb 2024 14:51:35 +0100
In-Reply-To: <0b450e8bcb3caf34fe2ef3e2737af6f4e62a63bc.camel@gmail.com>
References: <cover.1707745886.git.steve@sakoman.com>
	 <d9273edae80978c34f8426f34f991b9598828aa9.1707745886.git.steve@sakoman.com>
	 <6fc21e62-f75e-4bd7-bf61-5d86efa05854@ti.com>
	 <CAOSpxdb85tHCEWMQkJ5eMPQJ=Tb+KKVEBHqAFVFA+9TOc3-_tg@mail.gmail.com>
	 <ca451d91-e029-4913-9404-98cd1c6fe415@ti.com>
	 <0b450e8bcb3caf34fe2ef3e2737af6f4e62a63bc.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 13:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195769

On Fri, 2024-02-16 at 09:11 +0100, Andreas Helbech Kleist wrote:
> On Thu, 2024-02-15 at 19:45 -0600, Ryan Eatmon via
> lists.openembedded.org wrote:
> >=20
> > On 2/15/2024 7:43 PM, Steve Sakoman wrote:
> > > On Thu, Feb 15, 2024 at 3:20=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> =
wrote:
> > > >=20
> > > >=20
> > > > With this patch in place we are seeing a breakage on our kernel bui=
lds.
> > > > This patch was cherry picked from master, but the next patch on thi=
s
> > > > file in master removes the LOCALVERSION setting...
> > > >=20
> > > > https://git.openembedded.org/openembedded-core/commit/meta/classes-=
recipe/kernel-arch.bbclass?h=3Dmaster-next&id=3Db378eec156998eea55ba61e5910=
3cb34fab0d07c
> > > >=20
> > > >=20
> > > > There is a disconnect here.  Why did we change kirkstone, a stable =
LTS
> > > > version with a partial patch series based on master?
> > >=20
> > > The original kirkstone backport request for this patch was sent to th=
e
> > > list for review on February 9.
> > >=20
> > > There were no comments or objections, so I added it to the patch test
> > > queue.  No issues were encountered on the autobuilder, so I sent this
> > > patch (along with the rest of the patch queue) to the list for a
> > > second review opportunity on February 12.  Once again there were no
> > > comments or objections, so it was merged today February 15.
> > >=20
> > > I follow this process because I'm not smart enough, nor do I have tim=
e
> > > enough to thoroughly research all implications of every patch.  I rel=
y
> > > on autobuilder testing and community review to minimize breakage.
> > >=20
> > > This normally works quite well, but this time it didn't.  I'll revert
> > > this patch and if someone would like to resubmit a proper series to
> > > deal with the issue it is trying to fix I will consider it and run it
> > > through the same process.
> >=20
> > I can appreciate that.  My comment was more for the person who sent the=
=20
> > patch in the first place.  You are doing a great job.  I will try and=
=20
> > pay attention for a replacement patch coming in and review as well.
>=20
> I'm sorry about that. I need to use a 6.6 kernel on kirkstone, and this
> patch fixed my usecase. It looked like a simple bugfix, and I was not
> aware that there was a later fix for this change.
>=20
> Is there any way I can reproduce the error you saw Ryan?
>=20
> And would it make sense to add an automated test for this usecase?
>=20
> I'll test my usecase with both patches backported and re-submit.

I've now looked into it and can make it work in my setup by backporting
these three commits from master:

  kernel.bbclass: introduce KERNEL_LOCALVERSION
=20
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D229435a52f36ddec5f85fb6d5ccd42044b688397

  kernel: fix localversion in v6.3+
=20
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D765b13b7305c8d2f222cfc66d77c02e6a088c691

  kernel: make LOCALVERSION consistent between recipes
=20
https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3Db378eec156998eea55ba61e59103cb34fab0d07c

The cherry-pick's apply cleanly without any conflicts.

Would they be appropriate for kirkstone? I'm wondering if there would
be any issue with backporting the KERNEL_LOCALVERSION variable
specifically.

If I hear nothing before the middle of next week, I'll submit the patch
series (CC'ing you Ryan).


/Andreas
>=20
> PS: This is my first submission to oe-core, so I'm just starting to
> learn. I have no idea what or how the autobuilder tests, but I'm
> willing to learn.
>=20
> >=20
> >=20
> > > Steve
> > >=20
> > >=20
> > > > On 2/12/2024 7:54 AM, Steve Sakoman wrote:
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >=20
> > > > > During testing of the v6.4 reference kernel, it was noticed that
> > > > > on-target modules no longer matched the magic value of the runnin=
g
> > > > > kernel.
> > > > >=20
> > > > > This was due to a different localversion in the cross built kerne=
l
> > > > > and the scripts / resources created on target.
> > > > >=20
> > > > > This was due to changes in the setlocalversion script introduced
> > > > > in the v6.3 series.
> > > > >=20
> > > > > The .scmversion file is no longer used (or packaged) to inhibit
> > > > > the addition of a "+" (through querying of the git status of the
> > > > > kernel) or the setting of a local version.
> > > > >=20
> > > > > We recently introduced the KERNEL_LOCALVERSION variable to allow
> > > > > recipes to place a value in .scmversion, so we extend the use of
> > > > > that variable to kernel-arch.bbclass and use it to set the
> > > > > exported variable LOCALVERSION.
> > > > >=20
> > > > > We must do it at the kernel-arch level, as the variable must be
> > > > > exported in any kernel build to ensure that setlocalversion alway=
s
> > > > > correctly sets the localversion.
> > > > >=20
> > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org=
>
> > > > >=20
> > > > > Cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a088c69=
1
> > > > >=20
> > > > > Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
> > > > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > > > ---
> > > > >    meta/classes/kernel-arch.bbclass |  7 +++++++
> > > > >    meta/classes/kernel.bbclass      | 10 ++++++++--
> > > > >    2 files changed, 15 insertions(+), 2 deletions(-)
> > > > >=20
> > > > > diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kern=
el-arch.bbclass
> > > > > index 4cd08b96fb..0a79dea0af 100644
> > > > > --- a/meta/classes/kernel-arch.bbclass
> > > > > +++ b/meta/classes/kernel-arch.bbclass
> > > > > @@ -66,3 +66,10 @@ KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.bfd $=
{HOST_LD_KERNEL_ARCH}"
> > > > >    KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH=
}"
> > > > >    TOOLCHAIN ?=3D "gcc"
> > > > >=20
> > > > > +# 6.3+ requires the variable LOCALVERSION to be set to not get a=
 "+" in
> > > > > +# the local version. Having it empty means nothing will be added=
, and any
> > > > > +# value will be appended to the local kernel version. This repla=
ces the
> > > > > +# use of .scmversion file for setting a localversion without usi=
ng
> > > > > +# the CONFIG_LOCALVERSION option.
> > > > > +KERNEL_LOCALVERSION ??=3D ""
> > > > > +export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
> > > > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bb=
class
> > > > > index 5951347361..940f1a3cf4 100644
> > > > > --- a/meta/classes/kernel.bbclass
> > > > > +++ b/meta/classes/kernel.bbclass
> > > > > @@ -418,7 +418,7 @@ do_compile_kernelmodules() {
> > > > >        if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); th=
en
> > > > >                oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERN=
EL_EXTRA_ARGS}
> > > > >=20
> > > > > -             # Module.symvers gets updated during the
> > > > > +             # Module.symvers gets updated during the
> > > > >                # building of the kernel modules. We need to
> > > > >                # update this in the shared workdir since some
> > > > >                # external kernel modules has a dependency on
> > > > > @@ -635,7 +635,13 @@ kernel_do_configure() {
> > > > >        # $ scripts/setlocalversion . =3D> +
> > > > >        # $ make kernelversion =3D> 2.6.37
> > > > >        # $ make kernelrelease =3D> 2.6.37+
> > > > > -     touch ${B}/.scmversion ${S}/.scmversion
> > > > > +     # See kernel-arch.bbclass for post v6.3 removal of the extr=
a
> > > > > +     # + in localversion. .scmversion is no longer used, and the
> > > > > +     # variable LOCALVERSION must be used
> > > > > +     if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
> > > > > +             echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> > > > > +             echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> > > > > +     fi
> > > > >=20
> > > > >        if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] && [ ! =
-f "${B}/.config" ]; then
> > > > >                mv "${S}/.config" "${B}/.config"
> > > > >=20
> > > > >=20
> > > > >=20
> > > > >=20
> > > > >=20
> > > >=20
> > > > --
> > > > Ryan Eatmon                reatmon@ti.com
> > > > -----------------------------------------
> > > > Texas Instruments, Inc.  -  LCPD  -  MGTS
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#195736): https://lists.openembedded.org/g/openembed=
ded-core/message/195736
> > Mute This Topic: https://lists.openembedded.org/mt/104311283/7501392
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
andreaskleist@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
>=20


