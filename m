Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 29B3F73243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 19:44:34 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so40490755wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KOdDnUgQHl1sf0XZPCH94pN1rhiNZrUeYWgBgnNOwLY=;
	b=TooG+LaiHTZmkQ76wG6Wt9ohJv8ImMvM8ZZHPVlH5+qPBH71rkKK6Y2CORgyK5bSpA
	2dF63wZw1DZCC6xkHo6hxGOD6Jt78L8YEcZ3uIj31Ra7u/a4R0NhQ9Nk+djtAi9NmGXx
	dO7vNoRpK7vJVI+WWuynDUzVsSHywVrXur0PSbGA0ZshMoZMsiWgSg4UIY8EkTgib12m
	pM3QRtRU6YY2QU4bhYK7m1uQZWAGvoSGtJzL9R/C+cjau4zeAbU1/ERENF3E0Oxwtk4l
	F36/BmgFzEJCTVGor4rNvPtWXhFYR5zKEly4WwdunvHvzTTQBwkuROCeqHmdZ4cRfpQV
	l/Og==
X-Received: by 10.180.99.232 with SMTP id et8mr9058103wib.80.1441914274544;
	Thu, 10 Sep 2015 12:44:34 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cx3sm17261020wjc.27.2015.09.10.12.44.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 12:44:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Sep 2015 21:45:33 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150910194533.GF2387@jama>
References: <1441912203-27833-1-git-send-email-ross.burton@intel.com>
	<20150910193310.GE2387@jama>
	<CAJTo0LZcOLYi6_psehUKvtu-+LeRkPPHHQfQnn7BLLc3WMQ2bw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZcOLYi6_psehUKvtu-+LeRkPPHHQfQnn7BLLc3WMQ2bw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: Fix Upstream-Status statements
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
X-List-Received-Date: Thu, 10 Sep 2015 19:44:36 -0000
X-Groupsio-MsgNum: 70990
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HCdXmnRlPgeNBad2"
Content-Disposition: inline

--HCdXmnRlPgeNBad2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 08:33:38PM +0100, Burton, Ross wrote:
> On 10 September 2015 at 20:33, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>=20
> > There are at least 2 cases where SOB line is added, why?
> >
>=20
> Should have mentioned that.  There are two cases from memory, where I was
> fixing a Upstream-Status by hand and looked at the git history to identify
> who added the file.

Don't you need their permission or confirmation before adding SOB?

Otherwise it doesn't serve any purpose and git hook can add it
automatically.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HCdXmnRlPgeNBad2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXx3dwACgkQN1Ujt2V2gBwhjgCfUgE+eAs6UrRy8s67UqqBjLqB
KJoAn1I+qrmhDiEJAivVwYieISclFBjV
=/1YK
-----END PGP SIGNATURE-----

--HCdXmnRlPgeNBad2--
