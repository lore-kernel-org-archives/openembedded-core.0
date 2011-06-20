Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QYk3T-0000jG-5t
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 21:22:39 +0200
Received: by yib18 with SMTP id 18so2398093yib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 12:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=USl2qt6QZIpxCMWMZEHn92Xhj1qcEzSQZ6BlOU3OFIQ=;
	b=WJyLzwarHAU/GWA3nqdQ8yENx+K1D0a9nfl6a3S3ymWzGMVIvZNJT0pzPUcQG31KEB
	dSqDq+KbQAbKDggBfiVOJc4bYK0fvEDtaY78kTcECBqrudzTRmpu2vGCAIyG1Pd586o5
	18lpVztL0U+MHy5pOFjrBFOVZp2/D0heONl/g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ra9gMRnq+P3hkaujHuzRqG7ggXOQcgT1L/2svsEeNh6r7YuJ+fSa3wHBnZcv38jR0L
	NiuwwMlLQwGVRgU2P2csMpF6NaUj0n37m5igWEgMjHga/WSKxzr6d2i6VJxrYWiFuO6s
	/FEkiuctQLTsfa5au2o3JvwoJ2ALM859UyU7M=
MIME-Version: 1.0
Received: by 10.90.249.30 with SMTP id w30mr6053530agh.3.1308597545793; Mon,
	20 Jun 2011 12:19:05 -0700 (PDT)
Received: by 10.91.161.1 with HTTP; Mon, 20 Jun 2011 12:19:05 -0700 (PDT)
In-Reply-To: <20110620184433.GA3427@chargestorm.se>
References: <8DD6CF6F-60B5-4DC0-95BC-3E47550A46FB@dominion.thruhere.net>
	<BANLkTimOnk0XvkfEqP25aOWK0_C7swHvzQ@mail.gmail.com>
	<3486EC57-81AC-4105-AC78-2721DF62E4FF@dominion.thruhere.net>
	<BANLkTi=ws6VEaWRBkDZ8-G5MWgRohNS=Kg@mail.gmail.com>
	<419BA759-C865-411F-BE59-060EBDD74258@dominion.thruhere.net>
	<BANLkTikzAUvWedb0Umy3GhwOtWKhZXRSWA@mail.gmail.com>
	<20110620184433.GA3427@chargestorm.se>
Date: Mon, 20 Jun 2011 15:19:05 -0400
Message-ID: <BANLkTikMX0owttHu2hbgpzvbJQcDPFf=4g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Linux 3.0-rcX (was Re: [RFC] qemu* kernel configs)
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
X-List-Received-Date: Mon, 20 Jun 2011 19:22:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jun 20, 2011 at 2:44 PM, Anders Darander <anders@chargestorm.se> wrote:
> * Bruce Ashfield <bruce.ashfield@gmail.com> [110614 17:13]:
>> Thanks for the breakdown, it definitely helps. Now that I've got some
>> 3.0-rcX items done, and recipe renaming behind me, I'll have a look
>> at these and see how best to incorporate the configs.
>
> Just curious, what 3.0-rcX items have you done? Will you submit patches
> for these item soon, or wait for a more complete set?
>
> I'm currently just curious, as I've played a little with 3.0-rcX in my
> sparetime, and I've got a patch series in a local tree that at least
> builds 3.0-rcX (and also removes some of the support for 2.4-kernels).
> I've haven't yet looked into libc-headers, just enough to build the
> 3.0-rcX kernel.

My first focus is (and largely was) getting our qemu* patches and meta
data up and
running on the 3.0 kernel. I've booted most of the qemu variants now, with
qemuppc consuming time to find some missing interrupts at the moment.

That was done from a purely kernel point of view. Setting the version to
2.6.40 was a temporary work around to focus on the kernel items.

I'm now starting into the fallout to the rest of the build and dependent
packages. I'm staying away from 2.4 removal at the moment. So if you've
got some patches to send, I'd be happy to save them, it would save me
some time!

Cheers,

Bruce

>
> However, I've just learned today, that some other project we're using,
> might port their drivers and SW-stack to 3.0-rcX, instead of choosing a
> later 2.6.3x kernel. If they go for that route, I'm interested in
> getting official 3.0-support in OE-core sooner than later...
>
> Regards,
> Anders
>
> --
> Anders Darander
> ChargeStorm AB
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


