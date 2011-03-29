Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Q4XC4-00005b-M3
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 13:34:40 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id A6D1216601F5; Tue, 29 Mar 2011 05:32:44 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id B661D16601B1;
	Tue, 29 Mar 2011 05:32:43 -0600 (MDT)
Message-ID: <4D91C35B.50708@mlbassoc.com>
Date: Tue, 29 Mar 2011 05:32:43 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
	<4D90DA4A.3030605@mentor.com>
In-Reply-To: <4D90DA4A.3030605@mentor.com>
Subject: Re: Using meta-toolchain output as prebuilt toolchains
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
X-List-Received-Date: Tue, 29 Mar 2011 11:34:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/28/2011 12:58 PM, Tom Rini wrote:
> On 03/27/2011 04:44 AM, Koen Kooi wrote:
>> Hi,
>>
>> What is the preferred way of 'importing' prebuilt toolchains into OE-core? In oe.dev I can use this: http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/meta/external-toolchain-angstrom.bb to 'import' an angstrom toolchain built with 'bitbake meta-toolchain', but I'm not sure how to do that in OE-core.
>>
>> My actual use case is actually 2 use-cases:
>>
>> 1) Hand people a prebuilt angstrom toolchain and migrate them to OE while keeping the toolchain
>> 2) "Get started in 10 minutes" type of thing, I suspect an sstate mirror might be better.
>>
>> So any suggestions for #2 as well?
>
> sstate is the best way to catch #2 and I know in general there's "look
> at this URI for the file you want" bits.  I haven't yet started kicking
> the tires on sstate as hard as I have for packaged-staging however.

This is the approach I've been working on to pass on to my customers.  The
idea that I can give them a packaged bundle which includes prebuilt tools
is far more attractive than a simple poky (or oe-core plus layers) tree
which involves many hours of building to produce a simple image.

Hopefully, the sstate method will become more stable over time.  The problem
I've had with it recently is that there are so many variables which are used
to decide if the sstate data is valid (see Richard's description on how this
works) that if the smallest thing changes, the whole lot becomes useless :-(
so it's really only valid for a [fairly] static repository.

>
> For #1, I believe external toolchains are to be supported still, but I
> don't know off hand if the recipes still work (but there is both an old
> CSL one as well as a poky toolchain one in meta/recipes-core/meta/).
> Another area on my TODO list...
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


