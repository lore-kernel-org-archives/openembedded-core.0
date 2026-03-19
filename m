Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC331091913
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 19:57:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4943.1773950225650873741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 12:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RcTmuqhu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5A90C1A2EE9
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 19:57:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2685860050;
	Thu, 19 Mar 2026 19:57:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2E52F10450A9C;
	Thu, 19 Mar 2026 20:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773950222; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9dqD2XulBYG2b5R/uUB1R7zYi3rIot8uMFoLzi2T51U=;
	b=RcTmuqhuzGb9P9TzYX6MkrhGY1iP4bjcFG8njMosEM0tpF45vLqZ+DwvMzUEJtzY/T3cRz
	lspNLF+9CQv3Szz5KfIOi3W533zYoZX4bWkd9ia4G7nc7B7FJYAt9yLMDm7CWCDDMX/Xct
	1pg2rK9Dv/EtNyljV66TyV9XMAfDmkPEEBudIDm2HCbhi/DEQyo/voSu5Vkxk+WwUnsQ9L
	YzSKa51vLJI5kb5ykSfx1x4IOjA1bT7JPftbmDcf4apjCGgk3QT+/rBWaL6A5o3V4/C0HM
	VBUaToLShanuO1Bu5IhC5FwuURH9mipGyIrWIe8qwcj9GEDZ+2J3rQXJeNYHmw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 20:57:01 +0100
Message-Id: <DH70VDAF9LYM.1SEY7V4WBKCK1@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 30/40] python3-shacl2code: upgrade 0.0.24 ->
 1.0.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260319101332.2067-1-wangmy@fujitsu.com>
 <20260319101332.2067-30-wangmy@fujitsu.com>
In-Reply-To: <20260319101332.2067-30-wangmy@fujitsu.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 19:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233552

On Thu Mar 19, 2026 at 11:13 AM CET, wangmy via lists.openembedded.org wrot=
e:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...python3-shacl2code_0.0.24.bb =3D> python3-shacl2code_1.0.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-shacl2code_0.0.24.bb =3D> p=
ython3-shacl2code_1.0.0.bb} (81%)
>
> diff --git a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb b/=
meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
> similarity index 81%
> rename from meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
> rename to meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
> index 93ed9a2530..49416b3a04 100644
> --- a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
> +++ b/meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0582f358628f299f29c23bf5fb2f7=
3c9"
> =20
>  PYPI_PACKAGE =3D "shacl2code"
> -SRC_URI[sha256sum] =3D "d8b511054ca564b4514b9186ece7f5eb8048cfc5daa6625d=
ef1a3adba13c4f66"
> +SRC_URI[sha256sum] =3D "1f9d5cb786bf98d3a7de92218fe5e546143d6aa2aa134098=
200b06022629d005"
> =20
>  inherit pypi python_hatchling
> =20

Hi Wang,

Thanks for the upgrade.

This is breaking python3-spdx-python-model:

ERROR: python3-spdx-python-model-0.0.4-r0 do_compile: Execution of '/srv/po=
kybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-=
musl/python3-spdx-python-model/0.0.4/temp/run.do_compile.3588241' failed wi=
th exit code 1
...
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/musl-qemux=
86/build/build/tmp/work/core2-32-poky-linux-musl/python3-spdx-python-model/=
0.0.4/temp/log.do_compile.3588241
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Missing dependencies:
| 	shacl2code=3D=3D0.0.24

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3442

Can you have a look at the issue?

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


