Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web12.11997.1600216990837935404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 17:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitradio.com header.s=google header.b=Ez+5hbl+;
 spf=pass (domain: taitradio.com, ip: 209.85.166.41, mailfrom: douglas.royds@taitradio.com)
Received: by mail-io1-f41.google.com with SMTP id y74so6249994iof.12
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 17:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitradio.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3LE1IUkzY/mP/8ST+Ex4Pp4qhqEBrZ/VpdZMdubvV/o=;
        b=Ez+5hbl+rjVCOjKJUi/jFbNcp+uSKqScME3i2U9O7q2PhprfFxtjdd0nXsXRHlfRZX
         cJfqsDD7tqL1KsnRizTivAa3RpuXpV6MEk+b6wpBhp4qgivUc3kNdfiymtbd/H9Z8aqM
         x6UdbaIHyj139f/xTy3U7Tye/cY+sAnrgPNEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3LE1IUkzY/mP/8ST+Ex4Pp4qhqEBrZ/VpdZMdubvV/o=;
        b=SMg4y3Rry73WzH8cZVmxwamsVRN6B4wfOl/mhaBV5yA25B5LKRmXZ9utxNDl3jxtMZ
         hyOrIJ4dYYGhTVlgS+oFLLYUExl6rQU8rXHYaipzNrrw7ZX42VViO9O6+bdeJisinXEF
         egci09IPjlwKN8PQ2u0SBt9Nlkq1X2ygpNa1y6gMpOH9K7bY6Ap1tlFYYs7HyKu0SFwZ
         e021ZmciD6nRfa5sX1dSXsyuJyJYm/2eK1vkuiRXV8gkf0h/Zgd5JFKOi/wa156zBcUX
         n6zdwtUazTk1E1FEnd881DxuMGA+9/WRnm+RJDweVGE0iFfkZiYzfuseI7omxFn8V4zO
         mxcQ==
X-Gm-Message-State: AOAM531bvOZzL7VxVcmZK0qRP2WIIpcutgs99+DP7l06tK2pWz1xzbch
	K6uv9+RRujtAAuvJcaVdpbZMo/O1ja07umwffhWnV8UVIhU5z5RSlsTbG9QMeguaGnAtzFmtrwx
	QCFlGfqxTYTOALsW/DseLteKyAP83VqAVBFBCVbxLHIYAPuiV
X-Google-Smtp-Source: ABdhPJyCH4EkiZxqHWi5SYNeCyWqvYPtAyTbca41O+dTb13gbaaQPB0+uPICxGJYtnOIqxPsRnXENU8obas7eJJMYw8=
X-Received: by 2002:a6b:e718:: with SMTP id b24mr18045665ioh.9.1600216990026;
 Tue, 15 Sep 2020 17:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <08f090d6-65c6-da98-ac7f-a2bc803c805a@taitradio.com>
 <CAMKF1soFHoBkMBQTtp7YXjxgzy1uyQQS=CePsOrOf_9BWV5chA@mail.gmail.com>
 <2bc4eb24-82e0-2638-f204-1be9fa9c3aac@taitradio.com> <CAMKF1sr=zQ8Wctqv7JyUh0YT_u-M7e=pJnFrnLKPjQ-eK7Ky_A@mail.gmail.com>
In-Reply-To: <CAMKF1sr=zQ8Wctqv7JyUh0YT_u-M7e=pJnFrnLKPjQ-eK7Ky_A@mail.gmail.com>
From: "Douglas" <douglas.royds@taitradio.com>
Date: Wed, 16 Sep 2020 12:42:58 +1200
Message-ID: <CAFimOt6s3Ci-13D8pa+1PbWfxFehYabWbtDkgw0mEjRxSks4Yg@mail.gmail.com>
Subject: Re: [OE-core] nativesdk-linux-libc-headers with two different MACHINEs
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Built a core-image-minimal sdk fine, and also our proprietary sdk.

On Tue, 15 Sep 2020 at 13:14, Khem Raj <raj.khem@gmail.com> wrote:
>
> OK please test this patch for full SDK builds and any other testing
> you do and report back if it works in all cases.
>
> On Mon, Sep 14, 2020 at 5:42 PM Douglas Royds
> <douglas.royds@taitradio.com> wrote:
> >
> > Yes it did, thanks!
> >
> >
> > On 15/09/20 12:31 pm, Khem Raj wrote:
> >
> > > I think MACHINE should not matter for nativesdk packages. Does
> > > something like this work
> > >
> > > diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk=
.bbclass
> > > index 7f2692c51a..bb1dfd84c0 100644
> > > --- a/meta/classes/nativesdk.bbclass
> > > +++ b/meta/classes/nativesdk.bbclass
> > > @@ -10,7 +10,7 @@ LIBCOVERRIDE =3D ":${NATIVESDKLIBC}"
> > >   CLASSOVERRIDE =3D "class-nativesdk"
> > >   MACHINEOVERRIDES =3D ""
> > >   MACHINE_FEATURES =3D ""
> > > -
> > > +MACHINE =3D "${SDKMACHINE}"
> > >   MULTILIBS =3D ""
> > >
> > >   # we need consistent staging dir whether or not multilib is enable=
d
> > >
> > > On Mon, Sep 14, 2020 at 5:13 PM Douglas via lists.openembedded.org
> > > <douglas.royds=3Dtaitradio.com@lists.openembedded.org> wrote:
> > >> For the experiment, I wanted to see whether I could achieve no task=
 signature change when building nativesdk-glibc for two different MACHINEs,=
 but I found that the do_install sigdata for nativesdk-linux-libc-headers c=
hanged. We're installing the linux-libc-headers for the build machine, so i=
t seems to make sense to take control of the TARGET_CC_KERNEL_ARCH:
> > >>
> > >> diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesd=
k.bbclass
> > >> index 32c3aa32ad..655439dd73 100644
> > >> --- a/meta/classes/nativesdk.bbclass
> > >> +++ b/meta/classes/nativesdk.bbclass
> > >> @@ -47,6 +47,7 @@ TARGET_VENDOR =3D "${SDK_VENDOR}"
> > >>   TARGET_OS =3D "${SDK_OS}"
> > >>   TARGET_PREFIX =3D "${SDK_PREFIX}"
> > >>   TARGET_CC_ARCH =3D "${SDK_CC_ARCH}"
> > >> +TARGET_CC_KERNEL_ARCH =3D "${SDK_CC_ARCH}"
> > >>   TARGET_LD_ARCH =3D "${SDK_LD_ARCH}"
> > >>
> > >> Which leaves me with:
> > >>
> > >> basehash changed from 42ed3480096bb7ea53b60dc876da0613 to 38ea60bda=
c041673f2c491d7bbabe17c
> > >> Variable MACHINE value changed from 'qemuarm' to 'qemux86-64'
> > >> runtaskdeps changed:
> > >> linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:na=
tivesdk with hash cbb186fe33cd69cb0b06384e4d50a244
> > >>   changed to
> > >> linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:na=
tivesdk with hash 4d34d6981b79d0fccc768566bf2fa533
> > >> Hash for dependent task linux-libc-headers/linux-libc-headers_4.18.=
bb.do_compile:virtual:nativesdk changed from cbb186fe33cd69cb0b06384e4d50a2=
44 to 4d34d6981b79d0fccc768566bf2fa533
> > >>
> > >> The configure and compile tasks for linux-libc-headers are both set=
 to noexec. For the experiment, I added an empty do_configure task, with th=
is result on the do_configure sigdata:
> > >>
> > >> basehash changed from f13c2a2066fa48f0ccac35c085537c71 to bb13f2b1b=
1e7e6666376f3fb5a8ec888
> > >> Variable MACHINE value changed from 'qemux86-64' to 'qemuarm'
> > >>
> > >> What to do? Why is the MACHINE variable included in the task signat=
ure (it is unset in run.do_configure)? Adding it to BB_HASHBASE_WHITELIST h=
ad no effect. What am I missing here?
> > >>
> > >>=20
> >
> >

--=20
This Communication is Confidential. We only send and receive email on the

basis of the terms set out at www.taitradio.com/email_disclaimer=20
<http://www.taitradio.com/email_disclaimer>
