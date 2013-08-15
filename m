Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id E06BE6612B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 10:36:05 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb10so621177pad.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 03:36:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=+o7082fR3K0+bQSxuxEqDp2HRVn9SBz6fdbQFTWJAsA=;
	b=QCdfb92L+ZFDyt9yQcz6/iCj5xMRNTyKjgQcyTfUvpu+TUkr05WA7sHR+o5UZrrpSg
	ej97xdOK3ynirQZiSGYKyXK09vorDKuEcYHFJyjHAtUGK0jmwQ2awENE1eUIOwh/vIGx
	T+mSStU1CIiWVShbr0o/DUA75tWmcUcpATkku+GqfZazvASkIWs5+q8E9uvXdSdsbw5K
	IrqCKS4SYFYH61/yBFjPUNaXTYV3ANOJfeZIblSraxrd9benYB7kra3PKnoFblNJywPH
	S91ggDfiZr14UCoX/kOiDOVDVUEyt4mL/hWeJTJz3GfGmMVNle8BbS3nGM4y1RbINz3R
	8XAg==
X-Gm-Message-State: ALoCoQle8WGSBYvmumG4GIad6lqmMXFT5qRPuar378BCUIiXGMUeMqbgm1Ct801bsw5xGCbwc0Yy
MIME-Version: 1.0
X-Received: by 10.68.223.225 with SMTP id qx1mr7247237pbc.157.1376562966695;
	Thu, 15 Aug 2013 03:36:06 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Thu, 15 Aug 2013 03:36:06 -0700 (PDT)
In-Reply-To: <520C9C5D.8070701@communistcode.co.uk>
References: <1376540749-459-1-git-send-email-lpapp@kde.org>
	<520C9C5D.8070701@communistcode.co.uk>
Date: Thu, 15 Aug 2013 11:36:06 +0100
X-Google-Sender-Auth: aApSxsVgiq4p_mFWVQcT7gUHZus
Message-ID: <CAOMwXhM9Hq-9OR1bfCJKYLq20SxEQeiyqESEFjrBSzZ_5ibVdw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Thu, 15 Aug 2013 10:36:07 -0000
Content-Type: multipart/alternative; boundary=047d7b160515a41fe604e3fa0a93

--047d7b160515a41fe604e3fa0a93
Content-Type: text/plain; charset=ISO-8859-1

OK, thanks.

Seems fw-utils is broken, and I do not know how to fix it... So do not
approve.


On Thu, Aug 15, 2013 at 10:16 AM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> Hi,
>
> On 15/08/13 05:25, Laszlo Papp wrote:
> > Signed-off-by: Laszlo Papp <lpapp@kde.org>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 26
> +++++++++++++++++++++
> >  meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  | 27
> ++++++++++++++++++++++
> >  meta/recipes-bsp/u-boot/u-boot_2013.07.bb          | 25
> ++++++++++++++++++++
> >  3 files changed, 78 insertions(+)
> >  create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> >  create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> >  create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> >
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bbb/meta/recipes-bsp/u-boot/
> u-boot-fw-utils_2013.07.bb
> > new file mode 100644
> > index 0000000..a5bbb73
> > --- /dev/null
> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
> > @@ -0,0 +1,26 @@
> > +DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
> > +LICENSE = "GPLv2+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb
> \
> > +
>  file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> > +SECTION = "bootloader"
> > +
> > +DEPENDS = "mtd-utils"
> > +
> > +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> > +
> > +SRC_URI[md5sum] = "8445162690052e6afd4b8f87af2bb557"
> > +SRC_URI[sha256sum] =
> "2bbd440c1b29928d230604eac372fda5152d3ae23f52b1910c77fc5bf531250b"
> > +
> > +S = "${WORKDIR}/u-boot-${PV}"
> > +
> > +EXTRA_OEMAKE = 'HOSTCC="${CC}"'
> > +
> > +do_compile () {
> > +  oe_runmake env
> > +}
> > +
> > +do_install () {
> > +  install -d ${D}${base_sbindir}
> > +  install -m 755 ${S}/tools/env/fw_printenv
> ${D}${base_sbindir}/fw_printenv
> > +  install -m 755 ${S}/tools/env/fw_printenv
> ${D}${base_sbindir}/fw_setenv
> > +}
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bbb/meta/recipes-bsp/u-boot/
> u-boot-mkimage_2013.07.bb
> > new file mode 100644
> > index 0000000..0108e00
> > --- /dev/null
> > +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
> > @@ -0,0 +1,27 @@
> > +DESCRIPTION = "U-boot bootloader mkimage tool"
> > +LICENSE = "GPLv2+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb
> \
> > +
>  file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> > +SECTION = "bootloader"
> > +
> > +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> > +
> > +SRC_URI[md5sum] = "8445162690052e6afd4b8f87af2bb557"
> > +SRC_URI[sha256sum] =
> "2bbd440c1b29928d230604eac372fda5152d3ae23f52b1910c77fc5bf531250b"
> > +
> > +S = "${WORKDIR}/u-boot-${PV}"
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > +
> > +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}"
> HOSTSTRIP=true'
> > +
> > +do_compile () {
> > +  oe_runmake tools
> > +}
> > +
> > +do_install () {
> > +  install -d ${D}${bindir}
> > +  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
> > +  ln -sf uboot-mkimage ${D}${bindir}/mkimage
> > +}
> > +
> > diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bbb/meta/recipes-bsp/u-boot/
> u-boot_2013.07.bb
> > new file mode 100644
> > index 0000000..8e05558
> > --- /dev/null
> > +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
> > @@ -0,0 +1,25 @@
> > +require u-boot.inc
> > +
> > +# To build u-boot for your machine, provide the following lines in your
> machine
> > +# config, replacing the assignments as appropriate for your machine.
> > +# UBOOT_MACHINE = "omap3_beagle_config"
> > +# UBOOT_ENTRYPOINT = "0x80008000"
> > +# UBOOT_LOADADDRESS = "0x80008000"
> > +
> > +LICENSE = "GPLv2+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb
> \
> > +
>  file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
> > +
> > +FILESDIR =
> "${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>
> This isn't needed as it is present in u-boot.inc, see
> http://patches.openembedded.org/patch/30879/
>
> > +
> > +# This revision corresponds to the tag "v2013.07"
> > +# We use the revision in order to avoid having to fetch it from the
> repo during parse
> > +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
> > +
> > +PV = "v2013.07+git${SRCPV}"
> > +
> > +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> >
>
> Cheers,
>
> --
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   Cambrideshire, UK
>   http://www.embed.me.uk
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b160515a41fe604e3fa0a93
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, thanks.<div><br></div><div>Seems fw-utils is broken, a=
nd I do not know how to fix it... So do not approve.</div></div><div class=
=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu, Aug 15, 2013 at=
 10:16 AM, Jack Mitchell <span dir=3D"ltr">&lt;<a href=3D"mailto:ml@communi=
stcode.co.uk" target=3D"_blank">ml@communistcode.co.uk</a>&gt;</span> wrote=
:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi,<br>
<div><div class=3D"h5"><br>
On 15/08/13 05:25, Laszlo Papp wrote:<br>
&gt; Signed-off-by: Laszlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@=
kde.org</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2013.07.b=
b" target=3D"_blank">u-boot-fw-utils_2013.07.bb</a> | 26 ++++++++++++++++++=
+++<br>
&gt; =A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.07.bb=
" target=3D"_blank">u-boot-mkimage_2013.07.bb</a> =A0| 27 +++++++++++++++++=
+++++<br>
&gt; =A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.07.bb" target=
=3D"_blank">u-boot_2013.07.bb</a> =A0 =A0 =A0 =A0 =A0| 25 +++++++++++++++++=
+++<br>
&gt; =A03 files changed, 78 insertions(+)<br>
&gt; =A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot=
-fw-utils_2013.07.bb" target=3D"_blank">u-boot-fw-utils_2013.07.bb</a><br>
&gt; =A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot=
-mkimage_2013.07.bb" target=3D"_blank">u-boot-mkimage_2013.07.bb</a><br>
&gt; =A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot=
_2013.07.bb" target=3D"_blank">u-boot_2013.07.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils=
_2013.07.bb" target=3D"_blank">u-boot-fw-utils_2013.07.bb</a> b/meta/recipe=
s-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2013.07.bb" target=3D"_blank=
">u-boot-fw-utils_2013.07.bb</a><br>

&gt; new file mode 100644<br>
&gt; index 0000000..a5bbb73<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2013.0=
7.bb" target=3D"_blank">u-boot-fw-utils_2013.07.bb</a><br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +DESCRIPTION =3D &quot;U-boot bootloader fw_printenv/setenv utils&quot=
;<br>
&gt; +LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50=
183a5651ecb \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;e=
ndline=3D22;md5=3D78b195c11cb6ef63e6985140db7d7bab&quot;<br>
&gt; +SECTION =3D &quot;bootloader&quot;<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;mtd-utils&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"ftp://ftp.denx.de/pub/u-boot/u-boot-${PV=
}.tar.bz2" target=3D"_blank">ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.=
bz2</a>&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;8445162690052e6afd4b8f87af2bb557&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;2bbd440c1b29928d230604eac372fda5152d3ae2=
3f52b1910c77fc5bf531250b&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/u-boot-${PV}&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${CC}&quot;&#39;<br>
&gt; +<br>
&gt; +do_compile () {<br>
&gt; + =A0oe_runmake env<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install () {<br>
&gt; + =A0install -d ${D}${base_sbindir}<br>
&gt; + =A0install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_=
printenv<br>
&gt; + =A0install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_=
setenv<br>
&gt; +}<br>
&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_=
2013.07.bb" target=3D"_blank">u-boot-mkimage_2013.07.bb</a> b/meta/recipes-=
bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.07.bb" target=3D"_blank">u=
-boot-mkimage_2013.07.bb</a><br>

&gt; new file mode 100644<br>
&gt; index 0000000..0108e00<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.07=
.bb" target=3D"_blank">u-boot-mkimage_2013.07.bb</a><br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +DESCRIPTION =3D &quot;U-boot bootloader mkimage tool&quot;<br>
&gt; +LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50=
183a5651ecb \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;e=
ndline=3D22;md5=3D78b195c11cb6ef63e6985140db7d7bab&quot;<br>
&gt; +SECTION =3D &quot;bootloader&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"ftp://ftp.denx.de/pub/u-boot/u-boot-${PV=
}.tar.bz2" target=3D"_blank">ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.=
bz2</a>&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;8445162690052e6afd4b8f87af2bb557&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;2bbd440c1b29928d230604eac372fda5152d3ae2=
3f52b1910c77fc5bf531250b&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/u-boot-${PV}&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${CC}&quot; HOSTLD=3D&quot;${LD}=
&quot; HOSTLDFLAGS=3D&quot;${LDFLAGS}&quot; HOSTSTRIP=3Dtrue&#39;<br>
&gt; +<br>
&gt; +do_compile () {<br>
&gt; + =A0oe_runmake tools<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install () {<br>
&gt; + =A0install -d ${D}${bindir}<br>
&gt; + =A0install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage<br>
&gt; + =A0ln -sf uboot-mkimage ${D}${bindir}/mkimage<br>
&gt; +}<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.07.=
bb" target=3D"_blank">u-boot_2013.07.bb</a> b/meta/recipes-bsp/u-boot/<a hr=
ef=3D"http://u-boot_2013.07.bb" target=3D"_blank">u-boot_2013.07.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..8e05558<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.07.bb" tar=
get=3D"_blank">u-boot_2013.07.bb</a><br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +require u-boot.inc<br>
&gt; +<br>
&gt; +# To build u-boot for your machine, provide the following lines in yo=
ur machine<br>
&gt; +# config, replacing the assignments as appropriate for your machine.<=
br>
&gt; +# UBOOT_MACHINE =3D &quot;omap3_beagle_config&quot;<br>
&gt; +# UBOOT_ENTRYPOINT =3D &quot;0x80008000&quot;<br>
&gt; +# UBOOT_LOADADDRESS =3D &quot;0x80008000&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;GPLv2+&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50=
183a5651ecb \<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;e=
ndline=3D22;md5=3D78b195c11cb6ef63e6985140db7d7bab&quot;<br>
&gt; +<br>
&gt; +FILESDIR =3D &quot;${@os.path.dirname(d.getVar(&#39;FILE&#39;,1))}/u-=
boot-git/${MACHINE}&quot;<br>
<br>
</div></div>This isn&#39;t needed as it is present in u-boot.inc, see<br>
<a href=3D"http://patches.openembedded.org/patch/30879/" target=3D"_blank">=
http://patches.openembedded.org/patch/30879/</a><br>
<div class=3D"im"><br>
&gt; +<br>
&gt; +# This revision corresponds to the tag &quot;v2013.07&quot;<br>
&gt; +# We use the revision in order to avoid having to fetch it from the r=
epo during parse<br>
&gt; +SRCREV =3D &quot;62c175fbb8a0f9a926c88294ea9f7e88eb898f6c&quot;<br>
&gt; +<br>
&gt; +PV =3D &quot;v2013.07+git${SRCPV}&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git;bran=
ch=3Dmaster;protocol=3Dgit" target=3D"_blank">git.denx.de/u-boot.git;branch=
=3Dmaster;protocol=3Dgit</a>&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; +<br>
&gt; +PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt;<br>
<br>
</div>Cheers,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
=A0 Jack Mitchell (<a href=3D"mailto:jack@embed.me.uk">jack@embed.me.uk</a>=
)<br>
=A0 Embedded Systems Engineer<br>
=A0 Cambrideshire, UK<br>
=A0 <a href=3D"http://www.embed.me.uk" target=3D"_blank">http://www.embed.m=
e.uk</a><br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--047d7b160515a41fe604e3fa0a93--
