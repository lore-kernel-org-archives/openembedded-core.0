Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RuIlJ-0005k7-JN
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 08:13:18 +0100
Received: by eekd41 with SMTP id d41so1743963eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 23:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=nukwGnZMdHFA61/o02e5EH1ozog2euHsm40wQWZ+VQ4=;
	b=mglGet8PGg8lj1iHHo/uaabKg220PUrkNNdOmgVBnCLR3OdDyfQB1Uy/rlcjMdwnnF
	cxNfUmfAk07tGYfhwTrmGo44WiK/mv1q3m++jq7XfXUyVjCgpOB5AfxP6121Vs48n0SU
	Y4FQvgDH01KtjNTehYncpNiYCKRrAytFruCuI=
Received: by 10.14.27.193 with SMTP id e41mr185777eea.23.1328511916924;
	Sun, 05 Feb 2012 23:05:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm57796145eeb.8.2012.02.05.23.05.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 23:05:15 -0800 (PST)
Date: Mon, 6 Feb 2012 08:05:14 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120206070513.GC3872@jama.jama.net>
References: <cover.1328509284.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1328509284.git.xiaofeng.yan@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/2] glib-2.0: Don't check function "qsort_r" in configure.ac
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 07:13:18 -0000
X-Groupsio-MsgNum: 17074
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Content-Disposition: inline

--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 06, 2012 at 02:41:09PM +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> The function "g_qsort_with_data" has two kinds of realization. One calls =
qsort_r
> from libglib, the other realize itself. the realization method is control=
led by macro "HAVE_QSORT_R".
> qsort_r from libglib cause sort error. Add no-check-qsort_r.patch for fix=
ing this problem.
> This patch is to fix bug 1959. After this patch is merged into OE-core I =
will open a new bug to
> track the reason why qsort_r report normally. For finishing lsb test in Y=
OCTO 1.2 M3 this patch
> is applied temporarily.
>=20
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>   Branch: xiaofeng/1959
>   Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofen=
g/1959
>=20
> Thanks,
>     Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---

no-check-qsort_r.patch is the same as remove.test.for.qsort_r.patch from
http://git.openembedded.org/openembedded-core/commit/?id=3D74f43e3b269c01db=
a7cd5215a8e825229bd5ecff

which was later removed from glib-2.0-native in
http://git.openembedded.org/openembedded-core/commit/?id=3D37579d7d74d127c9=
0c1e078d05c5bf4ba0b3f755

and later removed completely in
http://git.openembedded.org/openembedded-core/commit/?id=3D812342e44e9e361a=
0fa93cfcfe65cf4dd6f2fb57

Are you sure this patch is right fix? And no need to split adding patch
itself and adding it to SRC_URI to 2 patches.

Cheers,

>=20
>=20
> Xiaofeng Yan (2):
>   glib-2.0: Don't check function qsort_r
>   glib-2.0: Add patch "no-check-qsort_r.patch"
>=20
>  .../glib-2.0/glib-2.0/no-check-qsort_r.patch       |   61 ++++++++++++++=
++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb      |    3 +-
>  2 files changed, 63 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/no-check-qsort_r.=
patch
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8ve6kACgkQN1Ujt2V2gBynxgCfWSrrQVZ/voSKy9SDpjKy9d/7
+WQAnR+wdb0sIcoRA4i4AFqF4qU9hHdb
=PHQq
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
