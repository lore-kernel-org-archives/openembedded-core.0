Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8189.1792504676321362716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 06:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OoogTB7x;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 063111A1291;
	Tue, 20 Oct 2026 13:57:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CECDD60393;
	Tue, 20 Oct 2026 13:57:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA94610328D5A;
	Tue, 20 Oct 2026 15:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792504668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NzjLPQeYB97XPloqas+kvN9eDwVNkZRZi4Pbo3uEo00=;
	b=OoogTB7xsW1QBEkPGqjHpyuVv4AZ6KYaPXmO+NnBHuoosZrmGfnDOaXQI2jdg5MtygNxrU
	oFNiC+9aR1pK1158u+c5xVHmwX3sW+JHBAOhDUGiOShqo1ytktUKXUdNL0LG9lkoKPp2G1
	c5vyPlI6OFrkIS9d0tMKYzzPz63ORrwtvOzxkMAb4WGnJrItF3Hf+vNDQ6t4a5wzNrAb4t
	Y8HWwanRInHbAkgUC8eK3eWZ1RxeMqKhtuJxQsmIvGEOPtNWRB4kLXRsQsYd/BhVSBRdYO
	NSLlohj0J9k8eOVXHqkP9fyjSbFjuZGxZhm8/y9J04xdOKZfTW5KJKG8j1du6g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 15:57:47 +0200
Message-Id: <DM9PVG0L0C8R.1FM7K9CJCQ1UU@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] sysvinit: rc: improve counting of
 progress steps
Cc: <oss@ew.tq-group.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <nora.schiffer@ew.tq-group.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <1db75a3d2c4cb52e5e36c7095f601ac6f08c1f1d.1787734737.git.nora.schiffer@ew.tq-group.com> <d3cf81007124c572c2010e785d421a0d2df9b619.1787734737.git.nora.schiffer@ew.tq-group.com>
In-Reply-To: <d3cf81007124c572c2010e785d421a0d2df9b619.1787734737.git.nora.schiffer@ew.tq-group.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248293

On Wed Aug 26, 2026 at 11:00 AM CEST, Nora Schiffer via lists.openembedded.=
org wrote:
> Fix a number of issues that caused more steps to be counted than calls
> to startup_progress would happen in some situations, resulting in the
> progress bar never reaching 100%:
>
> - Use the same conditions when looping over initscripts for counting
>   steps that are also used for running them
> - When skipping a script, run startup_progress to avoid off-by-one
>
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---

I was not able to reproduce the original issue of a progress bar never
reaching 100%, yet these changes are not breaking anything.

The code changes look sane.

So the whole patch looks good to me.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

