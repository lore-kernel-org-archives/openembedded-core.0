Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FAF3CED260
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:40:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8765.1763458849900663079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LwcNDI3U;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BA3F3C12673
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 09:40:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEC6A606FE;
	Tue, 18 Nov 2025 09:40:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4286510371985;
	Tue, 18 Nov 2025 10:40:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763458846; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G/S5707ztoSacKT8JYshcSNXnesXF/qCW82M6VFnShU=;
	b=LwcNDI3UVY3jdyOWYyVBglBqOMQBJEzfEIgLxViDrEm3cA3ndNRU92PV+T1iWmSqjrwwP5
	vVI17vIahj++5VOF87KGKZidUuX3wIW3Mc2r/pBk1vT7gPb7+ngD8kUkuMQNwh86Ydgxd6
	ekoqwaIAz4tgE6aD9s/ePnQbAJbEY5qDgQ44UR/AHEmoZfuisYIbhu/vTq+RvQVAjorDOk
	K3fOlakVol+TUkFLE1J0LtmLLIXFu6mhUKKEdSK3mJLdqbNn9gpvxhu3GzpyykKC3XjX28
	n1iGJdyldZsnYc0zkGdYNyfA+ufiKT6acVmXtdFzdxTRdAy6S6Nne23/t13H9w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Nov 2025 10:40:39 +0100
Message-Id: <DEBPZJ45X6YS.GBKWF9SBJFS0@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] nasm: upgrade 2.16.03 -> 3.01
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251118041407.1024915-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20251118041407.1024915-1-ankur.tyagi85@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226515

On Tue Nov 18, 2025 at 5:14 AM CET, Ankur Tyagi via lists.openembedded.org =
wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> License-Update: Copyright year updated to 2025 and upstream replaced verb=
ose copyright headers with SPDX tags
>
> Refreshed patches for the new version.
>
> Release Note:
> https://www.nasm.us/docs/3.01/nasmac.html
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hi Ankur,

You are talking about license update, but I don't see the change in the
recipe. Is it missing?

Anyway, it is failing to build on the autobuilder:

ERROR: nasm-native-3.01-r0 do_populate_lic: QA Issue: nasm-native: The LIC_=
FILES_CHKSUM does not match for file://LICENSE;md5=3D90904486f8fbf1861cf427=
52e1a39efe
nasm-native: The new md5 checksum is 6178dc4f5355e40552448080e67a214b
nasm-native: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
NASM is now licensed under the 2-clause BSD license, also known as the
simplified BSD license.

SPDX-License-Identifier: BSD-2-Clause

    Copyright 1996-2025 the NASM Authors - All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following
    conditions are met:
...
      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
      DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
      CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
      SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
      NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
      LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
      HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
      CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
      OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
      EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
nasm-native: Check if the license information has changed in /srv/pokybuild=
/yocto-worker/qemux86-alt/build/build/tmp/work/x86_64-linux/nasm-native/3.0=
1/sources/nasm-3.01/LICENSE to verify that the LICENSE value "BSD-2-Clause"=
 remains valid [license-checksum]
ERROR: nasm-native-3.01-r0 do_populate_lic: Fatal QA errors were found, fai=
ling task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2710

Can you fix it?

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


