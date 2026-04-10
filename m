Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D192DF4485B
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:05:52 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155646.1775826346667681906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GU+aiR9R;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A663E1A325A
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:05:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7490B603F0;
	Fri, 10 Apr 2026 13:05:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C80010450021;
	Fri, 10 Apr 2026 15:05:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775826344; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k+m1vJJ3onwutvVbq0apbjd/XC/+axC+R+sUsnC3DOM=;
	b=GU+aiR9RAzr40Llu5Oey5cqqIeBrBb8qE5gceiIoreY0/FfFOzGkCBGe1rwBm+Rnzsl2pS
	VOoIao10bqGS7eKvVH2RzcEtiqzQ79fGs8nznWoWElMaq1pw15GvnnjZcmjzM3XhWiP4o+
	7Al3JszZERyIJv0kbPqChjX6Nksig8K5jlXsj+Bu6lgCHlk94WJAe+UUSQ8vvBnv0QJkZ0
	ypQAfPD1yAzwcUUIRoKhgMzvykjfXFLGfQi/g4k16EFqp0qknZzjOjRz75lueJLSlGiuHF
	/AAVSgzMTfojPvN+snbzDR9zsYO6WBlKs3lpUaxOb25DpMfkqlb7tpZZdMt1Wg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 15:05:42 +0200
Message-Id: <DHPHWFIAOOAV.286K19SFA1P2W@bootlin.com>
Subject: Re: [OE-core] why would ASSUME_PROVIDED recipes be built anyway?
Cc: "OE Core mailing list" <openembedded-core@lists.openembedded.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
References: <daa91ca5-ef8c-bb83-7079-3d03ace27a8a@crashcourse.ca>
 <1acc463784821951790b0a3cf3ee23a6b02aaa68.camel@linuxfoundation.org>
 <fe2e28c3-9ee8-ef26-ce6f-04d45419d6a1@crashcourse.ca>
 <bb9f56e589af3706364e746de9ca50ac2e60d7ab.camel@linuxfoundation.org>
 <e2f1bf90-5352-c846-7b6f-dbfe5105f65a@crashcourse.ca>
In-Reply-To: <e2f1bf90-5352-c846-7b6f-dbfe5105f65a@crashcourse.ca>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:05:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235023

Hi,

On Fri Apr 10, 2026 at 12:49 PM CEST, Robert P. J. Day wrote:
[...]
>   this is definitely useful information to know but it might be a bit
> much to try to sneak into a reference entry. an alternative might be
> to add another subsection to the already 42 subsections in the dev
> tasks manual:
>
>   https://docs.yoctoproject.org/dev-manual/index.html#

It's not really a development task.

How about a section in https://docs.yoctoproject.org/overview-manual/concep=
ts.html?

Antonin

