Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 172CD6E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 19:41:19 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id kb1so116370813igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 12:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xSLnRMdJ3/Kj5QfH+W9Tpy0D8gIQLaidfe3uejJkkmA=;
	b=owAgS0ypdFP1wnNA1NbPP7Dv/L9R81siXqCiGuQwq0yIpMoKWVi7LpyAnhfTpfzOxF
	xE4dJ0eImv2y14z+qS3CJHR4+qjrRfutRi6KzfnId1jMYG9xeRPFKQmDOGdHZ3mBmaVA
	F62Xf909+Nss0RAj+/fMUFRDDsuhD2EBU14FNIIzAU3dqJX6NL5HUcAREU4/KxJaqRRq
	LSH2+Wvm5NLm+8l4orsQDhkqxrV9Lep3y+IJHKs4mjLRROzwYqB8vMR3fysbcQdkCz0T
	e65vuS2F5WlycV9TO4YRycxiCFcABNZU9ZerIb5T+ESOGjTCMpWJFPaeG52+ZmJ9Rtpp
	x/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xSLnRMdJ3/Kj5QfH+W9Tpy0D8gIQLaidfe3uejJkkmA=;
	b=JlYqBeQ/2xNnlXoCfmxgEyGT4+ezTCkZ29TBrH2VA21CPN6ddJXDV9zil6Mf0phNY2
	lQ1B6qkiq7LTtvuhB5O74a/d6I6o27RaXi7RcrqrTj4aVzrS2tp3sA5lHKPsZK2rGOqI
	QNu0yCH6ZuOfP2ryynCohCUMpH3aPFDbD0WY3DdbkmM3J/QZk9l6mkG4K9w9gb+lAVJV
	fBeWGfl8Bj72KslLvCHE0Xw+XqeFUKFHeh4ZXYW0BFxD6rdUSSkcC6etFT4qPF+YMtJ/
	xKKevHFPMxTSD2sssDKzK4EDSmKTW/bmzCFcsQzcrz09V28Wx4GRGKYZO8tD7d+gu5A3
	OJ3g==
X-Gm-Message-State: AOPr4FWTKjPJlZEM9jfwP8LVZG6BG/xeW6J7/NiHecQU5lZ9yxHORQMV85qBOhJP0Wap8OItbVwksYSF5NGRd1+Q
X-Received: by 10.50.160.39 with SMTP id xh7mr525334igb.64.1460490080202; Tue,
	12 Apr 2016 12:41:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Tue, 12 Apr 2016 12:41:00 -0700 (PDT)
In-Reply-To: <1460485532-13735-3-git-send-email-danismostlikely@gmail.com>
References: <1460485532-13735-1-git-send-email-danismostlikely@gmail.com>
	<1460485532-13735-3-git-send-email-danismostlikely@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Apr 2016 20:41:00 +0100
Message-ID: <CAJTo0La7Avjd3-LCBmE_cdqx1Nf47URDnj_iOrd9-7hM6wJWuA@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] git: update to 2.8.1
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
X-List-Received-Date: Tue, 12 Apr 2016 19:41:21 -0000
Content-Type: multipart/alternative; boundary=001a1135ee9a6dcbad05304ed86a

--001a1135ee9a6dcbad05304ed86a
Content-Type: text/plain; charset=UTF-8

Far too late for master/krogoth, this can be merged after they've branched.

Ross

On 12 April 2016 at 19:25, Dan McGregor <danismostlikely@gmail.com> wrote:

> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/recipes-devtools/git/git_2.7.2.bb | 11 -----------
>  meta/recipes-devtools/git/git_2.8.1.bb | 11 +++++++++++
>  2 files changed, 11 insertions(+), 11 deletions(-)
>  delete mode 100644 meta/recipes-devtools/git/git_2.7.2.bb
>  create mode 100644 meta/recipes-devtools/git/git_2.8.1.bb
>
> diff --git a/meta/recipes-devtools/git/git_2.7.2.bb
> b/meta/recipes-devtools/git/git_2.7.2.bb
> deleted file mode 100644
> index 3fd7151..0000000
> --- a/meta/recipes-devtools/git/git_2.7.2.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require git.inc
> -
> -EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> -
>  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> -                 "
> -EXTRA_OEMAKE += "NO_GETTEXT=1"
> -
> -SRC_URI[tarball.md5sum] = "162ddc6c9b243899ad67ebd6b1c166b1"
> -SRC_URI[tarball.sha256sum] =
> "58959e3ef3046403216a157dfc683c4d7f0dd83365463b8dd87063ded940a0df"
> -SRC_URI[manpages.md5sum] = "7bb067d6363f537b92c3b8b813ff9ed6"
> -SRC_URI[manpages.sha256sum] =
> "e6b5481fd6e24a1d1b155ef17363b313d47025bf6da880737fa872ab78e24f15"
> diff --git a/meta/recipes-devtools/git/git_2.8.1.bb
> b/meta/recipes-devtools/git/git_2.8.1.bb
> new file mode 100644
> index 0000000..8978b72
> --- /dev/null
> +++ b/meta/recipes-devtools/git/git_2.8.1.bb
> @@ -0,0 +1,11 @@
> +require git.inc
> +
> +EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
> +
>  ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
> +                 "
> +EXTRA_OEMAKE += "NO_GETTEXT=1"
> +
> +SRC_URI[tarball.md5sum] = "1a12555182c1e9f781bc30a5c5f9515e"
> +SRC_URI[tarball.sha256sum] =
> "cfc66324179b9ed62ee02833f29d39935f4ab66874125a3ab9d5bb9055c0cb67"
> +SRC_URI[manpages.md5sum] = "60552f15a90b9fcdc1b92b222e2d2379"
> +SRC_URI[manpages.sha256sum] =
> "df46de0c172049f935cc3736361b263c5ff289b77077c73053e63ae83fcf43f4"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1135ee9a6dcbad05304ed86a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Far too late for master/krogoth, this can be merged after =
they&#39;ve branched.<div><br></div><div>Ross</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 12 April 2016 at 19:25, Dan McGr=
egor <span dir=3D"ltr">&lt;<a href=3D"mailto:danismostlikely@gmail.com" tar=
get=3D"_blank">danismostlikely@gmail.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor=
@usask.ca">dan.mcgregor@usask.ca</a>&gt;<br>
<br>
Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca">da=
n.mcgregor@usask.ca</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/git/<a href=3D"http://git_2.7.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">git_2.7.2.bb</a> | 11 -----------<br>
=C2=A0meta/recipes-devtools/git/<a href=3D"http://git_2.8.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">git_2.8.1.bb</a> | 11 +++++++++++<br>
=C2=A02 files changed, 11 insertions(+), 11 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/git/<a href=3D"http://git_2.=
7.2.bb" rel=3D"noreferrer" target=3D"_blank">git_2.7.2.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/git/<a href=3D"http://git_2.=
8.1.bb" rel=3D"noreferrer" target=3D"_blank">git_2.8.1.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/git/<a href=3D"http://git_2.7.2.bb" rel=
=3D"noreferrer" target=3D"_blank">git_2.7.2.bb</a> b/meta/recipes-devtools/=
git/<a href=3D"http://git_2.7.2.bb" rel=3D"noreferrer" target=3D"_blank">gi=
t_2.7.2.bb</a><br>
deleted file mode 100644<br>
index 3fd7151..0000000<br>
--- a/meta/recipes-devtools/git/<a href=3D"http://git_2.7.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">git_2.7.2.bb</a><br>
+++ /dev/null<br>
@@ -1,11 +0,0 @@<br>
-require git.inc<br>
-<br>
-EXTRA_OECONF +=3D &quot;ac_cv_snprintf_returns_bogus=3Dno \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_fread_=
reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
-EXTRA_OEMAKE +=3D &quot;NO_GETTEXT=3D1&quot;<br>
-<br>
-SRC_URI[tarball.md5sum] =3D &quot;162ddc6c9b243899ad67ebd6b1c166b1&quot;<b=
r>
-SRC_URI[tarball.sha256sum] =3D &quot;58959e3ef3046403216a157dfc683c4d7f0dd=
83365463b8dd87063ded940a0df&quot;<br>
-SRC_URI[manpages.md5sum] =3D &quot;7bb067d6363f537b92c3b8b813ff9ed6&quot;<=
br>
-SRC_URI[manpages.sha256sum] =3D &quot;e6b5481fd6e24a1d1b155ef17363b313d470=
25bf6da880737fa872ab78e24f15&quot;<br>
diff --git a/meta/recipes-devtools/git/<a href=3D"http://git_2.8.1.bb" rel=
=3D"noreferrer" target=3D"_blank">git_2.8.1.bb</a> b/meta/recipes-devtools/=
git/<a href=3D"http://git_2.8.1.bb" rel=3D"noreferrer" target=3D"_blank">gi=
t_2.8.1.bb</a><br>
new file mode 100644<br>
index 0000000..8978b72<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/git/<a href=3D"http://git_2.8.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">git_2.8.1.bb</a><br>
@@ -0,0 +1,11 @@<br>
+require git.inc<br>
+<br>
+EXTRA_OECONF +=3D &quot;ac_cv_snprintf_returns_bogus=3Dno \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ac_cv_fread_=
reads_directories=3D${ac_cv_fread_reads_directories=3Dyes} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+EXTRA_OEMAKE +=3D &quot;NO_GETTEXT=3D1&quot;<br>
+<br>
+SRC_URI[tarball.md5sum] =3D &quot;1a12555182c1e9f781bc30a5c5f9515e&quot;<b=
r>
+SRC_URI[tarball.sha256sum] =3D &quot;cfc66324179b9ed62ee02833f29d39935f4ab=
66874125a3ab9d5bb9055c0cb67&quot;<br>
+SRC_URI[manpages.md5sum] =3D &quot;60552f15a90b9fcdc1b92b222e2d2379&quot;<=
br>
+SRC_URI[manpages.sha256sum] =3D &quot;df46de0c172049f935cc3736361b263c5ff2=
89b77077c73053e63ae83fcf43f4&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1135ee9a6dcbad05304ed86a--
