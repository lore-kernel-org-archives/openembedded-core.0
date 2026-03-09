Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825A1F3C256
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:26:06 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14083.1773062757392692982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wJt3Qd7H;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 785A5C42878;
	Mon,  9 Mar 2026 13:26:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1154E5FFB8;
	Mon,  9 Mar 2026 13:25:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F38C1036911C;
	Mon,  9 Mar 2026 14:25:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773062754; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qdgpmcVd3CgRqZG4q0rIMYhfDwncZC4lRw/ROqAhbUA=;
	b=wJt3Qd7HjCOZmziXPlvOGoELlXU5EPE8axd3bDLcCkf23aie3UaPb6yYRItZROW7PUG9Qe
	qWGvRODSjMl1LmGoT/iBWkelyuHgqZgh/dZg0vtO7PBNfjhayTzbrkaQpnZosOkzhgqpqu
	zJrzeXubqlokDLvj/SPiCUgKB+in54c9Ri9CvJja56qcl/3CuuSVMl6XLvj03uAFw8EuTj
	qpsAN/hf+d11S0Sp/iXjVag/mW9nb101FWIYFcrTTVCAxSEJc7aBpdF1s2hP2UptW1UYTF
	2z6meNdI6eQFP2v2nsAsba0Q+oDKbzA3MS05gUPT/EQSrZ3KBq0c4s0xYpK29A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 14:25:52 +0100
Message-Id: <DGYAAFLVPOIO.37V853YCSWQ3O@bootlin.com>
Subject: Re: [OE-core] [scarthgap] [PATCH v2] go 1.22.12: Fix
 CVE-2025-61726.patch variable ordering
Cc: "Yoann Congal" <yoann.congal@smile.fr>, "openembedded-core"
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Eduardo Ferreira Barbosa" <eduardo.barbosa@toradex.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260306-fix-cve-61726-patch-ordering-v2-1-410fea740c2a.ref@toradex.com> <20260306-fix-cve-61726-patch-ordering-v2-1-410fea740c2a@toradex.com> <DGWCGA4WR8ZH.17KQOSZOR7JSA@bootlin.com> <GV0P278MB076721C3438CE089BD2D02C8E879A@GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM>
In-Reply-To: <GV0P278MB076721C3438CE089BD2D02C8E879A@GV0P278MB0767.CHEP278.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232707

On Mon Mar 9, 2026 at 2:16 PM CET, Eduardo Ferreira Barbosa wrote:
> Hi Mathieu,
>
> Thanks for the feedback. Should I send this patch again?
>
> Thanks,
> Eduardo

I'm adding Yoann in copy. I will let him answer, but we are probably
fine.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


