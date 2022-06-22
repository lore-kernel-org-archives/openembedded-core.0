Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B42EC433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 14:31:03 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web09.8180.1655908253139632288
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 07:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id 5F4551D44E;
	Wed, 22 Jun 2022 16:30:51 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.39.186]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o41NX-0giu7l0; Wed, 22 Jun 2022 16:30:47 +0200
Message-ID: <e341f6f6-521e-c9fc-b37d-4ed58da80d18@t-online.de>
Date: Wed, 22 Jun 2022 16:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [oecore][PATCH] bc: add missing bison-native dependency
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220618175258.4655-1-f_l_k@t-online.de>
 <d0bd217004d6ff8fb860cd61eb23c6eab1ee39c3.camel@linuxfoundation.org>
 <699d5f83-7e9c-41b9-d39c-84fec7101e6d@t-online.de>
 <783ec1df1c79c897dc8d8852413c056732911c57.camel@linuxfoundation.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <783ec1df1c79c897dc8d8852413c056732911c57.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TOI-EXPURGATEID: 150726::1655908247-0143C329-619A1243/0/0 CLEAN NORMAL
X-TOI-MSGID: 96a5cb35-713a-46cf-9dd8-24e462068e42
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 14:31:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167240


Am 22.06.22 um 15:29 schrieb Richard Purdie:
>> The problem occurred after I updated the oe-core master and started an
>> image rebuild. Built the=C2=A0 image successfully for intel and aarch6=
4 but
>> got the above error for raspberrypi4.I ran 'bitbake -c cleansstate
>> bc-native bc' but the problem persisted and I added bison-native and w=
as
>> able to continue. I never had this problem before, and after checking
>> again, I can say that I don't have it anymore either. My image can be
>> created again even without bison-native dependency.
>>
>> I didn't do any patching on bc and also didn't change its configuratio=
n.
> Do you have the logs from the failed build? I'm wondering if there is
> some clue in there about what it wanted to rebuild that needed bison?
>
> I'm reluctant to take this change without understanding what went
> wrong...
>
> Cheers,
>
> Richard

Unfortunately, I no longer have a build log of the error and cannot=20
reproduce it, so I think you are right to be reluctant.

Markus


