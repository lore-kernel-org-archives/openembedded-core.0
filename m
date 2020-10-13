Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.15495.1602604415679417495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 08:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=noeyKWiO;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id c22so550864ejx.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 08:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qfeCJrD3r0rgfAxSY7CPe3XrW49ejWb1neD7fha0WaE=;
        b=noeyKWiO4ARGwnpQg4rEnHYm2XCAwB8YTRbcgsGgeQTugp+fTtAC4Tpqa3u7ttAlt8
         p6CFYKfIE7PY9Z/ukhov3JRT+GAjEKc1YyfdlLsEcFamCox+K7MiuEl8ocNHTYxnzv1G
         01kKy0c2hCTXa7XYyTEFXCQoYC9ZlvqzxfftVRpEaPChuGPeXWind6ymb/bIhrkurFU3
         /s4bgn4CDqTvmyYFbGyyx5pK07ZhXgYeAkzlX1YwaIVTwiAY9ybXcFcNuX8s8TAfD0TA
         TpYCWxG127ySO7u+syLIG6F5tx4A8w4QAsWRZAxVv1QuDBZ+SSOBEejyqXpZr2Jbkprd
         2Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qfeCJrD3r0rgfAxSY7CPe3XrW49ejWb1neD7fha0WaE=;
        b=E+i7d1u1slWhuHai8iF2Ld5k/gBaDxoMjU4olT+zv4CYuCTnUVV3x1Br9JdTF+5FYa
         w4VDDaYd/jMAbFXDKS5dwmf3UhlLMki13AsxkqJK18qnJvd+eQ1YZOKSOeiToddsnXoS
         lJ5R2Rl/zPO9+olDhma09pEMHLuYJj4zGxpxPvqBgaUuO7PbkNP5WZla8VzDPHcpjKcG
         O0DCyuyLw2tBfVDv8LIRDxKtyrBmAXzVR9/wK1gs0+z9HH9wC6DF511wkPVqHOgPfwwP
         A5BXl2CV8GV2D/BzWGJNzX+mhbzsnRJXp66Jx7mA/RXILcDtOMOeel9epNf5j1xXK3Va
         FDCQ==
X-Gm-Message-State: AOAM532TUnlRlrWd23sqEG2aTT5FVlMoDW48eCsdnOIQ5/1e7qe19aM7
	2ofbxpT7HN7AjkocJ7Bnngp3T/lz2mdrJkuV56g=
X-Google-Smtp-Source: ABdhPJxWn5XvlAvjVrS41TxX7lpe2L57KmlIM3koiQgR5kPLQbI7wVu3aVGXOdqECTkQ2KfvweLCsaL7BnHrua2tRk0=
X-Received: by 2002:a17:906:a859:: with SMTP id dx25mr349749ejb.459.1602604413949;
 Tue, 13 Oct 2020 08:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201013132109.2588755-1-yann@blade-group.com>
 <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com>
 <CA+4=imZ7DY+UgbSieYFC2iMKTOhyExq-VbNd=vbqa0DhuPsFWg@mail.gmail.com>
 <CADkTA4PdEovbL92GwCUv6hnOr3ZtnNA8E35DyVfr09sLNUrpOA@mail.gmail.com>
 <CA+4=imbvST+-gMoKUc9hig+HCiPCRgt7jErGCmpJMrS3+QxLtw@mail.gmail.com>
 <CADkTA4P1NTdtB+uEmXvMr-p_DRM=h1Cb6SYSJhXbwB5s0fN0pQ@mail.gmail.com>
 <CA+4=imZoKoEF6=f0eOANjCF=-g03n3WdH_2J479xfh5ubkAA1A@mail.gmail.com>
 <CADkTA4PwfdFi+8TQQAsoLySO8z9qrra=V0K83duqVXteqjfTWw@mail.gmail.com> <CA+4=imYV3KPHELxb18DTTjH8PffvsTWGebHW-ffE7baf7XPTZw@mail.gmail.com>
In-Reply-To: <CA+4=imYV3KPHELxb18DTTjH8PffvsTWGebHW-ffE7baf7XPTZw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 13 Oct 2020 11:53:22 -0400
Message-ID: <CADkTA4PQgd+NMzUjP-pBSVkfw-ppipE7iXsd8y+rtAcPwgtPUQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 11:47 AM Yann Dirson
<yann.dirson@blade-group.com> wrote:
>
>
>
> Le mar. 13 oct. 2020 =C3=A0 17:33, Bruce Ashfield <bruce.ashfield@gmail.=
com> a =C3=A9crit :
>>
>> On Tue, Oct 13, 2020 at 11:12 AM Yann Dirson
>> <yann.dirson@blade-group.com> wrote:
>> >
>> >
>> >
>> > Le mar. 13 oct. 2020 =C3=A0 17:04, Bruce Ashfield <bruce.ashfield@gma=
il.com> a =C3=A9crit :
>> >>
>> >> On Tue, Oct 13, 2020 at 10:46 AM Yann Dirson
>> >> <yann.dirson@blade-group.com> wrote:
>> >> >
>> >> >
>> >> >
>> >> > Le mar. 13 oct. 2020 =C3=A0 16:10, Bruce Ashfield <bruce.ashfield@=
gmail.com> a =C3=A9crit :
>> >> >>
>> >> >> On Tue, Oct 13, 2020 at 9:57 AM Yann Dirson <yann.dirson@blade-gr=
oup.com> wrote:
>> >> >> >
>> >> >> >
>> >> >> >
>> >> >> > Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield <bruce.ashfie=
ld@gmail.com> a =C3=A9crit :
>> >> >> >>
>> >> >> >> On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson <yann.dirson@blade=
-group.com> wrote:
>> >> >> >> >
>> >> >> >> > From: Yann Dirson <yann@blade-group.com>
>> >> >> >> >
>> >> >> >> > The warning was not issued because of a filename error (look=
ing for a
>> >> >> >> > gatesgath-era file in older tree).
>> >> >> >> >
>> >> >> >> > Before gatesgarth we have two files (one with short list and=
 one with
>> >> >> >> > more details), whereas starting with gatesgarth we only have=
 a single
>> >> >> >> > file with all details.  Nevertheless, for consistency with t=
he
>> >> >> >> > presentation of "invalid.cfg" we'll just print the contents =
of the
>> >> >> >> > short "mismatch.cfg" and point the user to the more detailed
>> >> >> >> > information.
>> >> >> >> >
>> >> >> >> > Signed-off-by: Yann Dirson <yann@blade-group.com>
>> >> >> >> > ---
>> >> >> >> >  meta/classes/kernel-yocto.bbclass | 5 +++--
>> >> >> >> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >> >> >> >
>> >> >> >> > This is not applicable to master, where the "mismatch.txt" f=
ile exists
>> >> >> >> > and shows even greater details.  Looks like the change was i=
ntroduced
>> >> >> >> > for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would=
 that be a
>> >> >> >> > mismatch with yocto-kernel-tools version ?
>> >> >> >> >
>> >> >> >> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classe=
s/kernel-yocto.bbclass
>> >> >> >> > index cc8bcb909a..771b4d8654 100644
>> >> >> >> > --- a/meta/classes/kernel-yocto.bbclass
>> >> >> >> > +++ b/meta/classes/kernel-yocto.bbclass
>> >> >> >> > @@ -431,12 +431,13 @@ python do_kernel_configcheck() {
>> >> >> >> >      bsp_check_visibility =3D int(d.getVar("KCONF_BSP_AUDIT_=
LEVEL") or 0)
>> >> >> >> >
>> >> >> >> >      # if config check visibility is non-zero, report droppe=
d configuration values
>> >> >> >> > -    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.txt" %=
 kmeta)
>> >> >> >> > +    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.cfg" %=
 kmeta)
>> >> >> >>
>> >> >> >> The use of mismatch.txt is completely intentional, and it is p=
opulated
>> >> >> >> by hardware tagged options that are detected as being mistmatc=
hes.
>> >> >> >>
>> >> >> >> So no, we don't want to directly expose mismatch.cfg. it shows
>> >> >> >> unclassified options.
>> >> >> >
>> >> >> >
>> >> >> > OK, so let's get back to the original problem:
>> >> >> >
>> >> >> > - I used to have kernel_configcheck report those problems enume=
rated in mismatch.cfg / mismatch-all.txt,
>> >> >> > but for some time I'm not getting them, and this could be since=
 migration to sumo
>> >> >> >
>> >> >> > - those files are generated, and seem to contain real issues, w=
hereas there is no mismatch.txt
>> >> >> >
>> >> >> > What do you see going wrong and how do we move forward ?
>> >> >>
>> >> >> Is your configuration something that I can set up and reproduce t=
he
>> >> >> problem ? I'm seeing what I expect out of the kconfig processing,=
 but
>> >> >> there very well could be a bug that isn't showing in the machines=
 that
>> >> >> I normally build.
>> >> >
>> >> >
>> >> > The problem can be triggered with the default qemu_x86-64 configur=
ation.
>> >> > I'm just adding this in local.conf to inject a few options:
>> >> >
>> >> > SRC_URI_append_pn-linux-yocto +=3D " file://stuff.cfg"
>> >> >
>> >> > with this line in stuff.cfg:
>> >> >
>> >> > CONFIG_EEEPC_LAPTOP=3Dy
>> >> >
>> >> > On master I see:
>> >> >
>> >> > WARNING: linux-yocto-5.8.9+gitAUTOINC+ffbfe61a19_31fafe701e-r0 do_=
kernel_configcheck: [kernel config]: specified values did not make it into =
the kernel's final configuration:
>> >> >
>> >> >     [NOTE]: 'CONFIG_EEEPC_LAPTOP' last val (y) and .config val (m)=
 do not match
>> >> >     [INFO]: CONFIG_EEEPC_LAPTOP : m ## .config: 4353 :configs/v5.8=
/standard/./hibern.cfg (y)
>> >> >
>> >> > But on dunfell I don't see anything.  CONFIG_EEEPC_LAPTOP is liste=
d in mismatch*, though it is just
>> >> > one of 127 issues, most of which looking pretty much valid at firs=
t glance.  Are they not ?
>> >>
>> >> Only if something is tagged as "hardware" is it reported. The
>> >> classification name is historical, so you can read "hardware" as
>> >> "required / important / needed for boot". The organization of the
>> >> fragments (and a push and pull between stand alone fragments,
>> >> different configurations, software stacks, etc) means that there are
>> >> many fragments that have some options listed, that are disabled due =
to
>> >> competing interests. Those are for the most part valid (to be
>> >> different), and only differing values for the ones tagged as hardwar=
e
>> >> are reported.
>> >>
>> >> So no, we really don't want to report all those options. That's the
>> >> wobbling between reporting and non-reporting that I mentioned before=
.
>> >
>> >
>> > Hm.  In our case, I've tried to write carefully-non-overlapping snipp=
ets,
>> > and I'd like to get a warning on *any* mismatch because they would po=
int
>> > to a bug in my files.  Should I write an additional configcheck stage=
 that
>> > would check for mismatch.cfg by itself ?  If so, what about gatesgart=
h ?
>>
>> That's what the KCONF_BSP_AUDIT_LEVEL variable is for. It is used
>> right now with:
>>
>>     if bsp_check_visibility > 2:
>>         redefinition_file =3D d.expand("${S}/%s/cfg/redefinition.txt" %=
 kmeta)
>>
>> In the kconfig audit reporting phase.  That dumps out a huge amount of
>> info and will show you any duplicated/differing options through the fra=
gment
>> stack. In your own layer you could add the dumping of mismatch.cfg to t=
hat
>> step if you wanted (or invent a new, higher level of logging).
>
>
> Oh I should have read the code more carefully, I would have noticed that=
, even
> as the doc does not mention it (in fact it seems that in dunfell  "2" is=
 not doing anything
> more than "1", right ?):
>
> # LEVELS:
> #   0: no reporting
> #   1: report options that are specified, but not in the final config
> #   2: report options that are not hardware related, but set by a BSP
>

Correct.

That's again the impact of the changing opinion on what should or
shouldn't be reported. I've kept everything around (including that out
of date comment), since I just wait a few months for the next time I
need it :D

Cheers,

Bruce


>>
>> Master already has a better way to deal with this, via the 'config blam=
e'
>> task.
>>
>> Bruce
>>
>> >
>> >>
>> >> In non-master, there's a complex way to tag options as hardware (and
>> >> hopefully an easier way in master), so if there's a mismatch you'll
>> >> see it.
>> >>
>> >> The delta between the two could be that I re-did the default
>> >> classification buckets for the new kernel and that's why it shows in
>> >> one, and not the other.
>> >>
>> >>  I can fire up a build on dunfell and see if I can see where the
>> >> classification differs.
>> >>
>> >> Bruce
>> >>
>> >> >
>> >> >>
>> >> >> The visibility of the warnings has changed over time (I expose th=
em,
>> >> >> there are complaints, I make them less visible, and then the proc=
ess
>> >> >> repeats ..), so there could be something there as well.
>> >> >>
>> >> >> And as you noticed, I totally rewrote things in master, since
>> >> >> maintaining the existing script was just too painful.
>> >> >>
>> >> >> Cheers,
>> >> >>
>> >> >> Bruce
>> >> >>
>> >> >> >
>> >> >> >>
>> >> >> >> Cheers,
>> >> >> >>
>> >> >> >> Bruce
>> >> >> >>
>> >> >> >> >      if os.path.exists(mismatch_file):
>> >> >> >> >          if config_check_visibility:
>> >> >> >> > +            mismatch_details_file =3D d.expand("${S}/%s/cfg=
/mismatch-all.txt" % kmeta)
>> >> >> >> >              with open (mismatch_file, "r") as myfile:
>> >> >> >> >                  results =3D myfile.read()
>> >> >> >> > -                bb.warn( "[kernel config]: specified values=
 did not make it into the kernel's final configuration:\n\n%s" % results)
>> >> >> >> > +                bb.warn( "[kernel config]: specified values=
 did not make it into the kernel's final configuration (see details in %s):=
\n\n%s" % (mismatch_details_file, results))
>> >> >> >> >
>> >> >> >> >      if bsp_check_visibility:
>> >> >> >> >          invalid_file =3D d.expand("${S}/%s/cfg/invalid.cfg"=
 % kmeta)
>> >> >> >> > --
>> >> >> >> > 2.28.0
>> >> >> >> >
>> >> >> >> >
>> >> >> >> >=20
>> >> >> >> >
>> >> >> >>
>> >> >> >>
>> >> >> >> --
>> >> >> >> - Thou shalt not follow the NULL pointer, for chaos and madnes=
s await
>> >> >> >> thee at its end
>> >> >> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >> >> >
>> >> >> >
>> >> >> >
>> >> >> > --
>> >> >> > Yann Dirson <yann@blade-group.com>
>> >> >> > Blade / Shadow -- http://shadow.tech
>> >> >> >
>> >> >>
>> >> >>
>> >> >> --
>> >> >> - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait
>> >> >> thee at its end
>> >> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >> >
>> >> >
>> >> >
>> >> > --
>> >> > Yann Dirson <yann@blade-group.com>
>> >> > Blade / Shadow -- http://shadow.tech
>> >> >
>> >>
>> >>
>> >> --
>> >> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
>> >> thee at its end
>> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> >
>> >
>> > --
>> > Yann Dirson <yann@blade-group.com>
>> > Blade / Shadow -- http://shadow.tech
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
