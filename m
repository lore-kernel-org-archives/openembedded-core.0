Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5794E60125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 00:48:58 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so56071472pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 17:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=g5IoZYYYTfmch21PBytKuiVJduSqt64/peNb4mAd9Mw=;
	b=dAt7LINrwMdGG2sGxtFNQ0h4muY/LdLRm7RtN1cYFUpHERXeuX6yHz/mJtSOZBkHSW
	GJK0qby2iu00YAWajSn0CxEAMqXXKQQo73b1dAdIGDV6loRJ6HJ/wMmCHuqi71gD9bwX
	ofrKoN977JKasx+sMgeQif+C9p59x5Z75Q3fsHgxYfZVkR/z46jcrVZ0UKbk81YtueQY
	zO0x/qiR8f1NWJfI1PlxpMlUJsMFQwNETiV4U/oPSw6LYg4EZF3awG4s8QX1sVhf4aK+
	sc2nqdjLY0TvtykaAt2PU/lXld99Mo4hc03ljJoD3P+vP3hr2dFxxoOTToKsIqDpSj2j
	st4w==
X-Received: by 10.68.57.197 with SMTP id k5mr8356042pbq.142.1443660538673;
	Wed, 30 Sep 2015 17:48:58 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1ca0:7049:bf0:dc37?
	([2601:646:8601:4580:1ca0:7049:bf0:dc37])
	by smtp.gmail.com with ESMTPSA id
	eg5sm2924589pac.30.2015.09.30.17.48.57
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Sep 2015 17:48:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=Xkpa=hO1kizYrsSOTpeMOfbnZeniEWdMgCNhXae2W_5Q@mail.gmail.com>
Date: Wed, 30 Sep 2015 17:48:57 -0700
Message-Id: <71039CBC-0B0A-43AF-8C7D-34D73FCFE32C@gmail.com>
References: <CAJ86T=Xkpa=hO1kizYrsSOTpeMOfbnZeniEWdMgCNhXae2W_5Q@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3094)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Sorting rootfs manifest with .ipk packaging
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
X-List-Received-Date: Thu, 01 Oct 2015 00:48:58 -0000
X-Groupsio-MsgNum: 71828
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FE4F98E6-382F-466A-B9E3-602C35D01284";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FE4F98E6-382F-466A-B9E3-602C35D01284
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 30, 2015, at 3:03 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> I'd like the rootfs manifest to be sorted when using .ipk packaging.
> Would a patch to sort the result of OpkgPkgsList().list be acceptable?
> Or would the sorting be better done elsewhere?

its not clear what kind of sorting are you looking for. It could be a =
good thing in general if its
configurable and you can explain the value add of doing it.

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_FE4F98E6-382F-466A-B9E3-602C35D01284
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYMgvkACgkQuwUzVZGdMxSAAwCeOOiZ31zMaq/cerxSabSDnyht
DOYAn1g3WGu2W/VWScI0VbOa6mHBOkay
=NIVF
-----END PGP SIGNATURE-----

--Apple-Mail=_FE4F98E6-382F-466A-B9E3-602C35D01284--
