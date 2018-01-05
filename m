Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 70EB26011C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 11:39:22 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id d16so1367251itj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jan 2018 03:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X6wWVVT4ovhD9JlXXoUBIByl1MgiZKTT8wTuI8DUeWs=;
	b=uNWxVLQ4uuuPTeOOdpsZZb8bRmpN6ov4G0GTV8yX4bUfBWabp4oV2wXLNP5xJni668
	lttb+5exCm963AyOOxBZXdWxxOFiWmQ75xzqB8jxavQf1A1v6obZkNOjqsbu+m6+eCL6
	p3bHihWCMLJ544FzzGxbshrwws6NJJkYIhSwK95dnjAzZ+zi/af3NOU/A4pyPkpIfr9z
	2TcLw2Uha3/iDykCCr/q2+OsrE9yPd1I1/0D8r+V+YMmSz7wfpCeNIoefZGF9uGQ0BiL
	PY4/goDTfyLIOWZDMUFxC3jWBldr7EtR8y3dDzl2ccluBv/3uHzFXmyP2MV0+oRXQ1J0
	I6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X6wWVVT4ovhD9JlXXoUBIByl1MgiZKTT8wTuI8DUeWs=;
	b=YIcjbipce8xUU3suJgq994KrBMWsSnHCHYQ4vLbpl/I+ve0Q6kGblNqcNj6PYNPc4x
	dxkyOT4/uDG6029695RnHqFHN9nApjwyDs4H/7sW8UsK9N1KxmRmQLP0bzWZihrQMZns
	Y9/2WNCPLzoqgMxhjmeI3MtxkLpmLGU81IpJrksxo71Kf0Od4FtGnt3NNUu+G0vr74b9
	I2ah26OgEI7kLRDMLgiMrg5C4NYJov6b3tJrQ2HFSKPnuoQCFWfCQovkdKUy4UGmtRhD
	8G4ZJ1gQicvVfCoq0VwrNTInTKUsBWKIQR3bYgleSi6eav++fP+2PgT7pVkep6hrHJYp
	Pexg==
X-Gm-Message-State: AKGB3mIfayes7sjVKVQQEwgpaUe24jinYJOvyHvoooeH4DpMuNurfzuc
	/cPco9sgzvlbT8Ljhr0KqIFm9SV4dv1u9wKbgKaQnw==
X-Google-Smtp-Source: ACJfBouaN1knWxMe0HQF9EAG368/lccx0axI+tDhLDRBl1AgsZfLg7mo/Rnmu9F+heFcMb9Gyyo3kSDpGxcfN4+7Lqw=
X-Received: by 10.36.157.203 with SMTP id f194mr2836195itd.53.1515152364149;
	Fri, 05 Jan 2018 03:39:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.34.133 with HTTP; Fri, 5 Jan 2018 03:39:03 -0800 (PST)
In-Reply-To: <20171212171114.15534-1-limon.anibal@gmail.com>
References: <20171212171114.15534-1-limon.anibal@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Jan 2018 11:39:03 +0000
Message-ID: <CAJTo0LYXdv4FNfni_s1FnYBaGBfSzNTkMGoMMV4QpdQUOG4uiQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Cc: oss.burton@intel.com,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3] recipes-multimedia/gstreamer: Add gst-validate recipe
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
X-List-Received-Date: Fri, 05 Jan 2018 11:39:23 -0000
Content-Type: multipart/alternative; boundary="001a1134fbb672380e056205e67e"

--001a1134fbb672380e056205e67e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If api-documentation is enabled:

| make[3]: Entering directory
'/data/poky-tmp/master/build/work/corei7-64-poky-linux/gst-validate/1.12.4-=
r0/build/docs/plugins'
|   DOC   Preparing build
|   DOC   Preparing build
|   DOC   Scanning header files
|   DOC   Scanning header files
|   DOC   Introspecting gobjects
|   DOC   Introspecting gobjects
| ../../x86_64-poky-linux-libtool: line 11727:
/data/poky-tmp/master/build/work/corei7-64-poky-linux/gst-validate/1.12.4-r=
0/build/docs/plugins/gst-validate-plugins-scan:
No such file or directory
| Scan failed:
| Makefile:802: recipe for target 'scan-build.stamp' failed

Ross

On 12 December 2017 at 17:11, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.co=
m> wrote:

> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>
> The gst-validate is a tool to run integration tests of Gstreamer
> components [1].
>
> This tool can be used along with gst-integration-testsuites (scenarios
> and media) [2] to test Gstreamer components on the target device.
>
> An example of test using gst-integration-testsuites:
>
> $ gst-validate-launcher --sync # get [2] uses git and git-annex
> $ gst-validate-launcher
>
> or
>
> $ gst-validate-launcher -nd # needs xserver-xorg-xvfb to run wo DISPLAY
>
> [1]
> https://blogs.gnome.org/tsaunier/2014/04/21/gst-
> validate-a-suite-of-tools-to-run-integration-tests-for-gstreamer-2/
> [2] https://cgit.freedesktop.org/gstreamer/gst-integration-testsuites
>
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
> ---
>  .../gstreamer/gst-validate_1.12.3.bb                   | 18
> ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gst-validate_1.12.3=
.
> bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
> b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
> new file mode 100644
> index 0000000000..8f5437641f
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-validate_1.12.3.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Gstreamer validation tool"
> +DESCRIPTION =3D "A Tool to test GStreamer components"
> +HOMEPAGE =3D "https://gstreamer.freedesktop.org/releases/gst-
> validate/1.12.3.html"
> +SECTION =3D "multimedia"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
> +
> +SRC_URI =3D "https://gstreamer.freedesktop.org/src/${BPN}/${BP}.tar.xz"
> +SRC_URI[md5sum] =3D "623edc479a1e5c1e76bd7e1cf8393253"
> +SRC_URI[sha256sum] =3D "5139949d20274fdd702492438eeab2
> c9e55aa82f60aca17db27ebd3faf08489e"
> +
> +DEPENDS =3D "json-glib glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
> +RRECOMMENDS_${PN} =3D "git"
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

--001a1134fbb672380e056205e67e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If api-documentation is enabled:<div><br></div><div><div>|=
 make[3]: Entering directory &#39;/data/poky-tmp/master/build/work/corei7-6=
4-poky-linux/gst-validate/1.12.4-r0/build/docs/plugins&#39;</div><div>| =C2=
=A0 DOC =C2=A0 Preparing build</div><div>| =C2=A0 DOC =C2=A0 Preparing buil=
d</div><div>| =C2=A0 DOC =C2=A0 Scanning header files</div><div>| =C2=A0 DO=
C =C2=A0 Scanning header files</div><div>| =C2=A0 DOC =C2=A0 Introspecting =
gobjects</div><div>| =C2=A0 DOC =C2=A0 Introspecting gobjects</div><div>| .=
./../x86_64-poky-linux-libtool: line 11727: /data/poky-tmp/master/build/wor=
k/corei7-64-poky-linux/gst-validate/1.12.4-r0/build/docs/plugins/gst-valida=
te-plugins-scan: No such file or directory</div><div>| Scan failed:</div><d=
iv>| Makefile:802: recipe for target &#39;scan-build.stamp&#39; failed</div=
></div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On 12 December 2017 at 17:11, An=C3=ADbal Lim=C3=
=B3n <span dir=3D"ltr">&lt;<a href=3D"mailto:limon.anibal@gmail.com" target=
=3D"_blank">limon.anibal@gmail.com</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">From: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.l=
imon@linaro.org">anibal.limon@linaro.org</a>&gt;<br>
<br>
The gst-validate is a tool to run integration tests of Gstreamer<br>
components [1].<br>
<br>
This tool can be used along with gst-integration-testsuites (scenarios<br>
and media) [2] to test Gstreamer components on the target device.<br>
<br>
An example of test using gst-integration-testsuites:<br>
<br>
$ gst-validate-launcher --sync # get [2] uses git and git-annex<br>
$ gst-validate-launcher<br>
<br>
or<br>
<br>
$ gst-validate-launcher -nd # needs xserver-xorg-xvfb to run wo DISPLAY<br>
<br>
[1]<br>
<a href=3D"https://blogs.gnome.org/tsaunier/2014/04/21/gst-validate-a-suite=
-of-tools-to-run-integration-tests-for-gstreamer-2/" rel=3D"noreferrer" tar=
get=3D"_blank">https://blogs.gnome.org/<wbr>tsaunier/2014/04/21/gst-<wbr>va=
lidate-a-suite-of-tools-to-<wbr>run-integration-tests-for-<wbr>gstreamer-2/=
</a><br>
[2] <a href=3D"https://cgit.freedesktop.org/gstreamer/gst-integration-tests=
uites" rel=3D"noreferrer" target=3D"_blank">https://cgit.freedesktop.org/<w=
br>gstreamer/gst-integration-<wbr>testsuites</a><br>
<br>
Signed-off-by: An=C3=ADbal Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@li=
naro.org">anibal.limon@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../gstreamer/<a href=3D"http://gst-validate_1.12.3.bb" rel=3D"norefe=
rrer" target=3D"_blank">gst-validate_1.<wbr>12.3.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++++++++++++++++<br=
>
=C2=A01 file changed, 18 insertions(+)<br>
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
index 0000000000..8f5437641f<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/<wbr>gstreamer/<a href=3D"http://gst-validate=
_1.12.3.bb" rel=3D"noreferrer" target=3D"_blank">gst-validate_1.12.3.<wbr>b=
b</a><br>
@@ -0,0 +1,18 @@<br>
+SUMMARY =3D &quot;Gstreamer validation tool&quot;<br>
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
+SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/src/${BPN}/=
${BP}.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://gstreamer.<wbr>f=
reedesktop.org/src/${BPN}/${<wbr>BP}.tar.xz</a>&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>623edc479a1e5c1e76bd7e1cf83932<wbr>53&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>5139949d20274fdd702492438eeab2<wbr>c9e55=
aa82f60aca17db27ebd3faf08<wbr>489e&quot;<br>
+<br>
+DEPENDS =3D &quot;json-glib glib-2.0 gstreamer1.0 gstreamer1.0-plugins-bas=
e&quot;<br>
+RRECOMMENDS_${PN} =3D &quot;git&quot;<br>
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

--001a1134fbb672380e056205e67e--
