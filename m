Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REqj7-0005LU-JO
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 00:59:41 +0200
Received: by pzk33 with SMTP id 33so2424433pzk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 15:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=0YjiSk9tM4VDUNzDHgDuXBZkqQsQX8E9eibWmcLuNfQ=;
	b=PIoRpsPjGl8/9qPD8RAT3wU3idomcvOfu/YhLR9KpcgHtjo0S1hD7OfetdYoQQ+hRR
	M4V8FMvmxzel4hKjIyq8wRmE5Z3N71PfDV2lZeeCijp0cv9vHuJRmw2988vc/iHp59G8
	it6L2IOMZ/sKX39MXb1LLo+qUMeueft+747MQ=
Received: by 10.68.17.225 with SMTP id r1mr19881253pbd.64.1318632835055; Fri,
	14 Oct 2011 15:53:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 14 Oct 2011 15:53:25 -0700 (PDT)
In-Reply-To: <1318630511.2342.52.camel@ted>
References: <1318603356.2342.20.camel@ted>
	<CAP9ODKod1GCk5gFPq0YkEPb0rZ3NHsD6YBu7cAQVDPLW0PN7xA@mail.gmail.com>
	<1318605925.2342.24.camel@ted> <20111014153034.GL3542@jama.jama.net>
	<1318607759.2342.28.camel@ted> <20111014160553.GM3542@jama.jama.net>
	<1318630511.2342.52.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2011 15:53:25 -0700
Message-ID: <CAMKF1sqw2HbGXke_P8E2BwJJKUOs_YDkf2FFgSgC--CuQAnjXA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-dri: Enable swrast only by default and intel drivers only on IA platform
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
X-List-Received-Date: Fri, 14 Oct 2011 22:59:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 14, 2011 at 3:15 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-10-14 at 18:05 +0200, Martin Jansa wrote:
>> On Fri, Oct 14, 2011 at 04:55:50PM +0100, Richard Purdie wrote:
>> > On Fri, 2011-10-14 at 17:30 +0200, Martin Jansa wrote:
>> > > On Fri, Oct 14, 2011 at 04:25:16PM +0100, Richard Purdie wrote:
>> > > > On Fri, 2011-10-14 at 11:46 -0300, Otavio Salvador wrote:
>> > > > > +1
>> > > > >
>> > > > > Just another thing, I'd prefer to have DRIDRIVERS as ?= so machine can
>> > > > > override it.
>> > > >
>> > > > I really wouldn't recommend overriding this on a per machine basis, it
>> > > > needs to be on a per arch basis. This is because the recipe is not
>> > > > machine specific (nor should it be).
>> > > >
>> > > > Configuration therefore falls to the distro, not machine.
>> > >
>> > > Why not make it machine specific only when machine provides own module
>> > > (like the case with glamo on om-gta02)?
>> > >
>> > > Or recipe cannot change PACKAGE_ARCH in some special cases (like
>> > > $MACHINE in path to some file in SRC_URI) anymore?
>> >
>> > It works just fine but its not nice practise in my opinion for a library
>> > like this and I don't see there is any need in this case. Certainly I
>> > don't see it as something OE-Core should be recommending.
>>
>> So can I send patches adding my glamo.patch to libdrm and mesa-dri so we
>> can add glamo to
>> DRIDRIVERS_armv4t ?
>
> No, what I mean is if the layer containing that machine appends those
> patches for arm in general (or armv4t), you can then enable the dri
> drivers for armv4t in general to.

but there can be more than 1 armv4t machines in different layers.

>
> It means you would have to keep the layer enabled whenever generating
> armv4t feeds but I think that is ok as long as you know about it?
>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


