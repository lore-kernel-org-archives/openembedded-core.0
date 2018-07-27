Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id E591778CF0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 21:05:09 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id w7-v6so4222873uan.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 14:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fucvsr+wqJOGbsxejpmGIrDDFcKoVRF0T93URtWjrUU=;
	b=UTT+6t6hIE1Ph0y5r9RflHyy2RTQQHlYv4x2hUp1Hl3Rlr9Fmse4/jFiuDjWCZnDCI
	Rq2LaDhYbgnce7DrNKzAegkgtSNtLJX9UOUPnxYu61X+HmE5u8/JW17fuwZgUbb8ykyJ
	CS5/F5s7ISnO5SeVrKK0SDfvE8e4QHD4sD5xj3wfif3V2G3DpoHxLMBRT/O5dsPVHwhE
	yn7glxxXNMbRzaB/EjhQSRqQGzCg3pmd4REPCFqkaMi75Lyg7XweGaO6xzchVTQ+4uYt
	A3vGvrD+gw9kauXkk8KtqD41mF5ClNnn3DCPHmYv2MgAu/ncCeCUH/4xaLYEQ+ODfnt+
	OMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fucvsr+wqJOGbsxejpmGIrDDFcKoVRF0T93URtWjrUU=;
	b=DXvm7Xcs4rEJJQHw8sfPHmdpbRhrzyOOQOxzuiApRF+QlEjGP58n+tLC30pAT5FPyt
	NmSLjvpDeoKexeUuSJBvKASAKJoe+U1LwY5sHS1BaZIy52li3iODsuDN2/gY6P0jBjw4
	upb7fj6H9xKroTHZZLRP88fNi+06rb53AoDWGPFNrNz/JWWX/fysrIAnIm/nt1Bioy0b
	JfV7u++FMOx06ZokYVMsioAI79L+XDekCge44Hv0vAodTLFFt60WV1HRsF88YnTYpe8c
	XRsTBiPNse1qVbk8sSzUuz1JEsTKqUxIaMbOYlp4qAh7rbQxzdYp/zZKDf6kongOhZwS
	7ofg==
X-Gm-Message-State: AOUpUlGZs8Wxt91ddRWxPS238PH5uxYFBY44Xq2E9UWUceFlR62JfjrG
	aM2ic6yvQ4M/omgOywSkYhkDGUhFY7W9c6aiGFQ=
X-Google-Smtp-Source: AAOMgpdfTFhFmI6nYLOD8DnXRTakjyJmruyeYcNqLBsYW9/CZxjAbF5PgK5rcytizx3vKC+szO6fadolo9EwA+u62E0=
X-Received: by 2002:ab0:5c9:: with SMTP id e67-v6mr5732493uae.66.1532725510856;
	Fri, 27 Jul 2018 14:05:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Fri, 27 Jul 2018 14:05:10 -0700 (PDT)
In-Reply-To: <084d0ef1bd4047859ed68d8e90d3321d@XBOX02.axis.com>
References: <20180723190928.27368-1-raj.khem@gmail.com>
	<f8b662f7-28e8-9692-5cd7-36faadc6e45a@windriver.com>
	<CAMKF1spfo0rTE31BiCuYPZuR2GQ=U4i9LBGkQ_r3HQdZf4udsQ@mail.gmail.com>
	<084d0ef1bd4047859ed68d8e90d3321d@XBOX02.axis.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 27 Jul 2018 14:05:10 -0700
Message-ID: <CAJ86T=Uiik+_s3f+qp1PK6tT3_fts9An8h4CyUfvywfGvj=vqw@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] defaultsetup.conf: Enable security flags+pie by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 21:05:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 27, 2018 at 1:49 PM, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
>> Sent: den 24 juli 2018 16:12
>> To: ChenQi <Qi.Chen@windriver.com>
>> Cc: Patches and discussions about the oe-core layer <openembedded-
>> core@lists.openembedded.org>
>> Subject: Re: [OE-core] [PATCH] defaultsetup.conf: Enable security
>> flags+pie by default
>>
>> On Tue, Jul 24, 2018 at 12:30 AM ChenQi <Qi.Chen@windriver.com> wrote:
>> >
>> > Hi Khem,
>> >
>> > The comments in security-flags.inc also needs to be modified to
>> remove
>> > 'poky-lsb' info.
>> >
>> > I'd suggest we still put it into distro conf file (poky.conf) instead
>> of
>> > defaultsetup.conf, because defaultsetup.conf is included by
>> > bitbake.conf. I think things in defaultsetup.conf should be necessary
>> > default values to build things out. I don't think security flags is
>> > necessary to build things out.
>>
>> this is the default setup, even non-poky users will get consistent
>> experience.
>
> I have to agree with Chen here. I think requiring security_flags.inc from
> defaultsetup.conf is the wrong thing to do. We use security_flags.inc in
> our setup, and I know how much trouble it has brought. To me, using it
> should be a distro decision, not something that is enforced by the use
> of bitbake.

The current approach taken by security_flags.inc is basically to
enable every possible option related to security. Some of these
options cause trouble and but some are trouble free... and
unfortunately up to now we've lumped them all in together.

If we enable security related flags by default it would be better to
do so step by step - starting with the smallest and least risky change
and (for now) leaving the rest for distros who want/need them.

ie I agree that enabling the current security_flags.inc by default
isn't the right approach.


>> > Also, I got a question when I just looked at this file.
>> > Do you think we should adjust CFLAGS and LDFALGS in security_flags.inc
>> > instead of the current TARGET_CC_ARCH and TARGET_LDFLAGS?
>>
>> in many cases packages do not honor CFLAGS/LDFLAGS say during configure
>>
>> > We are naming
>> > variables to SECURITY_CFLAGS and SECURITY_LDFLAGS, it seems that they
>> > belong to CFLAGS and LDFLAGS naturally. But I'm not sure about it.
>> >
>> yes they do, but this makes it easy to override the setting for
>> packages where these options are needed to be overridden or modified.
>
> Actually, with the changes introduced in Pyro, SECURITY_CFLAGS became a
> mess. Before Pyro, you either set SECURITY_CFLAGS to
> "${SECURITY_NO_PIE_CFLAGS}" (to disable the use of -fpie), or you set it
> to the empty string (to disable all security options). With Pyro and later,
> you instead have to set SECURITY_CFLAGS to "${SECURITY_NO_PIE_CFLAGS}
> ${SECURITY_NOPIE_CFLAGS}" to make sure -fpie is disabled, or set it to
> "${SECURITY_NOPIE_CFLAGS}" to disable everything. Alternatively you can
> set SECURITY_PIE_CFLAGS to "${SECURITY_NOPIE_CFLAGS}" to only disable
> -fpie.
>
> I have considered to suggest changing the definition of
> SECURITY_NOPIE_CFLAGS to:
>
> SECURITY_NOPIE_CFLAGS ?= "${@'-no-pie -fno-PIE' if '${GCCPIE}' else ''}"
>
> and then change SECURITY_NO_PIE_CFLAGS to:
>
> SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${SECURITY_NOPIE_CFLAGS} ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>
> That would better have matched the situation before Pyro, in that one yet
> again would set SECURITY_CFLAGS to "${SECURITY_NO_PIE_CFLAGS}" to disable
> -fpie. Unfortunately one would still have to set SECURITY_CFLAGS to
> "${SECURITY_NOPIE_CFLAGS}" to disable everything.
>
>> > Best Regards,
>> > Chen Qi
>> >
>> >
>> > On 07/24/2018 03:09 AM, Khem Raj wrote:
>> > > This has been an opt-in for so long, some distributions e.g.
>> > > poky-lsb uses it by default however, since most of linux
>> > > distros have started to default to these settings for security
>> > > enhancements, time has come for OE to make it default too
>> > >
>> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > ---
>> > >   meta/conf/distro/defaultsetup.conf | 1 +
>> > >   1 file changed, 1 insertion(+)
>> > >
>> > > diff --git a/meta/conf/distro/defaultsetup.conf
>> b/meta/conf/distro/defaultsetup.conf
>> > > index ca2f9178d2..352e279596 100644
>> > > --- a/meta/conf/distro/defaultsetup.conf
>> > > +++ b/meta/conf/distro/defaultsetup.conf
>> > > @@ -1,6 +1,7 @@
>> > >   include conf/distro/include/default-providers.inc
>> > >   include conf/distro/include/default-versions.inc
>> > >   include conf/distro/include/default-distrovars.inc
>> > > +require conf/distro/include/security_flags.inc
>> > >   include conf/distro/include/world-broken.inc
>> > >
>> > >   TCMODE ?= "default"
>
> //Peter
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

