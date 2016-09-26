Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id ACD1660684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 06:09:35 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id b204so11086853qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 23:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gKahUXNjdsHNZMDGAKjtbdYNH/QSf4BEHm4UMyh97F4=;
	b=PYjLiSppP1w2hEKe5Ryd7PoeWd32EiDjEaC+L+k3dr2NYkLuJOKtADNIn+XpAjVEEj
	SEplb/rgz29mRCjX+Kx2Fiazj64vdU6E/JKuH/owNZUhUDAsRvxFPDUkng6mzf5audF8
	gNBNK6nL3q95XbO44uh00A/n+RyVpB2asgx2lWOJN4kZkjpo0hyvbiOq0weDIzkbsh95
	1+7T3LKMjpKZ731OFGu9LLm6Z3rTbqPmRkq9VKUrvDhh5yjXZTsaGWHWwMoxtM2beR6T
	4EGgnj0nPZS353QpPy+B8ntTehhGd1HHUGHKXjuEWejhU+lH0xj4tHxkRDtEoPfmvbH7
	RPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gKahUXNjdsHNZMDGAKjtbdYNH/QSf4BEHm4UMyh97F4=;
	b=Jz6OE/CV3W3pitOxTBqJdd4sAixZAEkTzBlGlnyi+yXtZfog5VagrIY1Cr2Vn43BLV
	tixG6BJQKnu8HsaXR4GIelgOzHrytrrW20rXGxytLw+2S0Zo7eBhAjHfwShGKyHxz8kd
	ELUJhU9ljn5clqWdi4B/2R6PKLRORAwiJYpy6Qy/mSdhZIaEXkRNPWo40U8vcUQ9x8sc
	7Ob/sOq609NGoQTFsqIDIHqQ4GagTI3T3GFBIUu3Yb2g/PGv3/4TaARjNPl5qCbZgnzy
	ahAAupoZqrpQhOe5lXNFbXiNDkzwNPHeoyzSMuEA/Y8UiZ5+OGhMvqxLDOun/UYujnkP
	c0cQ==
X-Gm-Message-State: AA6/9RmgtSXK7xN4o1V5PlTYQHrR3XsWumyDiaN+3RnEGyWPd6tGWtRemekk0Psfv5BZjjSUkgbmplZ+8oGvQA==
X-Received: by 10.55.168.78 with SMTP id r75mr18545460qke.19.1474870176779;
	Sun, 25 Sep 2016 23:09:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Sun, 25 Sep 2016 23:09:16 -0700 (PDT)
In-Reply-To: <1474450963-4114-1-git-send-email-sujith.h@gmail.com>
References: <1474450963-4114-1-git-send-email-sujith.h@gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 26 Sep 2016 11:39:16 +0530
Message-ID: <CADyYWLn9zWELS7Ly_J8cZkW3K4WgOKDhFSrHVPaAF7V=Ety=EQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>
Subject: Re: [PATCH] x264: add textrel to INSANE_SKIP
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
X-List-Received-Date: Mon, 26 Sep 2016 06:09:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c07514cfa1532053d62f87a

--94eb2c07514cfa1532053d62f87a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Let me know if this patch is ok. Else I can help make this patch better.

Thanks,
Sujith H

On Wed, Sep 21, 2016 at 3:12 PM, Sujith H <sujith.h@gmail.com> wrote:

> From: Fahad Usman <fahad_usman@mentor.com>
>
> Tried by adding CFLAGS_append =3D " -fpic " to
> the recipe. But that couldn't help resolve the
> warning message:
>
> x264/r2491+gitAUTOINC+c8a773ebfc-r0/packages-split/x264/usr/lib/libx264.s=
o.144'
> has relocations in .text [textrel]
>
> It was found that this warning is emitted because of the
> assembly files in the source code. And it is not easy to
> get rid of TEXTREL's which are coming from the assembly
> source files.
>
> Adding textrel to INSANE_SKIP resolves this issue.
> This issue was observed in cyclone5 and imx6qsabresd BSP's.
> So generalizing the patch.
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
> ---
>  meta/recipes-multimedia/x264/x264_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-multimedia/x264/x264_git.bb
> b/meta/recipes-multimedia/x264/x264_git.bb
> index fa44f9c..393310f 100644
> --- a/meta/recipes-multimedia/x264/x264_git.bb
> +++ b/meta/recipes-multimedia/x264/x264_git.bb
> @@ -48,6 +48,6 @@ do_install() {
>      oe_runmake install DESTDIR=3D${D}
>  }
>
> -# PIC can't be enabled for 32-bit x86
> -INSANE_SKIP_${PN}_append_x86 =3D " textrel"
> +# PIC can't be enabled for few BSP's
> +INSANE_SKIP_${PN}_append =3D " textrel"
>
> --
> 1.9.1
>
>


--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--94eb2c07514cfa1532053d62f87a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>Let me know if this patch =
is ok. Else I can help make this patch better.<br><br></div>Thanks,<br></di=
v>Sujith H<br><div><div><div><div><div><div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Wed, Sep 21, 2016 at 3:12 PM, Sujith H <span =
dir=3D"ltr">&lt;<a href=3D"mailto:sujith.h@gmail.com" target=3D"_blank">suj=
ith.h@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Fro=
m: Fahad Usman &lt;<a href=3D"mailto:fahad_usman@mentor.com">fahad_usman@me=
ntor.com</a>&gt;<br>
<br>
Tried by adding CFLAGS_append =3D &quot; -fpic &quot; to<br>
the recipe. But that couldn&#39;t help resolve the<br>
warning message:<br>
<br>
x264/r2491+gitAUTOINC+<wbr>c8a773ebfc-r0/packages-split/<wbr>x264/usr/lib/l=
ibx264.so.144&#39; has relocations in .text [textrel]<br>
<br>
It was found that this warning is emitted because of the<br>
assembly files in the source code. And it is not easy to<br>
get rid of TEXTREL&#39;s which are coming from the assembly<br>
source files.<br>
<br>
Adding textrel to INSANE_SKIP resolves this issue.<br>
This issue was observed in cyclone5 and imx6qsabresd BSP&#39;s.<br>
So generalizing the patch.<br>
<br>
Signed-off-by: Fahad Usman &lt;<a href=3D"mailto:fahad_usman@mentor.com">fa=
had_usman@mentor.com</a>&gt;<br>
Signed-off-by: Sujith Haridasan &lt;<a href=3D"mailto:Sujith_Haridasan@ment=
or.com">Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb" rel=3D"no=
referrer" target=3D"_blank">x<wbr>264_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-multimedia/<wbr>x264/<a href=3D"http://x264_git.b=
b" rel=3D"noreferrer" target=3D"_blank">x264_git.bb</a> b/meta/recipes-mult=
imedia/<wbr>x264/<a href=3D"http://x264_git.bb" rel=3D"noreferrer" target=
=3D"_blank">x264_git.bb</a><br>
index fa44f9c..393310f 100644<br>
--- a/meta/recipes-multimedia/<wbr>x264/<a href=3D"http://x264_git.bb" rel=
=3D"noreferrer" target=3D"_blank">x264_git.bb</a><br>
+++ b/meta/recipes-multimedia/<wbr>x264/<a href=3D"http://x264_git.bb" rel=
=3D"noreferrer" target=3D"_blank">x264_git.bb</a><br>
@@ -48,6 +48,6 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0oe_runmake install DESTDIR=3D${D}<br>
=C2=A0}<br>
<br>
-# PIC can&#39;t be enabled for 32-bit x86<br>
-INSANE_SKIP_${PN}_append_x86 =3D &quot; textrel&quot;<br>
+# PIC can&#39;t be enabled for few BSP&#39;s<br>
+INSANE_SKIP_${PN}_append =3D &quot; textrel&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=
=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=
=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE project<br></div><=
div>&lt;Project&gt;Contributor to Yocto project<br></div><div><a href=3D"ht=
tp://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wik=
ia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh=
.info" target=3D"_blank">http://sujithh.info</a><br></div><div>C-x C-c<br><=
/div></div></div></div></div>
</div></div></div></div></div></div></div></div>

--94eb2c07514cfa1532053d62f87a--
