Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F633CCD1BE
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 14:00:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.21807.1761227993786209809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 06:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LoW4LZA1;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 17614C0C426
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 13:59:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7F3F6068C;
	Thu, 23 Oct 2025 13:59:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C842E102F2467;
	Thu, 23 Oct 2025 15:59:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761227991; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UXAtOEFRpw2g3sohudEjGol2dTjZ3OPtPpTngl7gDUE=;
	b=LoW4LZA1FrCuz3FRpPC1l06wB3mBJUm5RfDSQyeJQBI4+eDdaGqA9RVhZah17/0kK58es3
	nnRuHBZg0umGUmnoyN20dGfXhGoOMGS0/doLZX/MQcgGsm3GE62MVmdBVDvQAuhy6fRtqv
	kUIsgNCBwFvKCp0XZ8g58VTKfrMt1l8YkGPOJpZcYbW3QvEC3DA9Yck7GSm1OJIFfa+Awa
	hdc/Vb7QK8Y5IFFpwOFuLCPyJenvmGweu2Lzl13JgWXZxMfMC4d1H6Z7wWT62LuidQ1OOF
	tlWPWdsVjw324DtVPh2+Kw1GDmJyVzJhMX7UwRq87WM9swCzdaSQZIoU0coOtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Oct 2025 15:59:46 +0200
Message-Id: <DDPR7R73DELR.2Y5IAUSDAMH1M@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] libxslt: add ptest support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251022203158.7806-1-pratik.farkase@est.tech>
 <20251022204136.8276-1-pratik.farkase@est.tech>
In-Reply-To: <20251022204136.8276-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 14:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225263

On Wed Oct 22, 2025 at 10:41 PM CEST, Pratik Farkase wrote:
> Add ptest support for libxslt 1.1.43 including:
> - do_compile_ptest and do_install_ptest
> - test data installation
> - cleanup of buildpath references
> - added run-ptest installation
>
> Enable --with-plugins only when ptest is enabled, per review feedback.
>
> v3:
> - Remove unconditional --with-plugins (leftover from v2)
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

It looks like we still have some ptest issues:

AssertionError:
ptests which had no test results:
['libxslt']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/665
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2523

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20251023-70/testresults/qemuriscv=
64-ptest/core-image-ptest-libxmlb/
https://valkyrie.yocto.io/pub/non-release/20251023-70/testresults/qemux86-6=
4-ptest/core-image-ptest-libxmlb/

Can you have a look at these failures please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


