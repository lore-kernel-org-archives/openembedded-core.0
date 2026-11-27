Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11854.1795763325437046719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Uc3gsHN9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED1794E417A6
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 07:08:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B370E6049C;
	Fri, 27 Nov 2026 07:08:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EBD111E69253;
	Fri, 27 Nov 2026 08:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795763322; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KmrH8LVwfsV7jx/LaAptqfmESrAXXQVhbMGRSQg7QVg=;
	b=Uc3gsHN9B3U4NlakObpC/kVB3iR2JOE64tNXjZ0CirumriEukHO2intgiLotYprhaLC0Gi
	5uOYPbwdl/jv2OXENZJ1KJwOeiRHpxmhCayjsJXQGr0Ifxaly3aSXY6SYdhDHSX2f5zTGU
	k4drm4hvtCyttNePmCNbbXgIz2Gb9G6kZjzjEzNqePprULcRjI6OdqRTGh2AIyqxUx5wGb
	Pgkdcrpw0VVa2VCoxyOkN4wyjcE/RCHuDOyWSEziluIsszehfvAXWDScXY3/lQBQPw2v/w
	FhkeOnRKSy1JgTp/IfWgeZyU/VNdRmgHEWa8twEeWKqxJOhS9yS4eLgqhnfSaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 08:08:39 +0100
Message-Id: <DN5SYWCJICB9.I7N9C1C4DHZI@bootlin.com>
Subject: Re: [OE-core] [PATCH v3] pseudo: Update to 1.99.2 version
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mark.hatle@amd.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261126021504.2712290-1-mark.hatle@amd.com>
In-Reply-To: <20261126021504.2712290-1-mark.hatle@amd.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 07:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251352

On Thu Nov 26, 2026 at 3:15 AM CET, Mark Hatle via openembedded-core wrote:
> Changelog from last version:

...

> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ---
> V3:
> Remove obsolete 0001-makewrappers-Allow-the-wrapper-architecture-to-be-se=
.patch
> missed in the V2 patch and detected by patchtest.
>
> V2:
> Corrects the V1 by removing the makewrappers patch
>

Hi Mark,

Thanks for the new version. Now I can see build errors with other
components. I can't remember if we need to do anything specific on
pseudo upgrade, do you have any clue about this one?

ERROR: Failed to spawn fakeroot worker to run /srv/pokybuild/yocto-worker/q=
emuarm64-alt/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-=
headers/linux-libc-headers_7.2.bb:do_install: [Errno 32] Broken pipe

I can see that one in most builds, with a few variations.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/5039
https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/5059
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/5033
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/5085
https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/5071
...

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

