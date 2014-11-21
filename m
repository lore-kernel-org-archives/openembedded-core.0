Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 14701721E5;
	Fri, 21 Nov 2014 14:38:36 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so6782116wgh.34
	for <multiple recipients>; Fri, 21 Nov 2014 06:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eC460eSotBKZt9ddLg37Oj4fRR69tHYPdAtrfTwjgQ8=;
	b=KqHT8KoLbBzutK8cO0U0myK8TzEWgXhNj5rMOuzU4GNBqf1j4iT/oYFGYWa7065rMv
	7Yj1m0EOakNoi//xO/IaT4GHV2QX5r59/N5XN3Mg4RkXmzvWDo8R2DvkGv6qqF1D2hPS
	8+qUlhxZE8HDq7lCgEQaTn2hHS21e3UnrkYhpz4OGzZMUcHzsr1dERU6QXwaRuGfUHek
	W0DVvkpny/BLezXbiinkN3N/LXFKLYotrj8pXVYgWFulanBKw1legljp2qqueAR4O5DB
	gt1MLq5rvQ/8B2ts81Vm2nGrCkE/sPa/MadLP5Qz7eazTxIy5tGV2qTU1ZEr8agOrVnO
	0BSA==
X-Received: by 10.194.81.6 with SMTP id v6mr7915269wjx.39.1416580289484;
	Fri, 21 Nov 2014 06:31:29 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r10sm8977219wiy.19.2014.11.21.06.31.28 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Nov 2014 06:31:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Nov 2014 15:31:31 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20141121143131.GL2163@jama>
References: <20141112153903.E7E7F50273@opal.openembedded.org>
	<20141121140133.GE2163@jama>
	<CAJTo0LYjQqu-VWVrmTU=6BWm8b6g+9yOiv=xcMZLquJ3jEbLaA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYjQqu-VWVrmTU=6BWm8b6g+9yOiv=xcMZLquJ3jEbLaA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Ross Burton : vala: upgrade to 0.26.1
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
X-List-Received-Date: Fri, 21 Nov 2014 14:38:41 -0000
X-Groupsio-MsgNum: 59824
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WkHPBKJ2pKcVUM5H"
Content-Disposition: inline

--WkHPBKJ2pKcVUM5H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2014 at 02:04:17PM +0000, Burton, Ross wrote:
> On 21 November 2014 14:01, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > > vala: upgrade to 0.26.1
> > >
> > > vapigen can't be disabled anymore, so remove --disable-vapigen.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> >
> > Was this needed and tested with some real world applications?
> >
> > Or was it tested only because package index was showing possible
> > upgrade?
> >
> > Causes couple failures in world builds:
> >
>=20
> Yes and yes (the new rygel that I'm about to submit to meta-multimedia).
>=20
> I don't have those layers checked out - are they failing because they want
> a specific version of vala, or some other reason?

xfce4-vala fails to detect libvala version, other apps are failing in
valac so they need to be updated to be compatible with new vala

See logs in:
http://lists.openembedded.org/pipermail/openembedded-core/2014-November/099=
113.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WkHPBKJ2pKcVUM5H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRvTMMACgkQN1Ujt2V2gBxZVwCeJnshls7ACMrGSZDkY1+ZLrs+
RigAnjewzc+BwwjLFr//fYNtbpRO9QTP
=a6wO
-----END PGP SIGNATURE-----

--WkHPBKJ2pKcVUM5H--
