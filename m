Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EC4C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 06:56:07 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.1931.1743576958157863468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 23:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=edrrw3R3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96CCF4440D;
	Wed,  2 Apr 2025 06:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743576956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6+N/xyNL066HztjBHmhdLhavbn2VQPZIrTTQIgawwKQ=;
	b=edrrw3R3Nl0+W+5WAP6a5ejXoGViwvWzuRqTFLJ0+AejG0U2YuzWB+vY6ZCw6ABbfmxWcg
	M1rTOUIOggzHmrCUuyvUs/N17R4Dgqf8zhtj059TrkxhCGmREEfHS/ZsxlmeLGP+BkyEM9
	hGlVSXrCffSAfffnhC4nI4zVHDdj52WEz3tToB+F0sy+7u1c7pY77OwbEcWpL8QX4EoEZH
	ekvYRhRSXorXrdHr+VUEKnqAXBjAcavCG3sXoJxriY9aKZXu9wx14WBKU4PQstwtAzJ6kY
	qskDsC1SfMAe9n46Zboy7drR/7YbSrSem3kmVpJQh6WFUhjJMZkAhlSZEZ5G6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Apr 2025 08:55:55 +0200
Message-Id: <D8VYG3D9S5MK.1G3JUTQ3QIFF2@bootlin.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Alexander
 Kanavin" <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/9] mesa: upgrade to 25.0.2
Cc: <openembedded-core@lists.openembedded.org>, "Khem Raj"
 <raj.khem@gmail.com>, =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?=
 <zboszor@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250331-mesa-25-v4-0-e62fc54a6efc@oss.qualcomm.com>
 <D8V4RQR2X3EF.46ET3A2PKUAL@bootlin.com>
 <8d4b0884-985f-4e81-a3d3-03a1abb91e73@oss.qualcomm.com>
 <CANNYZj_aEritSc0Te9hWR+OZVQ1DDFY0b4A0Q0H148L5YjEKcw@mail.gmail.com>
 <0926082a-b09e-4d8d-8199-671823db87bd@oss.qualcomm.com>
In-Reply-To: <0926082a-b09e-4d8d-8199-671823db87bd@oss.qualcomm.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvffuvefhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgueeltefhudegffekvdevtdfgveffjeegjeduhfduvefgveeuhfeiteejgffftdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepughmihhtrhihrdgsrghrhihsh
 hhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopeiisghoshiiohhrsehgmhgrihhlrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 06:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214173

On Wed Apr 2, 2025 at 3:45 AM CEST, Dmitry Baryshkov wrote:
> On 01/04/2025 19:28, Alexander Kanavin wrote:
>> On Tue, 1 Apr 2025 at 18:19, Dmitry Baryshkov via
>> lists.openembedded.org
>> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>>> ERROR: mesa-native-2_25.0.2-r0 do_compile: Execution of '/srv/pokybuil=
d/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linu=
x/mesa-native/25.0.2/temp/run.do_compile.506477' failed with exit code 1
>>>> ...
>>>> | FAILED: src/intel/shaders/intel_gfx80_shaders.spv
>>>> | /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/=
tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/clc/mesa_clc ..=
/mesa-25.0.2/src/intel/shaders/libintel_shaders.h ../mesa-25.0.2/src/intel/=
shaders/generate.cl ../mesa-25.0.2/src/intel/shaders/generate_draws.cl ../m=
esa-25.0.2/src/intel/shaders/generate_draws_iris.cl ../mesa-25.0.2/src/inte=
l/shaders/query_copy.cl ../mesa-25.0.2/src/intel/shaders/util.cl -o src/int=
el/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1 -DGFX_VERx10=3D80 -I/srv=
/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x8=
6_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/intel/shaders/. -I/srv/pokybu=
ild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-li=
nux/mesa-native/25.0.2/mesa-25.0.2/src/compiler/libcl -I/srv/pokybuild/yoct=
o-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_64-linux/mesa=
-native/25.0.2/mesa-25.0.2/src -I/srv/pokybuild/yocto-worker/oe-selftest-de=
bian/build/build-st-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/mesa-25.=
0.2/src/intel -I/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-=
st-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/intel -I/srv/po=
kybuild/yocto-worker/oe-selftest-debian/build/build-st-53842/tmp/work/x86_6=
4-linux/mesa-native/25.0.2/mesa-25.0.2/src/intel/genxml
>>>> | /bin/sh: 1: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/bui=
ld-st-53842/tmp/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/clc=
/mesa_clc: not found
>>>
>>>
>>> I've fixed all other issues, except the x32 (working on reproducing it
>>> now) and this one. Would you have a pointer to the build job?
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1264/=
steps/14/logs/stdio
>>=20
>> This is in context of oe-selftest, but it is simply building
>> qemu-system-native on debian 12 - I suspect the mesa-native fail is
>> specific to that host distro. I can try to reproduce if you need help
>> with it.
>
> It's really strange as my build host is Debian 12. And it's even more=20
> strange as mesa-clc was built few lines above (16406).

Ok, I will try to play a bit with it today, let's see if I can reproduce
easily.

I launched a rebuild of the previous job there:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1274
I will try to reproduce it locally a bit later today.

Also, maybe this is linked with other fails. So if you have a new
version of your series fixing them, feel free to send it, I will be
happy to test it.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


