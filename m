Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7250DC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:18:15 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.7233.1743153488329101245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H7jFNUbu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9DD4B431BA;
	Fri, 28 Mar 2025 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743153486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mR74xBKu30qIZOXcDMfBRNs6t9DsAgJ92PReG86nceg=;
	b=H7jFNUbuJBjxbUBVJa3al5TNPzZEUZ/fqfsZTEn9BMWB/wgYqba0v4SbycK2FJrHpz3+Hv
	NcavllbBENbURg2LTw9yMtsD+K6SDHJcoXSUspgpvFVFRKKcYehX8vxZEXpQqIFnc6T3me
	9Yvnj1pATWIlIIJqsGb2D8ksI5WO1Y1rRV1n1jkPH/TIzZlG/jVYeIsczrovaa+6EDGosD
	TZLODHwjwHZhQhcCpnTXotAcQi5miBaUglIu8QBKXGuGOwkVzL5sVp/fj5tE9x/WUeJO9C
	GmVeJO+C4UnVnkhNot89pPw+c7FLOxViK+ATISwC4j/8i8t5KsFtxMZVVX6wHA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 10:18:05 +0100
Message-Id: <D8RSC82XXPV4.1NJ347ZPRD6V1@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 0/7] mesa: upgrade to 25.0.2
Cc: "Khem Raj" <raj.khem@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedtleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduheeggfetgeehgeejhefhhfegleekhefgleefueektedvkeeitddtveegfeduueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepughmihhtrhihrdgsrghrhihsh
 hhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 09:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213815

On Thu Mar 27, 2025 at 11:18 PM CET, Dmitry Baryshkov via lists.openembedde=
d.org wrote:
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
> Changes since v1:
> - Dropped YOCTO_ALTERNATE_LIBDIR patch
> - Reworked mesa / LLVM integration to always use get_option('libdir')
> - Reenabled AMD Vulkan driver (got disabled because of c&p error)
> - Moved mesa-clc options to the libclc PACKAGECONFIG to fix several
>   build errors
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Hi,

Thanks for the v2, but it looks like we still have some issues on the
autobuilder:

ERROR: nativesdk-mesa-2_25.0.2-r0 do_package_qa: QA Issue: File /usr/local/=
oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/dri/libdri=
l_dri.so in package nativesdk-mesa-megadriver contains reference to TMPDIR =
[buildpaths]
ERROR: nativesdk-mesa-2_25.0.2-r0 do_package_qa: QA Issue: nativesdk-mesa-m=
egadriver: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-li=
nux/usr/lib/dri/libdril_dri.so contains bad RPATH /srv/pokybuild/yocto-work=
er/meta-intel/build/build/tmp/work/x86_64-linux/llvm-native/20.1.0/recipe-s=
ysroot-native/usr/lib:/srv/pokybuild/yocto-worker/meta-intel/build/build/tm=
p/work/x86_64-linux/llvm-native/20.1.0/recipe-sysroot-native/lib [rpaths]
ERROR: nativesdk-mesa-2_25.0.2-r0 do_package_qa: QA Issue: File /usr/local/=
oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/libgallium=
-25.0.2.so in package nativesdk-libgallium contains reference to TMPDIR [bu=
ildpaths]
ERROR: nativesdk-mesa-2_25.0.2-r0 do_package_qa: QA Issue: nativesdk-libgal=
lium: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/u=
sr/lib/libgallium-25.0.2.so contains bad RPATH /srv/pokybuild/yocto-worker/=
meta-intel/build/build/tmp/work/x86_64-linux/llvm-native/20.1.0/recipe-sysr=
oot-native/usr/lib:/srv/pokybuild/yocto-worker/meta-intel/build/build/tmp/w=
ork/x86_64-linux/llvm-native/20.1.0/recipe-sysroot-native/lib [rpaths]
ERROR: nativesdk-mesa-2_25.0.2-r0 do_package_qa: Fatal QA errors were found=
, failing task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/1288
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1289

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


