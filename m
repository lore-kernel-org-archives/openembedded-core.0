Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCAEEF36F7
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 07:26:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8824.1773041171476831747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 00:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=e5QJypzY;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 64F981A2D09
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Mar 2026 07:26:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3906C5FFB8;
	Mon,  9 Mar 2026 07:26:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A42EF10369A91;
	Mon,  9 Mar 2026 08:26:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773041168; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IsQdurCh8y+RV+a8DuVddQ79jDLRqm798LUSJqLHIG4=;
	b=e5QJypzYznBUNXfkuIQtCyMkFtq1ydkKxOKGE/SQ9UmNT2T0nH2wFKnKngxpj9W3RXlgVq
	s9Lbm0rim1vYzlS2u3Q1/3hTxONXIs2DYC/vuYb3wmI8EmX0a3cPPL9YQK8ywBHLWCBdxW
	orDzsMQR95N+Rlrn8RQPX8eou8LwO1ZAtov/Weqn0VieoKUIDJazUO9TOANUwK3kVLw3L6
	aLyWjQVY5QqLeboe1pDDeQTo5E68HYtoPhI1bzx+7SreEf+nRQuiKMfmkXiBdta1uzMEH2
	o2cQEVp7PwGerXkW2/LJDd7KB3TOzO0LtQY6WlFqGxkFUo6OuTkQdVybDD1lxQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 08:26:06 +0100
Message-Id: <DGY2MZH9OGCJ.8XW3AQX0RNI0@bootlin.com>
Subject: Re: [OE-core] [PATCH] shared/fdset: add detailed debug logging to
 fdset_new_fill()
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ashishkumar.mishra@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260303081244.3330595-1-git-patches@bmwtechworks.in>
 <317026.1773030655249324672@lists.openembedded.org>
In-Reply-To: <317026.1773030655249324672@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 07:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232684

On Mon Mar 9, 2026 at 5:30 AM CET, AshishKumar Mishra via lists.openembedde=
d.org wrote:
> Hi Team,
>
> Any input on this patch
> I have backported this patch which i have merged in systemd upstream code=
 base
> I could not see this patch in master-next branch of openembedded-core - O=
penEmbedded Core layer ( https://git.openembedded.org/openembedded-core/log=
/?h=3Dmaster-next )
> Hence wanted to check if there is any feedback from team
>
> Thanks .
> Ashish

Hi Ashish,

Yes, I had your patch aside for a few days, as a systemd upgrade to
259.1/259.3 was already sent and conflicting with your patch. This
upgrade is now merged.

Is your patch still needed with systemd 259.3? If that's the case, can
you please rebase on top of master?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


