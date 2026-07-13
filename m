Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C13DEC43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 13:04:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10344.1783947860823074538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 06:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b1JgRw28;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493e497643fso18725545e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 06:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783947859; x=1784552659; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KypYk+CBsuiZ7ocLdOlpa17gvBhqte7/+3tahVbRUio=;
        b=b1JgRw28X7p8rwZOmi3AWUpgxD7uYCCLGRS4MnEj2xI5sGPObjPMNCq66jMbOrIrXl
         JAz/czv9uvLHtdSteegvJbC2IBmUiGLNif3ljiYwrt6geyJATxfLttpnpA7aC+1HRkpY
         uAZPioIyDx6XBAq/It4qCiIoYsupEnPN9wS4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947859; x=1784552659;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KypYk+CBsuiZ7ocLdOlpa17gvBhqte7/+3tahVbRUio=;
        b=P04O7hFJUwmSnT9qMuSfmgNOBVTrErwli0e95t6UHGPg7s4FVBgjiaJ5o4J0NONZkE
         e9WgwCF9whIHx1Fsi5rix7POiatNSH/FDZP9CTvd5yvB8dU04C54MA/AK9Wy2lMjH9Sc
         UZ54KLsbf6EVKr251Qlw+5XgSOeHHQ3kBxGZZPeuBPVeCrCmNP+kNeQPANHQzXiaj9b8
         HBaJ7d/Hwm0tqDNYL1b91+QNBAX+zC3J9SFy4lXtoHmQJ9msqWgH9EoQrhflD7Bb9JFA
         tMmh8jn30n7Q9A+Jrih4NorY7Ur1sGMMlIHzSktVhxw6Z6PQgkE4M8k06ZQXVRoDrsZ5
         j1Yw==
X-Gm-Message-State: AOJu0YwMH9zKMYu9eibtSgypxGaqJqLyVkNVRSNdlvjrP6uKKUKBXBdp
	kS8hoRYA5OYwpjOJxflQgUr7O6Uv249mK5iN5Pd49mEuMCjf4aDB/0Hwacm6L9doqrw=
X-Gm-Gg: AfdE7ckeS2EGhQI+dfN2qiFiZkfRdTgquFi4IKmfeugojd/7FoVLxsmGTGNJ612Wksk
	GfBxoQBqd4hXsITiSea/ZjW5bA8wsdL2B/pWLkCBPkCkHlgElwaLVFpvQl4sOv3steNUsBe1qOD
	Xzf79UM18tXX91KXXNfdAJyBpHr9jysKEGe3+KEdBm4G/c1E4zycg7cDY7RL6OTRywgwtD7Hk31
	YO0To9elsP7HEMNPoSQ3P2LiIM1jaQ4HcOiHIhqE7SIbh2unmJMEHXe0YKjW5W1UfDfPhxSmoXL
	0ifYKSVLb6Gl8xcscg0nlPdVsomyZU5xQhvRTRcyQsNni+IsHXXQB8/Q8Jnd9cHGBowPBrfXvV1
	ykt304ehTbe7ugbUcM3XMqu8uqlhrg0MicvLIPnrmrx5hNGkJP1YCFMIBjyFwb1tKRjORkYW9Rq
	tvBHvlt8l3uvGkqUn5WA05ZWje7y0lmIYR2Nn8g1Ypcz/XdjYWkM2LVk3znowWAm13/etAr0hez
	tH7gg==
X-Received: by 2002:a05:600c:297:b0:493:f138:890a with SMTP id 5b1f17b1804b1-493f88286f1mr65859935e9.29.1783947858997;
        Mon, 13 Jul 2026 06:04:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2d44:2cca:8708:eb73? ([2001:8b0:aba:5f3c:2d44:2cca:8708:eb73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960816sm82657151f8f.29.2026.07.13.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:04:18 -0700 (PDT)
Message-ID: <66e5559efca9e344b2867e5f926a3b8c7562ed5c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] os-release: set BUILD_ID vardepsexclude with
 weak assignment
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2026 14:04:17 +0100
In-Reply-To: <CADWMC-YkzqJtq0bD2sopb9-GDXP-5DQ31TWvyYo8YqHttSmZYQ@mail.gmail.com>
References: <20260710155721.214588-1-jose.quaresma@oss.qualcomm.com>
	 <2b430032b2f96e187381d0c7d530b0c6f04426ab.camel@linuxfoundation.org>
	 <CADWMC-YkzqJtq0bD2sopb9-GDXP-5DQ31TWvyYo8YqHttSmZYQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 13:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240840

On Mon, 2026-07-13 at 12:32 +0100, Jose Quaresma wrote:
> On Sat, Jul 11, 2026 at 9:38=E2=80=AFPM Richard Purdie <richard.purdie@li=
nuxfoundation.org> wrote:
> > On Fri, 2026-07-10 at 16:57 +0100, Jose Quaresma via lists.openembedded=
.org wrote:
> > > BUILD_ID is defined using a weak assignment so that we can modify it
> > > externally. However, if we do it, we also need to do the same thing
> > > for BUILD_ID[vardepsexclude] with the new value we assigned to
> > > BUILD_ID.
> > >=20
> > > Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> > > ---
> > > =C2=A0meta/recipes-core/os-release/os-release.bb | 2 +-
> > > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipe=
s-core/os-release/os-release.bb
> > > index e1906d05d8..bbbf9e3e11 100644
> > > --- a/meta/recipes-core/os-release/os-release.bb
> > > +++ b/meta/recipes-core/os-release/os-release.bb
> > > @@ -41,7 +41,7 @@ CPE_DISTRO ??=3D "${DISTRO}"
> > > =C2=A0CPE_NAME =3D "cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"
> > > =C2=A0
> > > =C2=A0BUILD_ID ?=3D "${DATETIME}"
> > > -BUILD_ID[vardepsexclude] =3D "DATETIME"
> > > +BUILD_ID[vardepsexclude] ?=3D "DATETIME"
> > > =C2=A0
> >=20
> > I'm a bit surprised you can't just append to it and leave DATETIME in
> > there regardless of whether it is still used or not...
> >=20
>=20
>=20
> I can't use '+=3D' in my conf/local.conf because '=3D' on the recipe has =
precedence.
> I also can't use the 'append' because it doesn't work with flags.
>=20
> I guess I only have the chance to use os-release.bbappend left.
> However, to maintain the layer YP compatible, I need to use an override,
> and this implies the use of another variable.
>=20
> MY_BUILD_ID =3D "my-build-id"
>=20
> MY_BUILD_ID_AUX:override =3D "${MY_BUILD_ID}"
> BUILD_ID =3D "${MY_BUILD_ID_AUX}"
> BUILD_ID[vardepsexclude] +=3D "MY_BUILD_ID_AUX"
>=20
> However, I didn't want to have this in a bbappend because it's not very e=
legant
> and this is mostly meant to be used only in CI.
>=20
> There might be another way to do this, but I don't see how without using =
the=C2=A0weak assignment.

You're right and I was just thinking about this from quite the right
perspective, sorry! :)

Cheers,

Richard

