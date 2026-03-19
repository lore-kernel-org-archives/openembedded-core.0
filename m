Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE7F1091916
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 20:01:16 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5027.1773950469036291545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 13:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=du75+29B;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EF8A9C55074;
	Thu, 19 Mar 2026 20:01:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D854760050;
	Thu, 19 Mar 2026 20:01:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9ACA510450A9C;
	Thu, 19 Mar 2026 21:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773950466; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z0NC9uEDUwRk40ffQwuCE6ERbRfSdG6aubwjF8wOefQ=;
	b=du75+29BHei7CbZeG0J0uztR5l2pf5DkYKjABJ/nriCp09zAtN2G9tLZvYnAirqo5UNfbq
	3AuUI0kFjASkxIAHullUQ1NfiFQLyWXj5eKLcPd6zCBb8o1/lviiWwMvWEDOqrOTmjKeov
	imbruVZbdWbOsFOeRt2qP3eFv10sPSl0AYXIfXhNYr2LlCQqihleuSSbI2AxnR/JG1wTXI
	ATxvrKh1Lx38oelEa0taQJfI0bQCl0iNBxFFqgXsDIbnPIEw/ra90zFxDwn9QTsswsvRI3
	npvfYzntCYAplLlUmzWzE9GY80PXT/WL6LNtCzIK7PoulzUOziHfCm3xD223BA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 21:01:05 +0100
Message-Id: <DH70YHBYSFEG.13ZVZIG5RJK5L@bootlin.com>
Subject: Re: [OE-core] [PATCH 30/40] python3-shacl2code: upgrade 0.0.24 ->
 1.0.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260319101332.2067-1-wangmy@fujitsu.com>
 <20260319101332.2067-30-wangmy@fujitsu.com>
 <DH70VDAF9LYM.1SEY7V4WBKCK1@bootlin.com>
In-Reply-To: <DH70VDAF9LYM.1SEY7V4WBKCK1@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 20:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233553

On Thu Mar 19, 2026 at 8:57 PM CET, Mathieu Dubois-Briand wrote:
> On Thu Mar 19, 2026 at 11:13 AM CET, wangmy via lists.openembedded.org wr=
ote:
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>> ---
>>  ...python3-shacl2code_0.0.24.bb =3D> python3-shacl2code_1.0.0.bb} | 2 +=
-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  rename meta/recipes-devtools/python/{python3-shacl2code_0.0.24.bb =3D> =
python3-shacl2code_1.0.0.bb} (81%)
>>
>> diff --git a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb b=
/meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
>> similarity index 81%
>> rename from meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
>> rename to meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
>> index 93ed9a2530..49416b3a04 100644
>> --- a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
>> +++ b/meta/recipes-devtools/python/python3-shacl2code_1.0.0.bb
>> @@ -5,7 +5,7 @@ LICENSE =3D "MIT"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0582f358628f299f29c23bf5fb2f=
73c9"
>> =20
>>  PYPI_PACKAGE =3D "shacl2code"
>> -SRC_URI[sha256sum] =3D "d8b511054ca564b4514b9186ece7f5eb8048cfc5daa6625=
def1a3adba13c4f66"
>> +SRC_URI[sha256sum] =3D "1f9d5cb786bf98d3a7de92218fe5e546143d6aa2aa13409=
8200b06022629d005"
>> =20
>>  inherit pypi python_hatchling
>> =20
>
> Hi Wang,
>
> Thanks for the upgrade.
>
> This is breaking python3-spdx-python-model:
>
> ERROR: python3-spdx-python-model-0.0.4-r0 do_compile: Execution of '/srv/=
pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linu=
x-musl/python3-spdx-python-model/0.0.4/temp/run.do_compile.3588241' failed =
with exit code 1
> ...
> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/musl-qem=
ux86/build/build/tmp/work/core2-32-poky-linux-musl/python3-spdx-python-mode=
l/0.0.4/temp/log.do_compile.3588241
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | * Getting build dependencies for wheel...
> |
> | ERROR Missing dependencies:
> | 	shacl2code=3D=3D0.0.24
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3442
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu

Upstream did upgrade: https://github.com/spdx/spdx-python-model/commit/678f=
5af062743cb8a84fdb24bb9e63963464c86b

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


