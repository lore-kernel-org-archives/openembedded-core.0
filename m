Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B0BDD786F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 22:47:09 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id i38so24819313iod.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 14:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CzclF9EM68K36rw6EIWaBCcuSM3ynY6Q/cbHZhQON5c=;
	b=1Yd9uot6uXJYP5W+Xpcobc6yHyRVj5XGJU4CU8WG7lpt8GQ1hBuvcNhFX5GupqiFX2
	Q+uHNWKsAE22WxPAWsYJ8eGwFigdIz6CQRUiXyVTv4LIibBlGYSJrBsM5nUUF2Nx1+aZ
	5clMOiDOcmP6QGAyJ8RuJ03MNMYCTBo00k5X3Zz+lDVfxC67mpQNgoI+0Mpf44hLoAXm
	x6Bpwp767mKiQpsiyUZTcPRSeD9VdGb2O2H6lIFskGmEdVEJgukaWOfem7I52+wijHWz
	2BXtFueeKEyNRXVuNZCzQ0RWeBuGpOa43E4uLQJeA+5XGlovLR5woYNtwMra89WxNkQE
	HVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CzclF9EM68K36rw6EIWaBCcuSM3ynY6Q/cbHZhQON5c=;
	b=PkpInN4+HFZlwJYd+c9B/LBVYHoryfJHTO+fCudk2khXigC+Qhli0UzD9rfoYRuHsN
	jPBEVES+b/BBfVKfCHhdzK2HSgRC2tSxxTAOzBiyei3F0NqKYNbSreBRuHtjt/pYId8+
	rnFHymkJBPkKtTxjLAhFBYkPBN0EPQ6q2wlFeLax6sWfWJg0i/pDNa29LIhWTuew4iEB
	l9p8GVpyJuMxfK133jtsia1iVwYtoQ5BdC0Ss/PHIegMktmsJCv2bYtN0+rYd9O8CUdQ
	O9Fg32xef1n3Yd5cH2JerMzHwxOMKBrDG+nDXGuOSDMOycSjIgTgGrJnDC5qdzByyTgF
	5ibA==
X-Gm-Message-State: AJaThX7wthDIz9hJ198BwuGnZjMbb8fUB+EsH5r022rPoXXxzvc3gbJc
	/YTu6M/BK00rbEVLBkDPqO/RErXq1UEdhIIfPfwCNQ==
X-Google-Smtp-Source: AGs4zMYJ5z0ryNvRHfn2eOTVRSG1E9ts5/hz85nxaqsn1XAhqtC6feOZQbOyyHRNfIvFFyiURlkIhKRVH/uNVEL0pW4=
X-Received: by 10.107.32.18 with SMTP id g18mr23776922iog.227.1511390830625;
	Wed, 22 Nov 2017 14:47:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.132 with HTTP; Wed, 22 Nov 2017 14:46:50 -0800 (PST)
In-Reply-To: <20171122213140.4307-1-limon.anibal@gmail.com>
References: <20171122213140.4307-1-limon.anibal@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Nov 2017 22:46:50 +0000
Message-ID: <CAJTo0La9PvgkwQy5t0339gYg0cfGFUBDiA4izcCBbCHxYRRzhA@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-multimedia/gstreamer: Add gst-validate recipe
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
X-List-Received-Date: Wed, 22 Nov 2017 22:47:09 -0000
Content-Type: multipart/alternative; boundary="001a1141b49893a690055e9a1958"

--001a1141b49893a690055e9a1958
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patchtest already told you about the SUMMARY typo.  I've been meaning to
look at this for automated gstreamer QA, would you say this would be simple
enough and there would be value in integrating this into oe-selftest?

Ross

On 22 November 2017 at 21:31, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.co=
m> wrote:

> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>
> The gst-validate is a tool to run integration tests of Gstreamer
> components [1].
>
> [1]
> https://blogs.gnome.org/tsaunier/2014/04/21/gst-
> validate-a-suite-of-tools-to-run-integration-tests-for-gstreamer-2/
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  .../recipes-multimedia/gstreamer/gst-validate_1.12.3.bb | 17
> +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-validate_1.12.3=
.
> bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
> b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
> new file mode 100644
> index 0000000000..7477bf7a4e
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
> @@ -0,0 +1,17 @@
> +SUMARRY =3D "Gstreamer validation tool"
> +DESCRIPTION =3D "A Tool to test GStreamer components"
> +HOMEPAGE =3D "https://gstreamer.freedesktop.org/releases/gst-
> validate/1.12.3.html"
> +SECTION =3D "multimedia"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
> +
> +SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar=
.xz
> "
> +SRC_URI[md5sum] =3D "623edc479a1e5c1e76bd7e1cf8393253"
> +SRC_URI[sha256sum] =3D "5139949d20274fdd702492438eeab2
> c9e55aa82f60aca17db27ebd3faf08489e"
> +
> +DEPENDS =3D "json-glib glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
> +
> +FILES_${PN} +=3D "${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-laun=
cher/*
> ${libdir}/gstreamer-1.0/*"
> +
> +inherit pkgconfig gettext autotools gobject-introspection gtk-doc
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1141b49893a690055e9a1958
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patchtest already told you about the SUMMARY typo.=C2=A0 I=
&#39;ve been meaning to look at this for automated gstreamer QA, would you =
say this would be simple enough and there would be value in integrating thi=
s into oe-selftest?<div><br></div><div>Ross</div></div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On 22 November 2017 at 21:31, An=C3=
=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a href=3D"mailto:limon.anibal@gmai=
l.com" target=3D"_blank">limon.anibal@gmail.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">From: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"ma=
ilto:anibal.limon@linaro.org">anibal.limon@linaro.org</a>&gt;<br>
<br>
The gst-validate is a tool to run integration tests of Gstreamer<br>
components [1].<br>
<br>
[1]<br>
<a href=3D"https://blogs.gnome.org/tsaunier/2014/04/21/gst-validate-a-suite=
-of-tools-to-run-integration-tests-for-gstreamer-2/" rel=3D"noreferrer" tar=
get=3D"_blank">https://blogs.gnome.org/<wbr>tsaunier/2014/04/21/gst-<wbr>va=
lidate-a-suite-of-tools-to-<wbr>run-integration-tests-for-<wbr>gstreamer-2/=
</a><br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gst-validate_=
1.12.3.bb" rel=3D"noreferrer" target=3D"_blank">gst-validate_1.12.3.<wbr>bb=
</a> | 17 +++++++++++++++++<br>
=C2=A01 file changed, 17 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"=
http://gst-validate_1.12.3.bb" rel=3D"noreferrer" target=3D"_blank">gst-val=
idate_1.12.3.<wbr>bb</a><br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gst-v=
alidate_1.12.3.bb" rel=3D"noreferrer" target=3D"_blank">gst-validate_1.12.3=
.<wbr>bb</a> b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gst=
-validate_1.12.3.bb" rel=3D"noreferrer" target=3D"_blank">gst-validate_1.12=
.3.<wbr>bb</a><br>
new file mode 100644<br>
index 0000000000..7477bf7a4e<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gst-validate=
_1.12.3.bb" rel=3D"noreferrer" target=3D"_blank">gst-validate_1.12.3.<wbr>b=
b</a><br>
@@ -0,0 +1,17 @@<br>
+SUMARRY =3D &quot;Gstreamer validation tool&quot;<br>
+DESCRIPTION =3D &quot;A Tool to test GStreamer components&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/releases/g=
st-validate/1.12.3.html" rel=3D"noreferrer" target=3D"_blank">https://gstre=
amer.<wbr>freedesktop.org/releases/gst-<wbr>validate/1.12.3.html</a>&quot;<=
br>
+SECTION =3D &quot;multimedia&quot;<br>
+<br>
+LICENSE =3D &quot;LGPLv2.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>a6f89e2100d9b6cdffcea=
4f398e373<wbr>43&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/${PN}/$=
{PN}-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://gstreamer.<=
wbr>freedesktop.org/src/${PN}/${<wbr>PN}-${PV}.tar.xz</a>&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>623edc479a1e5c1e76bd7e1cf83932<wbr>53&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>5139949d20274fdd702492438eeab2<wbr>c9e55=
aa82f60aca17db27ebd3faf08<wbr>489e&quot;<br>
+<br>
+DEPENDS =3D &quot;json-glib glib-2.0 gstreamer1.0 gstreamer1.0-plugins-bas=
e&quot;<br>
+<br>
+FILES_${PN} +=3D &quot;${datadir}/gstreamer-1.0/* ${libdir}/gst-validate-<=
wbr>launcher/* ${libdir}/gstreamer-1.0/*&quot;<br>
+<br>
+inherit pkgconfig gettext autotools gobject-introspection gtk-doc<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.11.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1141b49893a690055e9a1958--
