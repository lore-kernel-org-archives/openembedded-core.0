Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.2125.1602613680338313832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 11:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IXQgWj2R;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id t20so457602edr.11
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mml4m2QWXZtgucWNyIIQeGm4xYrBpHONh5UFi9N3Vho=;
        b=IXQgWj2RDGRlYxkRm0jEK7minCpYFWfqawsxIrHxqeT6APQrPZpGikeEWHYCuW0iwA
         ztGxRbq6+bIGBd4dDFyraTs3nHo2ryz6XcsABcIXWO/s+s0I1KR9o5cvhBe6TObKuIqM
         gYbD74UHMeDzNg6G/zFuVJ3myrrjtpE1DUIdfTeSGOOdJ7vBtwvtknToTeSxO3ONouJc
         9twYujMb9BXYx3SSCiMMbf8bWdx++Oby3d9GOF2mrpj2wlIrn5mtWlqPBj/SAnCTjCI1
         OYLNGyYCucV+J2Zc8gdghXAcYJh00E/+iel3RM8gvKVDlY5bHqphokQdJcOm0OU2h1Xh
         9CdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mml4m2QWXZtgucWNyIIQeGm4xYrBpHONh5UFi9N3Vho=;
        b=XHPYLngB7vEz9NaILwkMKwrdUw4UV487GU66KL1e74U20a77CbF1DXyZtW5mpDDPu9
         8mQqDLsLnLrTIiDRuTTx+SeLymFHYL4fsNc1P8P8BgKYdmhRmbAYV04arpfn7LykZVzd
         iEdPvKomC+f2wCgKcNriBBTWRpT03pfU68KpVwC+4ImLNheu5KFM2zHxPD8mxSic9gRh
         Aiofe5853YjdZCVl0p/tE6g7E1OeSF0vFWtRtJR+2dsKbC/19M/zkeObVcddCnaFhd7K
         RXuAVfAH4vKUwekYWoJaRZ/NDthB8m2xNGIEr/AhI2p0n2bsZ4m/HiwCJAIo6KjQIXwS
         4hyg==
X-Gm-Message-State: AOAM530HzyvvfG6WQwSBU8NnCs+rB0Vs/tyFMctAxDr6VdkFsw6qltXg
	69s+C7SdETtiQN2T/ltIrG6hGPw0QDcxPiD+8JQ=
X-Google-Smtp-Source: ABdhPJxVMan6YY8PBTLj/vUf0aQ+GCUIpukKR94MDJFY+UOmbdaWys0ZfAc43A2psiTePdLiZJjMaX5mFlDsfhlxols=
X-Received: by 2002:a05:6402:195:: with SMTP id r21mr923588edv.164.1602613678575;
 Tue, 13 Oct 2020 11:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201013132109.2588755-1-yann@blade-group.com>
 <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com>
 <CA+4=imZ7DY+UgbSieYFC2iMKTOhyExq-VbNd=vbqa0DhuPsFWg@mail.gmail.com>
 <CADkTA4PdEovbL92GwCUv6hnOr3ZtnNA8E35DyVfr09sLNUrpOA@mail.gmail.com>
 <CA+4=imbvST+-gMoKUc9hig+HCiPCRgt7jErGCmpJMrS3+QxLtw@mail.gmail.com>
 <CADkTA4P1NTdtB+uEmXvMr-p_DRM=h1Cb6SYSJhXbwB5s0fN0pQ@mail.gmail.com>
 <163D95FBF3243152.10178@lists.openembedded.org> <CA+4=imYuwUYOqNYMy=YH=JXqtC_RRn8LTNKqeYhp6YNmBQsyRA@mail.gmail.com>
In-Reply-To: <CA+4=imYuwUYOqNYMy=YH=JXqtC_RRn8LTNKqeYhp6YNmBQsyRA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 13 Oct 2020 14:27:46 -0400
Message-ID: <CADkTA4PttaDvee2KQ8Tij4A9msc2TDJRLOvsDCrDZE=HG==trA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 12:14 PM Yann Dirson
<yann.dirson@blade-group.com> wrote:

>
>
>
> Le mar. 13 oct. 2020 =C3=A0 17:12, Yann Dirson via lists.openembedded.or=
g <yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :
>>
>>
>>
>> Le mar. 13 oct. 2020 =C3=A0 17:04, Bruce Ashfield <bruce.ashfield@gmail=
.com> a =C3=A9crit :
>>>
>>> On Tue, Oct 13, 2020 at 10:46 AM Yann Dirson
>>> <yann.dirson@blade-group.com> wrote:
>>> >
>>> >
>>> >
>>> > Le mar. 13 oct. 2020 =C3=A0 16:10, Bruce Ashfield <bruce.ashfield@gm=
ail.com> a =C3=A9crit :
>>> >>
>>> >> On Tue, Oct 13, 2020 at 9:57 AM Yann Dirson <yann.dirson@blade-grou=
p.com> wrote:
>>> >> >
>>> >> >
>>> >> >
>>> >> > Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield <bruce.ashfield=
@gmail.com> a =C3=A9crit :
>>> >> >>
>>> >> >> On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson <yann.dirson@blade-g=
roup.com> wrote:
>>> >> >> >
>>> >> >> > From: Yann Dirson <yann@blade-group.com>
>>> >> >> >
>>> >> >> > The warning was not issued because of a filename error (lookin=
g for a
>>> >> >> > gatesgath-era file in older tree).
>>> >> >> >
>>> >> >> > Before gatesgarth we have two files (one with short list and o=
ne with
>>> >> >> > more details), whereas starting with gatesgarth we only have a=
 single
>>> >> >> > file with all details.  Nevertheless, for consistency with the
>>> >> >> > presentation of "invalid.cfg" we'll just print the contents of=
 the
>>> >> >> > short "mismatch.cfg" and point the user to the more detailed
>>> >> >> > information.
>>> >> >> >
>>> >> >> > Signed-off-by: Yann Dirson <yann@blade-group.com>
>>> >> >> > ---
>>> >> >> >  meta/classes/kernel-yocto.bbclass | 5 +++--
>>> >> >> >  1 file changed, 3 insertions(+), 2 deletions(-)
>>> >> >> >
>>> >> >> > This is not applicable to master, where the "mismatch.txt" fil=
e exists
>>> >> >> > and shows even greater details.  Looks like the change was int=
roduced
>>> >> >> > for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would t=
hat be a
>>> >> >> > mismatch with yocto-kernel-tools version ?
>>> >> >> >
>>> >> >> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/=
kernel-yocto.bbclass
>>> >> >> > index cc8bcb909a..771b4d8654 100644
>>> >> >> > --- a/meta/classes/kernel-yocto.bbclass
>>> >> >> > +++ b/meta/classes/kernel-yocto.bbclass
>>> >> >> > @@ -431,12 +431,13 @@ python do_kernel_configcheck() {
>>> >> >> >      bsp_check_visibility =3D int(d.getVar("KCONF_BSP_AUDIT_LE=
VEL") or 0)
>>> >> >> >
>>> >> >> >      # if config check visibility is non-zero, report dropped =
configuration values
>>> >> >> > -    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.txt" % k=
meta)
>>> >> >> > +    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.cfg" % k=
meta)
>>> >> >>
>>> >> >> The use of mismatch.txt is completely intentional, and it is pop=
ulated
>>> >> >> by hardware tagged options that are detected as being mistmatche=
s.
>>> >> >>
>>> >> >> So no, we don't want to directly expose mismatch.cfg. it shows
>>> >> >> unclassified options.
>>> >> >
>>> >> >
>>> >> > OK, so let's get back to the original problem:
>>> >> >
>>> >> > - I used to have kernel_configcheck report those problems enumera=
ted in mismatch.cfg / mismatch-all.txt,
>>> >> > but for some time I'm not getting them, and this could be since m=
igration to sumo
>>> >> >
>>> >> > - those files are generated, and seem to contain real issues, whe=
reas there is no mismatch.txt
>>> >> >
>>> >> > What do you see going wrong and how do we move forward ?
>>> >>
>>> >> Is your configuration something that I can set up and reproduce the
>>> >> problem ? I'm seeing what I expect out of the kconfig processing, b=
ut
>>> >> there very well could be a bug that isn't showing in the machines t=
hat
>>> >> I normally build.
>>> >
>>> >
>>> > The problem can be triggered with the default qemu_x86-64 configurat=
ion.
>>> > I'm just adding this in local.conf to inject a few options:
>>> >
>>> > SRC_URI_append_pn-linux-yocto +=3D " file://stuff.cfg"
>>> >
>>> > with this line in stuff.cfg:
>>> >
>>> > CONFIG_EEEPC_LAPTOP=3Dy
>>> >
>>> > On master I see:
>>> >
>>> > WARNING: linux-yocto-5.8.9+gitAUTOINC+ffbfe61a19_31fafe701e-r0 do_ke=
rnel_configcheck: [kernel config]: specified values did not make it into th=
e kernel's final configuration:
>>> >
>>> >     [NOTE]: 'CONFIG_EEEPC_LAPTOP' last val (y) and .config val (m) d=
o not match
>>> >     [INFO]: CONFIG_EEEPC_LAPTOP : m ## .config: 4353 :configs/v5.8/s=
tandard/./hibern.cfg (y)
>>> >
>>> > But on dunfell I don't see anything.  CONFIG_EEEPC_LAPTOP is listed =
in mismatch*, though it is just
>>> > one of 127 issues, most of which looking pretty much valid at first =
glance.  Are they not ?
>>>
>>> Only if something is tagged as "hardware" is it reported. The
>>> classification name is historical, so you can read "hardware" as
>>> "required / important / needed for boot". The organization of the
>>> fragments (and a push and pull between stand alone fragments,
>>> different configurations, software stacks, etc) means that there are
>>> many fragments that have some options listed, that are disabled due to
>>> competing interests. Those are for the most part valid (to be
>>> different), and only differing values for the ones tagged as hardware
>>> are reported.
>>>
>>> So no, we really don't want to report all those options. That's the
>>> wobbling between reporting and non-reporting that I mentioned before.
>>
>>
>> Hm.  In our case, I've tried to write carefully-non-overlapping snippet=
s,
>> and I'd like to get a warning on *any* mismatch because they would poin=
t
>> to a bug in my files.  Should I write an additional configcheck stage t=
hat
>> would check for mismatch.cfg by itself ?  If so, what about gatesgarth =
?
>
>
> Double-checking the state of things against what I wanted to achieve rev=
eals that
> it's not that easy in the end, esp. for our old arch based on x86-64, fo=
r which I felt it
> was not a good idea to write a defconfig and update it for every kernel =
release.
>
> For that particular (and probably common) case, it does make sense for .=
cfg
> snippets to override stuff set by defconfig, and we would want to hide t=
hose,
> while still exposing all others.  It seems to be a bit much to ask from =
the
> dunfell configcheck, is it something that would be easily achievable in =
gatesgarth ?
>

It is a common scenario. You have a baseline config (whether it be a defco=
nfig,
or another "base.cfg" fragment) and then features / optional fragments
are applied
and then BSP options (or whatever order you want). The fragments very ofte=
n do
override / change the values, or you'd be spending a lot of time locking i=
n a
lowest common denominator base configuration (which is doable, but it tend=
s to
be fairly small).

It would be easier to add that level of granularity into the check in
master (I used
the reverse of it to mask some warnings that were spurious), I'm not
sure it would
work out of the box, but with relatively little tweaking, it would be doab=
le.

Bruce


>
>>
>>>
>>> In non-master, there's a complex way to tag options as hardware (and
>>> hopefully an easier way in master), so if there's a mismatch you'll
>>> see it.
>>>
>>> The delta between the two could be that I re-did the default
>>> classification buckets for the new kernel and that's why it shows in
>>> one, and not the other.
>>>
>>>  I can fire up a build on dunfell and see if I can see where the
>>> classification differs.
>>>
>>> Bruce
>>>
>>> >
>>> >>
>>> >> The visibility of the warnings has changed over time (I expose them=
,
>>> >> there are complaints, I make them less visible, and then the proces=
s
>>> >> repeats ..), so there could be something there as well.
>>> >>
>>> >> And as you noticed, I totally rewrote things in master, since
>>> >> maintaining the existing script was just too painful.
>>> >>
>>> >> Cheers,
>>> >>
>>> >> Bruce
>>> >>
>>> >> >
>>> >> >>
>>> >> >> Cheers,
>>> >> >>
>>> >> >> Bruce
>>> >> >>
>>> >> >> >      if os.path.exists(mismatch_file):
>>> >> >> >          if config_check_visibility:
>>> >> >> > +            mismatch_details_file =3D d.expand("${S}/%s/cfg/m=
ismatch-all.txt" % kmeta)
>>> >> >> >              with open (mismatch_file, "r") as myfile:
>>> >> >> >                  results =3D myfile.read()
>>> >> >> > -                bb.warn( "[kernel config]: specified values d=
id not make it into the kernel's final configuration:\n\n%s" % results)
>>> >> >> > +                bb.warn( "[kernel config]: specified values d=
id not make it into the kernel's final configuration (see details in %s):\n=
\n%s" % (mismatch_details_file, results))
>>> >> >> >
>>> >> >> >      if bsp_check_visibility:
>>> >> >> >          invalid_file =3D d.expand("${S}/%s/cfg/invalid.cfg" %=
 kmeta)
>>> >> >> > --
>>> >> >> > 2.28.0
>>> >> >> >
>>> >> >> >
>>> >> >> >
>>> >> >> >
>>> >> >>
>>> >> >>
>>> >> >> --
>>> >> >> - Thou shalt not follow the NULL pointer, for chaos and madness =
await
>>> >> >> thee at its end
>>> >> >> - "Use the force Harry" - Gandalf, Star Trek II
>>> >> >
>>> >> >
>>> >> >
>>> >> > --
>>> >> > Yann Dirson <yann@blade-group.com>
>>> >> > Blade / Shadow -- http://shadow.tech
>>> >> >
>>> >>
>>> >>
>>> >> --
>>> >> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>>> >> thee at its end
>>> >> - "Use the force Harry" - Gandalf, Star Trek II
>>> >
>>> >
>>> >
>>> > --
>>> > Yann Dirson <yann@blade-group.com>
>>> > Blade / Shadow -- http://shadow.tech
>>> >
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>> --
>> Yann Dirson <yann@blade-group.com>
>> Blade / Shadow -- http://shadow.tech
>>
>>
>>=20
>>
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
