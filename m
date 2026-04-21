Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CF5F327AD
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 06:33:27 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12992.1776753202535800484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 23:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=f5VJGpps;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 379D9C5C9A4;
	Tue, 21 Apr 2026 06:34:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 038A4600D2;
	Tue, 21 Apr 2026 06:33:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6B3210460A05;
	Tue, 21 Apr 2026 08:33:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776753199; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=f+DASDptzFCbKMmg5Wm6QD1Wd7FV+Ih7Sp+Y1u/MhX0=;
	b=f5VJGppslfjwYVJC4VHFG8QWUUIu5Hz3zQxcHQy+rOI2TXdTdsLTe1vjwaxzsTr+QvsNzo
	VwU20qVgOV97egiHh32OCAX2BjY4sWNROD4Co1LlnN4qlj6nFNUtkYPXYKstLDZCkr+Kqj
	Q6DM+sTN8ofs2KGAP1eYlFL8Emd112f41rsb1J/APHihROkWob8imKNBvPCZh6i6phdTYt
	nrW+VNd6KQ8RQm6nGN5H3Wzk15SESG4tlmwnp1pGruZbypUI9g1i8OEHSrGbXzBzIW0Chf
	0BQnNLlcuo9Vg+K2fT/+91K75EEjK/e5HW+HLZ1BARhz3IWB8EdNLKBof9f5pQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 08:33:17 +0200
Message-Id: <DHYMFYTDT2Y0.20Y7SZBLOB59@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] lttng-tools: upgrade 2.14.1 -> 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260420110657.1831-1-wangmy@fujitsu.com>
In-Reply-To: <20260420110657.1831-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 06:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235600

On Mon Apr 20, 2026 at 1:06 PM CEST, wangmy via lists.openembedded.org wrot=
e:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> disable-tests2.patch
> refresshed for 2.15.0
>
> 0001-tests-do-not-strip-a-helper-library.patch
> removed since it's not available in 2.15.0
>
> 0001-common-Autodetect-musl-libc-and-fix-C-compilation-er.patch
> added to fix compile error when enable musl
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi,

Thanks for the new version, but we still have the same issues as with
the previous one: ptest and reproducibility test are failing.

I get the reproducibility one might be a bit long to run, but don't you
have the possibility to reproduce the ptest failures on your side?

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3863
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3518
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3539

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


