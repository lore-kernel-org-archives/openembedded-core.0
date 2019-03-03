Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7A55B7CB20
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 21:25:19 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id h58so2633298edb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 13:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=80QcpbzMi02bLMKHGwPQaBU+oJJZYFpsIgU/DYT9llU=;
	b=dBZnidTzpHMZrkQaeC6bKKetxfMB7oHAD9srY9eK3F7LsXFmn5/ot++0ltSXY9Wzid
	3699bbXp7h9JhFp7GiR0QqNfaImWzysOzwzjLGslMb+uGVBmxnA9KcQdYniMUgXwRvdB
	JRbfxSgo2y0uEQM/aTXTINLI9hX4urc9joQL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=80QcpbzMi02bLMKHGwPQaBU+oJJZYFpsIgU/DYT9llU=;
	b=RrHo6ir1kUMDUlwZscJkHdYn/VCF8FIabhqL7A0FA9eNc9vmw2elvgAGdW1kCjvK2l
	uPJB+kGUqDwgoKKOlUa/+CCw10Mirg0jSqTVzQ0VYhgFggRHS+QsUYl+7hl3PM1tasto
	yIpt5oyICuUXdVu38oh1nNagOo1HB8rT2iAFbb8/FfB8zxe//zQUOhVuoun6OqRF0QaZ
	EI+92soLXHp8pTw7ItpCu9py6CXpT5XmrflKAwdYr24jmHT30ut3uFzyG4XGSGQ13qHm
	DuGZ8wpJcSch1m3bu9jDCXNHUUv8e3BPta9s+Xnbg94bXvAwSnpc5WCPIajtV+5uHQU9
	QaZQ==
X-Gm-Message-State: APjAAAXt9L/NaS/EHpSD+yf+YKKRCsvGgC3lvDdswRYWJQjXgZ6DY6Gl
	8eoGPa20BwKM86SLkcdNRqc+SQ==
X-Google-Smtp-Source: APXvYqxMQ/ONtr13A7u4kBfAW0yJjkRDGG86+tnbb/7Zh0HnaVdDVIXLLCn2UPYhWGmP6+F1kZ5YGg==
X-Received: by 2002:a50:89f3:: with SMTP id h48mr12829503edh.273.1551648319981;
	Sun, 03 Mar 2019 13:25:19 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-D0BF-27DA-BE9A-269E.dyn6.twc.com.
	[2606:a000:1401:880d:d0bf:27da:be9a:269e])
	by smtp.gmail.com with ESMTPSA id k16sm845430ejd.13.2019.03.03.13.25.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 13:25:18 -0800 (PST)
Date: Sun, 3 Mar 2019 16:25:15 -0500
From: Tom Rini <trini@konsulko.com>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20190303212515.GL5026@bill-the-cat>
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
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
X-List-Received-Date: Sun, 03 Mar 2019 21:25:19 -0000
X-Groupsio-MsgNum: 121872
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aznLbwQ42o7LEaqN"
Content-Disposition: inline

--aznLbwQ42o7LEaqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2019 at 03:21:12PM -0600, Joshua Watt wrote:
> On Sun, Mar 3, 2019, 2:47 PM Tom Rini <trini@konsulko.com> wrote:
>=20
> > Hey all,
> >
> > As part of the packagegroup-core-base-utils series I noticed that
> > with rm_work enabled like I usually have, every build was starting over
> > with rebuilding linux-libc-headers and going down from there.  I
> > finished bisecting this now and it comes down to:
>=20
> Just for reference, are you trying to use hash equivalence? It sounds like
> not, but I would like to make sure.

I am not.

> Also, it there an AB build that uses rm_work that would have seen this?

OK, so I see I forgot a step that was clear to me, but, uh, not in the
email.  What breaks is for example:
bitbake core-image-minimal && bitbake core-image-minimal
That second build, rather than see "nothing to do" (or at least, almost
nothing to do) says "Oh, I need to build linux-libc-headers from
scratch" and possibly other stuff too, but that's the first thing I
notice.

--=20
Tom

--aznLbwQ42o7LEaqN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcfEY7AAoJEIf59jXTHXZSnmgP/0g6WUEgH6v+jEr1Kp5lrqxs
dITZqYX49GOE8+4e8UnBokocNTAyvzqb7b9zbo+JLAKzlTJ+NpwoZnWrhRsmFarK
Vnh2VZdsKqv4AaqXQd0czopc9szvlUKp4NzYlk8z/omDgZNcB0K8Au/mf0wAdjlO
38H4niTV8Rx7qWMcYlSae0y1NWgYwlMEs4285tkuKDifVX0M1TVnsx4jJBk5U2aI
WiX3Fp69RS+7M3fjaHI2I+C35aK2PLBgTjaoBtHUlxAu4Yl27zruh5VnAhH/NOzq
63XTuksg5DOqg7kTe4q4PJuU3L1x0g8uXG0CjObiurJGU9Oiyd/WrE+hUsLZZD6C
3EwE3cMVQY4NMWtQEktFVtlTpP/aN1GxTYj3FB5uy8VDCttS8A00lItRDAUSY9lM
yP3tSp9gz6tKQlpdaYUFOW2H8E4q29PJzzhiijVDX/hFM0sBWfqBCMLfSrCPSmik
5T4I1B9s68eNcE6MOxJf4Mb2JlHoe/ozeGCeaRD2628okYHsy3JVckPk6VT7cYs3
Phh4rOcImq0xng+4L5C7mqTiz7z8nRUndmcsDrRhMIItqcU820by5fgQfMN9752n
BtNmyPrUNVpMLsEI127aXDjNAq0VRry8WPhOKdKYZPT9c4LTRzwiCyDDXg6GAZax
L4yYlPG98xVWiifCDncJ
=ogzO
-----END PGP SIGNATURE-----

--aznLbwQ42o7LEaqN--
