Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE44DC3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 19:51:35 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.5230.1746647493531708569
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 12:51:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WMDLQyal;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6065803ef35so81507eaf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 12:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746647493; x=1747252293; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jtiPZFog/nSHTmcac0hc+10TPZ0bdhAuNHoZN+rz0k=;
        b=WMDLQyal+Ox7NQyMUOBxbG8MEYtPt8Z9bJ5nDC+gUsko+im1/vdsLoHz+hu1GnSD7x
         mPWLWkaCdaOHixZrr6qkajrlmmj7AnvZ5VnU7SbCsun6P6iSTR45oIwD1bZEo1p+Xvxw
         xTSW9PyEsPh9rOFu297T5NdtVixZRhwlHCdj9+cdV51krpuVTPJiV7TRvTMP2I0QPwTP
         SP/w3voihF+GJyujgLXbP8xVv2v2Fm7902ETajRukuSWNLWQerXfIN7Fb8p9CP7s1GEG
         2H02fTgcydjp+MxQSi7ndbXGphxToZ1taZU1889xGFWDmC6mkoSpih6pX40HMbEOX3PA
         XhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746647493; x=1747252293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jtiPZFog/nSHTmcac0hc+10TPZ0bdhAuNHoZN+rz0k=;
        b=NPRiqbL8mXAxeratHVH7LkvGfqbhYqeG6y7Q6bky7oAAasjSR4ohQ0ofhuMJUSaivR
         gSu6fxuZKRfBkQ06iDhzxD+lWyOfrjesvOnyQb1+WutoMW8lRj7tUGQK4mA1ep+YM372
         vXZpPq3xZ41rGDUYyQP0iubYD83QRcSCNSD5338XHOYECFMC8OffUUrIExv03whiCNcu
         MH6rZujHx6G2j5A7IiYdedR50JbGkx+ybk3/BwuE8KCnurxtyHzEnr3FqMdxxfoiGaAB
         3JqUtEp8dJs90WpnxvJEm0p4joLIJPzIddO63yI9ASNHWwYTcA2lHCoMHrRU9ln5lhSl
         iyfw==
X-Forwarded-Encrypted: i=1; AJvYcCWMLOXiSpSG9jQvVp2V6qT33VZMIoAyiRqGpNJ1GtTV8kCl8BgkVr0kDy7NrVpxzGqzGCbX8135WkGdW0z18KoDGQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzDblOeFNIwFWswRXhtdqK46HCY/oSBI1IiWPVlFW19nbpwYFCc
	bjhV9vYscsXDDiEoKUq+48UcaNUaxFFC/D1MNgriLDNCRtnzBh51VBgCsNBc8hpo+y+U7ZhtGvT
	O/pBUcZcvddS/IbaaWcQtQ0c2Mew=
X-Gm-Gg: ASbGncvyurtUX7BSVzzPXUOnnaNdPYr/mUhcRVv93UR4y0UgeGzs0LH59Wt0VH+jTOt
	RwobZZxZ47ltZdQvlSdyckEO9WODkVIErNZSfWYE8Q/yheEueHAvWUo+KvIQg5d5mJrEvpRqoPH
	8UZkYGJp/3eTlxvSSGJtCEYRmI2lsu07hEEc7hgOM1uk17Fx5cqw==
X-Google-Smtp-Source: AGHT+IHO9yPTgF/R4A16dRsqxy1lGU2ec1SFksrZ5PTgxE+M2n/mtzsw8ZwSt1vE5vOK00I5SY8/aBKfpqMnq8yfkDE=
X-Received: by 2002:a05:6820:1a05:b0:606:8671:1b28 with SMTP id
 006d021491bc7-60828d190bbmr2959432eaf.4.1746647492723; Wed, 07 May 2025
 12:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org> <aBtspIFmf7KoIZ_7@nuoska>
 <20250507182924.GA700@localhost> <B699294E-FA19-495C-9DFF-68AB3502240E@arm.com>
 <CAMKF1sq6ttpUeRCsSY9WbY8hixTkhaCOB61u6AB-=xVqhTVn+g@mail.gmail.com>
 <20250507190449.GA7882@localhost> <20250507191029.GA24048@localhost>
In-Reply-To: <20250507191029.GA24048@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 May 2025 12:51:07 -0700
X-Gm-Features: ATxdqUHMlbp85nllxmojuFILzGH0LtDGatVhKqWKhvi676MQ2tzohxTWWsQGB14
Message-ID: <CAMKF1spNPzDNxVkKAMKjbaC=xSRjTYfz2KVDRZwhpFBxC5U=dg@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Trevor Woerner <twoerner@gmail.com>
Cc: Ross Burton <Ross.Burton@arm.com>, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 19:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216133

On Wed, May 7, 2025 at 12:10=E2=80=AFPM Trevor Woerner <twoerner@gmail.com>=
 wrote:
>
> On Wed 2025-05-07 @ 03:04:49 PM, Trevor Woerner wrote:
> > On Wed 2025-05-07 @ 11:38:12 AM, Khem Raj wrote:
> > > On Wed, May 7, 2025 at 11:34=E2=80=AFAM Ross Burton <Ross.Burton@arm.=
com> wrote:
> > > >
> > > > On 7 May 2025, at 19:29, Trevor Woerner via lists.openembedded.org =
<twoerner=3Dgmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > > I stumbled across this build issue via a completely different rou=
te than most
> > > > > others, it seems, and certainly different than what you have desc=
ribed. I'm
> > > > > not using meta-security and I'm not using tpm2. Therefore your pa=
tch will do
> > > > > little to solve my build, and others will likely stumble across t=
his issue by
> > > > > other routes as well.
> > > >
> > > > For what it=E2=80=99s worth, we=E2=80=99re seeing this without meta=
-security too.  This needs to be worked around in core (personally, I=E2=80=
=99d remove =E2=80=94fatal-warnings from systemd until openssl includes the=
 GCS hints).
> > > >
> > >
> > > thats a bigger hammer, I would suggest to apply
> > > LDFLAGS:append:aarch64 =3D " -Wl,-z,gcs-report-dynamic=3Dnone"
> > > in systemd recipe in core
> >
> > If we want to make the hammer smaller, it's only triggered when:
> >
> >       PACKAGECONFIG:append:pn-systemd =3D " openssl"
> >
>
> diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-co=
re/systemd/systemd_257.5.bb
> index acf97517a94a..995b55580e4a 100644
> --- a/meta/recipes-core/systemd/systemd_257.5.bb
> +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> @@ -240,6 +240,7 @@ RESOLV_CONF ??=3D ""
>  # bpf-framework: pass the recipe-sysroot to the compiler used to build
>  # the eBPFs, so that it can find needed system includes in there.
>  CFLAGS:append =3D " --sysroot=3D${STAGING_DIR_TARGET}"
> +LDFLAGS:append:aarch64 =3D " ${@bb.utils.contains('PACKAGECONFIG', 'open=
ssl', '-Wl,-z,gcs-report-dynamic=3Dnone', '', d)}"
>

LGTM

>  EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
>                    -Dnobody-group=3Dnogroup \
>

