Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5E9DF6D125;
	Sun, 20 Oct 2013 13:04:01 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so2899873ead.19
	for <multiple recipients>; Sun, 20 Oct 2013 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EA0d8O0ZQj6qP/qv8DnOcy+LQC+ANHyI3ZD+r0h+2GU=;
	b=vGMno5tzAPXcRUttnTf3SkVrP7iU0fMsGJsY7zvncV/Kz5BwQvBngBiAfis2C8rB2w
	o4ihFYly0QpFzWfx7P995DHH/WALmvel88p67b/VWeIb5LVQhGxd64H24NDpPAe7JRbt
	xhqYYJJRfV+ZehiX7vExc53UqvCxUK8ZLyzTSOhViiZ5gl03B+onyfXDWwRWfwHBoh07
	VaQig8nJiKkSKxlfwWlVvk3oFJWi3BWempGPO2mJxWuBYUcgSk8A7d1SVD6ZBlPaXYOI
	lOSyybOa2z+oOePufPumSvpnZybVxW6PKzr2Q1d9mSN6SVo3CU2DQdyGudq13fkn5pKs
	OSQQ==
X-Received: by 10.14.103.69 with SMTP id e45mr2355849eeg.51.1382274242545;
	Sun, 20 Oct 2013 06:04:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-36.net.upcbroadband.cz. [62.24.80.36])
	by mx.google.com with ESMTPSA id f49sm30448019eec.7.2013.10.20.06.04.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2013 06:04:02 -0700 (PDT)
Date: Sun, 20 Oct 2013 15:04:02 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20131020130402.GA29181@jama>
References: <CAMKF1sonakYiB++QeeeXKVztx+7CKW3zn=ndn=kP+kSVmqu3Qw@mail.gmail.com>
	<20130919120202.GK7313@jama>
	<19D9595C-FE9E-4E24-B249-D32F62F25EA2@gmail.com>
	<20130920114815.GI18414@jama>
MIME-Version: 1.0
In-Reply-To: <20130920114815.GI18414@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: patchwork updated
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
X-List-Received-Date: Sun, 20 Oct 2013 13:04:02 -0000
X-Groupsio-MsgNum: 46064
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2013 at 01:48:15PM +0200, Martin Jansa wrote:
> On Thu, Sep 19, 2013 at 09:11:50PM -0700, Khem Raj wrote:
> >=20
> > On Sep 19, 2013, at 5:02 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >=20
> > > On Sun, Sep 15, 2013 at 12:32:44AM -0700, Khem Raj wrote:
> > >> Hi All,
> > >>=20
> > >> The patchwork has been updated to latest. Please keep an eye if you
> > >> see something non working let me know immediately.
> > >=20
> > > Hi,
> > >=20
> > > something is wrong,
> > >=20
> > > http://patchwork.openembedded.org/user/bundles/
> > >=20
> > > returns 502 Bad Gateway for me and I cannot access individual bundles,
> > > which is very bad, because all oe-devel patches are separated into
> > > bundles based on layer.
> >=20
> > OK. I have created a local fix for it and also started a discussion on =
patchwork ml
> > bundles should be visible now. Let me know if there are further issues.
>=20
> Thanks for quick fix, it works for me now, but maybe not for others
>=20
> Bundles main page
> http://patchwork.openembedded.org/user/bundles/
> as well as user bundle (this is "in-test" bundle)
> http://patchwork.openembedded.org/user/bundle/79/?archive=3Dboth
> work now, but public link for the same bundle
> http://patches.openembedded.org/bundle/jama/in-test/
> shows 502 Bad Gateway
>=20
> Can you check that your local fix can be applied in last link as well?

Khem, can you please look at it? I'm trying to get layer maintainers to
check and cleanup their bundles, but that doesn't work for them now.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJj1MIACgkQN1Ujt2V2gBw+KwCgntRbcfqBU0wyPjvZRr2yplGW
QNoAn1gzW3UvXLNeACEM22q8xDojX/Ma
=vyuf
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
