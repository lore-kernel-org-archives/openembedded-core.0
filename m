Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5889977B21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:20:51 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id u132so59722733wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=1EenHO7s4pN5Y7V7mjkT2VHUQ8k+vexugeiiWp+Miuk=;
	b=gc33e44Cly4UNdIxSH/ouFJOXVcCS4VF5CVXoAt1JDG8YJNGABR+xGm72oSfMYXO0F
	1v1IsqNiy2Pr4HGRNeVhgqHmLbmCRiy/sHtw1NMCEql30xY58iRL+h2RdwcB7fvpCf+b
	YY2TCPji29TAQEkTVxXzjnTch4AhwAC8wz1jO1iVbdSiq8hLtAAsB4BmTr5HG5gLwAmv
	a+OH2KrFs4dnQJm38Tym/pJClKb0h0CT1QnpoNI7a8TpXinz9pNQez5sbIFqSPoRtzen
	AknjEA94ZAy31wumRpvzE02zpV4A9Gb/u/nzM/KhVSKmmHr+fxlOIeQ57q781NlWR8Z8
	uHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=1EenHO7s4pN5Y7V7mjkT2VHUQ8k+vexugeiiWp+Miuk=;
	b=JuIeX8VgbP5jj1TVNfLFmHYXnLMsMarm0gXziQ9WnYcYICJm9OrOeVrKqnc2pGL/Tc
	yGuP/y9lC/amDoAuiIs35vG3VmVIqIv6nFArKLkLdIZUoE5KDzzH4gseEeNDcxiFs7Br
	LYMW5vdENZIn+u/YTycoBx3OJ/M0K+zYXH29/rZv4ffKsBotStlPXs/Ry+H6vP+5ARQ1
	k05jEzLN7j1g9ZUIZ3e9MOxN+IX4rVNQBMLNoq/u79sbPxjOzeeT65q8QYHhI92z192r
	yFvazUMq4rRtM354/mTTfoNnzxyAow2uK5KycaK7N+8kZCJIVYKefRKAJyU7cmgEWhOb
	kQBQ==
X-Gm-Message-State: AFeK/H2+rxaB94xp4OtVd/X+oskGIFYRDJa3XcZU0RD4hOYvcJCArMlCCsomq0R2BVUPlg==
X-Received: by 10.28.207.14 with SMTP id f14mr2598735wmg.72.1490271652659;
	Thu, 23 Mar 2017 05:20:52 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 53sm5655812wrt.52.2017.03.23.05.20.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Mar 2017 05:20:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 23 Mar 2017 13:21:00 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20170323122100.GC3293@jama>
References: <cover.1490265213.git.Martin.Jansa@gmail.com>
	<3d7e2a0b6f99a996eb981c0fb64a9954247002d2.1490265213.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3d7e2a0b6f99a996eb981c0fb64a9954247002d2.1490265213.git.Martin.Jansa@gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Subject: Re: [PATCH 1/2] rootfs.py: Respect OPKGLIBDIR variable
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
X-List-Received-Date: Thu, 23 Mar 2017 12:20:52 -0000
X-Groupsio-MsgNum: 95125
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline

--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2017 at 11:34:22AM +0100, Martin Jansa wrote:
> * when OPKGLIBDIR doesn't have the default /var/lib value it will
>   silently fail to copy package database from normal rootfs to debugfs
>   rootfs and then when trying to install *-dbg complimentary packages
>   it won't install anything, because installed_pkgs.txt file generated
>   from debugfs is empty
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/lib/oe/rootfs.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index 5e1c09762a..068b784c51 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -946,7 +946,9 @@ class OpkgRootfs(DpkgOpkgRootfs):
>          if self.progress_reporter:
>              self.progress_reporter.next_stage()
> =20
> -        self._setup_dbg_rootfs(['/var/lib/opkg'])
> +        opkg_lib_dir =3D self.d.getVar('OPKGLIBDIR', True)

I can drop True here, v2 coming.

> +        opkg_dir =3D os.path.join(opkg_lib_dir, 'opkg')
> +        self._setup_dbg_rootfs([opkg_dir])
> =20
>          execute_pre_post_process(self.d, opkg_post_process_cmds)
> =20
> --=20
> 2.12.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWNO9lQAKCRA3VSO3ZXaA
HPtBAJ4wmdp4G44cO4LPp+82iMzaAinJ1wCgpi1v9/t358iNq4/3rIVDKG+wTaY=
=MUqJ
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
