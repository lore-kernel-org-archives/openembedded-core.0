Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D264C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:04:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37304.1782486259251413423
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vBfrySar;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0AC411A09EB
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:04:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D382760232;
	Fri, 26 Jun 2026 15:04:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8313104C977F;
	Fri, 26 Jun 2026 17:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782486256; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gd7ZgD4Lnwgy5wAKgMP8IrfYsrzZJ34c7Wy2AsMZnmw=;
	b=vBfrySarKBfkUBCxRChHcNQQMP3YrU8OivkBD4nXOp+4jQFmDsdBXvD13dGdE7oGty92I5
	0JjpakCggEyCsTV+IQhEa4V6zNj48a6KBJuaeZIIZt4NmFkRAWcFDVLkaEErXZUV9EAtqy
	lsLcUobD7DMStYadvO9bSYJA8hcFhDNH8n2Wqlq8v9hI7Drm4ypO3gy77N+17IGh0kxISt
	m2T4dXOeX/kejiY6kBUC6AiUsVptbA9hLrKTpFxyoQAFXxNJFg4PT4F0TrHltmP72dxGtC
	MZHqHgULrDGjm2oFtwvoi9IwynyZeYxJurCWbqSLufq+aeBDC0QL5uJjxuZj4g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 17:04:14 +0200
Message-Id: <DJJ2N4L40M58.CZVNHMRI7UZ1@bootlin.com>
Subject: Re: [OE-core] [PATCH] systemd-systemctl: Add support for UpheldBy
 fields in [Install] section
Cc: "Torben Hohn" <torben.hohn@bruker.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <devnull+torben.hohn.bruker.com@kernel.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260625-systemctl-upheldby-v1-1-b66839cab56b@bruker.com>
In-Reply-To: <20260625-systemctl-upheldby-v1-1-b66839cab56b@bruker.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 15:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239642

On Thu Jun 25, 2026 at 5:59 PM CEST, Torben Hohn via B4 Relay via lists.ope=
nembedded.org wrote:
> From: Torben Hohn <torben.hohn@bruker.com>
>
> UpheldBy generates *.upholds links in the same way WantedBy generates
> *.wants links, when systemctl enable is executed. This feature is needed
> to have a service restart, when a dependency restarts, and
> the service is stopped via BindsTo=3D for example.
>
> Call self._process_deps() with appropriate parameters to support UpheldBy=
.
>
> Signed-off-by: Torben Hohn <torben.hohn@bruker.com>

Hi Torben,

Thanks for your patch.

Can you confirm this is targeting the master branch? It looks like this
file was removed last year:

https://git.openembedded.org/openembedded-core/commit/?id=3D7a580800db39

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


