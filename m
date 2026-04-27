Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10117FF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 11:40:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43267.1777290033884716116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 04:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=00BFjr8V;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9EAF14E42B34
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 11:40:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F64F600D1;
	Mon, 27 Apr 2026 11:40:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 100F31072808E;
	Mon, 27 Apr 2026 13:40:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777290031; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M/J7LeOH/lDHIof2bBxhZ89Ou97f4nRy4DhGnPW1VeI=;
	b=00BFjr8VKJbwAgLL0zLtKiAGzia7aGDxbTobkTUVFAWtxXI1EwcFlBu0caKv65/OHRlDQf
	lrkEUpy/2pou+CEekxIS+0XpO6Ic4LvUD8dREKWpjJWDQXruYbQmjdOgyf3r1aVion7CNt
	km19t1ZWeuVFWJDBLHASAEPLa2i3Ym/3jK9KdS/fiFfvLoclUWP/60Zi9CgNRh3r9JLQ2Z
	9F425gLyMnW3R5+XHA8Cuju/8VPXKq/NLdDEj5gwVqh2k9L5WMZsNo68rEBWT437JP/X6A
	aewGtVgusGT3UNpsi2g1c3ZaMUQmaqECyEoo6SGk3krNo7s7ipgny0iZzOL7sA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Apr 2026 13:40:28 +0200
Message-Id: <DI3WQFOXA6GG.23KER0QY230XL@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <viswanath.kraleti@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] mirrors: switch Yocto Project mirrors to HTTPS
References: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 11:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236007

On Mon Apr 27, 2026 at 12:30 PM CEST, Viswanath Kraleti via lists.openembed=
ded.org wrote:
[...]
>  svn://.*/.*     http://sources.openembedded.org/ \
>  git://.*/.*     http://sources.openembedded.org/ \
>  gitsm://.*/.*   http://sources.openembedded.org/ \

On a related note, it seems that http://sources.openembedded.org/ is no lon=
ger
active. Could we remove it?

Antonin

