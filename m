Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RgWId-00046h-8k
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 07:50:43 +0100
Received: by eeit10 with SMTP id t10so8516205eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Dec 2011 22:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LRzAqHSPN93ICZzJiV/UXq91Un0gwmupOMw8dV2bRKs=;
	b=g99Nsq8R/ZeJPnj5j4QqEIPEF1sWSnYXZhaM+ZHfINM5JbMDxxN4cisWCNjtVHq/t2
	KoGu2SVebWSD4iU+V/EO0nc11HO8IBh5yTSD5fX7Th0bCB9UwKns+ZWxAgHJ4+EgXJbI
	yDiZ+RMAm3bZblbzvv+vL+ycRQeCv1CLKGCqM=
Received: by 10.213.32.204 with SMTP id e12mr2297792ebd.128.1325227408013;
	Thu, 29 Dec 2011 22:43:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s16sm143963888eef.2.2011.12.29.22.43.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Dec 2011 22:43:27 -0800 (PST)
Date: Fri, 30 Dec 2011 07:43:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111230064325.GD16885@jama.jama.net>
References: <cover.1325215668.git.lianhao.lu@intel.com>
	<3ee0f9a266596ef833e9d64990cbd77b3dd84462.1325215668.git.lianhao.lu@intel.com>
MIME-Version: 1.0
In-Reply-To: <3ee0f9a266596ef833e9d64990cbd77b3dd84462.1325215668.git.lianhao.lu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PRService/meta 3/3] conf/bitbake.conf: basichash as default signature.
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
X-List-Received-Date: Fri, 30 Dec 2011 06:50:43 -0000
X-Groupsio-MsgNum: 14942
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Content-Disposition: inline

--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 30, 2011 at 11:50:53AM +0800, Lianhao Lu wrote:
> [YOCTO #1555]
> Make basichash as default signature handler

I hope someone have tried to do incremental builds for some bigger image
(not just core-*) for multiple machines over few weeks, because my
observation
http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg114=
38.html
still holds.

Regards,

>=20
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
>  meta/conf/bitbake.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 6b1744f..eca37e5 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -738,7 +738,7 @@ TRANSLATED_TARGET_ARCH ??=3D "${@d.getVar('TARGET_ARC=
H', True).replace("_", "-")}"
>  BB_CONSOLELOG =3D "${TMPDIR}/cooker.log.${DATETIME}"
> =20
>  # Setup our default hash policy
> -BB_SIGNATURE_HANDLER ?=3D "basic"
> +BB_SIGNATURE_HANDLER ?=3D "basichash"
>  BB_HASHTASK_WHITELIST ?=3D "(.*-cross$|.*-native$|.*-cross-initial$|.*-c=
ross-intermediate$|^virtual:native:.*|^virtual:nativesdk:.*)"
>  BB_HASHBASE_WHITELIST ?=3D "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_D=
IR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM =
USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRS=
ERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN"
> =20
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk79XY0ACgkQN1Ujt2V2gBxloACgoA45AZVvu4h6dYgYorDxtpzr
bH4An1KArv1Bn4b4CDeeRqlOz2sUBtJc
=GMEW
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--
