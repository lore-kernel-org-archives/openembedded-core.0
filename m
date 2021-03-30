Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web11.3058.1617129660783081410
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 11:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=KSgUj3Cu;
 spf=pass (domain: blade-group.com, ip: 209.85.217.53, mailfrom: yann.dirson@blade-group.com)
Received: by mail-vs1-f53.google.com with SMTP id u29so5511035vsi.12
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Mar 2021 11:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OR98fFXaBwnNKWUOedMMWcoFomgHtEognBZeZl5FJoA=;
        b=KSgUj3CuVvheDN8olHE6iBJJ2cTxSqtb4LrGJ136BG+RXm78lIYKi9HaUSASJpfRDB
         2rGLWY+SWg1j4/zJgQdufoIppSWbkWgpDu7LJIcBi+RPZnO0xYLAhrRuQhce55O+PuaY
         72++FbzG1KSirv/5JJ1HzXC8udsockrHKH1YS5OxVr6RhATMPqIz07Sg2AG01K0YghBF
         4PsdBjf1PbezoB1DdaS/ZbrxYxJIMfw4QmZWUggMZ0VpA3df5mAWeEkpzn+FMcZKBb4J
         cUYwsuBMAH4v+iG+vAbDO5uy5YsewSPQH7hwN6K6v4b1UduABHyWD3rOECjWboNXCzG+
         dy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OR98fFXaBwnNKWUOedMMWcoFomgHtEognBZeZl5FJoA=;
        b=cOVPW/jL7Rq34qyqMMuW9BYMrZiNVYuIQweBojgugQfOELEoKeyErlcZWGK/xHdfkr
         brdNWTMdu1aEWyaTZztzJMsfaVS9+QbOXIrEi1k8iS0bAUYuUUKk7E4gTz2hsp/BSJUb
         pV2OtX/1oIBYvGxI+jKLF6qo67JLF+DU0+l+WKBiO4C9QMkkeU0D5Nb8m0Q1lghQpP5T
         BzWo1lPOgOGwHiuJTHXKzPqADu4kIkN1vm6VghB9dgVfWWnYwRIwo0zSOpGAAsLfzxDu
         jr3oA4pR9xGCM/NA8nEW4kcDDsMCGOD6yi0dBE3Im0Tbwo1EbrmIL7TObHa/XskHpkLk
         Lcig==
X-Gm-Message-State: AOAM531j8NXqe0xPoRcJSSFN0IBDKi0IHF6HNesgZGHC4t8SIFH9pw+3
	hCzwpRKi6LpwboXxzknbO+mokyMx4N6UlZtzpKy6kw==
X-Google-Smtp-Source: ABdhPJycX2cAJdg27DBrCINrk1G2QMfDUXbwDU7UUvlHSryOHkPy/CJC0HGgPeLN/jjHZyMNNlREKJ9Eu9hLCWauW3s=
X-Received: by 2002:a67:ebc7:: with SMTP id y7mr6772316vso.41.1617129659888;
 Tue, 30 Mar 2021 11:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210330172713.753008-1-yann@blade-group.com> <CADkTA4OzuvmXAHtyBaeqxG0k1wtW7eZJco2Q511Ekbjo_-RtZQ@mail.gmail.com>
In-Reply-To: <CADkTA4OzuvmXAHtyBaeqxG0k1wtW7eZJco2Q511Ekbjo_-RtZQ@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 30 Mar 2021 20:40:48 +0200
Message-ID: <CA+4=imZxs4iE2Y57nv7THbXgWJDXsB4uaaV5sJJeznw_WzDdVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: log some kmeta information to assist in developing a bsp
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Le mar. 30 mars 2021 =C3=A0 19:47, Bruce Ashfield
<bruce.ashfield@gmail.com> a =C3=A9crit :
>
> On Tue, Mar 30, 2021 at 1:27 PM Yann Dirson <yann.dirson@blade-group.com=
> wrote:
> >
> > From: Yann Dirson <yann@blade-group.com>
> >
> > This is not quite enough for the lack of a BSP to stand out clearly to
> > an unsuspecting user's eyes, but at least this line in the logs should
> > help some of us to get a clue:
> >
> >   NOTE: Using kmeta BSP ''
>
> Sorry, but no on this.
>
> There are already logs that are kept in the build directories
> themselves. They can be further exposed via some of the existing debug
> knobs that I have, but this is just noise in the general logs.

I must say I did not find any existing logs on this, where can I find them=
 ?

>
> Cheers,
>
> Bruce
>
> >
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-y=
octo.bbclass
> > index 35587dd564..c6228ad0b8 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -234,6 +234,7 @@ do_kernel_metadata() {
> >                     KMETA_EXTERNAL_BSPS=3D"t"
> >                 fi
> >         fi
> > +       bbnote "Using kmeta BSP '$bsp_definition'"
> >         meta_dir=3D$(kgit --meta)
> >
> >         KERNEL_FEATURES_FINAL=3D""
> > @@ -264,6 +265,7 @@ do_kernel_metadata() {
> >         if [ "$mode" =3D "config" ]; then
> >                 # run1: pull all the configuration fragments, no matte=
r where they come from
> >                 elements=3D"`echo -n ${bsp_definition} $sccs_defconfig=
 ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
> > +               bbnote "config: kmeta configuration fragments: $elemen=
ts"
> >                 if [ -n "${elements}" ]; then
> >                         echo "${bsp_definition}" > ${S}/${meta_dir}/bs=
p_definition
> >                         scc --force -o ${S}/${meta_dir}:cfg,merge,meta=
 ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURE=
S_FINAL
> > @@ -283,6 +285,7 @@ do_kernel_metadata() {
> >         if [ "$mode" =3D "patch" ]; then
> >                 # run2: only generate patches for elements that have b=
een passed on the SRC_URI
> >                 elements=3D"`echo -n ${sccs} ${patches} $KERNEL_FEATUR=
ES_FINAL`"
> > +               bbnote "patch: kmeta configuration fragments: $element=
s"
> >                 if [ -n "${elements}" ]; then
> >                         scc --force -o ${S}/${meta_dir}:patch --cmds p=
atch ${includes} ${sccs} ${patches} $KERNEL_FEATURES_FINAL
> >                         if [ $? -ne 0 ]; then
> > --
> > 2.30.2
> >
> >
> >=20
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
