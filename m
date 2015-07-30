Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id F27097638A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 14:31:03 +0000 (UTC)
Received: by wibud3 with SMTP id ud3so23667295wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IvkNREIEa/G3YA/PvccPtkWYsYnGy9BtwcXjqveKpCY=;
	b=k0G7Yhmoh7RpA+DZwrEhJ1fDsM43nyCkOZOtDPKDIatnJ/SZh+KMQCemruaSmzPcUA
	XHIJ/JqXDHMGxlyIAUq4EeJydPXEckUjZVX3KKk83DzVoDlLPK3yLm7LrTMjCryoozn+
	MIyEhh6xwOsgZ+w2w5Gyp062+t3oMTHQ1AbyNpHqvTpM9wRjGy59gYuQaV0eiz63Nr9H
	dlgrx/CwmtOYegI+caO+iyRleTplzVXcR6qImcO6oQwlaWYL8zcmWMnDXFUfoq4FZacQ
	JiRCmINxs9ZmAYUMbZ72h49/qHiBmUxQ16dR5Eq7Uh2seBUMHrvvjxI2TbVuZjzQQMBx
	iqsA==
X-Received: by 10.180.101.138 with SMTP id fg10mr7176794wib.46.1438266663311; 
	Thu, 30 Jul 2015 07:31:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r8sm30188290wiz.5.2015.07.30.07.31.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 07:31:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 30 Jul 2015 16:31:17 +0200
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20150730143117.GE2457@jama>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<4dc547325ca078af13412654a8533507f26978ad.1438262915.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4dc547325ca078af13412654a8533507f26978ad.1438262915.git.alexander.kanavin@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/26] eglinfo: change version from 1.0 to 1.0.0 to match the upstream git tag
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
X-List-Received-Date: Thu, 30 Jul 2015 14:31:06 -0000
X-Groupsio-MsgNum: 68735
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7CZp05NP8/gJM8Cl"
Content-Disposition: inline

--7CZp05NP8/gJM8Cl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2015 at 04:31:35PM +0300, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-graphics/eglinfo/{eglinfo-fb_1.0.bb =3D> eglinfo-fb_1.0.0.b=
b}  | 0
>  .../recipes-graphics/eglinfo/{eglinfo-x11_1.0.bb =3D> eglinfo-x11_1.0.0.=
bb} | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta/recipes-graphics/eglinfo/{eglinfo-fb_1.0.bb =3D> eglinfo-fb_=
1.0.0.bb} (100%)
>  rename meta/recipes-graphics/eglinfo/{eglinfo-x11_1.0.bb =3D> eglinfo-x1=
1_1.0.0.bb} (100%)
>=20
> diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb b/meta/recip=
es-graphics/eglinfo/eglinfo-fb_1.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
> rename to meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.0.bb
> diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb b/meta/reci=
pes-graphics/eglinfo/eglinfo-x11_1.0.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
> rename to meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.0.bb

Why don't you set PV in eglinfo.inc and rename them to _git.bb?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7CZp05NP8/gJM8Cl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlW6NTUACgkQN1Ujt2V2gBw7XgCeMnweHME4d7xLmEsdRe1DofNw
Xz8AmgNGgsa/MmOTblynXUK7R3TfALje
=TMLx
-----END PGP SIGNATURE-----

--7CZp05NP8/gJM8Cl--
