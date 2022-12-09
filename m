Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F28DC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 12:35:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.461.1670589307783520866
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 04:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T8gPtAfu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id v7so3492152wmn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 04:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cpUqQ7VR2EURMGDy+Rtw2L6qSZBFqjKE1bTAqVl5+/U=;
        b=T8gPtAfus2CS25n0AEsEkCEqq3B6o4aC0adnXJlh+2UMinmiu/gR9lvntdFhSAcRGD
         QjJ+p1ljRXnCVSz2ud5GoOIstGnapaHURKjyRN+TK4Oz/f7oVS3C8ULYxX5S0ZaMfH+j
         py3QyDWeyg4xXLeQW8S3/uq2sS8STMRJ6PjnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cpUqQ7VR2EURMGDy+Rtw2L6qSZBFqjKE1bTAqVl5+/U=;
        b=TJK44ymQxbSIz+E0xwAmZ35XCtKN9eA8F4u7jk3lMFVI2PhwmZwDxWuNIq5J1+9MMx
         QNZgcic2C2cpYekUGDWQHuco9rFKG8cAqChpXwWYsMtfl3YedLd21zlVVMnGb30VsBdh
         nzWDFHBmxXkHFE7qmZkth8JGxs3tbWCgd+IVaHiucvcxDSPmsBLKP8Rjjyt83dV86aCf
         hhqN/ziwnp8Ec8A3M12NGrsauATzMRkMwA4w+URomKjcQt+T+5Uqdtod8em1PPMCYcUm
         DVEdOq2ZLjfB8DsLRq71WvEnyClXt5JTwsPmiPu50YKpLdvdR2z3CX7OmbP1utnQr037
         5eBA==
X-Gm-Message-State: ANoB5pn8CuAyeHArU4ngqGo+O+bqcfQNH485821mVO5Zo72jJkp81A4m
	8morw3vCTpeuQY/yBC1FNmnxKA==
X-Google-Smtp-Source: AA0mqf5Wgssb5+Ff6+pdEaU6Oj0QCJMwImNJuPdLexj/2ZoX35y7XzUpwjCGorLRH5C129vq7tLdaQ==
X-Received: by 2002:a05:600c:502c:b0:3cf:900c:de6b with SMTP id n44-20020a05600c502c00b003cf900cde6bmr4946785wmr.15.1670589306165;
        Fri, 09 Dec 2022 04:35:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b77:8930:5aaa:e9c4? ([2001:8b0:aba:5f3c:9b77:8930:5aaa:e9c4])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c434700b003d1e34bcbb2sm1632233wme.13.2022.12.09.04.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 04:35:05 -0800 (PST)
Message-ID: <140d2e654275f7fc010231b13e4282bc485865e2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ola x Nilsson <ola.x.nilsson@axis.com>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 09 Dec 2022 12:35:04 +0000
In-Reply-To: <jwq5yekdg24.fsf@axis.com>
References: <20221208071136.1967696-1-olani@axis.com>
	 <20221208071136.1967696-4-olani@axis.com>
	 <08c1f279-d446-bc7c-f01d-4ebfb1da51d8@gmail.com> <jwq5yekdg24.fsf@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 12:35:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174448

On Fri, 2022-12-09 at 10:55 +0100, Ola x Nilsson wrote:
> On Fri, Dec 09 2022, Khem Raj wrote:
>=20
> > Thanks for the patches
> >=20
> > On 12/7/22 23:11, Ola x Nilsson wrote:
> > > Signed-off-by: Ola x Nilsson <olani@axis.com>
> > > ---
> > >   meta/conf/distro/time64.conf | 23 +++++++++++++++++++++++
> > >   1 file changed, 23 insertions(+)
> > >   create mode 100644 meta/conf/distro/time64.conf
> > >=20
> > > diff --git a/meta/conf/distro/time64.conf b/meta/conf/distro/time64.c=
onf
> > > new file mode 100644
> > > index 0000000000..99eb06dc0f
> > > --- /dev/null
> > > +++ b/meta/conf/distro/time64.conf
> > > @@ -0,0 +1,23 @@
> > > +GLIBC_64BIT_TIME_FLAGS =3D "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D=
64"
> > > +
> > > +# TODO: Only for 32-bit architectures?
> > > +TARGET_CC_ARCH:append:arm =3D " ${GLIBC_64BIT_TIME_FLAGS}"
> > > +TARGET_CC_ARCH:append:armeb =3D " ${GLIBC_64BIT_TIME_FLAGS}"
> > > +TARGET_CC_ARCH:append:mips32el =3D " ${GLIBC_64BIT_TIME_FLAGS}"
> >=20
> > We should enable it across all 32bit systems
> > something like
> >=20
> > TARGET_CC_ARCH +=3D "${@'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64' =
if=20
> > d.getVar('SITEINFO_BITS') =3D=3D '32' else ''}"
> >=20
> > would do it.
>=20
> I was looking for a way to identify 32-bit platforms but did not find
> SITEINFO_BITS.  I'll look into using that instead.
>=20
> > Also adding -D_LARGEFILE_SOURCE will ensure needed functions that LFS=
=20
> > needs is enabled as well, usually its automatically defined when=20
> > -D_GNU_SOURCE is set but that may not be case all the time.
>=20
> As far as I can tell, _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE are
> independent of _TIME_BITS=3D64 and _FILE_OFFSET_BITS=3D64 (while
> _TIME_BITS=3D64 requiress _FILE_OFFSET_BITS=3D64).
>=20
> I thought the _LARGEFILE* options were controlled by the largefile
> DISTRO_FEATURE but there seems to be some confusion about that.
>=20
> It looks like you (Khem) made largefile default instead of using the
> distro feature in all of the OE-core recipes, and the largefile distro
> feature is no longer mentioned in docs.  It is mentioned as removed in
> the transition notes.  But it is still in poky-tiny.conf and
> POKY_DEFAULT_DISTRO_FEATURES.  Probably an oversight?

Yes. I just sent a patch to remove that.

> I do not see the _LARGEFILE*_SOURCE options defined globally anywhere.
>=20
> Am I missing something?

We used to control configure largefile options with the distro feature,
now we just turn it on anywhere we need to unconditionally. I suspect
we rely on software configuring by default to it in some cases. It
would be good to check if it isn't being enabled anywhere and fix those
cases somehow. Not sure if we need global options or not.

Cheers,

Richard

