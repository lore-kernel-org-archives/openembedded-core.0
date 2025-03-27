Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40F1C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 16:49:27 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.1271.1743094165936734749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 09:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QThX987/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7BE1444E8;
	Thu, 27 Mar 2025 16:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743094164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=04RCLv3JPi1N0Y1+ZYuYRViRqN4n15J960m9npHoruQ=;
	b=QThX987/sp70nGOPG5lJDwgh8vncj1rjBgC1xJpJjnHW0Rsq3EVPvr8iEne/Ec4EjHH41A
	AOLnhkRaRoiyZqEN4bOaPrhzZBXh0DN2+26KYJpnN/8njasSLtceH1RIHlgBcnZ2ryTZ6+
	ptunckwXCcJlsXlHW05uh8UeBkX3UV05M7gr8psavYfZVqHp/dcradVYIfDq7wS/wuT2kl
	49skaA57AMR+kMOKsldHXiVmeIBox6fBz8xcraCvuUbVsQ8vto7GOb9pYOFvlWN/3Olwbn
	hDmYh3T9ilUxlNqGL2duqqEz5VTrRZkPbRCCTEQjw+kWfUx3VcdPZu7UkDDEcA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Mar 2025 17:49:21 +0100
Message-Id: <D8R7B70V1WMV.1PUDNR0TONAIY@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/8] mesa: upgrade to 25.0.2
Cc: "Khem Raj" <raj.khem@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250327135520.3920189-1-dmitry.baryshkov@oss.qualcomm.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieekleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgueeltefhudegffekvdevtdfgveffjeegjeduhfduvefgveeuhfeiteejgffftdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughmihhtrhihrdgsrghrhihsh
 hhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 16:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213768

On Thu Mar 27, 2025 at 2:55 PM CET, Dmitry Baryshkov via lists.openembedded=
.org wrote:
> libclc is required in order to build Intel drivers in Mesa 24.1 and
> later. Thus OE-Core is currently locked to the 24.0.x branch, which is
> no longer maintained, having last release in June 2024.
>
> A clean solution is to package Clang, then use it to build libclc and
> SPIRV-LLVM-Translator (required for Mesa OpenCL support). However
> creating proper recipes for Clang is a long process (ongoing by Khem
> Raj).
>
> This patchset attempts to solve the issue in a simpler way: by building
> libclc and SPIRV-LLVM-Translator together with the LLVM. This way we
> don't have to create target Clang recipes, there is no extra toolchain
> to support, etc. Clang binaries are creted as a part of the build
> process (in order to support building target packages), however it only
> hits the LLVM sysroot-native and is only used by the LLVM target build.
>
> Future work by Khem (once Clang is properly supported in OE-Core) should
> allow us to create proper recipes for libclc and spirv-llvm-translator
> and drop them from the llvm / clang recipe.
>
> I think this approach provides a good balance between OE-Core being
> stuck with the outdated Mesa release and being able to upgrade it,
> bringing support for new hardware.
>
> Last two patches of the series bring in RustiCL support, a new OpenCL
> implementation within Mesa. They are optional for the sake of the
> upgrade and can be dropped if there is any issue with those. RustiCL
> support is mostly compile-tested at this point.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Hi Dmitry,

Thanks for your patch.

It looks like this is breaking some builds on the autobuilder, with
following error:

| --- stdout ---
|
| --- stderr ---
| <built-in>:1:10: fatal error: 'opencl-c-base.h' file not found
| Error executing LLVM compilation action.
|

This one did happen in a lot of builds, here are the first ones:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1284
https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/1283
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1298

Another one, maybe related to musl:

| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/hosttools/ld:=
 /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-=
poky-linux-musl/llvm/20.1.0/recipe-sysroot-native/usr/lib/libzstd.so: undef=
ined reference to `pthread_join@GLIBC_2.34'
| /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/hosttools/ld:=
 /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-=
poky-linux-musl/llvm/20.1.0/recipe-sysroot-native/usr/lib/libzstd.so: undef=
ined reference to `pthread_create@GLIBC_2.34'
| collect2: error: ld returned 1 exit status

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1320

And another one:

| ../mesa-25.0.2/src/compiler/spirv/meson.build:85:22: ERROR: Tried to mix =
a host machine library ("vtn") with a build machine target "vtn_bindgen" Th=
is is not possible in a cross build.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/1251

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


