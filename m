Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id EB88B609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 13:44:35 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so812308wiv.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 06:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oRhD8pebDT2ajCyxmiii6eIGDzHK9nNsQ2sJ5UbZhNg=;
	b=irGRUmEUQHPDOKMbG86r0ZnsGh0pCn656Y7w6q9DsBsFoPCU8Yu4i1HPRclkBhT2XM
	F04tI/meUD/rbr5HKOId+8ExPPD3eBgeDevhNG7vGmzhgByIF2sp47eD1FaWN0SE0sNm
	t4gPFWe2aM25CTeldEblGEgoeQrHtVW/H9JDGvZXJOyYawiy6KYt4YW4IiOBBhAMa3es
	eznhncdcSgg0CNoH0I3eZNvUE9sWIEhJGRbYjV1HmuE/No4AjZ2ekyhYPTxQZoa5JKLm
	fPfDU4AQfPSBmv1oapXt9gF111PRQKn2HkXMQu5Zrfbhiiyuy3Zj5FAGAD1xfAdzDkm6
	oo7Q==
X-Received: by 10.180.82.97 with SMTP id h1mr5188920wiy.1.1407937475734;
	Wed, 13 Aug 2014 06:44:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	a4sm26953707wib.15.2014.08.13.06.44.34 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 06:44:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Aug 2014 15:45:11 +0200
To: Matt Fleming <matt@console-pimps.org>
Message-ID: <20140813134511.GV14848@jama>
References: <1407935023-9284-1-git-send-email-matt@console-pimps.org>
	<1407935023-9284-2-git-send-email-matt@console-pimps.org>
MIME-Version: 1.0
In-Reply-To: <1407935023-9284-2-git-send-email-matt@console-pimps.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Raymond Danks <ray.danks@se-eng.com>, Mihai Prica <mihai.prica@intel.com>,
	Matt Fleming <matt.fleming@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] recipes-extended: Add iasl recipe
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
X-List-Received-Date: Wed, 13 Aug 2014 13:44:42 -0000
X-Groupsio-MsgNum: 56404
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MyAByWmzZ0TuhS0T"
Content-Disposition: inline

--MyAByWmzZ0TuhS0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2014 at 02:03:42PM +0100, Matt Fleming wrote:
> From: Matt Fleming <matt.fleming@intel.com>
>=20
> Import the Intel ACPI toolchain from the meta-virtualization layer.
>=20
> Cc: Mihai Prica <mihai.prica@intel.com>
> Cc: Raymond Danks <ray.danks@se-eng.com>
> Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> ---
>  meta/recipes-extended/iasl/iasl_20120215.bb | 27 +++++++++++++++++++++++=
++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 meta/recipes-extended/iasl/iasl_20120215.bb
>=20
> diff --git a/meta/recipes-extended/iasl/iasl_20120215.bb b/meta/recipes-e=
xtended/iasl/iasl_20120215.bb
> new file mode 100644
> index 0000000..a14d2ec
> --- /dev/null
> +++ b/meta/recipes-extended/iasl/iasl_20120215.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION =3D "This is a cross development C compiler, assembler and l=
inker environment for the production of 8086 executables (Optionally MSDOS =
COM)"
> +HOMEPAGE =3D "http://www.acpica.org/"
> +LICENSE =3D "Intel-ACPI"
> +LIC_FILES_CHKSUM =3D "file://asldefine.h;endline=3D115;md5=3Dd4d7cf809b8=
b5e03131327b3f718e8f0"
> +SECTION =3D "console/tools"
> +PR =3D "r1"

Drop PR
> +
> +DEPENDS =3D "flex-native bison-native"
> +
> +SRC_URI =3D "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar=
=2Egz"

There is acpica-unix2 in meta-oe:
meta-oe/recipes-extended/acpica/acpica_20140424.bb:SRC_URI =3D "https://acp=
ica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \

can we use that one instead?

> +
> +SRC_URI[md5sum] =3D "324c89e5bb9002e2711e0494290ceacc"
> +SRC_URI[sha256sum] =3D "b2b497415f29ddbefe7be8b9429b62c1f1f6e1ec11456928=
e4e7da86578e5b8d"
> +
> +S =3D "${WORKDIR}/acpica-unix-${PV}/source/compiler"
> +
> +NATIVE_INSTALL_WORKS =3D "1"

this variable isn't used by oe-core

> +BBCLASSEXTEND =3D "native"
> +
> +do_compile() {
> +	CFLAGS=3D"-Wno-error=3Dredundant-decls" $MAKE
> +}
> +
> +do_install() {
> +	mkdir -p ${D}${prefix}/bin
> +	cp ${S}/iasl ${D}${prefix}/bin
> +}
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--MyAByWmzZ0TuhS0T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPra+cACgkQN1Ujt2V2gBzPGwCdEKYKkxuSnGmEKda3o37xsFXi
HX0An2ZMdwpgDBG76CDLhaiaQm3c7t8M
=4fCt
-----END PGP SIGNATURE-----

--MyAByWmzZ0TuhS0T--
