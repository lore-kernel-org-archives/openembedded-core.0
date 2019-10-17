Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2F57F52A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 17:50:29 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f22so3460063wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=TkCG3B8bGlxEtsJTXRfBdMIuFkMqbvFjWhnm+ZXdfgw=;
	b=kiGOeUutqF0eM3vQnEvOpvEPHKAOUvdDkNBEgLbXSjijwXC4g5/WrOaXphJFUyFwq9
	EwSoeO8pzaICuy7Ys4/iB66hmUzLk14uWe4ISmJsm/mrnILFqQwAjXhL6H/6M3fpt7Fr
	ENrjBE3AMxPVIfoY+TU+0ohznkNRkOE11/V9lXK86SVoZaGSkxYBm/sQ6gxAhuFDrV5E
	0MQVHT/FGR/2l5WcPyPTYlvrZj3co1JrKkghKsL9G0Di9hwkfBjA8nKGKYR5xXA8bvAT
	xBcZs9+rPMgnfu+RB6U9Heeh+5Q72b3HkN/02kuz8AaPK3RD9fgQlbgb1i/d8+bGhn4K
	lxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TkCG3B8bGlxEtsJTXRfBdMIuFkMqbvFjWhnm+ZXdfgw=;
	b=tSO7dmYBEs58CqYpTe/YvZ8ni+QnzfE+NAs2B5AZTj6x4LDXJobJzuuNppG1NWBCgN
	Ztkpt6nKz6wQBYEw4v36O+RpEnEyAKTG5Dha8mX/hgGddHCCHJs6I3+UXz8gmlbyt98F
	lll4ts20cdb8mr+QwpZIutT9c9d1b1J9/fWS9yv7lXvIa5AjLzfXuh+X8OMLg4JdU8sI
	5lyHPutF/O5svokI97lZV/kYvSy/m1Mceodc97ROg3rFYGoP9irMObwAnWfik1F1dYQu
	RH02/Ussy2t0u5v1MKrgY/jMlMhy4w6fIoEG2W956kJISiRa/gJ7otxX+W3i1ZYgm7xP
	fO6A==
X-Gm-Message-State: APjAAAXCiMHB6z6XcFu9EkSF4jkgJVInlIlRgI+/SihOPBSo7tqlOawE
	5eLamuq3g3l/iHPrsdHcd1k=
X-Google-Smtp-Source: APXvYqxU2nHheFWfw5VO1ICy9S+grTn0uptTZBYr/gqXubDjCSbNg1Umzq59OE5gDyJ+LNU0wl+iUw==
X-Received: by 2002:a7b:cb95:: with SMTP id m21mr3697114wmi.36.1571334630439; 
	Thu, 17 Oct 2019 10:50:30 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	q66sm3381865wme.39.2019.10.17.10.50.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 10:50:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Oct 2019 19:50:33 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191017175033.GA1499@jama>
References: <cover.1570885333.git.Martin.Jansa@gmail.com>
	<ffe6a140ee4cf36bb7ce8fd2f460bcd7e0a86f05.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <ffe6a140ee4cf36bb7ce8fd2f460bcd7e0a86f05.camel@linuxfoundation.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][RESEND 0/6] YOCTO #12937 - Consistent naming scheme for deployed artifacts
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
X-List-Received-Date: Thu, 17 Oct 2019 17:50:30 -0000
X-Groupsio-MsgNum: 130217
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline

--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2019 at 02:44:30PM +0100, Richard Purdie wrote:
> On Sat, 2019-10-12 at 13:03 +0000, Martin Jansa wrote:
> > The following changes since commit
> > 59938780e7e776d87146002ea939b185f8704408:
> >=20
> >   build-appliance-image: Update to master head revision (2019-10-09
> > 22:28:44 +0100)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.openembedded.org/openembedded-core-contrib
> > jansa/artifacts
> >  =20
> > http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/a=
rtifacts
> >=20
> > Martin Jansa (6):
> >   image-artifact-names: introduce new bbclass and move some variables
> >     into it
> >   bitbake.conf, kernel*.bbclass: include IMAGE_VERSION_SUFFIX only in
> >     the _LINK_NAME variables and change it to hard link
> >   kernel-artifact-names.bbclass: use PR instead of PKGR in
> >     KERNEL_ARTIFACT_NAME
> >   kernel.bbclass: imageType without {}
> >   kernel.bbclass: drop unnecessary package_get_auto_pr for do_install
> >   *-artifact-names: include version only in the artifact links
>=20
> I tried this on the autobuilder and it seems to break several things:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/423
>=20
> Looks like do_bootimg fails, as well as the testimage oeqa code being
> unable to find the testdata json files.

I've successfully built this with nodistro and qemux86-64 before sending
the pull request, now I've built core-image-sato-sdk-ptest with poky and
genericx86-64 as well, so I'm still trying to figure out what
autobuilder does differently to break it like this.

> There could well be further issues beyond that but its hard to tell.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXaip6AAKCRA3VSO3ZXaA
HNuwAJ9ByEocCxWVUqUang4dVrSlsZ3onQCcDiL71z8GJEwmuIQq0o173NbomV0=
=yvLH
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--
