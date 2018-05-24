Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1BC7475A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 00:06:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4O06wE2020722
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 May 2018 17:06:58 -0700 (PDT)
Received: from [128.224.21.23] (128.224.21.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 May 2018 17:06:18 -0700
To: Andre McCurdy <armccurdy@gmail.com>, Randy MacLeod
	<randy.macleod@windriver.com>
References: <20180519162102.GL19965@denix.org>
	<CAMKF1srt3AbRBgdBZp2ya-VkWm1K6r8eywFbqr3nMFe7EqNuFw@mail.gmail.com>
	<20180519193341.GM19965@denix.org>
	<CAMKF1sqfpZhKJKjFoouGhpRbZEfJBqXJxmqunepAx2weVsQEnA@mail.gmail.com>
	<20180520005742.GN19965@denix.org>
	<e718c04f-fbe8-4235-aae7-1c2a335498b4@gmail.com>
	<e4c12866-e26b-c7b0-e70a-e0c4c6ebefb3@windriver.com>
	<CAJ86T=WdrLA322wwwSNhCJ1f=rKsr3pnzE5t1p3Kn2t4wmgP1A@mail.gmail.com>
	<0893459e-7525-8f5c-47d5-b0b8fc749de4@windriver.com>
	<CAJ86T=WF5xQTs4Vj4NROnPq+tdOeEZhAb_L=WyHPo5gJ996Hmw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <bc14a60c-0649-1d30-9485-96cc4be939c5@windriver.com>
Date: Wed, 23 May 2018 20:06:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WF5xQTs4Vj4NROnPq+tdOeEZhAb_L=WyHPo5gJ996Hmw@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: GCC 9 Drops Support For Older ARM Microarchitecture Versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 May 2018 00:06:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/23/2018 05:59 PM, Andre McCurdy wrote:
> On Wed, May 23, 2018 at 2:40 PM, Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 05/23/2018 05:01 PM, Andre McCurdy wrote:
>>>
>>> If/when we update the CPU used in the oe-core qemu ARM machine, I vote
>>> we continue to just call it "qemuarm".
>>
>> That would surprise me as a user of qemuarm so my vote is to change the
>> name unless there's precedent to support your vote.
> 
> I think we've updated the CPU used by qemux86 a few times (and with
> kvm doesn't it even change depending on the host?).

Correct. There's no requirement to update the board emulation just
to tweak the cpu ISA.

The qemuarma9 board has some gaps with respect to the old versatile926ejs.
So unless the cpu update doesn't work, I'm all for leaving the
board the same but just changing the cpu.

Bruce

> 


