Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8DFAF7FC26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 19:49:17 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id u1so37081677ljk.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2019 11:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zvu/ehO0uCZS+xpQNGSAytbLgjMOSECkPSvT/2kzGVs=;
	b=bW9OsfQKASr1BLAMf0bKR0yWZPHNeJo55VDqB9TaGoydccZurnzRnRSFJTMloqt+Iv
	pl40A6dzOfRr/yQ94WsrqvZ9CRKB07ujLuebPBwLpYJ6HCwjywn6Xu9riFpSs1GpzEn2
	vDqLKYziq1zdibiA0VoYw9P+ptXmZs8xUW2fvP3BFSSx3E/AY+vNMWTQ90H5XbnstaE5
	fDGUc8omS8R8zWf4j/FwX3C0tTX5/q0LdHj5xoD16VxhJBFp0tncZalYVnp2aKuWHcrX
	gw1qWMbhS71glOictux2o+bQT2WrlNau/IpEXrmqyWbYxj5/GCQFqDAka1DFnBePZDjh
	5Peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zvu/ehO0uCZS+xpQNGSAytbLgjMOSECkPSvT/2kzGVs=;
	b=niyU+idE+OHvKhQ9GlmyJqV2bibdpmNFFhh+Ug9EgT53eRFpeARuqLjlpfr6Idbi35
	mla2GlOgfH/NVj+K2Vf/lAIk0RsOUbQU+lAVKz2bSY7ww3/nv3q59DtDqQ9qmrHARoaN
	HID4h7CTpO8jZY49SAYXV0EYI6EuMEnNtb7QGJg3Rr0Fb6IxnNJFHLlC0Uf255zQWBgl
	6FIVPDHQFpklQ+YhkvgicDA2MrSuQR4qjzGkiOnBqdR2m5lKNOc+EeUHpz8MPo3uPxwd
	LpvpJjH9NMsFBuPVvkxd7rGRmfVN1/JdEWqoNgZHQEYBjTkU1egxRX9LUMgcyCjozo5j
	OzBg==
X-Gm-Message-State: APjAAAVXHDccihZ2mKuupoAtyUrCKhfEgqnOsv2ePYgcnzODouXwkFg/
	Am/UJ1BQJssA9MiezQJkY6D/0EDiIiCPi+Zm8oI=
X-Google-Smtp-Source: APXvYqyQoN6eEoe3YDY7IjKg6nWe6pgqYLt+7RuhmM8xn7AqRLGnrLHCAlVF07/quJeE3o4AWCzw+QTJKhWjkji1Yb8=
X-Received: by 2002:a2e:96c6:: with SMTP id d6mr13210846ljj.4.1577821758099;
	Tue, 31 Dec 2019 11:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20191224224135.20121-1-alistair.francis@wdc.com>
	<8c9256ff3e84ac5d8e9acb0f8e7a9bf60baf9dbc.camel@linuxfoundation.org>
	<20191229134620.GW18106@bill-the-cat>
In-Reply-To: <20191229134620.GW18106@bill-the-cat>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Dec 2019 11:48:51 -0800
Message-ID: <CAKmqyKOMPQT8aVjk21ESCJe3XP+AcOWrfgXW+VRCzd9hSY5uYA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: sateesh0457@gmail.com, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to v2020.01-rc5
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
X-List-Received-Date: Tue, 31 Dec 2019 19:49:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 29, 2019 at 5:46 AM Tom Rini <trini@konsulko.com> wrote:
>
> On Sun, Dec 29, 2019 at 09:23:47AM +0000, Richard Purdie wrote:
> > On Tue, 2019-12-24 at 14:41 -0800, Alistair Francis wrote:
> > > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > > ---
> > >  meta/recipes-bsp/u-boot/u-boot-common.inc | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > index a0f9c41469..4799948bb1 100644
> > > --- a/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > +++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
> > > @@ -11,11 +11,11 @@ LIC_FILES_CHKSUM = "
> > > file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
> > >  PE = "1"
> > >
> > >  # Drop this line when updating to 2020.01 final
> > > -PV = "2020.01~rc3"
> > > +PV = "2020.01~rc5"
> > >
> > >  # We use the revision in order to avoid having to fetch it from the
> > >  # repo during parse
> > > -SRCREV = "d4a31e8ee5592072d8d5208b3e950cba2d89b6bd"
> > > +SRCREV = "ef7c2af65966a57c98d3c47e6c2fe1ce2103b7f6"
> > >
> > >  SRC_URI = "git://git.denx.de/u-boot.git \
> >
> > Seems to break on musl:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1392
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1396
>
> Looks like the Gentoo folks hit this as well:
> http://patchwork.ozlabs.org/patch/1211367/
>
> Can someone review/ack that please if that's the best way (rather than
> reworking include/u-boot/crc.h) to deal with the problem?  Thanks!

Thanks! I have sent a v2.

Alistair

>
> --
> Tom
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

