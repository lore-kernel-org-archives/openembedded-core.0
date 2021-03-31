Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.6060.1617194500556519643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 05:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r/7vQc97;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id u5so29857494ejn.8
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CzllDDQKUfh8pKPEyrOXoWmvjtotQ3bOK4ypF/EcZ9A=;
        b=r/7vQc97GM4/UOxCZoo0QsEz4Y5HIDb/ZnyfzhfX/Xxdb6DrWc/SHjYvKwyyPKdbmc
         5LPMFj00XrHBL45i170o5p7Wi/vOGNuOw//BVozQg+FbmBBjjEdWcb9JlkYtsRtkzvVv
         d7tXWoHuZBzGQ4juUeDKvnR090g/Draz+6BgBofeOAz5/2zBQO9bs68vTEqorOXRNmxN
         sCMc44po5advAclt5W4Xf6LGShLIOJBlLAdlYMdOG+nHnMARJXwRTmXBQywQ2SthhK6A
         fBuMDdZxJkhQT75PsVyswuGczOFgMMiUJ/HTgyq3AslIhikAnmkvJZAmGkXQR4uof8E4
         8W3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CzllDDQKUfh8pKPEyrOXoWmvjtotQ3bOK4ypF/EcZ9A=;
        b=mC5pjJHyXRlM+rHVRURNBSU1IkJIQf6mrfUB6itSDxi5bhk3hJTjROjomJXvdjrRcW
         2G6w3ufLk66OPTkF1HsLjL237OGJRLZEQt31GTljPfRjOzQsZX9bZdF6FlLdGJ9IhEOU
         tGOa0cuz2mVelyj7g1kXLtlCzuY78BSjMwHxFS+UG6Zhd/ZI8zMQ0YCMml4O67zUyBS5
         i1BxDfXlw3fPp4QHC7mJ7cqfJPO8ifNGLPX3U6i+wddwx/osVQvNpZ2b1Q35Y6sZHCBA
         uf/mvzBEjppUygcAl34P1w+tQYLRQEVGTNfyu+pw4UEzV7ORNhczc1EE0t3ThruL8jSS
         /G3Q==
X-Gm-Message-State: AOAM530pKAKTnILa6k5sfUix3l+XB6TqWx7yImFLEqQPAjpKtHkiXCX2
	SAGEW0vY+VBxC6yuQ0FYC9CI2vPxurhzYEAtyjA=
X-Google-Smtp-Source: ABdhPJyzp1pI2jIwxAvje1g+VBeB6BPYpvLGv7Lzg2IUBXsxgONfR14dVpZ+IcSgKfJASCV9t6oRQMHr0NoWeeBX3og=
X-Received: by 2002:a17:906:11d1:: with SMTP id o17mr3275159eja.517.1617194499032;
 Wed, 31 Mar 2021 05:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210330172713.753008-1-yann@blade-group.com> <CADkTA4OzuvmXAHtyBaeqxG0k1wtW7eZJco2Q511Ekbjo_-RtZQ@mail.gmail.com>
 <167132DBE07A7A98.4802@lists.openembedded.org> <CA+4=imZrzFn52=8Pfi3kLJdoKMhipfNyHZg09VdAjv5R9ZnAXQ@mail.gmail.com>
In-Reply-To: <CA+4=imZrzFn52=8Pfi3kLJdoKMhipfNyHZg09VdAjv5R9ZnAXQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 31 Mar 2021 08:41:27 -0400
Message-ID: <CADkTA4O0jSAjwBsq8_nr9WLP_N85GZ3Xyd9JSgAiC8ja9xaicA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: log some kmeta information to assist in developing a bsp
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 31, 2021 at 6:23 AM Yann Dirson <yann.dirson@blade-group.com> w=
rote:
>
> Le mar. 30 mars 2021 =C3=A0 20:41, Yann Dirson via lists.openembedded.or=
g
> <yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :
> >
> > Hi Bruce,
> >
> > Le mar. 30 mars 2021 =C3=A0 19:47, Bruce Ashfield
> > <bruce.ashfield@gmail.com> a =C3=A9crit :
> > >
> > > On Tue, Mar 30, 2021 at 1:27 PM Yann Dirson <yann.dirson@blade-group=
.com> wrote:
> > > >
> > > > From: Yann Dirson <yann@blade-group.com>
> > > >
> > > > This is not quite enough for the lack of a BSP to stand out clearl=
y to
> > > > an unsuspecting user's eyes, but at least this line in the logs sh=
ould
> > > > help some of us to get a clue:
> > > >
> > > >   NOTE: Using kmeta BSP ''
> > >
> > > Sorry, but no on this.
> > >
> > > There are already logs that are kept in the build directories
> > > themselves. They can be further exposed via some of the existing deb=
ug
> > > knobs that I have, but this is just noise in the general logs.
> >
> > I must say I did not find any existing logs on this, where can I find =
them ?
>
> After some digging in the source I finally noticed the merge_config.sh
> output being saved
> under $meta_dir.  It still took me an additional log to locate the log
> under work-shared/.../kernel-source/.
> I'm pretty sure I was pointed to this file in the past, but I find it
> unnecessarily difficult to locate.

As opposed to any of the other random log files that contain somewhat
internal information ? This isn't something that the majority of people
need to see, so it stays local to what the recipes are building (the
kernel). The use facing distillation of that information is the kernel
configuration audit.

In the past 10 years or so, I've bounced back and forth between
exposing more information, getting complaints/comments about
the amount of noise and fine tuning the signal to noise in the
information. That's what is being balanced here.

>
> Still, this log does not contain the name of the top-level
> $KMACHINE-$KTYPE.scc, which is the
> information I'm after.

That's logged in a file in the .kernel-meta directory.
(${S}/${meta_dir}/bsp_definition)

>
> I do agree however that it make it unnecessary to log the whole $element=
s list,
> as long it is easy enough to locate the information.  Here is a
> proposal to address this last point, so that
> a user looking at the task logs gets the path to it.  Does that one
> look OK to you ?
>

There's already a kernel config audit task, and that's where any enhanced
information really needs to go.

There's no need to rush through anything on this, since we are right on to=
p
of a release, and although minor, I wouldn't push for it to go in at this =
point.

But I do agree, we can tweak things to expose a bit more information that
aids in development of new BSPs/fragments than is currently available.

I can float some RFC patches in a few weeks and see if they meet the need.

Bruce

> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> index 9aa0eb07c6..e3efa34671 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -430,6 +430,8 @@ do_kernel_configme() {
>                 else
>                         bbfatal_log "Details can be found at:
> ${S}/${meta_dir}/cfg/merge_config_build.log"
>                 fi
> +       else
> +               bbnote "Detailed merge_config.sh output can be found
> at: ${S}/${meta_dir}/cfg/merge_config_build.log"
>         fi
>
>         if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
>
> >
> > >
> > > Cheers,
> > >
> > > Bruce
> > >
> > > >
> > > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > > ---
> > > >  meta/classes/kernel-yocto.bbclass | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kern=
el-yocto.bbclass
> > > > index 35587dd564..c6228ad0b8 100644
> > > > --- a/meta/classes/kernel-yocto.bbclass
> > > > +++ b/meta/classes/kernel-yocto.bbclass
> > > > @@ -234,6 +234,7 @@ do_kernel_metadata() {
> > > >                     KMETA_EXTERNAL_BSPS=3D"t"
> > > >                 fi
> > > >         fi
> > > > +       bbnote "Using kmeta BSP '$bsp_definition'"
> > > >         meta_dir=3D$(kgit --meta)
> > > >
> > > >         KERNEL_FEATURES_FINAL=3D""
> > > > @@ -264,6 +265,7 @@ do_kernel_metadata() {
> > > >         if [ "$mode" =3D "config" ]; then
> > > >                 # run1: pull all the configuration fragments, no m=
atter where they come from
> > > >                 elements=3D"`echo -n ${bsp_definition} $sccs_defco=
nfig ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
> > > > +               bbnote "config: kmeta configuration fragments: $el=
ements"
> > > >                 if [ -n "${elements}" ]; then
> > > >                         echo "${bsp_definition}" > ${S}/${meta_dir=
}/bsp_definition
> > > >                         scc --force -o ${S}/${meta_dir}:cfg,merge,=
meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEA=
TURES_FINAL
> > > > @@ -283,6 +285,7 @@ do_kernel_metadata() {
> > > >         if [ "$mode" =3D "patch" ]; then
> > > >                 # run2: only generate patches for elements that ha=
ve been passed on the SRC_URI
> > > >                 elements=3D"`echo -n ${sccs} ${patches} $KERNEL_FE=
ATURES_FINAL`"
> > > > +               bbnote "patch: kmeta configuration fragments: $ele=
ments"
> > > >                 if [ -n "${elements}" ]; then
> > > >                         scc --force -o ${S}/${meta_dir}:patch --cm=
ds patch ${includes} ${sccs} ${patches} $KERNEL_FEATURES_FINAL
> > > >                         if [ $? -ne 0 ]; then
> > > > --
> > > > 2.30.2
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > Yann Dirson <yann@blade-group.com>
> > Blade / Shadow -- http://shadow.tech
> >
> >=20
> >
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
