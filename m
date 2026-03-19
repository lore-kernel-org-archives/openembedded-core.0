Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE06109023A
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 15:04:01 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13231.1773932640244857907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 08:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eeaVt0fp;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C596DC5507D;
	Thu, 19 Mar 2026 15:04:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B2B385FDEB;
	Thu, 19 Mar 2026 15:03:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52A77104509C6;
	Thu, 19 Mar 2026 16:03:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773932637; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hxVVriKLxY+PA0x85NYNsq0Ra67ZhTI7RoEFQ/pOb9w=;
	b=eeaVt0fpaUpfqOLTIr1uApAzwVOinJ+0twuu4c78T/9vPyf9KwUb85CEBfvu6oKbtXYAqv
	8OHif7CWZJ61nkd5jsNK2XXdU7eRptVFncWn24Z8Gvx5yKsntyKzorvyDuEv8IhS6RJ3Gc
	+hI0m/VpKnFuqoWx7JVC9OoXJQ/WrPfDF7Oz8P4JmliYyWReCondEA0aWW4XKoZzYp2iDg
	kdUyfXj0cNDO083/tR7STxr/rGFN/QBMZf2Qenw/iziN4JQtHFHjqEJsUr0LB8QAdiZZz0
	SMiMA8JODS4rCU6gl6EQvS/QqpU9KfqsOVB0MDVqYey3VH8ZjkokpEXaPwoB8w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 16:03:54 +0100
Message-Id: <DH6UMY6OUZES.7NVRN7J9CUFU@bootlin.com>
Cc: <richard.purdie@linuxfoundation.org>, <rybczynska@gmail.com>,
 <ross.burton@arm.com>, <peter.marko@siemens.com>, <jpewhacker@gmail.com>,
 <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Benjamin Robin" <benjamin.robin@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] sbom-cve-check: Add class for post-build CVE
 analysis
References: <20260319-add-sbom-cve-check-v5-0-e310cce7399d@bootlin.com>
 <20260319-add-sbom-cve-check-v5-1-e310cce7399d@bootlin.com>
In-Reply-To: <20260319-add-sbom-cve-check-v5-1-e310cce7399d@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 15:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233530

Hi,

On Thu Mar 19, 2026 at 3:41 PM CET, Benjamin Robin wrote:
[...]
> diff --git a/meta/conf/fragments/yocto/sbom-cve-check.conf b/meta/conf/fr=
agments/yocto/sbom-cve-check.conf
> new file mode 100644
> index 000000000000..1cdb83117387
> --- /dev/null
> +++ b/meta/conf/fragments/yocto/sbom-cve-check.conf
> @@ -0,0 +1,7 @@
> +# This fragment enable sbom-cve-check with recommended options
> +
> +IMAGE_CLASSES:append =3D " sbom-cve-check"
> +SRCREV:pn-sbom-cve-check-update-nvd-native =3D "${AUTOREV}"
> +SRCREV:pn-sbom-cve-check-update-cvelist-native =3D "${AUTOREV}"
> +SPDX_INCLUDE_VEX =3D "all"
> +SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"

You need to define a summary and description of the fragment, see
https://docs.yoctoproject.org/dev-manual/creating-fragments.html.

Antonin

