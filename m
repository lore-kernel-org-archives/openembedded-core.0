Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA1E605F1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 01:34:37 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so40403925pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 18:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/womKixCIzAVt0DqERV88MCl/M7t8dZ8ln9yMbBRpG0=;
	b=dR/3yiJXI7AiLttTTqwpZE7jAqlPUqte6pFcW7e9zldFl6lL732BNO3fn3bMh4o7Ar
	Quioo+MxeqYrUs62YBWK22jLLJbP5tk9HIxq8Dwf4yExZjlmgZu4jzmAihUTOILE84px
	i9/qdO+ONm5ZAuXwA1PBi2EAMXuoR1SXYBd9BtxRE4lY8k17wrpv/FQ2+tRauz+6KOU/
	FLC4hpRZuTGQ8rOU2G7HlGeLdzyKGUyhVL/ZyHG8rgVy1kN+lpW7eIqTnrE0X5RDK8tF
	nkeKjHlNH0O2WEDvH4msdITFHL7iWOOSuyS6H6rgkBmOsKfqydN7kvfqZCCMhq12PlvB
	RRvA==
X-Received: by 10.70.35.130 with SMTP id h2mr41967134pdj.28.1428456878918;
	Tue, 07 Apr 2015 18:34:38 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:4c5a:4d1d:52d6:ba3f?
	([2601:9:3580:84c:4c5a:4d1d:52d6:ba3f])
	by mx.google.com with ESMTPSA id pv4sm9168949pbb.17.2015.04.07.18.34.37
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Apr 2015 18:34:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1849e3c3ca006bb7e3cb406aa5d040eeec226d80.1428410929.git.liezhi.yang@windriver.com>
Date: Tue, 7 Apr 2015 18:34:36 -0700
Message-Id: <27D7EBDF-FA94-4B14-B185-69C3BD080239@gmail.com>
References: <cover.1428410929.git.liezhi.yang@windriver.com>
	<1849e3c3ca006bb7e3cb406aa5d040eeec226d80.1428410929.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] bzip2: remove bzip2-dev from PACKAGES
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
X-List-Received-Date: Wed, 08 Apr 2015 01:34:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 7, 2015, at 5:58 AM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> There should be only one dev package which is libbz2-dev, so remove
> bzip2-dev.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> meta/recipes-extended/bzip2/bzip2_1.0.6.bb |    3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb =
b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> index ed12277..d1d1c8d 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> @@ -17,6 +17,7 @@ SRC_URI[md5sum] =3D =
"00b516f4704d4a7cb50a1d97e6e8e15b"
> SRC_URI[sha256sum] =3D =
"a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
>=20
> PACKAGES =3D+ "libbz2 libbz2-dev libbz2-staticdev"
> +PACKAGES_remove =3D "bzip2-dev bzip2-staticdev=E2=80=9D

why remove ${PN}-dev ? others should be removed IMO

>=20
> CFLAGS_append =3D " -fPIC -fpic -Winline -fno-strength-reduce =
-D_FILE_OFFSET_BITS=3D64"
>=20
> @@ -35,7 +36,7 @@ do_install_ptest () {
>=20
> FILES_libbz2 =3D "${libdir}/lib*${SOLIBS}"
>=20
> -FILES_libbz2-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV}"
> +FILES_libbz2-dev =3D "${includedir} ${libdir}/lib*${SOLIBSDEV} =
${libdir}/lib*.la"
> SECTION_libbz2-dev =3D "devel"
> RDEPENDS_libbz2-dev =3D "libbz2 (=3D ${EXTENDPKGV})"
>=20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


