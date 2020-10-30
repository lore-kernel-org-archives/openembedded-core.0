Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.18253.1604082905420183802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 11:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dBQYwoKe;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id o18so7677093edq.4
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 11:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6RPa4Y46G35zIM1mqwhNBYaqDHcxO9VEsG2mmsjgisU=;
        b=dBQYwoKe5rJZLF1tPfgHTft9oaL3wN0vYbUzVQUikKpUjSz/ND3nneIF7V5EDEYn01
         Ibz2/nTQb1cjBQa40Drwq7jQgu1bznmhgfB2vRU++iJdrJU3V7cS1EBpIJfJTGB4G43/
         xuKa2KiJEk/tlqtM4LDevUn4wChm1XI1KyAz0gqXGRZN+u+AnA79za5RaHrP/kJUpgRQ
         DtR/VI3aAAad3qd+77loYS9Z1iBf315JtAlV7/+/gGHbkMLTJ7ED1m+MCqW7aNmGEfjd
         p/6Lpprz3VHaRIZPT1LuNUVRFeYW/YkCtJXBa/mKIM7CxhRlR3XGHFsyGGvBAciGaQWs
         YCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6RPa4Y46G35zIM1mqwhNBYaqDHcxO9VEsG2mmsjgisU=;
        b=Erqh4wjI3ALXrmYdzphQbjz8bp8Xidp05NQHogQmeJPpn6lSP9jzw1rYQ0TDqLICQm
         gUCU78QXyryO9H0sRarADGlhw32yoKmdltOKByXIJmy+cW/XUGZS5NNAhAb15ZHQz3x9
         sxA7WLs/d3NDClCtcBgE/8hCpymBcvYDkJdG2VrrLptn6hLEawohH7Xip6VXQ2LFAOnc
         /XfLIYALhzkm3FVMqyay9Y/ySyoM5pKfB5Dzbew1s/wMyl7ByccWAXTDgU08pFmf3L0C
         EEsoCs87IZmqE4VKQ1KabmXgScQ9xcXgnX5q8WlX1uVVvnChCiGJI85iqajdt9h1pyUI
         vEQg==
X-Gm-Message-State: AOAM533TnWh3uNNTAOxEAuxv3explroEBLdV/Hqw3yqaqpqNZThLiZiy
	cpTkpOuFiQeqv7evc01cKa+GczFRASsipPsur6M=
X-Google-Smtp-Source: ABdhPJxtdPGfAal6FE/ruZ4SYYHWaZ4XrbPgJDUZnzBwGLneyezTzkzafH/dBPsF29bRwjQfLbDJo1cJORu1RxWBJl0=
X-Received: by 2002:aa7:d29a:: with SMTP id w26mr3792779edq.59.1604082903773;
 Fri, 30 Oct 2020 11:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
 <1642964F5C513D13.27950@lists.openembedded.org> <1642987B07D196A5.27950@lists.openembedded.org>
 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
 <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
 <1642D6DB2EF0C3ED.10902@lists.openembedded.org> <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
 <CANNYZj8kDD=1rWuzA9=rV5f=1Ed+xuFwR7HU5wTeve56KRdY2Q@mail.gmail.com>
In-Reply-To: <CANNYZj8kDD=1rWuzA9=rV5f=1Ed+xuFwR7HU5wTeve56KRdY2Q@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 30 Oct 2020 18:35:04 +0000
Message-ID: <CANPvuRmh0wgJa2KskNPscG6XRkGZy69Y94406o0_8dp70UjDHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's probably better to wait and send two little fixup after the
series is applied on the master.

Thanks for the help

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia sexta,
30/10/2020 =C3=A0(s) 18:28:
>
> Since the patches are already in master-next, and will likely not cause =
any problems, maybe it's easier to create small followup patches, and send =
them once the main set merges, instead of sending a massive full set again.
>
> Alex
>
> On Fri, 30 Oct 2020 at 19:23, Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>>
>> Hi Richard,
>>
>> I see your fix:
>>
>> -PACKAGECONFIG[asm] =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm"
>> +PACKAGECONFIG[asm] =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm nasm-nat=
ive"
>>
>> and only nasm-native is needed,
>> because nasm is not needed on target and it's only needed at build time=
.
>>
>> I can fix it and send v6 series and I have another fix for this series
>> that remove
>> 0004-capfix.patc in gstreamer1.0: upgrade to version 1.18.0
>> What do you think?
>>
>> I hope this is the last version and I will be more careful next time I
>> submit a big patch series.
>>
>> Jose Quaresma via lists.openembedded.org
>> <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
>> sexta, 30/10/2020 =C3=A0(s) 17:57:
>> >
>> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
>> > sexta, 30/10/2020 =C3=A0(s) 17:45:
>> > >
>> > > On Fri, 2020-10-30 at 16:47 +0000, Jose Quaresma wrote:
>> > > > nasm is present on sysroot
>> > > >
>> > > > The build log
>> > > > https://errors.yoctoproject.org/Errors/Details/510826/
>> > > >
>> > > > Countain:
>> > > >
>> > > > NOTE: Direct dependencies are:
>> > > > '/home/pokybuild/yocto-worker/qemux86-64-ltp/build/meta/recipes-
>> > > > devtools/nasm/nasm_2.15.05.bb:do_populate_sysroot'
>> > > >
>> > > > NOTE: Skipping as already exists in sysroot:
>> > > > 'nasm'
>> > > >
>> > > > I don't have a build it on qemux86-64 and only build on arm
>> > > > and on arm it is builded without nasm because -Dasm=3Ddisabled
>> > > > Otherwise I think everything is correct with this patch
>> > >
>> > > I was able to reproduce by building qemux86-64, it readily fails. T=
he
>> > > issue is that it needs nasm-native. If I add nasm-native to the
>> > > dependency line it seems to build fine.
>> >
>> > Big mistake and I don't see it, of course it was the native nasm that
>> > is needed to build.
>> > Sorry for that and thanks for looking into this.
>> >
>> > >
>> > > I'll add that and retest on the autobuilder. If that works I'll squ=
ash
>> > > it in.
>> > >
>> > > Cheers,
>> > >
>> > > Richard
>> > >
>> >
>> >
>> > --
>> > best regards,
>> > Jos=C3=A9 Quaresma
>> >
>> >
>> >
>>
>>
>> --
>> best regards,
>> Jos=C3=A9 Quaresma
>>
>>=20
>>


--=20
best regards,
Jos=C3=A9 Quaresma
