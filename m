Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41D4C36018
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 08:27:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.14139.1743496053872093485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 01:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=irZ0KLkh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 94B8F4316C;
	Tue,  1 Apr 2025 08:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743496052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+TNAF0sX5vOWCB8CbEHYSggK9sFxQwOCC9dCt4Ad1o=;
	b=irZ0KLkh3AaLB3B/N5wlRty2uBipQslt+ro0rvaFXSMlJRccSFH/GaxqSJ80DuTeFiJe9s
	Y0Y28QUAEsrfzFr931hCvgyV3SjmvAqNRVFcHjk4AYVssn/Zy6/PtE+Zw1jqgyo63KsGGx
	Zmee3y5q3pYt5R1tpfO7jKvpDqpKjKdXHFtu9FNNrIOJjZJ7XbKXohs9KzE5kagj7i/bh/
	8cRe/hht9xHb1y+KS83qv+kTz1xeGc8+v4u+235tzsB/GAiemop0KU1W6E8DX/GosUGv2y
	kZ8wWnbii2Gdqgr/2mEKSGjgD8JIVL/NqYsieQ8f0BYkDXFbCrlYS6SoOo3IiQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 10:27:31 +0200
Message-Id: <D8V5ROOK16KM.1VZ0YWBBB0JMW@bootlin.com>
Subject: Re: [OE-core] [PATCH v4 0/9] mesa: upgrade to 25.0.2
Cc: "Khem Raj" <raj.khem@gmail.com>,
 =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>,
 <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
 <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com>
In-Reply-To: <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvfedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduheeggfetgeehgeejhefhhfegleekhefgleefueektedvkeeitddtveegfeduueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepmhgrthhhihgvuhdrughusghoi
 hhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegumhhithhrhidrsggrrhihshhhkhhovhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepiigsohhsiihorhesghhmrghilhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 08:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214008

On Tue Apr 1, 2025 at 9:40 AM CEST, Mathieu Dubois-Briand wrote:
> On Mon Mar 31, 2025 at 2:21 PM CEST, Dmitry Baryshkov via lists.openembed=
ded.org wrote:
> > libclc is required in order to build Intel drivers in Mesa 24.1 and
> > later. Thus OE-Core is currently locked to the 24.0.x branch, which is
> > no longer maintained, having last release in June 2024.
> >
> > A clean solution is to package Clang, then use it to build libclc and
> > SPIRV-LLVM-Translator (required for Mesa OpenCL support). However
> > creating proper recipes for Clang is a long process (ongoing by Khem
> > Raj).
> >
> > This patchset attempts to solve the issue in a simpler way: by building
> > libclc and SPIRV-LLVM-Translator together with the LLVM. This way we
> > don't have to create target Clang recipes, there is no extra toolchain
> > to support, etc. Clang binaries are creted as a part of the build
> > process (in order to support building target packages), however it only
> > hits the LLVM sysroot-native and is only used by the LLVM target build.
> >
> > Future work by Khem (once Clang is properly supported in OE-Core) shoul=
d
> > allow us to create proper recipes for libclc and spirv-llvm-translator
> > and drop them from the llvm / clang recipe.
> >
> > I think this approach provides a good balance between OE-Core being
> > stuck with the outdated Mesa release and being able to upgrade it,
> > bringing support for new hardware.
> >
> > Last two patches of the series bring in RustiCL support, a new OpenCL
> > implementation within Mesa. They are optional for the sake of the
> > upgrade and can be dropped if there is any issue with those. RustiCL
> > support is mostly compile-tested at this point.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
>
> Hi Dmitry,
>
> Thanks for the new version.
>
> It looks like we still have issues on the autobuilder, now during
> oe-selftests. I truncated a bit the logs below.
>
> ERROR: mesa-native-2_25.0.2-r0 do_compile: Execution of '/srv/pokybuild/y=
octo-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux/m=
esa-native/25.0.2/temp/run.do_compile.506477' failed with exit code 1
> ...
> | FAILED: src/intel/shaders/intel_gfx80_shaders.spv
> | /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp=
/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/clc/mesa_clc ../me=
sa-25.0.2/src/intel/shaders/libintel_shaders.h ../mesa-25.0.2/src/intel/sha=
ders/generate.cl ../mesa-25.0.2/src/intel/shaders/generate_draws.cl ../mesa=
-25.0.2/src/intel/shaders/generate_draws_iris.cl ../mesa-25.0.2/src/intel/s=
haders/query_copy.cl ../mesa-25.0.2/src/intel/shaders/util.cl -o src/intel/=
shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1 -DGFX_VERx10=3D80 -I/srv/po=
kybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_6=
4-linux/mesa-native/25.0.2/mesa-25.0.2/src/intel/shaders/. -I/srv/pokybuild=
/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux=
/mesa-native/25.0.2/mesa-25.0.2/src/compiler/libcl -I/srv/pokybuild/yocto-w=
orker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux/mesa-na=
tive/25.0.2/mesa-25.0.2/src -I/srv/pokybuild/yocto-worker/oe-selftest-debia=
n/build/build-st-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2=
/src/intel -I/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-=
53842/tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/intel -I/srv/pokyb=
uild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-l=
inux/mesa-native/25.0.2/mesa-25.0.2/src/intel/genxml
> | /bin/sh: 1: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-=
st-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/clc/me=
sa_clc: not found
>
> But also a lot of issues with sstate tests:
>
> 2025-03-31 19:31:36,349 - oe-selftest - INFO - 6: 46/49 214/622 (88.62s) =
(0 failed) (sstatetests.SStateHashSameSigs.test_sstate_32_64_same_hash)
> 2025-03-31 19:31:36,349 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/selftest/cases/sstatetests.py", line 418, in test_sstate_32_64_same_hash
>     self.sstate_hashtest("i686")
>   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeq=
a/selftest/cases/sstatetests.py", line 409, in sstate_hashtest
>     self.assertCountEqual(files1, files2)
>   File "/usr/lib/python3.11/unittest/case.py", line 1233, in assertCountE=
qual
>     self.fail(msg)
>   File "/usr/lib/python3.11/unittest/case.py", line 703, in fail
>     raise self.failureException(msg)
> AssertionError: Element counts were not equal:
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debi=
an/build/build-st-53795/tmp-sstatesamehash/stamps/core2-32-poky-linux/mesa/=
25.0.2.do_install.sigdata.f1121eb56f1f6b8335722e32d0e21eb777e95ab4af83b7779=
71f3666d1265bed'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debi=
an/build/build-st-53795/tmp-sstatesamehash/stamps/core2-32-poky-linux/mesa/=
25.0.2.do_create_spdx.sigdata.4c53505a0e3a5bba214d854ae8eea7c551f794d6b8539=
2564d7c3923180e5d7f'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debi=
an/build/build-st-53795/tmp-sstatesamehash/stamps/core2-32-poky-linux/mesa/=
25.0.2.do_create_package_spdx.sigdata.cefe11ad38c3c40968e4757314ad08b91f958=
4c9845cbcf08cc8635e1216912e'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debi=
an/build/build-st-53795/tmp-sstatesamehash/stamps/core2-32-poky-linux/mesa/=
25.0.2.do_populate_sysroot.sigdata.2e3e3b9c17855a8a865dd9e99c002016e697024f=
c93cdfed690b7d54bb05e34e'
> First has 1, Second has 0:  '/srv/pokybuild/yocto-worker/oe-selftest-debi=
an/build/build-st-53795/tmp-sstatesamehash/stamps/core2-32-poky-linux/mesa/=
25.0.2.do_prepare_recipe_sysroot.sigdata.73d0df5170ce762727a517856505f3505b=
2c47f479affdddb242ddcad34d5e29'
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1264
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1350
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1214
>
> Can you have a look a these please?

Also, I suspect this series is linked with this Xorg segfault in
parselogs.ParseLogsTest.test_parselogs:

Central error: Fatal server error:
***********************
[     1.468] 	compiled for 1.21.1.16, module version =3D 1.0.1
[     1.468] 	ABI class: X.Org ANSI C Emulation, version 0.4
[     1.512] (EE)
[     1.512] (EE) Backtrace:
[     1.512] (EE) 0: /usr/bin/Xorg (xorg_backtrace+0x52) [0x566b2522]
[     1.512] (EE) 1: /usr/bin/Xorg (0x56583000+0x1332b5) [0x566b62b5]
[     1.512] (EE) 2: /lib/libc.so.6 (0xf75e8000+0x34060) [0xf761c060]
[     1.512] (EE) 3: /usr/lib/libgallium-25.0.2.so (0xf5140000+0x512634) [0=
xf5652634]
[     1.512] (EE)
[     1.512] (EE) Segmentation fault at address 0x0
[     1.512] (EE)
Fatal server error:
[     1.512] (EE) Caught signal 11 (Segmentation fault). Server aborting

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/1274

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


