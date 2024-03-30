Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25229CD1283
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 01:04:24 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.5962.1711760660343544802
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 18:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org ([70.99.78.136])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 42U13D8X014060;
	Fri, 29 Mar 2024 20:03:14 -0500
Received: from [192.168.3.155] (192-168-3-155.newulmtel.net [192.168.3.155] (may be forged))
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 42U13BlA027198;
	Fri, 29 Mar 2024 20:03:11 -0500
Message-ID: <36b1d7d1-c1ea-4d1a-b7a7-27ff550cdcc7@kernel.crashing.org>
Date: Fri, 29 Mar 2024 20:03:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 36/36] xz: upgrade 5.4.6 -> 5.6.1 _WARNING_
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>, wangmy@fujitsu.com,
        openembedded-core@lists.openembedded.org
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
 <1710313714-12541-36-git-send-email-wangmy@fujitsu.com>
 <2d88c7fc227e44acf14470103dadd92e026b62f9.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <2d88c7fc227e44acf14470103dadd92e026b62f9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 42U13D8X014060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 01:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197643

I know this request is a week or so old..

But do NOT upgrade to 'xz' 5.6.0 or 5.6.1.  It has been compromised:

https://www.openwall.com/lists/oss-security/2024/03/29/4

--Mark

On 3/14/24 8:40 AM, Richard Purdie wrote:
> On Wed, 2024-03-13 at 15:08 +0800, wangmy via lists.openembedded.org
> wrote:
>> From: Wang Mingyu <wangmy@fujitsu.com>
>>
>> License-Update:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> *COPYING:
>>  =C2=A0Add the license for the XZ logo.
>>  =C2=A0Change most public domain parts to 0BSD.
>>  =C2=A0Update COPYING about the man pages of the scripts.
>> *getopt.c
>>  =C2=A0MSVC: Don't #include <unistd.h>.
>>  =C2=A0lib/getopt*.c: Include <config.h> only HAVE_CONFIG_H is defined.
>>  =C2=A0lib: Update getopt.c from Gnulib with modifications.
>>  =C2=A0lib: Silence -Wsign-conversion in getopt.c.
>>  =C2=A0Add SPDX license identifiers to GPL, LGPL, and FSFULLR files.
>>
>> Changelog:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> * liblzma: Fixed two bugs relating to GNU indirect function (IFUNC)
>>  =C2=A0 with GCC.
>> * xz: Changed the messages for thread reduction due to memory
>>  =C2=A0 constraints to only appear under the highest verbosity level.
>> * Build:
>>  =C2=A0=C2=A0=C2=A0 - Fixed a build issue when the header file <linux/=
landlock.h>
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 was present on the system but the Land=
lock system calls were
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not defined in <sys/syscall.h>.
>>  =C2=A0=C2=A0=C2=A0 - The CMake build now warns and disables NLS if bo=
th gettext
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tools and pre-created .gmo files are m=
issing. Previously,
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 this caused the CMake build to fail.
>> * Minor improvements to man pages.
>> * Minor improvements to tests.
>=20
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/8737
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197107): https://lists.openembedded.org/g/openembed=
ded-core/message/197107
> Mute This Topic: https://lists.openembedded.org/mt/104900983/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

