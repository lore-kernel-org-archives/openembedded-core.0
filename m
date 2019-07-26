Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id 027307F1DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 10:09:29 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id o19so21082487uap.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KtKa71l+2FR/OdGyvc/CuodZM0maaejS2SzJ3Roa6Bk=;
	b=CX/qGMxQYVzUcpK16lvy17LTV0jtkkn1PGKY/GNrmabc+pzA7dzjHNJ8BIuo4Vzp22
	ITR6Qepuk9DLV67sR/iEiv192vG/InIu+F8tkqf+6VZiNkqpbcZePcyOZixesFbw49xp
	zhoeMrotQTAANk4iMe+q72btXybZtKgODKFMd0BID+Gz/Mf405qMkcdFI9Fm8ZCteBy+
	72iFIQRWuXm6bkoamL03iGyEzEZRZ5Tk5uRuKPy1Iid4s+OBL/yDih56yhKtiF/x1L+A
	d962w8j0uwSlWg1L99v9fSCYJFBp2VjXcgApD0A6DUmTL/sq46f/jmtEkGQK4hWZ47DX
	0qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KtKa71l+2FR/OdGyvc/CuodZM0maaejS2SzJ3Roa6Bk=;
	b=uKGsCypjs2/HYSSX/fIcUkR3pMRubyowoxKD1ey0OPHZJq8vCDtY+/7qGa1vohoMoK
	v4qINmF1ZyNxOBo/fxGf6K90BNjZHAFp3AJktJqdekKMzuQSFHJYF41zlW3pH/rkpU/7
	ps2TXCrsr5le5i7KG0mUh8QKYtZx5BZIf+GihYPTrv+TrqtCkfUkknWanMUm6fECCF8F
	umX/Whtoo1uBhD5uD/ed7+nINvroCgiCOqAaEm/xLa6etUT64Zl75oPYALmn1jt8YIZD
	efGQX+ANjLmvo9ZF4i+GioXLZb8eLWdZ8ivD6H9og8Y/Pntq0r+oRp2Qg2cGcvjVAtDz
	JR5Q==
X-Gm-Message-State: APjAAAXjEpUh1ztHJmIfYUGQU00OdsgGumhvsLqBcein5IXghcTcXlsy
	xEcW9O39FJcWin6tWRqOgodddmT1XxMG59HrMcSQHc7k
X-Google-Smtp-Source: APXvYqyNFcKLDfN4NNE1wG8Dq9imokHlwuFgLnHdWv815ySa90AxPmRWWblUKpB6gDR2M3pSofLfFlUEdu6vty6+eTI=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr8565324uak.71.1564135770911;
	Fri, 26 Jul 2019 03:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190726093443.40634-1-kai.kang@windriver.com>
	<20190726093443.40634-2-kai.kang@windriver.com>
In-Reply-To: <20190726093443.40634-2-kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Jul 2019 13:09:19 +0300
Message-ID: <CANNYZj--B16+q6PHBk7W9ESpGFs1gjGJwNYUGR-rc0yznYMJyw@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] epiphany: set imcompatible with tune mips
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
X-List-Received-Date: Fri, 26 Jul 2019 10:09:31 -0000
Content-Type: multipart/alternative; boundary="000000000000019a7b058e92bd35"

--000000000000019a7b058e92bd35
Content-Type: text/plain; charset="UTF-8"

Wait, does this mean that the line must be inserted into all of the recipes
that depend on webkitgtk (wihch is very awkward)? Shouldn't just the
webkitgtk recipe fix be enough?

Alex

On Fri, 26 Jul 2019 at 12:35, <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> webkitgtk doesn't work with tune mips and set imcompatible with it.
> epiphany depends on webkitgtk and mask it too.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-gnome/epiphany/epiphany_3.32.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
> b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
> index de1b6e2f84..d1c6af52ed 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.32.3.bb
> @@ -16,5 +16,8 @@ SRC_URI =
> "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
>  SRC_URI[archive.md5sum] = "c4976507bf3de69f27a050ad09531f5a"
>  SRC_URI[archive.sha256sum] =
> "3ccb6859a43b839b714aa425cb185056f1e8604adbaab6a1bc179d1ba641a33f"
>
> +# webkitgtk doesn't work with tune 'mips'
> +COMPATIBLE_HOST_mipsarch = "${@bb.utils.contains('DEFAULTTUNE', 'mips',
> 'null', 'mips.*-linux', d)}"
> +
>  FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers
> ${datadir}/metainfo"
>  RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000019a7b058e92bd35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wait, does this mean that the line must be inserted into a=
ll of the recipes that depend on webkitgtk (wihch is very awkward)? Shouldn=
&#39;t just the webkitgtk recipe fix be enough?<div><br></div><div>Alex</di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Fri, 26 Jul 2019 at 12:35, &lt;<a href=3D"mailto:kai.kang@windriver.co=
m">kai.kang@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">From: Ka=
i Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.=
kang@windriver.com</a>&gt;<br>
<br>
webkitgtk doesn&#39;t work with tune mips and set imcompatible with it.<br>
epiphany depends on webkitgtk and mask it too.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.32.3.bb" rel=
=3D"noreferrer" target=3D"_blank">epiphany_3.32.3.bb</a> | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.32.3.=
bb" rel=3D"noreferrer" target=3D"_blank">epiphany_3.32.3.bb</a> b/meta/reci=
pes-gnome/epiphany/<a href=3D"http://epiphany_3.32.3.bb" rel=3D"noreferrer"=
 target=3D"_blank">epiphany_3.32.3.bb</a><br>
index de1b6e2f84..d1c6af52ed 100644<br>
--- a/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.32.3.bb" rel=
=3D"noreferrer" target=3D"_blank">epiphany_3.32.3.bb</a><br>
+++ b/meta/recipes-gnome/epiphany/<a href=3D"http://epiphany_3.32.3.bb" rel=
=3D"noreferrer" target=3D"_blank">epiphany_3.32.3.bb</a><br>
@@ -16,5 +16,8 @@ SRC_URI =3D &quot;${GNOME_MIRROR}/${GNOMEBN}/${@gnome_ver=
dir(&quot;${PV}&quot;)}/${GNOMEBN}-${PV}<br>
=C2=A0SRC_URI[archive.md5sum] =3D &quot;c4976507bf3de69f27a050ad09531f5a&qu=
ot;<br>
=C2=A0SRC_URI[archive.sha256sum] =3D &quot;3ccb6859a43b839b714aa425cb185056=
f1e8604adbaab6a1bc179d1ba641a33f&quot;<br>
<br>
+# webkitgtk doesn&#39;t work with tune &#39;mips&#39;<br>
+COMPATIBLE_HOST_mipsarch =3D &quot;${@bb.utils.contains(&#39;DEFAULTTUNE&#=
39;, &#39;mips&#39;, &#39;null&#39;, &#39;mips.*-linux&#39;, d)}&quot;<br>
+<br>
=C2=A0FILES_${PN} +=3D &quot;${datadir}/dbus-1 ${datadir}/gnome-shell/searc=
h-providers ${datadir}/metainfo&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;iso-codes adwaita-icon-theme gsettings-deskt=
op-schemas&quot;<br>
-- <br>
2.20.0<br>
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

--000000000000019a7b058e92bd35--
