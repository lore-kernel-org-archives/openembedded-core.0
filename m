Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4952A6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 21:32:45 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so49106165wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 13:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6ZCP0frzOJpuhHJxY3+OUIY+XWyETXUsw0hyuHbOQTA=;
	b=E1pT/pyiPeGGd+yqQJ+NtmbmeiQzqjfdPuFyp9JqOwRgp6OHjSghUzaVW7FyRCanHC
	3ZRv3QhOoNcBFHFmOQI4kqInsTLKmxfHF1FbO9IiawI1yr7hr3j+GT/XcTQk9ykz+I6b
	QoizV0MT/hOS/Fhx9uwqlk2XdvIGYRd8eVWhJQtJZGe2u6KqqL0z04UoVcBzI2nzS2SL
	CxEffwoyYbJlxYi4Eqc5ROB+rrTcIWLIi2IBps7atHgmbyfCQTMNpAxSUJ/Cf0oCumlC
	S9tOgMDJqe5BmcgKCdRTtCOZrdA582EDiSPxVR+92kYYQUcRXKyMBmUB5r1tea6U1OfV
	2VqA==
MIME-Version: 1.0
X-Received: by 10.194.116.170 with SMTP id jx10mr21829790wjb.166.1449869566439;
	Fri, 11 Dec 2015 13:32:46 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Fri, 11 Dec 2015 13:32:46 -0800 (PST)
In-Reply-To: <1449869359-2915-1-git-send-email-alejandro.delcastillo@ni.com>
References: <CAJ86T=WinR1iEU-7QwQ1j75174dM8S+oY6H3WZgudXUyoOaX7A@mail.gmail.com>
	<1449869359-2915-1-git-send-email-alejandro.delcastillo@ni.com>
Date: Fri, 11 Dec 2015 22:32:46 +0100
Message-ID: <CA+chaQfoFMrgSjwW6Pj0Pfzu=UdeuB+hh-d0qimmeMqt2B5y8A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] libsolv: add new recipe
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
X-List-Received-Date: Fri, 11 Dec 2015 21:32:46 -0000
Content-Type: multipart/alternative; boundary=001a1130cd247a791b0526a61061

--001a1130cd247a791b0526a61061
Content-Type: text/plain; charset=UTF-8

branch=master is the default, you can drop it

As you set the PV inside it would be nicer to rename it to _git.bb so it's
clear that it's from git.

On Fri, Dec 11, 2015 at 10:29 PM, Alejandro del Castillo <
alejandro.delcastillo@ni.com> wrote:

> Required by the optional opkg 0.3.1 libsolv backend.
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> ---
>  meta/recipes-extended/libsolv/libsolv_0.6.14.bb | 28
> +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta/recipes-extended/libsolv/libsolv_0.6.14.bb
>
> diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.14.bb
> b/meta/recipes-extended/libsolv/libsolv_0.6.14.bb
> new file mode 100644
> index 0000000..11d6c70
> --- /dev/null
> +++ b/meta/recipes-extended/libsolv/libsolv_0.6.14.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Library for solving packages and reading repositories"
> +HOMEPAGE = "https://github.com/openSUSE/libsolv"
> +BUGTRACKER = "https://github.com/openSUSE/libsolv/issues"
> +SECTION = "devel"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM =
> "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
> +
> +DEPENDS = "expat zlib"
> +
> +PV = "0.6.14+git${SRCPV}"
> +
> +SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master"
> +SRCREV = "b1ea39233f86cd62fbab1964d7497244f6be0087"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE = "-DLIB=${baselib}"
> +
> +PACKAGES =+ "${PN}-tools ${PN}ext ${PN}ext-dbg"
> +
> +FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibSolv.cmake"
> +FILES_${PN}-tools = "${bindir}/*"
> +FILES_${PN}ext = "${libdir}/${PN}ext.so.*"
> +FILES_${PN}ext-dbg = "${libdir}/.debug/${PN}ext.so.*"
> +
> +BBCLASSEXTEND =+ "native nativesdk"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1130cd247a791b0526a61061
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">branch=3Dmaster is the default, you can drop it<div><br></=
div><div>As you set the PV inside it would be nicer to rename it to _<a hre=
f=3D"http://git.bb">git.bb</a> so it&#39;s clear that it&#39;s from git.</d=
iv></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, =
Dec 11, 2015 at 10:29 PM, Alejandro del Castillo <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">alejandro.del=
castillo@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">Required by the optional opkg 0.3.1 libsolv backend.<br>
<br>
Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delca=
stillo@ni.com">alejandro.delcastillo@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/libsolv/<a href=3D"http://libsolv_0.6.14.bb" re=
l=3D"noreferrer" target=3D"_blank">libsolv_0.6.14.bb</a> | 28 +++++++++++++=
++++++++++++<br>
=C2=A01 file changed, 28 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/libsolv/<a href=3D"http://li=
bsolv_0.6.14.bb" rel=3D"noreferrer" target=3D"_blank">libsolv_0.6.14.bb</a>=
<br>
<br>
diff --git a/meta/recipes-extended/libsolv/<a href=3D"http://libsolv_0.6.14=
.bb" rel=3D"noreferrer" target=3D"_blank">libsolv_0.6.14.bb</a> b/meta/reci=
pes-extended/libsolv/<a href=3D"http://libsolv_0.6.14.bb" rel=3D"noreferrer=
" target=3D"_blank">libsolv_0.6.14.bb</a><br>
new file mode 100644<br>
</span>index 0000000..11d6c70<br>
<span class=3D"">--- /dev/null<br>
+++ b/meta/recipes-extended/libsolv/<a href=3D"http://libsolv_0.6.14.bb" re=
l=3D"noreferrer" target=3D"_blank">libsolv_0.6.14.bb</a><br>
@@ -0,0 +1,28 @@<br>
+SUMMARY =3D &quot;Library for solving packages and reading repositories&qu=
ot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/openSUSE/libsolv" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/openSUSE/libsolv</a>&quot;=
<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/openSUSE/libsolv/issues=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openSUSE/libsolv/=
issues</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.BSD;md5=3D62272bd11c97396d4aaf1c=
41bc11f7d8&quot;<br>
+<br>
</span><span class=3D"">+DEPENDS =3D &quot;expat zlib&quot;<br>
+<br>
</span>+PV =3D &quot;0.6.14+git${SRCPV}&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/openSUSE/libsolv.git;=
branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">github.com/openSUSE/l=
ibsolv.git;branch=3Dmaster</a>&quot;<br>
+SRCREV =3D &quot;b1ea39233f86cd62fbab1964d7497244f6be0087&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
<span class=3D"im HOEnZb">+inherit cmake<br>
+<br>
+EXTRA_OECMAKE =3D &quot;-DLIB=3D${baselib}&quot;<br>
+<br>
</span><div class=3D"HOEnZb"><div class=3D"h5">+PACKAGES =3D+ &quot;${PN}-t=
ools ${PN}ext ${PN}ext-dbg&quot;<br>
+<br>
+FILES_${PN}-dev +=3D &quot;${datadir}/cmake/Modules/FindLibSolv.cmake&quot=
;<br>
+FILES_${PN}-tools =3D &quot;${bindir}/*&quot;<br>
+FILES_${PN}ext =3D &quot;${libdir}/${PN}ext.so.*&quot;<br>
+FILES_${PN}ext-dbg =3D &quot;${libdir}/.debug/${PN}ext.so.*&quot;<br>
+<br>
+BBCLASSEXTEND =3D+ &quot;native nativesdk&quot;<br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a1130cd247a791b0526a61061--
