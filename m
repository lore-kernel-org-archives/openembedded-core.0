Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6710D3C539
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:35:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14650.1765370101192515529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:35:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=QcTgoD3H;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0B5601A20A7
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 12:34:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCDF960714;
	Wed, 10 Dec 2025 12:34:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3A7B11931684;
	Wed, 10 Dec 2025 13:34:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765370098; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GkxXW419jxUpAaATD43Hgp/daXfmTWnuD5lfckXR+C0=;
	b=QcTgoD3HqqaefyYIdlR2sNkhp3SlEIs4LZgLJHSek/RoGtNHOmsjjkjyfiVBPrP6QsPHK7
	L8B2wUaBs29KGqLdPhTrvbwGHpyNTvgx4e8Yx71kZSXZItU+SQFHg5yz+Y8N/CVU3gSAan
	J+S2bIMhEcV7L5wAki7aAoJjtWqyZx3NnIkPkj8gjSR9EtA4DzQJQ1/3izj38fZF7f22IN
	GLtB5xfPMZJVOUTC1rOi5pda8fBF6Qruqp9aevqQb5X7g/0CmotFy7feAHJ3reewK6NY01
	q4/HuETxtkxdLnZ9vLkfeQdFWgOLBAE6bw/968tRzBYQ8jGZTarHQkVu8mxe9Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Dec 2025 13:34:56 +0100
Message-Id: <DEUJGY7DX7HR.18JETI2LY83QZ@bootlin.com>
Subject: Re: [OE-core] [PATCH] meson: upgrade to 1.9.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251209174220.2972106-1-ross.burton@arm.com>
In-Reply-To: <20251209174220.2972106-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 12:35:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227473

On Tue Dec 9, 2025 at 6:42 PM CET, Ross Burton via lists.openembedded.org w=
rote:
> Release notes:
> - Array `.flatten()` method
> - clang-tidy's auto-generated targets correctly select source files
> - Added Qualcomm's embedded linker, eld
> - Added suffix function to the FS module
> - Support response files for custom targets
> - meson format now has a --source-file-path argument when reading from st=
din
> - Added license keyword to pkgconfig.generate
> - New experimental option `rust_dynamic_std`
> - Rust and non-Rust sources in the same target
> - Swift/C++ interoperability is now supported
> - Explicitly setting Swift module name is now supported
> - Top-level statement handling in Swift libraries
> - Swift compiler receives select C family compiler options
> - Support for MASM in Visual Studio backends
> - Limited support for WrapDB v1
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Thanks for your patch.

I suspect this update is the source of the following error:

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/qemuarm-oecore/build/build/tmp/work/qemuarm-oe-linux-gnuea=
bi/core-image-sato/1.0/testimage-sdk/environment-setup-cortexa15t2hf-neon-o=
e-linux-gnueabi > /dev/null; meson setup --warnlevel 1 /srv/pokybuild/yocto=
-worker/qemuarm-oecore/build/build/tmp/work/qemuarm-oe-linux-gnueabi/core-i=
mage-sato/1.0/testimage-sdk/epoxygccq2bbt/build /srv/pokybuild/yocto-worker=
/qemuarm-oecore/build/build/tmp/work/qemuarm-oe-linux-gnueabi/core-image-sa=
to/1.0/testimage-sdk/epoxygccq2bbt/libepoxy-1.5.3 -Degl=3Dno -Dglx=3Dno -Dx=
11=3Dfalse;' returned non-zero exit status 1.
...
tmp/work/qemuarm-oe-linux-gnueabi/core-image-sato/1.0/testimage-sdk/epoxygc=
cq2bbt/libepoxy-1.5.3/src/meson.build:100:4: ERROR: required dependency mus=
t not be empty, "" was provided.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2819
https://autobuilder.yoctoproject.org/valkyrie/#/builders/67/builds/2864

I tried to get more log files from the worker, but it looks like they
are gone. Please tell me if I need to rerun builds to get more data.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


