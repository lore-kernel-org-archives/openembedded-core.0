Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 18AD773620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 19:59:53 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id z12so9426999wgg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 11:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xCv6sDJ3necqYwmMYPJyhVlajg7DGqS4maWkM63igwc=;
	b=zyixcJIWomiuaeFvWrlnwh2Q8K9tyC7xO3MCBxSw16lmVqwadUJCzhLt0LxDWa1Fr7
	568JtwYcGPDO0bmVrFTX3eoNCuEfXlU0AvJmEJqfU8k1IsP2KyeSk9lfQ9QoLA77z7FT
	xu6ljjGUgrd/LO7sXvZ4N/o+4ZvnDI3mbe7Sgt75i++MpRUsuNouOVY+9M6uWaLXpteL
	5gc8HU8qKmIdIFXfMnT4ilpQ5H9COWT3zaHgp55PBADMz9VBSADrk65NUue9yceC2/oi
	jDhv45H+bi7Q44O2yTHf14oxQlXeob/gVZNnxgwABCMS6lphAIL9ZpBm97Sc9I1DHG6L
	YhNA==
X-Received: by 10.180.211.101 with SMTP id nb5mr9472638wic.37.1424375994445;
	Thu, 19 Feb 2015 11:59:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gi3sm35629998wic.15.2015.02.19.11.59.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Feb 2015 11:59:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 19 Feb 2015 20:59:57 +0100
To: Ben Shelton <ben.shelton@ni.com>
Message-ID: <20150219195957.GI2311@jama>
References: <1424374778-23666-1-git-send-email-ben.shelton@ni.com>
MIME-Version: 1.0
In-Reply-To: <1424374778-23666-1-git-send-email-ben.shelton@ni.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] trace-cmd: Update to version 2.5.3
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
X-List-Received-Date: Thu, 19 Feb 2015 19:59:56 -0000
X-Groupsio-MsgNum: 62570
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IbA9xpzOQlG26JSn"
Content-Disposition: inline

--IbA9xpzOQlG26JSn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2015 at 01:39:37PM -0600, Ben Shelton wrote:
> Updating adds new features including the very useful 'profile' option.
>=20
> Changes include:
>=20
>  - Remove addldflags.patch (already upstream in the new version).
>=20
>  - Remove make-docs-optional.patch (docs are built in a separate target
>    in the new version).
>=20
>  - Update SRC_URI, SRCREV, PR, and PV in the .inc file and don't
>    override them in the recipe.
>=20
>  - Fix a typo in LIC_FILES_CHECKSUM so 'endline' is properly defined.
>=20
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  meta/recipes-kernel/trace-cmd/trace-cmd.inc        | 13 +++---
>  .../trace-cmd/trace-cmd/addldflags.patch           | 51 ----------------=
------
>  .../trace-cmd/trace-cmd/make-docs-optional.patch   | 36 ---------------
>  .../{trace-cmd_2.3.2.bb =3D> trace-cmd_git.bb}       |  8 +---
>  4 files changed, 7 insertions(+), 101 deletions(-)
>  delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.pa=
tch
>  delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-opt=
ional.patch
>  rename meta/recipes-kernel/trace-cmd/{trace-cmd_2.3.2.bb =3D> trace-cmd_=
git.bb} (74%)
>=20
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd.inc b/meta/recipes-k=
ernel/trace-cmd/trace-cmd.inc
> index fb8c5fa..d03c697 100644
> --- a/meta/recipes-kernel/trace-cmd/trace-cmd.inc
> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd.inc
> @@ -1,14 +1,13 @@
> -SRCREV =3D "7055ffd37beeb44714e86a4abc703f7e175a0db5"
> -PR =3D "r3"
> -PV =3D "1.2+git${SRCPV}"
> +SRCREV =3D "0813335d2e49291e7ab6a4365cec2baa05813eda"
> +PR =3D "r4"
> +PV =3D "2.5.3+git${SRCPV}"

Please drop PR when you're upgrading PV, especially when it's defined in
=2Einc file.

> -inherit pkgconfig pythonnative
> +inherit pkgconfig
> =20
>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/trace-cmd:"
> =20
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace=
-cmd.git \
> -           file://addldflags.patch \
> -           file://make-docs-optional.patch \
> +SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace=
-cmd.git;protocol=3Dgit;branch=3Dtrace-cmd-stable-v2.5 \
>             file://blktrace-api-compatibility.patch \
>  "
> +
>  S =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch b/m=
eta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
> deleted file mode 100644
> index 14730db..0000000
> --- a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -trace-cmd: Cross-compile fixes for LDFLAGS and include path
> -
> -Add ability for the Makefile to respect LDFLAGS.
> -Also remove hardcoded /usr/local/include include path.
> -
> -Upstream-Status: Accepted [Post 1.2: 5f576e9af7ad706774d9764a9ae39893767=
97c0e]
> -
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> -
> ----
> - Makefile |    7 ++++---
> - 1 file changed, 4 insertions(+), 3 deletions(-)
> -
> -Index: git/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/Makefile
> -+++ git/Makefile
> -@@ -202,12 +202,13 @@ export Q VERBOSE
> - TRACECMD_VERSION =3D $(TC_VERSION).$(TC_PATCHLEVEL).$(TC_EXTRAVERSION)
> - KERNELSHARK_VERSION =3D $(KS_VERSION).$(KS_PATCHLEVEL).$(KS_EXTRAVERSIO=
N)
> -=20
> --INCLUDES =3D -I. -I/usr/local/include $(CONFIG_INCLUDES)
> -+INCLUDES =3D -I. $(CONFIG_INCLUDES)
> -=20
> - include features.mk
> -=20
> - # Set compile option CFLAGS if not set elsewhere
> - CFLAGS ?=3D -g -Wall
> -+LDFLAGS ?=3D
> -=20
> - ifndef NO_PTRACE
> - ifneq ($(call try-cc,$(SOURCE_PTRACE),),y)
> -@@ -251,7 +252,7 @@ do_fpic_compile =3D					\
> -=20
> - do_app_build =3D						\
> - 	($(print_app_build)				\
> --	$(CC) $^ -rdynamic -o $@ $(CONFIG_LIBS) $(LIBS))
> -+	$(CC) $^ -rdynamic -o $@ $(LDFLAGS) $(CONFIG_LIBS) $(LIBS))
> -=20
> - do_compile_shared_library =3D			\
> - 	($(print_shared_lib_compile)		\
> -@@ -263,7 +264,7 @@ do_compile_plugin_obj =3D				\
> -=20
> - do_plugin_build =3D				\
> - 	($(print_plugin_build)			\
> --	$(CC) $(CFLAGS) -shared -nostartfiles -o $@ $<)
> -+	$(CC) $(CFLAGS) $(LDFLAGS) -shared -nostartfiles -o $@ $<)
> -=20
> - do_build_static_lib =3D				\
> - 	($(print_static_lib_build)		\
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.p=
atch b/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
> deleted file mode 100644
> index 8402426..0000000
> --- a/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Disable building docs until we have asciidocs available as a recipe.
> -
> -Upstream-Status: Inappropriate [Account for missing dependency, the lazy=
 way]
> -
> -Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> -
> ----
> - Makefile |    8 ++++++--
> - 1 file changed, 6 insertions(+), 2 deletions(-)
> -
> -Index: git/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/Makefile
> -+++ git/Makefile
> -@@ -327,7 +327,9 @@ TARGETS =3D $(CMD_TARGETS) $(GUI_TARGETS)
> - #    If you want kernelshark, then do:  make gui
> - ###
> -=20
> --all: all_cmd doc show_gui_make
> -+# Make doc optional
> -+#all: all_cmd doc show_gui_make
> -+all: all_cmd show_gui_make
> -=20
> - all_cmd: $(CMD_TARGETS)
> -=20
> -@@ -503,7 +505,9 @@ install_python: $(PYTHON_SO_INSTALL) $(P
> - install_cmd: all_cmd install_plugins install_python
> - 	$(Q)$(call do_install,trace-cmd,$(bindir_SQ))
> -=20
> --install: install_cmd install_doc
> -+# Make doc optional
> -+#install: install_cmd install_doc
> -+install: install_cmd
> - 	@echo "Note: to install the gui, type \"make install_gui\""
> -=20
> - install_gui: install_cmd gui
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb b/meta/reci=
pes-kernel/trace-cmd/trace-cmd_git.bb
> similarity index 74%
> rename from meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
> rename to meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
> index a4d5382..b1ac789 100644
> --- a/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd_git.bb
> @@ -6,13 +6,7 @@ require trace-cmd.inc
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
>                      file://trace-cmd.c;beginline=3D6;endline=3D8;md5=3D2=
c22c965a649ddd7973d7913c5634a5e \
>                      file://COPYING.LIB;md5=3Dbbb461211a33b134d42ed5ee802=
b37ff \
> -                    file://trace-input.c;beginline=3D5;endine=3D8;md5=3D=
dafd8a1cade30b847a8686dd3628cea4 \
> -"
> -SRCREV =3D "79e08f8edb38c4c5098486caaa87ca90ba00f547"
> -
> -PV =3D "2.3.2+git${SRCPV}"
> -
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace=
-cmd.git;protocol=3Dgit;branch=3Dtrace-cmd-stable-v2.3 \
> +                    file://trace-input.c;beginline=3D5;endline=3D8;md5=
=3D3ec82f43bbe0cfb5951ff414ef4d44d0 \
>  "
> =20
>  EXTRA_OEMAKE =3D "\
> --=20
> 2.3.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IbA9xpzOQlG26JSn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTmQL0ACgkQN1Ujt2V2gBwpkwCfRvL1gc6/xdbyKysdAK044P5Z
p2AAnAiVmWdYliQ3p8qzHVGifCvNarG3
=zKxE
-----END PGP SIGNATURE-----

--IbA9xpzOQlG26JSn--
