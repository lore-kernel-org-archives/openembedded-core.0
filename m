Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF677C3C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 22:47:06 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id l20so524475ybl.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 14:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=w1b9exAaYdmAQaaKpWSSxQr8nviapSrNJsm9SiBLaGQ=;
	b=JhcW4Y66rFosOT/PkGLZk8wI+yLO3M+7xEFNF9LRkFlu8aGkNA7+ZtW/rdLupJeSb+
	jUDlkYzjcicotbvn9bWc3hqxlrt56zZQkLZScuVDC7CVBN535qzMUtwPJHzod1wbvIB+
	hXyF1sJaStMD/yz3fRVbpeGmxkNhsXA2a4Jgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=w1b9exAaYdmAQaaKpWSSxQr8nviapSrNJsm9SiBLaGQ=;
	b=NYErRP0CXqBH9xBwOReqHzyhfWNCnuIEkOEpHwajSzhmLOEFQyRwbzeX+D7jt4fXYP
	0OrB0WW6JdMdLAm0cxOfQNE/+A3lpag6pW+lq94oA5UymMaElSL0nS14RhR5w1l3WXOC
	wjZGFVa8B6CToRyhuXe03qfBT7kG3pGUhSQ4aA24R7WmR5873puHsK0drcFOcQCtJgqQ
	xsbAs3EXgXdZ+Ycaw9vomvr3YbkfptDX4Or/vCu6AsPNKIo47ig/4kjSFS0rMqIJK1SO
	fQ1z1/SE9Dn97DRflFS0tt5Ns37HyKdlDKYKYj/u3nQnl5geGoRDHfrOrPkYg80qeylj
	/fkw==
X-Gm-Message-State: AJcUukcWaY6Smu0dbQuKm/QpyvQvaL/pdW7X/9te2C+WTpY/M47NgXtO
	IvyoUZqTIueImF5WNWc0G2BzFg==
X-Google-Smtp-Source: ALg8bN4CjtjPgUdvaLsC6vxOtAu2tSXFv+buo6eTDKyq+FwVNQzeQMZcZ7vzlDoQzf7iAZaynub+BA==
X-Received: by 2002:a25:57c5:: with SMTP id l188mr30940697ybb.43.1548888427316;
	Wed, 30 Jan 2019 14:47:07 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82A1-BACA-3AFF-FE98-1ABB.dyn6.twc.com.
	[2606:a000:1401:82a1:baca:3aff:fe98:1abb])
	by smtp.gmail.com with ESMTPSA id
	j134sm923630ywb.91.2019.01.30.14.47.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 14:47:05 -0800 (PST)
Date: Wed, 30 Jan 2019 17:47:03 -0500
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190130224703.GO30838@bill-the-cat>
References: <20190130093406.10391-1-bunk@stusta.de>
	<CAMKF1soqAE8aco2OAHiQgfpV_5_OccnH=piXBtVii3f6TVwXGg@mail.gmail.com>
	<20190130203129.GB15086@localhost>
	<CAMKF1sq6Syjj5D3YT463z+d4NiVRaFNmTvM6gww5npLGvWR9nA@mail.gmail.com>
	<71ec0253d1285a927601d9a33c860d5b856a83f1.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <71ec0253d1285a927601d9a33c860d5b856a83f1.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: add devmem
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
X-List-Received-Date: Wed, 30 Jan 2019 22:47:06 -0000
X-Groupsio-MsgNum: 120719
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="t3wCcZxwnWQbJWrM"
Content-Disposition: inline

--t3wCcZxwnWQbJWrM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 30, 2019 at 10:31:58PM +0000, Richard Purdie wrote:
> On Wed, 2019-01-30 at 14:18 -0800, Khem Raj wrote:
> >=20
> >=20
> > On Wed, Jan 30, 2019 at 12:31 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > On Wed, Jan 30, 2019 at 08:50:02AM -0800, Khem Raj wrote:
> > > > On Wed, Jan 30, 2019 at 1:34 AM Adrian Bunk <bunk@stusta.de>
> > > wrote:
> > > > >
> > > > > This is a tiny but pretty useful tool.
> > > > >
> > > >=20
> > > > question is, do we need this enabled in default config, or could
> > > be add it via
> > > > some DISTRO_FEATURE meant for validation etc. May be if you
> > > explain your
> > > > usecase then we might be able to make a better assessment.
> > >=20
> > > Sorry for being too terse.
> > >=20
> > > devmem allows reading and writing hardware configuration registers,
> > > which is useful both for debugging and for scripts.
> > >=20
> >=20
> > Thanks for the info this seems useful can you also report how much
> > does it increase size of busybox=20
>=20
> One reason I'm a little nervous of devmem in busybox is security attack
> surface. You can of course argue that there are 101 ways to mimic
> devmem so this isn't a concern. When you consider some configurations
> can have suid busybox, it becomes more of a worry. Our default
> separates out the suid pieces for the attack surface reason.
>=20
> It is useful so I am torn but its worth keeping this in mind...

I would also ask if we should be enabling more stuff in busybox, period.
Customizing busybox for what you're trying to _do_ with a custom setup
is one of those top 5 TODO items with making a cut down image and
customizing the kernel config.  Outside of -tiny and initramfs/similar
cases, there's not a great reason to use
almost-but-not-quite-complete-busybox-applet compared with the regular
app.

--=20
Tom

--t3wCcZxwnWQbJWrM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcUilmAAoJEIf59jXTHXZSKbEQAKHwTvyzJhfhLWEHi1nzxOfi
cMX7j+7mmTIMcNWww7Xy+3n+boiEoLymAAZL0xaV9VpuE1aBgl12NPZxesyRQ4HY
rk1AaB4m3XqRehXg3DnjlwgMNiuNT9rhRy5OJahpWdNqTXqz2qCIO3PmJcBSMz3M
rdTICDZ+taCVv0Spfeyv9pCYgOwb9MNO4901UWyFZ0j33mI+1SWuDgRGQwGYAHgz
WOj3K1dY8qAyJDDRolSrixMmWF+tik4QksVc3or/blqLzghrecOcBdN+Jqt/hWyJ
vw0Ql6JxFCa4urzB9j2V958lmHY5btDGPvyo/wd0xVMTHX1wUg4FqDoaW5FbnlK9
r/joDItmUZLuxinEnnB66JBPNcwhnWHhHbDeUKlqYV68FYGiHzvwQt34r7RcCsu7
O4dhDDnsD1/euPX+EcbJ8tBoqFf/+3ao/igfbR7sZe4TpT3l2lgxgIbjZDRDbs9S
vFTZuyNuHU7AdlSm4zKqE+2EtpvZJiG53frohOkFt+A4wfDLMYq5NRNEHo5pAYvq
5HBbeYwZcNRtOc8v+tTYmvs0e24K/obYMAyY7Td5DZ/yQedX0LUg9zZb4OVrSFQj
EN4oTOIEQ6hobfLTBHRgAdaSEvut1enDGn7WNDEcFXLsoH36MlcZ6CdGkn9/KnyB
hgxWTUoRjZeMMsFzK6F1
=99X6
-----END PGP SIGNATURE-----

--t3wCcZxwnWQbJWrM--
