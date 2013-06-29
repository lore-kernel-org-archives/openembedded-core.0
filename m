Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 36E3C62240;
	Sat, 29 Jun 2013 19:03:56 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id k10so1867883wiv.7
	for <multiple recipients>; Sat, 29 Jun 2013 12:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RCEv7visEeqYxHGpDwfWcacCkUY1/4NrnV1WxPGPpa0=;
	b=MxAlpE5Yg0CCqGF5pep+knwT5haEQPiCYdTB8iCurv79Z1cTmpUVfOLIi9LRL3Ci9n
	IXkAwkB6jMGKV2AjMhiyiXgIP6fr1ajGZVr+ihXTS+3/iX8dF5viFiMUXMbUDpf2x2Rf
	EdoUH9IZsmKm8Nkk23AzXnLXqtV6Pk2qTgX3dKBdZxpTNxus7f9mE6lpaGOkdMjJQIje
	/FmhjXUSzTVLvo8Cx+vkktARZlqVQi0YKWBYb2bNi9iIBKiMjGTJ7toi0hHsVsh7U+LL
	b6iVCMdo/39IYA0K74tusgxos4z/cepsC/PhAEHCpd6F9jiHwCshZ4tr9qsh5jJ4h4lZ
	fDLQ==
X-Received: by 10.194.174.4 with SMTP id bo4mr15153180wjc.40.1372532636852;
	Sat, 29 Jun 2013 12:03:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm18469733eef.16.2013.06.29.12.03.55 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 12:03:56 -0700 (PDT)
Date: Sat, 29 Jun 2013 21:04:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130629190437.GY3261@jama>
References: <20130503151507.1737A504ED@opal>
MIME-Version: 1.0
In-Reply-To: <20130503151507.1737A504ED@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Phil Blundell : image.bbclass: Don't mark do_rootfs and do_build as nostamp
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
X-List-Received-Date: Sat, 29 Jun 2013 19:03:56 -0000
X-Groupsio-MsgNum: 41202
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Er97KPJOrxRt+yKZ"
Content-Disposition: inline

--Er97KPJOrxRt+yKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 03, 2013 at 03:15:07PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 8505008c115efb54d18e5f25441c7a938a32ffaf
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D8505008c115efb54d18e5f25441c7a938a32ffaf
>=20
> Author: Phil Blundell <pb@pbcl.net>
> Date:   Fri May  3 13:38:22 2013 +0100
>=20
> image.bbclass: Don't mark do_rootfs and do_build as nostamp

FWIW with OEBasic signature handle one needs to call
bitbake -c clean *image
now in order to recreate it with new versions available, but that's fine
for me (probably last OEBasic user), I've updated my bash aliases to do
clean.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Er97KPJOrxRt+yKZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHPL8UACgkQN1Ujt2V2gBzQUQCfSDSQ9GlUw9hQfVQ+/cK0jxVJ
qhsAoLhbV8d0UeA3nutofYw71wR8al/B
=9mcc
-----END PGP SIGNATURE-----

--Er97KPJOrxRt+yKZ--
