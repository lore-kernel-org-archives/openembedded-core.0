Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11396.1793805323487443629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=H6KGgGZH;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C4A461A145C;
	Wed,  4 Nov 2026 15:15:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A60860770;
	Wed,  4 Nov 2026 15:15:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A08A6103291D2;
	Wed,  4 Nov 2026 16:15:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793805320; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cF+22KOZ6WrwqjSXqH8CBczZ9qVJqrDkkiL7RwYi+JU=;
	b=H6KGgGZHA8gRGLn7/IIEAgaZwEUF2GSdZIo4esnUjmj07ddZLuUpS02+1TJgI/4kst0551
	3coQWPL8E9YFiNW93sPUXiKuKe/vnzNPRpOsF7gM4+6O/CxsrMUQ57Do8n8Yt1cUJAguHe
	jVwAHPCA0fOYCxJycL5yfR0ABtZSklkAHvWqOkKTyO4Z6coenGreNyyZFkYWBt9HzJcrcK
	rRkY/xOVyXZdjx/BFmuocqlejwV02T/iER24DPoY/6FVePeyfo79mdZHxA4J2X3BjR0eV0
	x2eFxnhDjwZiFAJhxuvqFGwPvkbZ/CJtrtW0Y9nK8FdempOs29sbdlEvxqAWlw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 16:15:18 +0100
Message-Id: <DMMIWYU00YPC.1EN06SKBE1Q47@bootlin.com>
Subject: Re: [PATCH] kernel-grub.bbclass: use KERNEL_PACKAGE_NAME for the
 image packages
Cc: "Bruce Ashfield" <bruce.ashfield@gmail.com>,
 <openembedded-core@lists.openembedded.org>, <prasanth.r@lineo.co.jp>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Prasanth Ramesh" <ragaprasanth@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261029060913.1586484-1-ragaprasanth@gmail.com>
 <6ae34604.ca480166.87e27.0c55@mx.google.com>
 <CAG7eodE0GBmOtBsDM-4Sj2xEUmhLWZyu5sEy1Sdh68RUM=1H4w@mail.gmail.com>
In-Reply-To: <CAG7eodE0GBmOtBsDM-4Sj2xEUmhLWZyu5sEy1Sdh68RUM=1H4w@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249390

On Wed Nov 4, 2026 at 1:27 AM CET, Prasanth Ramesh wrote:
> Hi Mathieu,
>
> I see the kernel.bbclass v2 and kernel-grub patches are both marked
> =E2=80=9CChanges Requested=E2=80=9D in patchwork.
> Bruce acked both. Are there any issues to look into?
>
> Thanks,
> Prasanth R
>

Hi Prasanth,

This commit raised some discussion during Monday review session. You
should be getting some feedback soon.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

