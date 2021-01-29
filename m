Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.2017.1611952773011363800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 12:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A9Wbi5/2;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id u4so10467712ljh.6
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 12:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ouAXQdl77Gf/YD65Av2Tsnzmrw3sVlhJD/hY0UIryog=;
        b=A9Wbi5/2nOLPaPFkINIlbQOitjdN3Vk3douiAaTITY+HdYLoOiWH8sPB8TKi1VxeMw
         pQUZgxti6L1LgEHWDhmUb1FQ7s2AtHTp37bj9c0NnGBRPXzMZ7bD6grcA9b6Zy1h3xkq
         Jj5n+MThcZ9sfZLsLiXSPZ22nj6beNK488bKuYc+359mNpa6Ma+uYmeoExJeuvC3+wE6
         6m0Tihk6r5e41OIyAbja4pnb6LNIbFTdDeopSJMTpBvyjxGu8/5VkC7qNDbo7+vhTH6q
         OVsAns2s8H8qcMp9iETDb13vA6qI+oUcRy3IsQaDZhncGQOWPzT6wzVN3sx5kQI2tTqP
         lFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ouAXQdl77Gf/YD65Av2Tsnzmrw3sVlhJD/hY0UIryog=;
        b=HlujWQJGzQz+wtOzINU5GD/EU1ERTaYbd1JU2tvd3HwkEUV40kx/XkFfzOoz+8uhe8
         ycw2drTeOaxafte3IjJYFP7TkDUfumCWJIt0VROwthkZiFzVw3z+j/BOi2Hc4ULem+Bb
         d1sLI6f7ipIxHoEF/4oH4aNy7KMIdE8xng/jZqYmcWJ4ytvCJ5TPewkgUuaflrMhQTFI
         99u/mh6fgRJ1gjbCenXiLrzTCr2wx43fqkHcNwfvTankLBGgoV+Cm5EK5P94WwqZm6Qk
         itWtO6UmwYjU3DPFz3ol+IYzmmQgVs/BT66aVGPbXqt8zSlawLaR0Tuouhjlpvwb+Od/
         hRVQ==
X-Gm-Message-State: AOAM533OCwH3M3mm8l5cdWY0L2oz1/3oxHWjFIHRUEMEto199EtnfMGX
	qkXSxUv//fTUdJhoYZ/gNOvqnm2qukhUtCjFMMM=
X-Google-Smtp-Source: ABdhPJz7BONhhbpPVSqQ6qsRfleILG2IBrbPHMWKQ/r//Juk79xR5xg6MDE10AhvWSOiPb51J7ctjmGXig2MPD11zuU=
X-Received: by 2002:a2e:b5aa:: with SMTP id f10mr3277673ljn.432.1611952771319;
 Fri, 29 Jan 2021 12:39:31 -0800 (PST)
MIME-Version: 1.0
References: <20210128213504.3821-1-tom.hochstein@nxp.com> <a525b7f9-c4d2-f28d-5be2-4d97590c9730@gmail.com>
 <DB6PR0102MB263003ABFF3E2D9FEE5E378988B99@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
In-Reply-To: <DB6PR0102MB263003ABFF3E2D9FEE5E378988B99@DB6PR0102MB2630.eurprd01.prod.exchangelabs.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 29 Jan 2021 12:39:19 -0800
Message-ID: <CAJ86T=X=GTOM5X4vgZ4ox4_q1Dy-Y4p0Nthy047GrJBdYJ_qcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [RFC] openssl: Enable cryptodev-linux by default
To: diego.santacruz@spinetix.com
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>, Tom Hochstein <tom.hochstein@nxp.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2021 at 12:34 AM Diego Santa Cruz via
lists.openembedded.org
<diego.santacruz=3Dspinetix.com@lists.openembedded.org> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Khem Raj via
> > lists.openembedded.org
> > Sent: 29 January 2021 02:16
> > To: Tom Hochstein <tom.hochstein@nxp.com>; openembedded-
> > core@lists.openembedded.org
> > Cc: otavio@ossystems.com.br
> > Subject: Re: [OE-core] [PATCH] [RFC] openssl: Enable cryptodev-linux by
> > default
> >
> >
> >
> > On 1/28/21 1:35 PM, Tom Hochstein wrote:
> > > This is a Request for Comment. Would it be a good idea to enable
> > cryptodev-linux
> > > by default, gaining hardware acceleration where supported? Are there =
any
> > > unacceptable drawbacks? What happens on hardware without
> > acceleration?
> > >
> >
> > this perhaps helps with devices that include a hardware crypto device
> > but not as much with one;s thats fine but we use qemu machines quite a
> > bit in testing so it would be good to get a readout on qemu secondly, i=
f
> > it does not, then maybe we should see if defining it via
> > MACHINE_FEATUREs might be an option to enable it.
>
> I think that making it a MACHINE_FEATURES would effectively make the task=
 signatures for openssl be machine dependent and that would also make all r=
ecipes which depend directly or indirectly on openssl (and there are a lot!=
) have their task signatures be machine dependent, so they would need to ha=
ve their PACKAGE_ARCH set to MACHINE_ARCH to avoid triggering spurious rebu=
ilds when switching between machines with and without cryptodev-linux in MA=
CHINE_FEATURES.
>
> So MACHINE_FEATURES does not look like a viable option, a DISTRO_FEATURES=
 might be, although it does not really look like a nice fit either.

MACHINE and DISTRO features are global variables which should be
reserved for configuration decisions which affect multiple recipes (so
that multiple recipes can be configured together under the control of
one option). It doesn't make much sense to create a new MACHINE or
DISTRO feature if it's only going to be used by one recipe.

If a distro or BSP layer wants to enable cryptodev-linux support in
openssl they can already do so by creating a .bbappend for openssl
which adds the PACKAGECONFIG. ie if we decide that the option should
be left disabled by default but controllable by the distro or BSP
layer then no further changes are required - we already have a fully
functional mechanism to do that.

Going back to the original question of whether cryptodev-linux should
be enabled by default, I would say no. It's very much the legacy
approach and in the absence of benchmarks to prove otherwise I doubt
it gives any advantage in performance on modern platforms (especially
CPUs with dedicated crypto instructions).
