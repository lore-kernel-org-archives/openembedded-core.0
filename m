Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 535AA6A680
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 12:44:38 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id u56so6807087wes.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 05:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=J8LY55nUdUcXbW98fUNxNAViI16fH0Cgk+6kEH2MNoM=;
	b=V4jvHOgJ4uD74w4vEDL9NV1xH5Zl63YIVE0DIj9IHtFlQBZkzTUE/jcu6jaDynzli6
	7dCIScH2xy834CfNPRYRmn6eDHJ6apAKfEbCnS9sHuSVfBEA9+Vwom+lFQRsdM3hfNNE
	gde8DQQ7E1DVYjXRGwKrFYZ+rrLJGjkpRZOfJYyBfaLu4yhsOaCYxa7zKYJIsrEEJOe+
	hytlWVmvNpS1iTVNViIPn0H+iNk1fryoVTvNpUIN2n0MbX09LJW9BDcDjhD/Bk3P6YRK
	nmW4CPmNVa8VV2G+uSG6D5kWCnVcaGo0whfzBnfiAveNLFZu0YO+ZTp49JWCS+G8xN3j
	pUKA==
X-Received: by 10.180.37.180 with SMTP id z20mr25720483wij.58.1403527478007;
	Mon, 23 Jun 2014 05:44:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lo18sm33148760wic.1.2014.06.23.05.44.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 05:44:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Jun 2014 14:44:37 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20140623124437.GG2437@jama>
References: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
	<3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
	<CAJTo0LbmBrwHOdYKdeaiKzHxpCdJ5XtxTUO5CnK7yi+Rm3nUyQ@mail.gmail.com>
	<20140623123922.GF2437@jama>
MIME-Version: 1.0
In-Reply-To: <20140623123922.GF2437@jama>
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
X-List-Received-Date: Mon, 23 Jun 2014 12:44:41 -0000
X-Groupsio-MsgNum: 54320
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vSsTm1kUtxIHoa7M"
Content-Disposition: inline

--vSsTm1kUtxIHoa7M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2014 at 02:39:22PM +0200, Martin Jansa wrote:
> On Mon, Jun 23, 2014 at 01:12:25PM +0100, Burton, Ross wrote:
> > On 19 June 2014 14:54, Paul Eggleton <paul.eggleton@linux.intel.com> wr=
ote:
> > >> * update-rc.d.bbclass now adds dependency on TUNE_PKGARCH initscript=
s, so
> > >> these cannot be allarch
> > >
> > > As I've said before, I really dislike this change. The system should =
be made
> > > to handle the situation properly instead of working around the issue.
> >=20
> > Isn't this what the abi exclude thingy is for?
>=20
> Do we want to maintain list of all recipes which inherit update-rc.c in
> layer.conf?
>=20
> That's what I did in one of our layers and the list is rather long.

Ah sorry for possible confusion, I had to list *all* of them because we
have MACHINE_ARCH initscripts.

To fix current issues in oe-core we only need to list all recipes which
inherit allarch *and* update-rc.d (unless we want to exclude it
everywhere just for consistency).

> abi exclude thingy

is a bit dangerous, I still sometimes see issues when something is
supposed to be abisafe and in some cases it isn't and I need to manually
bump PR in the recipe which wasn't rebuilt.

So I'm trying to use SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS only in cases where
it's really safe or when the dependent recipe takes forever to build (so
I wan't to build it just once or once per TUNE_PKGARCH). For simple and
quickly built recipe I really don't mind "building" them multiple times
if it prevents "rebuilding" them every single time I change MACHINE.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vSsTm1kUtxIHoa7M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOoITUACgkQN1Ujt2V2gBz9sgCgiS2HbrwEp+0bdrfg+93l8w7y
ZzIAn2YHiXf3zpcyrOai2zo0+VTgsQfw
=tb3Q
-----END PGP SIGNATURE-----

--vSsTm1kUtxIHoa7M--
