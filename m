Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20F2EB2719
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 15:28:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21606.1770823677357414586
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 07:27:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OlZQrDlA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B29601A0E0C;
	Wed, 11 Feb 2026 15:27:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 883D1606B1;
	Wed, 11 Feb 2026 15:27:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DFAA511948F9B;
	Wed, 11 Feb 2026 16:27:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770823674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oi+jZxEk8ByVn80lFNXu8o1WTeBjrzXFWIi4Gh87pPA=;
	b=OlZQrDlAXXId0TXvri7OIBJueelkVZugtkCXZYckk9cT/J3QONV7a7obT4DRspbsmIHlN7
	PcKkGt9CsHNqD6x4G2rSakq9udmCpCNLpWQfaTqF/Xt0TDqcmDZRqR76N5qCMONeZ2LymM
	n/m8w2vQKpT/DBf+uznkte0eCapEupIY28d49eaPK0ARdV1MmWw+IycEkhu0hz3UN4g7Qb
	x+q5rEwxBjd20tm30vebneu9KQPaZ2uOVpC5Gj0OGWd52WRLGRJ3PTDdhw79//653K662r
	YlZbda868mnrgsAyc438iJW0gwkGHsf9KrtbktN3yyaEJYb6RyVffJPAunHVBQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 16:27:52 +0100
Message-Id: <DGC8LOGBK2YX.WBMATLDG1ZJR@bootlin.com>
Subject: Re: [OE-core][PATCH v1] libsolv: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260211122852.6057-1-pratik.farkase@est.tech>
In-Reply-To: <20260211122852.6057-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 15:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230993

On Wed Feb 11, 2026 at 1:28 PM CET, Pratik Farkase wrote:
> Add ptest support to enable automated testing of libsolv
> using ptest-runner.
>
> The implementation uses upstream's test infrastructure:
> testsolv binary, runtestcases.sh script, and testcase data.
> The test suite runs 28 test categories covering solver
> functionality, package dependencies, and repository handling.
>

Sorry, maybe my previous message was not clear enough: a previous
version of this patch has been merged:
https://git.openembedded.org/openembedded-core/commit/?id=3Df5432d1c45f9eb4=
7182049c6930cfc6d5b26bc8d

So you have to rebase on top of it or on top of master before sending
your patch.

I can see this patch here is adding
meta/recipes-extended/libsolv/libsolv/run-ptest, which was already added
by the merged patch, so something seems to be wrong here.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


