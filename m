Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F72C43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 15:03:28 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73857.1782659005907104130
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2026 08:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=byySS+mF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id F0FACC58477;
	Sun, 28 Jun 2026 15:03:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43C1E5FF79;
	Sun, 28 Jun 2026 15:03:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D00C8106F139C;
	Sun, 28 Jun 2026 17:03:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782659002; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=voMF7FkdaAQKknFJsJpXskf14tCI/5ZhNVQP3bgeCaQ=;
	b=byySS+mFnM5vdRrCbwgt7uQLkiRrCjpsaWtdPhcOkRFBh/eml2LfQcjjbP3Fh4UtrSW46X
	+0PMURngO54DyImOyu4XOhCozcGDdGFrQ/eJE7uQLNw2v7dpKiNmPt1JOihau3GBz/NeVs
	Zfg67HEjWYcNcwWskUJulskhuzcPRA84MlnxgAcYflKFE0PGGPNKytEn7eXXfYtMW77abR
	OhxbCgv/mlSfvoqlw0n4zV4im28Mw/aCU5LvKGUb4Hx2geUlH7fD6tPujNxHBr/aGCz69p
	jacMRlgcauO8R2TAD+tw+xeePnWzmaJ5bFOkDz1hQxhQBU33Hag0XftLYmn2Yw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 28 Jun 2026 17:03:19 +0200
Message-Id: <DJKRVIT259J6.2E0SNLMJFNHNK@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] blueprint-compiler: inherit python3-dir
 not python3targetconfig
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260626151325.1735368-1-ross.burton@arm.com>
In-Reply-To: <20260626151325.1735368-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jun 2026 15:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239714

On Fri Jun 26, 2026 at 5:13 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> This recipe just needs to know the value of PYTHON_SITEPACKAGES_DIR,
> which is defined by python3-dir. Inheriting that directly instead of
> python3targetconfig means we don't depend on python3 to build this tool.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

It looks like this has an impact on packaging or install:

ERROR: blueprint-compiler-0.20.4-r0 do_package: QA Issue: blueprint-compile=
r: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/python3.14
  /usr/lib/python3.14/site-packages
  /usr/lib/python3.14/site-packages/blueprintcompiler
  /usr/lib/python3.14/site-packages/blueprintcompiler/lsp.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/gir.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/errors.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/completions_utils.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/formatter.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/reference_docs.json
  /usr/lib/python3.14/site-packages/blueprintcompiler/annotations.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/interactive_port.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/linter.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/types.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/parse_tree.py
  /usr/lib/python3.14/site-packages/blueprintcompiler/lsp_utils.py
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3864
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4048

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


