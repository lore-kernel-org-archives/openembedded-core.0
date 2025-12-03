Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F63AD15DAF
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 16:22:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19469.1764778962584713563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 08:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=e8Qolq7Y;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 47A81C1356E
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 16:22:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97CDA60706;
	Wed,  3 Dec 2025 16:22:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 484E811920B19;
	Wed,  3 Dec 2025 17:22:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764778960; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e4dZe0foc0eghbMypPAWtgQzPi6OZ9xu8ZVN0eRQLw0=;
	b=e8Qolq7Y0LgdAXUJARj+g0/qPcuT/DPoxwkM8oiwCzjTGL4KObFMW0YyTrff0xUDCNm9U+
	hhMcfgvwD+lqNENfQQKq9X4FniSOsaWfu6NL4L/vAegxyV//0Bp/yk/do97sBrvw/mkVto
	zKejaanjdR/HmSAcrtvQaFbMw43RNnmjZ20/N+Qg1P95593SPvp6rCvlIbSksv0tYsMuf7
	8ARtj9T/xXN3JD7+TzGt9Y56u/Aea4Kv4Nrn0IhWW7Yq3LE0CyGT5KMs26a1Gl+uhZ3AC2
	48Ifs2bGOX+yOhSCMJ5CTFFPyI42yWoA28VZ1VeKk6FjG69yJTrvR0kqDSZbIA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 17:22:38 +0100
Message-Id: <DEOPXHBWOJX5.1IS9KMOWMJAGQ@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] gnutls: upgrade 3.8.10 -> 3.8.11
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251126233410.1243674-1-peter.marko@siemens.com>
 <DEOKMWAUSBXZ.3H75N1QP1X7EH@bootlin.com>
 <PA4PR10MB57079BFF02DCCF78C2819034FDD9A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <PA4PR10MB57079BFF02DCCF78C2819034FDD9A@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 16:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227234

On Wed Dec 3, 2025 at 1:15 PM CET, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Sent: Wednesday, December 3, 2025 13:14
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core][PATCH] gnutls: upgrade 3.8.10 -> 3.8.11
>>=20
>> On Thu Nov 27, 2025 at 12:34 AM CET, Peter Marko via lists.openembedded.=
org
>> wrote:
>> > From: Peter Marko <peter.marko@siemens.com>
>> >
>> > Release information: [1]
>> > Includes fix for CVE-2025-9820.
>> >
>> > Refresh patches.
>> >
>> > [1] https://lists.gnupg.org/pipermail/gnutls-help/2025-November/004906=
.html
>> >
>> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> > ---
>>=20
>> Hi Peter,
>>=20
>> Thanks for your patch.
>>=20
>> It looks like we got some build issues, at least when building native:
>>=20
>> ERROR: gnutls-native-3.8.11-r0 do_compile: Execution of '/srv/pokybuild/=
yocto-
>> worker/qemux86-tc/build/build-st-2982165/tmp/work/x86_64-linux/gnutls-
>> native/3.8.11/temp/run.do_compile.1834094' failed with exit code 1
>> ...
>> | In file included from ../../sources/gnutls-3.8.11/lib/audit.h:22,
>> |                  from ../../sources/gnutls-3.8.11/lib/audit.c:26:
>> | ../../sources/gnutls-3.8.11/lib/crau/crau.h:255:23: error: missing bin=
ary operator
>> before token "("
>> |   255 |     __has_c_attribute (__maybe_unused__)
>> |       |                       ^
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2721
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/builds/2632
>
> Hi Matthieu,
>
> only Debian-11 or more hosts had this problem?
>
> Peter
>

It looks like it is indeed only occurring on debian 11. I've launched
two other builds on other workers, and I can't see the issue so far
(build is still in progress).

https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/2724
https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/builds/2635

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


