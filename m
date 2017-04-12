Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 96B9177C90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 11:04:36 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id i124so5691805ybc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 04:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4saiEK+Iy0u2a34eBMVP+/S4gUsFniClngTUZQayGWw=;
	b=vufiJ8Y5Nx4GMLrvlROw1o7POQpeEP9/7GvEZ+0qchLvwh3o0/VA9ZdRmrLnnTM6D2
	J7EMoaGWt7kets0AejZLUCYI3tOj1aNaUvqijETBwi7x4HygnjuI0SL6CIZRzJ9N1Bsm
	RQCsBSEtvI2Vb+pQHL4VY8v8PFClBSUZIH7Q7iC7FAa4a98fgZrEUo0ePnx41VQliZOa
	fuC0eh43dR7MT6v79NtiaxyGpNgk8YeHqeX+9hrO6CSpQ0A9sunuVj7n4Nh7AW1VIyqC
	4RbaBo2zF1qaAn7P1UGr0ziFRLwiBKVYh+kZRTb+5m2b6/q+n8J+V0yYpUjGkvKBt62K
	qZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4saiEK+Iy0u2a34eBMVP+/S4gUsFniClngTUZQayGWw=;
	b=JsX+MrQHp1GYnwKwZBxPC+0gJlzlxl9ay64yj6JUwyKlOtrGs+XuhTNwBDw4+dalAM
	QB5WD50rIU6e93IONp2anc9eLYj5BiQgJJDLufpPEHmraTfkOLeOwvdWExZv6HmpzWpQ
	pY/7jzBcPfsGIa8AbsRrch9vbZLJ5UxedXcGfj+seCufNGXSJojUB4/+SFTg86H//n3j
	9mTyyZKFqIT37jmYrjuCm1RuyiCe/idCnrDSq5K4X562voRLSi20y7g9qUvBFnSWjgEq
	xsLBilYY7LDhX8+fJ8Cbuq4XZZreTCQCEe5Sv4k61KW5pIiROci6GRRreOGNm6GoZILt
	Vqyw==
X-Gm-Message-State: AFeK/H3M/xYc1IXPW6HqXX+Guht60IrHHbIUaILfgHtLjbWbXo6XQ6CWZmvSsrdxkdvtaiK6Vy8qCYxvya/YBW3O
X-Received: by 10.37.163.65 with SMTP id d59mr44144824ybi.103.1491995077419;
	Wed, 12 Apr 2017 04:04:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.121.75 with HTTP; Wed, 12 Apr 2017 04:04:07 -0700 (PDT)
In-Reply-To: <1491994341-28659-1-git-send-email-zhixiong.chi@windriver.com>
References: <1491994341-28659-1-git-send-email-zhixiong.chi@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 12 Apr 2017 14:04:07 +0300
Message-ID: <CAHiDW_E2xCAED+8kCde3w3sNyFZa5w-96VfN-+kbd0+4HjmiEQ@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnome-common: add EXTRA_OECONF "--with-autoconf-archive"
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
X-List-Received-Date: Wed, 12 Apr 2017 11:04:36 -0000
Content-Type: multipart/alternative; boundary=94eb2c19924698bf64054cf62c88

--94eb2c19924698bf64054cf62c88
Content-Type: text/plain; charset=UTF-8

On 12 April 2017 at 13:52, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:

> After updating the autoconf-archive version to 2016.09.16, autoconf-archive
> installs the same ax_*.m4 macros that gnome-common installs. So there will
> be the conflict occurs.
> The option '--with-autoconf-archive' is passed to configure, the macros
> are not installed, and gnome-common will not install any M4 macros that
> conflict with autoconf-archive.
> At the same time, set the RDEPENDS for gnome-common.
>
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  meta/recipes-gnome/gnome/gnome-common_3.18.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
> b/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
> index 06f3bb3..96817bb 100644
> --- a/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
> +++ b/meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
> @@ -14,6 +14,9 @@ SRC_URI[archive.sha256sum] =
> "22569e370ae755e04527b76328befc4c73b62bfd4a572499fd
>  EXTRA_AUTORECONF = ""
>  DEPENDS = ""
>
> +EXTRA_OECONF += " --with-autoconf-archive"
> +RDEPENDS_${PN} = "autoconf-archive"
>

autoconf-archive is not in oe-core, is it?


> +
>  FILES_${PN} += "${datadir}/aclocal"
>  FILES_${PN}-dev = ""
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c19924698bf64054cf62c88
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
2 April 2017 at 13:52, Zhixiong Chi <span dir=3D"ltr">&lt;<a href=3D"mailto=
:zhixiong.chi@windriver.com" target=3D"_blank">zhixiong.chi@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">After updating the a=
utoconf-archive version to 2016.09.16, autoconf-archive<br>
installs the same ax_*.m4 macros that gnome-common installs. So there will<=
br>
be the conflict occurs.<br>
The option &#39;--with-autoconf-archive&#39; is passed to configure, the ma=
cros<br>
are not installed, and gnome-common will not install any M4 macros that<br>
conflict with autoconf-archive.<br>
At the same time, set the RDEPENDS for gnome-common.<br>
<br>
Signed-off-by: Zhixiong Chi &lt;<a href=3D"mailto:zhixiong.chi@windriver.co=
m" target=3D"_blank">zhixiong.chi@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-gnome/gnome/<a href=3D"http://gnome-common_3.18.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gnom<wbr>e-common_3.18.0.bb</a> | 3 +++<=
br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-gnome/gnome/<a href=3D"http://gnome-common_3.18.0=
.bb" rel=3D"noreferrer" target=3D"_blank">gno<wbr>me-common_3.18.0.bb</a> b=
/meta/recipes-gnome/gnome/<a href=3D"http://gnome-common_3.18.0.bb" rel=3D"=
noreferrer" target=3D"_blank">gno<wbr>me-common_3.18.0.bb</a><br>
index 06f3bb3..96817bb 100644<br>
--- a/meta/recipes-gnome/gnome/<a href=3D"http://gnome-common_3.18.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gno<wbr>me-common_3.18.0.bb</a><br>
+++ b/meta/recipes-gnome/gnome/<a href=3D"http://gnome-common_3.18.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gno<wbr>me-common_3.18.0.bb</a><br>
@@ -14,6 +14,9 @@ SRC_URI[archive.sha256sum] =3D &quot;22569e370ae755e04527=
b76328bef<wbr>c4c73b62bfd4a572499fd<br>
=C2=A0EXTRA_AUTORECONF =3D &quot;&quot;<br>
=C2=A0DEPENDS =3D &quot;&quot;<br>
<br>
+EXTRA_OECONF +=3D &quot; --with-autoconf-archive&quot;<br>
+RDEPENDS_${PN} =3D &quot;autoconf-archive&quot;<br></blockquote><div><br><=
/div><div>autoconf-archive is not in oe-core, is it?</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
+<br>
=C2=A0FILES_${PN} +=3D &quot;${datadir}/aclocal&quot;<br>
=C2=A0FILES_${PN}-dev =3D &quot;&quot;<br>
<span class=3D"m_5071625836144556110HOEnZb"><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--94eb2c19924698bf64054cf62c88--
