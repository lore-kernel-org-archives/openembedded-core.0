Received: from mail-da0-f52.google.com ([209.85.210.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U33rR-0005J2-Re; Wed, 06 Feb 2013 13:12:26 +0100
Received: by mail-da0-f52.google.com with SMTP id f10so604122dak.11
	for <multiple recipients>; Wed, 06 Feb 2013 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=pP5lv1b5IMXExVdgHL+QdyCtki+W7x5YQInY3VGvl08=;
	b=XzB6FvgIF836Aj8bO+//DM47vm4HDeWSgca1JFUq00q2DcBJEkzlRAQBdapc7v199R
	H7mVtxUWfai50XOXC7ivldicMojt4GzLAVWfexwBSRjFp/sr8d228aYO4nlNQvEZMNym
	+83FRayNqmffIxs7ZHZ6KghpRlRs5W8yjbkj4ieR+BLBCNp9D37h7onTUfGuYfBx4wII
	gj7iEw4O/enPhS3TMbu+U6a9NRb2Xlx1pzDQ3+tI2r8sNKOg375QKPi95b7pR+taHCfK
	j0GSBYLoGlL+n5Th3R0x3sP9g3YFXZ5KA4BJaLufKxyEW4uX0busGJZB8wc0DG+9rNdr
	OZSQ==
X-Received: by 10.66.88.133 with SMTP id bg5mr75199768pab.21.1360151789826;
	Wed, 06 Feb 2013 03:56:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bi8sm37194061pab.15.2013.02.06.03.56.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 03:56:28 -0800 (PST)
Date: Wed, 6 Feb 2013 12:56:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130206115620.GT3271@jama>
References: <20130206093802.16EA32097@opal>
MIME-Version: 1.0
In-Reply-To: <20130206093802.16EA32097@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : add fontcache.bbclass
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
X-List-Received-Date: Wed, 06 Feb 2013 12:12:26 -0000
X-Groupsio-MsgNum: 35092
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fu8LepSeDvpxVgv6"
Content-Disposition: inline

--fu8LepSeDvpxVgv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 09:38:02AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 0c12f7fb3c2c42e5b633682bb1277b943ac19ea6
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D0c12f7fb3c2c42e5b633682bb1277b943ac19ea6
>=20
> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Date:   Thu Jan 31 09:59:10 2013 +0200
>=20
> add fontcache.bbclass
>=20
> All font packages should inherit this class in order to generate the
> proper postinst/postrm scriptlets.
>=20
> The scriptlets will actually create a host intercept hook that will be
> executed at the end, at do_rootfs time, after all packages have been
> installed. This is good when there are many font packages.

Fails in do_rootfs here, but without any details in log:
Building from feeds activated!
Running intercept scripts:
> Executing update_font_cache
ERROR: Function failed: do_rootfs (see
/OE/shr-core/tmp-eglibc/work/tuna-oe-linux-gnueabi/shr-image/2.0-r20/temp/l=
og.do_rootfs.2236
for further information)

> [YOCTO #2923]
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/classes/fontcache.bbclass |   47 ++++++++++++++++++++++++++++++++++=
++++++
>  1 files changed, 47 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbcl=
ass
> new file mode 100644
> index 0000000..8381735
> --- /dev/null
> +++ b/meta/classes/fontcache.bbclass
> @@ -0,0 +1,47 @@
> +#
> +# This class will generate the proper postinst/postrm scriptlets for font
> +# packages.
> +#
> +
> +DEPENDS +=3D "qemu-native"
> +inherit qemu
> +
> +FONT_PACKAGES ??=3D "${PN}"
> +
> +fontcache_common() {
> +if [ "x$D" !=3D "x" ] ; then
> +	if [ ! -f $INTERCEPT_DIR/update_font_cache ]; then
> +		cat << "EOF" > $INTERCEPT_DIR/update_font_cache
> +#!/bin/sh
> +
> +${@qemu_run_binary(d, '$D', '/usr/bin/fc-cache')} --sysroot=3D$D >/dev/n=
ull 2>&1
> +
> +if [ $? -ne 0 ]; then
> +    exit 1
> +fi
> +
> +EOF
> +	fi
> +	exit 0
> +fi
> +
> +fc-cache
> +}
> +
> +python populate_packages_append() {
> +    font_pkgs =3D d.getVar('FONT_PACKAGES', True).split()
> +
> +    for pkg in font_pkgs:
> +        bb.note("adding fonts postinst and postrm scripts to %s" % pkg)
> +        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar=
('pkg_postinst', True)
> +        if not postinst:
> +            postinst =3D '#!/bin/sh\n'
> +        postinst +=3D d.getVar('fontcache_common', True)
> +        d.setVar('pkg_postinst_%s' % pkg, postinst)
> +
> +        postrm =3D d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pk=
g_postrm', True)
> +        if not postrm:
> +            postrm =3D '#!/bin/sh\n'
> +        postrm +=3D d.getVar('fontcache_common', True)
> +        d.setVar('pkg_postrm_%s' % pkg, postrm)
> +}
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fu8LepSeDvpxVgv6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESROQACgkQN1Ujt2V2gBy+yQCfY6Q73ds91C1oxx8ZPevL+hoX
8iIAoK9l//m6sW46XMQCDO0OWjLF/6gn
=OWnu
-----END PGP SIGNATURE-----

--fu8LepSeDvpxVgv6--
