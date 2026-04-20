Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE01F5580E
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 10:51:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16493.1776682280777077969
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 03:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=D0uP/Xru;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 889854E42A68
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 10:51:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 44B035FFA5
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 10:51:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 693C910460CD0
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 12:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776682277; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=vgsII9fwf++KltgTmCW9poqm0Y/STkoG+bq5fJGTJFY=;
	b=D0uP/XruVXczwFvEGLEcx+Jxfho9fYtD7ABBZ4e44uyhbPIEdKUOUprXr4o0J01wq1C4t6
	+QfqgfYtIy/kn5OwSf12h8lQEETPW+67xTrMXxyHs4awipTEvGqkqzSh4WfXVdgTSVOTN7
	hDzdiOCWNzd+qNhDOfWYdjlJMpI/BPb1ajq77d8Zgz9SRWnW5YeSM+QdKXBiB3CR6qXfTa
	EEmOyQsi4Rv21i8ZALVGepYjEChaH7nC2oKX39S6Ao4viRgOzvtrN+TdRi9qwszYCxIsnq
	KEmNRyjJBAHld7Fheyp15yTJ9l3JstH9lNZjN0x0i95tTZe/J3Ka2llyhmM8PA==
Message-ID: <44c2174a-52ea-4f1f-ab73-d7a0b02a79ef@bootlin.com>
Date: Mon, 20 Apr 2026 12:51:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 00/11] Patch review
To: openembedded-core@lists.openembedded.org
References: <cover.1774824253.git.yoann.congal@smile.fr>
 <af76f008-c484-450f-8c6a-955d4957a173@bootlin.com>
 <DHXVDYUX6BAD.3KI382BFGEHD@smile.fr>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DHXVDYUX6BAD.3KI382BFGEHD@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 10:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235562

Hello,

On 4/20/26 11:21, Yoann Congal via lists.openembedded.org wrote:
> On Mon Apr 20, 2026 at 10:44 AM CEST, Joao Marcos Costa wrote:
>> Hello, Yoan
>>
>>
>> On 3/30/26 00:46, Yoann Congal via lists.openembedded.org wrote:
>>> Please review this set of changes for scarthgap and have comments bac=
k by
>>> end of day Tuesday, March 31.
>> (...)
>>
>> Was the commit below not picked, or am I missing something?
>>
>> commit b24d5cda19136fb8120154279eedd55d162b4640
>> Author: Jo=C3=A3o Marcos Costa (Schneider Electric)
>> <joaomarcos.costa@bootlin.com>
>> Date:   Fri Apr 3 11:32:30 2026 +0200
>>
>>       linux-yocto/6.6: update CVE exclusions (6.6.123)
>>
>>       This new version of cve-exclusion_6.6.inc was generated with oe-=
core's
>>       latest version of the generate-cve-exclusions.py.
>>
>>       Regarding the database used and how this file was generated:
>>
>>       Generated at 2026-04-03 09:30:32.247568+00:00 for kernel version
>> 6.6.123
>>       From cvelistV5 cve_2026-04-03_0700Z
>>
>>       The backporting of the generate-cve-exclusions.py script from ma=
ster to
>>       Scarthgap is handled in a different patch.
>>
>>       Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric)
>> <joaomarcos.costa@bootlin.com>
>>
>> However, I see the commit below, prior to this one, was kept:
>>
>> linux/generate-cve-exclusions: backport script from master branch
>>
>> I'm not really used to the backports schedule/workflow, so please excu=
se
>> me if I misinterpreted something.
>>
>> Thanks!
>=20
> This patch triggered a problem in our infra. I received it directly fro=
m
> you but it is missing from lore. And lore feeds patchwork, and I use
> patchwork to prepare my review branch...
>=20
> This is a known problem: 16167 =E2=80=93 Missing (big) patch in patchwo=
rk
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16167
>=20
> I've reopened and added your patch to the bug log.
>=20
> I will now integrate your patch in my review branch.
>=20
> Thanks for the report, otherwise I would have missed it.
>=20
> I'll try to check for this issue in the future but this will be hard to
> spot. If you send a similar patch in the future don't hesitate to ping
> me if you see it missing during the patch review period.
>=20
> Regards,

Ack. Thanks!


--=20
Best regards,
Jo=C3=A3o Marcos Costa

