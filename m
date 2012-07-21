Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SsczA-0003WR-LL
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 18:56:56 +0200
Received: by qcad10 with SMTP id d10so2509199qca.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2012 09:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RCFdjj6dg6/VOc5meCm9ScP0sHR82504pDmGI1X7Dqo=;
	b=F7WMsRGVrdKlerrgE1FI4asC8kCisMB7DDS1Q6C0yC+Mv5X0MOQilgrbDKEKBfmSfE
	NYoRomgwt7fkLC3YLoXl4hVpO0O7BwxitsrJK/zBSItjuin/PyuixcGUg3PCPGBllRA3
	v1GpxaO+mulu/tzJ4RBxgnnDh5EHZLY3HivP3kCKV1j7aS030ZQ9BFrYiMEKorcWS9uE
	XO2vb/mdk5epreMRZS8+g1F5y5HyTql1YHA9DDkQ8sr27OvTeeHqb1Oa7Y3MgllIvqN8
	vVdxE1SJYvX2FGyJDrRFzAoYhIuClIp40X1Q7VANSp6dXZkrM3Ct2qIQLa1/bhKRAKCS
	ppOg==
MIME-Version: 1.0
Received: by 10.224.203.8 with SMTP id fg8mr16118172qab.38.1342889131498; Sat,
	21 Jul 2012 09:45:31 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Sat, 21 Jul 2012 09:45:31 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207211225460.13670@oneiric>
References: <alpine.DEB.2.02.1207191738300.22542@oneiric>
	<CADkTA4MBfe8uW4k8t-975hixqPCT5Q-_t4wXYh0vKvk7B8W_QA@mail.gmail.com>
	<alpine.DEB.2.02.1207210644110.1819@oneiric>
	<CADkTA4Myz35prigzOekZ7hFxuTUujbMierEf-kyts0-yrXU7eQ@mail.gmail.com>
	<alpine.DEB.2.02.1207211225460.13670@oneiric>
Date: Sat, 21 Jul 2012 12:45:31 -0400
Message-ID: <CADkTA4OQuj4nd8n2zktLz8HJAYLmdDbopoRb==gOc+DW8R_duw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: what are the major phases of do_patch() for the kernel?
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
X-List-Received-Date: Sat, 21 Jul 2012 16:56:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 21, 2012 at 12:34 PM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
> On Sat, 21 Jul 2012, Bruce Ashfield wrote:
> ... snip ...
>
>> Sure ... but I'll point out that you are going into architectural
>> details that are under the covers, and that are written from the
>> point of view of a kernel tree maintainer using the tools, they are
>> not written from the point of view of the casual observer. The
>> moving parts of the tools that can be tweaked, are already brought
>> out out to the recipes (I'll point out again that the bitbake
>> recipes you see are but one binding).
>>
>> So yes, another variation of the document might be useful, but I've
>> (we've), moved these details out from "in front" and instead have
>> focussed on the use cases .. from someone creating a new BSP, or
>> adding a configuration fragment to their build .. i.e. it looks and
>> works just like any other package in the system from the point of
>> view of user manipulations, with the extra functionality available
>> if someone has used them, and finds that their use case doesn't fit
>> the mold (i.e. how many people go an need to modify bitbake when
>> using oe-core? it took me 2 years to need to do that).
>>
>> What is the goal of a class that you'd be trying to do around this ?
>> That makes all the difference in what I'd suggest for options and
>> changes.
>
>   points well taken so let me make a much more innocuous suggestion.
> perhaps the higher-level routines like createme, updateme, and so on
> could have a short comment paragraph or two at the top just
> summarizing what they do, nothing more than that.

Absolutely. Right in the scripts themselves .. a good suggestion, and
I'll do that, it also saves me providing the information in multiple
places (and I can shout, "read the fine script!" .. not likely, but I can
dream :)

>
>   i accept that even that higher level is still "under the covers" but
> for the fun of it, i'm just following along with each (task) step of
> building a yocto kernel, and it would make it *way* easier if i had
> just a basic understanding of what each bitbake task was supposed to
> accomplish.

Yep. And I agree ... this is good, and no harm. My comments aren't
meant to discourage, just direct to something that is useful for you, me
and anyone else following along :)

>
>   most of those utility scripts already have a "usage" routine -- how
> hard would it be to add another few lines of comment as to what the
> script is meant to do?

Not hard .. I'll whip that up.

>
>   anyway, i've whined about this sufficiently, so back to the code...

That means it is my turn! ;)

Cheers,

Bruce

>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


