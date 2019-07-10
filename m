Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0EF7EF22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 14:27:04 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f17so2485235wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rQBiNvps+N8wu3r65r/n2uV0X/u2qbHzl95qsbr1dAI=;
	b=C3X9Br9o5DtVBTitcWwqtCrldr/q+dogGxQ1iDpc0lUsPnuKNMHtqNibtLR5nH+qQc
	s6t6/+nQXrasQ4Ne3L71bd+R0Sv1LjeuwO6YfFPZWTUdJVrRb+P1HcTTqA2dTNQC4jL3
	zt2XlhNkcLKP+hL5CO4pJZsoh52V7fFoWXErw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rQBiNvps+N8wu3r65r/n2uV0X/u2qbHzl95qsbr1dAI=;
	b=EmOVs+wQpjMzTQ+5yUWLS2augtmoHvuJLvj0tcJep8vwHJq6qdNxkQqs7VMg5SU0kz
	EDGzlfmJt6N+SV9QUy+q75sZUT3esROUh72cyp7bmzs/XE3ZCmJjwPeovGzbidtTy4ee
	x8ifTfEPqpgUOMY8hHM0wV0cvKWSoNliPZFdbzdoGhwF5SLaVwIgj3Jq2dp781Vvx5Zh
	RIv9dzAhcyK7UcEqODTh7nTxH+0x2u+eD2smaos6l8FWRuEEcXfhI1bqFfOdHE/GUAa3
	k5IbQIKLFwO3s8enKV/TyfCJchNagSGL9HQCR7nnOHcjVbIXjfvxfVdHTe+AwmiJO861
	ZHFg==
X-Gm-Message-State: APjAAAVlTfD0h/1l3HTXF3YP0ukOrXPMOzfoDDosKRTd0TunwHYg4iiq
	nEn1zyfZdFI0h9NpyW5npx9W3g==
X-Google-Smtp-Source: APXvYqwFxsLAvPkFCrT+CiaSfNeZtjZLyIFVYhKs/xQrGWqZL0o8/pffXCG2UdUMwTMfxF+vAAHIPQ==
X-Received: by 2002:a1c:6882:: with SMTP id d124mr5599230wmc.40.1562768825309; 
	Wed, 10 Jul 2019 07:27:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t1sm3161432wra.74.2019.07.10.07.27.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 10 Jul 2019 07:27:04 -0700 (PDT)
Message-ID: <6bfc6569a78a2a12f6172a7323f9fb1a6149a6b0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Martin
	=?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Date: Wed, 10 Jul 2019 15:27:03 +0100
In-Reply-To: <CADkTA4OpSXaKOvWO7uQr-ydpN5-jEwwQsvFUw9f26w_xLWyj5A@mail.gmail.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
	<895d9d6d6e611652f3e144561811868b1df15cf6.1559220004.git.bruce.ashfield@gmail.com>
	<df9ca430-ee2a-5428-2528-28604e1b5bce@geanix.com>
	<CADkTA4OpSXaKOvWO7uQr-ydpN5-jEwwQsvFUw9f26w_xLWyj5A@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/9] linux-yocto-dev: bump to v5.2-rc
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
X-List-Received-Date: Wed, 10 Jul 2019 14:27:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-07-10 at 10:21 -0400, Bruce Ashfield wrote:
> On Wed, Jul 10, 2019 at 10:15 AM Martin Hundebøll <martin@geanix.com>
> wrote:
> > Hi Bruce,
> > 
> > On 30/05/2019 14.44, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > 
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >   meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > index ae8c343008..3a055c12ad 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> > > @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-
> > > yocto-dev.git;branch=${KBRANCH};name
> > >   SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_
> > > virtual/kernel", "linux-yocto-dev", "${AUTOREV}",
> > > "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> > >   SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_vir
> > > tual/kernel", "linux-yocto-dev", "${AUTOREV}",
> > > "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
> > > 
> > > -LINUX_VERSION ?= "5.0-rc+"
> > > +LINUX_VERSION ?= "5.2-rc+"
> > >   LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
> > >   PV = "${LINUX_VERSION}+git${SRCPV}"
> > 
> > My own kernel recipe (more or less mainline) failed to build when I
> > bumped to v5.2. It fails to generate the out-of-tree Makefile due
> > to a
> > missing dependency on `realpath`[1].
> > 
> > The quick-fix is to add coreutils-native to DEPENDS, but I am not
> > sure
> > if this is what we want.
> > 
> > Have you seen the same?
> 
> Nope, I haven't seen that. But then again, all my machines have
> realpath available.
> 
> As you hinted, building all of coreutils as a dependency for the
> kernel is a bit heavy. We could make
> realpath a host requirement,  or otherwise, split out realpath (but
> you'd still need to build coreutils, so
> that really doesn't help).
> 
> I'd lean towards just making it a host requirement .. but I'm sure
> Richard can advise better than me
> on the pro's and con's of the options.

realpath is in the standard HOSTTOOLS in bitbake.conf so its already
required?

Cheers,

Richard



