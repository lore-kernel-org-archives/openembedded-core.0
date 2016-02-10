Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9C34E6FF9B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 04:38:01 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id c10so5552414pfc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 20:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=6aALB6XijjAQHapltNENTzk2KUi23Hnff9Er0pe+LHA=;
	b=Iu4+R3mVerParzKxC2rtnuqwGSDjv7HF6BtNAmxCzvwku6PM3jW+sghjQkvbqoHuz9
	SlLPT+v1cKAEZrLjZNmTQHM9x5XYZrmrGsdiRW0irVxJNe2BXPYwd6rKvkaWMYaY/NIV
	3OsV49VhJzz7hYQyFHXvg+MXmAekvtuk/ELpqpm88PiX9FxmdqVR51vBeaNTWlJSVf2c
	x2Ytg30IwG+HS8RRd2/+sV/ji+kacF4pFY++3steZGp2SsqTSICpOyLWrWrGnpFtyemD
	yEWkIUssij7d4bFyC5Qlc4l7L6tL+SRA0kwao6rpu5sgPtpaD//w4Ts/Bd0IGpr7oVk3
	M2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=6aALB6XijjAQHapltNENTzk2KUi23Hnff9Er0pe+LHA=;
	b=BdZuM1KfWKIYIm/5IlSe3x10PnO+NjsCi24Zun9Gnr5RKAky+uIHUARd/F0v/5FF76
	vLN6j+H2VTTBvTTSRG2bsy9D02vZtH8Ugw8GMHSVg0u9lOFS4lHmNI5UNbn8NsUSy9AJ
	9+LHoBzFh6KlO2UY+50KIw43yvkA1ub9xEcieu08+RMG0LtSRxV/4FU5dB4UrneJdByE
	cjJT6uMFzEhbCHwEEtKbPhMTV2xfY+Mws1uCKMLVaD0qAwX0xCveV6uASlfohU9Mhcqw
	/JADcHchgNniE13pjilem74Kh1YIsuPvcXbJP/Cj6cSPTOXstNJgIRWqGEwZUZk0SRq5
	ghJg==
X-Gm-Message-State: AG10YORoBbyWZFlZNrNQcfn0aPYPF2jL243RiLWsE9jTaWu+Nzi3nNcOeCmJVZsqkxjKaw==
X-Received: by 10.98.18.8 with SMTP id a8mr55763417pfj.41.1455079082106;
	Tue, 09 Feb 2016 20:38:02 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:c4a3:a7ca:82cc:4494?
	([2601:646:8802:5d5c:c4a3:a7ca:82cc:4494])
	by smtp.gmail.com with ESMTPSA id
	x88sm1278420pfi.66.2016.02.09.20.38.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 09 Feb 2016 20:38:00 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56BAB9F8.4000106@gmail.com>
Date: Tue, 9 Feb 2016 20:37:49 -0800
Message-Id: <A7F6AE58-0DBC-4180-B232-4876DD5E20E6@gmail.com>
References: <56B922B3.9070604@gmail.com> <56BAB9F8.4000106@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Wed, 10 Feb 2016 04:38:02 -0000
X-Groupsio-MsgNum: 77905
Content-Type: multipart/signed;
	boundary="Apple-Mail=_11E46D84-CF30-4007-8A92-87358A4344A7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_11E46D84-CF30-4007-8A92-87358A4344A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

IIRC gold has its own notions to enable gold
so you need to enable that

> On Feb 9, 2016, at 8:18 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>=20
> I've tried every combination I can think of and no matter what I try, =
if gold is the linker the chromium build always errors out with:
>=20
>    collect2: fatal error: cannot find 'ld'
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_11E46D84-CF30-4007-8A92-87358A4344A7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAla6vqgACgkQuwUzVZGdMxQpJACfafNissGyYZYMRxwQSiVE08lB
iEQAoIcxTYCLBG3U9YQOaT9AMhtQ+tzj
=gurm
-----END PGP SIGNATURE-----

--Apple-Mail=_11E46D84-CF30-4007-8A92-87358A4344A7--
