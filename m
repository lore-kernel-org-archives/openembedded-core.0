Return-Path: <fntoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6562CC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 14:04:25 +0000 (UTC)
Received: from radex-web.radex.nl (radex-web.radex.nl [178.250.146.7])
 by mx.groups.io with SMTP id smtpd.web08.11330.1648476264613456688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 07:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: gmail.com, ip: 178.250.146.7, mailfrom: fntoth@gmail.com)
Received: from [192.168.1.35] (cust-178-250-146-69.breedbanddelft.nl
 [178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id 430AD2406A;
	Mon, 28 Mar 2022 16:04:23 +0200 (CEST)
Message-ID: <356a07e1-e004-c06f-3943-ba81391dce5f@gmail.com>
Date: Mon, 28 Mar 2022 16:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 1/2] gpg-sign: Add parameters to gpg signature function
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Xavier Berger <xavier.berger@bio-logic.net>,
 Alexander Kanavin <alex@linutronix.de>
References: <20220322211949.7423-1-fntoth@gmail.com>
 <fe0f9ee8-e3d0-1681-af93-fa97019b8a0c@gmail.com>
 <e2b6066a69cf7933b0618a66b7e1b3589ff6da5c.camel@linuxfoundation.org>
 <a338dc08-b564-4f83-9f88-1e7dd1823f6d@gmail.com>
 <6dad87edfe80040678963ca18842a3ddf337e35c.camel@linuxfoundation.org>
 <9c616e34-d31b-dcab-657a-268698d34150@gmail.com>
 <0791e55a-cba3-3d7f-8a17-96b1591454a1@gmail.com>
 <3be0df41af485685253bd0ed79396fd136c210e6.camel@linuxfoundation.org>
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: 
 <3be0df41af485685253bd0ed79396fd136c210e6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 14:04:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163706

Hi,

Op 24-03-2022 om 23:20 schreef Richard Purdie:
> On Thu, 2022-03-24 at 23:11 +0100, Ferry Toth wrote:
>> Op 24-03-2022 om 16:36 schreef Ferry Toth:
>>> Op 24-03-2022 om 13:03 schreef Richard Purdie:
>>>> On Thu, 2022-03-24 at 12:23 +0100, Ferry Toth wrote:
>>>>>> On Wed, 2022-03-23 at 19:34 +0100, Ferry Toth wrote:
>>>>>>> I forgot to add a cover letter, sorry for that. The 2 patches=C2=A0=
 together
>>>>>>> implement DEB repository signing.
>>>>>>> This is necessary since Gatesgarth |apt| (1.8.2) has become more =
strict
>>>>>>> and doesn=E2=80=99t allow unsigned repositories by default.
>>>>>>> It is possible to override this behavior |but||| is more work the=
n to
>>>>>>> enable signed DEB repositories. These patches makes DEB a first c=
lass
>>>>>>> citizen as IPK and RPM.
>>>>>>> Patches have been in use in meta-intel-edison since Gatesgarth, s=
ee
>>>>>>> https://edison-fw.github.io/meta-intel-edison/5.0-Creating-a-deb-
>>>>>>> repository.html\
>>>>>>
<snip>


>>>>>> I think the rpm test is test_testimage_dnf in
>>>>>> meta/lib/oeqa/selftest/cases/runtime_test.py. You'd run it with:
>>>>>> oe-selftest -r runtime_test.TestImage.test_testimage_dnf
>>> I'll have a look.
>>
I got the rpm test to run and with the help of Alexander I can restart=20
that test to complete in about 6 minutes, which is good.

Right now, I have the modified the recipe so the test image is built=20
from deb packages and then runs on qemu.

So next I need the workaround for apt disabled, auto install the gpg key=20
on the testimage, run apt and parse the results.

I'm not really fluent with python, but might be able to get this done.=20
If Alexander would be willing to give me a few pointers if I get stuck?

Let me play with this a few days (evenings) and then I'll post a WIP patc=
h.


>
>
> Cheers,
>
> Richard

