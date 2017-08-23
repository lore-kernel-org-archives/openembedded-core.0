Return-Path: <philip@balister.org>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 Aug 2017 21:11:11 UTC
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id C234277811
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 21:11:11 +0000 (UTC)
Received: (qmail 11064 invoked by uid 1003); 23 Aug 2017 21:04:32 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.111.57)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	23 Aug 2017 21:04:32 -0000
To: Randy MacLeod <randy.macleod@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Andre McCurdy <armccurdy@gmail.com>,
	"Huang, Jie (Jackie)" <jackie.huang@windriver.com>
References: <20170822074219.8490-1-jackie.huang@windriver.com>
	<CAJ86T=U1Wp8heeowiTNTwQd9vjmbP6AvSFYe8V8UYuSGQrs7Mw@mail.gmail.com>
	<1503431754.32591.130.camel@linuxfoundation.org>
	<e08e7388-4240-0201-197b-8040d4dfb761@windriver.com>
From: Philip Balister <philip@balister.org>
Message-ID: <d5f6dd10-db72-629a-df50-7e6a644c5967@balister.org>
Date: Wed, 23 Aug 2017 17:04:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e08e7388-4240-0201-197b-8040d4dfb761@windriver.com>
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
X-List-Received-Date: Wed, 23 Aug 2017 21:11:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit

On 08/22/2017 09:26 PM, Randy MacLeod wrote:
> On 2017-08-22 03:55 PM, Richard Purdie wrote:
>> On Tue, 2017-08-22 at 12:51 -0700, Andre McCurdy wrote:
>>> On Tue, Aug 22, 2017 at 12:42 AM,  <jackie.huang@windriver.com>
>>> wrote:
>>>>
>>>> From: Jackie Huang <jackie.huang@windriver.com>
>>>>
>>>> We want to provide python libs by default, and some other
>>>> popular Linux distributions like redhat/fedora does the same.
>>> Has something changed? Is there anything in oe-core or meta-oe which
>>> now needs boost python support enabled?

I'm aware of a package in meta-sdr that will need boost python support.
So there is need for this feature.

Philip

>>
>> Does it even actually build on all arches? >
>> I'm rather behind with patch review right now as people are putting so
>> many patches out there with what seems like minimal testing and
>> expecting me/Ross and the autobuilder to figure out the problems for
>> them.
>>
>> Each time one fails, it blocks the queue with the rest of them in and I
>> have to retest until I get something clean.
>>
>> Testing this change is quite a way down my priority list I'm afraid.
>>
> 
> Maybe this is better done in our distro configuration.
> 
> We're trying to minimize differences with oe-core and
> the boost python support doesn't seem to be much of an
> impact based on looking at logs rather than a having a
> detailed understanding of boost.
> 
> We've had this commit in our local branch since before:
> 
> CommitDate: Wed Dec 21 22:16:31 2016 -0800
> 
>     boost: add python to default PACKAGECONFIG options
> 
>     We want to provide python libs by default, and some other
>     popular Linux distributions like redhat/fedora does the same.
> 
>     (LOCAL REV: NOT UPSTREAM) -- sent to oe-core on 20160930
> 
> so it certainly builds for all qemu* for glibc configurations.
> 
> I'll see if we can add musl builds to our automated builds tonight.
> 
> Jackie,
> 
> Did/Can you build for musl?
> Do you have any idea of the impact of this config on users that are not
> interested in the python interface with boost?
> What's the additional cost in compile time?
> 
> 
> 
> There certainly are a rush of package updates and other changes
> coming in; apologies for the lack of warning and late arrivals.
> Other than doing more testing and explaining what tests were done,
> what else can we do to help?
> 
> 
> ../Randy
> 
> 
>> Cheers,
>>
>> Richard
>>
>>
> 
> 

