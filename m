Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id D97EF77D41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 19:12:45 +0000 (UTC)
Received: (qmail 1803 invoked by uid 1003); 30 Mar 2017 19:12:46 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.116.166)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	30 Mar 2017 19:12:46 -0000
To: Denys Dmytriyenko <denis@denix.org>, Marek Vasut <marex@denx.de>
References: <20170327142231.21807-1-marex@denx.de>
	<1490624701.13980.267.camel@linuxfoundation.org>
	<5c037512-7bf1-8a3c-cb76-fda7230781a0@denx.de>
	<20170329215658.GP15664@denix.org>
	<a5b043f0-b0ee-a74b-fd55-4f8d20669cba@denx.de>
	<20170330132447.GU15664@denix.org>
	<a8de81ca-4056-ad2c-4e38-1bd1b4c62315@denx.de>
	<20170330180636.GV15664@denix.org>
From: Philip Balister <philip@balister.org>
Message-ID: <36e2ad5b-466d-b6c1-7c84-1f5b5c1a66c3@balister.org>
Date: Thu, 30 Mar 2017 15:12:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170330180636.GV15664@denix.org>
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Thu, 30 Mar 2017 19:12:46 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 03/30/2017 02:06 PM, Denys Dmytriyenko wrote:
> On Thu, Mar 30, 2017 at 04:12:08PM +0200, Marek Vasut wrote:
>> On 03/30/2017 03:24 PM, Denys Dmytriyenko wrote:
>>> On Thu, Mar 30, 2017 at 10:21:31AM +0200, Marek Vasut wrote:
>>>> On 03/29/2017 11:56 PM, Denys Dmytriyenko wrote:
>>>>> On Mon, Mar 27, 2017 at 04:31:16PM +0200, Marek Vasut wrote:
>>>>>> On 03/27/2017 04:25 PM, Richard Purdie wrote:
>>>>>>> On Mon, 2017-03-27 at 16:22 +0200, Marek Vasut wrote:
>>>>>>>> Upgrade U-Boot to the latest version.
>>>>>>>
>>>>>>> Wrong list and how does this compare to Ovatio's patch?
>>>>>>
>>>>>> I was not CCed on Otavio's patch :(
>>>>>
>>>>> Yeah, me neither, unfortunately - people just ignore maintainers file now.
>>>>>
>>>>> Good thing Ross copied me on the other discussion!
>>>>>
>>>> Which other discussion ? :-(
>>>
>>> http://lists.openembedded.org/pipermail/openembedded-core/2017-March/134682.html
>>>
>> I see. I'm all for updating to 2017.03 , since it fixes the OMAP serial
>> bug too :)
> 
> "Known devil is better than unknown angel"? :)
> 

I've got a machine under development that boots from the 2013.01 recipe
and a bbappend. I don't think it is a problem moving to .03, but I don't
know. I'm not sure how many other BSP's have done the same.

Meanwhile, I understand the desire of others who have work upstreamed in
u-boot they like to use with the next release.

How many u-boot releases are there a year? How do they line up with YP
releases? Should we carry two u-boot versions, similar to what happens
with the kernel?

Philip

