Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id B34036FC3D;
	Mon, 16 Jun 2014 10:59:17 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id cc10so3834713wib.0
	for <multiple recipients>; Mon, 16 Jun 2014 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=p+4xB+Jqjtgxa2zoygY2lDvR4VfXIfz8THl84YPpfj4=;
	b=kOB+YX3vWtAquj7znLIe2VcGf9pJBRezSGepvpy0nTWgcOQbm+dvAxkBaXhuIiYYOT
	aJ5Ub+TVyuOtTPD434adoW5T2WecPI7AEXVZ7W8iz6sIgirlzviFFp0xjifsy3W1Xqzz
	MbLo2OzdElHfP22hNn7Ta9vDENed+iy+E2ytg0zcL6tHcRqISae0if9+fE4ZxPUaff9w
	UKr81hl5hktG0lyvC0dM7uY/lKQ2ezc2I/qTNimLy/WsukWIDqTIO9xg9LPnMO47OIdQ
	7wjz+M1KAQwXVKXpGKUbZr7qDvHKog7wfsXo3vMLFWygINxoXUa9ImZiataog0Y0QHxD
	iqeA==
X-Received: by 10.194.240.129 with SMTP id wa1mr27425931wjc.11.1402916358500; 
	Mon, 16 Jun 2014 03:59:18 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	e6sm33238625eem.44.2014.06.16.03.59.17 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jun 2014 03:59:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Jun 2014 12:59:42 +0200
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20140616105942.GO2428@jama>
References: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>
	<539E8F97.3070508@dresearch-fe.de>
	<6076930.voh3DpIb8j@peggleto-mobl5.ger.corp.intel.com>
	<539EBCA8.3000709@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <539EBCA8.3000709@dresearch-fe.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][daisy][PATCH] live555: fix fetch problem
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
X-List-Received-Date: Mon, 16 Jun 2014 10:59:23 -0000
X-Groupsio-MsgNum: 54147
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rJ8inJ6ig7iY3YX9"
Content-Disposition: inline

--rJ8inJ6ig7iY3YX9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2014 at 11:45:12AM +0200, Steffen Sledz wrote:
> On 16.06.2014 10:48, Paul Eggleton wrote:
> > On Monday 16 June 2014 08:32:55 Steffen Sledz wrote:
> >> What is the right ML address for patches in this area?
> >>
> >> The meta-multimedia/README in git://git.openembedded.org/meta-openembe=
dded
> >> (daisy branch) says:
> >>
> >>   "Send pull requests to openembedded-devel@lists.openembedded.org"
> >>
> >> But i believe this should be openembedded-core@lists.openembedded.org.
> >=20
> > No, for all layers in the meta-openembedded repository it should be=20
> > openembedded-devel as listed.
>=20
> OK, thx for this info.
>=20
> So i hope the patch will make it into the daisy branch in the next time, =
because our build is broken meanwhile (OK, we have a workaround, but this i=
s unendearing).

We still don't have meta-oe daisy maintainer :/ (and update to READMEs
in daisy branch)..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rJ8inJ6ig7iY3YX9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOezh4ACgkQN1Ujt2V2gBw+ZQCfTF0q27OqBotCE9wwbkc0ADmW
DeYAn2cSYj1LDe0xmMEff0R+AP0GSZ2n
=EVjD
-----END PGP SIGNATURE-----

--rJ8inJ6ig7iY3YX9--
