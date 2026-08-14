Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6ABC5CFCF
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 17:13:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17739.1786727597325022405
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 10:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=flsY/Jg6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3AD551A1647;
	Fri, 14 Aug 2026 17:13:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C368604AA;
	Fri, 14 Aug 2026 17:13:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDBC111C4EF36;
	Fri, 14 Aug 2026 19:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786727590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bSZdrWUTQ/obWw26Tbrzkibz2HNRDmrugLffkWdcLis=;
	b=flsY/Jg6wSa5DpJePkeaabcESuWHyJsG3LBtE3wQUuWGA0t1q/1UJKZKDZupsXz4qEGR82
	OXq0oSrjk8eq2S4TmbJQ5SJYoIZPlIFnP8LL5Iq8IdGBc95ewSzhTN28LIh1txzPJKXYzR
	+xOzYZFZERBYYHtRYrZyJVBDpGSz66uUV69VlnXMYBJYvKFdMTmKXeIZnRH2NL/U0ybKKA
	3CDt6qUeVqkmvHmCcxeriODIoDxKV0wrhPT+jEm+PHJbTBinvAaj63IDD65SXhCjmGFg9v
	S3rGHkrYD+aTMr0cSSzm8nK8WMyR7e8U0bSsvEchX4AwCe6YmbZ4GoMjLLftwg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 19:13:09 +0200
Message-Id: <DKOU2J4G3W9Z.2EJ4TA6UU8CK4@bootlin.com>
Subject: Re: [OE-core] Patchtest results for [PATCH 2/4] devtool: standard:
 Fix file copy on finish --force
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <patchtest@automation.yoctoproject.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260814-mathieu-devtool-v1-2-985e81a17bb3@bootlin.com>
 <010101a0011e17e5-fb473366-5f84-4211-bbe4-20301ef2526c-000000@us-west-2.amazonses.com>
In-Reply-To: <010101a0011e17e5-fb473366-5f84-4211-bbe4-20301ef2526c-000000@us-west-2.amazonses.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 17:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243467

On Fri Aug 14, 2026 at 6:32 PM CEST, Patchtest via lists.openembedded.org w=
rote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/2-4-devtool-standard-Fix-file-=
copy-on-finish---force.patch
>
> FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it =
manually or with "git commit --amend -s" (test_mbox.TestMbox.test_signed_of=
f_by_presence)
>

Not sure how I managed to skip the Signed-off-by. I will fix it in my
branch...

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


