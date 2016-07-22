Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id A7D256067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 18:20:06 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id iw10so41688853pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 11:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=uFQm1OAzqi3IZx1xxVyI1wP65ZS6uN1jJOpYHCPv5vI=;
	b=OaxxCitOEMp32i5OLouU8wcmkSTUn0U3CDOpeAT4jn8eS9/l9jOGnnHQPncvKEuiUt
	bCBIAt8IRZjlX3ZACeuHxkvz6UVY/h99Wbe15AQbweGXVU0NYquYB5wY1fyhOmv3XyDE
	/0nAborJAxPqGnujMi1viXU07SqZDigWt/SfwQqvafZBCIPlAv6vUYskE2ka9N56z3Kd
	t5bdfxWgLuQFImeeCxzoT4Fg65v5beThdsPwbNdVBHCnW3hRP+X91mhY8e+2FixcfqPM
	uGAjmngfKJORGF/OV6fvTYrd8pXDZQs1UXSIOtINktYczUrlutzBLClOQ9Rq8T34E7RJ
	ltQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=uFQm1OAzqi3IZx1xxVyI1wP65ZS6uN1jJOpYHCPv5vI=;
	b=Ap6vBAfwREDjf3EyZtnKd6t+r2SGgbY9Ody6RoNmTt6XrFwZm49oA+yYheN+a+EZ1k
	TKFLbMaQOcigEPS1SlANYxpDWd/+bmbClX3Xnxhj+I6b0M5f9p1HHVrLaaujFQsMwOIY
	/cThvkSVKHIDWCAGOmG51jww6wcJHBcKs9F2c36w3EyPYONA7Yqqr3aVtpg+39qj7oQP
	y63KSF5rYVV7EkWfq/a+nkVaQFjgfEqlqOn3X8pCRIQ7PfxlMZ30fdygNau8Kn0fNfWw
	ygaeyVQfjk9ZU/WJX0q6JbllX0ctRqPf//BC8mPw06/2kWMvYmipFSzDYzI4yekU3zrx
	5sFg==
X-Gm-Message-State: AEkoouu2vyvqQ6stXfmYK4GC1NQRGyC+MYrDGm9lzz/CtVqU/lK4tb2+nvdhhGWsmRyiQA==
X-Received: by 10.67.1.35 with SMTP id bd3mr8765477pad.16.1469211607043;
	Fri, 22 Jul 2016 11:20:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:98e8:b46:aaed:733d?
	([2601:646:8882:b8c:98e8:b46:aaed:733d])
	by smtp.gmail.com with ESMTPSA id
	u1sm21630312pfu.12.2016.07.22.11.20.05
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jul 2016 11:20:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1469202930.23580.73.camel@linuxfoundation.org>
Date: Fri, 22 Jul 2016 11:20:00 -0700
Message-Id: <D060F23D-DAE1-4A6B-8842-D3E177B7B76C@gmail.com>
References: <1469197543.23580.65.camel@linuxfoundation.org>
	<CAMKF1srw4bVtAHrq6uOVU__WueXjoNwKRsvxLNLudt_zFyzrzQ@mail.gmail.com>
	<CAMKF1sqzsoR=+FyXL99f+SZts6gxnNOfH0_MpX_y2M1FP-gbdA@mail.gmail.com>
	<CAMKF1spXDX=C9miFBi5DjRgzCKk7esdNZWH0QgakDjgU_9bT6A@mail.gmail.com>
	<1469202930.23580.73.camel@linuxfoundation.org>
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
X-List-Received-Date: Fri, 22 Jul 2016 18:20:08 -0000
X-Groupsio-MsgNum: 84812
Content-Type: multipart/signed;
	boundary="Apple-Mail=_50EFF6E3-0846-4E9F-B662-E584E3B37959";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_50EFF6E3-0846-4E9F-B662-E584E3B37959
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 22, 2016, at 8:55 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Fri, 2016-07-22 at 08:47 -0700, Khem Raj wrote:
>> Whats the motivation here. This looks like a backdoor for bsps. To
>> user it will make inconsistent behaviour. Even now its quite hard to
>> root cause errors due to siteinfo
>=20
> Right now if you have some new target, your only option is to either
> patch OE-Core, or copy the class into your new BSP.

May be we can make an exception and accept patches for these changes =
into release branches
via master ofcourse

> This is
> particularly problematic if you're working on hardware that isn't
> supported by core OE or that is in active development.
>=20
> Having hooks to allow you to write a new BSP without having to make
> changes to the core would seem to be a good thing.

This seems to be fair, however, they will surely keep these fragments
and supply their BSP to users. who will now have to chase different
places for finding siteinfo details.

>=20
> I'm not expecting users to regularly use this, just those writing more
> exotic BSPs or doing baremetal work for example.
>=20
> I can sympathise with the problem as I've run into it several times =
now
> myself. We can't really demand that every time this happens, people
> send a patch for OE-Core (although if something is commonly used we'd
> obviously then encourage it).

This could also mean that I can override a definition e.g. size of off_t
for arm in my BSP layer and inject it into a MultiBSP setups where =
others will
get it too ?

>=20
> Cheers,
>=20
> Richard
>=20


--Apple-Mail=_50EFF6E3-0846-4E9F-B662-E584E3B37959
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleSY9UACgkQuwUzVZGdMxRvFwCgiNmlpnx42vyOOSCFZ4Kvwt1a
oqUAnA+Is4Ci2L89BlCsYbr1RsCGZFss
=6QJR
-----END PGP SIGNATURE-----

--Apple-Mail=_50EFF6E3-0846-4E9F-B662-E584E3B37959--
