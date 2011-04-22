Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDJfh-0003ME-4P
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 18:57:41 +0200
Received: by ewy5 with SMTP id 5so213552ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 09:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=evTxWtJWlybDtaZ0ea+GRsNR3HGttXfbqVBAEHnpglM=;
	b=cd4xbp9m6EDRt9nOMGDuZJvC1lMgvYdI0ZtX3PQfHviIgmnffBAI/EjaVQlTVoyzqw
	qlJL8d97J/zUVlPJ076khZvgYzLRtNvGCKmRKcxFEaMGKV1s4LHxBHuKko0d8fw8S8GA
	wUE4EIoTKg2tsPQS5eypPi6LExCEG80Kg5nTA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=HPJArni0ReemqKpUG6ACpRv1csX4aVyCspybPzT1A1A7DF4+Su7Zul2mxs/+T4fNan
	uyhKHMcFKeJjOupT0kwX9v8fShkL9IBdHUXBmfn6wgP7ey7DWp+riVV1USrEbgSiB6KE
	6R8OlqKOJSv+NIvm3w6AYiDYe/g5ii1quruAo=
Received: by 10.14.125.146 with SMTP id z18mr435674eeh.28.1303491305220; Fri,
	22 Apr 2011 09:55:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Fri, 22 Apr 2011 09:54:35 -0700 (PDT)
In-Reply-To: <28ae024eeae08bcbf151f7d197b38aab6eac2157.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<28ae024eeae08bcbf151f7d197b38aab6eac2157.1303453279.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Apr 2011 09:54:35 -0700
Message-ID: <BANLkTimOtKqrd9_iErFsihQeGvgeEL5aqA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 19:25:49 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 24/33] pcmciautils: Upgrade 017 -> 018
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
X-List-Received-Date: Fri, 22 Apr 2011 16:57:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2011 at 12:24 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> version workaround is done in recipe itself
> by adding PV to CFLAGS
>
> Since we define LIBC and pcmciutils use it too
> which hinders build when we define LIBC in
> environment. Its not used in the builds anyway
> so we get rid of depending on it
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../pcmciautils-017/version_workaround.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 16 ------
> =C2=A0.../makefile_fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 58 +++++++=
+++++++++----
> =C2=A0meta/recipes-bsp/pcmciautils/pcmciautils.inc =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A01 +
> =C2=A0meta/recipes-bsp/pcmciautils/pcmciautils_017.bb =C2=A0 =C2=A0| =C2=
=A0 12 ----
> =C2=A0meta/recipes-bsp/pcmciautils/pcmciautils_018.bb =C2=A0 =C2=A0| =C2=
=A0 11 ++++
> =C2=A05 files changed, 59 insertions(+), 39 deletions(-)
> =C2=A0delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-017/ver=
sion_workaround.patch
> =C2=A0rename meta/recipes-bsp/pcmciautils/{pcmciautils-017 =3D> pcmciauti=
ls-018}/makefile_fix.patch (63%)
> =C2=A0delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb
> =C2=A0create mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
>
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaro=
und.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround=
.patch
> deleted file mode 100644
> index 57efa68..0000000
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.pat=
ch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -PCMCIAUTILS_VERSION is specified on the commandline but doesn't compile =
properly
> -under arm gcc 3.4.x so we work around it.
> -
> -Index: pcmciautils-013/src/pccardctl.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pcmciautils-013.orig/src/pccardctl.c =C2=A0 =C2=A0 =C2=A0 2006-03-26=
 11:56:41.000000000 +0100
> -+++ pcmciautils-013/src/pccardctl.c =C2=A0 =C2=A02006-05-09 22:11:09.000=
000000 +0100
> -@@ -350,7 +350,7 @@
> - }
> -
> - static void print_header(void) {
> -- =C2=A0 =C2=A0 =C2=A0printf("pcmciautils %s\n", PCMCIAUTILS_VERSION);
> -+ =C2=A0 =C2=A0 =C2=A0printf("pcmciautils 017\n");
> - =C2=A0 =C2=A0 =C2=A0 printf("Copyright (C) 2004-2005 Dominik Brodowski,=
 (C) 1999 David A. Hinds\n");
> - =C2=A0 =C2=A0 =C2=A0 printf("Report errors and bugs to <linux-pcmcia@li=
sts.infradead.org>, please.\n");
> - }
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-017/makefile_fix.pa=
tch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
> similarity index 63%
> rename from meta/recipes-bsp/pcmciautils/pcmciautils-017/makefile_fix.pat=
ch
> rename to meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
> index 82dbfa8..295c810 100644
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils-017/makefile_fix.patch
> +++ b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
> @@ -1,16 +1,19 @@
> -rebase the patch to 017, removing hardcoded path for true
> +Hardcoded paths are bad...
> +This lets us use the install from OE's native sysroot
> +rebase the patch to 018, removing hardcoded path for true
> =C2=A0as well. Removing of -D in install invocation is a little
> =C2=A0questionable, is it some GNU extention?
> +Also remove LIBC from makefiles. We do not need it
> +since we link against staged libc correctly.
>

the above two lines are no longer valid. They should be removed
I have latest patch with this corrected in the branch I published for pull

> -07/14/2010 - qhe, original patch note follows
> +-Khem Raj <raj.khem@gmail.com>
>
> -Hardcoded paths are bad...
>
> -diff --git a/Makefile b/Makefile
> -index 26f3e4b..31f0cdf 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -69,7 +69,7 @@ sbindir =3D =C2=A0 =C2=A0${exec_prefix}/sbin
> +Index: pcmciautils-018/Makefile
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- pcmciautils-018.orig/Makefile
> ++++ pcmciautils-018/Makefile
> +@@ -76,7 +76,7 @@ sbindir =3D =C2=A0 =C2=A0${exec_prefix}/sbin
> =C2=A0mandir =3D =C2=A0 =C2=A0 =C2=A0${prefix}/usr/share/man
> =C2=A0udevdir =3D =C2=A0 =C2=A0 ${prefix}/lib/udev
>
> @@ -19,7 +22,7 @@ index 26f3e4b..31f0cdf 100644
> =C2=A0INSTALL_PROGRAM =3D ${INSTALL}
> =C2=A0INSTALL_DATA =C2=A0=3D ${INSTALL} -m 644
> =C2=A0INSTALL_SCRIPT =3D ${INSTALL_PROGRAM}
> -@@ -171,7 +171,7 @@ endif
> +@@ -180,7 +180,7 @@ endif
> =C2=A0# if DEBUG is enabled, then we do not strip or optimize
> =C2=A0ifeq ($(strip $(DEBUG)),true)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS =C2=A0+=3D -O1 -g -DDEBUG -D_GNU_SOURCE
> @@ -28,7 +31,40 @@ index 26f3e4b..31f0cdf 100644
> =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS =C2=A0+=3D $(OPTIMIZATION) -fomit-frame=
-pointer -D_GNU_SOURCE
> =C2=A0 =C2=A0 =C2=A0 =C2=A0STRIPCMD =3D $(STRIP) -s --remove-section=3D.n=
ote --remove-section=3D.comment
> -@@ -264,30 +264,32 @@ clean:
> +@@ -234,15 +234,15 @@ build/ccdv: build/ccdv.c
> + =C2=A0 =C2=A0 =C2=A0 mv y.tab.c $*.c
> + =C2=A0 =C2=A0 =C2=A0 mv y.tab.h $*.h
> +
> +-$(PCCARDCTL): $(LIBC) src/$(PCCARDCTL).o src/$(PCCARDCTL).c $(OBJS) $(H=
EADERS)
> ++$(PCCARDCTL): src/$(PCCARDCTL).o src/$(PCCARDCTL).c $(OBJS) $(HEADERS)
> + =C2=A0 =C2=A0 =C2=A0 $(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/$(PCCA=
RDCTL).o $(LIB_OBJS) $(ARCH_LIB_OBJS)
> + =C2=A0 =C2=A0 =C2=A0 $(QUIET) $(STRIPCMD) $@
> +
> +-$(PCMCIA_CHECK_BROKEN_CIS): $(LIBC) src/$(PCMCIA_CHECK_BROKEN_CIS).o sr=
c/read-cis.o $(OBJS) $(HEADERS)
> ++$(PCMCIA_CHECK_BROKEN_CIS): src/$(PCMCIA_CHECK_BROKEN_CIS).o src/read-c=
is.o $(OBJS) $(HEADERS)
> + =C2=A0 =C2=A0 =C2=A0 $(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/$(PCMC=
IA_CHECK_BROKEN_CIS).o src/read-cis.o $(LIB_PLAIN_OBJS) $(ARCH_LIB_OBJS)
> + =C2=A0 =C2=A0 =C2=A0 $(QUIET) $(STRIPCMD) $@
> +
> +-$(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/yacc_config.o src/l=
ex_config.o $(OBJS) $(HEADERS)
> ++$(PCMCIA_SOCKET_STARTUP): src/startup.o src/yacc_config.o src/lex_confi=
g.o $(OBJS) $(HEADERS)
> + =C2=A0 =C2=A0 =C2=A0 $(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startu=
p.o src/yacc_config.o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
> + =C2=A0 =C2=A0 =C2=A0 $(QUIET) $(STRIPCMD) $@
> +
> +@@ -251,11 +251,11 @@ yacc_config.o lex_config.o: %.o: %.c
> +
> + debugtools: ccdv $(CBDUMP) $(CISDUMP)
> +
> +-$(CBDUMP): $(LIBC) debug/cbdump.o
> ++$(CBDUMP): debug/cbdump.o
> + =C2=A0 =C2=A0 =C2=A0 $(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) debug/$(CB=
DUMP).o $(LIB_PCI_OBJS) $(ARCH_LIB_OBJS)
> + =C2=A0 =C2=A0 =C2=A0 $(QUIET) $(STRIPCMD) $@
> +
> +-$(CISDUMP): $(LIBC) src/read-cis.o debug/parse_cis.o debug/dump_cis.o
> ++$(CISDUMP): src/read-cis.o debug/parse_cis.o debug/dump_cis.o
> + =C2=A0 =C2=A0 =C2=A0 $(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) debug/$(CI=
SDUMP).o src/read-cis.o debug/parse_cis.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
> + =C2=A0 =C2=A0 =C2=A0 $(QUIET) $(STRIPCMD) $@
> +
> +@@ -273,30 +273,32 @@ clean:
>
> =C2=A0install-hotplug:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d $(DESTDIR)$(hotplugdir)
> @@ -68,7 +104,7 @@ index 26f3e4b..31f0cdf 100644
>
> =C2=A0uninstall-tools:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0- rm -f $(DESTDIR)$(sbindir)/$(PCCARDCTL)
> -@@ -296,22 +298,24 @@ uninstall-tools:
> +@@ -305,22 +307,24 @@ uninstall-tools:
>
> =C2=A0install-config:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -d $(DESTDIR)$(pcmciaconfdir)
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-=
bsp/pcmciautils/pcmciautils.inc
> index 260cccb..410fa5d 100644
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> +++ b/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> @@ -22,6 +22,7 @@ export udevrulesdir =3D "${sysconfdir}/udev/rules.d"
> =C2=A0export UDEV =3D "1"
> =C2=A0LD =3D "${CC}"
> =C2=A0CFLAGS =3D+ "-I${S}/src"
> +CFLAGS =3D+ -DPCMCIAUTILS_VERSION=3D\'${PV}\'
>
> =C2=A0PARALLEL_MAKE =3D ""
> =C2=A0EXTRA_OEMAKE =3D "-e 'STRIP=3Decho' 'LIB_OBJS=3D-lc -lsysfs' 'LEX=
=3Dflex'"
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_017.bb b/meta/recip=
es-bsp/pcmciautils/pcmciautils_017.bb
> deleted file mode 100644
> index ff67f7b..0000000
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils_017.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -require pcmciautils.inc
> -
> -PR =3D "r0"
> -
> -SRC_URI +=3D "file://makefile_fix.patch \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://version_workaround.patc=
h"
> -
> -SRC_URI[md5sum] =3D "5245af28eeba57ec0606a874d44d10f7"
> -SRC_URI[sha256sum] =3D "2045f0e8f837f44aed72ac91c1a8cf3b899caf098a25d04f=
47982be6386bd4e1"
> -
> -FILES_${PN}-dbg +=3D "${libdir}/udev/.debug"
> -FILES_${PN} +=3D "${libdir}/udev"
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recip=
es-bsp/pcmciautils/pcmciautils_018.bb
> new file mode 100644
> index 0000000..202437a
> --- /dev/null
> +++ b/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
> @@ -0,0 +1,11 @@
> +require pcmciautils.inc
> +
> +SRC_URI +=3D "file://makefile_fix.patch"
> +
> +SRC_URI[md5sum] =3D "5d85669b3440baa4532363da6caaf1b4"
> +SRC_URI[sha256sum] =3D "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d=
040ec811b0dc8ed5"
> +
> +PR =3D "r0"
> +
> +FILES_${PN}-dbg +=3D "${libdir}/udev/.debug"
> +FILES_${PN} +=3D "${libdir}/udev"
> --
> 1.7.1
>
>


