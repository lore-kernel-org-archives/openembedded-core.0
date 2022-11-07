Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E4BC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 00:20:37 +0000 (UTC)
Received: from smtp2.emailarray.com (smtp2.emailarray.com [69.28.212.198])
 by mx.groups.io with SMTP id smtpd.web11.4788.1667780433225897847
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 16:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: balister.org, ip: 69.28.212.198, mailfrom: philip@balister.org)
Received: (qmail 51832 invoked by uid 89); 7 Nov 2022 00:20:28 -0000
Received: from unknown (HELO ?192.168.1.21?) (cGhpbGlwQGJhbGlzdGVyLm9yZ0AxOTIuMTE5LjM0LjIxNA==) (POLARISLOCAL)  
  by smtp2.emailarray.com with SMTP; 7 Nov 2022 00:20:28 -0000
Message-ID: <acc9833f-0f2e-0a56-5b1a-a5ceff309e24@balister.org>
Date: Sun, 6 Nov 2022 17:14:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [OE-core] Dunfell toolchain update analysis
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
 Randy MacLeod <randy.macleod@windriver.com>
Cc: "Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <4af9fc74-3b02-57ca-7aa1-d02a90f0f621@windriver.com>
 <CAOSpxdYo-5pvq632UZoxSyD5+sHQJcZYfwA0L3w1FauFm_fXHA@mail.gmail.com>
From: Philip Balister <philip@balister.org>
In-Reply-To: <CAOSpxdYo-5pvq632UZoxSyD5+sHQJcZYfwA0L3w1FauFm_fXHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 00:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172817

On 11/2/22 09:00, Steve Sakoman wrote:
> On Wed, Nov 2, 2022 at 2:24 AM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>>
>> Thanks for the info I requested Sundeep.
>>
>>
>> Steve or anyone using dunfell,
>>
>> Do you have any concerns with the updates shown below?
> 
> The glibc and binutils updates seem fine.  The gcc update(s) concern
> me a little bit, but we can test and see if any issues arise.

The release notes for gcc might concern me if I was trying for super 
stable .... But, we created some gcc-9.5 recipes and found they fixed a 
segfault in the fftw QA which offset any concern we had. I'd love to see 
gcc updated in Dunfel, but if it isn't I plan to create a layer that 
will overlay the newer gcc in Dunfell to resolve the fftw issue (with 32 
arm+neon)

Philip

> 
> Steve
> 
>> Hello Randy,
>>
>> I checked the Dunfell branch for gcc, glibc & binutils updates.
>>
>> gcc-9.3 is currently used in Dunfell and gcc-9.5 was released by gcc.
>> glibc-2.31 is used by Dunfell and latest commits in this branch are listed in attached file 'glibc.log'
>> binutils-2.34 is used by Dunfell and latest commits in this branch are listed in attached file 'binutils-gdb.log'
>>
>> Can I update all these 3 modules as mentioned above?
>>
>>
>> Thanks,
>> Sundeep K.
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172591): https://lists.openembedded.org/g/openembedded-core/message/172591
>> Mute This Topic: https://lists.openembedded.org/mt/94732697/384425
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [philip@balister.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

