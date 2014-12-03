Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id B318265C9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 13:12:53 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id ms9so12311817lab.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 05:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=A2vcPPGtOmAmsFkql4sCBOG2RcMah7KU75PK8RBw6gA=;
	b=YRgUQDGdLODKqgqgE8/0eU+Cd/q/f0CnWvXiMvFIhq0qFpzJJX7LflwPcmlQ0G8fW8
	KrRTDba85ap40qHf8E2G6Kw3m4GVwJQnp27x+YtAet/iCo41M5C6Q0vTarzTPWUTjHM0
	NFSyMRE4PsMLHHTikdq+AmiotvJnG2+sB/lfZbvQabCONIt2tXduVjeZ40VGUqjsDJ+K
	tvvmPoY2Xc9OqFAH2amHTgGbwWfZE7PTFgxVZRjKS0R6OCE9gvuQPdG3IzdJ5Eu7CtYG
	BQLg1C2CYuP4vF1DevxRhyefJgsHhso6OknFH9hk/RXj+qLTYihlQGyUR8t4FsJBM8rF
	9h5A==
MIME-Version: 1.0
X-Received: by 10.152.238.1 with SMTP id vg1mr4216739lac.83.1417612373114;
	Wed, 03 Dec 2014 05:12:53 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Wed, 3 Dec 2014 05:12:53 -0800 (PST)
In-Reply-To: <2558455.kgL2mNBB1h@peggleto-mobl5.ger.corp.intel.com>
References: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
	<CAMKF1srheZyVe5ATST-ToxZQJkXTTNvoh8j+PzrytSVbjVV9wA@mail.gmail.com>
	<542056AF.8080009@windriver.com>
	<2558455.kgL2mNBB1h@peggleto-mobl5.ger.corp.intel.com>
Date: Wed, 3 Dec 2014 08:12:53 -0500
Message-ID: <CADkTA4N1rmZuWrto7vgun-W5oiJiS4hEFs1tpZBNSRdNAPd2xw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] kernel: Enable externalsrc on kernels which instantiate kernel.bbclass
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
X-List-Received-Date: Wed, 03 Dec 2014 13:12:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 3, 2014 at 7:00 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 22 September 2014 13:04:47 Bruce Ashfield wrote:
>> On 14-09-22 01:03 PM, Khem Raj wrote:
>> > On Mon, Sep 22, 2014 at 8:27 AM, Bruce Ashfield
>> >
>> > <bruce.ashfield@windriver.com> wrote:
>> >> But the reports we've been getting have been that externalsrc
>> >> builds are working for kernels, and linux-yocto without the change
>> >> in place, so I'm looking to reduce the patch footprint and re-submit.
>> >
>> > no, it cant work if folks were trying the usecase I have mentioned.
>> > The fix is infact for
>> > non linux-yocto kernels.
>>
>> I'll send out my updated patch shortly, it should fix both cases.
>
> Bruce, did you get around to doing this?
>
> At the moment I am trying to make my workflow tool ("devtool modify") work with
> linux-yocto. I've at least got to the point where I can extract the
> appropriate source from the recipe, but when I use externalsrc to point to it
> and then try to build it, it doesn't even get past do_configure, so something
> must be missing (make complains about missing targets, presumably because it's
> running in ${B} and there's nothing in that directory).

I do have an updated patch that I've been carrying in my tree, but it
still is too
large, with too  many touches to be ready. Finishing it was in my 1.8 tasks, and
I've been working with it as part of my kernel developer changes. I can probably
fire something out by end of week (I haven't tested it in over a week, so it is
likely broken again).

>
> Do you expect linux-yocto + externalsrc to work at the moment in master? If
> so, are there any special steps I need to do with respect to preparing the
> external source tree that my tool might not be performing?

Let me check, and get back to you on that.

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

