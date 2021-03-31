Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web08.4710.1617186192142408403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 03:23:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Rn+4Kocm;
 spf=pass (domain: blade-group.com, ip: 209.85.217.54, mailfrom: yann.dirson@blade-group.com)
Received: by mail-vs1-f54.google.com with SMTP id v29so5658434vsi.7
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 03:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ycbpaO9S+99A5lsjuwN71r17vzhYddRZB8v0hd6eLXI=;
        b=Rn+4Kocm7xFEuaW9AulVOlL6jT7SrBhEmeiOWNKhM8myHIYUp/1DgZw5xqlFcpMwaS
         ACy231SH0DP8hTWRYsoni6adX3///Ykia6t26jx9RX2zbdeiwbFYktUwwHK2B4qojbVB
         AlS0618Ps2YXZCLYSJ/KF+vwmpyBmr6KG8Kp9PMOHDJ1BfJhftPKqs2+09eCTh4AUIvi
         y9PWFAaLYfouyQvR5bc4DAjbD+6FmaEfdCnUWbxcIkREdfZWPe9HzV/K2FCfc2rDgjlE
         BZ+aQkznL+ypjY6McPRqqmw5aSfHpYi5FrR5EkUGDCv3sf2Mz+Y3pHYE9f+nRLsDwMvp
         kRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ycbpaO9S+99A5lsjuwN71r17vzhYddRZB8v0hd6eLXI=;
        b=eHxFpuLf6oOkMX14khbczter13JISFmnkHbo2EpFaj9NB0DH2lYVfpx/5z+bUj3y9j
         4BgZHLLdzE4LiJvbC9NfYfVAlWA0FOvJgLd0QrT52u9zVPyigvZhKpboLQgs9NY1BFmG
         pLeqfbnc5TAOmma+Q5qTZ1leVWuBX8oy5/1kSLMII72UXMvmx5HLZgHwKSC1S2QBYQ1o
         y127bocFSwvOq4xqPFucPIG4NqsoORsPyUdYnIhbuwY1jUo77VIUjMEWkOZMotuMljzW
         wb3sBNJMws9D3CJfwi7nr3YbM1bfxK88ToWuIRq87zSf4EWHQl/E4egNE5KgqGPSyd9I
         e2Hw==
X-Gm-Message-State: AOAM532ok5eBRtNGGWoNQByOdw8/AmfdxJ1KhBTn/s4NVFR7W36qkkfl
	dQ5bxbYLCIwEGukOsHIV/NyXG+ILKibqJseSbS/kCw==
X-Google-Smtp-Source: ABdhPJxC0SujI8PBj3B94iAk/OSPIhQKJrqsQrRKpKShtIff2QIqZ/OrEbYxdBtSVCE3oGqGWer4egPKG2XLHIGxHqA=
X-Received: by 2002:a67:1507:: with SMTP id 7mr874378vsv.23.1617186191269;
 Wed, 31 Mar 2021 03:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210330172713.753008-1-yann@blade-group.com> <CADkTA4OzuvmXAHtyBaeqxG0k1wtW7eZJco2Q511Ekbjo_-RtZQ@mail.gmail.com>
 <167132DBE07A7A98.4802@lists.openembedded.org>
In-Reply-To: <167132DBE07A7A98.4802@lists.openembedded.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Wed, 31 Mar 2021 12:22:59 +0200
Message-ID: <CA+4=imZrzFn52=8Pfi3kLJdoKMhipfNyHZg09VdAjv5R9ZnAXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: log some kmeta information to assist in developing a bsp
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 30 mars 2021 =C3=A0 20:41, Yann Dirson via lists.openembedded.org
<yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :
>
> Hi Bruce,
>
> Le mar. 30 mars 2021 =C3=A0 19:47, Bruce Ashfield
> <bruce.ashfield@gmail.com> a =C3=A9crit :
> >
> > On Tue, Mar 30, 2021 at 1:27 PM Yann Dirson <yann.dirson@blade-group.c=
om> wrote:
> > >
> > > From: Yann Dirson <yann@blade-group.com>
> > >
> > > This is not quite enough for the lack of a BSP to stand out clearly =
to
> > > an unsuspecting user's eyes, but at least this line in the logs shou=
ld
> > > help some of us to get a clue:
> > >
> > >   NOTE: Using kmeta BSP ''
> >
> > Sorry, but no on this.
> >
> > There are already logs that are kept in the build directories
> > themselves. They can be further exposed via some of the existing debug
> > knobs that I have, but this is just noise in the general logs.
>
> I must say I did not find any existing logs on this, where can I find th=
em ?

After some digging in the source I finally noticed the merge_config.sh
output being saved
under $meta_dir.  It still took me an additional log to locate the log
under work-shared/.../kernel-source/.
I'm pretty sure I was pointed to this file in the past, but I find it
unnecessarily difficult to locate.

Still, this log does not contain the name of the top-level
$KMACHINE-$KTYPE.scc, which is the
information I'm after.

I do agree however that it make it unnecessary to log the whole $elements =
list,
as long it is easy enough to locate the information.  Here is a
proposal to address this last point, so that
a user looking at the task logs gets the path to it.  Does that one
look OK to you ?

diff --git a/meta/classes/kernel-yocto.bbclass
b/meta/classes/kernel-yocto.bbclass
index 9aa0eb07c6..e3efa34671 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -430,6 +430,8 @@ do_kernel_configme() {
                else
                        bbfatal_log "Details can be found at:
${S}/${meta_dir}/cfg/merge_config_build.log"
                fi
+       else
+               bbnote "Detailed merge_config.sh output can be found
at: ${S}/${meta_dir}/cfg/merge_config_build.log"
        fi

        if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then

>
> >
> > Cheers,
> >
> > Bruce
> >
> > >
> > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > ---
> > >  meta/classes/kernel-yocto.bbclass | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel=
-yocto.bbclass
> > > index 35587dd564..c6228ad0b8 100644
> > > --- a/meta/classes/kernel-yocto.bbclass
> > > +++ b/meta/classes/kernel-yocto.bbclass
> > > @@ -234,6 +234,7 @@ do_kernel_metadata() {
> > >                     KMETA_EXTERNAL_BSPS=3D"t"
> > >                 fi
> > >         fi
> > > +       bbnote "Using kmeta BSP '$bsp_definition'"
> > >         meta_dir=3D$(kgit --meta)
> > >
> > >         KERNEL_FEATURES_FINAL=3D""
> > > @@ -264,6 +265,7 @@ do_kernel_metadata() {
> > >         if [ "$mode" =3D "config" ]; then
> > >                 # run1: pull all the configuration fragments, no mat=
ter where they come from
> > >                 elements=3D"`echo -n ${bsp_definition} $sccs_defconf=
ig ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
> > > +               bbnote "config: kmeta configuration fragments: $elem=
ents"
> > >                 if [ -n "${elements}" ]; then
> > >                         echo "${bsp_definition}" > ${S}/${meta_dir}/=
bsp_definition
> > >                         scc --force -o ${S}/${meta_dir}:cfg,merge,me=
ta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATU=
RES_FINAL
> > > @@ -283,6 +285,7 @@ do_kernel_metadata() {
> > >         if [ "$mode" =3D "patch" ]; then
> > >                 # run2: only generate patches for elements that have=
 been passed on the SRC_URI
> > >                 elements=3D"`echo -n ${sccs} ${patches} $KERNEL_FEAT=
URES_FINAL`"
> > > +               bbnote "patch: kmeta configuration fragments: $eleme=
nts"
> > >                 if [ -n "${elements}" ]; then
> > >                         scc --force -o ${S}/${meta_dir}:patch --cmds=
 patch ${includes} ${sccs} ${patches} $KERNEL_FEATURES_FINAL
> > >                         if [ $? -ne 0 ]; then
> > > --
> > > 2.30.2
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>
>=20
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
