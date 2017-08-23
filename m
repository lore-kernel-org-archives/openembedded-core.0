Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9767271A62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 01:26:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7N1QhI7011318
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Aug 2017 18:26:43 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 18:26:42 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Andre McCurdy
	<armccurdy@gmail.com>, "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
References: <20170822074219.8490-1-jackie.huang@windriver.com>
	<CAJ86T=U1Wp8heeowiTNTwQd9vjmbP6AvSFYe8V8UYuSGQrs7Mw@mail.gmail.com>
	<1503431754.32591.130.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e08e7388-4240-0201-197b-8040d4dfb761@windriver.com>
Date: Tue, 22 Aug 2017 21:26:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503431754.32591.130.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.7]
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost: add python to default PACKAGECONFIG options
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
X-List-Received-Date: Wed, 23 Aug 2017 01:26:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-22 03:55 PM, Richard Purdie wrote:
> On Tue, 2017-08-22 at 12:51 -0700, Andre McCurdy wrote:
>> On Tue, Aug 22, 2017 at 12:42 AM,  <jackie.huang@windriver.com>
>> wrote:
>>>
>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>
>>> We want to provide python libs by default, and some other
>>> popular Linux distributions like redhat/fedora does the same.
>> Has something changed? Is there anything in oe-core or meta-oe which
>> now needs boost python support enabled?
> 
> Does it even actually build on all arches? >
> I'm rather behind with patch review right now as people are putting so
> many patches out there with what seems like minimal testing and
> expecting me/Ross and the autobuilder to figure out the problems for
> them.
> 
> Each time one fails, it blocks the queue with the rest of them in and I
> have to retest until I get something clean.
> 
> Testing this change is quite a way down my priority list I'm afraid.
> 

Maybe this is better done in our distro configuration.

We're trying to minimize differences with oe-core and
the boost python support doesn't seem to be much of an
impact based on looking at logs rather than a having a
detailed understanding of boost.

We've had this commit in our local branch since before:

CommitDate: Wed Dec 21 22:16:31 2016 -0800

     boost: add python to default PACKAGECONFIG options

     We want to provide python libs by default, and some other
     popular Linux distributions like redhat/fedora does the same.

     (LOCAL REV: NOT UPSTREAM) -- sent to oe-core on 20160930

so it certainly builds for all qemu* for glibc configurations.

I'll see if we can add musl builds to our automated builds tonight.

Jackie,

Did/Can you build for musl?
Do you have any idea of the impact of this config on users that are not
interested in the python interface with boost?
What's the additional cost in compile time?



There certainly are a rush of package updates and other changes
coming in; apologies for the lack of warning and late arrivals.
Other than doing more testing and explaining what tests were done,
what else can we do to help?


../Randy


> Cheers,
> 
> Richard
> 
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

