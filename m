Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SarqC-00057W-Vy
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Jun 2012 19:10:17 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 02 Jun 2012 09:59:52 -0700
Received: by lahj13 with SMTP id j13so1916148lah.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2012 09:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=XKPV7vnJAZ9KIjf6PWZi+limWqlqJtQun24hvjKUgus=;
	b=SghEY88/LA4NMnvskgZ8Dzy//oL2yoSBPLcpvw3OHwmqruOIRbm1f5jb68AqjhEFJu
	4vOjQn21uc/g0razo77WJj2BSJlpTW306oQDYSctBtB0QKdLkWJM5kVBUb7oOBRUxzBn
	IGlxpqhmFIqxKif7LwliyT5c2ueCdcDq9boRjGI+oev+7gLnieHL+BbjwXVYyGKFstE3
	d0yNj484UXDFkRdID978MDEjEl4jBJDmb0LL8RoGm3/pFRNJAHenxXgvyG4s0YztdxkC
	iWNx3LxkycUEWlQV0K6RfZkbe0zz+iS9Hcio11h9Nk3q0sMQ9RbH2Exf5zb9ZuofumTF
	sL+Q==
MIME-Version: 1.0
Received: by 10.112.85.225 with SMTP id k1mr3689312lbz.38.1338656389956; Sat,
	02 Jun 2012 09:59:49 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Sat, 2 Jun 2012 09:59:49 -0700 (PDT)
In-Reply-To: <1338537158-19917-1-git-send-email-cristian.iorga@intel.com>
References: <1338537158-19917-1-git-send-email-cristian.iorga@intel.com>
Date: Sat, 2 Jun 2012 09:59:49 -0700
Message-ID: <CAPhnLPAUewTddwVFXa77deAUomq7_T17MAYCsr_t+6rmT0OLxw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkwzax9U1HZG1jP/xWs6YZqd32+2nK6olgrfA6Gdd6m8lp8Hi2YH3E9KPvTYLluMYMJbA2s
Subject: Re: [PATCH] ltp: Add patch to correct failing build
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
X-List-Received-Date: Sat, 02 Jun 2012 17:10:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2012 at 12:52 AM, Cristian Iorga
<cristian.iorga@intel.com> wrote:
> ltp makefile does not interpret correctly the result of git describe
> command and assumes that it is working with a git repo, while in fact
> working with a source code archive.
> Added a patch to corect makefile system.
>
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
> =A0.../ltp/ltp/fix_building_fom_archive.patch =A0 =A0 =A0 =A0 | =A0 23 ++=
++++++++++++++++++
> =A0meta/recipes-extended/ltp/ltp_20120401.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
4 ++--
> =A02 files changed, 25 insertions(+), 2 deletions(-)
> =A0create mode 100644 meta/recipes-extended/ltp/ltp/fix_building_fom_arch=
ive.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch=
 b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
> new file mode 100644
> index 0000000..c0ecc86
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
> @@ -0,0 +1,23 @@
> +ltp package build system is broken if building from archive
> +
> +ltp makefile does not interpret correctly the result of git describe
> +command and assumes that it is working with a git repo, while in fact
> +working with a source code archive.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> +
> +Index: ltp-20120401/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- ltp-20120401.orig/Makefile
> ++++ ltp-20120401/Makefile
> +@@ -173,7 +173,8 @@ SRCDIR_INSTALL_TARGETS =A0 =A0 :=3D $(SRCDIR_INSTA
> + #
> + .PHONY: Version
> + Version:
> +- =A0 =A0 =A0if git describe &> /dev/null; then \
> ++ =A0 =A0 =A0git describe &> /dev/null
> ++ =A0 =A0 =A0if [ $? -eq 0 ]; then \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 git describe > "$@"; \
> + =A0 =A0 =A0 else \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cp VERSION "$@"; \
> diff --git a/meta/recipes-extended/ltp/ltp_20120401.bb b/meta/recipes-ext=
ended/ltp/ltp_20120401.bb
> index 912d6d9..563bd58 100644
> --- a/meta/recipes-extended/ltp/ltp_20120401.bb
> +++ b/meta/recipes-extended/ltp/ltp_20120401.bb
> @@ -21,10 +21,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0=
215e8d672dc4c32c317bb3 \
>
> =A0DEPENDS =3D "attr"
>
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
> - =A0 =A0 =A0 =A0 =A0"
> + =A0 =A0 =A0 =A0 =A0 file://fix_building_fom_archive.patch"
>
> =A0SRC_URI[md5sum] =3D "e1d0acf1a6b6da0cb30dc1b0dcf5f26d"
> =A0SRC_URI[sha256sum] =3D "f0f5845f9666f61332fdf0b7e396fc647f9372db0902a8=
29af2cf9402b807bd1"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

This patch seems to be causing build failures:

| ERROR: Function failed: do_compile (see
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/t=
mp/work/ppc603e-poky-linux/ltp-20120401-r4/temp/log.do_compile.695
for further information)
| NOTE: make -j 16
| make -C "lib" \
| 	-f "/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/=
build/tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib/Makefile=
"
all
| git describe &> /dev/null
| make: *** [Version] Error 128
| make: *** Waiting for unfinished jobs....
| make[1]: Entering directory
`/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/=
tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib'
| make[1]: Nothing to be done for `all'.
| make[1]: Leaving directory
`/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-ppc/build/build/=
tmp/work/ppc603e-poky-linux/ltp-20120401-r4/ltp-20120401/lib'
| ERROR: oe_runmake failed



-b

--=20
Elizabeth Flanagan
Yocto Project
Build and Release


