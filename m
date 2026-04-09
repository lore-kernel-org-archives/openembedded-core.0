Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A82BF31E27
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:25:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.131117.1775738322148115677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 05:38:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HOip2vCl;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 668AD1A3244;
	Thu,  9 Apr 2026 12:38:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C2855FDEB;
	Thu,  9 Apr 2026 12:38:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AEFA104500B4;
	Thu,  9 Apr 2026 14:38:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775738319; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kh9G+GDkmvgV0F0wnvvNNUBAZHCbVXedFaj27r9IOGY=;
	b=HOip2vClqkPBdyI6FtHta1vFhgvHpG4RVhm9H6zGmmp8m351/uFqILE/MkNkY+tHJO2Bxs
	z9rYF9GsJ0GWKOkVnnSOJQR613BEj6YjTSzJEZkV3U1FrS2jvtC3QpME3Gitvv69YE1w6r
	ygGnwqyp1dER0ao/zpcJpJa/v+3vR2Vw6wUIp4YLgvS3YctpJSTflgu2S5rVFeyQGTZa89
	bEb8EsWq1X7yNBr+x9klj7I0HT7gVWVJ+nw0fZh1NNgoVloYwWqtiG7y+R2GvSUF6f6Nrh
	l1dgUQC3XYs0jaj0JV1LQgLa0K1u39v3K4kAeFzVem1R4pRyNhLWUDDQVmMWdQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Apr 2026 14:38:38 +0200
Message-Id: <DHOMP5U25UXL.ZH8NFSNZYYVM@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [OE-core] [PATCH v2] lttng-tools: upgrade 2.14.1 ->
 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260409014036.1519-1-wangmy@fujitsu.com>
In-Reply-To: <20260409014036.1519-1-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234913

On Thu Apr 9, 2026 at 3:40 AM CEST, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> disable-tests2.patch
> refresshed for 2.15.0
>
> 0001-tests-do-not-strip-a-helper-library.patch
> removed since it's not available in 2.15.0
>
> 0001-common-Autodetect-musl-libc-and-fix-C-compilation-er.patch
> added to fix compile error when enable musl
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the new version.

Some ptests looks better, but some of these are still failing:

AssertionError:
Failed ptests:
{'lttng-tools': ["tests.serial_78_-_Test_script_'ust/stall-buffer/test_stal=
l_buffer_complex.py'_returned_code_1._0_passed,_0_failed,_0_skipped,_unknow=
n_planned_[total:_0]",
                 "tests.serial_79_-_Test_script_'ust/stall-buffer/test_stal=
l_buffer_simple.py'_returned_code_1._0_passed,_0_failed,_0_skipped,_unknown=
_planned_[total:_0]",
                 "tests.serial_80_-_Test_script_'ust/stall-buffer/test_stal=
l_buffer_timer.py'_returned_code_1._0_passed,_0_failed,_0_skipped,_unknown_=
planned_[total:_0]"]}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3450
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3472

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


