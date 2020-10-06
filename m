Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web12.850.1602002918593509624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.9, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4C5NhC1DmZz1qsZw;
	Tue,  6 Oct 2020 18:48:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4C5NhC0NtNz1qyXR;
	Tue,  6 Oct 2020 18:48:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id pHaBS9XB_oh6; Tue,  6 Oct 2020 18:48:25 +0200 (CEST)
X-Auth-Info: 3osbuMXoh8nSDjA5Iag4CeChY24u+nUsIcQClxPUS5U=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  6 Oct 2020 18:48:25 +0200 (CEST)
Subject: Re: [OE-core] [PATCH 1/3] [dunfell] lttng-modules: update to 2.11.6
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20201006121105.94671-1-marex@denx.de>
 <CAOSpxdbTC-Y9=tJe=gPo8dW=0tMnmD+VdDf2B=sfW38L=obSRQ@mail.gmail.com>
 <CADkTA4N7tPU4cvG0LiyCaWW1ATZPo7YQs=mdk13evXtrzwr-zQ@mail.gmail.com>
 <CAOSpxdYJss9x9axm4E_JMtgCS+Kwpx_F-iiHfn=o24do0g2YKQ@mail.gmail.com>
 <CADkTA4Mb6hD=S-zC8qq=EQaku4FGHLxFpgjk4dJMfyj=X7=pkA@mail.gmail.com>
From: "Marek Vasut" <marex@denx.de>
Message-ID: <91e475ca-7e2a-e837-bc49-bf10935c3fa6@denx.de>
Date: Tue, 6 Oct 2020 18:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Mb6hD=S-zC8qq=EQaku4FGHLxFpgjk4dJMfyj=X7=pkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/6/20 6:44 PM, Bruce Ashfield wrote:
> On Tue, Oct 6, 2020 at 12:42 PM Steve Sakoman <steve@sakoman.com> wrote:
>>
>> On Tue, Oct 6, 2020 at 6:39 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>>
>>> On Tue, Oct 6, 2020 at 12:30 PM Steve Sakoman <steve@sakoman.com> wrote:
>>>>
>>>> On Tue, Oct 6, 2020 at 2:11 AM Marek Vasut <marex@denx.de> wrote:
>>>>>
>>>>> Update to latest available.
>>>>
>>>> Have you tested these patches with kernel versions 5.4.62+ ?
>>>>
>>>> IIRC, Bruce said that the 2.11.x tree did not have the necessary
>>>> patches to build with recent 5.4 kernels.
>>>>
>>>
>>> Since I did that backport to keep us moving, the lttng project has
>>> added commits to the 2.11.x branch.
>>>
>>> I see changes to the right files in the commits, so it should be good
>>> with this update, but I haven't tested it myself.
>>
>> Thanks for the quick response.  Given that info I'll pull in these
>> patches and start testing.
> 
> That being said. I'd expect that we should drop the backport that I
> did, but I don't see that in this commit. So that is worth checking
> into ..

I ran into the build issue with 5.4.69, so that's how these patches came
to be. It could be that I didn't build the tools and ust if they are not
built as part of the "standard" build run.
