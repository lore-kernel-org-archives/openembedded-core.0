Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC3FC4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:44:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41649.1784699062162747120
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 22:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YNlDD9Tf;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 71AF54E40EC2;
	Wed, 22 Jul 2026 05:44:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29FB260388;
	Wed, 22 Jul 2026 05:44:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E552011BD3D11;
	Wed, 22 Jul 2026 07:44:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784699059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CZXZfPN0zjrEySUQAj85FsT+3iBCyAZqj0nr93wtUHk=;
	b=YNlDD9TfwQCSccMLZVJL0CFoFSvqbO4/PuFTVjI61RYVuuy8ac3hWsqcMDDk6edxQvbksq
	QxYr3o/D7lTnZL1TF9VJ2FmwEWp7nfLsbE/dagaxK9f9P6FBSVxkngB48YGYFz5Va9xw9q
	+9jfcHyfKr8vQipFundWsN9puozNgSRTojwFD2yAQVASjx7t166lirV7bISvdr9XqOyem9
	7KiLWMSs40ilkVA+A6txmZCZKalMLeUy/vgj1nfDp3VhgnXqKJrAKpy2ozdh6/MjuPlsg6
	8/oLwe0oPFiuMTo9vHYc5MZVf+8juD/ONUCwg76eKM4lafxNxZ1UI3ci6aAuAQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 07:44:15 +0200
Message-Id: <DK4V0JE7DZAA.RIJN5PRHNUR5@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] libpsl: upgrade 0.22.0 -> 0.23.0
Cc: <openembedded-core@lists.openembedded.org>, "Khem Raj"
 <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Khem Raj" <raj.khem@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260720053526.1992240-1-khem.raj@oss.qualcomm.com>
 <DK41JOAOYZH7.1CPT2EN28HTX7@bootlin.com>
 <CAMKF1srZf_7W74C80pZf+u07rxC+FmsLs2EX_QiysTQ4z-pmiw@mail.gmail.com>
In-Reply-To: <CAMKF1srZf_7W74C80pZf+u07rxC+FmsLs2EX_QiysTQ4z-pmiw@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241585

On Tue Jul 21, 2026 at 9:21 AM CEST, Khem Raj wrote:
> On Mon, Jul 20, 2026 at 11:38=E2=80=AFPM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
>
>> On Mon Jul 20, 2026 at 7:35 AM CEST, Khem Raj via lists.openembedded.org
>> wrote:
>> > License-Update: copyright notice reworded, MIT terms unchanged
>> >
>> > Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
>> > ---
>>
>> Hi Khem,
>>
>> Thanks for the upgrade.
>>
>> We do have new QA issues:
>> ERROR: libpsl-0.23.0-r0 do_package_qa: QA Issue: File
>> /usr/src/debug/libpsl/0.23.0/src/suffixes_dafsa.h in package libpsl-src
>> contains reference to TMPDIR [buildpaths]
>> ERROR: libpsl-0.23.0-r0 do_package_qa: QA Issue: File
>> /usr/src/debug/libpsl/0.23.0/src/suffixes_dafsa.h in package libpsl-src
>> contains a reference to the build host HOME directory. If upstream
>> hardcodes a directory path that matches your home, you can set
>> OEQA_BUILDPATHS_SKIP =3D "/srv/pokybuild" in the recipe. [buildpaths]
>> ERROR: libpsl-0.23.0-r0 do_package_qa: Fatal QA errors were found, faili=
ng
>> task.
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4184
>>
>>
> Yeah, saw that on AB earlier, sent a patch to fix it just now. Please tak=
e
> that as well.

I did pick it. It's better now, but:

ERROR: libpsl-0.23.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-wo=
rker/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/libpsl/0.2=
3.0/temp/run.do_configure.829053' failed with exit code 1
...
| Configuring psl.1 using configuration
|
| ../sources/libpsl-0.23.0/docs/libpsl/meson.build:7:20: ERROR: Unknown var=
iable "cdata".
|
| A full log can be found at /srv/pokybuild/yocto-worker/qemux86-world-alt/=
build/build/tmp/work/x86-64-v3-poky-linux/libpsl/0.23.0/build/meson-logs/me=
son-log.txt
|
| Last 10 lines of meson-log.txt:
|
| --- stderr ---
|
|
| Configuring libpsl.h using configuration
| Pkg-config binary for host machine specified from cross file, native file=
, or env var as ['pkg-config']
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/qemux86-world-alt/buil=
d/build/tmp/work/x86-64-v3-poky-linux/libpsl/0.23.0/recipe-sysroot-native/u=
sr/bin/pkg-config) 3.0.3
| Configuring psl.1 using configuration
|
| ../sources/libpsl-0.23.0/docs/libpsl/meson.build:7:20: ERROR: Unknown var=
iable "cdata".
|
| ERROR: meson setup failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/4023

An you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


