Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7033F65D5E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 21:38:02 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so58402wib.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 14:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VSM8rvtB+wjtXYca1vgDcwQ/yLFwIXsXmcGr6Ig7Fuo=;
	b=UfT9m4nfVq2NDpH7wEp0RgZT7rYIu3wOvRyC/iwaqbyjHOzqjNw60MCzc1kHcg4+4l
	EWM/P9sLUEMZQZt68G+H+OgOi8n7+7E9VN0TR6PG7W8KSSizpR0cQA6W2HhrKqZ4GXGa
	NJr+7h5EaCzfu+eZ1vWyaaTWn+jIOuAw6KST+v68JvWSySF/yB7zDTydDtbeNkxWhHoS
	dVd2fBZOEfPBgdSeKr5htzXl4u+sSE8z+/j3zWZwy1VAqs+4Pu3JGViK7IOH6yXECYcu
	2aUjW5TVfjwEcu+R4ROtpJb2CzKw8+wgs6EEYYdq1vJD+OH0hay4YxrrC18a54FBaHme
	RARQ==
X-Received: by 10.180.100.133 with SMTP id ey5mr315830wib.16.1407447483181;
	Thu, 07 Aug 2014 14:38:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p3sm12591873wjw.13.2014.08.07.14.38.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 14:38:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Aug 2014 23:38:33 +0200
To: Max Eliaser <max.eliaser@intel.com>
Message-ID: <20140807213833.GY14848@jama>
References: <cover.1407445120.git.max.eliaser@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1407445120.git.max.eliaser@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Upstream recipe for bootchart2 from WebOS (revised again)
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
X-List-Received-Date: Thu, 07 Aug 2014 21:38:04 -0000
X-Groupsio-MsgNum: 56132
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x0Bbm7aQwrWvLJ2v"
Content-Disposition: inline

--x0Bbm7aQwrWvLJ2v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 01:59:20PM -0700, Max Eliaser wrote:
> Hello list,
>=20
> This series adds a recipe for the bootchart2 daemon (a fork of the origin=
al
> bootchart.) It's based on a recipe from Meta-WebOS, but with extensive
> modifications.
>=20
> It is intended that bootchart2 will supersede the other bootchart daemons
> kicking around in oe-core/meta-oe. See bug 5893. [1]
>=20
> (Resubmitted this series yet again because I'd mistakenly included Yocto-
> specific changes in addition to oe-core ones.)

This one is missing pycairo change, is it intentional?

>=20
> Regards,
> -Max Eliaser
>=20
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5893
> The following changes since commit 86afd7eb7c679eb065706137f28f44248f3fbc=
5a:
>=20
>   ghostscript: Remove bogus gsfonts reference from DESCRIPTION (2014-08-0=
6 11:14:40 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib meliaser/bootchart2-attempt3
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dmeliaser/boo=
tchart2-attempt3
>=20
> Max Eliaser (2):
>   bootchart2: create recipe for bootchart2
>   ubootchart: delete ubootchart recipe
>=20
>  .../bootchart2/bootchart2/bootchartd_stop.sh       |  18 +++
>  meta/recipes-devtools/bootchart2/bootchart2_git.bb | 148 +++++++++++++++=
++++++
>  .../ubootchart/files/sysvinit.patch                |  14 --
>  .../ubootchart/files/ubootchart-stop               |   3 -
>  .../ubootchart/files/ubootchart.desktop            |   6 -
>  meta/recipes-devtools/ubootchart/ubootchart_svn.bb |  39 ------
>  6 files changed, 166 insertions(+), 62 deletions(-)
>  create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/bootchart=
d_stop.sh
>  create mode 100644 meta/recipes-devtools/bootchart2/bootchart2_git.bb
>  delete mode 100644 meta/recipes-devtools/ubootchart/files/sysvinit.patch
>  delete mode 100644 meta/recipes-devtools/ubootchart/files/ubootchart-stop
>  delete mode 100644 meta/recipes-devtools/ubootchart/files/ubootchart.des=
ktop
>  delete mode 100644 meta/recipes-devtools/ubootchart/ubootchart_svn.bb
>=20
> --=20
> 1.8.3.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x0Bbm7aQwrWvLJ2v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPj8dkACgkQN1Ujt2V2gByw5ACgrnDVKZn7dzuxkLv0L0axtiOK
x9kAn34hEmeqoPxaqusHB1XFhU72PfoJ
=G2/F
-----END PGP SIGNATURE-----

--x0Bbm7aQwrWvLJ2v--
