Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T5Nrv-0008Fx-CZ
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 23:26:11 +0200
Received: by daks35 with SMTP id s35so1675998dak.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=P4d9R/Bbuk//Rrh/ccuw2Jb2TGY4OLaJEgM4vTO0zW4=;
	b=CoiPaNFpD4PJ8iGiQxaQTTnrU3o5VaayCCQri1xZzPZLcAz2tddukhh65Zaj3UL9Ph
	pHNRhJvk5WFLbbjtslLEtgn3wDbcEfwd3AbmqEtb8vJwJjBJxE2untyw1AsgvmtqGnKw
	UjQKfA8UKXH1JuD7ECacijOGj351AkawNO6nbeLEJ9dZIWqAPo/7DMGoGJlN4id4HLj5
	c8YpURoUERpzeLHaem5tmJcTjqdWWpPFdeEaTJx7HCmGr020LUNbXZlokZuzujH42fwl
	AjqRnEkiJ7rWCSLKslElxA55VAgLHENLzRZDC66w7RXWe22w1ty+dv1DV72B96gBPEze
	ybdw==
Received: by 10.66.75.97 with SMTP id b1mr19797118paw.15.1345929240823;
	Sat, 25 Aug 2012 14:14:00 -0700 (PDT)
Received: from [192.168.1.67] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id hx9sm11151775pbc.68.2012.08.25.14.13.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Aug 2012 14:13:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1345928435.14369.137.camel@ted>
Date: Sat, 25 Aug 2012 14:14:07 -0700
Message-Id: <4D9F71D8-B4DC-4070-8FD4-E2605855880E@gmail.com>
References: <1345913213.14369.131.camel@ted>
	<CAMKF1sqsvRFa0iC0p4RCaCkQ+swt6E1YiSc5UYXEZT8tBN2FDw@mail.gmail.com>
	<1345928435.14369.137.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1486)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Heads up: xxx-nativesdk -> nativesdk-xxx change
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
X-List-Received-Date: Sat, 25 Aug 2012 21:26:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 25, 2012, at 2:00 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2012-08-25 at 13:25 -0700, Khem Raj wrote:
>> On Sat, Aug 25, 2012 at 9:46 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> As was previous discussed on the list a while ago, we have a problem
>>> with nativesdk where the code is getting complex and convoluted as =
its
>>> simply not possible to automatically "extend" using a suffix.
>>>=20
>>> Extension using a prefix works comparatively well be comparison as =
shown
>>> by the multilib code. Its for this reason I'd like to switch the
>>> meta-toolchain nativesdk recipes to become a prefix rather than a
>>> suffix.
>>>=20
>>> I'm going to propose some patches soon that do this. The patches are
>>> fairly nasty to write and maintain so will need to merge fairly =
quickly.
>>>=20
>>> If anyone does have a strong objection to this change, now is the =
time
>>> to raise it. I'd prefer not to have to do this but having considered =
all
>>> the options, its the best thing to do for the future and will result =
in
>>> cleaner metadata (look at PKGSUFFIX in eglibc for an example of how
>>> messy this gets).
>>=20
>> I think we should then also remove prefixing others too for =
consistency
>>=20
>> its hard enough to get the OE terminology to users for gcc and
>> gcc-cross and gcc-crosssdk and so on and now we are creating an
>> anomaly here. I am ok
>> if call it cross-gcc and crosssdk-gcc and native-gcc and so on. That
>> will make it consistent to prefix everything then
>=20
> This is a cost/benefit thing. nativesdk is pretty crippled at the =
moment
> by this, we can't easily extend it to several recipes without more
> PKGSUFFIX nastiness and it will limit its functionality. We do already
> have precedent with the multilibs.
>=20
> On the plus side, nativesdk doesn't feature strongly in most OE user
> experience, the documentation and its not massively engrained in the
> code base.
>=20
> Equally, you could change -cross as those recipes are corner cases,
> there are not many of them.
>=20
> For native things are *very* different. There is no PACKAGES problem
> there, we actively want to keep the numbers of recipes low, there is a
> higher volume of -native references in the documentation and the
> userbase is exposed to the naming. There are many -native recipes in
> other trees out there. So I'm afraid my view is that -native is simply
> not worth the pain.
>=20
> If we make an invasive change, I'm ok with that *if* we have good =
reason
> for it. We have that with -nativesdk, we don't for -native IMO.
>=20

I am experiencing teaching new folks OE tricks and one day they might be =
OE contributors
and believe me it does not help if we have inconstancies, its hard =
enough and this doesn't make it easier.

Since multilib is something not of interest it hasn't appeared so =
strongly in my case however it was easy
to say you extend recipes and by appending to their name its easier to =
change to prepend but some append
some prepend I don't know personally I know it enough that I can deal =
with it but for new folks its another
thing to learn.

> Cheers,
>=20
> Richard
>=20
>=20
>=20



