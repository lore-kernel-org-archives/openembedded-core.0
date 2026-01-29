Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439D6D73E84
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 17:45:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20922.1769708701621947594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 09:45:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aT3Eac+A;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 815D0C22F49
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 17:45:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46CBE60746;
	Thu, 29 Jan 2026 17:44:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C40C3119A884E;
	Thu, 29 Jan 2026 18:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769708698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jzz1qgknTkEHcPc6Jo7dknfrzylIQeF6jYnbY1kZeAA=;
	b=aT3Eac+AMoft2QJqk2KkvReHCUtn+1ZK8VHSqsma1K74R8oZ/Gq5KS0lM98fW6v5Ndktt6
	m0EZszmUESSF4Vvmy13HmuhJpmUV/ATvyD3mPn46YBo8OqsyE1NnJd23+Wj91Glduj7Jah
	FGT3QF3qjRdTzifEyID9DFJjg0JLSsdyMkgdxdRsnRmkXoR6n5jUqAvP3xuOvBT7UI2Gq+
	nA4tWtRVckTpislZmZBUytqs2FEPe/fn+cqrIQ7OXyMlDjIHjcbe5MRzoGxxazq8ZBKgH0
	PDafcddM1yAlnmppjuB50lgjuGEyfVoaRK6qWoq12744GayurrloA5h9ePheQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 18:44:56 +0100
Message-Id: <DG19DJQSLJIV.30935TPXBX2B4@bootlin.com>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v3] python-urllib3: Backport fix for
 CVE-2026-21441
Cc: "Yoann Congal" <yoann.congal@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260128131610.130399-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260128131610.130399-1-adarsh.jagadish.kamini@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 17:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230158

On Wed Jan 28, 2026 at 2:16 PM CET, adarsh.jagadish.kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for your patch.

Based on urllib version, I suspect this patch is not for master but for
the Scarthgap branch, is that right?

Adding Yoann in copy, so he can handle it.

Please make sure to add [scarthgap] tag in the mail subject for such a
patch, as described here:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#sub=
mitting-changes-to-stable-release-branches

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


