Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id D4ECA7E387
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 14:49:24 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id h21so2507949qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iC1QIeRk8jNHThVm5uZcZHvWCzomso8/M4Y1okwy4/4=;
	b=FRxmdgO+kG68w5B95bak/UtifDb9oUv1h8w+GWF7vPEdKgnIiNtJSRUg1uxzq1Axi+
	hhBnDUNHl8mlBcEJOfpxq+GumOs0wa8c4Zs77FX9Yn/0nXBLTDtcd1LeoU7U8SZ/1hDZ
	1QZRzHRcnza0IaEjkbd2BEIc7aUdO4SSkmJVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iC1QIeRk8jNHThVm5uZcZHvWCzomso8/M4Y1okwy4/4=;
	b=ud+/uINz7ntsuhiPPQ4zdOvp9/x1ha0wLp6XSXUvV9TnSSO9DezET//z1DD5FumzoQ
	wYoyNjgg3V1AYYY3RmjxFOnzGVHXKP/gQHLjKWssS397KW7QgAWp7JHTq+735nhB5WFZ
	YGIMAUu1oGDAfmG85AseY3Z2FrjBwr3I5TDUIEUd1dvIP0hymVXNo1oRkEYW9OPpnYwG
	O/f9RoTb3eWJIbT3pV9dXoua4If5BLS429F3HFzkdUHGpwDI2/zqqEOMWuGXN88vhkQR
	cJCRHnJT03Pfquxx3iYeRqz7m1whKFR0gW+JCU+VXxoixA/D0dBxNdKIkTMnmZzUkMWW
	6ffg==
X-Gm-Message-State: APjAAAXn+RWtUb3zPSje8mbKbjtjft2NVrVdevBguGVeUL+2wB/oVPRj
	JIqjDyC0Hpqy/yeyOBO/yjTkrA==
X-Google-Smtp-Source: APXvYqyQbfZBaDzP6UAPQPrcu5LI2Dcixjm3QlAvnVBJwV48prYpJoNIpFzTEQ7zYYVhbw/rEk1RJw==
X-Received: by 2002:a0c:a908:: with SMTP id y8mr43974418qva.14.1559918965413; 
	Fri, 07 Jun 2019 07:49:25 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82DE-FD52-FD6B-B067-DDD8.dyn6.twc.com.
	[2606:a000:1401:82de:fd52:fd6b:b067:ddd8])
	by smtp.gmail.com with ESMTPSA id
	w34sm1232387qth.81.2019.06.07.07.49.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 07:49:24 -0700 (PDT)
Date: Fri, 7 Jun 2019 10:49:22 -0400
From: Tom Rini <trini@konsulko.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20190607144922.GN10942@bill-the-cat>
References: <20190607110502.31175-1-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190607110502.31175-1-ross.burton@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/filemap: handle FIGETBSZ failing
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
X-List-Received-Date: Fri, 07 Jun 2019 14:49:25 -0000
X-Groupsio-MsgNum: 125485
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QFYA38BK7dvhx8Kf"
Content-Disposition: inline

--QFYA38BK7dvhx8Kf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2019 at 12:05:02PM +0100, Ross Burton wrote:

> Some file systems don't support fetching the block size (notably the file=
 system
> Docker uses for containers), so handle the iotctl() failing and raise the
> expected error.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--QFYA38BK7dvhx8Kf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc+nlyAAoJEIf59jXTHXZS3FcQAJx65gbDy+sSqwOOsACEssiC
j7h5vLKJfgA6pAEfjv+c4UBoXc6Q/9z5DfpDV1yJlmYD1b6pL5+Kwqg6lESLkOFO
lkE/AB7bfv7Kl+8PZgRh5A8SdBfkoHbOgGQDuNRhI4S2u5PiXm7Tb72Q/EJie5TG
cL7F5b0DjBmhylhhLls08uYriexKuzj7kx5Ooiw9ropsHcZT/z/YIzdXbvZNEehx
qvEaWKbRhGc0t5/BIMHR0Oy/epCjNOV+GYuN3MOq0qi0xHZ32taWIoFPdH/yTgtF
JHNGw8JfLdiUbf2LWwl6MO6HfXS2b+sz38o1941vKxh48PVLcDA8ZjGw94MnGvpe
lUAwmXSj3mpDEb0yfZ3M1BspnJtfFnG1/emhHGJRXZlS7oEdFzpRPvFPz6zgDaf/
HDIGZM4hSQIcoLuN38rI8qdJ6cTUFC6LM6YLIuTEoIfO8p2COGjk86Xo9vhk8QYx
XPOPdB3AjZPpMlVgFZvR5WR0KEaETXxo4BR77lnbYVB4JXlwVuy5v3R4Q3LJKWOk
im1tPfvOUff8jRBAZtxXZliC7YJYz1C4xshc6hDMmzKZxs4G6AWNKHhkJMhIa50M
VUk9v11DX28IStDgOtIcpTczjoooFjuVF3f/AM8cjcwid6HKXwlBYDGW6GnFj+fe
9Nw0z0WNSzdjM3erjI+p
=KYSW
-----END PGP SIGNATURE-----

--QFYA38BK7dvhx8Kf--
