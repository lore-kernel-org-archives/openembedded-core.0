Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E33FF885A
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 07:33:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33827.1777966383916814794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 00:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=yjw+9nx4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AA4431A3520;
	Tue,  5 May 2026 07:33:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73B715FD9D;
	Tue,  5 May 2026 07:33:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CCF5811AD1E4F;
	Tue,  5 May 2026 09:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777966381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=d7vktRpixYhHfFl9cWPvDA1Y7NsrDCJpBzK/f/+aeCI=;
	b=yjw+9nx4wZuKfD5JltA+X0SdayNwYT5rGl6ZcVoY2R8T5V43csQJTWAHX6lpQdAp7/dWCp
	5LUbLG5Yxnh6gtNQRx4zcvc3UWP2UQD1RbNlE11W0meprLDn++clPFDdP7xcPLJcCsiwSE
	iDT3zNn+cn8aE+jdkYvYixyibEFvuSZJ2gOfE96QbQEhVUkq2G9ELXHa9GIQP5FHixxunB
	HPAJCzfpk8zeyb/MdShig5gXn7+dacK0eLU83VtEnnI78iUh6ybURhcLXO0+4qZVSVbv/N
	rMVaaZaalIWYgmOfNeqbm+M2vHHU3IIq/mvE2Lgohd2bKhbGOnwDfhT6LUMhPg==
Message-ID: <d1935c45-4151-4084-b94d-09a3387cac3b@bootlin.com>
Date: Tue, 5 May 2026 09:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 55/62] rsync: upgrade 3.4.1 -> 3.4.2
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
 <20260502162929.1377831-55-richard.purdie@linuxfoundation.org>
Content-Language: en-US, fr
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260502162929.1377831-55-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 07:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236462

Hello,

On 5/2/26 18:29, Richard Purdie via lists.openembedded.org wrote:
> Drop backported CVE patch included in this release.
>=20
> Parts of the prototypes patch were fixed upstream (in zlib) but some se=
ctions
> were not, drop the merged sections of the patch.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   ...-prototypes-to-function-declarations.patch | 68 +++---------------=
-
>   .../rsync/files/CVE-2025-10158.patch          | 36 ----------
>   .../rsync/files/determism.patch               |  4 +-
>   .../rsync/files/makefile-no-rebuild.patch     |  6 +-
>   .../rsync/{rsync_3.4.1.bb =3D> rsync_3.4.2.bb}  |  3 +-
>   5 files changed, 16 insertions(+), 101 deletions(-)
>   delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.p=
atch
>   rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb =3D> rsync_3.4.2.b=
b} (95%)

Could this update be related to the error below, at SWAT [1]?

ERROR: Logfile of failure stored in:=20
/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/x86-64-=
v3-poky-linux/rsync/3.4.2/temp/log.do_install_ptest_base.1107185
Log data follows:
| DEBUG: Executing shell function do_install_ptest_base
| install: cannot stat=20
'/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/x86-64=
-v3-poky-linux/rsync/3.4.2/sources/rsync-3.4.2/runtests.sh':=20
No such file or directory
| WARNING: exit code 1 from a shell command.
NOTE: recipe rsync-3.4.2-r0: task do_install_ptest_base: Failed
ERROR: Task=20
(/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembedded-c=
ore/meta/recipes-devtools/rsync/rsync_3.4.2.bb:do_install_ptest_base)=20
failed with exit code '1'

[1]=20
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/3617/=
steps/12/logs/stdio

--=20
Best regards,
Jo=C3=A3o Marcos Costa

