Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E31CC07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 07:22:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.7622.1664436114047463000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gs2Tg7+I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id cc5so722630wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 00:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=FI0NqI5kY20FqNDfmeMRcxTIT/JBDnOZq8ruf2r5708=;
        b=gs2Tg7+IUVrmyh8QRsmud++pvk83Z8zUvomqJpDsk1K+C7HE+Q6iVn+MuxBwU54v8i
         YX8sYltXV6IknWDOeMH6ZwSl2VQZB3auh0OIciai0PEomPEg/Q1qbJ4zsXP+stDuE0m/
         107SB6RgVeiFtpjfLYtXe2Opbzo9NIK6yR7Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=FI0NqI5kY20FqNDfmeMRcxTIT/JBDnOZq8ruf2r5708=;
        b=FXC544GkcgA+S3enrQpyqevagsAHlc45xLloBxXEYBqwdHFwqUlnhgJ70jX3Hz5Ilq
         slMei3/5zjN3NLbxnNM8sCB5P/4yCH0UrBKgUm7rI/vYmILa1BmvEb7mhIYzIqNYROBx
         7x8RJnoI4PGfNG7n+tqqEAiNZ2AJzlbz9VXunagVbeaNhPeMIC78AAsYd/RgxSx6aMHI
         zmY8tmyVtckmzwogRo15mxcYI2djBLyYeYQglDjWF9g7ww7QA86G653dzBNc2v4mx92h
         gXK4+SRxrST7zkOB/hOJLmY7/uVvP0vumtWyucI8sogXQXLi8dK7SLX0BnSjkiry70uw
         aOmA==
X-Gm-Message-State: ACrzQf0/PaJ/Qvq2UzJUZTpbeSCO91Rmjj0TLvlxpqZ4r0oqQJOfdJaf
	ywZaosQfrq+HrJ50i4LhBccNcQ==
X-Google-Smtp-Source: 
 AMsMyM6O71KqiXaB8N3kdCjwHxFzHfhmm36wjeZey1VaAkXvnP+QLWO/R3napiTxX0iqNxtYihTk5A==
X-Received: by 2002:a05:6000:681:b0:22a:3007:df45 with SMTP id
 bo1-20020a056000068100b0022a3007df45mr1042393wrb.149.1664436112404;
        Thu, 29 Sep 2022 00:21:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6fd0:d3d3:fcc6:1fd6?
 ([2001:8b0:aba:5f3c:6fd0:d3d3:fcc6:1fd6])
        by smtp.gmail.com with ESMTPSA id
 r7-20020adfda47000000b0021e51c039c5sm5885417wrl.80.2022.09.29.00.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 00:21:51 -0700 (PDT)
Message-ID: 
 <1620d3dd34b47355420bbeb741c06adbe88bacfa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: apply override toolchain-clang last
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, Ross.Burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2022 08:21:50 +0100
In-Reply-To: <4d4f1917-774d-6049-7728-dfce114769f0@windriver.com>
References: <20220929033210.13292-1-kai.kang@windriver.com>
	 <52f69af19ea8a1876dab73ce1bebc795f71d4ab3.camel@linuxfoundation.org>
	 <4d4f1917-774d-6049-7728-dfce114769f0@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 07:22:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171171

On Thu, 2022-09-29 at 15:13 +0800, kai wrote:
> On 9/29/22 14:49, Richard Purdie wrote:
> > On Thu, 2022-09-29 at 11:32 +0800, kai wrote:
> > > From: Kai Kang <kai.kang@windriver.com>
> > >=20
> > > It disables gprofng for toolchain clang, so it should clear GPROFNG_A=
LTS
> > > when clang is used. But override 'toolchain-clang' is applied before
> > > overrides 'TRANSLATED_TARGET_ARCH' such as x86-64, then GPROFNG_ALTS =
is
> > > still set and not cleared. Append 'forcevariable' to apply it last th=
en
> > > make it work as expected.
> > >=20
> > > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > > ---
> > >   meta/recipes-devtools/binutils/binutils.inc | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recip=
es-devtools/binutils/binutils.inc
> > > index 4dde387a8a..c7113f8a1f 100644
> > > --- a/meta/recipes-devtools/binutils/binutils.inc
> > > +++ b/meta/recipes-devtools/binutils/binutils.inc
> > > @@ -50,7 +50,7 @@ GPROFNG_ALTS:x86-64 =3D "${GPROFNGS}"
> > >   GPROFNG_ALTS:aarch64 =3D "${GPROFNGS}"
> > >  =20
> > >   # it disables gprofng for clang and musl in the bb file
> > > -GPROFNG_ALTS:toolchain-clang =3D ""
> > > +GPROFNG_ALTS:toolchain-clang:forcevariable =3D ""
> > >   GPROFNG_ALTS:libc-musl =3D ""
> > >  =20
> > >   LDGOLD_ALTS ?=3D "ld.gold dwp"
> > I've never wanted to see forcevariable used in layers, it is really
> > there as a last resort for end users. There must be some other way we
> > can arrange this?
>=20
> It could clear GPROFNG_ALTS for toolchain-clang in python anonymous=20
> function. I'll send for review.

GPROFNG:toolchain-clang =3D ""

might work?

Cheers,

Richard


