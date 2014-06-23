Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id B947D6A680
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 12:39:28 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id w62so6752590wes.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 05:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gbZruADM/ViLPklGwTzpYlU4jbluAfsuHpF+yDSZrd8=;
	b=usrHqkdLANFtpAGJih0T8E4adJZl2mKBUEbzEVSJYgHIRkVlB3m6/LCqhKthUja9sK
	UzElkItOrngVL1vwcJgaF+I9svO0IZZSPyRMeh2rYuNPntMKNu2eBL65O5Aa5Mrlf/yL
	WARBz4KCRX9CdT0bBaBO4RAqudnYqBghf4LxL+W4kkSecBG1C3os5htxnLCr51ckFjXG
	0c7FE2Dpai0VdeQIuxWB8+gWGVlwlR7RTfZiKUl+7Id44fAK4IZGcnbLsKZWKEErW9Q2
	oqEthUM0fG0wtAekEQl78ZxYgu01AOfry1cqy95y9B1eBPlcPyP8hFgl3csiKg900KzY
	qGvw==
X-Received: by 10.180.72.38 with SMTP id a6mr25746084wiv.29.1403527164540;
	Mon, 23 Jun 2014 05:39:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bq7sm33084728wib.7.2014.06.23.05.39.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 05:39:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Jun 2014 14:39:22 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140623123922.GF2437@jama>
References: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
	<3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
	<CAJTo0LbmBrwHOdYKdeaiKzHxpCdJ5XtxTUO5CnK7yi+Rm3nUyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbmBrwHOdYKdeaiKzHxpCdJ5XtxTUO5CnK7yi+Rm3nUyQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
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
X-List-Received-Date: Mon, 23 Jun 2014 12:39:30 -0000
X-Groupsio-MsgNum: 54319
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pql/uPZNXIm1JCle"
Content-Disposition: inline

--Pql/uPZNXIm1JCle
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 01:12:25PM +0100, Burton, Ross wrote:
> On 19 June 2014 14:54, Paul Eggleton <paul.eggleton@linux.intel.com> wrot=
e:
> >> * update-rc.d.bbclass now adds dependency on TUNE_PKGARCH initscripts,=
 so
> >> these cannot be allarch
> >
> > As I've said before, I really dislike this change. The system should be=
 made
> > to handle the situation properly instead of working around the issue.
>=20
> Isn't this what the abi exclude thingy is for?

Do we want to maintain list of all recipes which inherit update-rc.c in
layer.conf?

That's what I did in one of our layers and the list is rather long.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pql/uPZNXIm1JCle
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOoH/oACgkQN1Ujt2V2gBxnggCeNblrmnAQCurJfmYQvtv8SIrQ
jVoAnitOIKRCyQmN0Vk5ba5o1vPjgRXL
=qGaQ
-----END PGP SIGNATURE-----

--Pql/uPZNXIm1JCle--
