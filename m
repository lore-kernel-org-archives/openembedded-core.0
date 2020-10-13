Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.14123.1602601496877590530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 08:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Iyk9TjIK;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id qp15so284572ejb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fts3aLm+ycFMalz36qDkvKSS5uzEGIkwBzhOGReP5jg=;
        b=Iyk9TjIKQAzputAGezJjpCdsQe8BURl7vn0+1JwV/WTSVXG0Sg5OsC8ofeX600kyBT
         5Fs8R+6+0JXN9UOOmcwmFXJEU+pdFfAtv0txTKooax3tEr9XRQCd44Phh8TcTTn+M/EP
         7bZE20z9vJ9DwbYl7J794fa1845XTDT59THLuootOUwycaGDjCFIjKjF3jPV8APN6DyI
         kbEoKJJm6rMXGkzFJPtyE2N1JnxfoaaMWS6yTQ05US6AWz3OFp6Us79jIMPujMT84zxj
         +lfFRoo0QFCgFOk54xAJBYrGsbeEwzS5d5Vqo9fclcdqE/IQEsohCaYK0JYdmiZ7uhlU
         JPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fts3aLm+ycFMalz36qDkvKSS5uzEGIkwBzhOGReP5jg=;
        b=hLfl9KhBUGc6NqnpNxatX7scui7sGIAXj2fKPn0Z7iKuB0bOZJ0VAThD/673PldAeL
         SedQGdjRxU0u/sJK8RKiyTc75LKn5nLZQsuIfbdnL217sXW5sMp85zq4JVbkTDrO+A5t
         xyoP+a6796m7c/VwOu9Idae/Aomr2kPZ+GUmrGH2CdBQuqrocQpllPD+pK+TX0b6Z9pr
         qgo6BU1flFZ+9d7NaOPuI43oYU7dGQl7q0GaLUmHMs8vsob1Q+5yk2wjwSgbOA95iFGI
         w92j+nG4sFpswn1r5pfVVgKknVMBKc3wABwhqn0Mm+IWFczKPzlak14Hojy2BLw9S7+Q
         5Tyg==
X-Gm-Message-State: AOAM533bPuOZgzGY81Be54y/4MqrFgObPJTk8pAAxNEAgHs3mw8Os0Ip
	n1eiHsPbpNRIJuS0eN316m2olyZ5PN3U+VIZ4XGBvBmqMv/s+w==
X-Google-Smtp-Source: ABdhPJxgjAFotHBPzHTCdDP3ZF2gyaSTABEqxhBzz4U1xp48PvXwKp1W4fAxBAginS7KHQCodi6ySWCX4iesdqnS0os=
X-Received: by 2002:a17:906:c802:: with SMTP id cx2mr181098ejb.298.1602601495045;
 Tue, 13 Oct 2020 08:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201013132109.2588755-1-yann@blade-group.com>
 <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com>
 <CA+4=imZ7DY+UgbSieYFC2iMKTOhyExq-VbNd=vbqa0DhuPsFWg@mail.gmail.com>
 <CADkTA4PdEovbL92GwCUv6hnOr3ZtnNA8E35DyVfr09sLNUrpOA@mail.gmail.com> <CA+4=imbvST+-gMoKUc9hig+HCiPCRgt7jErGCmpJMrS3+QxLtw@mail.gmail.com>
In-Reply-To: <CA+4=imbvST+-gMoKUc9hig+HCiPCRgt7jErGCmpJMrS3+QxLtw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 13 Oct 2020 11:04:43 -0400
Message-ID: <CADkTA4P1NTdtB+uEmXvMr-p_DRM=h1Cb6SYSJhXbwB5s0fN0pQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 10:46 AM Yann Dirson
<yann.dirson@blade-group.com> wrote:
>
>
>
> Le mar. 13 oct. 2020 =C3=A0 16:10, Bruce Ashfield <bruce.ashfield@gmail.=
com> a =C3=A9crit :
>>
>> On Tue, Oct 13, 2020 at 9:57 AM Yann Dirson <yann.dirson@blade-group.co=
m> wrote:
>> >
>> >
>> >
>> > Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield <bruce.ashfield@gma=
il.com> a =C3=A9crit :
>> >>
>> >> On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson <yann.dirson@blade-group=
.com> wrote:
>> >> >
>> >> > From: Yann Dirson <yann@blade-group.com>
>> >> >
>> >> > The warning was not issued because of a filename error (looking fo=
r a
>> >> > gatesgath-era file in older tree).
>> >> >
>> >> > Before gatesgarth we have two files (one with short list and one w=
ith
>> >> > more details), whereas starting with gatesgarth we only have a sin=
gle
>> >> > file with all details.  Nevertheless, for consistency with the
>> >> > presentation of "invalid.cfg" we'll just print the contents of the
>> >> > short "mismatch.cfg" and point the user to the more detailed
>> >> > information.
>> >> >
>> >> > Signed-off-by: Yann Dirson <yann@blade-group.com>
>> >> > ---
>> >> >  meta/classes/kernel-yocto.bbclass | 5 +++--
>> >> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >> >
>> >> > This is not applicable to master, where the "mismatch.txt" file ex=
ists
>> >> > and shows even greater details.  Looks like the change was introdu=
ced
>> >> > for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would that =
be a
>> >> > mismatch with yocto-kernel-tools version ?
>> >> >
>> >> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kern=
el-yocto.bbclass
>> >> > index cc8bcb909a..771b4d8654 100644
>> >> > --- a/meta/classes/kernel-yocto.bbclass
>> >> > +++ b/meta/classes/kernel-yocto.bbclass
>> >> > @@ -431,12 +431,13 @@ python do_kernel_configcheck() {
>> >> >      bsp_check_visibility =3D int(d.getVar("KCONF_BSP_AUDIT_LEVEL"=
) or 0)
>> >> >
>> >> >      # if config check visibility is non-zero, report dropped conf=
iguration values
>> >> > -    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.txt" % kmeta=
)
>> >> > +    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.cfg" % kmeta=
)
>> >>
>> >> The use of mismatch.txt is completely intentional, and it is populat=
ed
>> >> by hardware tagged options that are detected as being mistmatches.
>> >>
>> >> So no, we don't want to directly expose mismatch.cfg. it shows
>> >> unclassified options.
>> >
>> >
>> > OK, so let's get back to the original problem:
>> >
>> > - I used to have kernel_configcheck report those problems enumerated =
in mismatch.cfg / mismatch-all.txt,
>> > but for some time I'm not getting them, and this could be since migra=
tion to sumo
>> >
>> > - those files are generated, and seem to contain real issues, whereas=
 there is no mismatch.txt
>> >
>> > What do you see going wrong and how do we move forward ?
>>
>> Is your configuration something that I can set up and reproduce the
>> problem ? I'm seeing what I expect out of the kconfig processing, but
>> there very well could be a bug that isn't showing in the machines that
>> I normally build.
>
>
> The problem can be triggered with the default qemu_x86-64 configuration.
> I'm just adding this in local.conf to inject a few options:
>
> SRC_URI_append_pn-linux-yocto +=3D " file://stuff.cfg"
>
> with this line in stuff.cfg:
>
> CONFIG_EEEPC_LAPTOP=3Dy
>
> On master I see:
>
> WARNING: linux-yocto-5.8.9+gitAUTOINC+ffbfe61a19_31fafe701e-r0 do_kernel=
_configcheck: [kernel config]: specified values did not make it into the ke=
rnel's final configuration:
>
>     [NOTE]: 'CONFIG_EEEPC_LAPTOP' last val (y) and .config val (m) do no=
t match
>     [INFO]: CONFIG_EEEPC_LAPTOP : m ## .config: 4353 :configs/v5.8/stand=
ard/./hibern.cfg (y)
>
> But on dunfell I don't see anything.  CONFIG_EEEPC_LAPTOP is listed in m=
ismatch*, though it is just
> one of 127 issues, most of which looking pretty much valid at first glan=
ce.  Are they not ?

Only if something is tagged as "hardware" is it reported. The
classification name is historical, so you can read "hardware" as
"required / important / needed for boot". The organization of the
fragments (and a push and pull between stand alone fragments,
different configurations, software stacks, etc) means that there are
many fragments that have some options listed, that are disabled due to
competing interests. Those are for the most part valid (to be
different), and only differing values for the ones tagged as hardware
are reported.

So no, we really don't want to report all those options. That's the
wobbling between reporting and non-reporting that I mentioned before.

In non-master, there's a complex way to tag options as hardware (and
hopefully an easier way in master), so if there's a mismatch you'll
see it.

The delta between the two could be that I re-did the default
classification buckets for the new kernel and that's why it shows in
one, and not the other.

 I can fire up a build on dunfell and see if I can see where the
classification differs.

Bruce

>
>>
>> The visibility of the warnings has changed over time (I expose them,
>> there are complaints, I make them less visible, and then the process
>> repeats ..), so there could be something there as well.
>>
>> And as you noticed, I totally rewrote things in master, since
>> maintaining the existing script was just too painful.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> >>
>> >> Cheers,
>> >>
>> >> Bruce
>> >>
>> >> >      if os.path.exists(mismatch_file):
>> >> >          if config_check_visibility:
>> >> > +            mismatch_details_file =3D d.expand("${S}/%s/cfg/misma=
tch-all.txt" % kmeta)
>> >> >              with open (mismatch_file, "r") as myfile:
>> >> >                  results =3D myfile.read()
>> >> > -                bb.warn( "[kernel config]: specified values did n=
ot make it into the kernel's final configuration:\n\n%s" % results)
>> >> > +                bb.warn( "[kernel config]: specified values did n=
ot make it into the kernel's final configuration (see details in %s):\n\n%s=
" % (mismatch_details_file, results))
>> >> >
>> >> >      if bsp_check_visibility:
>> >> >          invalid_file =3D d.expand("${S}/%s/cfg/invalid.cfg" % kme=
ta)
>> >> > --
>> >> > 2.28.0
>> >> >
>> >> >
>> >> >=20
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
