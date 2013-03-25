Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UK8Kx-0008Nt-Ch
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 15:25:25 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so3207803dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 07:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=98lpOZir94LmVjM+aA+TrhYF5nPiBBPxBKSMNBnh3qg=;
	b=JH6GlKR2yRnlAV1KH8DJzBr0c6bRQLDI0oWHd6hrwHhLJDe47hpeaKVNmSwWNuv1ft
	bynd86MmLYQVVZNPxSHwjh36L6wWYmIvpjJsnS8osWk56MsR+0KHaCcqWSXkXXr+k1VB
	3O8iHKGhoTc5FjJ2UPitIULindeTDGgodlgLPqKB5l7xtFqt5sXMw1pIhTFh1RuA6cV9
	xxuL1UbGTeTOESMQO9RLkjvh7kofaCr85c6qN43FK14fU832F7v0ylyzQxLylkq9K4eN
	MKt1fJMNJpYTuLen9eH73krTBF4exN+YGifX8m7aY15UWKiSiqaOY1V6SOniHKmAh4Uw
	PwrQ==
X-Received: by 10.68.107.4 with SMTP id gy4mr8583357pbb.153.1364220504448;
	Mon, 25 Mar 2013 07:08:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fh1sm15039419pac.1.2013.03.25.07.08.21
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 07:08:23 -0700 (PDT)
Date: Mon, 25 Mar 2013 15:08:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130325140816.GA7539@jama>
References: <20130322170539.C5237504C8@opal>
MIME-Version: 1.0
In-Reply-To: <20130322170539.C5237504C8@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : mesa: rename mesa-dri recipe to just mesa
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
X-List-Received-Date: Mon, 25 Mar 2013 14:25:27 -0000
X-Groupsio-MsgNum: 37007
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline

--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2013 at 05:05:39PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: c8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dc8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
>=20
> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Date:   Tue Mar 19 18:23:56 2013 +0200
>=20
> mesa: rename mesa-dri recipe to just mesa
>=20
> Rename mesa-dri recipes to just mesa. Also, replace all references to
> mesa-dri in all recipes/configs.
>=20
> The reason for this renaming (quote from bugzilla):
>=20
> "mesa-dri is a artefact of mesa-xlib existing, which doesn't anymore.
> mesa-dri should be renamed to mesa."
>=20
> [YOCTO #3385]

How is this supposed to work with incremental builds?

WARNING: The recipe mesa is trying to install files into a shared area
when those files already exist. Those files and their manifest location
are:
   /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv2.so
   Matched in manifest-qemux86-64-mesa-dri
   /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgbm.la
   Matched in manifest-qemux86-64-mesa-dri
   /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgbm.so.1.0.0
   Matched in manifest-qemux86-64-mesa-dri
   /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv2.so.2.0.0
   Matched in manifest-qemux86-64-mesa-dri
   /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv1_CM.so.1.1.0
   Matched in manifest-qemux86-64-mesa-dri
   /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv1_CM.la
=2E. and lot more ..

=66rom what I remember this means, that old mesa-dri files will be kept in
sysroot until I do build from scratch (or sstate-cache). That can be
pretty bad when mesa is upgraded to some new version required by other
components and my incremental sysroot will still keep old mesa-dri
instead.

Yes, I can cleansstate mesa-dri before updating oe-core to include this
commit or revert this commit to cleansstate and then remove revert..
but that's not something average OE user will understand and do.

> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/conf/distro/include/default-providers.inc     |    6 +++---
>  meta/conf/machine/include/ia32-base.inc            |    4 ++--
>  meta/conf/machine/include/qemu.inc                 |    8 ++++----
>  meta/conf/machine/qemux86-64.conf                  |    8 ++++----
>  meta/conf/machine/qemux86.conf                     |    8 ++++----
>  meta/recipes-graphics/mesa/libglu_9.0.0.bb         |    2 +-
>  meta/recipes-graphics/mesa/mesa-common.inc         |    5 +----
>  meta/recipes-graphics/mesa/mesa-dri_git.bb         |    8 --------
>  meta/recipes-graphics/mesa/mesa-git.inc            |    1 -
>  .../mesa/{mesa-dri.inc =3D> mesa.inc}                |   11 ++++++++---
>  .../mesa/{mesa-dri_9.0.2.bb =3D> mesa_9.0.2.bb}      |    2 +-
>  meta/recipes-graphics/mesa/mesa_git.bb             |    7 +++++++
>  meta/recipes-graphics/wayland/weston_1.0.3.bb      |    6 +++---
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
>  14 files changed, 39 insertions(+), 39 deletions(-)
>=20
> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dcommi=
tdiff;h=3Dc8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFQWlAACgkQN1Ujt2V2gByWugCcCUlqQJ03sJSyaHxsXLVtGTkU
jY0AnR0SklTL0WRe06E/vUkt6yTEF/MB
=V1yl
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
