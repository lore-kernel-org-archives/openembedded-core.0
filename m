Return-Path: <rehsack@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id EB10E74703
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 19:24:53 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id 94-v6so21762846wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 12:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=7CA0Xkw/nT4HFgWrk3t6rTJ8NdO0tVSqnjy+oXWGsNU=;
	b=czc68/FS2VSU/5R3AYCM+SP4Whjo7c1CUQ2YH1nYhgA6yBFwkvWRUnBWMHLVNiGKUL
	XJ8KcghtleDObBmu6GgAgvBDuzVeJiJCE83awzOEe+6j1wd1DpHGUfgYoDuQ41N+phFP
	rpyRP9iPO7wP38tdjbJneGyAOeVkxnumpGDzpHpBBb6FVIhnYNl5m+YKXkNPbzXwy8SU
	N0IyKju3dt/DRxItM9ub4x7DshxeapjD/9oavNKqLR6qbcKHJBwD6ix+QBOkk4gp4Zh+
	nAJA0Gou8gnxsjJ6LHseJJDD6O25RwDrZEh0GOGiFNUSU81wfliXH+GfBZZqTgMvesTr
	ghbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=7CA0Xkw/nT4HFgWrk3t6rTJ8NdO0tVSqnjy+oXWGsNU=;
	b=RT2ChuvTFQ2N7SaXiV4aNvXOxmVydBDnyeYONtB98tdlVcyj83O2Cix5OaTPEAHirY
	USWrsQ0nxjZ4CMw+lFbDHmXZPZfFC6JS+OerP/LnIYBFvPOx7mlpo5TeL5HhFZypXDbn
	Pu63yjZdvWBkQ8tMjwmPykojgMCKy+3ExlYjfazMzXTJRwGzmRosJ0HJ2hO8/v9kP0Bs
	lnu9WPPn5TYXHKUOx3KQB1NeffL9t2Bg8MPR60Xk3pUpyROHUhkedtL+4iNVNzXXMfwS
	VECLpZTUIRovqDXiBBivEZbggCrnHmVVPNWWLYJV07AEdPOMInVDwcJ/is79E3VzwE3x
	Uf9w==
X-Gm-Message-State: ALKqPwe2WP6pSl9GD7WP21wCUtBN9T/8TDkbtKqsKRIpaM331YlpOALu
	pFtSaGFvT0cgPhlbx2HNU4s=
X-Google-Smtp-Source: AB8JxZqXraPrqwU9TZOy6uLoGAaOqXoJ7uyjXggj8yfXHOyR+DK/pMsBZaXya0Q4buNjuoVNEqV8qg==
X-Received: by 2002:adf:8854:: with SMTP id
	e20-v6mr12614084wre.30.1527535494311; 
	Mon, 28 May 2018 12:24:54 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	s5-v6sm33899234wra.48.2018.05.28.12.24.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 12:24:53 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <39811657-CC9C-4AF4-833A-FE14AB897F3D@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Date: Mon, 28 May 2018 21:24:51 +0200
In-Reply-To: <CANNYZj-oY9-oOTRfoJhB2zM7rZ9_3FMF6HQGirEVPsDe5C6fDQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <613380E3-73CD-4A50-B8E3-337912D28A93@gmail.com>
	<44b3165e-42fa-6cfc-ca9b-cc11892db157@linux.intel.com>
	<70B5B287-3F28-4055-9AEF-FF23C60FF6F9@gmail.com>
	<CANNYZj-oY9-oOTRfoJhB2zM7rZ9_3FMF6HQGirEVPsDe5C6fDQ@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.6.18)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] scripts/oe-init-bashrc: add more user-friendly oe-setup utility
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
X-List-Received-Date: Mon, 28 May 2018 19:24:54 -0000
X-Groupsio-MsgNum: 111815
Content-Type: multipart/signed;
	boundary="Apple-Mail=_80988126-43AD-4D59-9769-053882691300";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_80988126-43AD-4D59-9769-053882691300
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 28.05.2018 um 21:12 schrieb Alexander Kanavin =
<alex.kanavin@gmail.com>:
>=20
> 2018-05-28 21:41 GMT+03:00 Jens Rehsack <rehsack@gmail.com>:
>> When I log into my build machine, I just do
>>=20
>> $ oe_builddir use ~/gpw-community-bsp/gpw-yocto-platform/
>>=20
>> and I'm in the right location and have all environment settings =
prepared to start a bitbake immediately.
>=20
> oe-init-build-env does the same thing, how is this better?

It allows you to do things like changing to build-dir and setup shell =
environment atomically - for example.

>> $ oe_builddir help
>> oe_builddir <command> [argument]
>> Available commands:
>>    use         use specified build-dir, setup when local.conf and/or =
bblayers.conf are missing
>>    setup       create default builddir
>>    avail       list possible build-dir's
>>    layers      list layers used in BSP
>>    repos       list repositories used in BSP
>>    prune       prune old builds
>>    off         remove all settings from oe from shell environment
>>=20
>> Tells you, what could be expected (very short).
>>=20
>> It's all plain shell - so everyone can adopt it easily to local =
requirements. Further, it supports setting flags and tools within =
''oe_builddir use''.
>=20
> I'd say you should look at existing tools, specifically
> oe-init-build-env and/or oe-setup-builddir, and add any desired
> functionality to them.

I did. They don't do so much. It's even not the same concept.
And - what is even more important: it is one tool, it does init and =
setup and much more - for the same thing.
It is much easier teach people one tool than teaching them pick the =
right out of 8.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_80988126-43AD-4D59-9769-053882691300
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsMV4QACgkQRJmWrtzl
Cp1fGA/+JDeu9OfO8PGl2n2v9tCYC0Ypi3t3jXmj5uczJ+WY7Mw+FRWOxAjNWg56
hj8fU0RT7ukUQMr1LttQyhwmYk6Ie/qeiBAXfMVuvR+HtPBjypKI03iQ7y0jED6M
qv64NJAMTXe05TRMARHfG9jkiwjV6fvtSx/jXw4jokMVWia0nyKLKa9tGX6pPmWo
+FWP4NkL3vF22DF8lqucKR0CLl55dCM0+BTIGQeXcbIyic3sGMp69R+mbF8QQen1
1f+nffIaMPn0Se/YNXVkeCJRt44cTbrXIMJ+nyo5Iyw+8+q48Y6rd/oNsh86Yx7m
+tTFb8VMUFlXSV7LfE4LfPTPRQ9II2AhFV5CyLM8grYPHYU490MsfoxE49kv1L3N
yf/NyAa2BAj814EeUfSS/Pm/XB/j+lKNVnPwx18w+1Ya8Fyu9RUWoyvzSC3PTp2z
VNATKo2bFg8HAg/HotcyDTgF8369vKDDATXb1KgXs4D3JW8o3t9KG9SRFD7yaVnl
43cPbcEDLU7qTf9jh+b4TdSQoXjIWjaYfh3aPkibFnYvnb6q94ThqWLA/WLD0eS4
7PdpkTxKWFr/ZPEtFldR2zn03nUVD7tIcysbH1KMaC3HvN3vKkmezkFQukh0JGsF
emBRtJA43LeHYFU7d6ey7CV4Z0mbI1lc5j6RmAtrWibzzFMCo34=
=XoMa
-----END PGP SIGNATURE-----

--Apple-Mail=_80988126-43AD-4D59-9769-053882691300--
