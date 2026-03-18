Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9861077617
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 20:24:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23858.1773865483191230065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 13:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TtRcYxnI;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 128064E426FB
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 20:24:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5BFB6004F;
	Wed, 18 Mar 2026 20:24:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F56210450571;
	Wed, 18 Mar 2026 21:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773865480; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ic9rHcdC+lrrQoZevkbuccbTUi79iH14o3vDg36h7kA=;
	b=TtRcYxnINJgHbTb5Ravs/u3vWdWh+obohaPKAHVDTiGgiD+uDaBGQjzix7JvU7B7o7NzQE
	In9SprbprroOlnRm49qTcSVBl92rU4kU8QmerYzH0pqB31dOw0MrpE05ofOwq8m2CMtoTr
	mbQkNlfbDVMquwMS5ATbBgZoDhtAZn8SWc1+qiVHbbWNk/AGldPCmMfJDqchW3vNpzx+OF
	Qet98NJVGg9BRpDq8FhvuKPSMBf9MidNhu69wnSf7RVuBoxgfaRpHQJ7pVa/MTAHLQAHWE
	l8pEtKS47Xr4Ca8rks2m5GkZINz16saKgkpdRlL8H1YCncU6jmpj9YSip8uaMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 21:24:37 +0100
Message-Id: <DH66TYMU3O8U.2U4YOVGVZNC6C@bootlin.com>
Subject: Re: [OE-core][master][PATCH v2] libpcre2: Enabling Ptest support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <careers.myinfo@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260318074931.343318-1-moins@kpit.com>
In-Reply-To: <20260318074931.343318-1-moins@kpit.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 20:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233434

On Wed Mar 18, 2026 at 8:49 AM CET, Shaik Moin via lists.openembedded.org w=
rote:
> Install libpcre2 test suite and run it as ptest.
>
> Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest=
), and grep utility (RunGrepTest).
>
> pcre2posix_test: Verifies the POSIX wrapper API
> RunTest: Executes the core PCRE2 test suite through pcre2test
> RunGrepTest: Checks pcre2grep to ensure its grepping style matching works=
 as expected with various patterns and input files.
>
> Signed-off-by: Shaik Moin <moins@kpit.com>
> ---

Hi Shaik,

Thanks for your patch.

This is causing some build issue:

ERROR: libpcre2-10.47-r0 do_package_qa: QA Issue: supports ptests but is no=
t included in oe-core's ptest-packagelists.inc [missing-ptest]
ERROR: libpcre2-10.47-r0 do_package_qa: Fatal QA errors were found, failing=
 task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3408
https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3370

Can you have a look at it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


