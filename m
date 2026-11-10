Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15025.1794294944935634850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 23:15:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ETjw8daS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A182C1A15C1
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:15:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76EC260012;
	Tue, 10 Nov 2026 07:15:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BFDA610328531;
	Tue, 10 Nov 2026 08:15:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794294942; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2JgvAL+IzMYCuGJGNsLg3AtjvtzjEEggAo2NcwzpvSU=;
	b=ETjw8daS+cMOEW89LK52EFkbnJw0Ac2/9HfUgJdH32U7Jph4lrbCzOUt0dsm1On/KBLgW8
	fMOZaIqS4MVSCr1Z0zt8u/oiFajtLVvrdrnIDcmKS6bmzSdDxwLyqft/zD5cG6KUlXdVdc
	dC6fy/DeFLsgzSYhXYPojtDvkNaWN7pZNJlhQuWnWjtVYk9VUvAnyDNUUIUWW//OTJOuLu
	VxSxxQQC+PBSxqyH4iviKpjct7ayP+9hhJeKNSLn9b69ZZ7ux6gtSNxRj5HoHAzwh6AfE4
	o4o1CJnLcuHbER2Jv1gVETj3/VaqHHAwjdv2w4Ih0DOwOeyduBRVeMHVMU/9Wg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 08:15:38 +0100
Message-Id: <DMRCGZJ1946G.23GSWKZLKMZHI@bootlin.com>
Subject: Re: [OE-core] [PATCH 16/21] groff: Upgrade 1.24.2 -> 1.25.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
 <20261109134034.74458-17-jaipaul.cheernam@est.tech>
In-Reply-To: <20261109134034.74458-17-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249906

On Mon Nov 9, 2026 at 2:40 PM CET, Jaipaul Cheernam wrote:
> - Drop builddep.patch as fix is part of release
> - Refresh exisitng patches
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade. We can see this failure:

ERROR: groff-1.25.0-r0 do_compile: oe_runmake failed
...
utils/tfmtodit/tfmtodit.o libgroff.a -lm lib/libgnu.a
| /bin/bash: line 2: /srv/pokybuild/yocto-worker/genericx86-64/build/build/=
tmp/work/core2-64-poky-linux/groff/1.25.0/sources/groff-1.25.0/soelim: cann=
ot execute: required file not found
| make[2]: *** [Makefile:21098: man/groff.7.man] Error 127
| make[2]: *** Deleting file 'man/groff.7.man'
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/srv/pokybuild/yocto-worker/genericx86-64/bui=
ld/build/tmp/work/core2-64-poky-linux/groff/1.25.0/sources/groff-1.25.0'
| make[1]: Leaving directory '/srv/pokybuild/yocto-worker/genericx86-64/bui=
ld/build/tmp/work/core2-64-poky-linux/groff/1.25.0/sources/groff-1.25.0'
| make[1]: *** [Makefile:13422: all-recursive] Error 1
| make: *** [Makefile:7743: all] Error 2
| ERROR: oe_runmake failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/5006

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

