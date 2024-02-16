Return-Path: <andreaskleist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB064C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 08:12:08 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.14306.1708071121140270664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 00:12:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a5eXOzoV;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: andreaskleist@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d10f52e7d8so19067591fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 00:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708071119; x=1708675919; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5bI5ebwMAE036ag3jwlWG3vldMyWQnagXWTYo4CNt9s=;
        b=a5eXOzoVsFcvZyj5DN9q/rQL5EZSuHMR9CIOIrTB1WtpdABCLi7umJC17AaBWA9p5A
         fWadBF721YgGKB6qpFwVVRM69ReR+zuQ+4qWThxkH7lN+56vQISzWgc3bQ1+0gtH4BaK
         KwxuWRNf1Z7MFU1qwmAEceizxKY622tEpZJPXmXP0YyEmzQ6c4J0QlkyhlpH78Dlhtvo
         CcQJZGxI0SHRjwjeSQg+WxkbW8bdfsa0al2m8NZaCei39GvGNox4irv7J/Z8yc6BZieU
         S1bI8JvOvUnLqxee8D8WYcksOFzKh0/un/oscEfJqjbqDhwJWpNjoSluUGFfipDbMUtC
         OhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708071119; x=1708675919;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bI5ebwMAE036ag3jwlWG3vldMyWQnagXWTYo4CNt9s=;
        b=D6rc6ANNTC7QEZzYcba9Gsf8ec1sAcGMKk3mF6cFyG965sk9bDbP1w2pNenfTbBOsE
         AvVJtncG8/cQrg6LIw7t+ZjyCfOA41SrxSNL8lQrimwUw6sJ+o3MjA65oiKycGAVG3wj
         GOpr8quP9mMJPZs1GEaTbrmaEXsNSWlNtM9TfO+WgvPOANQEWKMnt6j4OUvbMKRMaq5T
         FM4ozidQPMjYI461jgf7vM0L9BtTRS6uPIaNbO//adgnmlRpLRDcKOWj7k+6atiUnSaf
         ArHUGkBAOaDf6WUbHUHVXBdU+N6S7hU9Z1gxXApY7QC2tyk6WZ0g6Z2UAguQ7mlVv0FA
         sVMA==
X-Gm-Message-State: AOJu0YwkHpWt9KCiuVq8XmofnBfA2U4LyxPZmFHlPsMCrpe/Fa3W+v9v
	+OImZeFnVdbPbvuPgUfOmKC4dlNzPbxfn5KKkkV8orcatcoZjUxB
X-Google-Smtp-Source: AGHT+IFTsN53cop4SCITmLimU2rKrzdC57WRE4ghby+kdtW2jFuIFmr8myiY6O0n4HSBQvSzgDKroQ==
X-Received: by 2002:a19:550c:0:b0:511:7c0c:f94a with SMTP id n12-20020a19550c000000b005117c0cf94amr3137016lfe.16.1708071118600;
        Fri, 16 Feb 2024 00:11:58 -0800 (PST)
Received: from [10.9.136.59] ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id cf12-20020a0564020b8c00b00563a3ff30basm1273732edb.59.2024.02.16.00.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 00:11:58 -0800 (PST)
Message-ID: <0b450e8bcb3caf34fe2ef3e2737af6f4e62a63bc.camel@gmail.com>
Subject: Re: [OE-core][kirkstone 7/8] kernel: fix localversion in v6.3+
From: Andreas Helbech Kleist <andreaskleist@gmail.com>
To: reatmon@ti.com, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 16 Feb 2024 09:11:57 +0100
In-Reply-To: <ca451d91-e029-4913-9404-98cd1c6fe415@ti.com>
References: <cover.1707745886.git.steve@sakoman.com>
	 <d9273edae80978c34f8426f34f991b9598828aa9.1707745886.git.steve@sakoman.com>
	 <6fc21e62-f75e-4bd7-bf61-5d86efa05854@ti.com>
	 <CAOSpxdb85tHCEWMQkJ5eMPQJ=Tb+KKVEBHqAFVFA+9TOc3-_tg@mail.gmail.com>
	 <ca451d91-e029-4913-9404-98cd1c6fe415@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 08:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195740

On Thu, 2024-02-15 at 19:45 -0600, Ryan Eatmon via
lists.openembedded.org wrote:
>=20
> On 2/15/2024 7:43 PM, Steve Sakoman wrote:
> > On Thu, Feb 15, 2024 at 3:20=E2=80=AFPM Ryan Eatmon <reatmon@ti.com> wr=
ote:
> > >=20
> > >=20
> > > With this patch in place we are seeing a breakage on our kernel build=
s.
> > > This patch was cherry picked from master, but the next patch on this
> > > file in master removes the LOCALVERSION setting...
> > >=20
> > > https://git.openembedded.org/openembedded-core/commit/meta/classes-re=
cipe/kernel-arch.bbclass?h=3Dmaster-next&id=3Db378eec156998eea55ba61e59103c=
b34fab0d07c
> > >=20
> > >=20
> > > There is a disconnect here.  Why did we change kirkstone, a stable LT=
S
> > > version with a partial patch series based on master?
> >=20
> > The original kirkstone backport request for this patch was sent to the
> > list for review on February 9.
> >=20
> > There were no comments or objections, so I added it to the patch test
> > queue.  No issues were encountered on the autobuilder, so I sent this
> > patch (along with the rest of the patch queue) to the list for a
> > second review opportunity on February 12.  Once again there were no
> > comments or objections, so it was merged today February 15.
> >=20
> > I follow this process because I'm not smart enough, nor do I have time
> > enough to thoroughly research all implications of every patch.  I rely
> > on autobuilder testing and community review to minimize breakage.
> >=20
> > This normally works quite well, but this time it didn't.  I'll revert
> > this patch and if someone would like to resubmit a proper series to
> > deal with the issue it is trying to fix I will consider it and run it
> > through the same process.
>=20
> I can appreciate that.  My comment was more for the person who sent the=
=20
> patch in the first place.  You are doing a great job.  I will try and=20
> pay attention for a replacement patch coming in and review as well.

I'm sorry about that. I need to use a 6.6 kernel on kirkstone, and this
patch fixed my usecase. It looked like a simple bugfix, and I was not
aware that there was a later fix for this change.

Is there any way I can reproduce the error you saw Ryan?

And would it make sense to add an automated test for this usecase?

I'll test my usecase with both patches backported and re-submit.

/Andreas

PS: This is my first submission to oe-core, so I'm just starting to
learn. I have no idea what or how the autobuilder tests, but I'm
willing to learn.

>=20
>=20
> > Steve
> >=20
> >=20
> > > On 2/12/2024 7:54 AM, Steve Sakoman wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >=20
> > > > During testing of the v6.4 reference kernel, it was noticed that
> > > > on-target modules no longer matched the magic value of the running
> > > > kernel.
> > > >=20
> > > > This was due to a different localversion in the cross built kernel
> > > > and the scripts / resources created on target.
> > > >=20
> > > > This was due to changes in the setlocalversion script introduced
> > > > in the v6.3 series.
> > > >=20
> > > > The .scmversion file is no longer used (or packaged) to inhibit
> > > > the addition of a "+" (through querying of the git status of the
> > > > kernel) or the setting of a local version.
> > > >=20
> > > > We recently introduced the KERNEL_LOCALVERSION variable to allow
> > > > recipes to place a value in .scmversion, so we extend the use of
> > > > that variable to kernel-arch.bbclass and use it to set the
> > > > exported variable LOCALVERSION.
> > > >=20
> > > > We must do it at the kernel-arch level, as the variable must be
> > > > exported in any kernel build to ensure that setlocalversion always
> > > > correctly sets the localversion.
> > > >=20
> > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > >=20
> > > > Cherry-picked from master 765b13b7305c8d2f222cfc66d77c02e6a088c691
> > > >=20
> > > > Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
> > > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > > ---
> > > >    meta/classes/kernel-arch.bbclass |  7 +++++++
> > > >    meta/classes/kernel.bbclass      | 10 ++++++++--
> > > >    2 files changed, 15 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel=
-arch.bbclass
> > > > index 4cd08b96fb..0a79dea0af 100644
> > > > --- a/meta/classes/kernel-arch.bbclass
> > > > +++ b/meta/classes/kernel-arch.bbclass
> > > > @@ -66,3 +66,10 @@ KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.bfd ${H=
OST_LD_KERNEL_ARCH}"
> > > >    KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> > > >    TOOLCHAIN ?=3D "gcc"
> > > >=20
> > > > +# 6.3+ requires the variable LOCALVERSION to be set to not get a "=
+" in
> > > > +# the local version. Having it empty means nothing will be added, =
and any
> > > > +# value will be appended to the local kernel version. This replace=
s the
> > > > +# use of .scmversion file for setting a localversion without using
> > > > +# the CONFIG_LOCALVERSION option.
> > > > +KERNEL_LOCALVERSION ??=3D ""
> > > > +export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
> > > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbcl=
ass
> > > > index 5951347361..940f1a3cf4 100644
> > > > --- a/meta/classes/kernel.bbclass
> > > > +++ b/meta/classes/kernel.bbclass
> > > > @@ -418,7 +418,7 @@ do_compile_kernelmodules() {
> > > >        if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
> > > >                oe_runmake -C ${B} ${PARALLEL_MAKE} modules ${KERNEL=
_EXTRA_ARGS}
> > > >=20
> > > > -             # Module.symvers gets updated during the
> > > > +             # Module.symvers gets updated during the
> > > >                # building of the kernel modules. We need to
> > > >                # update this in the shared workdir since some
> > > >                # external kernel modules has a dependency on
> > > > @@ -635,7 +635,13 @@ kernel_do_configure() {
> > > >        # $ scripts/setlocalversion . =3D> +
> > > >        # $ make kernelversion =3D> 2.6.37
> > > >        # $ make kernelrelease =3D> 2.6.37+
> > > > -     touch ${B}/.scmversion ${S}/.scmversion
> > > > +     # See kernel-arch.bbclass for post v6.3 removal of the extra
> > > > +     # + in localversion. .scmversion is no longer used, and the
> > > > +     # variable LOCALVERSION must be used
> > > > +     if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]; then
> > > > +             echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> > > > +             echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
> > > > +     fi
> > > >=20
> > > >        if [ "${S}" !=3D "${B}" ] && [ -f "${S}/.config" ] && [ ! -f=
 "${B}/.config" ]; then
> > > >                mv "${S}/.config" "${B}/.config"
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > > >=20
> > >=20
> > > --
> > > Ryan Eatmon                reatmon@ti.com
> > > -----------------------------------------
> > > Texas Instruments, Inc.  -  LCPD  -  MGTS
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195736): https://lists.openembedded.org/g/openembedde=
d-core/message/195736
> Mute This Topic: https://lists.openembedded.org/mt/104311283/7501392
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
dreaskleist@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


