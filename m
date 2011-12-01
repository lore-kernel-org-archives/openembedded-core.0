Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW1hc-0003Bo-MW
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 09:09:08 +0100
Received: by bkbzv15 with SMTP id zv15so1350934bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 00:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P1Xyjrah24GhXCwySd+EVg3lv6HXjKeY4ZY+MDU3fik=;
	b=KYaUbxUWttdJ2kx9300E1zI5ukZHfTl67JSpWI29cA5hjfG/GPUSnRZgc2GlLLrGs7
	0ZpV0feoK6zlvFL3LclaDrIZFw/HpgOm6SznsYCd6mvkU/0bsIZioar015jUeFL56R18
	vuMrbfa5rF14O61teqSJKyS3VuJM3tAH8Au7s=
Received: by 10.204.154.25 with SMTP id m25mr5933544bkw.140.1322726547515;
	Thu, 01 Dec 2011 00:02:27 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id jf4sm9619810bkc.5.2011.12.01.00.02.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 00:02:26 -0800 (PST)
Date: Thu, 1 Dec 2011 09:02:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201080213.GE29875@jama.jama.net>
References: <cover.1322662245.git.dexuan.cui@intel.com>
	<05e28e6a8cd5c930a0c538121ced79d008f0fdf3.1322662245.git.dexuan.cui@intel.com>
MIME-Version: 1.0
In-Reply-To: <05e28e6a8cd5c930a0c538121ced79d008f0fdf3.1322662245.git.dexuan.cui@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 6/8] xcb-util: upgrade from 0.3.6 to 0.3.8
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
X-List-Received-Date: Thu, 01 Dec 2011 08:09:09 -0000
X-Groupsio-MsgNum: 13387
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Vw0j8UKbyX0bfpA"
Content-Disposition: inline

--6Vw0j8UKbyX0bfpA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2011 at 10:12:32PM +0800, Dexuan Cui wrote:
> updated LIC_FILES_CHKSUM since the code was re-organized, but the license
> remains the same.
>=20
> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> ---
>  meta/recipes-graphics/xcb/xcb-util_0.3.6.bb |   18 ------------------
>  meta/recipes-graphics/xcb/xcb-util_0.3.8.bb |    9 +++++++++
>  2 files changed, 9 insertions(+), 18 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xcb/xcb-util_0.3.6.bb
>  create mode 100644 meta/recipes-graphics/xcb/xcb-util_0.3.8.bb

Because there is only one .so lib now after:
http://cgit.freedesktop.org/xcb/util/commit/?id=3D118a3c86b3d3b2fab20f365e4=
a5703e40ad2e1b1

the resulting package is renamed from
Package xcb-util (0.3.6-r0) is installed on root and has the following
files:
/usr/lib/libxcb-aux.so.0
/usr/lib/libxcb-keysyms.so.1
/usr/lib/libxcb-icccm.so.1
/usr/lib/libxcb-image.so.0.0.0
/usr/lib/libxcb-atom.so.1.0.0
/usr/lib/libxcb-icccm.so.1.0.0
/usr/lib/libxcb-event.so.1
/usr/lib/libxcb-reply.so.1.0.0
/usr/lib/libxcb-property.so.1.0.0
/usr/lib/libxcb-render-util.so.0.0.0
/usr/lib/libxcb-property.so.1
/usr/lib/libxcb-reply.so.1
/usr/lib/libxcb-image.so.0
/usr/lib/libxcb-atom.so.1
/usr/lib/libxcb-event.so.1.0.0
/usr/lib/libxcb-render-util.so.0
/usr/lib/libxcb-aux.so.0.0.0
/usr/lib/libxcb-keysyms.so.1.0.0

Now it's libxcb-util0, because of only one .so
packages-split/xcb-util
packages-split/xcb-util/usr
packages-split/xcb-util/usr/lib
packages-split/xcb-util/usr/lib/libxcb-util.so.0.0.0
packages-split/xcb-util/usr/lib/libxcb-util.so.0

So we need at least PR bumps for recipes which were RDEPENDing on
xcb-util (ie because of shlibs). I'll send patches later for recipes
which are failing for me now..

Cheers,

>=20
> diff --git a/meta/recipes-graphics/xcb/xcb-util_0.3.6.bb b/meta/recipes-g=
raphics/xcb/xcb-util_0.3.6.bb
> deleted file mode 100644
> index 1057b34..0000000
> --- a/meta/recipes-graphics/xcb/xcb-util_0.3.6.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require xcb-util.inc
> -
> -LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://xcb-util-common.h;endline=3D30;md5=3D6c7459=
5925fd773cc8cf387ff7bc53c7 \
> -                    file://reply/reply.c;endline=3D27;md5=3Df9a1d6b55bba=
632d349949cbf33cd635 \
> -                    file://aux/xcb_aux.c;endline=3D30;md5=3Dae305b9c2a38=
f9ba27060191046a6460 \
> -                    file://renderutil/xcb_renderutil.h;endline=3D24;md5=
=3Dd0ddab3052dd4949c93cfcb0891c96df \
> -                    file://event/xcb_event.h;endline=3D27;md5=3D627be355=
aee59e1b8ade80d5bd90fad9 \
> -                    file://property/xcb_property.h;endline=3D27;md5=3Df5=
890866ee0c655c36ef1c6c738fee6b \
> -                    file://keysyms/keysyms.c;endline=3D30;md5=3D2f8de023=
ed823bb92f0b47900574ea9e \
> -                    file://image/xcb_pixel.h;beginline=3D4;endline=3D27;=
md5=3D48cd25ae55e7de525fe1e1a3a7672e1c"
> -
> -
> -PR =3D "r0"
> -
> -
> -SRC_URI[md5sum] =3D "dd8968b8ee613cb027a8ef1fcbdc8fc9"
> -SRC_URI[sha256sum] =3D "ffb8ee11ab015858a970ab7edd56bd2436b281657596561d=
8429d4a90df60e57"
> diff --git a/meta/recipes-graphics/xcb/xcb-util_0.3.8.bb b/meta/recipes-g=
raphics/xcb/xcb-util_0.3.8.bb
> new file mode 100644
> index 0000000..b7eff29
> --- /dev/null
> +++ b/meta/recipes-graphics/xcb/xcb-util_0.3.8.bb
> @@ -0,0 +1,9 @@
> +require xcb-util.inc
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://src/xcb_aux.c;endline=3D30;md5=3Dae305b9c2a=
38f9ba27060191046a6460 \
> +                    file://src/xcb_event.h;endline=3D27;md5=3D627be355ae=
e59e1b8ade80d5bd90fad9"
> +PR =3D "r0"
> +
> +SRC_URI[md5sum] =3D "8ce019c4bbf20dce246b98f177cfccff"
> +SRC_URI[sha256sum] =3D "c1eed9284750bc09352e60654df77bb585dbbe7673fdcc67=
5e58b7f3a0b447b9"
> --=20
> 1.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6Vw0j8UKbyX0bfpA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7XNIUACgkQN1Ujt2V2gBzGMgCfUZSD2XPBY8LvSemMnGF3IfUn
iAMAnRQ0kC6KuA8tAkDHH70rNEbNBWwj
=yN2l
-----END PGP SIGNATURE-----

--6Vw0j8UKbyX0bfpA--
