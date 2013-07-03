Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 12A9F61485
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 16:19:18 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d41so191247eek.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 09:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=as7jgNMvfJeji9hqnwdMiyb8n6fTzL6F/GKhWA1Sz3Y=;
	b=bRNqi7p/GuYYR4xKG58InWDfQfF1Ta77umG6jvnv6fy/55O+bF6k+OfGuSTGs2BTg2
	EBntBm7MN4oVsBHYITaPm7JNmfhXSnC3+xOJKAGwf0G+99G3hCwCII2QnsOWM3+Qx1+Z
	lNxGrMKm1IM2GOktSxKttMw3bvHOMxt4vyB6lcs1I5j4OVv39wzB1Ez6LJjK0zvNO/YF
	0aX9SSflyrun3tCIoV6mn1epfstVWzxd7VwWOYvqPxneu+ZB/vfGW+MMAAh0WmihiBuq
	0aWuOZBuHowtPmKAcAd81LFTjxC8w48F8sFIGjpcqewacRSgJGeUe0g1oMS5QIeuBq8w
	tqqQ==
X-Received: by 10.14.115.9 with SMTP id d9mr1707593eeh.87.1372868359402;
	Wed, 03 Jul 2013 09:19:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m1sm45411306eex.17.2013.07.03.09.19.18 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 03 Jul 2013 09:19:18 -0700 (PDT)
Date: Wed, 3 Jul 2013 18:19:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130703161921.GB3452@jama>
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1372861799.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Allow xuser to shutdown
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
X-List-Received-Date: Wed, 03 Jul 2013 16:19:19 -0000
X-Groupsio-MsgNum: 41366
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline

--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 03, 2013 at 05:34:20PM +0300, Laurentiu Palcu wrote:
> The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949=
c9:
>=20
>   bitbake: hob: save button from settings called a nonexisting method (20=
13-07-03 08:13:35 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib lpalcu/b4345_shutdown_icon_root=
less_x
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dlpalcu/b4345=
_shutdown_icon_rootless_x
>=20
> Laurentiu Palcu (4):
>   sysvinit: allow users in shutdown group to perform halt/reboot
>   connman: make xuser a member of 'shutdown' group
>   xserver-nodm-init: make xuser a member of 'shutdown' group
>   shutdown-desktop: give entire path in Exec field

Shouldn't we create separate recipe for xuser or any other default user
and add it to connman and xserver-nodm-init RDEPENDS?

I know there is some overhead from having one more package installed on
image, but it would be a bit easier if we later decide that xuser also
needs some file to be installed in his home or something like that.

>  meta/recipes-connectivity/connman/connman.inc      |    2 +-
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   12 +++++++++---
>  .../x11-common/xserver-nodm-init.bb                |    2 +-
>  .../shutdown-desktop/shutdown-desktop.bb           |    2 +-
>  .../shutdown-desktop/shutdown.desktop              |    4 ++--
>  5 files changed, 14 insertions(+), 8 deletions(-)
>=20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHUTwkACgkQN1Ujt2V2gBwrpwCaAlzUwyelNU8Pg/fdRen6V88C
Fy8An1dlwwq2VfeaQF08bnGO5dHxlsXI
=xQ5A
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
