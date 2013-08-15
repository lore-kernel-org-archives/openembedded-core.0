Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id B4B356612B;
	Thu, 15 Aug 2013 17:47:00 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so505412eek.25
	for <multiple recipients>; Thu, 15 Aug 2013 10:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CL1zE9HsbAEwvx7QrjwNOQ72cBK0VBf0rNpcSA0gjmU=;
	b=cXd4ZHXIMRBMqPBRORdv9e4kzdVOgI5QVdWQWNL2z4h0jnpx1hPolQik9kx3INpZnZ
	ZTY0Sz4xP0ZRKyH33WQJjeKhwkUiQKg9XTPiqUnJoHWgNg7LhoA/QBPkJGZdpha/oAmN
	JXyVc0EhlzYrn6suTERKwryazejnb62J1qreqUI09+Ya7BV6vwPGYm3kzFia3vblxwGO
	SAZGyP/5bFCUeWfiLDnWY7hPgveVwUR7wWXBo353VsrXE3ErrJU23o7kuovFBjikq99m
	D+JkRbvYkiZo3dyuxM5iz2ICTt8Z63T3ZnS7/yoTP/+tpHn4fzvyrXNDJP2mRFS/qG2C
	fmew==
X-Received: by 10.15.64.194 with SMTP id o42mr5295215eex.62.1376588820772;
	Thu, 15 Aug 2013 10:47:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id h52sm205286eez.3.2013.08.15.10.46.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 10:47:00 -0700 (PDT)
Date: Thu, 15 Aug 2013 19:47:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Message-ID: <20130815174752.GE17945@jama>
References: <20130724102648.6C85050201@opal>
MIME-Version: 1.0
In-Reply-To: <20130724102648.6C85050201@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : useradd.bbclass: add a new base class and code refactor
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
X-List-Received-Date: Thu, 15 Aug 2013 17:47:02 -0000
X-Groupsio-MsgNum: 43449
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qTzJm9l2qECmSDiM"
Content-Disposition: inline

--qTzJm9l2qECmSDiM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2013 at 10:26:48AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 2a57bb7e9a7e154578aa7cb9aeebdf398a54ec00
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D2a57bb7e9a7e154578aa7cb9aeebdf398a54ec00
>=20
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Fri Jul 19 09:52:25 2013 +0800
>=20
> useradd.bbclass: add a new base class and code refactor
>=20
> Add a new base class, useradd_base.bbclass, which is mainly a
> collection of basic functions for user/group settings.
>=20
> The useradd_base.bbclass is intended to be inherited by useradd.bbclass
> and the extrausers.bbclass to avoid code cuplication.

This code is calling bbwarn in postinst scripts, but only implementation
I've found is in logging.bbclass and isn't included in postinst shell
code causing:

/tmp/opkg-HtXU0e/dbus-1-Ea0TSc/preinst: 15:
/tmp/opkg-HtXU0e/dbus-1-Ea0TSc/preinst: bbwarn: not found

--qTzJm9l2qECmSDiM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlINFEgACgkQN1Ujt2V2gByJyACfTCJpFszCfIukvorbQHJ0bp1k
uOUAn0pCTfezdmgjla+v95mlSqdGJgFP
=8tIK
-----END PGP SIGNATURE-----

--qTzJm9l2qECmSDiM--
