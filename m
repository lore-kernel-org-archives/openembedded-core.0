Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C45A3D6555B
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:20:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13745.1765974031520758104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WMWgsHVI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 915674E41C5A;
	Wed, 17 Dec 2025 12:20:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66FB46072F;
	Wed, 17 Dec 2025 12:20:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FC9411952A69;
	Wed, 17 Dec 2025 13:20:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765974028; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GZH1lGJjW/MV3emJ78lJ9X8b3n0hrb+zlHfR1fwPcNA=;
	b=WMWgsHVI9wGSqgBUxTfYhnperWaHglsfc07qRxRr7HjEQAfzNJVDdYSKDQJBSVjzMa/wRR
	XnfbojVXQoC5mOZnraHt4hEYAdFXW00VOVIP8uH++NfdPdtuYbRoEP2IE9zzHwPhENZA05
	s2tynMLjrnOsGKEDhGQ37WQLNLuRN4G6kuD1Kp9kSMAKDPG1dRCEWKPjmtTkj3GR3Ze8yW
	GTSNQtV1NjFuAs4a05xtCRM2FCoXtlBVINekkNUh4LW1GeU0O5TAaxBs2RDxUk0lGsK/mm
	hSJDneRF7/kSz52o2DvSpJwNhXLGyh2Au6h85xAsYUSPmVufceVTw9B3dqXkeQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 13:20:26 +0100
Message-Id: <DF0HJNZXHLW4.2ZJNCZUGHYZ9F@bootlin.com>
Subject: Re: [OE-core] [PATCH] patchtest: reject Upstream-Status after
 scissors
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "Steve Sakoman"
 <steve@sakoman.com>, "Yoann Congal" <yoann.congal@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: =?utf-8?q?=D0=9B=D1=83=D0=BA=D0=B0_=D0=9A=D1=80=D1=81=D1=82=D0=B8=D1=9B?= <lukakrstic031@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251215204507.1675-1-lukakrstic031@gmail.com>
 <DF0B0V3GOP92.D0RPEBV393KB@bootlin.com>
 <CABTLy3aZichqpsbZn3m84i-6b7_FdDgoCSkig3=SYQYWLvA66Q@mail.gmail.com>
In-Reply-To: <CABTLy3aZichqpsbZn3m84i-6b7_FdDgoCSkig3=SYQYWLvA66Q@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228032

On Wed Dec 17, 2025 at 8:25 AM CET, =D0=9B=D1=83=D0=BA=D0=B0 =D0=9A=D1=80=
=D1=81=D1=82=D0=B8=D1=9B wrote:
> Hi Mathieu,
>
> Thanks for the quick feedback.
> I am based on the scarthgap branch.
> I guess that is not good. Can you tell me what should be the base?
>

Hi Luka,

So I believe you wanted to get this patch merged in the scarthgap
branch, which raises two points:
- any change you want to contribute in a stable branch must have been
  first accepted in the master branch, except if it does not make sense
  to merge it in master.
- patches targeting a stable branch must include the branch name in the
  mail prefix.

More details can be found here:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#sub=
mitting-changes-to-stable-release-branches

So given the content of your patch, I believe this should be first
merged in master.

Also, backport in stable branches should be reserved to bug or security
fixes. I'm not involved in this decision, but I'm not fully convinced
this patch meets the requirements.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


