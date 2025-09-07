Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C36CA1017
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 14:09:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.19291.1757254189293111124
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 07:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GObAyMeW;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C6353C8EC5F;
	Sun,  7 Sep 2025 14:09:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23AF26061A;
	Sun,  7 Sep 2025 14:09:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FB4E102F0DE6;
	Sun,  7 Sep 2025 16:09:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757254186; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HEsJykNmmpwJARKFO+YWAOQVSFneFJh4WtvY72MVylU=;
	b=GObAyMeWpGyA3Id7zVs5OS6Bxre5sqJsDNHGFZCAgaZ88t8ga3yIB8nCd5j2TGoNC/mr/H
	sy7LBiCMv6RtKhvnRNoGhhS0PDcNvXh9MYEYMzZoGKVX8LQC8wD4/9DBA3YSvf4K7+mck0
	Y/ftQ0oWCmNRz8hx1RNxmcHjidN42xKe7zW+8vfv/gI/m4aMNuP+3iUyk53cVyFe72KHvn
	y/I7dcsIu9lmUOLpDzptn/tAP1sggs4CU+v54ZXPm2DShxB9PkKI0Ty5P7MMHQEECNYbPN
	u5wgKT22zSZJiyuz81v3D2xphL3zaUGoRg6Og5i5LZWJ/d0gTMJpCNwI+fMfvQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Sep 2025 16:09:42 +0200
Message-Id: <DCMMMAUJM8Z0.LPZ2GTZCLKYA@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <yi.zhao@eng.windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] tcl8: upgrade 8.6.16 -> 8.6.17
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250905061422.495303-1-yi.zhao@windriver.com>
In-Reply-To: <20250905061422.495303-1-yi.zhao@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 14:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223053

On Fri Sep 5, 2025 at 8:14 AM CEST, Yi Zhao via lists.openembedded.org wrot=
e:
> ChangeLog:
>   2024-12-16 (bug) [63449c] [namespace children] doesn't match non-glob
>              patterns below the global namespace
>   2025-01-06 (bug) [fc3509] Better error-message than "interpreter uses
>              an incompatible stubs mechanism"
>   2025-01-19 tzdata updated to Olson's tzdata2025a
>   2025-01-28 (bug) [4f0b57] Win: [exec] now works on App Execution
>              Aliases.
>   2025-01-28 (bug) [4e2c8b] Win: [auto_execok] handles larger set of
>              shell commands.
>   2025-03-06 (bug) [ba68d1] errorline from [interp eval], interp-26.9
>   2025-03-23 tzdata updated to Olson's tzdata2025b
>   2025-04-11 (bug) [fd8341] Tcl_InitStubs compatibility for 9.1, better
>              error-handling
>   2025-05-05 (bug) [42d14c] Fix scan with long mantissa. Ex.: scan
>              "1.[string repeat 1 191]e-321" %g
>   2025-06-18 (bug) [4f338b] add missing Tcl_CloseEx docs
>   2025-06-24 (bug) [ecf35c] Correct nested handling of return option
>              -options
>   2025-06-25 (bug) [ecafd8] Euro/Tail-sign missing from cp864 encoding
>   2025-07-03 (bug) [6b0f77] gcc 14 breaks configure test for bigendian
>              leading to broken floating point
>   2025-07-16 (bug) [c9f052] prevent overflow crash in Tcl_SplitList().
>   2025-07-21 (bug) [61c01e] Flawed ref counts in filesystem
>              implementation for Windows led to use-after-free
>   2025-08-12 (new) dde =3D> 1.4.5
>   2025-08-12 (bug) [992f94] avoid misaligned pointers in macOS file
>              attribute functions
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---

Hi Yi Zhao,

Thanks for your patch.

It looks like we have some ptest issues after the update:

Failed ptests:
{'tcl8': ['cmdAH.test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2197
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2231

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250906-46/testresults/qemuarm64=
-ptest/core-image-ptest-tcl8/
https://valkyrie.yocto.io/pub/non-release/20250906-46/testresults/qemux86-6=
4-ptest/core-image-ptest-tcl8/

Can you have a look at these failures please

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


