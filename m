Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1URRSB-0003az-PF; Sun, 14 Apr 2013 20:15:04 +0200
Received: by mail-ea0-f179.google.com with SMTP id f15so1838901eak.38
	for <multiple recipients>; Sun, 14 Apr 2013 10:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=qgebn8qcWw6nNajaCG6k/q4XFZ07A6I6oRiQ9OYmJoE=;
	b=SGJfdxwivIiBX13IByLZb0MTLZxykQLbN+sZX7IARopk5sYw+769cfGdGGVko7Wkxq
	OJjdeq///0fIrur51m+udsgm0FOat6/fGcOaCL6wNEUhMe9MBFUCIP3cfj0nCgszeK4b
	2JQsgx6JP5glOIso8NdaHZeN7K1xargUC0NcB0TvUTaLfaDvTLYugCJw0krahDDOtSsh
	f7cDd4MwdJf2A8d7T8kXXzLBfpzmhk/YYGm8x1GAJ8BLc8ACCm8dNjxosYNYZQq75ONH
	GvqERAr397SBZ+Nm7sUN/HNDFS3JpseIQlSRYVSKNi7QqoXMEs/WfNzqPCTbtF8NWmT9
	SxNA==
X-Received: by 10.14.0.5 with SMTP id 5mr8957643eea.13.1365962255925;
	Sun, 14 Apr 2013 10:57:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id b5sm22566244eew.16.2013.04.14.10.57.34
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 10:57:35 -0700 (PDT)
Date: Sun, 14 Apr 2013 19:57:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130414175740.GI2475@jama>
References: <20130318131702.8ADB35040D@opal>
MIME-Version: 1.0
In-Reply-To: <20130318131702.8ADB35040D@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Marcin Juszkiewicz : nss-myhostname: add 0.3 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 18:15:05 -0000
X-Groupsio-MsgNum: 37880
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SdaPbLtAangIkrMZ"
Content-Disposition: inline

--SdaPbLtAangIkrMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2013 at 01:17:02PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 9f46e4c195e4d8bc638191428492e09f1e57cc76
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D9f46e4c195e4d8bc638191428492e09f1e57cc76
>=20
> Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Date:   Thu Mar 14 22:16:34 2013 +0100
>=20
> nss-myhostname: add 0.3 version
>=20
> Meta-linaro layer had own netbase.bbappend which took care of adding
> MACHINE name to /etc/hosts to get it resolvable.
>=20
> Koen Kooi pointed to nss-myhostname as better solution. Tested, works
> fine so I add it for other users.
>=20
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Does this conflict with systemd?

WARNING: The recipe systemd is trying to install files into a shared
area when those files already exist. Those files and their manifest
location are:
   /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemuarm/=
usr/lib/libnss_myhostname.so.2
   Matched in manifest-qemuarm-nss-myhostname
Please verify which package should provide the above files.

>=20
> ---
>=20
>  .../nss-myhostname/nss-myhostname_0.3.bb           |   25 ++++++++++++++=
++++++
>  1 files changed, 25 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/=
meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> new file mode 100644
> index 0000000..d5ed084
> --- /dev/null
> +++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "plugin for the GNU Name Service Switch (NSS) functional=
ity of \
> +the GNU C Library (glibc) providing host name resolution for the locally=
 \
> +configured system hostname as returned by gethostname(2)."
> +HOMEPAGE =3D "http://0pointer.de/lennart/projects/nss-myhostname/"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa3495befef8f17206a5b=
0a1"
> +
> +SRC_URI =3D "http://0pointer.de/lennart/projects/nss-myhostname/nss-myho=
stname-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "d4ab9ac36c053ab8fb836db1cbd4a48f"
> +SRC_URI[sha256sum] =3D "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d=
3a7f6c4d67e7caf2"
> +
> +inherit autotools
> +
> +pkg_postinst_${PN} () {
> +	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
> +		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostnam=
e \3\4\5/' \
> +		-i $D/etc/nsswitch.conf
> +}
> +
> +pkg_prerm_${PN} () {
> +	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
> +		-e '/^hosts:/s/\s*myhostname//' \
> +		-i $D/etc/nsswitch.conf
> +}
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SdaPbLtAangIkrMZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFq7hQACgkQN1Ujt2V2gByDMwCfXFlAXWTo8+Mie7A+Mz1JpGDT
NDsAn2DZ56FdBiCiGxfqnrhDreDoZm15
=4SRn
-----END PGP SIGNATURE-----

--SdaPbLtAangIkrMZ--
