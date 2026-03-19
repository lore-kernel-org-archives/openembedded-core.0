Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A08108E1FC
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 12:03:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9448.1773921778036204471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 05:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Qk1g8Ern;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9A28CC5507B;
	Thu, 19 Mar 2026 12:03:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7BB25FDEB;
	Thu, 19 Mar 2026 12:02:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF34310450700;
	Thu, 19 Mar 2026 13:02:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773921774; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2gQ/1TtXMRAaifZ/pJWZFHWChLq8RgDOEsGo2C/hmtk=;
	b=Qk1g8ErnPDxCxTyvI+M6XXxDw7g9PNZp3xqL1bKesarSHvQ+PI+ZwVCrmYpWA69OnBiU0X
	touO5H0YAFJ6j/qQ9HRZZEm3Kln4TZ4b7zhRCJkvSMR31ynSPBhlYXslpG2xCxHGBYDczt
	KzGdgBK2nd7UTgIwj9uOQTOtSRkQFf6SMxrfRGyo20hT26aK1JSV3a/IjsHR6JGzfYwqpP
	vtILKMe+l95xKgK5refTUdYZimFGQQkGPTCpBb/gsuPxlRAj743tSQXSfw7/10yZsea86j
	gNivVvyCtp6EDu6uXzpw/h/Dg6zwonTfT1zII0fe0xW8wH1si85K+h0bdGkJ7A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 13:02:53 +0100
Message-Id: <DH6QSCE6R82T.2WO56HSJAI76G@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Joshua Watt" <jpewhacker@gmail.com>,
 <openembedded-core@lists.openembedded.org>, "Stefano Tondo"
 <stondo@gmail.com>
Subject: Re: [OE-core][PATCH v7 00/12] Add SPDX 3 Recipe Information
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
 <CAJdd5GZUvWKb37Ys-dNjOShHYb0Gis9wU3Q2WkdA2_m6xoLdhQ@mail.gmail.com>
 <DH6KHVSGCDH0.DZ1GQQ228GWT@bootlin.com>
In-Reply-To: <DH6KHVSGCDH0.DZ1GQQ228GWT@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 12:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233524

On Thu Mar 19, 2026 at 8:07 AM CET, Mathieu Dubois-Briand wrote:
> On Wed Mar 18, 2026 at 2:49 PM CET, Joshua Watt wrote:
>> Mathieu,
>>
>> Here is my latest SPDX patch set (finally!). I'm sorry for the delay
>> and the mix up with Stefano's patches. I believe that you can now
>> stack Stefanos patches on top of mine and everything should be OK
>>
>> Thank you,
>> Joshua
>>
>
> Thanks!
>
> I did apply this series, but got some conflicts. I did try to solve
> them, but I might have solved them wrong.
>
> For reference, the result is here:
>
> https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder.=
yoctoproject.org/valkyrie/a-full-3456
>
> So with this, I've got a few issues. First an error appearing in various
> builds:
>
> ERROR: buildtools-tarball-1.0-r0 do_create_spdx: Could not find a static =
SPDX document named static-buildtools-tarball
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3422
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3405
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3422
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3422
>
> And still some selftest failures:
>
> 2026-03-18 21:56:34,082 - oe-selftest - INFO - runtime_test.TestExport.te=
st_testexport_sdk (subunit.RemotedTestCase)
> 2026-03-18 21:56:34,083 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-03-18 22:25:15,422 - oe-selftest - INFO - spdx.SPDX30Check.test_down=
load_location_defensive_handling (subunit.RemotedTestCase)
> 2026-03-18 22:25:15,422 - oe-selftest - INFO -  ... FAIL
> ...
> 2026-03-18 23:06:54,297 - oe-selftest - INFO - spdx.SPDX30Check.test_vers=
ion_extraction_patterns (subunit.RemotedTestCase)
> 2026-03-18 23:06:54,297 - oe-selftest - INFO -  ... FAIL
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3462
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3568
>
> I will probably launch a build with this series alone a bit later today,
> to distinguish what comes from this series and what comes from the
> combination.
>
> Thank,
> Mathieu

So I did launch some build with this series applied on top of master,
and we basically have the same errors:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3410
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/3389
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3467
The last one is still building right now, but we do see some errors
already.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


