Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id AA41F748D5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 20:56:16 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t28so8548215qte.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 13:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=COWWYSMtjwRtFCOuA1LFHkspKgzse+fNDRVGn10CNIg=;
	b=E3NwDUFQBapTG2tTkAfG5D42BEq1wOkL1ktst3XVgxmZC4dznMPZaZpL1hQUWLNR1t
	BsLG0ECMMtvZEhG06cnp1Qz8jzJf8JKooXgsO+CDDie+n9LZ2e+dGUdrIa9NUIz1pFOO
	iIAiWa3mJ6BLd+I+Z9cLotv+T4UNF4fHHZU2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=COWWYSMtjwRtFCOuA1LFHkspKgzse+fNDRVGn10CNIg=;
	b=JVuHOmpsSI959OhtLFhOGckzYFczdfm8B2oi6F1Kmu1rTkLt/Tz76WzdZLrAWRoCz2
	jNJMIxbB6QYua7cazwjv5B3jVuL5T4xNFMT0WTHgYoQoeIVFFaJt0hxjBdKddSuR1Ggu
	l74edyAKJl9lNSaYVpBLsdoWJKAkZl6Cb/bi6KUJENxTHwAE5sY3YJbaXHgcTF8D75XH
	Qg+J/kdbJR9IOcNxYF8y3W30DgH79t1Okaw0+F1A0Ts4up42TA29jbZH/oz7biT7Xqom
	y9zFHd+OoD9xRplD9fhRMKpIATXLd1cIBwSxw2CLyudQuTs0MutgRgnO1DY2YkizES3T
	RG8w==
X-Gm-Message-State: APjAAAUv3pWbl3kkibqhJOEAlRZNSEcYXTZwci5DbZFLHsf0xWnI20JL
	OYoBnnL+smzjT+OU9q/7b+IU5A==
X-Google-Smtp-Source: APXvYqws1bPuNTU5ZD/IoPATdD8Tb7OwltnC57AkAyZfv9PrK2fDAPL0kVRncmmm93qtEzl5WFIoMQ==
X-Received: by 2002:a0c:b585:: with SMTP id g5mr2562789qve.220.1554065777303; 
	Sun, 31 Mar 2019 13:56:17 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id l6sm4293022qke.65.2019.03.31.13.56.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 13:56:15 -0700 (PDT)
Date: Sun, 31 Mar 2019 16:56:13 -0400
From: Tom Rini <trini@konsulko.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20190331205613.GA4664@bill-the-cat>
References: <20190331155012.3085-1-open.source@oleksandr-kravchuk.com>
	<20190331201141.GH18421@bill-the-cat>
	<CANNYZj9QeaLU8AC03CmtczcVJ_jbuaL7gQEQ6HQVnDB82z+taw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9QeaLU8AC03CmtczcVJ_jbuaL7gQEQ6HQVnDB82z+taw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH v2] vim: update to 8.1.1097
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
X-List-Received-Date: Sun, 31 Mar 2019 20:56:16 -0000
X-Groupsio-MsgNum: 122804
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 31, 2019 at 10:19:51PM +0200, Alexander Kanavin wrote:
> On Sun, 31 Mar 2019 at 22:12, Tom Rini <trini@konsulko.com> wrote:
> > Looks better, thanks.  Is there a particular fix / change you're doing
> > this for?  I ask since every commit is a version bump we might want to
> > set a guideline of once a month or so for bumping vim to the latest.
>=20
> It's a bit insane upstream is doing that.
> Should we set PV to something like PV =3D "8.1+git${SRCPV}"? That way
> devtool/AUH/RRS will not be reporting a new version for each commit,
> and will only do that when 8.2 is out.

No, we should follow what upstream does for version numbers, it's what
other distros do.  And on the related topic of "is it a stable branch?",
it does seem like yes, it is.  We should just remember to not update it
more often than say the first of the month, without a specific reason.

--=20
Tom

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcoSltAAoJEIf59jXTHXZSIt8QAL/oAocbI8t8eCKceE55LBFB
31I9SBMVOghvFGdikTzw3eGBli7b8/B3pYN6oz/Oec2RwItgOCu44Ol555Ufyv1l
iiL7pst81bSMKrrvS/8e5bnAPUoP4LASprlz90Qj6mXbvxSzXlbCsRRJwZjq/v8r
+zDN9ih7QEjP+V8EA0iadwGrsMzubNvI9MHcy5I6pGIm3+XG6YloPnzOIb5mhJ9/
V7BiOFGLouL2CfwMBE1z7X+cp5FRh4BY3wwlFwPRah50n9QKXHP8SmvIkXTb1trz
EJ4/8rqlCsFc50SgzGxQzDzT2+XGDsfx/M1ICnWW8/05x5t7a3CbB5Zhx1PeVUmd
EMawRZqqJXzMmhwuiA/gVaZTVHGFYLMl/MvXIOV5TFXnEUebx6VfUL7lY1xe3fFE
PBY0ib8sMArRiqlf8HI190Tach1WAnAMnE7j0a+q/A9ld9190Ml1Wes96FwEFMEy
vpVo3jft/rx7DHNTf+Hk3Y7r/ivm52cmm9NMLiYcMdv470cjnymeTHrPv/0WHYSL
ZBn433xmwrVdSsir/gOLpINol2d7XkPNQAhQd/DRJWVaw0SQt0RoCqvMC7aa3anL
3sDk/Ts6lpmy8qw4d7h3FZK5N8K9iY+kUU9IEmBO78ZPEzguIaRo8CgLia7r5tfh
PbUyW1yutN4nzGcXtic8
=Jjlw
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
