Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T3ytz-00015O-71
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 02:34:31 +0200
Received: by eaad12 with SMTP id d12so100350eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 17:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6fngX7rgjzqGOLJfu333+C6Evj7G15eU4SodtcURFIY=;
	b=Ur1KHRGgBZOrIjUioGYdYs8czVlRhASTJ0MIaaiku86gGfZh8P915HounGzNAYeZSY
	JXIlYWh90Bm2gvhlG0nQekpTx/1MgBuhHFP/Ypw1dUZOhNNTReE6cEGTjK+GQ1eBdtre
	6Y703rE8WepRPSFcA0Svy7iPmfQ6qsENF9AaGHfTbwv8BgY18/Tr2rS1YLMRUvqf7WnY
	XbF0ROXe0XLRLNCheLcKw83w6TymWuYhHGAuK9dE8DSdWrM+1e7JVA4x/Ugv9llIcqk+
	fnA7upSZoi4I64HbX5KW8YdoEy/wSa1WZDc5d2oO/TfT5Oaupt0qBVU2Buf6YlIUNEOU
	4gYg==
Received: by 10.14.211.3 with SMTP id v3mr15848768eeo.43.1345594946903; Tue,
	21 Aug 2012 17:22:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 17:21:56 -0700 (PDT)
In-Reply-To: <1345339639.24626.62.camel@x121e.pbcl.net>
References: <CAMKF1srvBZzMTbN-iOqEjitgSjFOK_Cpd0B94HjWm1z7s-0-iQ@mail.gmail.com>
	<1345285875.27428.27.camel@ted>
	<CAMKF1srJ1w94g2rgu8FvZdmHLK-4t=GSj9OtSAncuquK6oNhjw@mail.gmail.com>
	<1345339639.24626.62.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 17:21:56 -0700
Message-ID: <CAMKF1sp5vLaO68jx-wmmrFDaTjbBczSJ3uLf8oAZPwkpmhZr_g@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Replacing chrpath with patchelf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2012 00:34:31 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 18, 2012 at 6:27 PM, Phil Blundell <philb@gnu.org> wrote:
> On Sat, 2012-08-18 at 10:15 -0700, Khem Raj wrote:
>> so I figured. which now means you need to have patchelf on build host
>> preinstalled instead of chrpath.
>
> That'd be a bit of a pain, since (afaict) patchelf is not so widely
> available in host distributions as chrpath.
>
>> you never know. It just lifts this limitation. We ship
>> chrpath-nativesdk as well and people can use it in different ways
>
> I agree that removing the weird and arbitrary-seeming (from the user
> perspective) restriction on rpath length would be a good thing.  But
> it's less clear that swapping a weird restriction that few people will
> ever run into for a requirement to pre-install a relatively obscure host
> binary on all systems is a good tradeoff.

patchelf does have packages for all familiar linux distros but its not in
their default feeds. May be it will be nicer to create one meta
package which installs
all prerequisites not only chrpath/patchelf and maintain that ourselves
this could be nicer since then user only installs

apt-get install make-my-host-compile-oe package on ubuntu and similar
for others.

>
> How about writing a python function, or a trivial standalone program
> (which can be compiled -native without requiring anything other than
> ${BUILD_CC}) to preprocess the binaries before chrpath sees them, or
> indeed just to replace chrpath altogether?  Or, as an alternative, how
> about fixing chrpath to suck less and then just waiting for the improved
> version to trickle down into deployed host distributions?
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


