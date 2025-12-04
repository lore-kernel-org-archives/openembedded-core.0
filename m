Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A553D1F9BD
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 11:08:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41040.1764846481414553120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 03:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qG3jvrRt;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4019B4E41A3B
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Dec 2025 11:07:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 150B76068C;
	Thu,  4 Dec 2025 11:07:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7CD31192227F;
	Thu,  4 Dec 2025 12:07:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764846478; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AZdyMz60u0AL85jt9MM4vNvLFMD/w3Qx3FRQnVqv3uY=;
	b=qG3jvrRt1DTxJp0ImZZt5lJgp0nOmmU3JH+ouQ98ooBs3siEuJ+QpTXQVngZ7Xw2Nx2pqi
	pm8L+kmNZhI0329wRBlDBB8pMyaqTyax9lXDE4wHtr18Ogw98Q/yM50Ms5MbCV7/6o8A7B
	zGK3pGLH67dAeI/dhABZwbHg8NWSjZrCmnZH3RxHwijO09l2BwDhtUUlpIgyUQD41GGe6v
	fvZWH30tzBk0skduzxkS7k5FP0P0UaVO8kgVPy/tZq+K2iTV0DWm9nSX+aEM/5TVAuv0is
	Tj7TTsrAklbQQ+i9U4QQtef332kB62TIAWGfQouy+HrQBFQqew8mwM3Zu+s4xA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 12:07:56 +0100
Message-Id: <DEPDV2RI1IP0.DSA9QJSL75ZT@bootlin.com>
Subject: Re: [OE-core][PATCH 3/3] util-linux/util-linux-libuuid: upgrade
 from 2.41.1 to 2.41.2
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251204064429.559529-1-Qi.Chen@windriver.com>
 <20251204064429.559529-3-Qi.Chen@windriver.com>
In-Reply-To: <20251204064429.559529-3-Qi.Chen@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 11:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227280

On Thu Dec 4, 2025 at 7:44 AM CET, Chen Qi via lists.openembedded.org wrote=
:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The following two patches are dropped as they are in new version:
>   util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
>   util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.pa=
tch
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi Chen,

Thanks for your patch.

It looks like this is breaking some ptests:

AssertionError:
Failed ptests:
{'util-linux': ['misc:_colors']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2673
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2717

Ptest results can be found here:

https://valkyrie.yocto.io/pub/non-release/20251204-56/testresults/qemuarm64=
-ptest/core-image-ptest-util-linux/
https://valkyrie.yocto.io/pub/non-release/20251204-56/testresults/qemux86-6=
4-ptest/core-image-ptest-util-linux/

Can you have a look at these?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


