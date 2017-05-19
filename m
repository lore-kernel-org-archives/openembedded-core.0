Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id BDD2D7809D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 17:28:47 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id w50so3561665wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 10:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=oeFd+16r5vEI2t3+KuuE6s+9rguaeuQXgfIeeeuU5hQ=;
	b=qlj7IJFPKznCU5eH0IPSDvEKBvnZV9CsY3vLTsScLkPzMCBxhzdo9P7qpvFoYdNspM
	elXAxzbIdAkDy9f3TLIxEnZPIA2G6s00MNrv26w9056wC0J8zB4kxi+Pw/tVyJlvHKar
	VqMjNMyY+kviUEOk/EfikrTOjClhfjnToWFkvdv/zNAHId21zJeNyrV6YC/RcXI6FU/+
	W8s1hawSKb/36//d0Ce7eZHNCYbsAs0y7mwNwzTH0Yd4qsDRrJXMPusGdwr7aUN8+s1q
	yhuEr9fRPi7NhWQz1xd0KqO4gbUSsfyapLefTHaMDhWFRNTuTUkhEYrXz2SWnu0akJHj
	/pDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=oeFd+16r5vEI2t3+KuuE6s+9rguaeuQXgfIeeeuU5hQ=;
	b=CAJ4J8SGxLp0MLjrEaDtwzvPnPlkmbfGi1F6Ra5yvHcEdeCunqbD9KPNzC+EpGuKYD
	a7TWMg8/ZuSsoK7TR9zJCXVBjbU0CF6pnIIxDnGaZPdToA4uX/ws0KmAN5/vNQVD7uPe
	4l8JGBrm7RQ5kr8l4iLCbluFeC6TxYckMZ/aNpwTKTDsnb3a+Q5hE+doLz50VI+kNU+j
	WWc8/r1pNzvYH3vazZshu95+3OQPxCX4P66WHWaYV460IvzC1rsiyJiRKRbHoiOjeCJp
	JvZRiDAhzpVVDbjs+GKHbcR+SSctGJP2s0E1vy0C/Ve1X2lDbT1FWQJjYqMR7ek/CM40
	iRIg==
X-Gm-Message-State: AODbwcDdBebTj99Xyfs492ysCe9Pa7+v6wkpfvzFRH8kBAU1KUoAl9H1
	JiSgzjlTtcvfHw==
X-Received: by 10.223.172.105 with SMTP id v96mr4351087wrc.1.1495214928390;
	Fri, 19 May 2017 10:28:48 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r29sm3191085wra.18.2017.05.19.10.28.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 19 May 2017 10:28:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 19 May 2017 19:29:41 +0200
To: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <20170519172941.GA3094@jama>
References: <20170519150121.7707-1-haris.okanovic@ni.com>
MIME-Version: 1.0
In-Reply-To: <20170519150121.7707-1-haris.okanovic@ni.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_manager.py: Add PACKAGE_ENABLE_FILELIST option to OpkgIndexer
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
X-List-Received-Date: Fri, 19 May 2017 17:28:48 -0000
X-Groupsio-MsgNum: 97531
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2017 at 10:01:21AM -0500, Haris Okanovic wrote:
> Setting PACKAGE_ENABLE_FILELIST option generates Packages.filelist on
> `bitbake package-index`, which is index of files provided by each
> IPK package in the feed. It's useful for figuring out which package
> provides a particular file/program/library/etc.
>=20
> Disabled by default since generating a filelist involves reading the
> payload of every package in the feed, a time and IO intensive operation
> many users won't want to run. Those who do may flip this switch.
>=20
> Testing:
>  * Built an opkg index with PACKAGE_ENABLE_FILELIST unset and verified
>    no Packages.filelist are generated.
>  * Built with PACKAGE_ENABLE_FILELIST=3D"1" and verified each subfeed
>    has Packages.filelist; took ~3min longer for 8,200 IPKs.
>=20
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>

Why not use files-in-package.txt reports in buildhistory?
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5870

That should work for any package backend and better to generate it once
in one place.

> ---
>  meta/lib/oe/package_manager.py | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager=
=2Epy
> index b4b359a8c6..5e1fc48500 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -161,6 +161,8 @@ class OpkgIndexer(Indexer):
>          else:
>              signer =3D None
> =20
> +        enable_filelist =3D bb.utils.to_boolean(self.d.getVar('PACKAGE_E=
NABLE_FILELIST', True) or "False")
> +
>          if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
>              open(os.path.join(self.deploy_dir, "Packages"), "w").close()
> =20
> @@ -175,14 +177,18 @@ class OpkgIndexer(Indexer):
>                  pkgs_dir =3D os.path.join(self.deploy_dir, arch)
>                  pkgs_file =3D os.path.join(pkgs_dir, "Packages")
> =20
> +                filelist_cmd =3D ""
> +                if enable_filelist:
> +                    filelist_cmd =3D '-l %s.filelist' % (pkgs_file)
> +
>                  if not os.path.isdir(pkgs_dir):
>                      continue
> =20
>                  if not os.path.exists(pkgs_file):
>                      open(pkgs_file, "w").close()
> =20
> -                index_cmds.add('%s -r %s -p %s -m %s' %
> -                                  (opkg_index_cmd, pkgs_file, pkgs_file,=
 pkgs_dir))
> +                index_cmds.add('%s -r %s -p %s -m %s %s' %
> +                                  (opkg_index_cmd, pkgs_file, pkgs_file,=
 filelist_cmd, pkgs_dir))
> =20
>                  index_sign_files.add(pkgs_file)
> =20
> --=20
> 2.12.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWR8rfwAKCRA3VSO3ZXaA
HDZdAJwKUIAiU6SPv827eg6jkIxdPegOpQCgoTQyk1YLyVZJIbsMYeR0sYdNP+M=
=Zt93
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
