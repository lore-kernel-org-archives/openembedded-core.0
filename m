Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ECBC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:31:40 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4490.1783503098930906566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1c9cY6FF;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A58AB1A0EC6;
	Wed,  8 Jul 2026 09:31:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E0E160337;
	Wed,  8 Jul 2026 09:31:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5F4A11BC33B1;
	Wed,  8 Jul 2026 11:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783503095; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MGEqbOJNB8R5bjRBru70ENFiZzbiZ2OwepY35N/wNGc=;
	b=1c9cY6FFo1tfA88gYCd2KR8zgt7GyX+fsOL5G65PBO9pmcgt9xZdHD4pG2qDRV8ecScLnh
	/n0nL7FmNzfcuetDAcvHjSk5oTAjz0j51EfBym6u2Rs3KiAKKI78Is4blWr0SnNjIwLqAU
	VYcuAFphSgi31CmTXFAxazGiX8koJyhKzVL+tVH8J766dUAqHuQXxYAK/qfjHMH6j/iJ1n
	+OPCfckVwvdbWSIuK/zxGj3ZBObuRPGLXzSmx/E2vsLE8eTGNcUMzati7feyZ6N7RngPBC
	BRXEzvhaMZUKmduql2BAXdP/JYxemSUgvJpDClOqXW/thCaOH0Ss/Ma2eU6+cQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 11:31:29 +0200
Message-Id: <DJT32W69PZMH.3CI3ARE9YG46W@bootlin.com>
Subject: Re: [OE-core] [scarthgap][PATCH] libgcrypt: upgrade 1.10.3 ->
 1.10.4
Cc: "Hongxu Jia" <hongxu.jia@windriver.com>, "Yoann Congal"
 <yoann.congal@smile.fr>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <jakubszczudlo40@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260707064301.32102-1-jakubszczudlo40@gmail.com>
In-Reply-To: <20260707064301.32102-1-jakubszczudlo40@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 09:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240449

On Tue Jul 7, 2026 at 8:43 AM CEST, Jakub Szczudlo via lists.openembedded.o=
rg wrote:
> Release notes are here:
> https://dev.gnupg.org/T8233.html
> Update contains fix for CVE-2026-41989 and because of building error patc=
h need to be
> updated to fix compile flags in new version.
>
> Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
> ---
> v3:
>  - Correct patch file name to be the same as patch title
> v2:
>  - Added new patch to fix building error with '-O2' in sysroot path for l=
ibgcrypt 1.10.4, patch
>    was taken from wrynose and backported.

Hi Jakub,

Thanks for your patch, but please remember to add the [scarthgap] prefix
in the subject when targeting stable branches.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


