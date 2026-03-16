Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CB0EFCBBB
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 07:01:53 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44977.1773644503037332043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 00:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=hYfE7jZ/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1F9EAC4273F;
	Mon, 16 Mar 2026 07:02:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A56C55FC4A;
	Mon, 16 Mar 2026 07:01:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D72A710369B83;
	Mon, 16 Mar 2026 08:01:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773644500; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZJ+xitWzifsiHQYXzWzzOp0E7twMy04ef6IBfOrqGdk=;
	b=hYfE7jZ/YownoEiG9/pNlcmzjtMS3j3j0YuCuiZxSZSr8dxLWIeJ/0M3d1iqiPBau/OC9e
	XaWAjb+F4PdMBBsHkg+/C2eF1t14gBpBuF+K1EkmdPxw0A5hS0Kq56LdEM1VUtEaE8jeOF
	zyYMfRRQkIFgUJIXYJKPk6KeuXOCjGSL0UC37cpSWkRpOqtiDSa07aLrEOvInGZb/fs0g8
	nNIHwicBSvdEMmnLVZ2VS1JDLxnv/0jLhdNeJtRzPX2zEqdZmlhKMD2hWrZrj/IFNDyDAB
	gSPMmStczjc70QPh4s4+t0Ndlox52CtTaH33pXnvMTnbquhxvmjGrUoIj/BhKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 08:01:39 +0100
Message-Id: <DH40I2J3OKEX.13AXWCLYL6EF4@bootlin.com>
To: <careers.myinfo@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] libpcre2: Enabling Ptest support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260211080135.92891-1-moins@kpit.com>
In-Reply-To: <20260211080135.92891-1-moins@kpit.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 07:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233214

On Wed Feb 11, 2026 at 9:01 AM CET, Shaik Moin via lists.openembedded.org w=
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

Can you confirm the oe-core version your are based on? I believe the
modified file does not exist in master branch:
https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/li=
bpcre

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


