Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18048C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 14:35:40 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.38274.1699886130847016455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 06:35:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Aw1l6liw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.182, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2c79d8b67f3so46115021fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 06:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699886129; x=1700490929; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NvwYjykIvzJAutdGXVBrFc3FCJvfmPWx+DUbdKD2/dI=;
        b=Aw1l6liwz6//Ijv0eMDNecFcghhTjLxgygya2rvqZweqrhAhbEyQRa6Kny1VjbGjtu
         x7vqT+tgg4wmC1DtRjSPBAGVDTfeKg9BNdW1nUCfmQed8FLzo/oroixZBfSQQqppl4SQ
         BWRHFu72prSgG0WyGzin5IUeWBgVmkfcA9220=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699886129; x=1700490929;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NvwYjykIvzJAutdGXVBrFc3FCJvfmPWx+DUbdKD2/dI=;
        b=aCOpYKla0Ed9f/+WoTve3+JJmwzMoMMZh102vX84DfMgpIzXnGAf0uRzRq8cAhq6qO
         ow0JXp7k/QsBX3QrP+QU64jx7JTShRRmM0g3nzxhvBtE49SH6elYsOeWED2T3K8NDBz6
         BSDDtcf69tMJxo24nRjLJAwvEIlcjOghg6nQzo1oGfuFSctqv3r69wftBXtc85lERGyO
         /JY3bKxeyYJiQ/TAXaqWhuDEbm02euglC4mCXIFFLUrR+Lm7v4I5KIgvhfyvqUZEvmFb
         +0mTyNbs8S15epySxv3ouAS+I7fliChK1v/a6EJwt5QjYyXzIanVn+jWzCDmtqCHWDj8
         XQPQ==
X-Gm-Message-State: AOJu0Yxm8g/G2PtjbQiEVWmUuWGo+24Y82YBF7J5XpE4vLRjO/ZeqkPS
	p6PybmqYVmiX8MZ6+vV9BvJj4LuhTiRFZ8WrxcU=
X-Google-Smtp-Source: AGHT+IHNnaF8X/3KhAljpjA9VAZCXQJ8vQrHBa3zDTmMAH8RbizpAncUvsLlz16PLQT4z+yUKfeZiw==
X-Received: by 2002:a05:651c:81:b0:2c8:33a6:4df4 with SMTP id 1-20020a05651c008100b002c833a64df4mr4362021ljq.38.1699886128084;
        Mon, 13 Nov 2023 06:35:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f440:7406:36f8:870a? ([2001:8b0:aba:5f3c:f440:7406:36f8:870a])
        by smtp.gmail.com with ESMTPSA id o20-20020a05600c511400b004042dbb8925sm14175745wms.38.2023.11.13.06.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:35:27 -0800 (PST)
Message-ID: <f9a35fe25b224428bd2bb5400ea96efe87f70a17.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 15/15] lz4: specify gnu17 in CFLAGS to fix
 reproducibility issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2023 14:35:26 +0000
In-Reply-To: <CAOSpxdZ6CHz=PfNb19RmuagChYoBNUu1H_FX-5qwOm62PTdEmg@mail.gmail.com>
References: <cover.1699714834.git.steve@sakoman.com>
	 <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
	 <9d7f39468c47e3ce9f15729562cd69f74b064f15.camel@linuxfoundation.org>
	 <CAOSpxdZ6CHz=PfNb19RmuagChYoBNUu1H_FX-5qwOm62PTdEmg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 14:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190476

On Mon, 2023-11-13 at 04:14 -1000, Steve Sakoman wrote:
> On Mon, Nov 13, 2023 at 3:42=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Sat, 2023-11-11 at 05:03 -1000, Steve Sakoman wrote:
> > > We are seeing reproducibility issues where gcc-cross sometimes defaul=
ts
> > > to gnu11 and other times to gnu17.
> > >=20
> > > Specify std=3Dgnu17 rather than leave this to chance.
> > >=20
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-support/lz4/lz4_1.9.2.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-sup=
port/lz4/lz4_1.9.2.bb
> > > index c2e24b518c..8cf71fdc04 100644
> > > --- a/meta/recipes-support/lz4/lz4_1.9.2.bb
> > > +++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
> > > @@ -23,6 +23,7 @@ S =3D "${WORKDIR}/git"
> > >  # Fixed in r118, which is larger than the current version.
> > >  CVE_CHECK_WHITELIST +=3D "CVE-2014-4715"
> > >=20
> > > +CFLAGS_append =3D " -std=3Dgnu17"
> > >  EXTRA_OEMAKE =3D "PREFIX=3D${prefix} CC=3D'${CC}' CFLAGS=3D'${CFLAGS=
}' DESTDIR=3D${D} LIBDIR=3D${libdir} INCLUDEDIR=3D${includedir} BUILD_STATI=
C=3Dno"
> > >=20
> > >  do_install() {
> >=20
> > I've looked into this a lot more and I'm now of the opinion this is
> > totally wrong and definitely should not merge.
> >=20
> > An example failure is:
> >=20
> > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231109-ch7=
3ktqp/packages/diff-html/
> >=20
> > First, it is worth noting the huge size difference. It appears debug
> > line information is being missed out. The difference in cflags is a
> > false lead, it is because crti.S is compiled with c17 and the producer
> > string is being mis-compared, the data is missing on one side.
> >=20
> > So what we're looking for really is a cflags issue where -g is going
> > missing.
> >=20
> > I did check older failures which look similar:
> >=20
> > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231105-_xp=
b575y/packages/diff-html/
> >=20
> > Since we're looking for cflags issues:
> >=20
> > https://github.com/lz4/lz4/commit/7d8d1075e696d585238e6aa6a4f43dc759da2=
50e
> >=20
> > looks interesting and leads to:
> >=20
> > https://savannah.gnu.org/bugs/?func=3Ddetailitem&item_id=3D59230
> >=20
> > If the makefile had intermittently picked up CFLAGS from the
> > environment, the output would be identical to the previous cflags patch
> > in the series, which would cross link the hash equivalence
> > inputs/outputs and could generally confuse things.
>=20
> Thanks for looking into this!  I will remove the patch from the series.
>=20
> > The real question is which autobuilder worker is compiling without the
> > -g option and is it a make bug? Perhaps it doesn't matter and we just
> > need to force the input and output hashes to change to stop the errors
> > once the previous patch is applied.
>=20
> What is the proper way to force the input and output hashes to change?
>=20
> Thanks again!

https://git.yoctoproject.org/poky/commit/?id=3Dad3dfac07f856917434deb073fe9=
c8a788d4c21d

is an example.

Cheers,

Richard


