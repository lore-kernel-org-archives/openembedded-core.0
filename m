Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792CFCA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 15:30:22 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.21781.1757518213677523490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 08:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=htdTmTwc;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2180AC6B385;
	Wed, 10 Sep 2025 15:29:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E3156606D6;
	Wed, 10 Sep 2025 15:30:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B293102F29AB;
	Wed, 10 Sep 2025 17:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757518207; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=959HBpyUPkulb5vjv8AOEKCxAShNcWSLlqPgQy7LhFE=;
	b=htdTmTwcSPHVtHB9jByk7UuZPlE9SVVahRr9rh4OrO9bQznWewTE0m6StwOs1zasnyVLWR
	oPunGf1ozyoSXbwDvptONAl2Q44bdushW0/5SaV0ebHKxGmIKeN4QRBEgIvvjKS+0oEVKr
	Hg1Wto+sRqZxIM5LojLySV739f0fkWtrP+1PwBmpVRqsfp1LEineDWRAT1sQXyea4tALRl
	qcz1RZPT3HQd+eZU9SNnG9vt5o1/8R37qB24W2W5udVX1rLhkqVyecKq7LVY31ljQsdbWj
	SaYeHOWSd5792geT50vqCCnqv5xroBEwGywGrTKxRlnxpH2T9HrrcfYPpaeMJg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 17:30:06 +0200
Message-Id: <DCP87HYRXEEP.FPUKTEDSBO5C@bootlin.com>
Subject: Re: [OE-core] [PATCH 12/40] libdisplay-info: upgrade 0.2.0 -> 0.3.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250910091646.998-1-wangmy@fujitsu.com>
 <20250910091646.998-12-wangmy@fujitsu.com>
In-Reply-To: <20250910091646.998-12-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 15:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223225

On Wed Sep 10, 2025 at 11:16 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>

Hi Wang,

Thanks for the package update.

I believe this one is responsible for a weston configure error:

ERROR: weston-14.0.2-r0 do_configure: meson failed
...
| ERROR: Subproject display-info is buildable: NO
| Message: Required by DRM-backend.
|
| ../sources/weston-14.0.2/libweston/backend-drm/meson.build:5:22: ERROR: A=
utomatic wrap-based subproject downloading is disabled
|
| A full log can be found at /srv/pokybuild/yocto-worker/qemux86-world/buil=
d/build/tmp/work/x86-64-v3-poky-linux/weston/14.0.2/build/meson-logs/meson-=
log.txt
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2357
(same build as the nghttp2 build error)

Can you do something about it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


