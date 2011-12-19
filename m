Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RcSJg-0001so-LR
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 02:47:00 +0100
Received: by pbcc11 with SMTP id c11so2297161pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 17:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=D7Uemr3b48Im7NFjpfOw4/Ee8884+tjNwNWpR2WMcZM=;
	b=C1yZo+Hoslps94xCsstWNZmXKXnlobIG3hFaBn5Yr/MfggWZRtcpeKC6dMAU1MUx1L
	KS8/2Vx1oAyEF4zLNgNWQPzryFPZaYrzR1d9swWqssg6BV7U7SI2Ezj5RqP6GJRnhJMK
	xrOtD0p/KoaOhecVpFdSwaCLVnGlPBexX9BQo=
MIME-Version: 1.0
Received: by 10.68.73.137 with SMTP id l9mr34955762pbv.97.1324258796918; Sun,
	18 Dec 2011 17:39:56 -0800 (PST)
Received: by 10.143.18.10 with HTTP; Sun, 18 Dec 2011 17:39:56 -0800 (PST)
In-Reply-To: <FB6AAD0F-5F91-48D3-8D02-FCBEC19A4B9E@dominion.thruhere.net>
References: <1324237652-15618-1-git-send-email-dbaryshkov@gmail.com>
	<5C0105D4-44BE-4584-9ED9-36970B91A34C@dominion.thruhere.net>
	<CADkTA4OLwUcM86JbCXDOPXUOb1hH+vvKfShjaAsXP3e9Ek0f=A@mail.gmail.com>
	<FB6AAD0F-5F91-48D3-8D02-FCBEC19A4B9E@dominion.thruhere.net>
Date: Sun, 18 Dec 2011 20:39:56 -0500
Message-ID: <CADkTA4Nx9Z_3iFzd6FbkbwiYANUL6B4BXsW7_4LngeqcED7DRQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kernel.bbclass: move uImage handling to separate task
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
X-List-Received-Date: Mon, 19 Dec 2011 01:47:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Dec 18, 2011 at 4:19 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 18 dec. 2011, om 21:27 heeft Bruce Ashfield het volgende geschreven:
>
>> On Sun, Dec 18, 2011 at 3:13 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>>
>>> Op 18 dec. 2011, om 20:47 heeft Dmitry Eremin-Solenikov het volgende geschreven:
>>>
>>>> As per org.oe.dev and meta-oe's kernel.bbclass move uImage creation to
>>>> separate task from do_deploy. This way the do_install task can also
>>>> benefit from generated uImage.
>>>>
>>>> The only major feature of oe-core's version (not to recreate uImage
>>>> if it exists) is retained in this patch.
>>>
>>> I still don't agree with that behaviour. The in-kernel uImage code is just like the in-kernel defconfigs: useless for people who aren't kernel developers.
>>
>> In that case, shouldn't people doing u-boot development (or other
>> non-kernel developers),
>> be building a uImage via something that isn't in kernel.bbclass ?
>
> I use the kernel.bbclass in meta-oe, that does what I need.

ok. I was just trying to wrap my head around the use case, since I'm missing
something, and that would help me understand what is missing in the in kernel
uImage generation scripts. With that, we could see about getting
changes upstream
to address deficiencies.

Cheers,

Bruce

> -----BEGIN PGP SIGNATURE-----
>
> iEYEARECAAYFAk7uWPsACgkQMkyGM64RGpHe8ACdEdFi1Nh17keaiRxAAWQI3Rh6
> 2CYAoKcYow2t+pnGOlJs7teSNB4IQARn
> =3QuN
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


