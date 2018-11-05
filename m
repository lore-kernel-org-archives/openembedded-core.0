Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 15CE179E76
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Nov 2018 17:52:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z13-v6so8133617wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2018 09:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=oEyuh+fyBcpsuAWtHe68vvydpDmWGTyvhh2mBt+ehmk=;
	b=aZTDTFt1CUIf6Xjl/QwSIvmymWnruXtYW8ksSRTlOEURVyR6JKKZgAKBK8YkTy4LHi
	j+LPsJ5MmolIGyVjCaJziBb1GCnwtTcxUcmpYRibTxco7RVlaBtATSyBVIJrUmlj25U+
	8a783KMa1WLBeHl3wtpz8E3e+/QLndyPxqukbGovcnz5lPwAKp19OI7nO467g0AHjbfZ
	tKm31FYQrdllrE7ZcsaEIql/LhefkbNQwyzo4Vll2g4Ow9fcsVwMl/XJ6vtqQ+26v1vW
	qCGCRyJI1kUYtics2UDcX7nOSNSAk2EEyP5fLDuTKvAcm4SJrtOTIdlHMN+2AsUTATxS
	ZByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=oEyuh+fyBcpsuAWtHe68vvydpDmWGTyvhh2mBt+ehmk=;
	b=gMcTXNQZP6EBXE8POfGY5Tc3cuJptqW2EMxqGH3QqwFItem20aV+TA74k2Jr+KrB9C
	ejiz0gSdAAm+gZAzDpnzkp/7NpWCwW5wi2GvoKEP1lXC5AABfKtTupZIm+jZyHwIu+o3
	wvylnY5YmOKRNui762j4GRNJIIfZWC4GkaOWvSjr/AL23yp8E0tC+TpyWmPDVyMWIY3v
	tvnaZVg5lPMRTX/BiUVOMDyrn0yxqDkFb2XQDT+sGRrB91JRqURj9+aUDPdPhfWrlcBc
	nXCkVzwn+9Jl0aqn/nYVeiMVr/QNx6M/npZdCqyXiFXQALK4OvxXXTNk/b4xx6EqEHCE
	wZjw==
X-Gm-Message-State: AGRZ1gJuroydnBfeLFrW4ZCPl0qCAY9o86HVFyH2vkv5lDSSj8uLmWwg
	6WdrB0W1+wIa7zD7Nq+EMU/mga8D
X-Google-Smtp-Source: AJdET5dddYEYXLmrPvH8eIzp6SlQsydYIMf//sMrSqiqPnEdLauS44wRChV/ba4gIIc2o0/e9+1DOQ==
X-Received: by 2002:a5d:5206:: with SMTP id
	j6-v6mr7716430wrv.147.1541440365762; 
	Mon, 05 Nov 2018 09:52:45 -0800 (PST)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	82-v6sm51583676wms.17.2018.11.05.09.52.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Nov 2018 09:52:44 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <2C73375C-47C9-4312-AE43-82125C2B9EA8@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Mon, 5 Nov 2018 18:52:43 +0100
In-Reply-To: <CAJTo0LZuBC7gUb2D_xp-jJLKxygfecdS7PBKB-_gw+LE1m=5aA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181103131223.28268-1-sno@netbsd.org>
	<11534e53929f6a521560cdf97f71b6af61afdb29.camel@linuxfoundation.org>
	<CAJTo0LbMLafivJjzW-12cJe11Jf5jxkJch9LsaqEEXpH40iJ6A@mail.gmail.com>
	<CAJTo0LYsR=JRaJD27r69XPwLm0_c5W0wa2UTDpG9Sb4Ndj+kdw@mail.gmail.com>
	<CAJTo0LZuBC7gUb2D_xp-jJLKxygfecdS7PBKB-_gw+LE1m=5aA@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3_3: Update to 3.25.2
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
X-List-Received-Date: Mon, 05 Nov 2018 17:52:45 -0000
X-Groupsio-MsgNum: 117955
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B1B320C3-DAAA-4631-ADCA-30B3BB914E55";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_B1B320C3-DAAA-4631-ADCA-30B3BB914E55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 05.11.2018 um 17:21 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
> On Mon, 5 Nov 2018 at 16:11, Burton, Ross <ross.burton@intel.com> =
wrote:
>> On Mon, 5 Nov 2018 at 11:43, Burton, Ross <ross.burton@intel.com> =
wrote:
>>> Mining the list archive shows that we keep on getting sqlite =
upgrades
>>> which fail like this.  Maxin reported that it was due to the
>>> full-text-search code enabling itself and failing to build, so one
>>> solution is to explicitly turn it off.
>>=20
>> Did some digging.
>>=20
>> FTS5 is enabled by default, this needs log() from libm.  If enabled,
>> AC_SEARCH_LIBS is used to find log() and libm.so, and this bonus
>> dependency that is needed if statically linking is recorded in
>> sqlite3.pc.  Pseudo then builds, statically links to pseudo, but also
>> hard-codes the link line instead of using pkgconfig so this -lm isn't
>> added, resulting in a link failure on upgrade.
>>=20
>> So that explains why the autobuilder explodes when this upgrade
>> happens, but doesn't explain how it builds for everyone who submits
>> the upgrade...
>=20
> This patch I can confirm makes pseudo build:
>=20
> -PACKAGECONFIG ?=3D ""
> +PACKAGECONFIG ?=3D "fts5"
> PACKAGECONFIG_class-native =3D ""
>=20
> PACKAGECONFIG[editline] =3D =
"--enable-editline,--disable-editline,libedit"
> PACKAGECONFIG[readline] =3D
> "--enable-readline,--disable-readline,readline ncurses"
> +PACKAGECONFIG[fts5] =3D "--enable-fts5,--disable-fts5"

Excellent \o/

> But that's a little ugly.  The alternative is more invasive and would
> involve teaching pseudo to use pkgconfig to find sqlite3, but I'm not
> convinced we want to add pkg-config-native to the depends on pseudo,
> so I'm wondering if the third way is to just make pseudo always link
> to libm.so.

I don't find that ugly (maybe because I don't understand enough about =
pseudo) ;)

Will use the chance to dig a bit into it :D

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_B1B320C3-DAAA-4631-ADCA-30B3BB914E55
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlvgg2sACgkQRJmWrtzl
Cp1lhg//VcYm5Dj1WGbLOAjGi4tBqoniuscMiEP071+ENnjg1/5nEE/RGPnoSJ7z
BJYxnNryathveTfnum8y9Y78HR9YH+abaZkpzuP0Us/5TnenYqPQiOr+ET3wAMLG
jrasqP+9im4sPxHMxe/tx7QMXfIH0biIkjKAwraW8htObJ32MGPjOURCP8hg3/Qz
3eiv+EOVCSLFO1fKssf1hAMmzPEVg9evHgIsNyYxncchKxrB07Q5HEzKD4VLiW5W
DhaXTZVQu8pHqaLju81YhFk9050hDeAX8urwWW/unnauAOCcX40IW402oH6XzMys
p9YXEs3wSgyenvIltEX2q6o2B10WhKPyWG7QNZfWJK0IGhByQJgt2my5o2WH71j0
SCjIXrRHtmo4ASyPVOf7bC+sEwyLhqppSDfhiiIVG40a7QBdokkYvnkQyKsukbNi
6dZMAoLd7FpZJNfm9Z/QxJDjhAm3gG9vkrGdPTFPsTKP4ecE0ngkjq0aILHIHavC
nYSq/7yFBYIYvsLEUXqNUTXNvM3FvaUJr2dDFDScEYxfQI728Mq0vt0PNP9RaU9y
FgE2RFSGb/mKdAPTQqYipRQP3gCEcY9s7hrWdKOadoqy91W9as9ZAAd/VCaka33I
3YWxAN/6l2l7yh5adbeQcRJirGhSpwNqa5c+meYIoboh07J3pMw=
=vAjE
-----END PGP SIGNATURE-----

--Apple-Mail=_B1B320C3-DAAA-4631-ADCA-30B3BB914E55--
