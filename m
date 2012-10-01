Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIeu1-0004V2-9Z
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 14:15:13 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2071548wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2012 05:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=axoK8VEqtaSPbdVnhXTfnW8VeTm1ccGzzLyh+ySqKjM=;
	b=P9ANcNEsebR6Zdw1YdM2k+yRXv4K0ozzoeDLKLwZdtmfWxGmIFC0wB0HjWk9hXYgbX
	KriK5HyiaEStT7g5kfZZ2udSHoioe3U1XVrKKi0jFr8k2VqYAFythWNYPW3TCNxzbPub
	vGW339XGWinJkH0uOeuDfSrXjv7hzAxxcRV64IVAYPh50ajavGHSZe8OlRmkZBkcu2fa
	pAcIeGcW/hC5uyrFCGSSVhr6Cj1NPYChOTBuLVpeUGCXnqxZB2Q9gAh2zFj370dHvU78
	tP2ADbxY3hH09Fq2B/Abdzqk9yBYpSTRmWdXAeSAiaoTCMEZtZcq6qCARiZqZm5vBTRA
	wT/w==
Received: by 10.180.93.106 with SMTP id ct10mr14213549wib.8.1349092936489;
	Mon, 01 Oct 2012 05:02:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q7sm18288016wiy.11.2012.10.01.05.02.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 05:02:15 -0700 (PDT)
Date: Mon, 1 Oct 2012 14:02:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20121001120203.GC3454@jama.jama.net>
References: <1349092569-26895-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1349092569-26895-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libdrm: Remove Cairo dependency
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
X-List-Received-Date: Mon, 01 Oct 2012 12:15:13 -0000
X-Groupsio-MsgNum: 30169
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FsscpQKzF/jJk6ya"
Content-Disposition: inline

--FsscpQKzF/jJk6ya
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 01, 2012 at 12:56:09PM +0100, Ross Burton wrote:
> From: Daniel Stone <daniel@fooishbar.org>
>=20
> This causes a build loop, when DRM depends on Cairo depends on Mesa
> depends on DRM.  We can safely remove it as it's only one libdrm example
> program which uses Cairo, which we won't be needing.  At least it's not
> worth the build loop.
>=20
> Signed-off-by: Daniel Stone <daniel@fooishbar.org>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/drm/libdrm.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics=
/drm/libdrm.inc
> index 5ddab85..cc09791 100644
> --- a/meta/recipes-graphics/drm/libdrm.inc
> +++ b/meta/recipes-graphics/drm/libdrm.inc
> @@ -9,9 +9,9 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://xf86drm.c;beginline=3D9;endline=3D32;md5=3D=
c8a3b961af7667c530816761e949dc71"
>  SRC_URI =3D "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
>  PROVIDES =3D "drm"
> -DEPENDS =3D "libpthread-stubs udev cairo"
> +DEPENDS =3D "libpthread-stubs udev"
> =20
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
> =20
>  #libpciaccess is required starting from libdrm 2.4.26
>  DEPENDS +=3D " libpciaccess"

shouldn't we disable that example explicitly, so that the output is not
different when cairo gets built before libdrm?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FsscpQKzF/jJk6ya
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBphjsACgkQN1Ujt2V2gByMNQCfVcenS1ee4eg85vxCwjABkb9q
aVwAoI86zPCSZYdkqD88d+VVv2VvSwjK
=qVWx
-----END PGP SIGNATURE-----

--FsscpQKzF/jJk6ya--
