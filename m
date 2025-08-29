Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6E8CA0FF9
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 12:26:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.12032.1756470369891454624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 05:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sJB+m2K0;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 562CAC8F1C9
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 12:25:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEC75606B9;
	Fri, 29 Aug 2025 12:26:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9E6D1C22D6C3;
	Fri, 29 Aug 2025 14:26:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756470367; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GU7uxYLmf1aj9vsK/qt3q8hmdaI2Yb8EzxBJWEaquAE=;
	b=sJB+m2K0XPGv2zB3Tz5q2nKMPwn5RN086gHwHMQWGIxZ6POKn6AxGBp2T4RQKF+0ZPZPmE
	fW/wPMuO8c2DRa0Ppyz5co0WncusNuRd6dGH0fpFfg8eg9QJSaukeB/BDrhRUonlI2mKNe
	OsEMVe76Fbu9aO3mNB7Q4F8URjQ7RejDHm2RaZYB5kBn87AD4bzuDVBJMqHjn4WD+rwGW/
	sH5VBvwCe6GqSq0t/19pYTCRezhtC/O8WniGtefgOaC/+buI5lT0dH4TBTL51CtetBY3eY
	+ZTK60UnCrBrd1XidyVDgflfuEqp/HrKHbDFGwF4zljManDTmKblS+PAGNbWxA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 14:25:52 +0200
Message-Id: <DCEWRWL8JERQ.2E0LLYEPO0PZ0@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 3/3] kea: Upgrade to 3.0 LTS release
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250829033635.115107-1-raj.khem@gmail.com>
 <20250829033635.115107-3-raj.khem@gmail.com>
In-Reply-To: <20250829033635.115107-3-raj.khem@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 12:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222611

On Fri Aug 29, 2025 at 5:36 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> * Drop backported patch and refresh remaining
> * Add fixes to build with boost 1.89.0
> * Switch to meson build system
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for your patch.

It looks like the kea recipe has some QA issues:
ERROR: lib32-kea-3.0.1-r0 do_package_qa: QA Issue: lib32-kea: /usr/lib/libk=
ea-eval.so.84.0.0 contains probably-redundant RPATH /usr/lib [useless-rpath=
s]
ERROR: lib32-kea-3.0.1-r0 do_package_qa: QA Issue: lib32-kea: /usr/lib/libk=
ea-d2srv.so.63.0.0 contains probably-redundant RPATH /usr/lib [useless-rpat=
hs]
ERROR: lib32-kea-3.0.1-r0 do_package_qa: QA Issue: lib32-kea: /usr/lib/libk=
ea-log-interprocess.so.3.0.0 contains probably-redundant RPATH /usr/lib [us=
eless-rpaths]
ERROR: lib32-kea-3.0.1-r0 do_package_qa: QA Issue: lib32-kea: /usr/lib/libk=
ea-cryptolink.so.64.0.0 contains probably-redundant RPATH /usr/lib [useless=
-rpaths]
ERROR: lib32-kea-3.0.1-r0 do_package_qa: QA Issue: lib32-kea: /usr/lib/libk=
ea-http.so.87.0.0 contains probably-redundant RPATH /usr/lib [useless-rpath=
s]
ERROR: lib32-kea-3.0.1-r0 do_package_qa: QA Issue: lib32-kea: /usr/lib/libk=
ea-dhcp_ddns.so.68.0.0 contains probably-redundant RPATH /usr/lib [useless-=
rpaths]
ERROR: lib32-kea-3.0.1-r0 do_package_qa: QA Issue: lib32-kea: /usr/lib/libk=
ea-util-io.so.12.0.0 contains probably-redundant RPATH /usr/lib [useless-rp=
aths]
ERROR: lib32-kea-3.0.1-r0 do_package_qa: QA Issue: lib32-kea: /usr/lib/libk=
ea-stats.so.53.0.0 contains probably-redundant RPATH /usr/lib [useless-rpat=
hs]
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2142
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2298
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1038

Can you have a look at these issues please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


