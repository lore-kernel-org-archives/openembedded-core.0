Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5E48278667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 21:03:11 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id e64so1563963wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 14:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3kLh5Gfo1YVPMGWZT04c8NOJfGFG5nKvC+0AFenYOcA=;
	b=n9kbuENEusPTZcgLhWLwrKyTYyvQRCa5eg4TcHrvcWd0MOZj+25uuuyTZ9duaT43Bb
	u/9EMw/dfEWtRVOs1wRkB3cSLJo3ifhWWU8fo3OPlfZMAFyvvekF8k+bPn5m+RKi0ysB
	djmAfid1jwsOq2vVnKDFGEyOQ3RIldAjry01tKl8AGkCzB/fMYaIEh95yWKbWtLr37yi
	stSOu5dxNe7mtHxAtlK//tIljXVAPYuAU4PJWs2J28ZtGZ0xBIuBhAsgiXyxoZpM90Jv
	OOoUKvbSCoPANWZmTkB14DaZK5aHNvhG1Qko8dhuW8yDkJfvQlvV7b0hQHMwTqNdXVrD
	vjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3kLh5Gfo1YVPMGWZT04c8NOJfGFG5nKvC+0AFenYOcA=;
	b=RJSYplJbeGqUi/0+EIK87BI3lw9CBJM2yJ+Eiv5Jigbgj2q/Y673qt2T88XDJSs97v
	Sh6W0g03TgFoC6VCl38fYHctfJa1Qyvwv7xr/TGGbaSJSPdzlswgngr/BinPKwPMnT8w
	QV4J1sTgRK+Aof3IOgdbM8n4KcQXOs8wmYHcGHZc5YnYH/lFZlk5cP6I9nE/n0s7+JjI
	DBNeDl4s5jb3kI1fJ1dA7izMLWVT02X1ih7Vg2fKNK3monPeE3OYYVZ+WqKW5ync2h0B
	yJFMpvXKeckZYiMJJiS3lXvdkJSPzhxflVzFk+LWInWdvgoPBYyRoRXkLIV0tA/bHdsq
	HEng==
X-Gm-Message-State: AHPjjUg4Lck3MtCzStxb6tsvOKAdiXin/fNC3Jbrek5ZeUTmYQvi94O4
	CXWEFl5QmVZHNpI9
X-Google-Smtp-Source: AOwi7QBMpyJYJ+Gp2MpqhxJgwDWmH8PFd87QZ1/ZMQSImGH9+95ogbFguuXimUOJQ+gtDjtH7FMM6w==
X-Received: by 10.28.39.71 with SMTP id n68mr39511wmn.114.1505336591892;
	Wed, 13 Sep 2017 14:03:11 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p78sm3140701wma.11.2017.09.13.14.03.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 14:03:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Sep 2017 23:05:30 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20170913210530.GE3288@jama>
References: <20170913204647.1660-1-Martin.Jansa@gmail.com>
	<20170913204805.GC3288@jama>
MIME-Version: 1.0
In-Reply-To: <20170913204805.GC3288@jama>
User-Agent: Mutt/1.9.0 (2017-09-02)
Subject: Re: [RFC][PATCH] WIP: qemu: enable sdl2 virglrenderer gtk+ spice
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
X-List-Received-Date: Wed, 13 Sep 2017 21:03:11 -0000
X-Groupsio-MsgNum: 102872
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Content-Disposition: inline

--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 13, 2017 at 10:48:05PM +0200, Martin Jansa wrote:
> On Wed, Sep 13, 2017 at 10:46:47PM +0200, Martin Jansa wrote:
> > * this is only for test
> > * it should be enabled in some distro layer which prefers extra
> >   native dependencies for virglrenderer and enables meta-pyton
> >   for spice
> > * cannot enable gtk+ for native builds, because there is no gtk+3-native
>=20
> ignore this one, sending last patch but from wrong branch.

[Patchwork-Status: Rejected]

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWbmdmQAKCRA3VSO3ZXaA
HAnfAJ91FtB3u06eX97dhgrnma8IQh5mfwCfder2ykipQJAofec8aU6sZ4qQkwQ=
=IvKA
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--
