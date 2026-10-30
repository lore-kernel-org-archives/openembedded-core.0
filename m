Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6242.1793343934535302039
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=EKP4hNH6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1A0AA4E4139A;
	Fri, 30 Oct 2026 07:05:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA694603C2;
	Fri, 30 Oct 2026 07:05:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 84CB3103287DA;
	Fri, 30 Oct 2026 08:05:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793343931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9YOJHKszX4enul69GLfJeulxXxqnGYySvpte6y2iaFc=;
	b=EKP4hNH6PhixIXLivu08Ah9sbr4p4blyc6Y0yiS6pXPuSkG3ht6ERuJqBGM9fgdr0zGw/F
	1JfFGPHYu6EW6+kVWxwLCW9OSxAwPzUcX1a/5ZEWnFhnksFGrgMCnXEn2FSUqNj+7VoZyZ
	0GeJ2zcjb3rNlY8/LD353nC3gEdrrbGk5fMGCdh8uimS+EWBKMhGHNGlbokZfQ3HAOXOhe
	cmO+QlUAMIYYYDXiBjx4aZfewvH8AdnCXLfWmC3a/dCFHYzJMxd6G5A6uqCb0bw1OaCDIg
	sC88x+ltyRsZzA3XFK15iuEGxcIwUtVO/vZzZiK3rHdCQM16FuahaZjvFmdbfw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 08:05:27 +0100
Message-Id: <DMHZD6V13WC0.2307BYF5XATFW@bootlin.com>
Cc: <openembedded-core@lists.openembedded.org>, "Ricardo Salveti"
 <ricardo.salveti@oss.qualcomm.com>, "Paul Barker" <paul@pbarker.dev>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Otavio Salvador" <otavio@ossystems.com.br>
Subject: Re: [OE-core] [PATCH v2 3/3] checklayer: Share each world signature
 dump between the tests needing it
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261019143924.1521981-1-otavio@ossystems.com.br>
 <20261019143924.1521981-4-otavio@ossystems.com.br>
 <179327642127.31634.6504288368028561565@ossystems.com.br>
In-Reply-To: <179327642127.31634.6504288368028561565@ossystems.com.br>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248991

On Thu Oct 29, 2026 at 1:20 PM CET, Otavio Salvador wrote:
> Hi Mathieu,
>
> I saw this patch was reverted in master-next to test Ricardo's
> "checklayer: run bitbake once per machine for the machine tests",
> since the two conflict. Ricardo replied that his patch solves the same
> issue and can be dropped in favour of this one:
>
> https://patchwork.yoctoproject.org/comment/42922/
>
> master-next still has the revert, with Ricardo's patch on top. Could
> you drop both, so this patch goes back in with 1/3 and 2/3? It covers
> the machine tests as his does, and the common tests too: test_world
> and test_signatures share one dump.
>
> If you'd rather keep Ricardo's version, I have a follow-up on top of
> it that moves the common tests to his cache, and I can send that
> instead.
>
> Thanks,
> Otavio

Hi Otavio,

This was discussed during yesterday review meeting: we believe we should
proceed with your version of the changes, possibly with some
improvements. So yes, I dropped Ricardo patch.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

