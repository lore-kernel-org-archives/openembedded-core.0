Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38B3C36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 07:40:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.13660.1743493237275013165
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 00:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MKkPF1Ph;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05DA8442D9;
	Tue,  1 Apr 2025 07:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743493235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+eo5scFOzguTqo09QHWHPlq0qeLGT8hEmCqeN6rsuo=;
	b=MKkPF1PhjksLItgSZcl2tMlNbcTf9g8zOh5vZLJzQMeBRgVi0aBVGREBGTVNqPkOdzkMYH
	K9oTxJH4I+NlzstVXQk2qDB5183oxHH1oBp3vAV9iJZadS0LvG4UW6+FmwPfajkgtouBKs
	sjqun6mmMXgaBZOHxmXpCAh0MVDDPDwfTHY5IAXESeseORy4IlVLnfwNy+yeM/mzjfI1T/
	OjQqN3zXPF4YFEg/L5L+OThemsxlYPerYphU1wSQKcSLbLMudMtjXLJdkygAng6ghqH2/d
	cvV8HL+wPSOKf+CyFkevCG7PH1DoswVV7a309/fHvFeBAl9tH131yxL2/ih1ug==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 09:40:34 +0200
Message-Id: <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 0/9] mesa: upgrade to 25.0.2
Cc: "Khem Raj" <raj.khem@gmail.com>,
 =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
In-Reply-To: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvufevofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefueelgfffteeludehvdehteeugeevudduvdejieelgeegkeegfeejvdevvedtleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepughmihhtrhihrdgsrghrhihsh
 hhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopeiisghoshiiohhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 07:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214005

On Mon Mar 31, 2025 at 2:21 PM CEST, Dmitry Baryshkov via lists.openembedde=
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
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Hi Dmitry,

Thanks for the new version.

It looks like we still have issues on the autobuilder, now during
oe-selftests. I truncated a bit the logs below.

ERROR: mesa-native-2_25.0.2-r0 do_compile: Execution of '/srv/pokybuild/yoc=
to-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux/mes=
a-native/25.0.2/temp/run.do_compile.506477' failed with exit code 1
...
| FAILED: src/intel/shaders/intel_gfx80_shaders.spv
| /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/w=
ork/x86_64-linux/mesa-native/25.0.2/build/src/compiler/clc/mesa_clc ../mesa=
-25.0.2/src/intel/shaders/libintel_shaders.h ../mesa-25.0.2/src/intel/shade=
rs/generate.cl ../mesa-25.0.2/src/intel/shaders/generate_draws.cl ../mesa-2=
5.0.2/src/intel/shaders/generate_draws_iris.cl ../mesa-25.0.2/src/intel/sha=
ders/query_copy.cl ../mesa-25.0.2/src/intel/shaders/util.cl -o src/intel/sh=
aders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1 -DGFX_VERx10=3D80 -I/srv/poky=
build/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-=
linux/mesa-native/25.0.2/mesa-25.0.2/src/intel/shaders/. -I/srv/pokybuild/y=
octo-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux/m=
esa-native/25.0.2/mesa-25.0.2/src/compiler/libcl -I/srv/pokybuild/yocto-wor=
ker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux/mesa-nati=
ve/25.0.2/mesa-25.0.2/src -I/srv/pokybuild/yocto-worker/oe-selftest-debian/=
build/build-st-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/s=
rc/intel -I/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-53=
842/tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/intel -I/srv/pokybui=
ld/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-lin=
ux/mesa-native/25.0.2/mesa-25.0.2/src/intel/genxml
| /bin/sh: 1: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st=
-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/clc/mesa=
_clc: not found

But also a lot of issues with sstate tests:

2025-03-31 19:31:36,349 - oe-selftest - INFO - 6: 46/49 214/622 (88.62s) (0=
 failed) (sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash)
2025-03-31 19:31:36,349 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
selftest/cases/sstatetests.py", line 418, in test_sstate_32_64_same_hash
    self.sstate_hashtest("i686")
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
selftest/cases/sstatetests.py", line 409, in sstate_hashtest
    self.assertCountEqual(files1, files2)
  File "/usr/lib/python3.11/unittest/case.py", line 1233, in assertCountEqu=
al
    self.fail(msg)
  File "/usr/lib/python3.11/unittest/case.py", line 703, in fail
    raise self.failureException(msg)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-53795/tmp-sstatesamehash/stamps/core2-32-poky-linux/mesa/25=
.0.2.do_install.sigdata.f1121eb56f1f6b8335722e32d0e21eb777e95ab4af83b777971=
f3666d1265bed'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-53795/tmp-sstatesamehash/stamps/core2-32-poky-linux/mesa/25=
.0.2.do_create_spdx.sigdata.4c53505a0e3a5bba214d854ae8eea7c551f794d6b853925=
64d7c3923180e5d7f'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-53795/tmp-sstatesamehash/stamps/core2-32-poky-linux/mesa/25=
.0.2.do_create_package_spdx.sigdata.cefe11ad38c3c40968e4757314ad08b91f9584c=
9845cbcf08cc8635e1216912e'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-53795/tmp-sstatesamehash/stamps/core2-32-poky-linux/mesa/25=
.0.2.do_populate_sysroot.sigdata.2e3e3b9c17855a8a865dd9e99c002016e697024fc9=
3cdfed690b7d54bb05e34e'
First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debian=
/build/build-st-53795/tmp-sstatesamehash/stamps/core2-32-poky-linux/mesa/25=
.0.2.do_prepare_recipe_sysroot.sigdata.73d0df5170ce762727a517856505f3505b2c=
47f479affdddb242ddcad34d5e29'
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1264
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1350
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1214

Can you have a look a these please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


