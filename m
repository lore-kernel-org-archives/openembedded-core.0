Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB98CCAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 08:32:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.48907.1759134723424842053
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 01:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yMVkiSzW;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7DD871A0FDF;
	Mon, 29 Sep 2025 08:32:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 42FC3606AE;
	Mon, 29 Sep 2025 08:32:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D306102F1845;
	Mon, 29 Sep 2025 10:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759134720; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=extd7zutWPptLWyV3NhcReX/+HD8m5tqYi4CYDfbEwo=;
	b=yMVkiSzWXw6BHtAOGZZqz8XHjY/klzhNjMX1wr+0hzUxq+f0CIKWQ4cQWZl30qilNjd9vT
	2XrYvFrEVS0nufzd0gmmBwtj2WvbjF3cgCow3+Sq7bbkWyggOSavbe+41TPBI/Tkxt4OtD
	f7ANct/Uq+lyMhr+6jy9FBbAdqJCPUUUZQatmuVW9ySmIlLXyRfJuuLu4Aejc1gB4v7v5Y
	668koJn5h7Adw96AzHi4+aQ31Sfzp62219zLEYX9plXUW+Kcnn51WuHqp/5JeymsSEHCzU
	Ygfb6nzZo/nQLSl4fooSZXp6avVs5R+P3BBGt3ms8FD6ODZ4vKOrQFWbUGlApQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 10:31:58 +0200
Message-Id: <DD557PAIIKMB.2BLYUBOUGXS9C@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 9/9] debug_build: defer inherit bblcass
 debug_build when DEBUG_BUILD is true
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>, <peter.kjellerstedt@axis.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <18669FECD58FB457.22280@lists.openembedded.org>
 <18678856A5E59549.12551@lists.openembedded.org>
 <f238b771-5b28-4244-9907-ceb29dd80fef@windriver.com>
In-Reply-To: <f238b771-5b28-4244-9907-ceb29dd80fef@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 08:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224126

On Fri Sep 26, 2025 at 3:04 AM CEST, hongxu via lists.openembedded.org wrot=
e:
> Hi Mathieu,
>
> Ping, or should I resend the whole series?
>
> //Hongxu
>

Hi Hongxu,

The other part of the series was discussed in the Thursday patch review
meeting. As far as I remember, it was rejected because it complicates a
bit the whole thing while it should be simplifying. I was not directly
involved in the discussion, so I might miss a few points here. You
should have got some feedback about it, but it looks like it was lost
somehow.

You might want to resend the whole series to trigger discussion.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


