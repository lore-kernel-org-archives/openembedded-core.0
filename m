Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 62926601E0;
	Thu, 25 Jun 2015 10:58:46 +0000 (UTC)
Received: by wibdq8 with SMTP id dq8so72091936wib.1;
	Thu, 25 Jun 2015 03:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O5N6bmYrHmoWDNxNoT898I9opBmkV2JJwxubbEN3f1o=;
	b=ls0+xIE+u1a5nIDZOtKJplkYX5WmOy4R8pZL6pNZmx4Vwcyx1lq7mJzEd4aYpEmWys
	KRmXnteVI81cZhOM7vv6RYh+BuxBPYzCiQ4JVKFKcWpu74vQnZv7Rje363iGMH3+TgvG
	wx1Si/XAN8rTmvzXW79qauPScNaiOMqU97T6WNZz7Z8qsxKKvEDatcebXmjPOa1h5sHJ
	8aaw0z3kOzFJVY8pLRfnZWEeRBucM4AKUT3Cn62uWqzRtwBPQ1IHT2RuX9BQgR94Q+Y8
	ddMhonaymAFNDxV2DeAJGgHb2HUG5VC3+NnDEj7izSX58cH5iu/ujLy6731P7Ud7fP6P
	B5Hw==
X-Received: by 10.194.109.229 with SMTP id hv5mr81000950wjb.119.1435229927312; 
	Thu, 25 Jun 2015 03:58:47 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id p2sm7010555wix.11.2015.06.25.03.58.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 03:58:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Jun 2015 12:59:06 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20150625105906.GA2394@jama>
References: <558B6EE7.5090107@gmail.com>
MIME-Version: 1.0
In-Reply-To: <558B6EE7.5090107@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: google mercurial repo issues
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
X-List-Received-Date: Thu, 25 Jun 2015 10:58:49 -0000
X-Groupsio-MsgNum: 67148
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2015 at 08:00:55PM -0700, akuster808 wrote:
> Hello all,
>=20
> I have run into an issue trying to build vim.

That's broken for a while (see world reports), because bitbake mercurial
fetcher is broken.

> /usr/bin/env hg pull=20
> /home/akuster/oss/downloads/hg/vim.googlecode.com/hg/vim
> | DEBUG: Python function base_do_unpack finished
> | DEBUG: Python function do_unpack finished
> | ERROR: Function failed: Fetcher failure: Fetch command failed with=20
> exit code 255, output:
> | abort: repository=20
> /home/akuster/oss/downloads/hg/vim.googlecode.com/hg/vim not found!
>=20
>=20
> there is a note on google regarding their hg repos: "We have some known=
=20
> issues with hg repositories."
> =09
> https://groups.google.com/forum/#!topic/google-code-hosting/Gh3kl9MrzY4
>=20
>=20
> is anyone else seeing this?
>=20
> - armin
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWL3vkACgkQN1Ujt2V2gBzLCgCgnM10P3S9EWXlVR+XiU6Nsgoy
qW4AoJsytsDWrIq0DAyqG+KLUEHYuiEa
=DLC8
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
