Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 639AF60620
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 04:29:14 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id ED43268A01C; Fri, 16 Sep 2016 05:29:13 +0100 (BST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=ALL_TRUSTED,BAYES_50,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 5546F68A019;
	Fri, 16 Sep 2016 05:29:13 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 06D7A67402C1;
	Fri, 16 Sep 2016 06:29:13 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
	<6144111.OaLyj9AJNZ@peggleto-mobl.ger.corp.intel.com>
	<1473976307.7207.151.camel@linuxfoundation.org>
	<1517439.eAOeRX8ZQL@peggleto-mobl.ger.corp.intel.com>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <a6f6bf4f-9024-1ddc-c12a-ae3a83f68252@mlbassoc.com>
Date: Fri, 16 Sep 2016 06:29:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1517439.eAOeRX8ZQL@peggleto-mobl.ger.corp.intel.com>
Subject: Re: Crazy display
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
X-List-Received-Date: Fri, 16 Sep 2016 04:29:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-16 00:00, Paul Eggleton wrote:
> On Thu, 15 Sep 2016 22:51:47 Richard Purdie wrote:
>> On Fri, 2016-09-16 at 08:41 +1200, Paul Eggleton wrote:
>>> On Thu, 15 Sep 2016 22:26:09 Gary Thomas wrote:
>>>> On 2016-09-15 22:12, Burton, Ross wrote:
>>>>> On 15 September 2016 at 21:03, Paul Eggleton
>>>
>>> <paul.eggleton@linux.intel.com <mailto:paul.eggleton@linux.intel.com>
>>>
>>>> wrote:
>>>>>     Are you guys perhaps using the same terminal application?
>>>>> Using screen
>>>>>     / tmux / anything similar? (I'm using screen here and haven't
>>>>>     experienced problems though.)
>>>>>
>>>>> I'm using iTerm2 on a Mac to run normal SSH to my Linux box. No
>>>>> screen/tmux/etc.
>>>>
>>>> Pretty much the same for me - just SSH in an xterm window.
>>>
>>> Hmm, I'm still no closer then.
>>>
>>> Does it just start happening at some point in the middle of a build?
>>> Or right
>>> from the start?
>>
>> Seems to happen at various points during the build. Looks like bad
>> timing of console updates so can happen at any point, I'd see evidence
>> its happened multiple times in a given build.
>
> This is bizarre. Clearly something is different between your systems and mine
> :/

I've only seen it when my build machine was quite busy (yesterday
when I first noticed, I had three builds going at once)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

