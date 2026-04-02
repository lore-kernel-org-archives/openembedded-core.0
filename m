Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7CBD3943D
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:53:45 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17634.1775141618910804278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 07:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Et+JYAn2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C580C1A3101
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Apr 2026 14:53:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C0355FDEB;
	Thu,  2 Apr 2026 14:53:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAF3A1045026F;
	Thu,  2 Apr 2026 16:53:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775141616; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bdSWgi0/wG7BtbZC/RX2wzgEVlTEjZERMlfzwz4J/1U=;
	b=Et+JYAn2YThssi3Le8eBg0cSfIjxkHHpOYii3Ks0sdRpg0gbr4K8BaegEmijhBXVnuA3H2
	qUmm3dqrMzRklRzoCb73BVyRbzGm071YQUKgJaXe2zgOfuVjnGCzhAZ7uSOhl2j5m0RP/I
	t4QKV2zvW6cYhxok4VKDa2/KSxGZI5y/0RvS0eC7kCGmquRFVVoSXpMQhuFeYJ2hykR31M
	zG5FQvEXXZMh1xKihjI74tIuNK5QLhdJfGX6u9Ods1woqmGmJ+nkMnB0yOoCTUaF8vzMGD
	patDwM0CCGVDJ/PG79466uTJgLjsIPV0ypq5KeTAz3Cx4YUjFk5qaoQm7FHYXg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: Daniel Turull <daniel.turull@ericsson.com>,
 Ross Burton <Ross.Burton@arm.com>
Cc: "rybczynska@gmail.com" <rybczynska@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] classes/vex: remove
Date: Thu, 02 Apr 2026 16:53:33 +0200
Message-ID: <3204609.CbtlEUcBR6@brobin-bootlin>
In-Reply-To: <B7466D11-14E9-49CF-9203-24A6B4D47DB6@arm.com>
References: 
 <20260331132430.781647-1-ross.burton@arm.com>
 <PA3PR07MB10721439AB9FDE89335C33B3E8A50A@PA3PR07MB10721.eurprd07.prod.outlook.com>
 <B7466D11-14E9-49CF-9203-24A6B4D47DB6@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 14:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234531

Hello,

On Thursday, April 2, 2026 at 4:42=E2=80=AFPM, Ross Burton wrote:
> On 1 Apr 2026, at 13:29, Daniel Turull <daniel.turull@ericsson.com> wrote:
> >  The kernel scripts to check CVEs uses the vex output as input.
> > https://git.openembedded.org/openembedded-core/tree/scripts/contrib/imp=
rove_kernel_cve_report.py
>=20
> I believe this functionality is also superceded by sbom-cve-check, as the=
 recommended configuration fragment sets SPDX_INCLUDE_COMPILED_SOURCES:pn-l=
inux-yocto =3D =E2=80=9C1=E2=80=9D.
>=20
> Would you be able to verify this, we might be able to deprecate/remove th=
is script too in master.
>=20
> Ross

Currently, sbom-cve-check does not fully handle Linux kernel CVEs correctly.
Special processing is required when the information originates from the
kernel CNA, as many kernel CVEs are incorrectly marked as vulnerable.

Additionally, sbom-cve-check does not yet provide an assessment as detailed
as improve_kernel_cve_report.py.

The first limitation is planned to be addressed in the very near future
(within this month). And for the second point, I hope I can address it
at the same time.

=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




