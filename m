Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 997DD65CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 13:41:41 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u188so23571366wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 05:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tQ8ZbuLm4jidwsEgSJ6AAORPuqhAq2/KQhM3rK/2ZkM=;
	b=Srg4DSMZTj7N4d66ibFJNNj6B/PI54SyI4U76PbhvNEooAo0jbZ1MG0CaPQUI77v6y
	E/a9tWN84hxoQLcMD8Yoq62191DHVdwfUh6+1S5C9hEAsg3UBgLiM9dtbuV0Y+2zsg8I
	cdjIF48wBEQhI2RLnQoRSKz+n2jVzkjftCi9Ni0ok36IuHZbF8Hx8LE0L0AVKmlCsXx5
	voHh3C2p/ckDD7R3F3quxei/0BBCBEI1eYBi0zkpvnfFsDrwpeIgYASHXBbuZBkyGJRM
	rIeSvUUkRryyVwjhhhKCg5UOeaM1tYSn1EcAXYXinJR1BI989z36qM5OjEpcQBhXqmne
	wi/A==
X-Received: by 10.28.140.201 with SMTP id o192mr4450484wmd.88.1452001301914;
	Tue, 05 Jan 2016 05:41:41 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a126sm3645824wmh.0.2016.01.05.05.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jan 2016 05:41:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 Jan 2016 14:41:50 +0100
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Message-ID: <20160105134150.GA2574@jama>
References: <3ec94ad0d014bd99c4444523c2744e05c7120a89.1451996491.git.adrian.ratiu@ni.com>
	<3182226859c3a37e168480aa8c2d93514de68895.1451996491.git.adrian.ratiu@ni.com>
MIME-Version: 1.0
In-Reply-To: <3182226859c3a37e168480aa8c2d93514de68895.1451996491.git.adrian.ratiu@ni.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] x11vnc: remove all references to moved package
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
X-List-Received-Date: Tue, 05 Jan 2016 13:41:42 -0000
X-Groupsio-MsgNum: 75436
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Content-Disposition: inline

--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2016 at 02:24:23PM +0200, Ioan-Adrian Ratiu wrote:
> Together with the move to meta-oe, all references to x11vnc should be
> removed from oe-core. There are three of these: a distro alias, a
> packagegroup rdepends and a runtime test.
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/conf/distro/include/distro_alias.inc            |  1 -
>  meta/lib/oeqa/runtime/vnc.py                         | 20 --------------=
------
>  .../packagegroups/packagegroup-core-x11-sato.bb      |  2 --
>  3 files changed, 23 deletions(-)
>  delete mode 100644 meta/lib/oeqa/runtime/vnc.py
>=20
> diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro=
/include/distro_alias.inc
> index dfce760..84eaf03 100644
> --- a/meta/conf/distro/include/distro_alias.inc
> +++ b/meta/conf/distro/include/distro_alias.inc
> @@ -436,7 +436,6 @@ DISTRO_PN_ALIAS_pn-which =3D "Mandriva=3Dwhich Fedora=
=3Dwhich"
>  DISTRO_PN_ALIAS_pn-wpa-supplicant =3D "Meego=3Dwpa_supplicant Fedora=3Dw=
pa_supplicant OpenSuSE=3Dwpa_supplicant Ubuntu=3Dwpasupplicant Mandriva=3Dw=
pa_supplicant Debian=3Dwpasupplicant"
>  DISTRO_PN_ALIAS_pn-x11-common =3D "OE-Core"
>  DISTRO_PN_ALIAS_pn-x11perf =3D "Fedora=3Dxorg-x11-apps Ubuntu=3Dx11-apps"
> -DISTRO_PN_ALIAS_pn-x11vnc =3D "Fedora=3Dx11vnc Ubuntu=3Dx11vnc"
>  DISTRO_PN_ALIAS_pn-xcb-util-image =3D "Debian=3Dxcb-util Fedora=3Dxcb-ut=
il"
>  DISTRO_PN_ALIAS_pn-xcb-util-keysyms =3D "Debian=3Dxcb-util Fedora=3Dxcb-=
util"
>  DISTRO_PN_ALIAS_pn-xcb-util-wm =3D "Debian=3Dxcb-util Fedora=3Dxcb-util"
> diff --git a/meta/lib/oeqa/runtime/vnc.py b/meta/lib/oeqa/runtime/vnc.py
> deleted file mode 100644
> index f31deff..0000000
> --- a/meta/lib/oeqa/runtime/vnc.py
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -from oeqa.oetest import oeRuntimeTest, skipModuleUnless
> -from oeqa.utils.decorators import *
> -import re
> -
> -def setUpModule():
> -    skipModuleUnless(oeRuntimeTest.hasPackage('x11vnc'), "No x11vnc pack=
age in image")
> -
> -class VNCTest(oeRuntimeTest):
> -
> -    @testcase(213)
> -    @skipUnlessPassed('test_ssh')
> -    def test_vnc(self):
> -        (status, output) =3D self.target.run('x11vnc -display :0 -bg -o =
x11vnc.log')
> -        self.assertEqual(status, 0, msg=3D"x11vnc server failed to start=
: %s" % output)
> -        port =3D re.search('PORT=3D[0-9]*', output)
> -        self.assertTrue(port, msg=3D"Listening port not specified in com=
mand output: %s" %output)
> -
> -        vncport =3D port.group(0).split('=3D')[1]
> -        (status, output) =3D self.target.run('netstat -ntl | grep ":%s"'=
 % vncport)
> -        self.assertEqual(status, 0, msg=3D"x11vnc server not running on =
port %s\n\n%s" % (vncport, self.target.run('netstat -ntl; cat x11vnc.log')[=
1]))
> diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.b=
b b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> index 753d2bf..812735e 100644
> --- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> +++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> @@ -9,7 +9,6 @@ PR =3D "r33"
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =20
>  inherit packagegroup distro_features_check
> -# rdepends on x11vnc
>  REQUIRED_DISTRO_FEATURES =3D "x11"

This line and distro_features_check inherit aren't needed anymore if
x11vnc was really the only x11 dependency

>  PACKAGES =3D "${PN} ${PN}-base ${PN}-apps ${PN}-games"
> @@ -53,7 +52,6 @@ SUMMARY_${PN}-apps =3D "Sato desktop - applications"
>  RDEPENDS_${PN}-apps =3D "\
>      leafpad \
>      gst-player-bin \
> -    x11vnc \
>      matchbox-terminal \
>      sato-screenshot \
>      ${FILEMANAGER} \
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaLyB0ACgkQN1Ujt2V2gBxVQwCfQgKK2XdsqzKuAYvWnn1XDiVY
2p0AnAsnLK8HhCYgYonjeKjfd6poFhLy
=lxaY
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--
