Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id 416276B54F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 15:58:50 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id g9so4657555eds.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 07:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=s0QyArItyAAcuc5AmS6QjFlDETXLuW1fyWvclp4o5B0=;
	b=D3P7Ja63MwZE5gYmH1FIzQf75fUfo2i14+uYw3MALbYfHrXShO1pXj8mwt6CfPWKtD
	NX07A2fOvO7L64gjd9pUASQeV+hOfiznkeMsP8fktDBuAIV9XabxHi9cvOWVnKbKGbE+
	xx/okALPD8BQf4ymL/XFBs57l9e0+4PE3xam8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=s0QyArItyAAcuc5AmS6QjFlDETXLuW1fyWvclp4o5B0=;
	b=rPmSZSNzPeDsxln5dV5rWXFO4XDeQ+HSmg/2UtJIh7UG1fB3IpaPetwN5XJspCBRSZ
	gIOw8FGBW6AMkOB2uBNsX8RAjHK4YGNT3YvRK/bQs065dGt0hRighIvi4K46E4ymlItQ
	rbNb5JvjjwFjsqKd9DzHNSu6sYQYACLltZT8PYDZYmpQmnI0aAJisnwTKpykIuFUOHGv
	QUvMZ59Dvbiyd86oJETtvWNYOFnVLF8QDbgx4CA2bEA/rD6wauqkH+LZIZPruGp5y70W
	2bHZHiO/LtO5Iw3vUxMuULO5yhkQx5NB9woPkUlOg4sk/ufCcdC29m7MTe9K5KAXiK4z
	VbRw==
X-Gm-Message-State: APjAAAV7uQ4cV460ROH6bd+pzeQ47Tpj9modkahMb02zx/1WS6amhvNt
	PEXOTUg+YuvwbfzKsbsAMguUTg==
X-Google-Smtp-Source: APXvYqysBL7cY0n34IfDuKpOveKveXkd4OBXG735DA7B8IG1w0qn364Iyu0kO25/sBGhQYAtFJvBDg==
X-Received: by 2002:a50:9753:: with SMTP id d19mr15909510edb.143.1551715130816;
	Mon, 04 Mar 2019 07:58:50 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-D0BF-27DA-BE9A-269E.dyn6.twc.com.
	[2606:a000:1401:880d:d0bf:27da:be9a:269e])
	by smtp.gmail.com with ESMTPSA id t9sm2235237edb.13.2019.03.04.07.58.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 07:58:49 -0800 (PST)
Date: Mon, 4 Mar 2019 10:58:45 -0500
From: Tom Rini <trini@konsulko.com>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20190304155845.GP5026@bill-the-cat>
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Mon, 04 Mar 2019 15:58:50 -0000
X-Groupsio-MsgNum: 121911
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="95CBLwa+io9O2zXc"
Content-Disposition: inline

--95CBLwa+io9O2zXc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2019 at 04:11:36PM -0600, Joshua Watt wrote:
> On Sun, Mar 3, 2019 at 3:25 PM Tom Rini <trini@konsulko.com> wrote:
> >
> > On Sun, Mar 03, 2019 at 03:21:12PM -0600, Joshua Watt wrote:
> > > On Sun, Mar 3, 2019, 2:47 PM Tom Rini <trini@konsulko.com> wrote:
> > >
> > > > Hey all,
> > > >
> > > > As part of the packagegroup-core-base-utils series I noticed that
> > > > with rm_work enabled like I usually have, every build was starting =
over
> > > > with rebuilding linux-libc-headers and going down from there.  I
> > > > finished bisecting this now and it comes down to:
> > >
> > > Just for reference, are you trying to use hash equivalence? It sounds=
 like
> > > not, but I would like to make sure.
> >
> > I am not.
> >
> > > Also, it there an AB build that uses rm_work that would have seen thi=
s?
> >
> > OK, so I see I forgot a step that was clear to me, but, uh, not in the
> > email.  What breaks is for example:
> > bitbake core-image-minimal && bitbake core-image-minimal
> > That second build, rather than see "nothing to do" (or at least, almost
> > nothing to do) says "Oh, I need to build linux-libc-headers from
> > scratch" and possibly other stuff too, but that's the first thing I
> > notice.
>=20
> Ok. I've started a build to test it. Would you mind opening a Bugzilla
> for it and assigning it to me?
>=20
> For posterity, the poky commit SHA is adc37721a86c

Ah, so "poky" got me thinking this morning.  I was just on bitbake v1.40
(since I usually use thud, and that's the version for that).  Moving to
bitbake master/tip and I don't see the problem anymore.

Is it possible to have some logic within OE to check the version of
bitbake and throw an error / warning?

--=20
Tom

--95CBLwa+io9O2zXc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcfUs1AAoJEIf59jXTHXZSXtIQAJ9mKtvp6VWkgDbW7cFRkbbY
qQqgO2FrBquzVyFngDA5CN/0AyfwiBFB8tA6gLb2HwlLJLTo8O0s1xcm6gxWyKSn
d7FPf2k1mFaWcXZuhUH9lrwMy7xj1e0mRDZDDSz0UXVnCLKx69oW7GWfqfZE5WKe
3pDUVYCyBYktEt3PAVn2MifmSoK4jk9SEnxcBkf/Oq2NzYSqgSaWp+Gb6B6B08Mi
T6jI94u2ZKEHPE2dyAaMusju3jYItyawutRP6iRvk9+wFsMBNt9xGJsiYYQGPuUu
+InCYBlMtlB4oTzlejoBOmYyBs2G6q+K+UPyHOsW+V5KwAbJsj/2Brvb7IK7raKb
37YslHV9D0A1yZogBCNTvvxalz/F2PTPyp2Ux7I4VXja4eLGl8UavTwtMXKlaauu
j+rrGGu/iYy35tPBj5oEhYbLxYbRi0+38SOWn/M79Hfo5nEQ9Mq3kb3OiLukhX9i
KW31b95Bnj30YfO2JASBCksWKOjFZftg3+IeSSQsWJQYJDyFju4tbtmkxOLNtx3d
MpQsraA2oQQhHz0/MhHyMo6/I9DT//aVO+Fwjqf0rRxv9WZPAD3dyflICs44WR9D
j59PboEUYGlsGdY7Amt12Az3CcQ8AI0VQEyYiTIutuPixXByhEZtLZ8o2ZDsRPT4
cyejlTnNBvd3VLH5udew
=spzu
-----END PGP SIGNATURE-----

--95CBLwa+io9O2zXc--
