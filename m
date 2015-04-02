Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id E573473CDC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 04:37:21 +0000 (UTC)
Received: by wiaa2 with SMTP id a2so90632542wia.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 21:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qv3wWOnB+fi0fCdofrC+wlsBpEoj5c6QvuZMv2YAtL8=;
	b=mXUyTZ5NHua5Sd6401Ex7citdEvpq0UBiK5WVwSi/oA6cXz16sQeS61lmyTjG8lBAA
	7/pPwRiqDhaC87I8a1YblZGERrTxwQsFJqVdfL185GF4d4kgDw7NqeYDwvbr0yqvos5b
	cvvQOqgLSrhKfznmB0zDeKjTkZWKbmYah0YpGB2iqQ1l/VCU+exzc6VoBVuU5vkux/QI
	klW+Aied3G6W+Ahu0FSdg2sTiX7OtwYqdIKo2eNelTpvKow3+J+EPajWjO7JOoBYGKUD
	B8UcGodgxXTNM68X2T3zsEe9Yrk+Yrgz9SpJBPCt6sim10cjy1hlBH1cktB5YqplgnkP
	i6uQ==
X-Received: by 10.180.37.3 with SMTP id u3mr11234262wij.43.1427949442248;
	Wed, 01 Apr 2015 21:37:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ew5sm28225063wic.14.2015.04.01.21.37.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 21:37:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 2 Apr 2015 06:37:46 +0200
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150402043746.GN14928@jama>
References: <cover.1427874748.git.liezhi.yang@windriver.com>
	<711934cddbc4f8c699487c16e33715cd9a6d5a57.1427874748.git.liezhi.yang@windriver.com>
	<20150401175949.GL14928@jama> <551CB39B.1000500@windriver.com>
MIME-Version: 1.0
In-Reply-To: <551CB39B.1000500@windriver.com>
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
X-List-Received-Date: Thu, 02 Apr 2015 04:37:22 -0000
X-Groupsio-MsgNum: 63945
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XBg9NAhDNArbJUtw"
Content-Disposition: inline

--XBg9NAhDNArbJUtw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2015 at 11:12:27AM +0800, Robert Yang wrote:
>=20
>=20
> On 04/02/2015 01:59 AM, Martin Jansa wrote:
> > On Wed, Apr 01, 2015 at 12:53:02AM -0700, Robert Yang wrote:
> >> Fixed a typo:
> >> name-target-directory -> make-target-directory
> >
> > You have another typo in commit message.
>=20
> Sorry, I checked again, which typo, please ?

"fix a TPO"
=20
> // Robert
>=20
> >
> >> There is no name-target-directory, it should be make-target-directory,
> >> this fixed the error:
> >> /bin/bash: /path/to/elf/runtime-linker.T: No such file or directory
> >> Makefile:361: recipe for target '/path/to/elf/runtime-linker.st' failed
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   .../glibc/glibc/elf-Makefile-fix-a-typo.patch      |   36 ++++++++++=
++++++++++
> >>   meta/recipes-core/glibc/glibc_2.21.bb              |    1 +
> >>   2 files changed, 37 insertions(+)
> >>   create mode 100644 meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-=
typo.patch
> >>
> >> diff --git a/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.pat=
ch b/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
> >> new file mode 100644
> >> index 0000000..ec48006
> >> --- /dev/null
> >> +++ b/meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
> >> @@ -0,0 +1,36 @@
> >> +From 6207fb45553ee98f2f326883b7c21b76c8267343 Mon Sep 17 00:00:00 2001
> >> +From: Robert Yang <liezhi.yang@windriver.com>
> >> +Date: Tue, 31 Mar 2015 02:31:25 -0700
> >> +Subject: [PATCH] elf/Makefile: fix a typo
> >> +
> >> +Fixed a typo:
> >> +name-target-directory -> make-target-directory
> >> +
> >> +There is no name-target-directory, it should be make-target-directory,
> >> +this fixed the error:
> >> +/bin/bash: /path/to/elf/runtime-linker.T: No such file or directory
> >> +Makefile:361: recipe for target '/path/to/elf/runtime-linker.st' fail=
ed
> >> +
> >> +Upstream-Status: Pending
> >> +
> >> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> +---
> >> + elf/Makefile |    2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/elf/Makefile b/elf/Makefile
> >> +index e5b142c..62fe245 100644
> >> +--- a/elf/Makefile
> >> ++++ b/elf/Makefile
> >> +@@ -358,7 +358,7 @@ $(objpfx)interp.os: $(elf-objpfx)runtime-linker.h
> >> +
> >> + $(elf-objpfx)runtime-linker.h: $(elf-objpfx)runtime-linker.st; @:
> >> + $(elf-objpfx)runtime-linker.st: $(common-objpfx)config.make
> >> +-	$(name-target-directory)
> >> ++	$(make-target-directory)
> >> + 	echo '#define RUNTIME_LINKER "$(rtlddir)/$(rtld-installed-name)"' \
> >> + 		> ${@:st=3DT}
> >> + 	$(move-if-change) ${@:st=3DT} ${@:st=3Dh}
> >> +--
> >> +1.7.9.5
> >> +
> >> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core=
/glibc/glibc_2.21.bb
> >> index 91feff5..fcef4ff 100644
> >> --- a/meta/recipes-core/glibc/glibc_2.21.bb
> >> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> >> @@ -25,6 +25,7 @@ SRC_URI =3D "git://sourceware.org/git/glibc.git;bran=
ch=3D${BRANCH} \
> >>              file://0001-Add-unused-attribute.patch \
> >>              file://0001-When-disabling-SSE-also-make-sure-that-fpmath=
-is-not.patch \
> >>              file://0001-yes-within-the-path-sets-wrong-config-variabl=
es.patch \
> >> +           file://elf-Makefile-fix-a-typo.patch \
> >>              ${EGLIBCPATCHES} \
> >>             "
> >>   EGLIBCPATCHES =3D "\
> >> --
> >> 1.7.9.5
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XBg9NAhDNArbJUtw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUcx5oACgkQN1Ujt2V2gByDUgCeMQs1/Et5jaFMtZza8pK8TikQ
MDkAoIhqtlK8dIPEzFktlXnQu5huWSKQ
=KsIm
-----END PGP SIGNATURE-----

--XBg9NAhDNArbJUtw--
