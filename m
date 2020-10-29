Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web09.8392.1603977008190072492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 06:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ckNFd9j/;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id dg9so2917498edb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 06:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=c1AFD1XKBScUfO4h7lDm1YsJvdVhTIdN5HoMNPXZmJw=;
        b=ckNFd9j/NEoqtOje8JNuSI6Gx+y5sjxz1db/agTs2rc9msJzIw/D0Qes5+x2hB+/VA
         AvJKpPNifS3y7hmbeM56L/2LjrXEe9hyWAw1QlaE0/4qXaEUIy1fISt7Gkw4uadjRew3
         ByiC5W/YsJU3Fo5+UF/IbuVRDgmkyXNOuWARRouM2h/Gv9dK7Mi3Hw8UXUw5UaBhsR+1
         0xNum0SQAg75A00x7E7Hy2bhMI/XWXts76i0e+0YU2RLAbF/x140nPWTyJLxmUs8v+2X
         afo6MclQBi5Ill3tUJ9/TtseXsnVIqeeSSZpGKBiQH2pA9qTqFuEbpNEtmeA3D8TKneg
         xKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=c1AFD1XKBScUfO4h7lDm1YsJvdVhTIdN5HoMNPXZmJw=;
        b=aO7ag2XaEELA/B34h8J241BwwhgyhjEPwzgj9ueeJeiKQrywvUNerNyUACDuFZgcWJ
         qB0RA2A9k6t0bhXQvR2rG1Pg/0xTJr7JiOETQSrqMvVuMtJmfaZSHMTYuzdkYxb5cc8u
         4A1QOoRIoZzSLtAPDAPBG9xx11kYekDpsRxrcTAyI7xrA9q47QgGCEW0zFYBN+JriSxY
         aj34fr6bDUOu8BC8j3Nw8k58Gxg/t6bqn+Z6gZHN18WmSdYoPY7kxIJpxvABsn/ndb6Z
         esd1jZSJTlUCaeGaJxflvEOSSjbljjKrgpM24vAo4gavPP8Ajf8Gs2EBWylM81ENzkpw
         40yA==
X-Gm-Message-State: AOAM530WR1WR2KP2M2+xjcwzPhFzBj5ZGNpwbsIa07VxIqHTMJLiOWKb
	6LLqBectDmfNpvx8498sE3YJPJfK8nSH35xYIok=
X-Google-Smtp-Source: ABdhPJyiUtdSXuFp+TtBQ8HleJWAE4w7Lm5cApKCO1bWr6YyegVl6My/MdhmoJlw3xZFhLnUkLdQpYGxxrVEVfYdHnk=
X-Received: by 2002:aa7:dc50:: with SMTP id g16mr3808573edu.95.1603977006618;
 Thu, 29 Oct 2020 06:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
 <6c5cc7223aec5587143b1d7e165346494a4ab77d.camel@linuxfoundation.org>
 <CANPvuRkMioP_k1f6=xj3Gn==wQq-JUtzqcux=sCV98CibvKFrA@mail.gmail.com>
 <CANNYZj9x+mWxJ6NnUarwF3Q1YjoqmDYq83ZwFc8aQY2fyQjtuQ@mail.gmail.com>
 <2002eb09317f295e090792f561e8ff33a67b8e96.camel@linuxfoundation.org>
 <CANPvuRk13xJMo=AoTc29=BwCTqcgB56bNsQ4DuSNC2SnhuGwAg@mail.gmail.com> <CANNYZj8Yzap6Np9_RndKXDEEJU1pYUFdbQcAQk5j+u-q_wxM1w@mail.gmail.com>
In-Reply-To: <CANNYZj8Yzap6Np9_RndKXDEEJU1pYUFdbQcAQk5j+u-q_wxM1w@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 13:10:07 +0000
Message-ID: <CANPvuRnJPi06YBz1uL8tc39DGszd0Q3UGX9rAMaQg2xDtHjD6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 00/21] Updates the gstreamer to version 1.18.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It is dropped because the all the code is now LGPL-2.1+
I have reference this on the commit
The LICENSE_FLAGS =3D "commercial" is there on 1.16 because the copy of
the ffmpeg on the archive

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quinta,
29/10/2020 =C3=A0(s) 13:04:
>
> gstreamer-libav 1.16 had this:
> LICENSE_FLAGS =3D "commercial"
>
> Update to 1.18 dropped this erroneously - I think once it's restored, the=
 issue will be solved.
>
> Alext
>
> On Thu, 29 Oct 2020 at 13:52, Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
>>
>> ffmpeg is disabled because of LICENSE_FLAGS_WHITELIST in the build
>> configuration.
>> I think there are no issues with the removal of x11 from distro futures.
>> It is present on the autobuilder logs:
>>
>> NOTE: Resolving any missing task queue dependencies
>> ERROR: Nothing PROVIDES 'ffmpeg' (but
>> /home/pokybuild/yocto-worker/no-x11/build/meta/recipes-multimedia/gstrea=
mer/gstreamer1.0-libav_1.18.0.bb
>> DEPENDS on or otherwise requires it)
>> ffmpeg was skipped: because it has a restricted license 'commercial'.
>> Which is not whitelisted in LICENSE_FLAGS_WHITELIST
>>
>>
>> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
>> quinta, 29/10/2020 =C3=A0(s) 12:32:
>> >
>> > On Thu, 2020-10-29 at 13:20 +0100, Alexander Kanavin wrote:
>> > > Wait, ffmpeg has been available in oe-core for a long time:
>> > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-mul=
timedia/ffmpeg
>> > >
>> > > So the issue is not the absence of ffmpeg.
>> >
>> > Right, that shouldn't be the issue. I think its the disabling of X11
>> > that is breaking something somehow.
>> >
>> > You can see the configuration used at the start of:
>> >
>> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2629=
/steps/8/logs/step1b
>> >
>> > the key component being:
>> >
>> > DISTRO_FEATURES_remove =3D 'x11'
>> >
>> > I think ffmpeg is being disabled due to x11 being removed but somethin=
g
>> > which depends on ffmpeg is being left enabled accidentally.
>> >
>> > Cheers,
>> >
>> > Richard
>> >
>>
>>
>> --
>> best regards,
>> Jos=C3=A9 Quaresma



--=20
best regards,
Jos=C3=A9 Quaresma
