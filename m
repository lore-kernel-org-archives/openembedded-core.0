Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D156E1049511
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 09:13:19 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16601.1773220395286277402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 02:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fZZ0yxtA;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0ED58C41586
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:13:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D719660004;
	Wed, 11 Mar 2026 09:13:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A96E1036991E;
	Wed, 11 Mar 2026 10:13:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773220392; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=56BquTX+3Y6T3bZWNQS9sEclb4xnOAF4mP+hPfU7NkA=;
	b=fZZ0yxtApzIB6FYXt+FdZIzjPPeAu5C4uLLZxve+6TfPPgMOJ/vYHpermBKWZkE70hmfF6
	q2NcAJo59rRES+IaanE55dA1WR6XhBqriDUTmWg9H98Gm7azr2TsuTKi6T6nPa8B0WYc/q
	6ILLIkJJFEcEZ4Je6qSjrpfqijnp6Fd3nBohB6h6P3MN6uQ/u+zfhIpFZmYE6KKVbZGndv
	I37iY/8Qu4hCHJkuMaqtmYsYIijM7w9r9RZi/mrKoNqwAHTd5QwvxXsjP/X26OCPL/X6KU
	x7kgul3iwwOhpuJSf3gJb0vd/9D9/jQWLLJpjTDC0+JhtUTy6kv5o+ksEF5FyQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 10:13:10 +0100
Message-Id: <DGZU61EDNZ2W.1DOR2YWGZUYFE@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rust: dynamically link with llvm for all rust
 variants
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260310181354.2396448-1-alex.kanavin@gmail.com>
 <131089.1773216425426295510@lists.openembedded.org>
In-Reply-To: <131089.1773216425426295510@lists.openembedded.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 09:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232848

On Wed Mar 11, 2026 at 9:07 AM CET, Deepesh via lists.openembedded.org Vara=
tharajan wrote:
> Hi Alex,
>
> This change need tweaks in rust.py and rust recipe to support multilib bu=
ilds.
> Without tweaks rust selftest and rust multilib builds will fail.
>
> Required changes can be found here :
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Ddeepes=
h/sunil-rust-issue&id=3D44ce23e12e411ef9a1724e79c2b6ac6d5f0ddedc
>
> Regards,
> Deepesh

Hi Alex, Deepesh,

I believe it is related to this error?

/tmp/work/test4341/rustc_codegen_llvm-e21c84994fd391cb: error while loading=
 shared libraries: libLLVM.so.21.1: cannot open shared object file: No such=
 file or directory
error: test failed, to rerun pass `-p rustc_codegen_llvm --lib`
https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1177
https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3286

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


