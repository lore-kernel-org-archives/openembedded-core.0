Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1AAE6084E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 20:35:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s75KZXX0028334
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Aug 2014 13:35:33 -0700 (PDT)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 5 Aug 2014 13:35:33 -0700
Message-ID: <53E14013.1000301@windriver.com>
Date: Tue, 5 Aug 2014 16:35:31 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1407177403.git.ben.shelton@ni.com>	<78fc1827553729a69ee665bf4ef7e33495d9de0b.1407177403.git.ben.shelton@ni.com>	<53E129D4.3050402@windriver.com>
	<CAP9ODKqt79-1XkYDi01Wn-ZT5f13e4s=BhF08=zj8B==Hcjkpg@mail.gmail.com>
In-Reply-To: <CAP9ODKqt79-1XkYDi01Wn-ZT5f13e4s=BhF08=zj8B==Hcjkpg@mail.gmail.com>
X-Originating-IP: [128.224.56.84]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/20] udev-cache: Compress the cache
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
X-List-Received-Date: Tue, 05 Aug 2014 20:35:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-08-05 04:09 PM, Otavio Salvador wrote:
> On Tue, Aug 5, 2014 at 4:00 PM, Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>> On 14-08-04 02:40 PM, Ben Shelton wrote:
>>>
>>> From: Richard Tollerton <rich.tollerton@ni.com>
>>>
>>> $DEVCACHE is observed to be 100k uncompressed; compressing it reduces
>>> its size to ~5k.
>>>
>>> Natinst-Rally-ID: TA44427
>>> Acked-by: Gratian Crisan <gratian.crisan@ni.com>
>>> Natinst-ReviewBoard-ID: 58620
>>
>>
>>
>> This is a good series of patches; thanks for sending them.
>>
>> It would be nice if you could remove your company's ID tags
>> from the commit log. For example, you create and use could use
>> a YP bugzilla ID ( https://bugzilla.yoctoproject.org/ ) and
>> then match that up in your internal process.
>
> I don't think we should ask for this. I saw several of us to include
> Id tags in past commits (I also did) and I think it is fine. We
> shouldn't ask an extra step for people to be able to track it (open a
> YP bugzilla ID issue for example).
>

Wind River patches used to include a "CQID" tag but we've changed
our process to avoid needing such internal tags. If National
Instruments can do so as well, that'd be best.

I did check my oe-core email list history and this seems like the
first patch from NI that has the tags included so I thought
I'd reply and see if we can get the tags dropped.

Ben, what's the story?

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

