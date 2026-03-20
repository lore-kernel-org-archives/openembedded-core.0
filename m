Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C21109317D
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:08:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7093.1773990503493517674
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 00:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iP5u3rJD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 24F7B4E4272E;
	Fri, 20 Mar 2026 07:08:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DB444600E0;
	Fri, 20 Mar 2026 07:08:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BC2510450B0D;
	Fri, 20 Mar 2026 08:08:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773990500; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YIrI++diDfaKgjmAfuWaAffeaSw1QAwwEcPQ6uNJC28=;
	b=iP5u3rJDP0s7L/L8SmuQXJ47Tyn5ZCUegvzGGTyr8oCTOyWO4rScbaSmTCR3iv2+UGX7BV
	wfHpATJcpieso0fc3Zulqzu2vshGyAJ9BkpG7PVlvrody/9L6XqDUhk6F8wL6OU+5UFWvn
	bGg+GQPIEenZUxwjPPly8kgr9jJm14SmMTWdIloLQtzFAEUDXXVuz90PY7RKe0NBiR4Zaj
	lERsc08mpSAdZmjHBMR1wXmWGHfoK1GjJN0bY7GpxiToYp9t0uRKZq0FSByNleQRZ8KwMq
	4tSExn2J7QvqeT5ZGNPwoTA84Y3o+qBIdKL3oYiAmZfGg/IUvg+Yc01bX9u7KQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 08:08:16 +0100
Message-Id: <DH7F5B9DTVFY.3BJ9EA3TBXFQO@bootlin.com>
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <kai.kang@windriver.com>, <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] packagegroup-core-tools-profile: add
 lttng-modules to LTTNGTOOLS
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260318101025.2718647-1-kai.kang@windriver.com>
 <20260318101025.2718647-3-kai.kang@windriver.com>
In-Reply-To: <20260318101025.2718647-3-kai.kang@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233578

On Wed Mar 18, 2026 at 11:10 AM CET, Kai Kang via lists.openembedded.org wr=
ote:
> From: Kai Kang <kai.kang@windriver.com>
>
> It has removed lttng-modules from lttng-tools's RRECOMMENDS, so add
> lttng-modules to LTTNGTOOLS in packagegroup-core-tools-profile.bb to
> make its dependent packages unchanged.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---

Hi,

Thanks for your patch.

>  .../packagegroups/packagegroup-core-tools-profile.bb            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-prof=
ile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index 9c09f5ab44..42c15772a0 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -31,7 +31,7 @@ SYSTEMTAP:libc-musl =3D ""
>  SYSTEMTAP:nios2 =3D ""
>  SYSTEMTAP:riscv32 =3D ""
> =20
> -LTTNGTOOLS =3D "lttng-tools"
> +LTTNGTOOLS =3D "lttng-tools lttng-modules"

This won't work for riscv64, as lttng-modules is marked as not
compatible:

ERROR: Nothing RPROVIDES 'lttng-modules' (but /srv/pokybuild/yocto-worker/q=
emuriscv64/build/layers/openembedded-core/meta/recipes-core/packagegroups/p=
ackagegroup-core-tools-profile.bb RDEPENDS on or otherwise requires it)
lttng-modules was skipped: incompatible with host riscv64-poky-linux (not i=
n COMPATIBLE_HOST)
lttng-modules was skipped: incompatible with host riscv64-poky-linux (not i=
n COMPATIBLE_HOST)
NOTE: Runtime target 'lttng-modules' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lttng-modules']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/1252

Can you look for a solution working on all platforms?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


