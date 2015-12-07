Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5E10160124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 23:07:40 +0000 (UTC)
Received: by wmec201 with SMTP id c201so7460072wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 15:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7W60Q05w5QvHQ7r9MHnU23VPH01mZhjCU6RKoVtNsPg=;
	b=fEf7nba1N2LgFDOqKW9YivgQcDZJheQ/+wJXnoxSs/iL8k1Tg1iuMrtuxgCYj8xC09
	ekJS6d2NIM1cBcjOVCIocxfAu1+pi7eYzJ2eRwY7XeRUAlUNtqMU0zhhksw7OHR3r5yD
	Uxn51L3+4DfpuLq6WctIl/l15HkdnGmD7bIkJAqBN6izJ+e7mF1AKVm74ulGb3yjNMxn
	2t1kII5XHZoPbbmxIQ6T5CicwSstOg/PoGNqxkys8fLnx9e/WQbhMhyL9Ltch6HEg6mT
	iqhlhB6XeBdW4TgAs5eVvZYcHlAFoDx6xN7rmfpLEuD/bDnqmm+/edau3Xg6+xne6k2/
	kmaw==
X-Received: by 10.194.59.108 with SMTP id y12mr263397wjq.33.1449529661266;
	Mon, 07 Dec 2015 15:07:41 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id uw6sm236146wjc.42.2015.12.07.15.07.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Dec 2015 15:07:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Dec 2015 00:09:12 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20151207230912.GD2249@jama>
References: <1449042969-24132-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LZmao029oQMnK8=5tOZn0FPkAzvCjez-CkOCNG_oCY7rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZmao029oQMnK8=5tOZn0FPkAzvCjez-CkOCNG_oCY7rw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Chris Larson <clarson@kergoth.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Mon, 07 Dec 2015 23:07:42 -0000
X-Groupsio-MsgNum: 74427
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline

--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 07, 2015 at 10:56:48PM +0000, Burton, Ross wrote:
> On 2 December 2015 at 07:56, Maxin B. John <maxin.john@intel.com> wrote:
>=20
> >  meta/recipes-core/jpeg/jpeg_9a.bb                | 29 ----------------=
---
> >  meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb | 36
> > ++++++++++++++++++++++++
> >
>=20
> (CCing the usual suspects who will notice and care about this)
>=20
> I've just noticed that this means that when the binary packages are
> debian-renamed the version goes backwards: libjpeg-9a to libjpeg-8d+1.4.2.
> Does anyone have an opinion on either:
>=20
> 1) ignore it

I'm ok with ignoring it, because all DISTROs I care about were always
using libjpeg-turbo.

> 2) put an PE (epoch) in libjpeg-turbo
> 3) configure the debian renaming so the library has a different name
> (libjpeg-turbo, presumably)
>=20
> Ross

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZmEZcACgkQN1Ujt2V2gBwulgCeOz9xr8job331GD6k91aZQ0ET
Yt0AoJJZBNWOiAGkhfF8fSmJN9zVlSUJ
=Bcaw
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
