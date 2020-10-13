Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.14960.1602603199667770248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 08:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MX+i9AIh;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id v19so21366219edx.9
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 08:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tfoLwotSB6Nyy84YDqpEfAT/OfDIFD/nO8raJqrIKzE=;
        b=MX+i9AIh0GYadBvZcI3ehmNQ06losDFIYJi0OukCP2SG6Zg1JBnM5dpJ2LVZqx4vyF
         Y0mZGDBEYF/0ZECgqAuX1A+Sg5bE3eqdOA04i7V9vYO37rT2tfR3poCoG+2qr2phcxT2
         z3wNUqUviiMjjxZLKBErWrqquFii6te+s98EM4vq4XrRqYbYa36f7+8oScdBvPbuObh3
         VywqaqrMR2Oisd3vIc3a722ZklzwOtlxNCcctuWBusuI5grVIvMd6+AASsrw1BCzIHt6
         y9CnwWu9efDBBAolGyW3RIMj2Kj4mOz7SzKhlpZ+oLL1dF7msJIPeA2VgD01dfrz9ZmJ
         fidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tfoLwotSB6Nyy84YDqpEfAT/OfDIFD/nO8raJqrIKzE=;
        b=b8wiMjKfabrVlUNNBrgvTORewLkpPGqis25+rOiQOw78oxaq2vHm/Bmwn9n84xgiVH
         B4MtVhTIrZjQE3GTX1N20iTnHqIbgP9j32xdyCvA582pM6ZSzYSS1xdtRITLyWqiUh6L
         G4ZksHB7j2/YEy37H4xNfKneFkukSiBxmvvdpcu4igNIQfPryMrugsXKsv+hCxZxc0Y5
         r44/Lgf8ERk5y5eaXjXdLPxW6ysrv8eoYiXjrpLcKULV+0cmICLHGcnI05r+SHG8T0+T
         /8K2G6FPESR2VwP+u8AKh2tq2AYstPTLqsFrfRbcGEBmErEmZvLZmgFFW/8vT6y/BLqC
         aB6A==
X-Gm-Message-State: AOAM5327SmAq92EX4Lfdoa/9JmnxUVZulxxZZl3yD+D6BdmJUN2r2E94
	fo45vZkoOn6mJ7WJQuuqoLHL5NxUZQ7vj+M1JDc=
X-Google-Smtp-Source: ABdhPJycP58oDD54k5tGw8ehhk6qpwaEnOYJ2rdxIKRRk012Kph7riVtfrSfDrSmdSjCVR6TtMUmSqslTWeJiO5hrEk=
X-Received: by 2002:a05:6402:b43:: with SMTP id bx3mr42013edb.347.1602603197916;
 Tue, 13 Oct 2020 08:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201013132109.2588755-1-yann@blade-group.com>
 <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com>
 <CA+4=imZ7DY+UgbSieYFC2iMKTOhyExq-VbNd=vbqa0DhuPsFWg@mail.gmail.com>
 <CADkTA4PdEovbL92GwCUv6hnOr3ZtnNA8E35DyVfr09sLNUrpOA@mail.gmail.com>
 <CA+4=imbvST+-gMoKUc9hig+HCiPCRgt7jErGCmpJMrS3+QxLtw@mail.gmail.com>
 <CADkTA4P1NTdtB+uEmXvMr-p_DRM=h1Cb6SYSJhXbwB5s0fN0pQ@mail.gmail.com> <CA+4=imZoKoEF6=f0eOANjCF=-g03n3WdH_2J479xfh5ubkAA1A@mail.gmail.com>
In-Reply-To: <CA+4=imZoKoEF6=f0eOANjCF=-g03n3WdH_2J479xfh5ubkAA1A@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 13 Oct 2020 11:33:06 -0400
Message-ID: <CADkTA4PwfdFi+8TQQAsoLySO8z9qrra=V0K83duqVXteqjfTWw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 11:12 AM Yann Dirson
<yann.dirson@blade-group.com> wrote:
>
>
>
> Le mar. 13 oct. 2020 =C3=A0 17:04, Bruce Ashfield <bruce.ashfield@gmail.=
com> a =C3=A9crit :
>>
>> On Tue, Oct 13, 2020 at 10:46 AM Yann Dirson
>> <yann.dirson@blade-group.com> wrote:
>> >
>> >
>> >
>> > Le mar. 13 oct. 2020 =C3=A0 16:10, Bruce Ashfield <bruce.ashfield@gma=
il.com> a =C3=A9crit :
>> >>
>> >> On Tue, Oct 13, 2020 at 9:57 AM Yann Dirson <yann.dirson@blade-group=
.com> wrote:
>> >> >
>> >> >
>> >> >
>> >> > Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield <bruce.ashfield@=
gmail.com> a =C3=A9crit :
>> >> >>
>> >> >> On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson <yann.dirson@blade-gr=
oup.com> wrote:
>> >> >> >
>> >> >> > From: Yann Dirson <yann@blade-group.com>
>> >> >> >
>> >> >> > The warning was not issued because of a filename error (looking=
 for a
>> >> >> > gatesgath-era file in older tree).
>> >> >> >
>> >> >> > Before gatesgarth we have two files (one with short list and on=
e with
>> >> >> > more details), whereas starting with gatesgarth we only have a =
single
>> >> >> > file with all details.  Nevertheless, for consistency with the
>> >> >> > presentation of "invalid.cfg" we'll just print the contents of =
the
>> >> >> > short "mismatch.cfg" and point the user to the more detailed
>> >> >> > information.
>> >> >> >
>> >> >> > Signed-off-by: Yann Dirson <yann@blade-group.com>
>> >> >> > ---
>> >> >> >  meta/classes/kernel-yocto.bbclass | 5 +++--
>> >> >> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >> >> >
>> >> >> > This is not applicable to master, where the "mismatch.txt" file=
 exists
>> >> >> > and shows even greater details.  Looks like the change was intr=
oduced
>> >> >> > for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would th=
at be a
>> >> >> > mismatch with yocto-kernel-tools version ?
>> >> >> >
>> >> >> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/k=
ernel-yocto.bbclass
>> >> >> > index cc8bcb909a..771b4d8654 100644
>> >> >> > --- a/meta/classes/kernel-yocto.bbclass
>> >> >> > +++ b/meta/classes/kernel-yocto.bbclass
>> >> >> > @@ -431,12 +431,13 @@ python do_kernel_configcheck() {
>> >> >> >      bsp_check_visibility =3D int(d.getVar("KCONF_BSP_AUDIT_LEV=
EL") or 0)
>> >> >> >
>> >> >> >      # if config check visibility is non-zero, report dropped c=
onfiguration values
>> >> >> > -    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.txt" % km=
eta)
>> >> >> > +    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.cfg" % km=
eta)
>> >> >>
>> >> >> The use of mismatch.txt is completely intentional, and it is popu=
lated
>> >> >> by hardware tagged options that are detected as being mistmatches=
.
>> >> >>
>> >> >> So no, we don't want to directly expose mismatch.cfg. it shows
>> >> >> unclassified options.
>> >> >
>> >> >
>> >> > OK, so let's get back to the original problem:
>> >> >
>> >> > - I used to have kernel_configcheck report those problems enumerat=
ed in mismatch.cfg / mismatch-all.txt,
>> >> > but for some time I'm not getting them, and this could be since mi=
gration to sumo
>> >> >
>> >> > - those files are generated, and seem to contain real issues, wher=
eas there is no mismatch.txt
>> >> >
>> >> > What do you see going wrong and how do we move forward ?
>> >>
>> >> Is your configuration something that I can set up and reproduce the
>> >> problem ? I'm seeing what I expect out of the kconfig processing, bu=
t
>> >> there very well could be a bug that isn't showing in the machines th=
at
>> >> I normally build.
>> >
>> >
>> > The problem can be triggered with the default qemu_x86-64 configurati=
on.
>> > I'm just adding this in local.conf to inject a few options:
>> >
>> > SRC_URI_append_pn-linux-yocto +=3D " file://stuff.cfg"
>> >
>> > with this line in stuff.cfg:
>> >
>> > CONFIG_EEEPC_LAPTOP=3Dy
>> >
>> > On master I see:
>> >
>> > WARNING: linux-yocto-5.8.9+gitAUTOINC+ffbfe61a19_31fafe701e-r0 do_ker=
nel_configcheck: [kernel config]: specified values did not make it into the=
 kernel's final configuration:
>> >
>> >     [NOTE]: 'CONFIG_EEEPC_LAPTOP' last val (y) and .config val (m) do=
 not match
>> >     [INFO]: CONFIG_EEEPC_LAPTOP : m ## .config: 4353 :configs/v5.8/st=
andard/./hibern.cfg (y)
>> >
>> > But on dunfell I don't see anything.  CONFIG_EEEPC_LAPTOP is listed i=
n mismatch*, though it is just
>> > one of 127 issues, most of which looking pretty much valid at first g=
lance.  Are they not ?
>>
>> Only if something is tagged as "hardware" is it reported. The
>> classification name is historical, so you can read "hardware" as
>> "required / important / needed for boot". The organization of the
>> fragments (and a push and pull between stand alone fragments,
>> different configurations, software stacks, etc) means that there are
>> many fragments that have some options listed, that are disabled due to
>> competing interests. Those are for the most part valid (to be
>> different), and only differing values for the ones tagged as hardware
>> are reported.
>>
>> So no, we really don't want to report all those options. That's the
>> wobbling between reporting and non-reporting that I mentioned before.
>
>
> Hm.  In our case, I've tried to write carefully-non-overlapping snippets=
,
> and I'd like to get a warning on *any* mismatch because they would point
> to a bug in my files.  Should I write an additional configcheck stage th=
at
> would check for mismatch.cfg by itself ?  If so, what about gatesgarth ?

That's what the KCONF_BSP_AUDIT_LEVEL variable is for. It is used
right now with:

    if bsp_check_visibility > 2:
        redefinition_file =3D d.expand("${S}/%s/cfg/redefinition.txt" % km=
eta)

In the kconfig audit reporting phase.  That dumps out a huge amount of
info and will show you any duplicated/differing options through the fragme=
nt
stack. In your own layer you could add the dumping of mismatch.cfg to that
step if you wanted (or invent a new, higher level of logging).

Master already has a better way to deal with this, via the 'config blame'
task.

Bruce

>
>>
>> In non-master, there's a complex way to tag options as hardware (and
>> hopefully an easier way in master), so if there's a mismatch you'll
>> see it.
>>
>> The delta between the two could be that I re-did the default
>> classification buckets for the new kernel and that's why it shows in
>> one, and not the other.
>>
>>  I can fire up a build on dunfell and see if I can see where the
>> classification differs.
>>
>> Bruce
>>
>> >
>> >>
>> >> The visibility of the warnings has changed over time (I expose them,
>> >> there are complaints, I make them less visible, and then the process
>> >> repeats ..), so there could be something there as well.
>> >>
>> >> And as you noticed, I totally rewrote things in master, since
>> >> maintaining the existing script was just too painful.
>> >>
>> >> Cheers,
>> >>
>> >> Bruce
>> >>
>> >> >
>> >> >>
>> >> >> Cheers,
>> >> >>
>> >> >> Bruce
>> >> >>
>> >> >> >      if os.path.exists(mismatch_file):
>> >> >> >          if config_check_visibility:
>> >> >> > +            mismatch_details_file =3D d.expand("${S}/%s/cfg/mi=
smatch-all.txt" % kmeta)
>> >> >> >              with open (mismatch_file, "r") as myfile:
>> >> >> >                  results =3D myfile.read()
>> >> >> > -                bb.warn( "[kernel config]: specified values di=
d not make it into the kernel's final configuration:\n\n%s" % results)
>> >> >> > +                bb.warn( "[kernel config]: specified values di=
d not make it into the kernel's final configuration (see details in %s):\n\=
n%s" % (mismatch_details_file, results))
>> >> >> >
>> >> >> >      if bsp_check_visibility:
>> >> >> >          invalid_file =3D d.expand("${S}/%s/cfg/invalid.cfg" % =
kmeta)
>> >> >> > --
>> >> >> > 2.28.0
>> >> >> >
>> >> >> >
>> >> >> >=20
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
