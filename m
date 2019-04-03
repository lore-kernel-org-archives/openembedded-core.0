Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5007D369
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 14:41:14 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id x14so15166554eds.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7889NLI0s35grXq1VYGM1Ulq7Z0ewFiYzH0BLVVvfB4=;
	b=imZ9ypxcftP+LJk5MPzVJXNiKU7pcLfWtQQ+s3dQsjLnk299jQVllks9Psn+EbY4vf
	rIQzVNcJOwZb1I14cQy0SH4Z8VZPYIMD9KrUyvO6x0iT6Z1X+msOPWUOgfLSx/pt06Y5
	sba6YcrFtMFrjGIybEjzyrPn98MOS3ACUxygc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7889NLI0s35grXq1VYGM1Ulq7Z0ewFiYzH0BLVVvfB4=;
	b=k8OpGtjNEys1/jzU+nZS1mZp7tPFFJd8oD6qHWwRCeB3G9xoEJ+0I8SqD/U4aFlz8+
	7IeWZKvUyybANvLwLi7Xe1uxOgjdn14JJSJPlNCZsNVpnol+PZ5dgDC6AXnwaXvIH00+
	amkcnDk5mwCuvDU2oEitjrzx9p52bFA/OJXJBOJ2EzpDfrT0C7yBqYAzGKP2GsQaRILe
	7YJ2g421pEUU0iPCypp7AjX7aNveS1pmc2fETbA2f8t/p1RsfwhgcesVA+PHfS7251WG
	KzL8DKiQqxqjkDXDvd49GLUKoEzakvglnuMvqJ+OYpeTuthd4nM41Xleu8nVSov/1IL0
	l0gA==
X-Gm-Message-State: APjAAAU8Buv890c+c6lDCap/I1fnNdn5qCQeooyVQQ50+roTD/XK/m+L
	dfWw6QySBuH0WcZYDmoUKQsbvw==
X-Google-Smtp-Source: APXvYqyvPh0Py7FXIAzV5WrzrSAhrD/eCtk0FYF+ZzRbB92wvosWvhE1aY2jTvmEvhGoE2vS9ax6MQ==
X-Received: by 2002:a17:906:4f83:: with SMTP id o3mr76696eju.188.1554302475135;
	Wed, 03 Apr 2019 07:41:15 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id g3sm3067440ejp.31.2019.04.03.07.41.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 07:41:13 -0700 (PDT)
Date: Wed, 3 Apr 2019 10:41:10 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190403144110.GG4664@bill-the-cat>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<20190402065121.GA31468@localhost>
	<20190402194614.GY4664@bill-the-cat>
	<CAJTo0LZ5qeDA+rQ5Eh3_LCbGtQyo732LrDkiZ=O4sh52cjXU=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ5qeDA+rQ5Eh3_LCbGtQyo732LrDkiZ=O4sh52cjXU=w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [oe] Git commit process question.
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
X-List-Received-Date: Wed, 03 Apr 2019 14:41:14 -0000
X-Groupsio-MsgNum: 122995
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J1ldk4ymECC/Y9sn"
Content-Disposition: inline

--J1ldk4ymECC/Y9sn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2019 at 11:30:39AM +0100, Burton, Ross wrote:
> On Tue, 2 Apr 2019 at 20:46, Tom Rini <trini@konsulko.com> wrote:
> > > The kernel does not have "upgrade foo to the latest upstream version"=
 commits.
> > >
> > > With the Automatic Upgrade Helper this is a semi-automatic task, and
> > > most of the time there is no specific motivation other than upgrading
> > > to the latest upstream version.
> >
> > But since that's just filling in a template the body can also be a
> > template perhaps with useful AUH data (run at ... by ... ?) ?
>=20
> Apart from making the commit message longer what does this achieve?
> The commit already has a timestamp and author.

It's an etiquette thing.  Subject+Sign-off+Empty body is bad form.  AUH
updates are a form of "trivial update" that every project has.  "Update
$X from version $Y to $Z" is what a human would normally put.  It's
weird looking at git log of nothing but subject+signed-off-by.  I'm not
going to object further on this point, but I don't get it.

--=20
Tom

--J1ldk4ymECC/Y9sn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcpMYFAAoJEIf59jXTHXZSNM4P/jiot9v78SXY7AC4hLN3E/0t
/VkrNGTD9THD1r76eurhrpyzvQ+jipTlJoaepp3ZtUdKc9kg50SM+nlfo25NnmzE
S4n5QsCqH41oHj+t2AW6xikRhOifOvbilsFH9HSGW4mppJNCsU7BJ6gm9xb+HS2F
GCKZknUNCrV3VTNBRyJBt1gRJRBhLU47aIoF2JlY5QXBcDDaEfDKE0Nm05ABoIev
4bLyEjzua6YTngNpJnoGyiAMAZQVVlC/pNAlHSIpRSGLoYONjDUm2d7AfNmhnf2n
GFrea2lhOhPN8VtbQPcKqxdEhYcALXy6+OHJeH0giTNH2NcZxfs9nSRzftKlSdON
/V3X1oYfiXKnDnz1eLSkGhxBUYlwUEiQSmWkiYgROvXNDCw8iYT7WtcXuTl/HFJl
3WDiM/FmF6EsdpLUaIS9kezz49Z237Y+LlMuOuR9jwBxTUNiYrg1wgOlIIeH7GKL
H5PbYOe3LuqwIsHuDWpdMeUGD3SmkiNhB7C+sUyicN5Xgy8SxdMiE5LJ/rqyeh2m
a2t+il0iT/UhAARjpweiRbCpLY8NpV4FRb4RTwJa+8EAB++CeiBdLtKQrdrXn2+F
3edSJehcr7kTRLmbhnpqVez9l2cCrRXxQSnVU8IlvPdYYwrY3mo3NfyI2/fShQ5x
DThFd9nYeXvzBD20F2Hc
=4enG
-----END PGP SIGNATURE-----

--J1ldk4ymECC/Y9sn--
