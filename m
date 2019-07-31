Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
	[209.85.221.177])
	by mail.openembedded.org (Postfix) with ESMTP id 166E27EA36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 16:18:19 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id w186so5331746vkd.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 09:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dVmQBXvuiKS6sQQIpBNMEiE2dXqO/lFJDMqS/BDqMVo=;
	b=RKul08CjszxQdC1j4YLmyDo0bkHCDaKDOFmTO3v6ZxCOnk6920spVQLZTHquCtN4FT
	4tWYXGgpD6e9WGFxNGTEyaB2bHMRij3m6feIC2rDUv0Ml63ftZk1xxQMnHoZUHv/RT56
	MiUYOYoj8g3zU6vDdtMzZ2QNLBlQPXL/06Qgm5XiMPmhUJEEl3FrFS4oSxpYqoeNjFjz
	t/FjdDlO3k9SxLEejc1yW4US/fL8V3PtHbkIrB9WDn/l6yzCmmmjo06gTN9os5ey1MB3
	x85wezxoeKaZOhSWttCpt4ABO/W2x0pDZmUw5QKCZ8sVe2BlGVzlEQwFoParktxQWyNg
	dguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dVmQBXvuiKS6sQQIpBNMEiE2dXqO/lFJDMqS/BDqMVo=;
	b=IhrYoyE8OLFRcozKn+b2Xc2vwWN23kNm03OFIdHaPurJmF6OaxJw3vtKb3iKlgpKA9
	jSMnEPz0mJPcsnAW3+31+2Bd95tv/sdgaibynHwUXqbBb6YlWa3ocN2SIsp1u0tp1VWh
	a0UlKHCnC5TnkouKPDzY6l5NILN4RgFO8Kzp8PuwE0l2AAG5fGs33BSRR8aFTf54vsjC
	m4xevZZggi/xXsD73pumDfOm3WCQ2TX1bJhNVG6KBkfQk6NOo8xCFg8T9RHUrDNpHMQi
	uovj1Ub5YLGejVVJYcXdXzNKe+Y0Cw5dKHaaYuSBJ5P/7LUfgh4OVp7BVn+sVF548kuj
	7F2w==
X-Gm-Message-State: APjAAAXeKfAfBKzoYeMOEjYYE9USFVM/DW1mk3yaG9Gv7B+rAS8Ye/Pj
	eaUb+8zR944xn7BiTs/vJbLxb5y3pPlyFAQAzy8ceXKv
X-Google-Smtp-Source: APXvYqzsdTbffhzBaYb3qXb3Q5nP+qqAPyfRjDyZ02zjVyt/bxfxzJen4M4wZlrk0gcSzq8tZJOEzdqHXAdpX2aC+pk=
X-Received: by 2002:a1f:8bc4:: with SMTP id n187mr47533814vkd.32.1564589900741;
	Wed, 31 Jul 2019 09:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190731132514.32040-1-bunk@stusta.de>
In-Reply-To: <20190731132514.32040-1-bunk@stusta.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 Jul 2019 18:18:09 +0200
Message-ID: <CANNYZj8eOnzQqxRoLf0N8aJGe6EBgnvOWwS4AANczmW7vyRKsQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Change ftp:// URIs to http(s)://
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
X-List-Received-Date: Wed, 31 Jul 2019 16:18:20 -0000
Content-Type: multipart/alternative; boundary="00000000000040c3d6058efc7959"

--00000000000040c3d6058efc7959
Content-Type: text/plain; charset="UTF-8"

Thanks!


Alex

On Wed, 31 Jul 2019 at 15:25, Adrian Bunk <bunk@stusta.de> wrote:

> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-connectivity/dhcp/dhcp.inc                | 2 +-
>  meta/recipes-core/newlib/newlib.inc                    | 2 +-
>  meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 2 +-
>  meta/recipes-support/libffi/libffi_3.2.1.bb            | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc
> b/meta/recipes-connectivity/dhcp/dhcp.inc
> index 3e65e5cf29..18bbaf8841 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp.inc
> +++ b/meta/recipes-connectivity/dhcp/dhcp.inc
> @@ -21,7 +21,7 @@ SRC_URI = "
> http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
>             file://dhcpd.service file://dhcrelay.service \
>             file://dhcpd6.service \
>             "
> -UPSTREAM_CHECK_URI = "ftp://ftp.isc.org/isc/dhcp/"
> +UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
>
>  inherit autotools-brokensep systemd useradd update-rc.d
> diff --git a/meta/recipes-core/newlib/newlib.inc
> b/meta/recipes-core/newlib/newlib.inc
> index 418cf07939..2f0553bd63 100644
> --- a/meta/recipes-core/newlib/newlib.inc
> +++ b/meta/recipes-core/newlib/newlib.inc
> @@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
>
> file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0
> \
>                 "
>
> -SRC_URI = "ftp://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
> +SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
>  SRC_URI[md5sum] = "f84263b7d524df92a9c9fb30b79e0134"
>  SRC_URI[sha256sum] =
> "fb4fa1cc21e9060719208300a61420e4089d6de6ef59cf533b57fe74801d102a"
>
> diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> index 6d232a50e4..dd945c970f 100644
> --- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> +++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
> @@ -18,7 +18,7 @@ FILES_libwrap-staticdev = "${libdir}/lib*.a"
>  FILES_${PN} = "${sbindir}"
>  FILES_${PN}-doc = "${mandir}/man8"
>
> -SRC_URI = "ftp://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz
> \
> +SRC_URI = "
> http://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
>             file://00_man_quoting.diff \
>             file://01_man_portability.patch \
>             file://05_wildcard_matching.patch \
> diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb
> b/meta/recipes-support/libffi/libffi_3.2.1.bb
> index 792a1143b2..f2c684a7a6 100644
> --- a/meta/recipes-support/libffi/libffi_3.2.1.bb
> +++ b/meta/recipes-support/libffi/libffi_3.2.1.bb
> @@ -10,7 +10,7 @@ A layer must exist above `libffi' that handles type
> conversions for values passe
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
>
> -SRC_URI = "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
> +SRC_URI = "https://sourceware.org/pub/libffi/${BP}.tar.gz \
>             file://not-win32.patch \
>             file://0001-mips-Use-compiler-internal-define-for-linux.patch \
>             file://0001-mips-fix-MIPS-softfloat-build-issue.patch \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000040c3d6058efc7959
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks!</div><div><br></div><div><br></div><div>Alex<=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, 31 Jul 2019 at 15:25, Adrian Bunk &lt;<a href=3D"mailto:bu=
nk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Signed-off-by: Adrian Bunk &lt;<a href=3D"mailt=
o:bunk@stusta.de" target=3D"_blank">bunk@stusta.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/dhcp/dhcp.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-core/newlib/newlib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-extended/tcp-wrappers/<a href=3D"http://tcp-wrappers_7.6=
.bb" rel=3D"noreferrer" target=3D"_blank">tcp-wrappers_7.6.bb</a> | 2 +-<br=
>
=C2=A0meta/recipes-support/libffi/<a href=3D"http://libffi_3.2.1.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.2.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A04 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connect=
ivity/dhcp/dhcp.inc<br>
index 3e65e5cf29..18bbaf8841 100644<br>
--- a/meta/recipes-connectivity/dhcp/dhcp.inc<br>
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc<br>
@@ -21,7 +21,7 @@ SRC_URI =3D &quot;<a href=3D"http://ftp.isc.org/isc/dhcp/=
$%7BPV%7D/dhcp-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:=
//ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dhcpd.service file://dhcre=
lay.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dhcpd6.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-UPSTREAM_CHECK_URI =3D &quot;<a href=3D"ftp://ftp.isc.org/isc/dhcp/" rel=
=3D"noreferrer" target=3D"_blank">ftp://ftp.isc.org/isc/dhcp/</a>&quot;<br>
+UPSTREAM_CHECK_URI =3D &quot;<a href=3D"http://ftp.isc.org/isc/dhcp/" rel=
=3D"noreferrer" target=3D"_blank">http://ftp.isc.org/isc/dhcp/</a>&quot;<br=
>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;\d+\.\d+\.(\d+?))/&quot=
;<br>
<br>
=C2=A0inherit autotools-brokensep systemd useradd update-rc.d<br>
diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib=
/newlib.inc<br>
index 418cf07939..2f0553bd63 100644<br>
--- a/meta/recipes-core/newlib/newlib.inc<br>
+++ b/meta/recipes-core/newlib/newlib.inc<br>
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://newlib/libc/=
sys/linux/linuxthreads/LICENSE;md5=3D73640207fbc79b198c7ffd4ad4d97aa0 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"ftp://sourceware.org/pub/newlib/newlib-$%7BPV=
%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">ftp://sourceware.org/pub/n=
ewlib/newlib-${PV}.tar.gz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/newlib/newlib-$%7B=
PV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/p=
ub/newlib/newlib-${PV}.tar.gz</a>&quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;f84263b7d524df92a9c9fb30b79e0134&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;fb4fa1cc21e9060719208300a61420e4089d6de6=
ef59cf533b57fe74801d102a&quot;<br>
<br>
diff --git a/meta/recipes-extended/tcp-wrappers/<a href=3D"http://tcp-wrapp=
ers_7.6.bb" rel=3D"noreferrer" target=3D"_blank">tcp-wrappers_7.6.bb</a> b/=
meta/recipes-extended/tcp-wrappers/<a href=3D"http://tcp-wrappers_7.6.bb" r=
el=3D"noreferrer" target=3D"_blank">tcp-wrappers_7.6.bb</a><br>
index 6d232a50e4..dd945c970f 100644<br>
--- a/meta/recipes-extended/tcp-wrappers/<a href=3D"http://tcp-wrappers_7.6=
.bb" rel=3D"noreferrer" target=3D"_blank">tcp-wrappers_7.6.bb</a><br>
+++ b/meta/recipes-extended/tcp-wrappers/<a href=3D"http://tcp-wrappers_7.6=
.bb" rel=3D"noreferrer" target=3D"_blank">tcp-wrappers_7.6.bb</a><br>
@@ -18,7 +18,7 @@ FILES_libwrap-staticdev =3D &quot;${libdir}/lib*.a&quot;<=
br>
=C2=A0FILES_${PN} =3D &quot;${sbindir}&quot;<br>
=C2=A0FILES_${PN}-doc =3D &quot;${mandir}/man8&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"ftp://ftp.porcupine.org/pub/security/tcp_wrap=
pers_$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.porcu=
pine.org/pub/security/tcp_wrappers_${PV}.tar.gz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"http://ftp.porcupine.org/pub/security/tcp_wra=
ppers_$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://ftp.por=
cupine.org/pub/security/tcp_wrappers_${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00_man_quoting.diff \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://01_man_portability.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://05_wildcard_matching.patch=
 \<br>
diff --git a/meta/recipes-support/libffi/<a href=3D"http://libffi_3.2.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">libffi_3.2.1.bb</a> b/meta/recipes-su=
pport/libffi/<a href=3D"http://libffi_3.2.1.bb" rel=3D"noreferrer" target=
=3D"_blank">libffi_3.2.1.bb</a><br>
index 792a1143b2..f2c684a7a6 100644<br>
--- a/meta/recipes-support/libffi/<a href=3D"http://libffi_3.2.1.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.2.1.bb</a><br>
+++ b/meta/recipes-support/libffi/<a href=3D"http://libffi_3.2.1.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.2.1.bb</a><br>
@@ -10,7 +10,7 @@ A layer must exist above `libffi&#39; that handles type c=
onversions for values passe<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3610bb17683a0089ed640=
55416b2ae1b&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"ftp://sourceware.org/pub/libffi/$%7BBP%7D.tar=
.gz" rel=3D"noreferrer" target=3D"_blank">ftp://sourceware.org/pub/libffi/$=
{BP}.tar.gz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://sourceware.org/pub/libffi/$%7BBP%7D.t=
ar.gz" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/pub/libf=
fi/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://not-win32.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mips-Use-compiler-int=
ernal-define-for-linux.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-mips-fix-MIPS-softflo=
at-build-issue.patch \<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000040c3d6058efc7959--
