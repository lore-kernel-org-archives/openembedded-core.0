Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id B2BD573CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 17:59:24 +0000 (UTC)
Received: by wixo5 with SMTP id o5so34816496wix.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 10:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i0SWjkv8x9LzgnZsHt6/B8guAgBdcYs4kbm2on8T1Sk=;
	b=Y1EQ9WUpE/iRNW8TmBGw9qME/Yhu+RkO/VJIyqIB3RfavvwueDfkERhL+ha6ZhUgqf
	lBwn4YjJYmXS2kvvSLp03iM5QdeUQ2gGB+9oyN2XLj6AU966dBFpjpyODBzgAMn4RwBx
	ZprNro6Y1QpsxYlFNVy2gAhfBSLqvJfArt/1+QLGokNdf8j+885VPyhirUqlA6A7fFqW
	CyeEzCjKbOTGhA4bhUFkztodFWqFL/03d5filaHSVZjRFJC+Ms/c/JwuXe+jOi+rUVlO
	xFTUPmLTdMrGbTeFAjnWke4DJ70mqKtR9XL4XPupa6FBCftomwNSfeo7Jv14J+1/XZDc
	jm7g==
X-Received: by 10.180.87.165 with SMTP id az5mr17342360wib.29.1427911165244;
	Wed, 01 Apr 2015 10:59:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p9sm3707133wje.12.2015.04.01.10.59.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 10:59:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Apr 2015 19:59:49 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150401175949.GL14928@jama>
References: <cover.1427874748.git.liezhi.yang@windriver.com>
	<711934cddbc4f8c699487c16e33715cd9a6d5a57.1427874748.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <711934cddbc4f8c699487c16e33715cd9a6d5a57.1427874748.git.liezhi.yang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] glibc: fix a tpo
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
X-List-Received-Date: Wed, 01 Apr 2015 17:59:24 -0000
X-Groupsio-MsgNum: 63934
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="w2xx78T4DcG3O+DJ"
Content-Disposition: inline

--w2xx78T4DcG3O+DJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2015 at 12:53:02AM -0700, Robert Yang wrote:
> Fixed a typo:
> name-target-directory -> make-target-directory

You have another typo in commit message.

> There is no name-target-directory, it should be make-target-directory,
> this fixed the error:
> /bin/bash: /path/to/elf/runtime-linker.T: No such file or directory
> Makefile:361: recipe for target '/path/to/elf/runtime-linker.st' failed
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../glibc/glibc/elf-Makefile-fix-a-typo.patch      |   36 ++++++++++++++=
++++++
>  meta/recipes-core/glibc/glibc_2.21.bb              |    1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo=
=2Epatch
>=20
> diff --git a/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch =
b/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
> new file mode 100644
> index 0000000..ec48006
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
> @@ -0,0 +1,36 @@
> +From 6207fb45553ee98f2f326883b7c21b76c8267343 Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Tue, 31 Mar 2015 02:31:25 -0700
> +Subject: [PATCH] elf/Makefile: fix a typo
> +
> +Fixed a typo:
> +name-target-directory -> make-target-directory
> +
> +There is no name-target-directory, it should be make-target-directory,
> +this fixed the error:
> +/bin/bash: /path/to/elf/runtime-linker.T: No such file or directory
> +Makefile:361: recipe for target '/path/to/elf/runtime-linker.st' failed
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + elf/Makefile |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/elf/Makefile b/elf/Makefile
> +index e5b142c..62fe245 100644
> +--- a/elf/Makefile
> ++++ b/elf/Makefile
> +@@ -358,7 +358,7 @@ $(objpfx)interp.os: $(elf-objpfx)runtime-linker.h
> +=20
> + $(elf-objpfx)runtime-linker.h: $(elf-objpfx)runtime-linker.st; @:
> + $(elf-objpfx)runtime-linker.st: $(common-objpfx)config.make
> +-	$(name-target-directory)
> ++	$(make-target-directory)
> + 	echo '#define RUNTIME_LINKER "$(rtlddir)/$(rtld-installed-name)"' \
> + 		> ${@:st=3DT}
> + 	$(move-if-change) ${@:st=3DT} ${@:st=3Dh}
> +--=20
> +1.7.9.5
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/gl=
ibc/glibc_2.21.bb
> index 91feff5..fcef4ff 100644
> --- a/meta/recipes-core/glibc/glibc_2.21.bb
> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> @@ -25,6 +25,7 @@ SRC_URI =3D "git://sourceware.org/git/glibc.git;branch=
=3D${BRANCH} \
>             file://0001-Add-unused-attribute.patch \
>             file://0001-When-disabling-SSE-also-make-sure-that-fpmath-is-=
not.patch \
>             file://0001-yes-within-the-path-sets-wrong-config-variables.p=
atch \
> +           file://elf-Makefile-fix-a-typo.patch \
>             ${EGLIBCPATCHES} \
>            "
>  EGLIBCPATCHES =3D "\
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--w2xx78T4DcG3O+DJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUcMhUACgkQN1Ujt2V2gBypEwCgnWT1zVkyNoOaOIkOPtwmz5Xm
MrAAoI9IHUmwQvLYIhvJPFseScS51fCu
=l+vY
-----END PGP SIGNATURE-----

--w2xx78T4DcG3O+DJ--
