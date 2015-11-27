Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 648366012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 11:43:44 +0000 (UTC)
Received: by obbww6 with SMTP id ww6so80983534obb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 03:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=a8ZiE9QxkmdjaJ0/7uNQED6M/mQJ94pGP6M6guM96qo=;
	b=cfTvUIXNPCM814Y4uEFfS1giaBYHL0TmbnsTRVt7UoiBsgmcNaE0ZN8axbbazbeFTw
	c8tiZlZiYQ3ekyHfEg4XLYqHZyk9292wS/nA7xLNKQ4/lNDREHCLSg8IR8CCgg+kafhA
	wJaXyOzWXyo1++r0zS/S14WGAV6/5zPgSOyYNb5FDDzkclaAiyI+RsjUu63Sqe1EDRC0
	HQBJap1XzQSfgHNkAwB5kBO2nMZuUGBtACOOY0PfQ3NfNgbBZHVwlv4WF6mTOXYoisgh
	AzSPMX5L5vxYWu+QktJsjRAlBMTchAHxh8ZeCMRSN3HCDspF2Dysl4GeTUgJ8gK/EZcK
	y9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=a8ZiE9QxkmdjaJ0/7uNQED6M/mQJ94pGP6M6guM96qo=;
	b=ivhDTsnd31194ZjpURf+Jpf+885bi5WISo1nsUhP+kG8Yi934pHbN9PAr2Pn+KZkXs
	YcvwTB7x8vOPvWw2ffILsB9vhb1x3o7M0HHyCKaD9s2KvopbtO2IsTh0iziD0LnZ7u2V
	g6AI2L5ZgWj/BmxDA/sdOtP9Tts9b10pdgcoBoYhINWXscTB/9YvTx5xvcMSHeMxxi7l
	l3bYL8DFjlgFRhjPkSYbHfIJnm6+RL4yFhgfaj5np6PCNhL/KT+/nQ3+5u+Zr4WuNl5Z
	4NGgBhXt8p/0l0saPghmGNI4X56ay+cLQnD3jw4Nq2gE7LCNd/+8j+tPH9YtMZPZeXx8
	oBPw==
X-Gm-Message-State: ALoCoQncKyRWc5cNan1r7VJM2AeTKdPkfKd01QujtZBhDLKI4fRxhNjIa7/P4X95wxD2lCpXzt98
X-Received: by 10.182.22.132 with SMTP id d4mr21273806obf.50.1448624625268;
	Fri, 27 Nov 2015 03:43:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.51.67 with HTTP; Fri, 27 Nov 2015 03:43:15 -0800 (PST)
In-Reply-To: <1448622259-5907-3-git-send-email-maxin.john@intel.com>
References: <1448622259-5907-1-git-send-email-maxin.john@intel.com>
	<1448622259-5907-3-git-send-email-maxin.john@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 27 Nov 2015 13:43:15 +0200
Message-ID: <CAHiDW_En8hTXAxv6cWP8SxMWvUDUD2fLvX0fvU+m-1wDE+5WQA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libjpeg-turbo: import the recipe from meta-oe
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
X-List-Received-Date: Fri, 27 Nov 2015 11:43:51 -0000
Content-Type: multipart/alternative; boundary=001a11c2fd1033d27505258434aa

--001a11c2fd1033d27505258434aa
Content-Type: text/plain; charset=UTF-8

On 27 November 2015 at 13:04, Maxin B. John <maxin.john@intel.com> wrote:

> libjpeg-turbo has same API/ABI as libjpeg. It is relatively
> faster in JPEG compression/decompression than libjpeg.
>
> [YOCTO #8628]
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb | 40
> ++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
>
> diff --git a/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> new file mode 100644
> index 0000000..e79f800
> --- /dev/null
> +++ b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.1.bb
> @@ -0,0 +1,40 @@
> +DESCRIPTION = "libjpeg-turbo is a derivative of libjpeg that uses SIMD
> instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression and
> decompression"
> +HOMEPAGE = "http://libjpeg-turbo.org/"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM =
> "file://cdjpeg.h;endline=12;md5=cad955d15145c3fdceec6855e078e953 \
> +
> file://jpeglib.h;endline=14;md5=dfc803dc51ae21178d1376ec73c4454d \
> +
> file://djpeg.c;endline=9;md5=e93a8f2061e8a0ac71c7a485c10489e2 \
> +"
> +
> +DEPENDS = "nasm-native"
> +
> +BASEPV = "${@d.getVar('PV',True).split('+')[1]}"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz"
> +SRC_URI[md5sum] = "b1f6b84859a16b8ebdcda951fa07c3f2"
> +SRC_URI[sha256sum] =
> "4bf5bad4ce85625bffbbd9912211e06790e00fb982b77724af7211034efafb08"
> +
> +S = "${WORKDIR}/${BPN}-${BASEPV}"
> +
> +# Drop-in replacement for jpeg
> +PROVIDES = "jpeg"
> +RPROVIDES_${PN} += "jpeg"
> +RREPLACES_${PN} += "jpeg"
> +RCONFLICTS_${PN} += "jpeg"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF = "--with-jpeg8 "
>

It's true that this is closest to what we currently provide but my
understanding of the libjpeg changes is this:
* Both versions 7 and 8 encoders can produce files that are incompatible
with decoders of previous versions
* The major additions in 7 and 8 we're never actually accepted at the
relevant standards body
* most importantly, my impression is that everyone else is using version 6b
(this is also jpeg-turbo upstream default)

I suggest we default to _not_  supporting jpeg8 or jpeg7.

Jussi

+
> +PACKAGES =+ "jpeg-tools libturbojpeg"
> +
> +DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs
> to access libjpeg functionality.  These tools allow for the compression,
> decompression, transformation and display of JPEG files and benchmarking of
> the libjpeg library."
> +FILES_jpeg-tools = "${bindir}/*"
> +
> +FILES_libturbojpeg = "${libdir}/libturbojpeg.so"
> +INSANE_SKIP_libturbojpeg = "dev-so"
> +
> +BBCLASSEXTEND = "native"
> +
> +LEAD_SONAME = "libjpeg.so.8"
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c2fd1033d27505258434aa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
7 November 2015 at 13:04, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">libjpeg-turbo has same API/A=
BI as libjpeg. It is relatively<br>
faster in JPEG compression/decompression than libjpeg.<br>
<br>
[YOCTO #8628]<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/jpeg/libjpeg-turbo_8d+<a href=3D"http://1.4.1.bb" r=
el=3D"noreferrer" target=3D"_blank">1.4.1.bb</a> | 40 +++++++++++++++++++++=
+++<br>
=C2=A01 file changed, 40 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-core/jpeg/libjpeg-turbo_8d+<a href=3D=
"http://1.4.1.bb" rel=3D"noreferrer" target=3D"_blank">1.4.1.bb</a><br>
<br>
diff --git a/meta/recipes-core/jpeg/libjpeg-turbo_8d+<a href=3D"http://1.4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">1.4.1.bb</a> b/meta/recipes-core=
/jpeg/libjpeg-turbo_8d+<a href=3D"http://1.4.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">1.4.1.bb</a><br>
new file mode 100644<br>
index 0000000..e79f800<br>
--- /dev/null<br>
+++ b/meta/recipes-core/jpeg/libjpeg-turbo_8d+<a href=3D"http://1.4.1.bb" r=
el=3D"noreferrer" target=3D"_blank">1.4.1.bb</a><br>
@@ -0,0 +1,40 @@<br>
+DESCRIPTION =3D &quot;libjpeg-turbo is a derivative of libjpeg that uses S=
IMD instructions (MMX, SSE2, NEON) to accelerate baseline JPEG compression =
and decompression&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://libjpeg-turbo.org/" rel=3D"noreferrer=
" target=3D"_blank">http://libjpeg-turbo.org/</a>&quot;<br>
+<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://cdjpeg.h;endline=3D12;md5=3Dcad955d15145=
c3fdceec6855e078e953 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://jpeglib.h;endline=3D14;md5=3Ddfc803dc51ae21178d1376ec73c4454d \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://djpeg.c;endline=3D9;md5=3De93a8f2061e8a0ac71c7a485c10489e2 \<br>
+&quot;<br>
+<br>
+DEPENDS =3D &quot;nasm-native&quot;<br>
+<br>
+BASEPV =3D &quot;${@d.getVar(&#39;PV&#39;,True).split(&#39;+&#39;)[1]}&quo=
t;<br>
+<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${BASEPV}.tar.gz&quo=
t;<br>
+SRC_URI[md5sum] =3D &quot;b1f6b84859a16b8ebdcda951fa07c3f2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4bf5bad4ce85625bffbbd9912211e06790e00fb982b77=
724af7211034efafb08&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/${BPN}-${BASEPV}&quot;<br>
+<br>
+# Drop-in replacement for jpeg<br>
+PROVIDES =3D &quot;jpeg&quot;<br>
+RPROVIDES_${PN} +=3D &quot;jpeg&quot;<br>
+RREPLACES_${PN} +=3D &quot;jpeg&quot;<br>
+RCONFLICTS_${PN} +=3D &quot;jpeg&quot;<br>
+<br>
+inherit autotools pkgconfig<br>
+<br>
+EXTRA_OECONF =3D &quot;--with-jpeg8 &quot;<br></blockquote><div><br></div>=
<div>It&#39;s true that this is closest to what we currently provide but my=
 understanding of the libjpeg changes is this:=C2=A0</div><div>* Both versi=
ons 7 and 8 encoders can produce files that are incompatible with decoders =
of previous versions<br></div><div>* The major additions in 7 and 8 we&#39;=
re never actually accepted at the relevant standards body</div><div>* most =
importantly, my impression is that everyone else is using version 6b (this =
is also jpeg-turbo upstream default)</div><div><br></div><div>I suggest we =
default to _not_ =C2=A0supporting jpeg8 or jpeg7.</div><div><br></div><div>=
Jussi</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+<br>
+PACKAGES =3D+ &quot;jpeg-tools libturbojpeg&quot;<br>
+<br>
+DESCRIPTION_jpeg-tools =3D &quot;The jpeg-tools package includes client pr=
ograms to access libjpeg functionality.=C2=A0 These tools allow for the com=
pression, decompression, transformation and display of JPEG files and bench=
marking of the libjpeg library.&quot;<br>
+FILES_jpeg-tools =3D &quot;${bindir}/*&quot;<br>
+<br>
+FILES_libturbojpeg =3D &quot;${libdir}/libturbojpeg.so&quot;<br>
+INSANE_SKIP_libturbojpeg =3D &quot;dev-so&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
+<br>
+LEAD_SONAME =3D &quot;libjpeg.so.8&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.4.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--001a11c2fd1033d27505258434aa--
