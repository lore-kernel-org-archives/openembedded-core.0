Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web11.7640.1617201882638163832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 07:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=IWgJY3jw;
 spf=pass (domain: blade-group.com, ip: 209.85.222.48, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ua1-f48.google.com with SMTP id h34so6208963uah.5
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 07:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DHR5/orjLg9RmVAmeJ65rlTEiXDSxAEbl24VgKqtDKM=;
        b=IWgJY3jw28aAzsBOYN3SvGd0yMPGg2Bs2+dY9cULBAz1Seuoo1HitCikEfZyqyiOt7
         RadMyltECHybvIIvfoe0mSuePBTMy9cUzlD9q5nHij4ZqYNYVYVbUhEGKUbHqjZOE5j3
         WAMLaZDQM7juU5al+Wm9JIxlRdZjX3ETUwwAjpjPyKc0GWdIJUAeSOFa/Tb8q5GEeZD7
         01GlDVYkOU8VCCi88VFZddK9TEpkutTA5I+iDw+E2CuUnJnYvrBGl82VQdWEXsp6Al1i
         ETRG7oLXXHHshb7f6TTpOGQBo3PXQMa95nlK5pxKz47tMSLoeLvyOnFXygZlTqfAG8f3
         wK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DHR5/orjLg9RmVAmeJ65rlTEiXDSxAEbl24VgKqtDKM=;
        b=Z1RoVFQoScLuvZzJY0oGL1naQ7CsBZtvfB6IuXx9FDwaXtgGtNDo+P0J4dRDxjX0iX
         iEg8+E6lijTVv2Esc68UaYt7CFDWKTXdrXQ+Tt644wLgISZjJQd0Pv0eLMR9ChkxhYNB
         WdHu938uWDVGQKxd938i63QqBt32VE+p6kWSIsc3eQyd4Nj46ozKwBPk8SNatLwb/U13
         PEh+JQt9TAnevjAPO97Ufl9IproGvEPc4djb2DvThHSFADM63tkTejTzj6ZJ/lyiCDSO
         de0DP5LM7LpS4vyYZGJvobKJLdOQTmtg+Jz9AbLRKe9ZyB171KuaiJuZCtgEahN7XbDC
         P5Ig==
X-Gm-Message-State: AOAM5322qhLhdWtDr5SsUBcdp470NJpWdKI5DcTEnBkoIztFQxYKKdHk
	u+eRo8Sbs6qqzyN3Xxxb0sBsOFYGDRLphHx9DEgkCA==
X-Google-Smtp-Source: ABdhPJzQARObZfS7Mcy+MQ/20MXq1uuzNNIcHp/aW6fjLUzH3zq25/fxuyEuQyA2T/4M2e7A+mfYXeMgB7LrJGtYikI=
X-Received: by 2002:a9f:21c7:: with SMTP id 65mr1614559uac.141.1617201881639;
 Wed, 31 Mar 2021 07:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210330172713.753008-1-yann@blade-group.com> <CADkTA4OzuvmXAHtyBaeqxG0k1wtW7eZJco2Q511Ekbjo_-RtZQ@mail.gmail.com>
 <167132DBE07A7A98.4802@lists.openembedded.org> <CA+4=imZrzFn52=8Pfi3kLJdoKMhipfNyHZg09VdAjv5R9ZnAXQ@mail.gmail.com>
 <CADkTA4O0jSAjwBsq8_nr9WLP_N85GZ3Xyd9JSgAiC8ja9xaicA@mail.gmail.com>
In-Reply-To: <CADkTA4O0jSAjwBsq8_nr9WLP_N85GZ3Xyd9JSgAiC8ja9xaicA@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Wed, 31 Mar 2021 16:44:30 +0200
Message-ID: <CA+4=imb3m9e8JDJS6r8OxC-9Q1K3kEpKCSjBA2Xt2v=ESWPLbw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto: log some kmeta information to assist in developing a bsp
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 31 mars 2021 =C3=A0 14:41, Bruce Ashfield
<bruce.ashfield@gmail.com> a =C3=A9crit :
>
> On Wed, Mar 31, 2021 at 6:23 AM Yann Dirson <yann.dirson@blade-group.com=
> wrote:
> >
> > Le mar. 30 mars 2021 =C3=A0 20:41, Yann Dirson via lists.openembedded.=
org
> > <yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :
> > >
> > > Hi Bruce,
> > >
> > > Le mar. 30 mars 2021 =C3=A0 19:47, Bruce Ashfield
> > > <bruce.ashfield@gmail.com> a =C3=A9crit :
> > > >
> > > > On Tue, Mar 30, 2021 at 1:27 PM Yann Dirson <yann.dirson@blade-gro=
up.com> wrote:
> > > > >
> > > > > From: Yann Dirson <yann@blade-group.com>
> > > > >
> > > > > This is not quite enough for the lack of a BSP to stand out clea=
rly to
> > > > > an unsuspecting user's eyes, but at least this line in the logs =
should
> > > > > help some of us to get a clue:
> > > > >
> > > > >   NOTE: Using kmeta BSP ''
> > > >
> > > > Sorry, but no on this.
> > > >
> > > > There are already logs that are kept in the build directories
> > > > themselves. They can be further exposed via some of the existing d=
ebug
> > > > knobs that I have, but this is just noise in the general logs.
> > >
> > > I must say I did not find any existing logs on this, where can I fin=
d them ?
> >
> > After some digging in the source I finally noticed the merge_config.sh
> > output being saved
> > under $meta_dir.  It still took me an additional log to locate the log
> > under work-shared/.../kernel-source/.
> > I'm pretty sure I was pointed to this file in the past, but I find it
> > unnecessarily difficult to locate.
>
> As opposed to any of the other random log files that contain somewhat
> internal information ? This isn't something that the majority of people
> need to see, so it stays local to what the recipes are building (the
> kernel). The use facing distillation of that information is the kernel
> configuration audit.
>
> In the past 10 years or so, I've bounced back and forth between
> exposing more information, getting complaints/comments about
> the amount of noise and fine tuning the signal to noise in the
> information. That's what is being balanced here.
>
> >
> > Still, this log does not contain the name of the top-level
> > $KMACHINE-$KTYPE.scc, which is the
> > information I'm after.
>
> That's logged in a file in the .kernel-meta directory.
> (${S}/${meta_dir}/bsp_definition)
>
> >
> > I do agree however that it make it unnecessary to log the whole $eleme=
nts list,
> > as long it is easy enough to locate the information.  Here is a
> > proposal to address this last point, so that
> > a user looking at the task logs gets the path to it.  Does that one
> > look OK to you ?
> >
>
> There's already a kernel config audit task, and that's where any enhance=
d
> information really needs to go.
>
> There's no need to rush through anything on this, since we are right on =
top
> of a release, and although minor, I wouldn't push for it to go in at thi=
s point.
>
> But I do agree, we can tweak things to expose a bit more information tha=
t
> aids in development of new BSPs/fragments than is currently available.

I understand that the details about the BSP contents don't get exposed to =
the
user by default.  However, it would look sane to me that the selected BSP =
would
be more visible: it is really important for people trying to use
different kernel
configurations on a given board, as the BSP selected when there is no
exact match
seems to require today to dive into the recipe-specific logs.

But in fact, when I select, say PREFERRED_PROVIDER_virtual/kernel =3D
"linux-yocto-rt"
for this nanopi-m4 for which I only added "standard" and "tiny":
kernel-source/.kernel-meta/bsp_definition then contains just an empty
line, ie. the
bbnote "Using kmeta BSP '$bsp_definition'" in my original patch seems
to give exactly
the same amount of information.

Isn't the actually-selected BSP available somewhere in this case ?  This e=
nds up
with scsi configuration fragments being selected, but I have no clue
where they're
coming from:

$ cat /tmp/work-shared/nanopi-m4-2gb/kernel-source/.kernel-meta/config.que=
ue
configs///defconfig # non-hardware
configs//features/netfilter/netfilter.cfg # non-hardware
configs//features/taskstats/taskstats.cfg # non-hardware
configs//features/scsi/scsi.cfg # hardware
configs//features/scsi/scsi-debug.cfg # hardware
configs//features/gpio/mockup.cfg # non-hardware


>
> I can float some RFC patches in a few weeks and see if they meet the nee=
d.
>
> Bruce
>
> > diff --git a/meta/classes/kernel-yocto.bbclass
> > b/meta/classes/kernel-yocto.bbclass
> > index 9aa0eb07c6..e3efa34671 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -430,6 +430,8 @@ do_kernel_configme() {
> >                 else
> >                         bbfatal_log "Details can be found at:
> > ${S}/${meta_dir}/cfg/merge_config_build.log"
> >                 fi
> > +       else
> > +               bbnote "Detailed merge_config.sh output can be found
> > at: ${S}/${meta_dir}/cfg/merge_config_build.log"
> >         fi
> >
> >         if [ ! -z "${LINUX_VERSION_EXTENSION}" ]; then
> >
> > >
> > > >
> > > > Cheers,
> > > >
> > > > Bruce
> > > >
> > > > >
> > > > > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > > > > ---
> > > > >  meta/classes/kernel-yocto.bbclass | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/ke=
rnel-yocto.bbclass
> > > > > index 35587dd564..c6228ad0b8 100644
> > > > > --- a/meta/classes/kernel-yocto.bbclass
> > > > > +++ b/meta/classes/kernel-yocto.bbclass
> > > > > @@ -234,6 +234,7 @@ do_kernel_metadata() {
> > > > >                     KMETA_EXTERNAL_BSPS=3D"t"
> > > > >                 fi
> > > > >         fi
> > > > > +       bbnote "Using kmeta BSP '$bsp_definition'"
> > > > >         meta_dir=3D$(kgit --meta)
> > > > >
> > > > >         KERNEL_FEATURES_FINAL=3D""
> > > > > @@ -264,6 +265,7 @@ do_kernel_metadata() {
> > > > >         if [ "$mode" =3D "config" ]; then
> > > > >                 # run1: pull all the configuration fragments, no=
 matter where they come from
> > > > >                 elements=3D"`echo -n ${bsp_definition} $sccs_def=
config ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
> > > > > +               bbnote "config: kmeta configuration fragments: $=
elements"
> > > > >                 if [ -n "${elements}" ]; then
> > > > >                         echo "${bsp_definition}" > ${S}/${meta_d=
ir}/bsp_definition
> > > > >                         scc --force -o ${S}/${meta_dir}:cfg,merg=
e,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_F=
EATURES_FINAL
> > > > > @@ -283,6 +285,7 @@ do_kernel_metadata() {
> > > > >         if [ "$mode" =3D "patch" ]; then
> > > > >                 # run2: only generate patches for elements that =
have been passed on the SRC_URI
> > > > >                 elements=3D"`echo -n ${sccs} ${patches} $KERNEL_=
FEATURES_FINAL`"
> > > > > +               bbnote "patch: kmeta configuration fragments: $e=
lements"
> > > > >                 if [ -n "${elements}" ]; then
> > > > >                         scc --force -o ${S}/${meta_dir}:patch --=
cmds patch ${includes} ${sccs} ${patches} $KERNEL_FEATURES_FINAL
> > > > >                         if [ $? -ne 0 ]; then
> > > > > --
> > > > > 2.30.2
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> > > --
> > > Yann Dirson <yann@blade-group.com>
> > > Blade / Shadow -- http://shadow.tech
> > >
> > >=20
> > >
> >
> >
> > --
> > Yann Dirson <yann@blade-group.com>
> > Blade / Shadow -- http://shadow.tech
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
