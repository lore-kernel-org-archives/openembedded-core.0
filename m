Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F25C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 12:54:58 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.86833.1754052891158391185
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 05:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=O9HQRDYc;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B201D43373;
	Fri,  1 Aug 2025 12:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754052889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iry8pN9qEN+oMVvK0QoGM47iU8yZ/s40XmVTcxrhp3g=;
	b=O9HQRDYcnc87Io9DuBPXCWiEykndmlIT3oqtF/dSKhm8haebBm1y+lStuzpFeWOTi0TG5O
	GxDgBDdhTnt8muoX120cbKSGXYoSOTIaWOlsQ8Tsj5kIKTZBSetoUujbMZ5IgYfdNKuG22
	bS3zefM6I0flvSNHCH1QfmP/y/x8pfux4efzKWvMkkwK8I+MlrfJWlLAN7O9W4aVVn7SBg
	NLPdcsFAeYAE2JH9eg7UHSImIFomQ+bliYZEt7IcOiSgkURdeKPfS2bDFliVjcREosZJWy
	oibUKck8bzoa33cd4Gv7kurl24FzzGL2FihHwsCEIlPLJ2SzGxf/wRU7aHgSBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 14:54:48 +0200
Message-Id: <DBR3USPY34UA.F664WZTD1W0R@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/7] toolchain/clang-native: Set BUILD_LDFLAGS
 instead of LDFLAGS
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250801042242.3076232-1-raj.khem@gmail.com>
In-Reply-To: <20250801042242.3076232-1-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkedvtdduteetteegjeeukefhgfejgffffeffueffjefhvdehjeefkeefuddvvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemugguieemvdegfedtmehfkedujeemkeefvgdtmegujegsrgemkeduledunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmeguugeimedvgeeftdemfhekudejmeekfegvtdemugejsggrmeekudeluddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhop
 ehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 12:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221242

On Fri Aug 1, 2025 at 6:22 AM CEST, Khem Raj via lists.openembedded.org wro=
te:
> BUILD_LDFLAGS is used by other recipes to emit native LDFLAGS
> into their cmake toolchain files especially in QT layers. it
> will usually be inherited by recipes wanting clang provide
> BUILD_* variables so this is more appropriate than LDFLAGS to
> pass these options.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

It looks like something in there is breaking the reproducibility:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./core2-64/clang-dev_20.1.8-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./core2-64/clang-dev_20.1.8-r0_core2-64.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./core2_64/clang-dev-20.1.8-r0.core2_64.rpm


https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2205
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20250801-t697t4fj/=
packages/diff-html/

Can you have a look at this?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


