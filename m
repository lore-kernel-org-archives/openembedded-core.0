Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id DF09366004;
	Tue, 24 Jun 2014 10:14:42 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so88034wgg.8
	for <multiple recipients>; Tue, 24 Jun 2014 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H5CREuJxBG/s95/UFWtBO7nM1GcO7nM6Supj+u0dHGk=;
	b=sdE46hQtU8XS5qG9YdgfS0c5kWViDFkFO62MNPTtifxkncmGZINtzVMBAkjkAdYtaI
	iZBehLqiwRtoM5pr/BMiJt61aMBMcWZPYjm0/RBFNejJmCDYc6cbNpuVDja85jWwzy1c
	vt7N6qNOwiN2Fitszy58dOvXyETYknU9IhAwGp4xtD2l25YBPTXkZ4pQrFFicaYfvzys
	EciRn+ieFHC8MgGgO3JKxzXA0KAX6cMlbGVPbrGmyoKvk1YaFRFYGk6ziWMGogMHT9Wh
	9sJa4t4ctBD42UaTOG8mc/jQvMAOGhs+fjj7+qowTmgK9GnQSnM9BCaVp7HH7RAci9B0
	NjCQ==
X-Received: by 10.194.157.68 with SMTP id wk4mr65571wjb.42.1403604882813;
	Tue, 24 Jun 2014 03:14:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	hi2sm42362798wjb.29.2014.06.24.03.14.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Jun 2014 03:14:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 24 Jun 2014 12:14:43 +0200
To: Tom King <ka6sox@gmail.com>, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20140624101443.GO2437@jama>
References: <20140619113451.GO2117@jama>
MIME-Version: 1.0
In-Reply-To: <20140619113451.GO2117@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: Few archives to add on sources.oe.org
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
X-List-Received-Date: Tue, 24 Jun 2014 10:14:45 -0000
X-Groupsio-MsgNum: 54341
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hXth9cGL35Nvpk4x"
Content-Disposition: inline

--hXth9cGL35Nvpk4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 01:34:51PM +0200, Martin Jansa wrote:
> Hi Tom,
>=20
> can you please add:
> IO-Tty-1.10.tar.gz
> SQLAlchemy-0.7.9.tar.gz
> fetchmail-6.3.26.tar.xz
> usb-modeswitch-2.0.1.tar.bz2
> usb-modeswitch-data-20130807.tar.bz2
>=20
> to sources.oe.org? I can send you tarballs (or fetch them from
> /home/jenkins/oe/shr-core-branches/downloads-missing/ on aruba)
>=20
> The most annoying is fetchmail which is now fetching HTML page from
> berlios (so checksum check fails instead of showing 404) :/. And user
> needs to download it manually or use sources.oe.org as PREMIRROR, but
> still better than nothing.

I've found only one more missing in upstream sites and used from dora
branch

daq-2.0.1.tar.gz

I've verified that
http://download.lunar-linux.org/lunar/mirrors/daq-2.0.1.tar.gz
provides correct checksum or you can fetch it from aruba as before.

SRC_URI[md5sum] =3D "044aa3663d44580d005293eeb8ccf175"
SRC_URI[sha256sum] =3D "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d1ba=
1ea6ce518ec6d"

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hXth9cGL35Nvpk4x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOpT5MACgkQN1Ujt2V2gBwdBACfbJxIqRF/ECSI0XgIa7i3N0pp
JEgAoIJiPI9dlwWWK9jCidWnQKMVLv24
=xwEM
-----END PGP SIGNATURE-----

--hXth9cGL35Nvpk4x--
