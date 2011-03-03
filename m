Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PvFA4-0000JE-La
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 21:30:12 +0100
Received: by fxm8 with SMTP id 8so1515300fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 12:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=tEcbhGO5/Sq0UVXjYMnJ5uJXS/hK15A+ZCO/DnZMVPM=;
	b=qfJkRiX1KxkEuJ6qgZINGXxAvKKp/UBvopT+4l7dKvPI8JQvxuplc1GuSxaa/UoPt8
	uUCcxfHsLytVGPXhxCwt6HS4A5LwqD3hYJJ1sHeAQZQoMxLzHG/DG1v+NroClKNQWwkC
	fyc/t7/xL1YhkIrk4wFEbeqfGgAEaWy1HvZqg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Eyp1zeKdCpIzqM9TCX6S1a67ITlmvOTW9shdYn8h5dC5ISAPLPIU6r+MQMsEsLGv/P
	daazSTItho8N54458V4j+4n8YgZOPSen9ypmMKsfe7uaw81xghYOO71W+0BwPRXmlo4y
	FqJO/XuROFuHOuVTmz4KFX4CGZR7iB6DZJGSA=
Received: by 10.223.72.9 with SMTP id k9mr1991617faj.93.1299184099088; Thu, 03
	Mar 2011 12:28:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Thu, 3 Mar 2011 12:27:58 -0800 (PST)
In-Reply-To: <1bd92439689523c3249a91688688c2b83245fa5c.1299182375.git.sgw@linux.intel.com>
References: <cover.1299182375.git.sgw@linux.intel.com>
	<1bd92439689523c3249a91688688c2b83245fa5c.1299182375.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Mar 2011 12:27:58 -0800
Message-ID: <AANLkTi=kduRmC5Vsj3Lr-6ccRiQ-+AHSnUoYxkoPOmBT@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 08/10] recipe: add newt from OE
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
X-List-Received-Date: Thu, 03 Mar 2011 20:30:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2011 at 12:02 PM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Kang Kai <kai.kang@windriver.com>
>
> newt is a library for text mode user interfaces, and required by
> chkconfig because of LSB command test.

may be mentioned the commit SHA of this file from OE repo would be nice to =
have


>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
> =C2=A0.../newt/files/include-without-python.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 71 ++++++++++++++++++++
> =C2=A0meta/recipes-extended/newt/libnewt_0.52.12.bb =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 37 ++++++++++
> =C2=A02 files changed, 108 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/recipes-extended/newt/files/include-without=
-python.patch
> =C2=A0create mode 100644 meta/recipes-extended/newt/libnewt_0.52.12.bb
>
> diff --git a/meta/recipes-extended/newt/files/include-without-python.patc=
h b/meta/recipes-extended/newt/files/include-without-python.patch
> new file mode 100644
> index 0000000..277ee33
> --- /dev/null
> +++ b/meta/recipes-extended/newt/files/include-without-python.patch
> @@ -0,0 +1,71 @@
> +From 3d13bbbb769050fac4cc6c904c174edc27e4f03d Mon Sep 17 00:00:00 2001
> +From: Otavio Salvador <otavio@ossystems.com.br>
> +Date: Thu, 20 Jan 2011 14:14:51 -0200
> +Subject: [PATCH] build: add -without-python
> +
> +Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +---
> + Makefile.in =C2=A0| =C2=A0 =C2=A08 ++++----
> + configure.ac | =C2=A0 10 ++++++++--
> + 2 files changed, 12 insertions(+), 6 deletions(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index e764e61..74e9097 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -77,7 +77,7 @@ showkey: =C2=A0 =C2=A0 showkey.o $(LIBNEWT)
> + =C2=A0 =C2=A0 =C2=A0 $(CC) -g -o showkey showkey.o $(LIBNEWT) $(LDFLAGS=
) $(LIBS)
> +
> + _snackmodule.so: =C2=A0 snackmodule.c $(LIBNEWTSH)
> +- =C2=A0 =C2=A0 =C2=A0for ver in $(PYTHONVERS) ; do \
> ++ =C2=A0 =C2=A0 =C2=A0[ -n "$(PYTHONVERS)" ] && for ver in $(PYTHONVERS)=
 ; do \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $$ver ;\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PCFLAGS=3D`$$ver-config --cflags`; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PIFLAGS=3D`$$ver-config --includes`; \
> +@@ -85,7 +85,7 @@ _snackmodule.so: =C2=A0 snackmodule.c $(LIBNEWTSH)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 PLFLAGS=3D`$$ver-config --libs`; \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) $(CPPFLAGS) $$PI=
FLAGS $$PCFLAGS -c -o $$ver/snackmodule.o snackmodule.c ;\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(CC) --shared $$PLDFL=
AGS $$PLFLAGS $(LDFLAGS) -o $$ver/_snackmodule.so $$ver/snackmodule.o -L. =
=C2=A0-lnewt $(LIBS);\
> +- =C2=A0 =C2=A0 =C2=A0done
> ++ =C2=A0 =C2=A0 =C2=A0done || :
> + =C2=A0 =C2=A0 =C2=A0 touch $@
> +
> + whiptail: $(NDIALOGOBJS) $(LIBNEWTSH)
> +@@ -141,11 +141,11 @@ install-sh: sharedlib $(WHIPTCLSO) _snackmodule.so
> + =C2=A0 =C2=A0 =C2=A0 ln -sf $(LIBNEWTSONAME) $(instroot)/$(libdir)/libn=
ewt.so
> + =C2=A0 =C2=A0 =C2=A0 ln -sf $(LIBNEWTSH) $(instroot)/$(libdir)/$(LIBNEW=
TSONAME)
> + =C2=A0 =C2=A0 =C2=A0 [ -n "$(WHIPTCLSO)" ] && install -m 755 whiptcl.so=
 $(instroot)/$(libdir) || :
> +- =C2=A0 =C2=A0 =C2=A0for ver in $(PYTHONVERS) ; do \
> ++ =C2=A0 =C2=A0 =C2=A0[ -n "$(PYTHONVERS)" ] && for ver in $(PYTHONVERS)=
 ; do \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ -d $(instroot)/$(libdir)/$$ver/site=
-packages ] || install -m 755 -d $(instroot)/$(libdir)/$$ver/site-packages =
;\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 755 $$ver/_snackmodule.so =
$(instroot)/$(libdir)/$$ver/site-packages ;\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 snack.py $(instroot)/$=
(libdir)/$$ver/site-packages ;\
> +- =C2=A0 =C2=A0 =C2=A0done
> ++ =C2=A0 =C2=A0 =C2=A0done || :
> +
> + Makefile: newt.spec
> + =C2=A0 =C2=A0 =C2=A0 echo "You need to rerun ./configure before continu=
ing"
> +diff --git a/configure.ac b/configure.ac
> +index 7bc381a..dc04352 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -54,8 +54,14 @@ fi
> + AC_CHECK_HEADERS([popt.h libintl.h])
> +
> + AC_MSG_CHECKING([for python versions])
> +-PYTHONVERS=3D$(echo /usr/include/python*/Python.h | sed "s|/usr/include=
/||g"| sed "s|/Python.h||g" 2> /dev/null)
> +-AC_MSG_RESULT([$PYTHONVERS])
> ++AC_ARG_WITH([python], [ =C2=A0--without-python =C2=A0 =C2=A0 =C2=A0 =C2=
=A0do not compile python support])
> ++if test "x$with_python" =3D "xno"; then
> ++ =C2=A0AC_MSG_RESULT([skipped])
> ++ =C2=A0PYTHONVERS=3D
> ++else
> ++ =C2=A0PYTHONVERS=3D$(ls /usr/include/python*/Python.h 2> /dev/null | s=
ed "s|/usr/include/||g"| sed "s|/Python.h||g" 2> /dev/null)
> ++ =C2=A0AC_MSG_RESULT([$PYTHONVERS])
> ++fi
> + AC_SUBST([PYTHONVERS])
> +
> + AC_ARG_WITH([tcl], [ =C2=A0--without-tcl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 do not compile whiptcl.so])
> +--
> +1.7.2.3
> +
> diff --git a/meta/recipes-extended/newt/libnewt_0.52.12.bb b/meta/recipes=
-extended/newt/libnewt_0.52.12.bb
> new file mode 100644
> index 0000000..eefd6bd
> --- /dev/null
> +++ b/meta/recipes-extended/newt/libnewt_0.52.12.bb
> @@ -0,0 +1,37 @@
> +SUMMARY =3D "A library for text mode user interfaces"
> +
> +DESCRIPTION =3D "Newt is a programming library for color text mode, widg=
et based user \
> +interfaces. =C2=A0Newt can be used to add stacked windows, entry widgets=
, \
> +checkboxes, radio buttons, labels, plain text fields, scrollbars, \
> +etc., to text mode user interfaces. =C2=A0This package also contains the=
 \
> +shared library needed by programs built with newt, as well as a \
> +/usr/bin/dialog replacement called whiptail. =C2=A0Newt is based on the =
\
> +slang library."
> +
> +HOMEPAGE =3D "https://fedorahosted.org/newt/"
> +SECTION =3D "libs"
> +
> +LICENSE =3D "LGPL"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605"
> +
> +# slang needs to be >=3D 2.2
> +DEPENDS =3D "slang popt"
> +
> +PR =3D "r0"
> +
> +SRCREV =3D "c3c7be75f6ef1adfc2be5f99c1e8ef3f0ab58c38"
> +SRC_URI =3D "git://git.fedorahosted.org/git/newt;protocol=3Dgit \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://include-without-python.patch"
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECONF =3D "--without-python --without-tcl"
> +
> +inherit autotools
> +
> +PACKAGES_prepend =3D "whiptail "
> +
> +do_configure_prepend() {
> + =C2=A0 =C2=A0sh autogen.sh
> +}
> +
> +FILES_whiptail =3D "${bindir}/whiptail"
> --
> 1.7.1.1
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>


