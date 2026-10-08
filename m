Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F47CA600E
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 09:41:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11603.1791452465368937863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 02:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YLzTz3nC;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1F43E1A1196;
	Thu,  8 Oct 2026 09:41:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E706960341;
	Thu,  8 Oct 2026 09:41:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80DBA10333858;
	Thu,  8 Oct 2026 11:40:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791452462; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CzXyuH356vLOoLO/qHruxowS1iVNtvVcS8y06lXZ1ro=;
	b=YLzTz3nCxOHM4qclMlrJ6iJBeNg6vuLhnqbX7rkh0ZiPi6EopHp+/HFuLBmBu70YUqb2M9
	Aasxm3Cpqw1xop9ic3ZBTN76TvVdHBavsCfwtTaNVD/YyJzjlWX8fsr6XxrPiKr/bd6dJv
	h8XHewZs2cumSTT/09aqFIKTEtvfZ0dxRwrq5jotz8NvqRyI1bbYDGMNGl/Tgu1FIe6juX
	PthcvUbEfFpEU6s+kQXz3f2U9yvbeitYAQKSRx+NaXu78rO9FPQ7w3CN4D2iwwnt0BGB/p
	pbRXyDeJbFhMtqOU3bbHMOlpwTeWy6jSR7stoXfuduRQa+3mlEGYVVZjb4px+g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 08 Oct 2026 11:40:58 +0200
Message-Id: <DLZCWA0IG6Y2.2EUN06UJ6GXWT@bootlin.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gcc: Fix for CVE-2026-102010
Cc: <Sundeep.kokkonda@Windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261007102718.1288681-1-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20261007102718.1288681-1-Hemanth.KumarMD@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 09:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247422

On Wed Oct 7, 2026 at 12:27 PM CEST, Hemanth Kumar M D via lists.openembedd=
ed.org wrote:
> From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
> PR 127656 use-after-free in libstdc++ pbds binary heap erase_if
>
> After reallocating the storage the m_a_entries pointer is left dangling
> and the new storage is leaked. Update m_a_entries after reallocation
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2026-102010
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D127656
> https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Daaa8351f4d2e636f9680a=
1f0a8ebc2f0a60611e6
>
> Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ---

I do note this is triggering some warning on the autobuilder, but I
don't understand what might be the link with this patch. It might be a
previously existing issue.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4789

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


