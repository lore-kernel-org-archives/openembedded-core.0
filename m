Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D559BFD5316
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:16:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91704.1772183779186685787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:16:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hANLdjGm;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E284DC406A4;
	Fri, 27 Feb 2026 09:16:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EE725FE46;
	Fri, 27 Feb 2026 09:16:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 952571036934E;
	Fri, 27 Feb 2026 10:16:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772183776; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=z3cZcHySXmE3AuICh2Hquol6HwkWmk6/061uPJcYtAk=;
	b=hANLdjGmoQfCy6pSeV7Eea0xP0bFdVhTJwtnc9tWyBkdFoC/oF9X5IHO5iSzR5HZkjMXZ8
	it+qXxFb9jPLuZJBBkBatdhqESeQC+aHetr9kO1LczJgC1TPoToaNlVh7VRKjFJuTqBDWG
	qezkqi92vytMaKh+xswlEwIlgc/NSvOsVquT/XImQvpcHMNO4XQ2mcaVLuNStfoS8f2kT2
	YcRpzp40nku5T9UHzruBl4NOvO2MORZVzSZ/kLUnFMzlYmIh8ORT77ngfa0XW3b+J/2xqu
	xJ7zqtr1wejaZy5Q7EHYK54QHZFdzm2ChKFGGxQKX4kSKvj5rMnLiR8GCtR2dg==
Content-Type: multipart/mixed;
 boundary=990dab773caebb7e2f6c6d392365fde52ddfb99b7e8396d6b539858f4dac
Mime-Version: 1.0
Date: Fri, 27 Feb 2026 10:16:13 +0100
Message-Id: <DGPMPU6AOIVH.3E9XQEJBJMTZV@bootlin.com>
Subject: Re: [OE-core] [PATCH v6 0/7] rpm: 4.20.1 -> 6.0.1
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Robert Yang" <liezhi.yang@windriver.com>, <alex.kanavin@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <cover.1771409846.git.liezhi.yang@windriver.com>
 <DGIA0D4P60DI.1CA8PWS58YCCF@bootlin.com>
 <212e8187-1b6f-4c2c-8d57-97cc66387c56@windriver.com>
 <DGKMRZ496JHU.1T1MJETE5VNUN@bootlin.com>
 <CANNYZj9DHuV3rmaAsZsPcbZ2ZsbMrNe+keNgVazav=3hUnYQKQ@mail.gmail.com>
 <DGMFHKEHBIY4.24DUCLY3ZXN7N@bootlin.com>
 <01d72b81-ac28-409a-abea-99671fd3b214@windriver.com>
In-Reply-To: <01d72b81-ac28-409a-abea-99671fd3b214@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 09:16:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232089

--990dab773caebb7e2f6c6d392365fde52ddfb99b7e8396d6b539858f4dac
Content-Type: multipart/alternative;
 boundary=91ad1662036f49fd744ebce3b5ab538ce100c857cd7ae44e0be250dcee8d

--91ad1662036f49fd744ebce3b5ab538ce100c857cd7ae44e0be250dcee8d
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=UTF-8

On Thu Feb 26, 2026 at 5:00 PM CET, Robert Yang wrote:
>
> Sorry, but I still can't reproduce it, would you please help to try:
>
> $ git fetch https://github.com/robertlinux/yocto rbt/rpm
> $ git merge FETCH_HEAD
> $ . oe-init-build-env ../../build
> Add the following lines to conf/local.conf:
> PACKAGE_CLASSES =3D "package_rpm"
> OE_FRAGMENTS +=3D 'machine/qemux86 distro/poky'
> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder'
>
> $ bitbake core-image-sato -cpopulate_sdk
>
> I checked the manifest file, the error packages were installed correctly.
>
> Would you please help to send me the error build's conf/local.conf and=20
> conf/bblayers.conf?
>
> // Robert
>
>>=20
>> Thanks,
>> Mathieu
>>=20

Hi Robert,

I did reproduce this again, here are as much data as possible about my
build setup:

- I'm using an ubuntu 24.04 docker.
- oe-core version: either your rbt/rpm branch or
  oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3239 from
  poky-ci-archive [1].
- bitbake version: either today master branch or
  bitbake/autobuilder.yoctoproject.org/valkyrie/a-full-3239 from
  poky-ci-archive.
- meta-yocto version: today master branch.
- Attached configuration.

You will need to adapt my configuration, at least to fix layer paths and
DL_DIR / SSTATE_DIR.

[1] : https://git.yoctoproject.org/poky-ci-archive

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--91ad1662036f49fd744ebce3b5ab538ce100c857cd7ae44e0be250dcee8d--

--990dab773caebb7e2f6c6d392365fde52ddfb99b7e8396d6b539858f4dac
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=conf-rpm-failure.tar.bz2
Content-Type: application/x-bzip2; name=conf-rpm-failure.tar.bz2

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
--990dab773caebb7e2f6c6d392365fde52ddfb99b7e8396d6b539858f4dac--

