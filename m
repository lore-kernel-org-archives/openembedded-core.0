Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0878ECD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 22:55:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1911.1778280939522288563
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 15:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=srfKOeSA;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D4FF7C5DC73;
	Fri,  8 May 2026 22:56:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 56469605D0;
	Fri,  8 May 2026 22:55:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B48F10819D7A;
	Sat,  9 May 2026 00:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778280936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2kBIHQCZ0vVJGpysYioz5JxtmcYAjjbC+Tic/o1NfqE=;
	b=srfKOeSApVDSBNl0dyLHspufJDX/sUODJNhh6PbXJ5zvRBQ/YgI6Lhtk9ds4lcx/UJLt9J
	zbz/csw1oTvM4xT8v/GIOY0NWbpfet7ybDSXl1MKIIsvUy71+zaaz4m8+lcLSYWWDbDh3k
	T59/PWZeYyj7IUhQ/l6LRh9zpG6NCdQ0qwP3mn+QTuztRP2q8qwjIFmalzbKahV1qoSMmz
	7vx0McQbsD/tWOPaYiGzQrRbVhDmZwh1hYjpOPa+S9UQGRnRnkmkgZKceB7qsfH44NHlbV
	YE5/1rBcK+bQ8fe0dtDZmm0S8LWSoRFIw33kDLquywb2EMlTO6q1rYF/D+kDkg==
Message-ID: <f531466a-fbd8-472b-a2b1-e487eea6d51a@bootlin.com>
Date: Sat, 9 May 2026 00:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: dmitry.baryshkov@oss.qualcomm.com,
 Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
 <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 22:55:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236747

Hello,

On 5/8/26 21:09, Dmitry Baryshkov via lists.openembedded.org wrote:
(...)
>=20
> We are fetching the source basing on the PV. The patch might be
> applicable or might not. I'd suggest listing the patch twice: in the
> u-boot_2026.04.bb and u-boot-tools_2026.04.bb.
>=20
> (in fact I did that in a local patch, it's good that I checked the ML
> before sending it).

I agree with this approach. Also, even if someone does not like seeing=20
the same patch applied in two different recipes, the patch was already=20
merged upstream and should be available in v2026.05 (I hope?). So, in=20
any case, we will drop it soon enough.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

