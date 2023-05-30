Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4985AC77B73
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:31:06 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.896.1685482257283561000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 14:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=e0Yt69ix;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30af159b433so2082339f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685482256; x=1688074256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=COoQtdnbG0w9O2H5P2ZLoJwS2LkoCLKVwFW6gYhIswU=;
        b=e0Yt69ix34o6tPLYVhHNL0JjS6U43VIBRXgdmY6ppgYDwyX/MkWP9BXzHZX688Suc1
         R1gJFckPCSO9vi2ywel4we24HC+EO+sKRmBP4vyE4p8ox23zDnhR9kz8RbfB3g97Vhv+
         0kakiiUTgi+xnpUmQ1CAMAnzPgieuVYZPcMtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685482256; x=1688074256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=COoQtdnbG0w9O2H5P2ZLoJwS2LkoCLKVwFW6gYhIswU=;
        b=BmCIWHZVEXZ6blghOIaFavN8BBW7Es5EdJZi/AZgFHTGctBL/u+xiA2qi9MhL7Z5Ze
         lzR99hd1bv5IMA9viK9TqSQmAt1NDbaXKRj2P6U8vWEt83+v8cxqO3DzXLqkJCO7ryZ5
         fKzbRwtrk97VZg4FDlTczMPeVc3p1ZH52/t23rLAvFmUZtsKPFpK10kS8A9O6SA4cK4G
         6WOUE26xQY5Vx5zeJpHWQqyIO30/gwwJ7s2FLRJiZ9Qz5UpMDg71GNg2IZrnokhU6c4J
         +tYCPAj00yweiX+dXoLlLwYqSV6tV7lsvOInR5VJklhkbt3KdT9R3b4aKOIs108z5VCe
         8P/A==
X-Gm-Message-State: AC+VfDy5425Ccpu26zZcEkilaZ4P0BXl2oPeEkx1puyeC4RXRK5iuvtu
	s/0yWqlgL01sjNLS1mfB19qy0dhhgnadPW4wdfc=
X-Google-Smtp-Source: ACHHUZ74g+ZbDcF2O92HjG380MpoRgmTTJHtnqG/m+5R8gwYqSWJUEp3JpkX0k4hTF92D1o+184tSQ==
X-Received: by 2002:adf:df12:0:b0:307:9473:fe26 with SMTP id y18-20020adfdf12000000b003079473fe26mr2698892wrl.26.1685482255741;
        Tue, 30 May 2023 14:30:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422? ([2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d63ca000000b002c70ce264bfsm4430630wrw.76.2023.05.30.14.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 14:30:55 -0700 (PDT)
Message-ID: <ef0bb20cfd481f73e5958233e487067b02da1e4b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/package: mark PKGDATA_VARS as a
 dependency of emit_pkgdata
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2023 22:30:54 +0100
In-Reply-To: <CAJdd5GbHuoJFe8BbvjUbG=iPmedYtJTgOx-fyNu86zms+gDeeQ@mail.gmail.com>
References: <20230530204117.949199-1-JPEWhacker@gmail.com>
	 <bf7d98b4ee31c416072db5437da44ce7a4c0f841.camel@linuxfoundation.org>
	 <CAJdd5GbHuoJFe8BbvjUbG=iPmedYtJTgOx-fyNu86zms+gDeeQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 21:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181955

On Tue, 2023-05-30 at 16:25 -0500, Joshua Watt wrote:
> On Tue, May 30, 2023 at 4:23=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2023-05-30 at 15:41 -0500, Joshua Watt wrote:
> > > emit_pkgdata needs to re-run when PKGDATA_VARS changes, but bitbake i=
s
> > > unaware of this because the code that uses it is in a python library.
> > > Fix this by explicitly marking PKGDATA_VARS as a dependency
> > >=20
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  meta/classes-global/package.bbclass | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/classes-global/package.bbclass b/meta/classes-globa=
l/package.bbclass
> > > index e8055a9cdc5..c466601266e 100644
> > > --- a/meta/classes-global/package.bbclass
> > > +++ b/meta/classes-global/package.bbclass
> > > @@ -381,6 +381,7 @@ python emit_pkgdata() {
> > >      import oe.packagedata
> > >      oe.packagedata.emit_pkgdata(pkgfiles, d)
> > >  }
> > > +emit_pkgdata[vardeps] +=3D "PKGDATA_VARS"
> > >  emit_pkgdata[dirs] =3D "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtim=
e-reverse ${PKGDESTWORK}/runtime-rprovides ${PKGDESTWORK}/extended"
> > >=20
> > >  ldconfig_postinst_fragment() {
> >=20
> > Is the auto dependency code somehow breaking for that function?
>=20
> It empirically seemed to not re-run the functions when I changed that
> variable as part of a (now abandoned) way to fix the SPDX builds.
>=20
> I thought the code scanner didn't go into library functions; or am I
> mistaken there?

That used to be the case but I added:

https://git.yoctoproject.org/poky/commit/bitbake/lib?id=3Df3bcd3c9a91f6212c=
30b9c778c11f3c8a9f6f1d4
and then:
https://git.yoctoproject.org/poky/commit/bitbake/lib?id=3D2b406a3174b8142b1=
ae00e6cff4af43317a78f94

so it should auto-detect dependencies.

It is certainly possible something isn't working but I'd like to
understand what...

Cheers,

Richard

