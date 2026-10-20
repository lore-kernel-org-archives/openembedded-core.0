Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8592.1792505593054711182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 07:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=E/GwGphZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 88FD6C63455
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 14:14:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06A8E60393;
	Tue, 20 Oct 2026 14:13:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2B8210328934;
	Tue, 20 Oct 2026 16:13:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792505586; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8c3+iAQg55N7cLwEyyMqCnJhxrrMFCTiawjDwu5aNTM=;
	b=E/GwGphZNvJHg9oR+w3dzRaRHaQ0ZI+o7u1UeGF8/VM8TFiHvKKixFa3DXiZIjaT7ejZ9X
	An2CdCq9gMYalyk3Pcm56Ct1gghVIGw7rXzddJEdQqnUfW2e+DiHjFCqTZdI/pfYxpFINZ
	msXhYxO+yF2PnnFA6EFgC1xayDdK7sZhBGLtcQD+krETC1uOgyXkGmRFx0yjhpGrNTTAj5
	kLPQBfqeRiN2uic1kWFq6mG7CeyFce+B+hAsIFyMkYe3DYOaZP50d5hr01h/4/123vcDBc
	4UZQK1TYdNIWf0cCyAh75/nE+7/IQMzf4uPgyfA9dl9DOWI6+YqjrqVIrlhR8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 16:13:05 +0200
Message-Id: <DM9Q75SEZA82.3LDAH4WKTQUCF@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/7] elfutils: upgrade 0.196 -> 0.197
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
 <20261020092931.4330-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20261020092931.4330-2-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 14:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248295

On Tue Oct 20, 2026 at 11:29 AM CEST, Jaipaul Cheernam wrote:
> Version 0.197 "Anti-Corruption"
>
> THREAD-SAFETY: New document describing the thread safety model for elfuti=
ls
>        libraries when built with --enable-thread-safety.  Thread
>        safety support remains experimental.
>
> backends: Add unwinding support for alpha core files and processes.
>
> libdebuginfod: The progress callback function is now also invoked when
>        waiting for a server's initial response.
>
> libdw: dwarf_begin_elf_type is now exported from libdw.so.  Previously
>        this function was missing from the exported symbols.
>
> libelf: Improved handling of corrupt ZSTD compression headers.
>
> readelf: Improved handling of corrupt .gdb_index and .debug_cu_index
>  sections.
>
> translations: New Swedish translation.
>
> unstrip: Improved handling of corrupt symbol tables.  When -m is given,
>  the -d output path is now built from the module basename to avoid
>  writing the reconstructed module image outside the intended
>  output directory.
>
> - Drop already upstreamed patches
>   srcfiles.patch, 0001-backends-use-sys-uio.h-instead-of-linux-uio.h-for-=
s.patch
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade.

It look like the associated ptests are failing:

AssertionError:
Failed ptests:
{'elfutils': 'START: ptest-runner\n'
...
             '=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n'
             '2 of 258 tests did not behave as expected (2 unexpected passe=
s)\n'
             '(46 tests were not run)\n'
             'Please report to https://sourceware.org/bugzilla\n'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4777
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1409
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1398

The log in there is really verbose. I hope you can extract some useful
data from these few thousand lines of ptest log.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

