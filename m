Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F90BC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 13:34:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.74849.1744119274821005531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 06:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NkPN76RT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 318A82057C;
	Tue,  8 Apr 2025 13:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744119272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYNzb+5LrWMDensaJFmIEv1UeUqeqLVSnKZFP3C6IhM=;
	b=NkPN76RTunVr8ePutgDl14+pPa3Wr+ZoCXstD4J5up1IDVdU72t8LKOGVfqgxXUV83ueBK
	IRw0miLedORww9hWNaDp2C1m/RPdIXla/K0ZxacgBulwdksFA5vvjxmoo3hx861PNQw2P3
	CiTthxyWk9E7WVE0kFYD3wjYG26ZFQP6A0FNjVCM4lTG4A0duoz6VEaVNcbJNGCA6PeP4E
	HfZj0Aoe+yEZQSQM68PkubF6OPm4jE7BsMjs55mvdd9/bofNHANEpDgP6Te6R+UTSYhIZZ
	dV+odXv/pc3zB4R0advZAY7rPyPQvNQSf+rE9eIMo7BO37bQIDrDIZvOJfaJtQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Apr 2025 15:34:31 +0200
Message-Id: <D91AOK9S03Q6.2FUYPG6HID1V@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 00/13] mesa: upgrade to 25.0.2
Cc: "Khem Raj" <raj.khem@gmail.com>,
 =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
In-Reply-To: <20250407-mesa-25-v6-0-29bf4cae8d28@oss.qualcomm.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffkeekgeejheevkeeluddtvdejieejgedtffdtffekieeuvedvtdegkeeuudeuvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemsggvjedumeekfedtugemfhekvggvmeefgeguudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemsggvjedumeekfedtugemfhekvggvmeefgeguuddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegum
 hhithhrhidrsggrrhihshhhkhhovhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepiigsohhsiihorhesghhmrghilhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214537

On Mon Apr 7, 2025 at 11:48 AM CEST, Dmitry Baryshkov via lists.openembedde=
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
> NOTE: This depends on the https://github.com/kraj/meta-clang/pull/1075
> for interoperability with meta-clang
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

Thanks for the new version, but it looks like we still have some issues:

| Mangler.cpp:(.text._ZN4SPIR13MangleVisitor18recordSubstitutionERKNSt7__cx=
x1112basic_stringIcSt11char_traitsIcESaIcEEE[_ZN4SPIR13MangleVisitor18recor=
dSubstitutionERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE]+0x23f=
): undefined reference to `std::__throw_bad_array_new_length()'
| collect2: error: ld returned 1 exit status

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/1356
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1331

Can you have a look at this please?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


