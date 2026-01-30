Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51586E6BF3B
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 21:36:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3237.1769809002520404383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 13:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lUJ8mwIj;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 61DA14E4235E
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 21:36:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E7996075A;
	Fri, 30 Jan 2026 21:36:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51ACA119A8875;
	Fri, 30 Jan 2026 22:36:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769808999; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YliZ+3tOH/as3R6woD8Qu+6itS/aoEQpZIdPD0ytFTI=;
	b=lUJ8mwIj5nQf1kwIqBooo1ExaCMbc3JX/JTSZN+24CFU4NDObZR9N+oPRHL2TyqJtUp5N2
	k6q69lwI6ewbSEBvyy0rzYiTIeb/TUdvb6vDk8rxxY9/HNsClfKc/h/Q2YupsqFuUnMP4d
	SOaJ76DCG4uDUZH3wz4EzfebbfoeIYbMrqAI9UlLbqsApStv0j4+hI4Jw+0XnOMX5ntz+R
	J8lqK6pZQWMU1PqLU+/FM63IN8fQLzhaVjvAfI6uSt0A7LkY3DTXUsZeBAlX/GQebJuyGy
	Zqitshjc4EH+Bk4kr2QglRCKmUwRqmCpX+kJUohPsjO72VT1PEi95/fmH3yOhg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 22:36:36 +0100
Message-Id: <DG28XGQMO9WD.2WCJJ8PRVI0U8@bootlin.com>
Subject: Re: [OE-core][PATCH 1/6] python3-appdirs: Add new recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
 <20260129035353.8982-2-liuyd.fnst@fujitsu.com>
 <DG1S66FXLIDL.1NND6ZNKZUEOY@bootlin.com>
In-Reply-To: <DG1S66FXLIDL.1NND6ZNKZUEOY@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 21:36:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230202

On Fri Jan 30, 2026 at 9:28 AM CET, Mathieu Dubois-Briand wrote:
> On Thu Jan 29, 2026 at 4:53 AM CET, Yiding Liu (Fujitsu) via lists.openem=
bedded.org wrote:
>> Move it from meta-openembedded to openembedded-core as it is required by=
 hotdoc 0.17.4.
>>
>> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
>> ---
>
> Hi Liu,
>
> Thanks for your patch.
>
>>  meta/recipes-devtools/python/python3-appdirs_1.4.4.bb | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>  create mode 100644 meta/recipes-devtools/python/python3-appdirs_1.4.4.b=
b
>>
>> diff --git a/meta/recipes-devtools/python/python3-appdirs_1.4.4.bb b/met=
a/recipes-devtools/python/python3-appdirs_1.4.4.bb
>> new file mode 100644
>> index 0000000000..bee0b7d815
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-appdirs_1.4.4.bb
>> @@ -0,0 +1,11 @@
>> +SUMMARY =3D "A small Python module for determining appropriate + platfo=
rm-specific dirs, e.g. a user data dir."
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D31625363c45eb0c67c630a2f=
73e438e4"
>
> You will also need to add an HOMEPAGE line in there.
>
> Thanks,
> Mathieu

Hi Liu,

I missed that at first, but you will also need to add an entry into
meta/conf/distro/include/maintainers.inc for all added recipes.=20

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


