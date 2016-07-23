Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 188466072C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jul 2016 01:28:45 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id cf3so7700603pad.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 18:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=WeFpWoVT0KJ3AAZt+DFb8tPOf9cXydlBlLaSCpCV2hY=;
	b=R2HG2ENt2szsqK40YfvhrrIDguY/WI2oAMSv8NzO5yXSts0o0fBiQzmVtLMJsn1RpE
	EVZDcC5w9pBbYSV7Zh8qeBP1DJKwSCXJ94yCM6uIGEhy7S8sijaZuHz14BTNzFBU8rA3
	EmNx/v3jF70XeKa+oyvW5X6ZGr7RwMn1uog+it+kLuyYGCzO6PPdidmXvL64AHRrcKPw
	1A0g8IQgL3c4MCjO6D0hEmHxXW0LJ38b7EAdfEdSsVD/f6xNirKYCoD2LWyx5HR00iOJ
	AWTD39HvwC7ockWm7lPThJZiqD05rHauW+ASMECOyVns0Px7z0Rc6ouk9AZ+7Z/0G3Mb
	9JOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=WeFpWoVT0KJ3AAZt+DFb8tPOf9cXydlBlLaSCpCV2hY=;
	b=M4SDX4KgccREHZc5v1yB0i4SuCjnu7WuodDDP8MVtWHO3ruyipQyCq981z1inEjSyV
	FykQpPpQa32l/BwGeIQyDKjrzgbAAwuuCzLaMSoJZGgpmMp14/QFos5G9/rk2we9ucm2
	VEOMwZz71QsP9fsjE834d0LsjgsGas4KKk2R1tVYn0YpgmIDrx+IkOsPv7GakmeD8EJF
	qeLp1i7LfmXu9hHxrtG4tgIC+7/IdrYOiF6aZVqmOykimpZaG9foSBmMcNOUA/UzZaMx
	4GLh9uJ26UQyuR3T7HUiaNyxHj1e6CBVwOIRZLhuxTfnT9zVvQkS4Ni+uaXEE+UEAVHz
	vr3g==
X-Gm-Message-State: AEkoouuXKVrNlfBPd3UMrDVG5Cugp7aOHrUZiw1p5AgZOtFA1JO/hHt81RtyoFEgVOG45Q==
X-Received: by 10.66.88.131 with SMTP id bg3mr11573708pab.43.1469237326349;
	Fri, 22 Jul 2016 18:28:46 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:554a:89be:b887:e6a7?
	([2601:646:8882:b8c:554a:89be:b887:e6a7])
	by smtp.gmail.com with ESMTPSA id
	q14sm22646016pfi.76.2016.07.22.18.28.44
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jul 2016 18:28:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1469225811.23580.81.camel@linuxfoundation.org>
Date: Fri, 22 Jul 2016 18:28:39 -0700
Message-Id: <CAD05943-64E1-428A-A5E0-E1B32BB441C1@gmail.com>
References: <1469197543.23580.65.camel@linuxfoundation.org>
	<CAMKF1srw4bVtAHrq6uOVU__WueXjoNwKRsvxLNLudt_zFyzrzQ@mail.gmail.com>
	<CAMKF1sqzsoR=+FyXL99f+SZts6gxnNOfH0_MpX_y2M1FP-gbdA@mail.gmail.com>
	<CAMKF1spXDX=C9miFBi5DjRgzCKk7esdNZWH0QgakDjgU_9bT6A@mail.gmail.com>
	<1469202930.23580.73.camel@linuxfoundation.org>
	<D060F23D-DAE1-4A6B-8842-D3E177B7B76C@gmail.com>
	<1469225811.23580.81.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] siteinfo: Add mechanism to extend siteinfo information from BSP layer
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
X-List-Received-Date: Sat, 23 Jul 2016 01:28:46 -0000
X-Groupsio-MsgNum: 84826
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6D011258-F38A-42F5-8862-2AD9E1A9C052";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6D011258-F38A-42F5-8862-2AD9E1A9C052
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 22, 2016, at 3:16 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Fri, 2016-07-22 at 11:20 -0700, Khem Raj wrote:
>>> On Jul 22, 2016, at 8:55 AM, Richard Purdie <
>>> richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>> On Fri, 2016-07-22 at 08:47 -0700, Khem Raj wrote:
>>>> Whats the motivation here. This looks like a backdoor for bsps.
>>>> To
>>>> user it will make inconsistent behaviour. Even now its quite hard
>>>> to
>>>> root cause errors due to siteinfo
>>>=20
>>> Right now if you have some new target, your only option is to
>>> either
>>> patch OE-Core, or copy the class into your new BSP.
>>=20
>> May be we can make an exception and accept patches for these changes
>> into release branches
>> via master ofcourse
>=20
> That isn't really helping people doing development work though. Sure,
> eventually these changes can be ready for master but I've worked on
> things where master never really made sense for various reasons.
>=20
>>> This is
>>> particularly problematic if you're working on hardware that isn't
>>> supported by core OE or that is in active development.
>>>=20
>>> Having hooks to allow you to write a new BSP without having to make
>>> changes to the core would seem to be a good thing.
>>=20
>> This seems to be fair, however, they will surely keep these fragments
>> and supply their BSP to users. who will now have to chase different
>> places for finding siteinfo details.
>=20
> The code is pretty good about printing a list of the siteinfo files =
its
> using so it should be clear if a siteinfo file is coming from a
> different layer and which siteinfo files are in use.
>=20
>>> I'm not expecting users to regularly use this, just those writing
>>> more
>>> exotic BSPs or doing baremetal work for example.
>>>=20
>>> I can sympathise with the problem as I've run into it several times
>>> now
>>> myself. We can't really demand that every time this happens, people
>>> send a patch for OE-Core (although if something is commonly used
>>> we'd
>>> obviously then encourage it).
>>=20
>> This could also mean that I can override a definition e.g. size of
>> off_t
>> for arm in my BSP layer and inject it into a MultiBSP setups where
>> others will
>> get it too ?
>=20
> In theory you could. There are an awful lot of things you can do with
> the build system which aren't really recommended though. I'm not sure
> I'd single this one out as being something we should enforce as not
> being good.
>=20
> Let me put this another way.
>=20
> The principle is that you can add new hardware support to OE in a BSP
> layer. Juro and I tried that and we ran into problems where we could
> not make this work without hacking OE-Core meaning the principle
> failed.
>=20
> We made a list and there were three places there were problems. I've
> sent patches for two of them, I've proposed a different approach for
> the third in the bug entry.
>=20
> I do feel pretty strongly that OE should have good support of
> independent BSP layers and if there are barriers to this, we should
> have mechanisms to cope with that.

That seems a good in principle, but then we have been hard on some
things e.g. linux-libc-headers, citing that we want interfaces
from kernel to userspace to be consistent across all. But this
falls apart when you insert different type system underneath
this recommendation also makes no sense.


>=20
> Yes, there is a risk of abuse but the whole system is so flexible we
> always have that. We can document when these things should be used and
> also name/shame anyone abusing them.
>=20

I think implications on usability are huge. I just get this constant
feedback that its complex to debug issues with yocto based systems.
a real world example is where folks spend 4 weeks a problem which turns
out to be a wrong assumption on OE=E2=80=99s part for cashing size of =
off_t for
one architecture and curl turning on heels over it.

anyhow, I just wanted to present a perspective from a non BSP writers
point of view, in the end these BSPs has to be used by someone and
that should be more important IMO




--Apple-Mail=_6D011258-F38A-42F5-8862-2AD9E1A9C052
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleSyEwACgkQuwUzVZGdMxRBhQCfeNi1/5IbzebfXu84Lc/SUiXy
Bz0An2RCCvA6tTRjX+xqpnl5RrIJbH7C
=jXxi
-----END PGP SIGNATURE-----

--Apple-Mail=_6D011258-F38A-42F5-8862-2AD9E1A9C052--
