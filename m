Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 020D870248
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 10:20:15 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id x12so839779wgg.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=03U9oJ/jnh/LHnoecaiPdhIaYLJscma6Gz6RmoG4+xU=;
	b=jQlRo0wO60hCVqb6afuTu2oSG/3jZ5ZT4Pp7P5NnGvTVnlvkCVXgGjWIS8tulmJkAs
	G/VI4PkJCdDDejRS81cJqpKuxD3+oHgvpkFNBAM126Z21QkqeoWwAy1LQwQLdjzK2eAv
	pTRhiil4jeik06ko5kE7sXo+QWk/WiVTlxtgEasjzbd0YocUtW0/45MjHcOzwyP6iHmS
	vXyIGNybtdkHMzu8MuxVlo70vGfB96ifvYZcyEClD+TMWRcgF9Pm9nLVJ5wNewr2qWmK
	c9baQpsiYHB9tgNrz4DGOqP+umF8bSXLePswWdFc5xZVvUmQGwu/mC9GmKQYiDL3Qs8/
	iStA==
X-Received: by 10.180.81.234 with SMTP id d10mr3686381wiy.79.1405074012082;
	Fri, 11 Jul 2014 03:20:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	de6sm4254088wjc.16.2014.07.11.03.20.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jul 2014 03:20:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Jul 2014 12:20:13 +0200
To: jackie.huang@windriver.com
Message-ID: <20140711102013.GE2433@jama>
References: <cover.1404987090.git.jackie.huang@windriver.com>
	<3a19aa87a9f5d562cd1c5615d89486a46adea9da.1404987090.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <3a19aa87a9f5d562cd1c5615d89486a46adea9da.1404987090.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] postfix: add new recipe
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
X-List-Received-Date: Fri, 11 Jul 2014 10:20:17 -0000
X-Groupsio-MsgNum: 54782
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qOrJKOH36bD5yhNe"
Content-Disposition: inline

--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 09:57:56PM -0400, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> Postfix is Wietse Venema's mail server that started life at IBM
> research as an alternative to the widely-used Sendmail program.
>=20
> Postfix attempts to be fast, easy to administer, and secure.
> The outside has a definite Sendmail-ish flavor, but the inside
> is completely different.

Why is it sent to oe-core and meta-oe at the same time?


--qOrJKOH36bD5yhNe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlO/ul0ACgkQN1Ujt2V2gBzh/QCgn/vLjhX24MKrhxnbPXRkF4p6
WCsAnjcvFZel8+K/a4sCnTc0srHNb9dV
=TjjS
-----END PGP SIGNATURE-----

--qOrJKOH36bD5yhNe--
