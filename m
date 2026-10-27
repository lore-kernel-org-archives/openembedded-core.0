Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14120.1793088714765039976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dSiBl4B6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7AE121A1367;
	Tue, 27 Oct 2026 08:11:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47DDE603BD;
	Tue, 27 Oct 2026 08:11:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AB11310329027;
	Tue, 27 Oct 2026 09:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793088711; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t4Pt0hZ9oIeeC2vgPfFIYKQAk1gucVgh89XHWOJA9ts=;
	b=dSiBl4B6HfN1nXvC8Cm8/r7LqlJ7ua6iQKfqUZRd0gDtdAwvvRy7pCjB8PGy0+y845hpdY
	EyZHjI6pSkHkpJPLPD1JJDJmd/Nb2E8tzS+6/HqY/KdR6o7VV3Eimjpp2xHgXHSqfHixRH
	iGFQP47/IlrzesTtwkOMxANmAY1VwX+dK2db3I5e7lGVDBQRJKvSYh7INlATJbfzDbdeTR
	UKZYa1qo8yw78miRt2UYxUWs+/AoVpBAI0S/YKOzNWGdXKkBm2iWSePgNuGLPG9+KtmTed
	HNbeuCDsTZpceq2kWtHIw0tN3zGzEkrfGy76SZ1KJ/gR7ft0Ya0NKjOz7dU9Nw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Oct 2026 09:11:47 +0100
Message-Id: <DMFGWCL8ELP8.1TA54FJ0CK9MO@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 05/12] python3-cython: upgrade 3.2.9 -> 3.3.0
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
 <20261026103138.3137-5-jaipaul.cheernam@est.tech>
In-Reply-To: <20261026103138.3137-5-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 08:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248712

On Mon Oct 26, 2026 at 11:31 AM CET, Jaipaul Cheernam wrote:
> ReleaseNotes: https://github.com/cython/cython/releases/tag/3.3.0
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for your patch, but we do have some build issues:

ERROR: python3-cython-native-3.3.0-r0 do_compile: Execution of '/srv/pokybu=
ild/yocto-worker/genericx86-64-alt/build/build/tmp/work/x86_64-linux/python=
3-cython-native/3.3.0/temp/run.do_compile.2740824' failed with exit code 1
...
|
| Error compiling Cython file:
| ------------------------------------------------------------
| ...
| cdef object NO_REFS =3D (0, None)
|
|
| @cython.final
| cdef class Context(object):
|     cdef readonly object name, filename
|                          ^
| ------------------------------------------------------------
| Cython/Runtime/refnanny.pyx:50:25: C attributes cannot be added in implem=
entation part of extension type defined in a pxd

https://autobuilder.yoctoproject.org/valkyrie/#/builders/93/builds/4877
https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/4730
https://autobuilder.yoctoproject.org/valkyrie/#/builders/98/builds/4739

Ross sent another series a few days ago, It didn't show this error, but
was showing some reproducibility error.

https://lists.openembedded.org/g/openembedded-core/topic/121652235?msg=3D24=
7619#msg247619

You should probably synchronize, so you don't both work on the same
issue.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

