Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 2981A6DB40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 17:37:11 +0000 (UTC)
Received: (qmail 31070 invoked by uid 1003); 25 Mar 2014 17:37:11 -0000
Received: from unknown (HELO ?10.16.32.157?)
	(philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	25 Mar 2014 17:37:11 -0000
Message-ID: <5331BEC6.2000904@balister.org>
Date: Tue, 25 Mar 2014 10:37:10 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
References: <1395676843.24890.7.camel@ted> <5331935A.6060009@enea.com>
In-Reply-To: <5331935A.6060009@enea.com>
X-Enigmail-Version: 1.6
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Features in Yocto Project 1.7
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
X-List-Received-Date: Tue, 25 Mar 2014 17:37:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 03/25/2014 07:31 AM, David Nyström wrote:
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

Can we update the OEDAM web page with some of these ideas:

http://openembedded.org/wiki/OEDAM

Discussion should continue on the list, but we have an agenda item to
talk about the next release and this would be a good time to review the
ideas raised in the this thread. I put in a placeholder with the link to
Otavio's email. (And I really like his thoughts)

Philip


> 
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

