Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1R6hbA-0002jw-EX
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 13:37:48 +0200
Received: by fxi1 with SMTP id 1so2647187fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 04:32:29 -0700 (PDT)
Received: by 10.223.33.19 with SMTP id f19mr2826250fad.122.1316691149097;
	Thu, 22 Sep 2011 04:32:29 -0700 (PDT)
Received: from [172.20.1.6] (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id w6sm7220802fah.0.2011.09.22.04.32.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Sep 2011 04:32:28 -0700 (PDT)
Message-Id: <08AD80C4-64FE-47E9-ACAD-4E0141007113@dominion.thruhere.net>
From: Koen Kooi <koen@beagleboard.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1316180329.20858.26.camel@ted>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 22 Sep 2011 13:32:16 +0200
References: <1316161201-769-1-git-send-email-koen@dominion.thruhere.net>
	<1316167797.25993.70.camel@ted>
	<20110916101935.GG7445@jama.jama.net>
	<1316170848.25993.71.camel@ted>
	<1316171181.3510.23.camel@phil-desktop>
	<1316180329.20858.26.camel@ted>
X-Mailer: Apple Mail (2.936)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] gstreamer: sync packaging with OE .dev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Sep 2011 11:37:48 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


Op 16 sep 2011, om 15:38 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-09-16 at 12:06 +0100, Phil Blundell wrote:
>> On Fri, 2011-09-16 at 12:00 +0100, Richard Purdie wrote:
>>> On Fri, 2011-09-16 at 12:19 +0200, Martin Jansa wrote:
>>>> On Fri, Sep 16, 2011 at 11:09:49AM +0100, Richard Purdie wrote:
>>>>> On Fri, 2011-09-16 at 10:20 +0200, Koen Kooi wrote:
>>>>>> some text here
>>>>>
>>>>> It took all my restraint to not just reply with:
>>>>> """
>>>>> NAK
>>>>>
>>>>> <insert reason for NAK here, I can't be bothered to type it>
>>>>> """
>>>>>
>>>>> We've been around in a few circles with this. The problem is  
>>>>> that if we
>>>>> apply this patch we have no clue which gst-plugin from the good,  
>>>>> the bad
>>>>> and the ugly provides something you're after to include in an  
>>>>> image.
>>>>> This results in bitbake being pretty clueless about whether a  
>>>>> given
>>>>> build will succeed or not. In general I'm not a fan of having
>>>>> non-deterministic builds as they tend to annoy users.
>>>>>
>>>>> If this position isn't acceptable then we'll probably have to  
>>>>> move to a
>>>>> situation where we list which plugins each of the packages  
>>>>> builds and
>>>>> drop the dyanmic provides. That is a maintenance pain and I  
>>>>> don't take
>>>>> that step lightly but I don't see any other options. I'm open to
>>>>> suggestions though.
>>>>
>>>> Something like:
>>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031739.html
>>>> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/031740.html
>>>> ?
>>>
>>> Yes. I'd probably have written separate .inc files to simplify the
>>> script but I'm thinking along those lines. I'm not particularly  
>>> happy
>>> about it but I don't see many other options.
>>
>> Last time this issue came up we talked about simply merging the - 
>> good,
>> -bad and -base plugins into a single recipe (since there appears to  
>> be
>> no very compelling reason to keep them separate) and just leaving the
>> -ugly ones on their own.  That still seems to me as though it is the
>> best way of making a lot of that complexity just go away.  Then
>> something like Martin's script could be used to figure out the  
>> (mostly
>> static, with a bit of luck) split between -ugly and the rest.
>
> When put like this it doesn't sound so attractive since you need the
> scripts for ugly anyway. Keeping them separate does actually help  
> build
> time at least since the plugins are one of the last things to get  
> built
> and if merged, you also have to merge all the dependencies,  
> compounding
> the build time.

If someone can tell me which solution is preferred I can start working  
on patches :)

regards,

Koen


