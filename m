Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 33A08731C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 14:59:51 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f126so91454326wma.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 07:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PUK08g2BamY/eGwS0RlYtCzIxxQZ3YUXrEfgmO7f5gA=;
	b=SM1DBbSqC/fj4SGKrqnC1PNYzRM2fYd/byzG6lKfjDLPe2UlwDKAtTSASWmzYxiy21
	ZbFWV8tuT99vj+kHFmNuK6n6o/B8Q9Dfrs2DdFM5q1V37hvSTzNpzPLtXSPQFr4YsdpQ
	un3GInTQvz7pvnLTg+iDEYdKY6UnKGnvRTev6GTs3IMOu4kh/tpVz6KX4nkO1fPpstFE
	ZHvkXeeKvtfhB7z/Iww1BOMAhjGTrM55Sioo+feMfqykP1fqvysouRdp7m2uvQfdfb+X
	t6eW4l0tmMmjX3xUYcOewTYsfXsXiOw2FDJDrKnoUHfQq2SVZtxZrw0OcC8gCqeOgn+j
	z+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PUK08g2BamY/eGwS0RlYtCzIxxQZ3YUXrEfgmO7f5gA=;
	b=X7FNEkdeoMYxjEclu/M8tTB8mHeGXKdGV1qccQ1XjNp8yaukcHwMjhhsljCOXsmn+U
	i7jtFBkfn8lYO05I007LoOXnuOEzW4+QZtaoZnum9Z4ZDwYUmzRv44JPSKoekUXDFGqW
	dUpBOQWhWolfdngeRGXBjEbbebdp0t9oZNCfaWtcBlAsYGyVvuFfGNHzd67iAXqkyO6M
	akan4D21zbYR4pzDi5hmiCNdnzLfhdr1zoSeQez8P0fplB8/Qk2std7I5Zks3qVU0WZe
	/0haB8U27WL69l4uV08PyFzj0EL6ahHCwxAzWXWKI263njkR53W07nOncKd65I/7FRlp
	jmwQ==
X-Gm-Message-State: ALyK8tI0G8Lm5kmbhUio2zSldnfPE/uU4aHoWxD66Ge0U70Yb9eXeqf+LXPuPHPtmofiZA==
X-Received: by 10.28.9.139 with SMTP id 133mr9076786wmj.93.1466607591902;
	Wed, 22 Jun 2016 07:59:51 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	zb9sm27982154wjc.34.2016.06.22.07.59.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Jun 2016 07:59:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 22 Jun 2016 17:00:11 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160622150011.GB4153@jama>
References: <1466503279-28937-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20160622144241.GA4153@jama>
	<CAJTo0Lar56vj6VOo097yhbTMtAx78PsS7kU3Yeh_7xb-XpBy0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lar56vj6VOo097yhbTMtAx78PsS7kU3Yeh_7xb-XpBy0g@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: remove the extra dot from the recipe filename
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
X-List-Received-Date: Wed, 22 Jun 2016 14:59:52 -0000
X-Groupsio-MsgNum: 83739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Content-Disposition: inline

--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2016 at 03:45:27PM +0100, Burton, Ross wrote:
> On 22 June 2016 at 15:42, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > WARNING: e2fsprogs-1.43-r0 do_packagedata: QA Issue: Package version for
> > package e2fsprogs-locale-uk went backwards which would break package fe=
eds
> > from (0:1.43.-r0.1 to 0:1.43-r0.0) [version-going-backwards]
> >
>=20
> Have you checked what opkg/rpm actually think about this?  Maybe the sani=
ty
> test is broken.

No, but opkg-compare-versions from opkg-utils thinks the same:

OE @ ~/projects/opkg-utils $ ./opkg-compare-versions 0:1.43-r0.0 \>\> 0:1.4=
3.-r0.0
OE @ ~/projects/opkg-utils $ echo $?
1

Also note that EXTENDPRAUTO is reset to 0, because of PV change (which
is saved by RPs PR bump).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldqp/sACgkQN1Ujt2V2gByMDgCgi/vn0PPZYUk0RNsdPgKmAjta
jtwAnRbg3xXatHurkTqpvKHGyCxy8LHB
=P6ze
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
