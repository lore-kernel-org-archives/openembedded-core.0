Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75711C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 18:48:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41777.1782499715335970922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 11:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2hBdsrkk;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0EB9B4E40973
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 18:48:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7B4560232;
	Fri, 26 Jun 2026 18:48:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35F21106F107E;
	Fri, 26 Jun 2026 20:48:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782499712; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iB8BmUu2a10+a/nY4IpqhUpvnk/2QcYUcwBVgZ4a9KA=;
	b=2hBdsrkkaoRY5JG26vkot/kJMuzgbnzSjCzbNQ8FnduXcGhG3442t4d+ETgvnqz1/6LN5F
	3GtmsxgINFMPlnJ2NTz45lib56b7vDS3zIQ9rOSk2M8SOEZv8eTPWHXNcmOEql9m+BxzgI
	ZHYOXNgG8+e6y43mxbP3+waWZhb2tLkvqNw4ZE9wAzqW1ZgQ+V12tAoQe/lKJIf7eNSHVO
	jSqYyiSvjC4NJnDL4HlOeuOLM6ZhJdyKSQ/fiTZOi29DOIJxc3mC1XuhK+I0DQ4PeilLCV
	MBwsF/YQx0+P/KJyMB1ScXaxzNENEEpbfqeUQzF4cNWrazoNou0A49/XQr27iQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 20:48:29 +0200
Message-Id: <DJJ7ETV9FF38.1UI77ID7CET1P@bootlin.com>
Subject: Re: [OE-core] [PATCH] llvm: Enable MLIR support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <luca.fancellu@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260625133120.2111653-1-luca.fancellu@arm.com>
In-Reply-To: <20260625133120.2111653-1-luca.fancellu@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 18:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239657

On Thu Jun 25, 2026 at 3:31 PM CEST, luca fancellu via lists.openembedded.o=
rg wrote:
> Enable the MLIR LLVM project in the clang folder so the compiler
> flow can use MLIR and TOSA APIs that are not provided by a plain
> LLVM build.
>
> Add a patch that fix the install targets for mlir-src-sharder
> and mlir-irdl-to-cpp.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Hi Luca,

Thanks for your patch.

> +++ b/meta/recipes-devtools/clang/llvm-mlir_git.bb
> @@ -0,0 +1,66 @@
> +#
> +# SPDX-FileCopyrightText: <text>Copyright 2026 Arm Limited and/or its
> +# affiliates <open-source-office@arm.com></text>
> +#
> +# SPDX-License-Identifier: MIT

You will need to add a maintainer line in
meta/conf/distro/include/maintainers.inc for this new recipe.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


