Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 87565608BF;
	Thu,  8 Aug 2013 17:24:22 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so1628044eek.37
	for <multiple recipients>; Thu, 08 Aug 2013 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1uAOabOcYcwQzOnOjDHm87qR6HK4cG5pf95772jU7H8=;
	b=x2QrVAScal3bHkgdv8AyRg7cuxyY/Dz5SL0COirgj6hOMHBFIu78bcapbF/SuL1FPY
	rFB9jR87il0RbB93N/GThsRb1j92S9SfeNly6DJzGisIMksgAxjFwm5xfJkYGCBvgikp
	BJ1zAbEE21OZlGmNkkZGO2YUIyx10Rem61UeFz3k0hmigRSxWiOHt8EthYTAILw6wM94
	AHMJC5gFSoqHDL3mP4Nhvh/NUoAJZRQwz54WzHyx0fgyzxLcbdod+P8TQOLTz6uGyrYA
	Ng0cAgei3LTyzsmg9649qIjmlqHAyKawnmMv1ntCCcbNwP6xrGI9Yjgm/aTzufR4lNMh
	9SnQ==
X-Received: by 10.14.213.136 with SMTP id a8mr9250094eep.62.1375982662137;
	Thu, 08 Aug 2013 10:24:22 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c3sm20901055eev.3.2013.08.08.10.24.21 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 10:24:21 -0700 (PDT)
Date: Thu, 8 Aug 2013 19:25:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130808172507.GB3269@jama>
References: <20130731055135.A7345504BD@opal>
MIME-Version: 1.0
In-Reply-To: <20130731055135.A7345504BD@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Hongxu Jia : util-linux: use u-a for su
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
X-List-Received-Date: Thu, 08 Aug 2013 17:24:23 -0000
X-Groupsio-MsgNum: 43120
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8P1HSweYDcXXzwPJ"
Content-Disposition: inline

--8P1HSweYDcXXzwPJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2013 at 05:51:35AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 6190c69a9f78aeef951c39e4c8700e945bbec5f7
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6190c69a9f78aeef951c39e4c8700e945bbec5f7
>=20
> Author: Hongxu Jia <hongxu.jia@windriver.com>
> Date:   Fri Jul 26 20:09:08 2013 +0800
>=20
> util-linux: use u-a for su
>=20
> Use alternatives mechanism to prevent confliction of attempted
> installing su binary among busybox, shadow and util-linux.
>=20
> [YOCTO #4926]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Doesn't seem to work correctly:

Configuring util-linux.
update-alternatives: Linking //bin/dmesg to /bin/dmesg.util-linux
update-alternatives: Linking //bin/kill to /bin/kill.procps
update-alternatives: Linking //bin/more to /bin/more.util-linux
update-alternatives: Linking //sbin/mkswap to /sbin/mkswap.util-linux
update-alternatives: Linking //sbin/blockdev to /sbin/blockdev.util-linux
update-alternatives: Linking //sbin/pivot_root to /sbin/pivot_root.util-lin=
ux
update-alternatives: Linking //sbin/mkfs.minix to /sbin/mkfs.minix.util-lin=
ux
update-alternatives: Linking //usr/bin/hexdump to /usr/bin/hexdump.util-lin=
ux
update-alternatives: Linking //usr/bin/last to /usr/bin/last.util-linux
update-alternatives: Linking //usr/bin/logger to /usr/bin/logger.util-linux
update-alternatives: Linking //usr/bin/mesg to /usr/bin/mesg.util-linux
update-alternatives: Linking //usr/bin/renice to /usr/bin/renice.util-linux
update-alternatives: Linking //usr/bin/wall to /usr/bin/wall.util-linux
update-alternatives: Linking //usr/bin/setsid to /usr/bin/setsid.util-linux
update-alternatives: Linking //usr/bin/chrt to /usr/bin/chrt.util-linux
update-alternatives: Linking //usr/bin/flock to /usr/bin/flock.util-linux
update-alternatives: Linking //sbin/hwclock to /bin/busybox.nosuid
update-alternatives: Linking //usr/bin/utmpdump to /usr/bin/utmpdump.util-l=
inux
update-alternatives: Linking //usr/bin/eject to /usr/bin/eject.util-linux
update-alternatives: Linking //bin/getopt to /usr/bin/getopt
update-alternatives: Error: cannot register alternative su to /usr/bin/su s=
ince it is already registered to /bin/su

SHR root@gjama ~ $ cat /var/lib/opkg/alternatives/su
/bin/su
/bin/busybox.suid 50

should base_bindir be used for ALTERNATIVE_LINK_NAME and bindir for TARGET?

>=20
> ---
>=20
>  meta/recipes-core/util-linux/util-linux.inc |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 3c8c246..961bcc5 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -215,3 +215,10 @@ ALTERNATIVE_LINK_NAME[reset] =3D "${bindir}/reset"
>  ALTERNATIVE_TARGET[reset] =3D "${base_bindir}/reset"
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +python do_package_prepend () {
> +    if '--enable-su' in d.getVar('EXTRA_OECONF', True).split():
> +        alt_name =3D "su"
> +        d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, '%s/%s' % (d.get=
Var('bindir', True), alt_name))
> +        d.appendVar('ALTERNATIVE_%s' % (d.getVar('PN', True)), ' ' + alt=
_name)
> +}
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8P1HSweYDcXXzwPJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlID1HMACgkQN1Ujt2V2gBx7MgCeL+4WxBg0g1QjuP7pqa6x+bSI
tVoAn2mwrDLUCcsIMri79sX3RjwTSu5M
=Dr5S
-----END PGP SIGNATURE-----

--8P1HSweYDcXXzwPJ--
