Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95A3AC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 17:20:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.13442.1639675245468957852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 09:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.193,
 mailfrom: foss+yocto@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 367AF24000A;
	Thu, 16 Dec 2021 17:20:42 +0000 (UTC)
Date: Thu, 16 Dec 2021 18:20:40 +0100
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org,
 Saul Wold <Saul.Wold@windriver.com>
Subject: =?US-ASCII?Q?Re=3A_=5BOE-core=5D_=5BPATCH_4/4?=
 =?US-ASCII?Q?=5D_core=3A_udev=3A_udev-extrac?=
 =?US-ASCII?Q?onf=3A_rename_mount=2Eblacklist*_to_mount=2Eblocklist=2E*?=
In-Reply-To: <a1fa954d-5f39-3b8f-99b5-4642cac5e9fb@windriver.com>
References: <20211206153511.34838-1-foss+yocto@0leil.net>
 <20211206153511.34838-5-foss+yocto@0leil.net>
 <34cfb0378a0168756a1ce573b11b292618be2aad.camel@linuxfoundation.org>
 <34a9b96c474ffdc50b4e0edfd3e9300cb1b7c443.camel@vaisala.com>
 <a1fa954d-5f39-3b8f-99b5-4642cac5e9fb@windriver.com>
Message-ID: <BD1CAD0E-91C7-46CA-88C5-FBE441826134@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 17:20:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159799

Hi all,

On December 16, 2021 4:03:14 PM GMT+01:00, Saul Wold <Saul=2EWold@windrive=
r=2Ecom> wrote:
>
>
>On 12/8/21 01:57, Eero Aaltonen wrote:
>> On Mon, 2021-12-06 at 23:31 +0000, Richard Purdie via
>> lists=2Eopenembedded=2Eorg wrote:
>>> On Mon, 2021-12-06 at 16:35 +0100, Quentin Schulz wrote:
>>>> blocklist has a more obvious meaning than blacklist and is also not
>>>> an
>>>> issue wrt inclusivity, so let's use that naming instead=2E
>>>
>>> A "blocklist" with a filesystem is unfortunately confusing (a list of
>>> block
>>> numbers on the filesystem?)=2E "ignorelist" or even "ignore-devices"
>>> may be
>>> better? (or skip)
>>=20
>> I offer "denylist"=2E
>>=20
>I have recently added a list of patches and files that have problematic=
=20
>language to the Inclusive Language Wiki [0], this is one of them, I had=
=20
>proposed mount=2Edisallow
>
>So we can see that everyone has a different idea=2E  Once we have an=20
>approved rename, we can revisit this patch=2E
>

I'm lagging behind a bit sorry=2E

I'd suggest to rename mount=2Eblacklist to automount=2Esomething=2E I find=
 it more explicit that just mount with ignore, deny or disallow as "extensi=
on" as suggested before=2E

If I haven't sent a V2 by Saturday, feel free anyone to rework this patch =
if you want as I won't have much time before next year=2E

Cheers,
Quentin

>Thanks
>
>Sau!
>
>[0] https://wiki=2Eyoctoproject=2Eorg/wiki/Inclusive_language#Patch_Files
>
>
>> Cheers,
>> Eero
>>=20
>>=20
>>=20
>>=20
>>=20
>

