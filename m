Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SUd78-0008Um-L5
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 14:13:58 +0200
Received: by yenl13 with SMTP id l13so552520yen.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2012 05:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=N0RN/UxDoAjrZRHHS9Ps3IgpQHJMPhcvjYC3j5nxL88=;
	b=1FGq/rRwTFQsMWAzF5a2fqUu08UgM9oFGrTPiDE2ix6ZmoIEPhoNgVWCfbdoPKQD01
	ZE4u+fEScTPpFYVtnTsdX04zif9yY9m39fPfwMxP36RQxEIpXfqTw4aFENHjhdCda3c2
	Q7llib7MSfMDg182o4srvHB9x4dj6/Zc30JIx6ucjLhh58MDlHwuD2LI8GbLezNBALBv
	u26JD2Ukoc6eQ/O7ULjasI34QBCGb85Cu60JWuiyW0FWA/yOPBo4p4/JFbNJr1e5B3O8
	ScFVbZljXWQa9ypDrpYILm41jtTkUBgXiynwd7FQF5mErxhtLy52gtGnobhRFKBT2rMb
	pecg==
MIME-Version: 1.0
Received: by 10.236.75.232 with SMTP id z68mr3264597yhd.6.1337169837118; Wed,
	16 May 2012 05:03:57 -0700 (PDT)
Received: by 10.236.23.9 with HTTP; Wed, 16 May 2012 05:03:57 -0700 (PDT)
In-Reply-To: <1337169684-16720-1-git-send-email-cristian.iorga@intel.com>
References: <1337169684-16720-1-git-send-email-cristian.iorga@intel.com>
Date: Wed, 16 May 2012 14:03:57 +0200
Message-ID: <CA+chaQfTAGh6mkfFW9ZGV7a=Lja5EtNMn+QRSm8YOr0cE7UH-w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] foomatic-filters: Updated to 4.0.15
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
X-List-Received-Date: Wed, 16 May 2012 12:13:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2012 at 2:01 PM, Cristian Iorga
<cristian.iorga@intel.com> wrote:
> ---
> =C2=A0.../foomatic/foomatic-filters_4.0.15.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 39 ++++++++++++++++++++
> =C2=A0.../foomatic/foomatic-filters_4.0.7.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 39 --------------------
> =C2=A02 files changed, 39 insertions(+), 39 deletions(-)
> =C2=A0create mode 100644 meta/recipes-extended/foomatic/foomatic-filters_=
4.0.15.bb
> =C2=A0delete mode 100644 meta/recipes-extended/foomatic/foomatic-filters_=
4.0.7.bb
>
> diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.15.bb b/=
meta/recipes-extended/foomatic/foomatic-filters_4.0.15.bb
> new file mode 100644
> index 0000000..bcf8d1d
> --- /dev/null
> +++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.15.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "OpenPrinting printer support - filters"
> +DESCRIPTION =3D "Foomatic is a printer database designed to make it easi=
er to set up \
> +common printers for use with UNIX-like operating systems.\
> +It provides the "glue" between a print spooler (like CUPS or lpr) and \
> +the printer, by processing files sent to the printer. \
> + \
> +This package consists of filters used by the printer spoolers \
> +to convert the incoming PostScript data into the printer's native \
> +format using a printer-specific, but spooler-independent PPD file. \
> +"
> +
> +DEPENDS +=3D "cups perl libxml2"
> +PR =3D "r0"
> +
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;m=
d5=3D393a5ca445f6965873eca0259a17f833"
> +
> +SRC_URI =3D "http://www.openprinting.org/download/foomatic/foomatic-filt=
ers-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "1b7efcdc57340915647daa5b5c15b0ef"
> +SRC_URI[sha256sum] =3D "f5b7b67aacedec4c0294d242cbffbe0d7d3cd0fdd2b410c0=
55e818f25ed3bc79"
> +
> +inherit autotools
> +
> +EXTRA_OECONF +=3D "--disable-file-converter-check --with-file-converter=
=3Dtexttops"
> +
> +do_configure_prepend() {
> + =C2=A0 =C2=A0export LIB_CUPS=3D${exec_prefix}/lib/cups =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # /usr/lib NOT libdir
> + =C2=A0 =C2=A0export CUPS_BACKENDS=3D${exec_prefix}/lib/cups/backend =C2=
=A0# /usr/lib NOT libdir
> + =C2=A0 =C2=A0export CUPS_FILTERS=3D${exec_prefix}/lib/cups/filter =C2=
=A0 =C2=A0# /usr/lib NOT libdir
> + =C2=A0 =C2=A0export CUPS_PPDS=3D${datadir}/cups/model
> +}
> +
> +do_install_append_linuxstdbase() {
> + =C2=A0 =C2=A0install -d ${D}${exec_prefix}/lib/cups/filter
> + =C2=A0 =C2=A0ln -sf ${bindir}/foomatic-rip ${D}${exec_prefix}/lib/cups/=
filter
> +}
> +
> +FILES_${PN} +=3D "${exec_prefix}/lib/cups/ ${exec_prefix}/lib/ppr/"
> diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb b/m=
eta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
> deleted file mode 100644
> index 223bb02..0000000
> --- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -SUMMARY =3D "OpenPrinting printer support - filters"
> -DESCRIPTION =3D "Foomatic is a printer database designed to make it easi=
er to set up \
> -common printers for use with UNIX-like operating systems.\
> -It provides the "glue" between a print spooler (like CUPS or lpr) and \
> -the printer, by processing files sent to the printer. \
> - \
> -This package consists of filters used by the printer spoolers \
> -to convert the incoming PostScript data into the printer's native \
> -format using a printer-specific, but spooler-independent PPD file. \
> -"
> -
> -DEPENDS +=3D "cups perl libxml2"
> -PR =3D "r3"
> -
> -LICENSE =3D "GPLv2+"
> -LIC_FILES_CHKSUM =3D "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;m=
d5=3D393a5ca445f6965873eca0259a17f833"
> -
> -SRC_URI =3D "http://www.openprinting.org/download/foomatic/foomatic-filt=
ers-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] =3D "20abd25c1c98b2dae68709062a132a7d"
> -SRC_URI[sha256sum] =3D "090313fae40b177f505d9c9b93d7a4d7188b6d5d18b6ae41=
ab24903ac983478d"
> -
> -inherit autotools
> -
> -EXTRA_OECONF +=3D "--disable-file-converter-check --with-file-converter=
=3Dtexttops"
> -
> -do_configure_prepend() {
> - =C2=A0 =C2=A0export LIB_CUPS=3D${exec_prefix}/lib/cups =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # /usr/lib NOT libdir
> - =C2=A0 =C2=A0export CUPS_BACKENDS=3D${exec_prefix}/lib/cups/backend =C2=
=A0# /usr/lib NOT libdir
> - =C2=A0 =C2=A0export CUPS_FILTERS=3D${exec_prefix}/lib/cups/filter =C2=
=A0 =C2=A0# /usr/lib NOT libdir
> - =C2=A0 =C2=A0export CUPS_PPDS=3D${datadir}/cups/model
> -}
> -
> -do_install_append_linuxstdbase() {
> - =C2=A0 =C2=A0install -d ${D}${exec_prefix}/lib/cups/filter
> - =C2=A0 =C2=A0ln -sf ${bindir}/foomatic-rip ${D}${exec_prefix}/lib/cups/=
filter
> -}
> -
> -FILES_${PN} +=3D "${exec_prefix}/lib/cups/ ${exec_prefix}/lib/ppr/"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

recreate patch with -M and resend

Cheers,


