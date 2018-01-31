Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB5A78766
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 11:58:00 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id m11so14938246iob.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 03:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ku5ip7rmBtsJSgXvpT9XDWaXtZJaiobiuDgaftI8f1w=;
	b=oDah7DudUlZBwgfHtqW0wxayHMwTQ6CZFGGdVudNyGS94muN/6/ejjXo2l7atiAC/d
	9L3WZgOFMMtfgTPn+9OPkEUHH5CNCe38pjGWiWrHmD5pYQsgrsL/XnEWG2OFfQcySweo
	rNcgvBeHgsvHgBlgnV7x+JN6cA9RGufOM7LnFuI5QywwQ+ZwPBdCRDGYOtTbwTuwBbYZ
	GuBrktR5EScGC7ZvpiTG34LBkxpTjJV/6RDGZ1cYAHz8mRQYHjica2cl+RNSDWBAASY1
	D+Lz3Fic2Bkd19lcwtti++0SHtIKCwPZ2fa7LfVCPJYt6hr1gy9q60AQRc9OBrTQfZv9
	f79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ku5ip7rmBtsJSgXvpT9XDWaXtZJaiobiuDgaftI8f1w=;
	b=JgOTQ6LGjwd2C3cA5Hz3EWcvfBjIN1ds/tstxYEm8DnT4jV+RYyPU89QSf1S06lst+
	zE75dMeiXPkI96HEAd76XLCkCa7sj6bfZxF2RX6Z8g83l3xOKEtOsnTySNG6nbzucZp/
	FpAuDDOhr+C57OgvB21Pl+5ISBraeG4/l9V32Vh8pRpnRq+eAvwARCBFfNQTswoYMraS
	XDi9YCfbSoDQXrMk3mCdi5ucz6ZVFNVmilCYjrJBj+DQPLVR8jQT0hdRtdDUPk71QchK
	5Svm1s6A11JWX420DCK6g4cqveDM7JFeKu2VevYAif4sHpWmZVOIgTpo9KZtxZZc6AzK
	SC/A==
X-Gm-Message-State: AKwxyte6G/4iengbcTeZsMYSP+IdveE1XmQZo8GaM/7vDaWrAKE8+OEe
	VlJFY/i+X8uO2/NEr8IEuX2xfOQRVpiVTucK9DZsGQ==
X-Google-Smtp-Source: AH8x226LiTvBZ2HpjW1Re2RdYVy5ix2QB6sUNtENYBq8jD1LPHfcA/+ddnoc0CpO6vUaY6wkP9M2P/iN5GSC5fpfRbE=
X-Received: by 10.107.186.86 with SMTP id k83mr33489318iof.208.1517399880963; 
	Wed, 31 Jan 2018 03:58:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 31 Jan 2018 03:57:40 -0800 (PST)
In-Reply-To: <4ccf00a5-1a5f-bc37-bef8-b914823a7eab@xilinx.com>
References: <1516648119-12528-1-git-send-email-alejandr@xilinx.com>
	<4ccf00a5-1a5f-bc37-bef8-b914823a7eab@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jan 2018 11:57:40 +0000
Message-ID: <CAJTo0LZkAMSnifEzdyr2LF9J4D2XCHfTDCiP=CyPYS6O20xfGw@mail.gmail.com>
To: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ninja: Upgrade from 1.7.2 to major release 1.8.2
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
X-List-Received-Date: Wed, 31 Jan 2018 11:58:00 -0000
Content-Type: multipart/alternative; boundary="94eb2c076a70e3314c056411302d"

--94eb2c076a70e3314c056411302d
Content-Type: text/plain; charset="UTF-8"

Patch doesn't apply, can you rebase and resend please.

Ross

On 30 January 2018 at 21:09, Alejandro Enedino Hernandez Samaniego <
alejandro.enedino.hernandez-samaniego@xilinx.com> wrote:

> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
>
> ---
>  meta/recipes-devtools/ninja/ninja_1.7.2.bb | 30
> ------------------------------
>  meta/recipes-devtools/ninja/ninja_1.8.2.bb | 30
> ++++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 30 deletions(-)
>  delete mode 100644 meta/recipes-devtools/ninja/ninja_1.7.2.bb
>  create mode 100644 meta/recipes-devtools/ninja/ninja_1.8.2.bb
>
> diff --git a/meta/recipes-devtools/ninja/ninja_1.7.2.bb
> b/meta/recipes-devtools/ninja/ninja_1.7.2.bb
> deleted file mode 100644
> index 4d3b272..0000000
> --- a/meta/recipes-devtools/ninja/ninja_1.7.2.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY = "Ninja is a small build system with a focus on speed."
> -HOMEPAGE = "http://martine.github.com/ninja/"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
> -
> -DEPENDS = "re2c-native ninja-native"
> -
> -SRCREV = "717b7b4a31db6027207588c0fb89c3ead384747b"
> -
> -SRC_URI = "git://github.com/martine/ninja.git;branch=release"
> -UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
> -
> -S = "${WORKDIR}/git"
> -
> -do_configure[noexec] = "1"
> -
> -do_compile_class-native() {
> -       ./configure.py --bootstrap
> -}
> -
> -do_compile() {
> -       ./configure.py
> -       ninja
> -}
> -
> -do_install() {
> -       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/ninja/ninja_1.8.2.bb
> b/meta/recipes-devtools/ninja/ninja_1.8.2.bb
> new file mode 100644
> index 0000000..c6fcfef
> --- /dev/null
> +++ b/meta/recipes-devtools/ninja/ninja_1.8.2.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "Ninja is a small build system with a focus on speed."
> +HOMEPAGE = "http://martine.github.com/ninja/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
> +
> +DEPENDS = "re2c-native ninja-native"
> +
> +SRCREV = "253e94c1fa511704baeb61cf69995bbf09ba435e"
> +
> +SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
> +UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure[noexec] = "1"
> +
> +do_compile_class-native() {
> +       ./configure.py --bootstrap
> +}
> +
> +do_compile() {
> +       ./configure.py
> +       ninja
> +}
> +
> +do_install() {
> +       install -D -m 0755  ${S}/ninja ${D}${bindir}/ninja
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
> This email and any attachments are intended for the sole use of the named
> recipient(s) and contain(s) confidential information that may be
> proprietary, privileged or copyrighted under applicable law. If you are not
> the intended recipient, do not read, copy, or forward this email message or
> any attachments. Delete this email message and any attachments immediately.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c076a70e3314c056411302d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Patch doesn&#39;t apply, can you rebase and resend please.=
<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On 30 January 2018 at 21:09, Alejandro Enedino Hernandez=
 Samaniego <span dir=3D"ltr">&lt;<a href=3D"mailto:alejandro.enedino.hernan=
dez-samaniego@xilinx.com" target=3D"_blank">alejandro.enedino.hernandez-sam=
aniego@xilinx.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">S=
igned-off-by: Alejandro Enedino Hernandez Samaniego &lt;<a href=3D"mailto:a=
lejandr@xilinx.com" target=3D"_blank">alejandr@xilinx.com</a>&gt;<br>
<br>
---<br>
=C2=A0meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.7.2.bb" rel=3D"=
noreferrer" target=3D"_blank">n<wbr>inja_1.7.2.bb</a> | 30 ----------------=
--------------<br>
=C2=A0meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.8.2.bb" rel=3D"=
noreferrer" target=3D"_blank">n<wbr>inja_1.8.2.bb</a> | 30 ++++++++++++++++=
++++++++++++++<br>
=C2=A02 files changed, 30 insertions(+), 30 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/ninja/<a href=3D"http://ninj=
a_1.7.2.bb" rel=3D"noreferrer" target=3D"_blank">ni<wbr>nja_1.7.2.bb</a><br=
>
=C2=A0create mode 100644 meta/recipes-devtools/ninja/<a href=3D"http://ninj=
a_1.8.2.bb" rel=3D"noreferrer" target=3D"_blank">ni<wbr>nja_1.8.2.bb</a><br=
>
<br>
diff --git a/meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.7.2.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>ninja_1.7.2.bb</a> b/meta/recipes=
-devtools/ninja/<a href=3D"http://ninja_1.7.2.bb" rel=3D"noreferrer" target=
=3D"_blank"><wbr>ninja_1.7.2.bb</a><br>
deleted file mode 100644<br>
index 4d3b272..0000000<br>
--- a/meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.7.2.bb" rel=3D"=
noreferrer" target=3D"_blank"><wbr>ninja_1.7.2.bb</a><br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-SUMMARY =3D &quot;Ninja is a small build system with a focus on speed.&quo=
t;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://martine.github.com/ninja/" rel=3D"nor=
eferrer" target=3D"_blank">http://martine.github.com/nin<wbr>ja/</a>&quot;<=
br>
-LICENSE =3D &quot;Apache-2.0&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da81586a64a<wbr>d4e476c791c=
da7e2f2c52e&quot;<br>
-<br>
-DEPENDS =3D &quot;re2c-native ninja-native&quot;<br>
-<br>
-SRCREV =3D &quot;717b7b4a31db6027207588c0fb89c<wbr>3ead384747b&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/martine/ninja.git;bra=
nch=3Drelease" rel=3D"noreferrer" target=3D"_blank">github.com/martine/ninj=
<wbr>a.git;branch=3Drelease</a>&quot;<br>
-UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;.*)&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-do_configure[noexec] =3D &quot;1&quot;<br>
-<br>
-do_compile_class-native() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./configure.py --bootstrap<br>
-}<br>
-<br>
-do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./configure.py<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ninja<br>
-}<br>
-<br>
-do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 0755=C2=A0 ${S}/ninja ${D}${bindi=
r}/ninja<br>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.8.2.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>ninja_1.8.2.bb</a> b/meta/recipes=
-devtools/ninja/<a href=3D"http://ninja_1.8.2.bb" rel=3D"noreferrer" target=
=3D"_blank"><wbr>ninja_1.8.2.bb</a><br>
new file mode 100644<br>
index 0000000..c6fcfef<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.8.2.bb" rel=3D"=
noreferrer" target=3D"_blank"><wbr>ninja_1.8.2.bb</a><br>
@@ -0,0 +1,30 @@<br>
+SUMMARY =3D &quot;Ninja is a small build system with a focus on speed.&quo=
t;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://martine.github.com/ninja/" rel=3D"nor=
eferrer" target=3D"_blank">http://martine.github.com/nin<wbr>ja/</a>&quot;<=
br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da81586a64a<wbr>d4e476c791c=
da7e2f2c52e&quot;<br>
+<br>
+DEPENDS =3D &quot;re2c-native ninja-native&quot;<br>
+<br>
+SRCREV =3D &quot;253e94c1fa511704baeb61cf69995<wbr>bbf09ba435e&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/ninja-build/ninja.git=
;branch=3Drelease" rel=3D"noreferrer" target=3D"_blank">github.com/ninja-bu=
ild/<wbr>ninja.git;branch=3Drelease</a>&quot;<br>
+UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;.*)&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
+<br>
+do_compile_class-native() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./configure.py --bootstrap<br>
+}<br>
+<br>
+do_compile() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0./configure.py<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ninja<br>
+}<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 0755=C2=A0 ${S}/ninja ${D}${bindi=
r}/ninja<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
--<br>
2.7.4<br>
<br>
This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.<span cla=
ss=3D"HOEnZb"><font color=3D"#888888"><br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c076a70e3314c056411302d--
