Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web12.12865.1602598225944091824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 07:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YuTlv4vK;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id 33so21017366edq.13
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=deraQkIPHNGKNje2s453e3p26n6jeG0qeKZX7wgsPPo=;
        b=YuTlv4vKQwQXRFZnymRggGypLnutqbTnale8BOLvcUCNIs1bWBffFuCMj9l7DLvrSP
         VbMVG9LcQSxjaIBN2BFMD3pLAvg57pfWusV8xP+UsyNKexqzIVO+JuQm09L5b8NUq6XH
         D94hYxeERjO3Zbxqv4ATE13ZbAgtmX2eVW7qRSJGeg7vsX+T1V/7JPBC7aZf1bDPimFf
         saQqC9cmsmRHZU4bHXiZBRFMWFgAW35YsaoMQsysDZR130Dv0k8nRIIdHQgfdRh3WaJQ
         y2dBhXYPvpvRe8lrip/m0zvxpcIoDvPRhmsQcnL6nHR1n8BPe1IiR1sRceghVErk0XNY
         SGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=deraQkIPHNGKNje2s453e3p26n6jeG0qeKZX7wgsPPo=;
        b=MYPWCdFag9jkM1Nw+w4TbIMUiwSrwfOM5zdgIyO4JW/KDnExtjiBEdX1xzVtYvTsGp
         Fs95TtA6vvJxfE6gkG5ebwdgu3jAIJ53UWvKZUJLrkGQ8qmVlFji8VTz795CY/hvyeNQ
         xxWXXNmZizQKmzezBvs2xqB26wSb4ac+fHD7FOpplzb/AfR8OEVsjFF4D+XrfCNPoZEv
         +4dwkMrcWJluyacpe2Ho3UAtC3tHX8SJZc4lwlyFgEe8U+wrOiUMdTl7wF6Z2S4xLWIf
         3tA51LKb+Vx0Heu/JdGkrySgou2KdrbQZHjm3HRsKRAUPLTUZnZk8AUzKghX/E7ud/sZ
         IFhw==
X-Gm-Message-State: AOAM530/vEHbfSU65AULGIRK65jvt6Q6EKSnctqXbkWB2+Ob+CDqtqyK
	r90MYzdD0EQyG5hfNQ2wiBiFgrXHig7/FaQleo0=
X-Google-Smtp-Source: ABdhPJxGVPN328al/w4jPPzk+X3qFEOxjr5328gBZqKWl6uLlvqlxC5R5GsRVGrO7ltjSEO/c0u6VHCtqkj4Z+d7hzM=
X-Received: by 2002:a50:d94d:: with SMTP id u13mr19779730edj.365.1602598224257;
 Tue, 13 Oct 2020 07:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201013132109.2588755-1-yann@blade-group.com>
 <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com> <CA+4=imZ7DY+UgbSieYFC2iMKTOhyExq-VbNd=vbqa0DhuPsFWg@mail.gmail.com>
In-Reply-To: <CA+4=imZ7DY+UgbSieYFC2iMKTOhyExq-VbNd=vbqa0DhuPsFWg@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 13 Oct 2020 10:10:11 -0400
Message-ID: <CADkTA4PdEovbL92GwCUv6hnOr3ZtnNA8E35DyVfr09sLNUrpOA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2020 at 9:57 AM Yann Dirson <yann.dirson@blade-group.com> w=
rote:
>
>
>
> Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield <bruce.ashfield@gmail.=
com> a =C3=A9crit :
>>
>> On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson <yann.dirson@blade-group.co=
m> wrote:
>> >
>> > From: Yann Dirson <yann@blade-group.com>
>> >
>> > The warning was not issued because of a filename error (looking for a
>> > gatesgath-era file in older tree).
>> >
>> > Before gatesgarth we have two files (one with short list and one with
>> > more details), whereas starting with gatesgarth we only have a single
>> > file with all details.  Nevertheless, for consistency with the
>> > presentation of "invalid.cfg" we'll just print the contents of the
>> > short "mismatch.cfg" and point the user to the more detailed
>> > information.
>> >
>> > Signed-off-by: Yann Dirson <yann@blade-group.com>
>> > ---
>> >  meta/classes/kernel-yocto.bbclass | 5 +++--
>> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >
>> > This is not applicable to master, where the "mismatch.txt" file exist=
s
>> > and shows even greater details.  Looks like the change was introduced
>> > for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would that be =
a
>> > mismatch with yocto-kernel-tools version ?
>> >
>> > diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-=
yocto.bbclass
>> > index cc8bcb909a..771b4d8654 100644
>> > --- a/meta/classes/kernel-yocto.bbclass
>> > +++ b/meta/classes/kernel-yocto.bbclass
>> > @@ -431,12 +431,13 @@ python do_kernel_configcheck() {
>> >      bsp_check_visibility =3D int(d.getVar("KCONF_BSP_AUDIT_LEVEL") o=
r 0)
>> >
>> >      # if config check visibility is non-zero, report dropped configu=
ration values
>> > -    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
>> > +    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.cfg" % kmeta)
>>
>> The use of mismatch.txt is completely intentional, and it is populated
>> by hardware tagged options that are detected as being mistmatches.
>>
>> So no, we don't want to directly expose mismatch.cfg. it shows
>> unclassified options.
>
>
> OK, so let's get back to the original problem:
>
> - I used to have kernel_configcheck report those problems enumerated in =
mismatch.cfg / mismatch-all.txt,
> but for some time I'm not getting them, and this could be since migratio=
n to sumo
>
> - those files are generated, and seem to contain real issues, whereas th=
ere is no mismatch.txt
>
> What do you see going wrong and how do we move forward ?

Is your configuration something that I can set up and reproduce the
problem ? I'm seeing what I expect out of the kconfig processing, but
there very well could be a bug that isn't showing in the machines that
I normally build.

The visibility of the warnings has changed over time (I expose them,
there are complaints, I make them less visible, and then the process
repeats ..), so there could be something there as well.

And as you noticed, I totally rewrote things in master, since
maintaining the existing script was just too painful.

Cheers,

Bruce

>
>>
>> Cheers,
>>
>> Bruce
>>
>> >      if os.path.exists(mismatch_file):
>> >          if config_check_visibility:
>> > +            mismatch_details_file =3D d.expand("${S}/%s/cfg/mismatch=
-all.txt" % kmeta)
>> >              with open (mismatch_file, "r") as myfile:
>> >                  results =3D myfile.read()
>> > -                bb.warn( "[kernel config]: specified values did not =
make it into the kernel's final configuration:\n\n%s" % results)
>> > +                bb.warn( "[kernel config]: specified values did not =
make it into the kernel's final configuration (see details in %s):\n\n%s" %=
 (mismatch_details_file, results))
>> >
>> >      if bsp_check_visibility:
>> >          invalid_file =3D d.expand("${S}/%s/cfg/invalid.cfg" % kmeta)
>> > --
>> > 2.28.0
>> >
>> >
>> >=20
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
