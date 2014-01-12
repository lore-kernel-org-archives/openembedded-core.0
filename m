Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 794706B302;
	Sun, 12 Jan 2014 17:34:59 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e49so1042979eek.1
	for <multiple recipients>; Sun, 12 Jan 2014 09:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=47rDTtXWC/yMQGPT8acdNxfXWzLJJ78Lvm/ezNTMKXg=;
	b=eWoq2K+HYWj+6bo5V7t5w0XJoX5XH8z48BG5RfG8k2nMqt5ykiDEwK+o/dkVArDvXZ
	OLXxKIwwBnJqVkqrchQz+S1P/En5WWuo/CCKn39sdLsI48OEnT+PKBepOB+9V/9t8fni
	RXW1ULwOVKEHJ8yvtl7QTKsCezWBbOxgrToJI/kDcPsDlu+8Van5OV8u/ly0/6XPUno9
	qhOOSK7Ny3AW5Lwg6TxeBz+TOAFxtxMJu9QYKxIvcwxBgGwtN8k7RHLV1SNyZ931ks5f
	Jaer6XbLaHJWDX7gqHgICgg03HY4FTAjF5qBXPLhlP7Gs0Qf0B5ykmgoPH6sWn7LXFTG
	SbWg==
X-Received: by 10.14.184.66 with SMTP id r42mr22755861eem.86.1389548100098;
	Sun, 12 Jan 2014 09:35:00 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm32704508eed.14.2014.01.12.09.34.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Jan 2014 09:34:58 -0800 (PST)
Date: Sun, 12 Jan 2014 18:35:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140112173515.GG16995@jama>
References: <20140103104408.GC3707@jama>
MIME-Version: 1.0
In-Reply-To: <20140103104408.GC3707@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: State of bitbake world, Failed tasks 2014-01-03
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
X-List-Received-Date: Sun, 12 Jan 2014 17:35:00 -0000
X-Groupsio-MsgNum: 48871
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1giRMj6yz/+FOIRq"
Content-Disposition: inline

--1giRMj6yz/+FOIRq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2014 at 11:44:08AM +0100, Martin Jansa wrote:
> With git branches and breakage from freetype upgrade fixed we're back to =
more
> common list of issues.
>=20
> webkit-efl is broken because of freetype upgrade, I'm working on efl upgr=
ade to 1.8.*
> so I'll probably fix it later together with efl upgrade.

It fails even with newer webkit-efl, because it's actually broken in
cmake since freetype upgrade in oe-core, fix sent:
http://lists.openembedded.org/pipermail/openembedded-core/2014-January/0882=
18.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1giRMj6yz/+FOIRq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLS0lMACgkQN1Ujt2V2gByEcACeO55AV7walsbRl9CE7ug2WfzA
3vUAoIZ7vRnGio1SO5Uzo2sz9p88Y3K8
=H6VC
-----END PGP SIGNATURE-----

--1giRMj6yz/+FOIRq--
