Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B15E64008
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 06:05:19 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.265921.1776060314778465488
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 23:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=U0d7G+mc;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 088B34E429F0
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 06:05:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC0935FFB9;
	Mon, 13 Apr 2026 06:05:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D282510451B9D;
	Mon, 13 Apr 2026 08:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776060312; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p0FiTG3QL7nKZ8DVnRmGqCN+XcROr+CkY1n1DZWrzEA=;
	b=U0d7G+mcehaFGwHRyl+ZPJgb5gOuTxVf2UghYRCv1BY7P6/5PCxpxHAYS46T1LVb+doESW
	y8/JXo3hL5O1jcFbKpsBYEhbNpH7j6Ua8qaZfAKIyBfnRQgGAHQi5+lcZmdO3gw8yajyzQ
	Fo20bAw5q1BHy2ksyoR0+y2jLjoVjgwPkgaT5ZQhdcC74Y96Yjc0Yr1JHJQH567Pq8KMUw
	B7GFdu9vV0IO8p+eGdm9MudqYb1DjNOjWM/lNbH6+vatFNqnjnnhjuJhs/lNWTmlB3NXEB
	WOp/qhkT6fj7msQ43wOXkfG5X59I6PweemCyqc/+e6etbxIHIhxt9wIcC3JRiA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 08:05:10 +0200
Message-Id: <DHRSU3199BKL.AH6ENVO5S6TL@bootlin.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-bad: add
 ANY_OF_DISTRO_FEATURES
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <189E1B5A8FDE995D.2964266@lists.openembedded.org>
 <0439268c-895b-4ae8-88de-8aa9d03eaefd@windriver.com>
In-Reply-To: <0439268c-895b-4ae8-88de-8aa9d03eaefd@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 06:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235081

On Mon Apr 13, 2026 at 5:17 AM CEST, Changqing Li via lists.openembedded.or=
g wrote:
> kindly ping
>

Hi Changqing,

Your patch is still under review, but we have a pretty long backlog. It
should be merged or you should get some feedback soon.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


