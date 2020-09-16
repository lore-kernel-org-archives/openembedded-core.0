Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.15582.1600232721666508565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 22:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TvQ/98OU;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id k25so5240280qtu.4
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 22:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UOQwiyDh+FU1SWQSHH+DBaz3GofndEa0wwVJMKr6vRY=;
        b=TvQ/98OU5FG65IUuZDTlrczQ4TyDz5X4uLW8V/w21T5XR+YtMaibrHv/fLmlLvgUSS
         gIvFtIFOzEv4G0s3FArUjELeCVljK/JjsW9b3KnomlZyj3UbVh4zMlkGeQRh6Ia/Be2L
         5+3Qq9AJ1lNsw1tpBqWUk9bBoOCjgq+QhSV/WzKaq355yNdgbM2nbVKXhnjvxDK7pTiq
         7LKmq+kdbOAmaUYA+j4wFfwkrJr8Cb5xFtq978DNbxYGqS3hU/EpocygTqf2V+eWGKsO
         eXFmYoz/D8c9LvPPWGndEBkePyX0yZVVPzSLOYA9OghsF4MEfANVtZZmL9/AbraMSJJ+
         vSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UOQwiyDh+FU1SWQSHH+DBaz3GofndEa0wwVJMKr6vRY=;
        b=CuYNl8QKtsOLOFKW9XYg7eYt1VctB+iyMq3PZWdLthKBygAiiKHgfR6u7a7KJH+PJV
         iYDobpzguol0UaVR35j80hxnNCXkgcfNV0E+hMINwcpxQxB6eeWNWihmXSNz6MQQTEuo
         l5Blp73fgO5KvUXOB80slhrtP1F0nIoGZgJR05rIuJDFgBO9JkH2VZNHSGe2KSqHvuh/
         8zt/60B+7F4k9AKjjls3snKJ0P/atbZIg2M8ST4hZZNAcHlmwcKY2lTLGZuthQxYNx2J
         pWdo3614V0ofOzXsXrjke9hPDhkvt6IxF5AxlOrSWYK1ajpJ+08au7MNTxUsTpDWyG4y
         xZJw==
X-Gm-Message-State: AOAM531+Q7uHasW0bKqWf9co/SYIydPEc5KRQyKi2Nw0l59ubMRVGQaA
	j/9ng25agIBtDdZ7Fy+nMqhXP2sGIgJOf5yCQuI=
X-Google-Smtp-Source: ABdhPJyM5y8gqsk4bf7YoYasQBQzKSz8qyANvIOfJGjIEIHkIPKHbYwd4SOmlR9qxBXtLhYU0OluxPX1otoO0YIeNRE=
X-Received: by 2002:aed:2646:: with SMTP id z64mr8862422qtc.194.1600232720652;
 Tue, 15 Sep 2020 22:05:20 -0700 (PDT)
MIME-Version: 1.0
References: <08f090d6-65c6-da98-ac7f-a2bc803c805a@taitradio.com>
 <CAMKF1soFHoBkMBQTtp7YXjxgzy1uyQQS=CePsOrOf_9BWV5chA@mail.gmail.com>
 <2bc4eb24-82e0-2638-f204-1be9fa9c3aac@taitradio.com> <CAMKF1sr=zQ8Wctqv7JyUh0YT_u-M7e=pJnFrnLKPjQ-eK7Ky_A@mail.gmail.com>
 <CAFimOt6s3Ci-13D8pa+1PbWfxFehYabWbtDkgw0mEjRxSks4Yg@mail.gmail.com>
In-Reply-To: <CAFimOt6s3Ci-13D8pa+1PbWfxFehYabWbtDkgw0mEjRxSks4Yg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 15 Sep 2020 22:04:54 -0700
Message-ID: <CAMKF1sr4GrbT08BHxpboxJPSdi95BHT4zLZOOqR8Y4Yyvh1tOA@mail.gmail.com>
Subject: Re: [OE-core] nativesdk-linux-libc-headers with two different MACHINEs
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thanks.

On Tue, Sep 15, 2020 at 5:43 PM Douglas Royds
<douglas.royds@taitradio.com> wrote:
>
> Built a core-image-minimal sdk fine, and also our proprietary sdk.
>
> On Tue, 15 Sep 2020 at 13:14, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > OK please test this patch for full SDK builds and any other testing
> > you do and report back if it works in all cases.
> >
> > On Mon, Sep 14, 2020 at 5:42 PM Douglas Royds
> > <douglas.royds@taitradio.com> wrote:
> > >
> > > Yes it did, thanks!
> > >
> > >
> > > On 15/09/20 12:31 pm, Khem Raj wrote:
> > >
> > > > I think MACHINE should not matter for nativesdk packages. Does
> > > > something like this work
> > > >
> > > > diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/natives=
dk.bbclass
> > > > index 7f2692c51a..bb1dfd84c0 100644
> > > > --- a/meta/classes/nativesdk.bbclass
> > > > +++ b/meta/classes/nativesdk.bbclass
> > > > @@ -10,7 +10,7 @@ LIBCOVERRIDE =3D ":${NATIVESDKLIBC}"
> > > >   CLASSOVERRIDE =3D "class-nativesdk"
> > > >   MACHINEOVERRIDES =3D ""
> > > >   MACHINE_FEATURES =3D ""
> > > > -
> > > > +MACHINE =3D "${SDKMACHINE}"
> > > >   MULTILIBS =3D ""
> > > >
> > > >   # we need consistent staging dir whether or not multilib is enab=
led
> > > >
> > > > On Mon, Sep 14, 2020 at 5:13 PM Douglas via lists.openembedded.org
> > > > <douglas.royds=3Dtaitradio.com@lists.openembedded.org> wrote:
> > > >> For the experiment, I wanted to see whether I could achieve no ta=
sk signature change when building nativesdk-glibc for two different MACHINE=
s, but I found that the do_install sigdata for nativesdk-linux-libc-headers=
 changed. We're installing the linux-libc-headers for the build machine, so=
 it seems to make sense to take control of the TARGET_CC_KERNEL_ARCH:
> > > >>
> > > >> diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/native=
sdk.bbclass
> > > >> index 32c3aa32ad..655439dd73 100644
> > > >> --- a/meta/classes/nativesdk.bbclass
> > > >> +++ b/meta/classes/nativesdk.bbclass
> > > >> @@ -47,6 +47,7 @@ TARGET_VENDOR =3D "${SDK_VENDOR}"
> > > >>   TARGET_OS =3D "${SDK_OS}"
> > > >>   TARGET_PREFIX =3D "${SDK_PREFIX}"
> > > >>   TARGET_CC_ARCH =3D "${SDK_CC_ARCH}"
> > > >> +TARGET_CC_KERNEL_ARCH =3D "${SDK_CC_ARCH}"
> > > >>   TARGET_LD_ARCH =3D "${SDK_LD_ARCH}"
> > > >>
> > > >> Which leaves me with:
> > > >>
> > > >> basehash changed from 42ed3480096bb7ea53b60dc876da0613 to 38ea60b=
dac041673f2c491d7bbabe17c
> > > >> Variable MACHINE value changed from 'qemuarm' to 'qemux86-64'
> > > >> runtaskdeps changed:
> > > >> linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:=
nativesdk with hash cbb186fe33cd69cb0b06384e4d50a244
> > > >>   changed to
> > > >> linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:=
nativesdk with hash 4d34d6981b79d0fccc768566bf2fa533
> > > >> Hash for dependent task linux-libc-headers/linux-libc-headers_4.1=
8.bb.do_compile:virtual:nativesdk changed from cbb186fe33cd69cb0b06384e4d50=
a244 to 4d34d6981b79d0fccc768566bf2fa533
> > > >>
> > > >> The configure and compile tasks for linux-libc-headers are both s=
et to noexec. For the experiment, I added an empty do_configure task, with =
this result on the do_configure sigdata:
> > > >>
> > > >> basehash changed from f13c2a2066fa48f0ccac35c085537c71 to bb13f2b=
1b1e7e6666376f3fb5a8ec888
> > > >> Variable MACHINE value changed from 'qemux86-64' to 'qemuarm'
> > > >>
> > > >> What to do? Why is the MACHINE variable included in the task sign=
ature (it is unset in run.do_configure)? Adding it to BB_HASHBASE_WHITELIST=
 had no effect. What am I missing here?
> > > >>
> > > >>=20
> > >
> > >
>
> --
> This Communication is Confidential. We only send and receive email on th=
e
>
> basis of the terms set out at www.taitradio.com/email_disclaimer
> <http://www.taitradio.com/email_disclaimer>
