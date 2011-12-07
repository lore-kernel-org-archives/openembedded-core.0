Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYKxE-0003kI-Rw
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 18:06:48 +0100
Received: by lahd3 with SMTP id d3so305010lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 08:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=lIYFIkFx3Ts0+GWeBDWsNyhAkJMSCesonkI4E3Poa3U=;
	b=n/jDQGDsL3pJJBz5MJFF22F9Osc63BMHi6g5sJPCcD+U5f2Ch3Kioiu5+dTjc6jyr1
	/DSQaz8PZdjZtTedejUtpBbs9MwkShMvXYkNAwMe0M/O5ZRX4fXpxXGg7bUOwJciu7Bo
	qASLeZ2swe4b9DIWBWVwS5fGZUINmN8BVEgds=
Received: by 10.152.103.51 with SMTP id ft19mr12151251lab.42.1323277199739;
	Wed, 07 Dec 2011 08:59:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 7 Dec 2011 08:59:28 -0800 (PST)
In-Reply-To: <1323182226.19363.5.camel@ted>
References: <cover.1323148566.git.raj.khem@gmail.com>
	<1323182226.19363.5.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Dec 2011 08:59:28 -0800
Message-ID: <CAMKF1sqpGWT3Gb8sXNNGokjEAmL933tF+bJwapp6zJRNho_=yg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Enable cloog/ppl when compiling gcc
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
X-List-Received-Date: Wed, 07 Dec 2011 17:06:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 6, 2011 at 6:37 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2011-12-05 at 21:21 -0800, Khem Raj wrote:
>> This patchset contains
>>
>> Changes to gcc where now it will be compiled with cloog/ppl support
>> and we have corresponding libraries build as -native and -nativesdk
>> recipes
>
> This gives a hit to the build time of the toolchain and I'm not sure
> what benefits its buying us, particularly if we don't enable the
> optimisations that cloog/ppl is used for.

The total compile time of the toolchain is impacted little since now we have to
build these extra packages but they are relatively small. However I think I need
to measure the total compile time as well to make sure it does not
impact gcc's compile
time performance. My intention was to
provide the capability in the compiler/SDK so that someone can utilize it if
he/she wants. e.g. gnuradio folks I am sure will benefit from it

>
> Whilst this looks nice for experimentation, are there documented
> benefits for a system compiled with this?
>

I did not find official documented advantages but there has been several posts
where improvement in performance has been observed. There was a lengthy thread
I found on gentoo where they saw total system performance boost when
they enabled
graphite.

I think it is more of RFC so people can try it out and then we can weigh
in benefits of it in OE context.


