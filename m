Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD98CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:47:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.18444.1757512018314917223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 06:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KSLITHma;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 772924E40BDD
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 13:46:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6806B606D4;
	Wed, 10 Sep 2025 13:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BD6B102F27C1;
	Wed, 10 Sep 2025 15:46:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757512016; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cU1acKWzO+SaR/jf6mp+fHt1nJ6mLp2lDMdhROaFlH4=;
	b=KSLITHmabVpU48dVNtY1gQCndOehHKfHPF00nv9JyXjg1ZBJ80f1QL3EsadwhXpFF6geqa
	Cs9AzhRLm90YQZczwb7hcE+wkfmTg/+8mQB4121npkHUC7wgdF9dh8A7IczLeFCOKytk7a
	Avfivnz5cp6Ii94VpjULQMWMkcPt4Ppd8gFaggilS/UivAZSpTcbh2HL3yU23L+zDJsJFx
	vj9Y38Ingc5fT48u2JmwYIGBasBJVMNYd98ubqNbO9Kl/r6dhj9gZjPaCVEX4WRyLuFS68
	hl09C4hd3n3RlVTRVpzmuC6HW5J40BQs6dZ6Y37EXPR2kaz5ldID1V5tGXUuTg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 15:46:53 +0200
Message-Id: <DCP60H2V3H2K.1B0ARJCCPOKQR@bootlin.com>
Subject: Re: [OE-core] [PATCH 24/40] nghttp2: upgrade 1.66.0 -> 1.67.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250910091646.998-1-wangmy@fujitsu.com>
 <20250910091646.998-24-wangmy@fujitsu.com>
In-Reply-To: <20250910091646.998-24-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 13:47:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223213

On Wed Sep 10, 2025 at 11:16 AM CEST, wangmy via lists.openembedded.org wro=
te:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for the update.

This is triggering a QA issue, as some files are not shipped in
packages:

ERROR: nghttp2-1.67.0-r0 do_package: QA Issue: nghttp2: Files/directories w=
ere installed but not shipped in any package:
  /usr/lib
  /usr/lib/cmake
  /usr/lib/cmake/nghttp2
  /usr/lib/cmake/nghttp2/nghttp2Targets.cmake
  /usr/lib/cmake/nghttp2/nghttp2Targets-relwithdebinfo.cmake
  /usr/lib/cmake/nghttp2/nghttp2Config.cmake
  /usr/lib/cmake/nghttp2/nghttp2ConfigVersion.cmake

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2357

Can you fix it please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


