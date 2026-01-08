Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06A8D1D461
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 15:02:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8334.1767884548763344847
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 07:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LoYCH5ZN;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A5C201A270C
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 15:02:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70857606B6;
	Thu,  8 Jan 2026 15:02:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1F4AD103C885C;
	Thu,  8 Jan 2026 16:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767884546; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XxRZizHANXKcauSyMpVOkK2oqSciDfCUgbvDIeNhvok=;
	b=LoYCH5ZNp0Au8l+0UE5ex3QfM0xI7Q/UH37ANZovwWbCbCxxI7lAjMmdFSpKOCocyyB0PV
	c8PiSmiY6AfwsrvDH/xe2evAOAE6NqSls9Ur9iZKl7b1uRToF5X6JVYdlljcUh7Kq57cPs
	2Y+D/FCLZq5hF+vuQB/9F9SsgAIG0TbQbbPJfzg4bI4cr+1NEugCzKTf+aHGHBq+HZiZi2
	2GIUA8IdsmCpqYIvX6dG8b3tBw+EsVdmaOpcEHlJyqpKwUs1bBASKJC2R89xVGVfpavUMu
	O9uQETzhGq+7kUC7b63xb2r3xx2vaE0SXdTIUTd4Qsfpqsp30ynwKpzcM1EPUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Jan 2026 16:02:24 +0100
Message-Id: <DFJARNRE99CT.174ED819MH46Y@bootlin.com>
Subject: Re: [OE-core] [PATCH 4/5] alsa-utils: dynamically split the
 packages instead of doing it manually
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260107153803.2905889-1-ross.burton@arm.com>
 <20260107153803.2905889-4-ross.burton@arm.com>
In-Reply-To: <20260107153803.2905889-4-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 15:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229082

On Wed Jan 7, 2026 at 4:38 PM CET, Ross Burton via lists.openembedded.org w=
rote:
> Instead of hard-coding a long list of packages and the FILES, we can
> use do_split_packages to do the bulk of the work for us.
>
> Leave the SUMMARY (and add some which were missing) and the FILES that
> are needed to catch extra files for each package.
>
> This removes the alsa-utils-scripts package which only existed to isolate
> the bash depedencies, and instead adds separate -alsaconf and -alsa-info
> packages for each of the scripts.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

This one has a lot of conflicts with the alsa update to 1.2.15.1. As
this update is now merged, can I ask you to rebase this series onto
master?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


