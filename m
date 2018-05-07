Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3D35F74D2B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2018 15:33:26 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p5-v6so29180560wre.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2018 08:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZOmYcg1kjUSz5S4oeM7pjT80xC96er0RdRL7GC2E4us=;
	b=f4wJj+zHluJpOYNo4HS//KvmAYgTSDiO1OlCqKDSrJ3xWLm8E4SCWkYdPik0cZ9PaU
	I37K/CGKAyNFhH6/6sY9sYhGSIoCKUrtUHL0qq02T06EeSGunjvcXgJMXy938OovjHKs
	oL47yk6Q1O5z3m5EyY9j1tRio4kSTFIeTOStIoiOjPqCBdsZnF9v6He9glhvZvDaCveE
	K3pkYMA01zuokjkY9MOTF5bsofyXEefEhuXjdPrwCpUeT3PizvX3ng9ucuiD2rf+geHE
	wO5n/2isecnhAvMrEZUyG+NmhJl8jdSWX4dgYpBH9Axm9AeKIVDpN+LnR7W2mCBldbjl
	YMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZOmYcg1kjUSz5S4oeM7pjT80xC96er0RdRL7GC2E4us=;
	b=iGePvFdiEwSUy+mHjVYRbf/OTWxbCBb9gvfob8Le1B1HEnUjcQ0S8YQUPERZXjMqBf
	M4NwmmiXpNkiTOzu0krM1JKTjbzgAj0ByUa7RzgqKIKMNBKTdsnuKShZ6igzBpv/Cl/U
	QJCZ50/UdlX1DLEkTKaZaTIBLJfdpyxH3faijnQx/fIQKTXjLYipSc7YDYBFnOtSoYP0
	pP+WNh+HocWvquv3EnVe3U98sQv3P7uZ+sBZEqxoE7aSIOhkDQnx5nsUC2tN50So2TpJ
	bxLTmpQiYnm7Ag72dVA9Kck4K02AmgCYDuO9vbdQiu0LR1QMgm8RJTbtmAmJx0U+41Ci
	7cxQ==
X-Gm-Message-State: ALQs6tBnA/2yGPrXyfxl8vdVtFTOHivRRadJR3J3CcCGCAGOyWiIABFH
	LpKCVbDwbMYKpkb+umAJyDAdLEVSzK8p8n5Uz04=
X-Google-Smtp-Source: AB8JxZr9kWk9BP5kaQbD7SiHPL2Pk+y936ULs+ZrsM/PJaSEM22DH2t5atmIEKIZg4ueNAC3s+kB2AV1KVg83h8iwVM=
X-Received: by 2002:adf:93e5:: with SMTP id
	92-v6mr25035391wrp.230.1525707206842; 
	Mon, 07 May 2018 08:33:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.133.207 with HTTP; Mon, 7 May 2018 08:33:26 -0700 (PDT)
In-Reply-To: <20180507152701.12046-1-twoerner@gmail.com>
References: <20180507152701.12046-1-twoerner@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 7 May 2018 17:33:26 +0200
Message-ID: <CA+chaQfbViBTpaV3rOXd1Q9NBnViSLAjb-obywEi7y1rpJAz5w@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] babeltrace: switch source URI
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
X-List-Received-Date: Mon, 07 May 2018 15:33:26 -0000
Content-Type: multipart/alternative; boundary="000000000000185dcf056b9f6441"

--000000000000185dcf056b9f6441
Content-Type: text/plain; charset="UTF-8"

There is already a fix for this, see:
http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150423.html

Using github archives is even worse as they are regenerated from time to
time. Also when you really want to use v${PV}.tar.gz archive, then
use downloadfilename parameter to fetch it with some more meaningful
filename and to prevent possible conflicts with other badly named tarballs.

On Mon, May 7, 2018 at 5:27 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> It looks like http://www.efficios.com/files/babeltrace is down, therefore
> switch to https://github.com/efficios/babeltrace/archive.
>
> The md5sum/sha256sum updates are (I'm guessing) a result of switching from
> .tar.bz2 to .tar.gz.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-kernel/lttng/babeltrace_1.5.5.bb | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> index 92d86b92e8..2098264c67 100644
> --- a/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace_1.5.5.bb
> @@ -10,10 +10,9 @@ DEPENDS = "glib-2.0 util-linux popt bison-native
> flex-native"
>
>  inherit autotools pkgconfig
>
> -SRC_URI = "http://www.efficios.com/files/babeltrace/babeltrace-${
> PV}.tar.bz2 \
> -"
> +SRC_URI = "https://github.com/efficios/babeltrace/archive/v${PV}.tar.gz"
>
>  EXTRA_OECONF = "--disable-debug-info"
>
> -SRC_URI[md5sum] = "7decafd46093e4e47c14e7307d498986"
> -SRC_URI[sha256sum] = "409146789b4a6b81f6a275fcad932a
> 030743d444f6de5bd4a34aaf17aa72e8ac"
> +SRC_URI[md5sum] = "aa70da8947b2104b976302d8f65ddee5"
> +SRC_URI[sha256sum] = "ce11a5725e7f4838b4a1cc20966eca
> 77bf77a80c43a072062708d7eac7ebf272"
> --
> 2.17.0.rc2.3.gc2a499e6c
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000185dcf056b9f6441
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is already a fix for this, see:<div><a href=3D"http:=
//lists.openembedded.org/pipermail/openembedded-core/2018-May/150423.html">=
http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150423.h=
tml</a><br></div><div><br></div><div>Using github archives is even worse as=
 they are regenerated from time to time. Also when you really want to use v=
${PV}.tar.gz archive, then use=C2=A0downloadfilename parameter to fetch it =
with some more meaningful filename and to prevent possible conflicts with o=
ther badly named tarballs.</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Mon, May 7, 2018 at 5:27 PM, Trevor Woerner <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoe=
rner@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">It l=
ooks like <a href=3D"http://www.efficios.com/files/babeltrace" rel=3D"noref=
errer" target=3D"_blank">http://www.efficios.com/files/<wbr>babeltrace</a> =
is down, therefore<br>
switch to <a href=3D"https://github.com/efficios/babeltrace/archive" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/efficios/<wbr>babeltrace/=
archive</a>.<br>
<br>
The md5sum/sha256sum updates are (I&#39;m guessing) a result of switching f=
rom<br>
.tar.bz2 to .tar.gz.<br>
<br>
Signed-off-by: Trevor Woerner &lt;<a href=3D"mailto:twoerner@gmail.com">two=
erner@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.5.bb" rel=
=3D"noreferrer" target=3D"_blank">babe<wbr>ltrace_1.5.5.bb</a> | 7 +++----<=
br>
=C2=A01 file changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.5.b=
b" rel=3D"noreferrer" target=3D"_blank">ba<wbr>beltrace_1.5.5.bb</a> b/meta=
/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.5.bb" rel=3D"norefer=
rer" target=3D"_blank">ba<wbr>beltrace_1.5.5.bb</a><br>
index 92d86b92e8..2098264c67 100644<br>
--- a/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.5.bb" rel=
=3D"noreferrer" target=3D"_blank">ba<wbr>beltrace_1.5.5.bb</a><br>
+++ b/meta/recipes-kernel/lttng/<a href=3D"http://babeltrace_1.5.5.bb" rel=
=3D"noreferrer" target=3D"_blank">ba<wbr>beltrace_1.5.5.bb</a><br>
@@ -10,10 +10,9 @@ DEPENDS =3D &quot;glib-2.0 util-linux popt bison-native =
flex-native&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://www.efficios.com/files/babeltrace/babe=
ltrace-${PV}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://www.effic=
ios.com/<wbr>files/babeltrace/babeltrace-${<wbr>PV}.tar.bz2</a> \<br>
-&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://github.com/efficios/babeltrace/archiv=
e/v${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://github.com/ef=
ficios/<wbr>babeltrace/archive/v${PV}.tar.<wbr>gz</a>&quot;<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-debug-info&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>7decafd46093e4e47c14e7307d4989<wbr>86&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>409146789b4a6b81f6a275fcad932a<wbr>03074=
3d444f6de5bd4a34aaf17aa72<wbr>e8ac&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>aa70da8947b2104b976302d8f65dde<wbr>e5&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>ce11a5725e7f4838b4a1cc20966eca<wbr>77bf7=
7a80c43a072062708d7eac7eb<wbr>f272&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.17.0.rc2.3.gc2a499e6c<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--000000000000185dcf056b9f6441--
