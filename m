Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CF9D31A3D
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 10:01:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6938.1768384898192759533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 02:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vTE+j5bH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1FCF11A285D;
	Wed, 14 Jan 2026 10:01:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E93186074A;
	Wed, 14 Jan 2026 10:01:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABD17103C895C;
	Wed, 14 Jan 2026 11:01:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768384895; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jf5g8wfXjLBNIlb6Pw51cDS2VIGZrUj48G6+wu1eRy0=;
	b=vTE+j5bHKhSsBZr4qUJMnJyiqNT+jzVE0UW6/KjJ4I6xOIcHeVLnQBFbtXZJydKdhJvAzx
	ErIfsOnHKBO2omyzsdCl/ZlyD1OwfamB1URv0FJTX6NzL6h+WSqmX6sdzbxzwByBAXZK/M
	XoPEXgrJPMcPSEKbsSRHT2M8bocjf6MdrrE4BlD/KUQ/PfHhypQpdwp9jOEOIshJDgHxSe
	m++YgFd8zcIzZHwoi6uSwI/woRHldmtd6Ji/iarM6DPuT2fjbltQy6AO0ttBXrovpnGUie
	TeZBFhouAGUT/N0lLio40GagOFw8yJuNuIyZhCp8S+/I4y7NSRLSCiwJX5j0tg==
Message-ID: <a9021108-40b2-4620-8ca5-911fa99ab5ba@bootlin.com>
Date: Wed, 14 Jan 2026 11:01:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Move RISC-V recipe-specific configuration out of
 common includes
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, Khem Raj <raj.khem@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20260107151436.964819-1-joaomarcos.costa@bootlin.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260107151436.964819-1-joaomarcos.costa@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229312

Hello,

Gentle ping!

On 1/7/26 16:14, Jo=C3=A3o Marcos Costa wrote:
> This series moves RISC-V specific configuration out of linux-yocto.inc =
into a
> new inc file: linux-yocto-features.inc.
>=20
> By relocating these RISC-V specific settings, the configuration remains
> available for oe-core builds while avoiding unintended side effects for=
 external
> or custom recipes that require such include file.
>=20
> The first patch only changes u-boot, and u-boot contains only one versi=
oned
> recipe, so I kept it as it was in v1.
>=20
> Changes in v2:
> - As per the comments in v1, I created a new inc file that is now inclu=
ded in
>    the versioned recipes
>=20

Would you have any thoughts on this v2? Thanks.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

