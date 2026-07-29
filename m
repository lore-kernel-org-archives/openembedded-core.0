Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B642CC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 07:31:55 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6213.1785310305840113462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 00:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ece54iCT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 977BD4E40FD8;
	Wed, 29 Jul 2026 07:31:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B1086039A;
	Wed, 29 Jul 2026 07:31:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34BB011C14A1C;
	Wed, 29 Jul 2026 09:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785310297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F3lH/K6VQKsr+ke73dUchUs9cJJIjn0v/pTRbyU7sdY=;
	b=ece54iCTAGdGjvKwu6LAsqvYLSXV8l5HkCb2Ey1fLe433e4TfpgrOLo8aw8VfHiKhpUTYe
	UK6gwjgqqluKiY38y+jJ4NPWEMw50gCSu7nYJl9wo/WohkqbpAUMF9m4ZplCj+husqCjxT
	Epaj9f57scAtsIeF4yEgFOS6Mr0R07l0LbTfkXNP2CuRS/KvlFHNJYnVUYLT6Ok6aoX1uu
	1VQ3oPjW24mhPMIDqlvWrYgY6rpQmNt5P6JBtLKqq/nVtGV2igg5ly9bs90jiutFju+r+0
	8WrID3VcnzGOxSzG/N58Kyyjpzd+alug6/yYlzn/7ZwnLbfFLjD70enMJTIX3g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jul 2026 09:31:31 +0200
Message-Id: <DKAVOHK3YNW3.24BG69QDIRWXD@bootlin.com>
To: "Gavini, Sumanth" <sumanth.gavini@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v10 0/8] rpm: 4.20.1 -> 6.0.2
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "mattware@cisco.com"
 <mattware@cisco.com>, "esparlin@cisco.com" <esparlin@cisco.com>,
 "peter.marko@siemens.com" <peter.marko@siemens.com>, "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260727225602.342005-1-sumanth.gavini@windriver.com>
 <DKAAZ5IAJSBB.1KM0W7EA9ARM8@bootlin.com>
 <18C68B13D5EABE33.1674579@lists.openembedded.org>
 <25b06551-b8d5-43d8-a494-217ff2ad8116@windriver.com>
 <DKATWSO7B1U7.IDPWKARHM1IG@bootlin.com>
In-Reply-To: <DKATWSO7B1U7.IDPWKARHM1IG@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 07:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242256

On Wed Jul 29, 2026 at 8:08 AM CEST, Mathieu Dubois-Briand wrote:
> On Wed Jul 29, 2026 at 3:25 AM CEST, Sumanth Gavini wrote:
>> Hi Mathieu,
>>
>> I tested the v10 patch on the top of master branch and couldn't=20
>> reproduce the autobuilder-reported failures on my local machine. Could=
=20
>> you please check again and confirm if the issue is still present?
>>
>> These are the bitbake recipes I tested
>>
>> 4248:
>> -bitbake core-image-sato core-image-sato-sdk core-image-minimal=20
>> core-image-full-cmdline core-image-sato:do_populate_sdk -k  //pass
>> -bitbake core-image-sato-sdk:do_rootfs //pass
>>
>> 4228:
>> -bitbake core-image-sato core-image-sato-sdk core-image-minimal=20
>> core-image-full-cmdline core-image-sato:do_populate_sdk -k //pass
>> -bitbake core-image-sato:do_populate_sdk //pass
>>
>> 4210:
>> -core-image-minimal-dev:do_rootfs  //pass
>> -bitbake core-image-sato core-image-sato-sdk core-image-minimal=20
>> core-image-minimal-dev core-image-full-cmdline=20
>> core-image-sato:do_populate_sdk core-image-minimal:do_populate_sdk_ext=
=20
>> core-image-sato:do_populate_sdk_ext -k //pass
>>
>> 4211:
>> -bitbake core-image-sato:do_populate_sdk //pass
>> -bitbake core-image-sato core-image-sato:do_populate_sdk=20
>> core-image-minimal:do_populate_sdk_ext -k // pass
>>
>> 4394/4213/4458:
>> -bitbake core-image-minimal:do_rootfs //pass
>>
>> All of the above completed successfully on my local setup.
>>
>> Thanks,
>
> Hi Sumanth,
>
> I did reproduce the first failure locally.
>
> I'm using these tags for bitbake/oecore, to get the same version as
> my autobuilder build:
> https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Dbitbake/autobuilder=
.yoctoproject.org/valkyrie/a-full-4309
> https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.=
yoctoproject.org/valkyrie/a-full-4309
>
> In my local.conf, I have the default template, with these additions:
> SDKMACHINE =3D "x86_64"
> PACKAGE_CLASSES =3D "package_rpm package_deb package_ipk"
> INHERIT +=3D 'image-buildinfo'
> IMAGE_BUILDINFO_VARS:append =3D ' IMAGE_BASENAME IMAGE_NAME'
> IMAGE_INSTALL:append =3D ' ssh-pregen-hostkeys'
> SANITY_TESTED_DISTROS =3D ''
> OEQA_TESTDISPLAY =3D ':1'
> EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow=
-root-login'
> OE_FRAGMENTS +=3D 'machine/qemux86-64 distro/poky'
>
> Then, both of these builds are failing:
> bitbake core-image-minimal-dev
> bitbake core-image-sato:do_populate_sdk
>
> Thanks,
> Mathieu

Just to be sure, I applied your series directly on top of master: I've
got the same issues:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/4350

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


