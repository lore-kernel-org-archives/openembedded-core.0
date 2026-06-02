Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D23ACD6E60
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 16:24:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2390.1780417438510534926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 09:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=QNooonAr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 899B21A37BD
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jun 2026 16:23:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50EB4603BC;
	Tue,  2 Jun 2026 16:23:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 972CE10888CB8;
	Tue,  2 Jun 2026 18:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780417435; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SZkH1Ze1DYl8HZLQlNZuvShOzh+LfxsjZ3ddWk9Zl80=;
	b=QNooonArF0hqLFAAYIHU2DTRorRte64Gi8COAOHVxKA4pvkSGCDZAjrC1SDuPB8nL90ecn
	PhtplVsXEy3zaGuMyndWp/8kOsVyJBtMDAsEhgHzC6+bx52mvZXB9rrfTU/qPzjSrG54zQ
	EnJ374qmjN1oaZEk9TbhoP3HZuRG8OAYzW04zE1URD9ZRARXMOVldaZ+7mxPZ0Y8nIf0vn
	vXSc1h0VHXu7IDgGJQXXVT4gakGuh0dNFxkVhuCeCgQk9x0qlelqpvINb37qv4o0adHwyk
	k/9q0YBYCOw43+bu0q4o30XN/m4RQUatcQjtiqMglO1KqXI4VMRgIp4g29IpPw==
Message-ID: <f3dfa28b-0fd1-4035-911d-7266064613a2@bootlin.com>
Date: Tue, 2 Jun 2026 18:23:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] u-boot-tools: include dtc yaml patch
To: frederikbraendstrup@gmail.com, openembedded-core@lists.openembedded.org
References: <20260602085022.3925257-1-frederikbraendstrup@gmail.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260602085022.3925257-1-frederikbraendstrup@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 16:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238064

Hello, Frederik

On 6/2/26 10:50, Frederik Br=C3=A6ndstrup via lists.openembedded.org wrot=
e:
> This patch was recently added to u-boot itself, but u-boot-tools also
> need this to avoid the need for libyaml which was dropped
>=20
> Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
> ---
>   meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb | 2 ++
>   1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb b/meta/rec=
ipes-bsp/u-boot/u-boot-tools_2026.04.bb
> index 7eaf721ca8..6c3ef7efd1 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
> @@ -1,2 +1,4 @@
>   require u-boot-common.inc
>   require u-boot-tools.inc
> +
> +SRC_URI +=3D "file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch=
"

This change was already merged in master branch. Please see:
e10fa40acd41e4622e74b154b38a4aeb2182fe6e: u-boot: move DT validation=20
yaml removal patch to SRC_URI.


--=20
Best regards,
Jo=C3=A3o Marcos Costa

