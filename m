Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAa5E-0002jl-IV
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 05:57:08 +0100
Received: by lbbgi4 with SMTP id gi4so1369863lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 21:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=XBUmv0qxKn97TTU9FWaMitERZwA8IoSwGDaLrdPbcDM=;
	b=ojVgGmvGCLsXCGc1gFjNCpmuCDKAIqF/NLgoAzC9QmI2AqnAAl0aeoKKiLEzHglJjH
	S0Lt6w48snsenDuWlkizFP3/D41AOLqEStMte/fQZ4YHiBYuT93d9tIrQrlUlrFaG8Ru
	pDqR2oEPP60TDS50wK250734Zqkzq9R4BN+DKGT9grshMckfDGdERyX082Z3ql6PgIP2
	LM/sB1bwM4u0oTCoGHibTMX/FaDV523zV7MrHX5jUFRHIXhsqCGa2R1AXbylKJpGPXEu
	LLOJNr3eAEOc4KEgGWVKdw0czxiD+tvk14ANd3nvD55jLUifjPbiwBuXq7+z5JfcQQMG
	HZcw==
Received: by 10.152.127.136 with SMTP id ng8mr4729035lab.16.1332391693946;
	Wed, 21 Mar 2012 21:48:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Wed, 21 Mar 2012 21:47:43 -0700 (PDT)
In-Reply-To: <1332361627.9740.180.camel@ted>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<1332361627.9740.180.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Mar 2012 21:47:43 -0700
Message-ID: <CAMKF1sqvv+x2tf4eT7Y7yf9MYLh4cf+o__kGoL+hup-xnb9q+A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Thu, 22 Mar 2012 04:57:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 21, 2012 at 1:27 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-03-21 at 21:14 +0100, Koen Kooi wrote:
>> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
>>
>> > On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
>> >> * This move will allow the testing of meta-kde for users without meta-openembedded.
>> >>
>> > So what other layers are using giflib?
>> >
>> > Your suggesting that we need to have it in oe-core so people don't need to add the meta-openembedded layer when using meta-kde?
>> >
>> > I am just trying to get more data before making a decision.
>>
>> Let's put everything in oe-core!
>
> Let's try and be constructive ;-).
>
> I think to make a good decision about this we need to understand which
> layers use giflib.
>
> Is this really the only component from meta-oe that meta-kde needs? If
> it is, I think the request is certainly worth thinking about as we do
> want to try and minimise and untangle the dependency spider web if we
> can.
>

I think this library could belong to OE-Core since its a library for GIF images
its currently used by EFL libs. Putting it in OE-Core would be a better thing
IMO since it seems common library

> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


