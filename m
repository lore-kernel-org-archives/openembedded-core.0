Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C04C5B572
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 12:17:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5601.1787401012005113975
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 05:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=eW/cxojX;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BD5C51A1763;
	Sat, 22 Aug 2026 12:16:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8690B604C4;
	Sat, 22 Aug 2026 12:16:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90A9111C77A18;
	Sat, 22 Aug 2026 14:16:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787401005; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3aekw+LWDFX/mZ7ABsquoUP2xG0Jx21jPXctsuAZv98=;
	b=eW/cxojXI4Nv3J73Q6ZXG3ui3//NFSkipg7FE0gmFYHv7+rRhacilxO0d5H/gdAxa/VTYG
	jjxUZRwWwzoJbvE1+ct80M2+POVVHulAg8/szXMMqdS+FV4udW7CM9n0xfmOA7xWANrE7k
	1Bnf2+3PjgQGtdCv99otYJDpHgFZwkseoUrWb/WNKG9Uc6KtsGjef0HeOFJO6wZJ43Xh7Y
	dOQPaRCAIejRFw2VXUnb4Iz4n/Zu8+h5srhJcgXwLppEWkRfnrUIoEOSEflFPgbrNngltm
	wMBWUiwDBmgpePJI8H8zkn9CWPybrgn/LUgMrI71Ypj5I+ajGOx7vdEXRutI5A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 22 Aug 2026 14:16:41 +0200
Message-Id: <DKVGRWKPI3K2.1PBICS35XGJYK@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: =?utf-8?q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>,
 <openembedded-core@lists.openembedded.org>,
 <richard.purdie@linuxfoundation.org>, <ross.burton@arm.com>, <rs@ti.com>
Subject: Re: [PATCH v2] bitbake.conf: Extend distro feature usrmerge to
 merge bin+sbin
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <ada29b3926f0497ef35618685c298cad840f45e0.1784883539.git.joerg.sommer@navimatix.de> <aolV39x9UzHwcTrZ@navimatix.de>
In-Reply-To: <aolV39x9UzHwcTrZ@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 12:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243973

On Sat Aug 22, 2026 at 9:56 AM CEST, J=C3=B6rg Sommer wrote:
> J=C3=B6rg Sommer schrieb am Fr 24. Jul, 11:00 (+0200):
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> The split of bin and sbin became more artificial over time, and it is no
>> longer clear why programmes goes into the one or the other directory; e.=
g.
>> forever normal users have used sendmail in /usr/sbin, and fdisk and mkfs
>> learned to operate on files to create images long ago.
>
> Gentle ping. What's the state of this?
>

Hi J=C3=B6rg,

Previous builds showed some errors. Should it have evolve since that?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


