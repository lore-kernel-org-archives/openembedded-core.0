Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C5BD2ECF4
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 21:53:14 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46177.1768859589893584057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 13:53:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 60JLr4B22652652;
	Mon, 19 Jan 2026 15:53:04 -0600
Received: from [192.168.2.106] ([192.168.2.106])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 60JLr3pf000629;
	Mon, 19 Jan 2026 15:53:03 -0600
Message-ID: <a1c69479-0aa9-4d75-89a7-05580263cfbf@kernel.crashing.org>
Date: Mon, 19 Jan 2026 15:53:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] dpkg: Fix ADMINDIR
Content-Language: en-US
To: richard.purdie@linuxfoundation.org, alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <1768683431-5604-1-git-send-email-mark.hatle@kernel.crashing.org>
 <CANNYZj-fAJ4xS2GuHazHeExo7FQduObgdvjXYcq_wShv+sp4mQ@mail.gmail.com>
 <3d99b9245edf44f560cb198e7bb0cb2ed3ce8159.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <3d99b9245edf44f560cb198e7bb0cb2ed3ce8159.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 60JLr4B22652652
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 21:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229636

This has been sent to the upstream dpkg mailing list, and should eventual=
ly=20
appear in the index at "https://lists.debian.org/debian-dpkg/2026/01/mail=
list.html"

--Mark

On 1/19/26 8:38 AM, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2026-01-19 at 13:30 +0100, Alexander Kanavin via lists.openembe=
dded.org wrote:
>> On Sat, 17 Jan 2026 at 21:57, Mark Hatle via lists.openembedded.org
>> <mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:
>>> +Subject: [PATCH] lib/dpkg/options-dirs.c: set_rootfs was not checkin=
g
>>> + environment
>>> +
>>> +The set_rootfs function was using the hardcoded ADMINDIR (define).=C2=
=A0 It
>>> +should be checking the environment, and then falling back to the def=
ine
>>> +if not set.
>>> +
>>> +This matches the behavior in db_dir.c.
>>> +
>>> +Upstream-Status: Pending
>>
>> Please no pending patches without a reason. This should be submitted
>> upstream first.
>=20
> I understand the sentiment however I should mention this is blocking
> pseudo getting updated to resolve several bugs. I did queue and test
> this overnight and can confirm it does fix problems in dpkg once we
> merge the pseudo fixes...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229622): https://lists.openembedded.org/g/openembed=
ded-core/message/229622
> Mute This Topic: https://lists.openembedded.org/mt/117320584/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

