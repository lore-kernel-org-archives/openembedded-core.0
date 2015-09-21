Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 79DB460053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 18:57:57 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so161034889wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 11:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cl+sNdhJT9bI3rd6705SSRBXxt39OrbBg/2f9XoMq5Y=;
	b=mTYjINJZmkDHEJOiSJCG902YuIj/zXUz4ZrSYGhyu0EQi7BflxghQU8unNc6NimmIk
	9/DhWNdYFOQuRw4GA+fnlHnBoV+NvHxaEOSXLeIUVREn5GgQFA2QTV0DqTotDOiqqbmx
	G2QNjDdzjKeojGv269aixtaekURZM+BZOZq+FSDaiGMjTwrFDCeKbPN3/d3ru60LoBqF
	ppTcurvUmgmbqMxy8BHzkadW9jrKijHTx1IhZ1xDQKwEoxQjPKv1Eb4sr4uHbToO6Lr0
	oFmUCvpHP1IL2xcZ7o3lXunh2HuIzLED8S2DK5L0sZwtgZ4Q6XlvRQFLMNAt7zuGMjAq
	9aeA==
X-Received: by 10.194.234.40 with SMTP id ub8mr23915188wjc.95.1442861877157;
	Mon, 21 Sep 2015 11:57:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lh3sm25471254wjc.44.2015.09.21.11.57.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 11:57:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Sep 2015 20:57:44 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150921185744.GD2380@jama>
References: <1442844096-27847-1-git-send-email-Martin.Jansa@gmail.com>
	<560029CB.6050006@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <560029CB.6050006@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk: add REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 21 Sep 2015 18:57:58 -0000
X-Groupsio-MsgNum: 71390
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cHMo6Wbp1wrKhbfi"
Content-Disposition: inline

--cHMo6Wbp1wrKhbfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2015 at 07:01:15PM +0300, Alexander Kanavin wrote:
> On 09/21/2015 05:01 PM, Martin Jansa wrote:
> > * original webkit-gtk_1.8.3.bb recipe already had this, I don't know
> >    why it was removed when upgrading to 2.8.5
>=20
> It was removed because I couldn't figure out why it's actually needed.=20
> What is the scenario?

DISTROs without x11 shouldn't try to build webkitgtk, because it will
fail with ugly error message about libxt not being available.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cHMo6Wbp1wrKhbfi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYAUx0ACgkQN1Ujt2V2gBxNEwCfagXhxq/N4jmuWxRAdNs/V1tR
hlIAnjVhdf7l/6IJ7ZPr9MV5fnal6Y5T
=mJ/A
-----END PGP SIGNATURE-----

--cHMo6Wbp1wrKhbfi--
