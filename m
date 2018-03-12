Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4711B788C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 11:44:31 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id k79-v6so11040515ita.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 04:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CF4Jr1UxDimHxUduJ3LESKKdY7GM5428tUXEMQnltwE=;
	b=VIF2ymk8E7vq/kWKC7VTEjI5J4auKSYOAkCRvLeGohzSAFqnoTtFJDKH5eNW9zHjo3
	7jISC8h095SPM01/aZzPrmDBCSSZGKPDQ3C2js0d7D1Ji70CRKcB70nVf8sIAYlgmo5U
	lFGJvyQfGV2kS8A/p0zxZtgMm38jQgRR03sXr/lvEgpKgdKHYQ6PQtWCyzJviAOcHnRy
	IItUtXfLYFNqBroiIdwsCw7wWSKWjM/BRo4Z70olTrqSOgHD1HjWR2Q1loMq10vBnPKo
	gVA49pLMzPOvBTEkrqk6pdJmC/ZAa5z33DXBKNk/KZ+RELLsk+QMGyJ3LmEyy7ei4T1Q
	Sy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CF4Jr1UxDimHxUduJ3LESKKdY7GM5428tUXEMQnltwE=;
	b=BqhZj+VuU5aMkiHvnDJh/ULweZq3XYtl3qAiPLojowrVO/0/h4Zwzih6QhHFBf5CCq
	MxMnIbCMoK58hglOEYpBziOY1nHiZ18aVkVVQDRegy8j5Dow7c/X4dKWcsNiEAnv4U9R
	qETuDWh9iwbkJ3svQhuoQ+vlmaFM98r0R2KjkuKjf2wITH9dBo5b011zdGirxMWriUTd
	GriA/5Db3Vtp6Qi2/UVoNb/COmhfAo71jqcK+zTks0xSl37NMk7sLU3TJgbjBDiDZzes
	uOQ9LfEmEeoj1p7SyDN8BQtMX1qi2r2A4B5xn1CHOwtLYU7FCHYAerspKPRjora8duag
	QzrQ==
X-Gm-Message-State: AElRT7F3yrk4SjSSEhlQ3YLT/eo6MD2JkgBcsqSJcryOn06PB5DML2dC
	DBWjSR/+BbtYVpajHjcw0s3z6pnlYsInL1MhAAIcXg==
X-Google-Smtp-Source: AG47ELvz7Dx0Msbyib39Zc6QCdvjFU4v10bFoVv2XWcWdP7PKDhdH1ZW6e7d6grQjc4gibnsszX4XHKd5/zWy5cb1eI=
X-Received: by 10.36.66.195 with SMTP id i186mr8687161itb.45.1520855073405;
	Mon, 12 Mar 2018 04:44:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 12 Mar 2018 04:44:13 -0700 (PDT)
In-Reply-To: <20180312112901.9844-2-matt@madison.systems>
References: <20180312112901.9844-1-matt@madison.systems>
	<20180312112901.9844-2-matt@madison.systems>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Mar 2018 11:44:13 +0000
Message-ID: <CAJTo0La3UXoWCnw=H9k7OjQF3PFH2_VMGJB-auf1kuygw-i5mw@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH 1/1] go: Upgrade 1.9 to 1.9.4 stable release
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
X-List-Received-Date: Mon, 12 Mar 2018 11:44:32 -0000
Content-Type: multipart/alternative; boundary="001a113b880467d7d9056735aab9"

--001a113b880467d7d9056735aab9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note that stable branch policy is to cherry-pick security fixes unless
they're too complicated/risky to pick (openssl is the notable example here)=
.

Ross

On 12 March 2018 at 11:29, Matt Madison <matt@madison.systems> wrote:

> From: Otavio Salvador <otavio@ossystems.com.br>
>
> The 1.9.4 fixes a number of issues in the Go compiler and is important
> to get in before we start working on 1.10 inclusion.
>
>  - go1.9.1 (released 2017/10/04) includes two security fixes.
>
>  - go1.9.2 (released 2017/10/25) includes fixes to the compiler,
>    linker, runtime, documentation, go command, and the crypto/x509,
>    database/sql, log, and net/smtp packages. It includes a fix to a
>    bug introduced in Go 1.9.1 that broke go get of non-Git
>    repositories under certain conditions.
>
>  - go1.9.3 (released 2018/01/22) includes fixes to the compiler,
>    runtime, and the database/sql, math/big, net/http, and net/url
>    packages.
>
>  - go1.9.4 (released 2018/02/07) includes a security fix to =E2=80=9Cgo g=
et=E2=80=9D.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/recipes-devtools/go/go-1.9.inc | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go-1.9.inc
> b/meta/recipes-devtools/go/go-1.9.inc
> index 7f12241dc1..2823304b7c 100644
> --- a/meta/recipes-devtools/go/go-1.9.inc
> +++ b/meta/recipes-devtools/go/go-1.9.inc
> @@ -1,6 +1,9 @@
>  require go-common.inc
>
>  GO_BASEVERSION =3D "1.9"
> +GO_MINOR =3D ".4"
> +PV .=3D "${GO_MINOR}"
> +
>  FILESEXTRAPATHS_prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74=
707"
> @@ -19,5 +22,5 @@ SRC_URI +=3D "\
>  "
>  SRC_URI_append_libc-musl =3D " file://set-external-linker.patch"
>
> -SRC_URI[main.md5sum] =3D "da2d44ea384076efec43ee1f8b7d45d2"
> -SRC_URI[main.sha256sum] =3D "a4ab229028ed167ba1986825751463
> 605264e44868362ca8e7accc8be057e993"
> +SRC_URI[main.md5sum] =3D "6816441fd6680c63865cdd5cb8bc1960"
> +SRC_URI[main.sha256sum] =3D "0573a8df33168977185aa44173305e
> 5a0450f55213600e94541604b75d46dc06"
> --
> 2.14.1
>
>

--001a113b880467d7d9056735aab9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Note that stable branch policy is to cherry-pick security =
fixes unless they&#39;re too complicated/risky to pick (openssl is the nota=
ble example here).<div><br></div><div>Ross</div></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On 12 March 2018 at 11:29, Matt Madiso=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:matt@madison.systems" target=3D"_=
blank">matt@madison.systems</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">From: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
<br>
The 1.9.4 fixes a number of issues in the Go compiler and is important<br>
to get in before we start working on 1.10 inclusion.<br>
<br>
=C2=A0- go1.9.1 (released 2017/10/04) includes two security fixes.<br>
<br>
=C2=A0- go1.9.2 (released 2017/10/25) includes fixes to the compiler,<br>
=C2=A0 =C2=A0linker, runtime, documentation, go command, and the crypto/x50=
9,<br>
=C2=A0 =C2=A0database/sql, log, and net/smtp packages. It includes a fix to=
 a<br>
=C2=A0 =C2=A0bug introduced in Go 1.9.1 that broke go get of non-Git<br>
=C2=A0 =C2=A0repositories under certain conditions.<br>
<br>
=C2=A0- go1.9.3 (released 2018/01/22) includes fixes to the compiler,<br>
=C2=A0 =C2=A0runtime, and the database/sql, math/big, net/http, and net/url=
<br>
=C2=A0 =C2=A0packages.<br>
<br>
=C2=A0- go1.9.4 (released 2018/02/07) includes a security fix to =E2=80=9Cg=
o get=E2=80=9D.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>9.inc | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/go/go-<wbr>1.9.inc b/meta/recipes-devtoo=
ls/go/go-<wbr>1.9.inc<br>
index 7f12241dc1..2823304b7c 100644<br>
--- a/meta/recipes-devtools/go/go-<wbr>1.9.inc<br>
+++ b/meta/recipes-devtools/go/go-<wbr>1.9.inc<br>
@@ -1,6 +1,9 @@<br>
=C2=A0require go-common.inc<br>
<br>
=C2=A0GO_BASEVERSION =3D &quot;1.9&quot;<br>
+GO_MINOR =3D &quot;.4&quot;<br>
+PV .=3D &quot;${GO_MINOR}&quot;<br>
+<br>
=C2=A0FILESEXTRAPATHS_prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_<wbr>BASEV=
ERSION}:&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>5d4950ecb7b26d2c=
5e4e7b4e0dd747<wbr>07&quot;<br>
@@ -19,5 +22,5 @@ SRC_URI +=3D &quot;\<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI_append_libc-musl =3D &quot; file://set-external-linker.<wbr>p=
atch&quot;<br>
<br>
-SRC_URI[main.md5sum] =3D &quot;<wbr>da2d44ea384076efec43ee1f8b7d45<wbr>d2&=
quot;<br>
-SRC_URI[main.sha256sum] =3D &quot;<wbr>a4ab229028ed167ba1986825751463<wbr>=
605264e44868362ca8e7accc8be057<wbr>e993&quot;<br>
+SRC_URI[main.md5sum] =3D &quot;<wbr>6816441fd6680c63865cdd5cb8bc19<wbr>60&=
quot;<br>
+SRC_URI[main.sha256sum] =3D &quot;<wbr>0573a8df33168977185aa44173305e<wbr>=
5a0450f55213600e94541604b75d46<wbr>dc06&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a113b880467d7d9056735aab9--
