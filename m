Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Trn8p-0006tX-KA
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 11:07:44 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so10173996pad.39
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=J4jR1GgDQ+1lsf+oMoGSkz0z66JaiPp91csp82/TwLY=;
	b=Yjrah9GqgJIl3pzGRzbeI2t0jpRLVFj+WSjkENL9xkLXU78pP82Y2YbTTVV5ozWpwh
	1S1VO9AnOWJ8FMI0t8zL9ebkKaGfqXmtKHaYGHl0BGQQqzcpxobvMNrmD3gAeBZONjTy
	u04EM1KuHEQVnWFRHV2ZDvOK0xe8CzeJ9Fce3fde0gEnb9Is4pxBgX0HQXJoe2NqTslh
	g4Ncr1Nm9o5Kv6eBviEG0wsgDZf+GsFf/QDVLBam/23PBZUSqE/aqQ95+gsMLxJjtBoN
	D/1G16je6lWnlCDW2elvNpk7uQyBDsb2c97v3oPpU0V0+uKn0wB/jmCttSjryn+MJGzM
	UlSA==
X-Received: by 10.66.82.230 with SMTP id l6mr168752386pay.12.1357465955053;
	Sun, 06 Jan 2013 01:52:35 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	zv10sm35545455pbc.76.2013.01.06.01.52.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:52:34 -0800 (PST)
Date: Sun, 6 Jan 2013 10:52:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20130106095233.GD3272@jama>
References: <cover.1357465230.git.Qi.Chen@windriver.com>
	<1d17c4e8a5cdbfd59016e83b3a6aab810638aebf.1357465230.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1d17c4e8a5cdbfd59016e83b3a6aab810638aebf.1357465230.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V6 3/6] core-image.bbclass: support read-only rootfs
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
X-List-Received-Date: Sun, 06 Jan 2013 10:07:44 -0000
X-List-Received-Date: Sun, 06 Jan 2013 10:07:44 -0000
X-Groupsio-MsgNum: 33331
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tNQTSEo8WG/FKZ8E"
Content-Disposition: inline

--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 06, 2013 at 05:44:25PM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> The hook function is appended to ROOTFS_POSTPROCESS_COMMAND
> properly to support the 'read-only-rootfs' image feature.
>=20
> [YOCTO #3406]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/core-image.bbclass |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bb=
class
> index 2e67018..ebb9597 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -28,6 +28,7 @@ LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D=
3f40d7994397109285ec7b81fdeb3
>  # - dev-pkgs            - development packages (headers, etc.) for all i=
nstalled packages in the rootfs
>  # - dbg-pkgs            - debug symbol packages for all installed packag=
es in the rootfs
>  # - doc-pkgs            - documentation packages for all installed packa=
ges in the rootfs
> +# - read-only-rootfs    - tweaks an image to support read-only rootfs
>  #
>  PACKAGE_GROUP_x11 =3D "packagegroup-core-x11"
>  PACKAGE_GROUP_x11-base =3D "packagegroup-core-x11-base"
> @@ -73,9 +74,9 @@ inherit image
> =20
>  # Create /etc/timestamp during image construction to give a reasonably s=
ane default time setting
>  ROOTFS_POSTPROCESS_COMMAND +=3D "rootfs_update_timestamp ; "
> -
>  # Zap the root password if debug-tweaks feature is not enabled
>  ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_contains("IMAGE_FEATURES", "deb=
ug-tweaks", "", "zap_root_password ; ",d)}'
>  # Allow openssh accept empty password login if both debug-tweaks and ssh=
-server-openssh are enabled
>  ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_contains("IMAGE_FEATURES", "deb=
ug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
> -
> +# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs i=
s enabled

This read_only_rootfs_hook does more than that, please update comment

Cheers,

> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_contains("IMAGE_FEATURES", "rea=
d-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tNQTSEo8WG/FKZ8E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDpSWEACgkQN1Ujt2V2gBwTgwCghoLETIUfTLPu6Z8JQ1/7W6Q9
iFUAoLIeeFCahQCSgz+9oQUbpsUxOpkN
=Zrll
-----END PGP SIGNATURE-----

--tNQTSEo8WG/FKZ8E--
