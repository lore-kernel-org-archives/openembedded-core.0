Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3C07027F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 10:25:40 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id cc10so555262wib.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 03:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RiGgwRjNhtkCHlvzkRqnGYzrFETcorqn84FR3vdSPMw=;
	b=zlLwfe1IUczhUlKdnROipu76Qk0B5CtFWnTub4e96aKo3PHcxundNfml2TcxXXQkPO
	fsL5z7ma/fx1YcaRbi/0GmVjh/pPtH6GvQYHnGS5ChZah7HfQBLFxvnRhLgkEfN33qqG
	dYMmOhpmhuU3y4qt8h54qc9CXBxqR9t5lidpr/mStEt6cpNZwCi83zJKdhD3+7D12UFv
	gP2iAvIeEjpHOaUoWBWU4wZ42PkDNc9P4tqQcE+4r4/LECMW8MtBFufRLIH19PnoV+Ri
	fjJ/QmWMn/djCAq0d1lY3LUJ5xaBFvzDaGC+bPLpuqeU31HjCN9YyE7ghwHSn58ykr3V
	Lgxw==
X-Received: by 10.194.85.78 with SMTP id f14mr64741546wjz.36.1405074335372;
	Fri, 11 Jul 2014 03:25:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jv9sm4270035wjc.28.2014.07.11.03.25.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Jul 2014 03:25:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Jul 2014 12:25:37 +0200
To: jackie.huang@windriver.com
Message-ID: <20140711102537.GF2433@jama>
References: <cover.1404987090.git.jackie.huang@windriver.com>
	<3a19aa87a9f5d562cd1c5615d89486a46adea9da.1404987090.git.jackie.huang@windriver.com>
	<20140711102013.GE2433@jama>
MIME-Version: 1.0
In-Reply-To: <20140711102013.GE2433@jama>
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
X-List-Received-Date: Fri, 11 Jul 2014 10:25:43 -0000
X-Groupsio-MsgNum: 54783
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tmoQ0UElFV5VgXgH"
Content-Disposition: inline

--tmoQ0UElFV5VgXgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2014 at 12:20:13PM +0200, Martin Jansa wrote:
> On Thu, Jul 10, 2014 at 09:57:56PM -0400, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >=20
> > Postfix is Wietse Venema's mail server that started life at IBM
> > research as an alternative to the widely-used Sendmail program.
> >=20
> > Postfix attempts to be fast, easy to administer, and secure.
> > The outside has a definite Sendmail-ish flavor, but the inside
> > is completely different.
>=20
> Why is it sent to oe-core and meta-oe at the same time?
>=20

I'm sorry, I should have finished reading whole backlog before
not-sending this.

I agree with other reviewers it's better in meta-oe (maybe
meta-networking?)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tmoQ0UElFV5VgXgH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlO/u6EACgkQN1Ujt2V2gBxVaQCfbWKSp7uLY2T4eQ7X8Z1KuXbF
aqsAoIQ0OUGy19f+90x4H2XopZDZ+jzJ
=BvGx
-----END PGP SIGNATURE-----

--tmoQ0UElFV5VgXgH--
