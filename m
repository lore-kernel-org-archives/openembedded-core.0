Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF72CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:33:01 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.731.1758641571788203904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 08:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 58NFWoFT693052
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 10:32:50 -0500
Received: from [192.168.2.99] ([192.168.2.99])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 58NFWoBo032642
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 10:32:50 -0500
Message-ID: <5c11152e-9e32-4e1e-83d6-3c51f7cfd51d@kernel.crashing.org>
Date: Tue, 23 Sep 2025 10:32:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] pseudo FTBFS on 32-bit arm{el,hf} on Debian
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 58NFWoFT693052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223895

What was the last version of pseudo (commit id) that worked, and what is =
the=20
version (commit id) that you tried that failed?

I need to look at what has changed in the middle to understand if there i=
s=20
anything we can do about this.

On 9/23/25 2:23 AM, Andrej Shadura via lists.openembedded.org wrote:
> Hello,
>=20
> pseudo no longer buildable on armel and armhf in Debian, as well as on
> other non-i386 32-bit architectures. The common thing they share is tha=
t
> they have all switched to 64 time recently.
>=20
>>      pseudo_db.o pseudo_tables.o pseudo_util.o -Wl,-z,relro -lsqlite3 =
-lpthread -ldl -lpthread
>> {standard input}: Assembler messages:
>> {standard input}:26700: Error: symbol `open64' is already defined
>> {standard input}:27909: Error: symbol `openat64' is already defined
>> {standard input}:38225: Error: symbol `__openat64_2' is already define=
d
>> {standard input}:49933: Error: symbol `creat64' is already defined
>> {standard input}:59933: Error: symbol `__fcntl_time64' is already defi=
ned
>> {standard input}:63000: Error: symbol `fopen64' is already defined
>> {standard input}:64806: Error: symbol `freopen64' is already defined
>> {standard input}:66053: Error: symbol `__fstat64_time64' is already de=
fined
>> {standard input}:67392: Error: symbol `__fstatat64_time64' is already =
defined
>> {standard input}:69921: Error: symbol `__ftw64_time64' is already defi=
ned
>> {standard input}:78178: Error: symbol `__glob64_time64' is already def=
ined
>> {standard input}:85034: Error: symbol `__lstat64_time64' is already de=
fined
>> {standard input}:93605: Error: symbol `mkostemp64' is already defined
>> {standard input}:95360: Error: symbol `mkstemp64' is already defined
>> {standard input}:98362: Error: symbol `__nftw64_time64' is already def=
ined
>> {standard input}:104764: Error: symbol `scandir64' is already defined
>> {standard input}:123344: Error: symbol `__stat64_time64' is already de=
fined
>> {standard input}:130262: Error: symbol `truncate64' is already defined
>> make[1]: *** [Makefile:157: pseudo_wrappers.o] Error 1
>=20
> Unfortunately, I don=E2=80=99t know how to make pseudo compatible with =
such a
> setup. Any hints?
>=20
> Thanks in advance.
>=20
> P.S. You can find more logs at <https://bugs.debian.org/1069487>.
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223867): https://lists.openembedded.org/g/openembed=
ded-core/message/223867
> Mute This Topic: https://lists.openembedded.org/mt/115390427/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

