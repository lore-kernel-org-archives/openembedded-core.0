Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2450109C022
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:25:57 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23933.1774448753002797085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 07:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UQQzENUO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66970715adbso7446356a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774448751; x=1775053551; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sLEZqDDKJL+2K6HqUrTuVs12+K1G3toYvs2lugR5PQk=;
        b=UQQzENUOukBr1A9UjJdI/mQSwUtA/254gyIZ8TONVZ49a1mvBZbNNEKDlGPZMAkDo2
         UFsr4XAjcqJcaEuAgov5K1GYMGvcSzoYpKLRuxwGZhLuMi3TNFYPgTJJkmN/k/cJd4uS
         yI4hmcJrggwMpf1qpYtQ7ZKcjzFz5RIJ/I3PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448751; x=1775053551;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLEZqDDKJL+2K6HqUrTuVs12+K1G3toYvs2lugR5PQk=;
        b=pcMeaSSAwqKEq426Sug8svoR6hvpifJCx3+gyl08Zy50IluMk+PTOYEH+D9wtO7p05
         9hc92ohFOJFOnCn+Cgm9OM/U3qNYfX0zAo93hCCXK/lXRsy7n22S5HwE0VOS/HZ0oHE5
         YQrYPWWrmziTnkQybXdmuzBfPoIFLsTP+4y8OKfry79R963lYHvQGvLtfM3Z7A6gZilN
         T8ITOa5lHU3KwsG2f/Ea27tIwZT7iH/lxOUsMKCHEHqhL4869reEu9lqBZHNGIGuifEA
         uLfH9nWUocmVatMZdXdx7hBVRFgCKyh7IH7prAVZ8FOG9H5EcnSjb6LvzOnZXdQx9AGe
         6IJw==
X-Gm-Message-State: AOJu0YxbH8qUTG0G3EVYXsR9f/xrKu9Ntxh3WTSOM87Jy8pg58TsxoZR
	B+kTYVzegDZcmXIxZ9Wbu37f+7k7P0/9dP+WizOP4WKM1zpv9TExU3mVjpuLhdGlAME=
X-Gm-Gg: ATEYQzyKe3e1FlWHEOXXwZ+sqb85qsdSF+T82YvFsIbEkWYaHeVxVSvtP77R36RY4aV
	MY3R3nd3jnvlGpSaxpNpKyj+XNSuybGVMUjcq2p2G0IkjxAJk4fgHN5Cy1lF8+q+uqTvr72MhcU
	pvzjuOQ93IpGrPCJ9328dgymLVJN8v3dw1BKkPAz+NoIFEdr6r43suL4x3dsGihzHiVD1yi9rfl
	SDPfixcEpCkwLcdAiZOTSZlE+UMBJo/pOOhvpSqVRdbplLmpRounN3fRHneoez2ckvu1/Nzh/7v
	goMMMYJMUboKXrSH91q+ecBJgXXf4IV6uReLAxAmsb+d0amzmmOGd8y/G2C2HiNQzmsclz15g7x
	mq4f/wtVqID1LXiARKyHVl3piAOiIvSGtqVc+7BtgJuK/NPVTMHLa6C9C7QSUGtGENPahUhOMkk
	hOUMKXD6a0xZQFMjUq7eqllArNvaQEiJgMahRPPdh4AkD9+40vKS+eaJiXxg9amI91u1GsTVG1Z
	ic3YNt7TGieL984
X-Received: by 2002:a17:906:134d:b0:b97:9099:7b3 with SMTP id a640c23a62f3a-b9a5429fdadmr176055566b.44.1774448750976;
        Wed, 25 Mar 2026 07:25:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:74e2:2425:51dc:4aed? ([2001:8b0:aba:5f3c:74e2:2425:51dc:4aed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833871003sm806109966b.54.2026.03.25.07.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 07:25:50 -0700 (PDT)
Message-ID: <4382eb7259516d6e73fe44848db57c095de44312.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: fix buildpaths QA with LTO
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 25 Mar 2026 14:25:49 +0000
In-Reply-To: <acPeghejSsdzRunU@heinlein>
References: <20260325113951.1278864-1-patrick@stwcx.xyz>
	 <acPLE7KjSfvxXthX@heinlein>
	 <9a222b692f97515655dd8dad792246068410d660.camel@linuxfoundation.org>
	 <acPYkLXfOoJmv2lm@heinlein>
	 <181c419f20d806fea2a81c2b1ee18774fbdd0b2e.camel@linuxfoundation.org>
	 <acPeghejSsdzRunU@heinlein>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 14:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233919

On Wed, 2026-03-25 at 09:09 -0400, Patrick Williams wrote:
> On Wed, Mar 25, 2026 at 12:53:28PM +0000, Richard Purdie wrote:
> > On Wed, 2026-03-25 at 08:44 -0400, Patrick Williams wrote:
> > > On Wed, Mar 25, 2026 at 12:34:52PM +0000, Richard Purdie wrote:
> > > > > > With GCC 15.2 this can be noticed by setting many meson-built p=
ackages,
> > > > > > such as systemd, with:
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0 EXTRA_OEMESON:append:class-target =3D " -Db_=
lto=3Dtrue"
> > > > > >=20
> > > ...
> > > >=20
> > > > We're not seeing the error with OE-Core today in any of our automat=
ed
> > > > testing. Reading the above, it implies that we should see some kind=
 of
> > > > failure with some components auto-selecting it? Something therefore
> > > > isn't adding up.
> > >=20
> > > I tried to give recreate instructions here.=C2=A0 OE-Core doesn't act=
ually do
> > > this so you won't see it unless you enable it.
> > >=20
> > > OpenBMC has a large number of meson-built packages which are generall=
y
> > > safe to enable LTO on (but in the past I've ran into issues with othe=
r
> > > packages not building with LTO; now with lto.inc I should revisit thi=
s).
> > >=20
> > > We have a global enable for all meson packages:
> > > =C2=A0=C2=A0=C2=A0 https://github.com/openbmc/openbmc/blob/47d900012a=
93d79ab536ca172fc01cd89645a0d8/meta-phosphor/conf/distro/include/phosphor-d=
efaults.inc#L153
> > >=20
> > > When I upgraded to an OE core that had 1797741aad02b8bf429fac4b81e30c=
dda64b5448,
> > > almost all of our packages started failing with buildpaths.=C2=A0 I w=
as able
> > > to track it down to this problem.=C2=A0 systemd and libpam are two th=
at are
> > > OE or meta-openembedded packages that I saw fail this way, so I gave
> > > systemd as a clear example.=C2=A0 Like I said, we have a lot of packa=
ges in
> > > meta-phosphor[1] that we have enabled LTO on and they're all failing
> > > with buildpaths QA failures without a change to pass along
> > > DEBUG_PREFIX_MAP.
> > >=20
> > > If it helps, I can upload the objdump content.=C2=A0 There was DWARF =
data
> > > being inserted by the GIMPLE intermediate which wasn't being stripped=
 by
> > > the linker that had my build path in it.
> > >=20
> > > [1]: https://github.com/openbmc/openbmc/tree/master/meta-phosphor
> >=20
> > My question still stands though - why don't we see this with systemd or
> > libpam in OE-Core?
>=20
> Because you do not enable LTO on those.
>=20
> > You're asserting we need to add this to our default config as the
> > output is broken. We don't see those failures anywhere in our testing
> > (which definitely includes systemd).
> >=20
> > Are you passing specific config to systemd or libpam to enable lto?
>=20
> Yes, via a global EXTRA_OEMESON I pointed to above.=C2=A0 I only referred=
 to
> those because they are packages you have that can easily show this
> symptom.

Ok, now I understand. Thanks for making that clear.

> > I believe that if this breaks when you set certain configs, these
> > workaround belong with those configs.
>=20
> Ok.=C2=A0 We'll just keep it downstream if that's what you want.
>=20
> I pointed to [1].=C2=A0 I do think this should at least be included in lt=
o.inc
> because otherwise lto.inc is similarly broke for everyone.=C2=A0 I'm gues=
sing
> you don't have an upstream test that enables lto.inc (yet).

Correct, unfortunately we don't. Adding one would mean having people
willing/able to fix bugs in that too though.

> I will argue it is a really bad experience for people though to _not_
> have this in the default config.=C2=A0 It took me about 4 hours to track =
down
> what was causing buildpath issues in previously working packages when
> upgrading the OE-Core base, including tracking down the underlying gcc
> bug.
>=20
> [1]: https://lore.kernel.org/openembedded-core/20260204052638.284617-1-ch=
angqing.li@windriver.com/

I agree it should be in the lto config and I am happy to take that bit.
Equally, if we just bandaid this everywhere, people will continue to
ignore the issue and the bug will remain unsolved.

Having to pass huge linking commands around when they're not supposed
to be needed is pretty poor as well and breaks other things like go, as
you noticed.

Cheers,

Richard


