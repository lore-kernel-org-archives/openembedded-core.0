Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB72F436A4
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 13:32:33 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45102.1776432742779774536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 06:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PaHnhRDa;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 488834E42A2D;
	Fri, 17 Apr 2026 13:32:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1450560497;
	Fri, 17 Apr 2026 13:32:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CB37104609E5;
	Fri, 17 Apr 2026 15:32:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776432739; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2fTNSGyqAKxnCYFnzC4MmWoznHt8lzccogiJgbTGnK8=;
	b=PaHnhRDauU2raLhIOei4247bJ+nUYBJ4UMe96tYh8w3GT9pvv6KXOdodf0zrKi6+EDeJU7
	YUr3y8DVTi/lT6lQHgZz+rJdZhm38K6A6cfZqjWG++ot1s5gIiddoPg+T5Q2qYucI5wVKM
	rJMq7sgEshdR0IOqMsuFFqdmgccMOGA6IdXfDLcwHE77X5WGNsRpjPNQTnOTZke+vKR+e2
	2TEEyEvBiYISo8nSv3cosk5doQRI81jpojj+ctIdJxidLIVrM18Vf6icuurte34jR6JJFw
	mTbs1AE8l8Od9QnGmwwmCoG8FBRHzL6ECYTw6WPHY5tP5n3l4kVelZDHxTRzuQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org,
 Daniel Turull <daniel.turull@ericsson.com>
Subject: 
 Re: [PATCH] improve_kernel_cve_report: use numeric versions instead of
 cpeApplicability
Date: Fri, 17 Apr 2026 15:32:18 +0200
Message-ID: <5983306.DvuYhMxLoT@brobin-bootlin>
In-Reply-To: <20260417132409.1638132-1-daniel.turull@ericsson.com>
References: <20260417132409.1638132-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 13:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235500

Hello Daniel,

On Friday, April 17, 2026 at 3:24=E2=80=AFPM, daniel.turull@ericsson.com wr=
ote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> git shas or versions should be use instead of cpeApplicability.
> Reuse the same logic as generate-cve-exclusions, so outputs are consisten=
t.
>=20
> cpeApplicability does not provide accurate version information and for so=
me
>  CVEs the information is not the same. This came from a discussion that
> we had with Greg Kroah-Hartma, member of the Linux security team.

Indeed "cpeApplicability" does not provide the same kind of information that
the "versions" node.
In sbom-cve-check (the latest version in main branch) we are using both
sources of information.
But you are saying that "cpeApplicability" does not provide accurate version
information. Could you elaborate and give various examples? I never saw
something invalid in "cpeApplicability".
=20
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  scripts/contrib/improve_kernel_cve_report.py | 247 ++++++++-----------
>  1 file changed, 104 insertions(+), 143 deletions(-)


=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




