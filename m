Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD466F595
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 15:16:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2PFGMql020692
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 08:16:22 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Tue, 25 Mar 2014 08:16:22 -0700
Message-ID: <53319DC5.8050503@windriver.com>
Date: Tue, 25 Mar 2014 10:16:21 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1395676843.24890.7.camel@ted> <5331935A.6060009@enea.com>
In-Reply-To: <5331935A.6060009@enea.com>
Subject: Re: Features in Yocto Project 1.7
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
X-List-Received-Date: Tue, 25 Mar 2014 15:16:22 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 3/25/14, 9:31 AM, David Nyström wrote:
> On 2014-03-24 17:00, Richard Purdie wrote:
>> As development on 1.6 finishes up, its time to think about what we
>> should be doing in the 1.7 cycle.
>>
>> I think from my perspective, in 1.7 I'd like to see us looking at
>> "Developer Workflow". Its a generic topic which I think covered multiple
>> areas (in no particular order):
>>
>> * the ADT/SDK and how it intergrates into the rest of the system
>
>> * toaster
>> * python devshell
>> * exteralsrc.bbclass
>> * memory resident bitbake
>> * how a standalone app developer might build an image
>
> +1
> My wishlist:
>
> 1. Assembly of an image from a package repository using the SDK.
> 2. Ability to easily package multiple kernel flavours(builds with
> different kernel configs) with linux related bbclass:es.

I agree.. generating images, SDKs or other consumables from package feeds is 
high on my wish list as well.

I think we've finally gotten to the point where WIC, rootfs generation and other 
pieces are in place to help do an implementation of this.

--Mark

> Br,
> David
>
>
>> * locked sstate
>>
>> and probably more I'm forgetting.
>>
>> If anyone does have things they plan to work on, or ideas for things
>> that should be worked on, please do file enhancement requests in the
>> bugzilla:
>>
>> https://bugzilla.yoctoproject.org/
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>


