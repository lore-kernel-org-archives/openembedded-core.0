Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QqVco-0004zf-8Q
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 21:36:34 +0200
Received: by gwb11 with SMTP id 11so1846442gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2011 12:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Zcj4/Mex3mW156zCTHJSGK6TpAgEdxUuTiE6YgCQpwk=;
	b=fcYisDBx3pFd/mdpt2emfxR73bwuY7ELIyx5IeKK65mPIkQJL3Tf3Y0lmq6rHQxvGT
	K83mnDtSrmWB++IY5o4zHXIFQR4JDpBBObD6Hj3v3Y9x6ugYLEeUnApux0VzBi+UzKa8
	dygC301Af4EbI4r+3owZsRYMlk0G2SNHX0ZWM=
Received: by 10.142.254.9 with SMTP id b9mr6110833wfi.347.1312831925036; Mon,
	08 Aug 2011 12:32:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.137 with HTTP; Mon, 8 Aug 2011 12:31:35 -0700 (PDT)
In-Reply-To: <1312831513.14274.234.camel@rex>
References: <F410F4D8-44AB-45D2-9DB5-1122C8F47077@kernel.crashing.org>
	<1312815314.14274.213.camel@rex>
	<3C6E0A52-0FD9-4951-9D39-4B433F76B20D@kernel.crashing.org>
	<1312831513.14274.234.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Aug 2011 12:31:35 -0700
Message-ID: <CAMKF1srLqEUrNwEEo_BCS37BNf7rmw9ucRq74L2dnM8tBtFzRg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to pass or set specific gcc flags?
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
X-List-Received-Date: Mon, 08 Aug 2011 19:36:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 8, 2011 at 12:25 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> I think the 2 toolchains is UGLY and confusing to customers/users.
>> While I understand it from the point of view on how to take steps to
>> get multilib going it doesn't mean we shouldnt start thinking about
>> how to address these issues.
>
> We've been working on multilb for a while and so far its taken some
> significant work by several people to get things working as they are
> now. We really need to spend some some and stabilise and consolidate
> that work so far at this point.
>
> I'm more than happy to think about consolidating the toolchain pieces,
> its on the future ideas list but I don't believe its appropriate right
> now. I'd like the work done so far to work properly before we try
> enhancing it further.
>
> I'd hope that the toolchains are actually pretty hidden from
> customers/users to, I don't think its as ugly as you're making out and
> actually has some benefits.

I think 32bit will be called powerpc-*-*-gcc and 64bit will be powerpc64-*-*-gcc
which is IMO readable. GCC based toolchains have their own idea of
multilib which isnt quite same as OE. So I think current solution is
better. As long as both compilers
are shipped in SDKs it should be fine. But I see the point where if
you have been
shipping single multilibbed toolchains then there will be a change the
way compilers
are invoked.


