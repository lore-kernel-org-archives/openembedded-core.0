Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 892DD6FF25;
	Thu,  3 Dec 2015 14:04:33 +0000 (UTC)
Received: by wmec201 with SMTP id c201so28511826wme.0;
	Thu, 03 Dec 2015 06:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=joXF27UmVKSogYPV7ZRjzg4TDvOLYnTS358OyoKQ3IA=;
	b=qIDjTIsqQvzzHxn9KJ+1zVXII5+tmd86vgWpPlog6QxcVKP/onQgK2/RvFYp2YCkMe
	NrcZQBXOcV89ng376UiOCOIHlyKaILqr3EIWZ7UmHn9aWnzTNHrzd8jXjbdkAjrRX3VV
	50xZoi1u/h5z4dDOi3jjXtmiIY7hcwxKcu0rsg3XhIhZfYGxAG07ddehFVtKQQhbvW68
	N+5//xKPhLbnAlkA1+t0sf6nMDmrcgj5NV4kCB4gdImpyHizMa7m2nPhx8+aZurZOu9v
	5cQ91jAd4Qm95lLQA2ZYNMHYKnTvQEqG6b7zWCVFPKWh831OfHOEOzI5WQIpCrAyhAvO
	NMKw==
X-Received: by 10.28.136.149 with SMTP id k143mr12196713wmd.57.1449151473528; 
	Thu, 03 Dec 2015 06:04:33 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl10sm7680872wjb.30.2015.12.03.06.04.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Dec 2015 06:04:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 3 Dec 2015 15:05:48 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20151203140548.GA2244@jama>
References: <41399562.aYmIK0zX5I@peggleto-mobl.ger.corp.intel.com>
	<20151201104720.GB2251@jama>
	<9135219.GRnf9JIkFP@peggleto-mobl.ger.corp.intel.com>
	<20151202081713.GA2248@jama>
	<D2847D54.6BF8A%belen.barros.pena@intel.com>
	<D2847EE2.6BF9C%belen.barros.pena@intel.com>
	<20151202180440.GC2248@jama>
	<CAJTo0LZpgv3KuJXAO6Pa9o_PrRb=aMT3d8Pe6qD2-yvsspEsTw@mail.gmail.com>
	<D285DA30.6C15E%belen.barros.pena@intel.com>
	<CAJTo0LYGSR=TZeH--jFsc+DnE09K0zF4Xw2KhRfA_aazaDV0Dw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYGSR=TZeH--jFsc+DnE09K0zF4Xw2KhRfA_aazaDV0Dw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Lespiau,
	Damien" <damien.lespiau@intel.com>,
	"openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Patchwork & patch handling improvements
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
X-List-Received-Date: Thu, 03 Dec 2015 14:04:33 -0000
X-Groupsio-MsgNum: 74315
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 03, 2015 at 12:51:22PM +0000, Burton, Ross wrote:
> On 3 December 2015 at 11:43, Barros Pena, Belen <belen.barros.pena@intel.=
com
> > wrote:
>=20
> > >and more status values.
> >
> > You can add status values (to the db directly or via the Django admin
> > interface), but they will apply to all projects in the Patchwork instan=
ce.
> > Ideally you should be able to set a list of status values per project I
> > guess.
> >
>=20
> Well it depends on what the extra values are.  Martin, what values do you
> use?  A "merged in staging" value would be useful for everyone.

The list of bundles is in:
http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same=
_oe_project_on_patchwork

Once the patches are added to correct bundles I mark them as archived to
know which ones were sorted (the main page gets empty).

Advantage of bundles (something similar can probably work with tags) is
that the same patch can be in multiple bundles, e.g. I can include some
change in master-next branch and bundle while also adding it to
meta-networking bundle for Joe to merge it when ready.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZgTDsACgkQN1Ujt2V2gByr1ACgrEL6a9RadKu3n+F3QrKeqQdg
iNcAoJjP3/Uh7rUnHVShMsL9Ppa+qDlV
=tV2Q
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
