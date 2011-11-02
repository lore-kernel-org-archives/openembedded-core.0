Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLiMl-0008Lj-RK
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 22:28:59 +0100
Received: by faas16 with SMTP id s16so967296faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 14:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/jNA9seJa4zPKf0smXpuqmB2QUQS2sarSXbqnmdq1Ds=;
	b=JElU3dQKyGqBosmwOpzw5EuG2bHJePMFePvoyGW/ZpanVffFPSAI1OOV8AG/nG9LG7
	9Ft0+NtgWcYkXyU1npPM2zMN3R/QApxP7ZjuFhZW3E3aDopUWazP03Ruq11l/lQRoD8I
	QldaAwQLXf7XAMwMQ5ZXfSY1EeFRDNfFPhswY=
Received: by 10.223.77.71 with SMTP id f7mr11010956fak.33.1320268968184;
	Wed, 02 Nov 2011 14:22:48 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r7sm7853346faa.3.2011.11.02.14.22.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 14:22:46 -0700 (PDT)
Date: Wed, 2 Nov 2011 22:22:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111102212240.GG9949@jama.jama.net>
References: <cover.1320268188.git.mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1320268188.git.mark.hatle@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/1] Uprev to pseudo 1.2
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
X-List-Received-Date: Wed, 02 Nov 2011 21:28:59 -0000
X-Groupsio-MsgNum: 11833
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iJXiJc/TAIT2rh2r"
Content-Disposition: inline

--iJXiJc/TAIT2rh2r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 02, 2011 at 04:11:57PM -0500, Mark Hatle wrote:
> Uprev to pseudo 1.2.
>=20
> This was heavily tested by building oe-core with numerous image=20
> configurations.  Each configuration generated the same image before and=
=20
> after the change from the current to new version of pseudo.
>=20
> The primary purpose of this change is to enable the PSEUDO_UNLOAD=20
> functionality that may be used for performance enhancements in future=20
> versions of oe-core.
>=20
> The following changes since commit 37579d7d74d127c90c1e078d05c5bf4ba0b3f7=
55:
>=20
>   meta: glib-2.0: don't apply qsort_r test removable patch for native ver=
sion (2011-11-02 09:08:21 +0000)
>=20
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/pseudo
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/pseudo

Is there branch with pseudo-1.2 for oe-core?

I would like to try it because we have strange errors when libstc++
isn't found when building with pseudo, but same binaries are working
fine without pseudo (seems related to /etc/ld.so.cache being ignored
sometimes from pseudo env).

And while I was trying to debug it I've noticed that files.db and
pseudo.log is quite big.
-rw-r--r-- 1 bitbake bitbake 240M Aug 15 13:49 files.db
-rw-r--r-- 1 bitbake bitbake  91K Aug 15 13:50 logs.db
-rw-r--r-- 1 bitbake bitbake 305M Aug 15 13:49 pseudo.log

with pseudo.log full of errors like this
pseudo: path mismatch [12 links]: ino 39721500 db
'/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/vim-7.2.446-r10.3/image/usr/=
share/vim/vim72/tutor'
req
'/OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/task-shr-feed-1.0-r96'.

Cheers,


>=20
> Mark Hatle (1):
>   pseudo: Uprev pseudo to version 1.2
>=20
>  .../conf/distro/include/distro_tracking_fields.inc |    6 +-
>  .../pseudo/pseudo/realpath_fix.patch               |  165 --------------=
------
>  .../pseudo/{pseudo_1.1.1.bb =3D> pseudo_1.2.bb}      |    7 +-
>  meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +-
>  4 files changed, 9 insertions(+), 175 deletions(-)
>  delete mode 100644 meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
>  rename meta/recipes-devtools/pseudo/{pseudo_1.1.1.bb =3D> pseudo_1.2.bb}=
 (48%)
>=20
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iJXiJc/TAIT2rh2r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6xtKAACgkQN1Ujt2V2gByRMwCfQyBsrJ+SHP/dV0qZfZLRnJSF
SeoAoKzBK+QW/klBUQoRTZEhq9hLQXud
=kN0N
-----END PGP SIGNATURE-----

--iJXiJc/TAIT2rh2r--
