Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D81ECCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 15:39:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.498.1760629171182778624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 08:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I2u16ajc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09F00C041C9
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 15:39:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3943E6062C;
	Thu, 16 Oct 2025 15:39:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BDA6102F2317;
	Thu, 16 Oct 2025 17:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760629168; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xm3wY/GOrpV5/rv4C5wqcz45cvxFeONlm/XrGSQueNw=;
	b=I2u16ajcmqu1CvUNoCZrcZ8FlOEyj+41OOlt6JUm2/HIv4JQw6CpqBg8/uCH5e+vfOpfkx
	mSvUKH5nghFbnEeNrc/9PKVqOWy2zX+jPMrui6L5JyS88ebuLmPd2TFIg4Aye0dwRvvnSK
	5g4krrPHGXyFdCrVVU0zaVg/Td5ybAYo5ClTzyndlIBwNS2u7x11X7DF+Ol2pptCZrenoW
	aOMeRXSjSuNZvKJK4GcLI0b0ws39BCQdAL1EuB2cMevYSHTYdhT0lBZRWrDQ3ZOClXCKVx
	bTdJDkiKTIF2PV8YWK3c8ohVhkvp3c8rO/7DDA0Rj/VH386lzr/SmXpoIS6f6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 17:39:26 +0200
Message-Id: <DDJUY91C0269.2QMM9NMD7SA2G@bootlin.com>
Subject: Re: [OE-core][PATCH] package_manager/oe-pkgdata-util: fix
 complementary package installation
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250924084233.3429501-1-Qi.Chen@windriver.com>
 <CO6PR11MB560294040AD5A59501524E32EDE9A@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB560294040AD5A59501524E32EDE9A@CO6PR11MB5602.namprd11.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 15:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224974

On Thu Oct 16, 2025 at 10:35 AM CEST, Chen Qi via lists.openembedded.org wr=
ote:
> ping
>

Hi Chen,

I confirm this patch is still in the master-next branch. It is still
considered to be merged, but this is a non-trivial change and nobody had
the bandwidth to review it so far.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


