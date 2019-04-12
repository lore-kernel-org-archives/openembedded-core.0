Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 311B17DB46
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 02:12:47 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id w5so9503124qtb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 19:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pz0QaOKJ97WAMhU6+HmzGVjtaUbKhfdg6tlnH16phrc=;
	b=tFMhM07Nd5kTh7oQlkHgS84QUvU9zZIM1tMquX1lpBeym3wvbK5M9bzkxriZlP+ibW
	/nIKSSVEAot8HPA/lGMD1JQNLhdIa4EcJ6Q2Zx+Nni8OIdr7GMQlN4Sjt8N1Oq/EW2zU
	UwiQjMoWAOEDtCAh1IsHsMoYq3QZoTkjKK+oMmkcpNRvWleVGQ/OvC4c15icutiQ2LUk
	wOY79NsDGCdI2/kxrJU8d1Kbo3wxqxvhJxD1tzY80EiyfjJfVTLSyk6WaHY0sTbU0o5q
	BCNK19TPV2RZrfe3tP59dmTma+JPMzPjejPBLWvNTWs6PpzZji4jicDj+Cd4zi57biSR
	BH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pz0QaOKJ97WAMhU6+HmzGVjtaUbKhfdg6tlnH16phrc=;
	b=IDi+kTYhF+JOZjk9lrvWjFARtoi9t8hjcDrqOaSCP1/Vh5IdrV7VGsBLA/929menxP
	tzVVSI55FdtZONbH+ZVJb+BtkZS0sv2YDhE0eJjXCz8HXDAK6UGQNpML+Ycq+EW+2mFw
	rI7DRx5MdXC9c8zBhGCBduOkLIeuPeBhArw5O0Zl0fHLwwe/NHcjsz3YDvwv7r3XEB1x
	BhZHf3nwcxiTcDus5Y37rYB/34GohdyUB9bghHs1DtzJjJnWBP04wS9BYyAxTJjqySg0
	8LaNuSVF9MsG19jFL+pSNOMp0cN/xHsCGBPfoml0iy+WX7MHQElVdTsOChBQtaZ1uP9s
	5/zg==
X-Gm-Message-State: APjAAAWrtYu1VooApuvSjTGL2/KdEH8+Z8tkj/LpiZqP0R9KbNrJVKkT
	5tLx/Z8GvOUXPAFKR6zOX6hMW/6xFVTUhLW/Eko=
X-Google-Smtp-Source: APXvYqz8vaIgVgFAyHwlGXSiaUQkKARUdhe9pGCuvnAOMhczz+LGbC7XduSOdfoequZZyADK/n32mXuCGPybN/MeLyo=
X-Received: by 2002:a0c:92e2:: with SMTP id c31mr11627752qvc.87.1555035168614; 
	Thu, 11 Apr 2019 19:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190411160037.21952-1-alex.kanavin@gmail.com>
In-Reply-To: <20190411160037.21952-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Apr 2019 19:12:37 -0700
Message-ID: <CAMKF1sqTi8azcTi06msrQ9fhtwAgfduOU_20wQtCR4vbTP2nQw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3: add a tr-tr locale for test_locale ptest
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
X-List-Received-Date: Fri, 12 Apr 2019 02:12:48 -0000
Content-Type: multipart/alternative; boundary="000000000000d6aed105864bd63a"

--000000000000d6aed105864bd63a
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 11, 2019 at 9:00 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> With this change, the ptests do not fail anymore,
> except for the three failures caused by the 5.0 kernel regression:
>
> - test_ssl and test_httplib lock up, and are skipped
> (there is a separate patch for it)
>
> - test_asyncio fails but does not lock up
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/python/python3_3.7.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.7.2.bb
> b/meta/recipes-devtools/python/python3_3.7.2.bb
> index 28f128d488b..71a6c103166 100644
> --- a/meta/recipes-devtools/python/python3_3.7.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.2.bb
> @@ -284,7 +284,7 @@ FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}
> ${libdir}/python${PYTHON_MA
>  PACKAGES += "${PN}-man"
>  FILES_${PN}-man = "${datadir}/man"
>
> -RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc
> tzdata-europe coreutils sed"
> +RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc
> tzdata-europe coreutils sed locale-base-tr-tr.iso-8859-9"


While this is a test package i must mention that locale packaged are
specific to Glibc so it would be better to append it with libc override

>
>  RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk',
> 'tk', '', d)}"
>  RDEPENDS_${PN}-dev = ""
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000d6aed105864bd63a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 11, 2019 at 9:00 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">With this change, the ptests do not=
 fail anymore,<br>
except for the three failures caused by the 5.0 kernel regression:<br>
<br>
- test_ssl and test_httplib lock up, and are skipped<br>
(there is a separate patch for it)<br>
<br>
- test_asyncio fails but does not lock up<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.7.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.7.2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.7.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3_3.7.2.bb</a> b/meta/recipes=
-devtools/python/<a href=3D"http://python3_3.7.2.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3_3.7.2.bb</a><br>
index 28f128d488b..71a6c103166 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.7.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.7.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.7.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.7.2.bb</a><br>
@@ -284,7 +284,7 @@ FILES_${PN}-misc =3D &quot;${libdir}/python${PYTHON_MAJ=
MIN} ${libdir}/python${PYTHON_MA<br>
=C2=A0PACKAGES +=3D &quot;${PN}-man&quot;<br>
=C2=A0FILES_${PN}-man =3D &quot;${datadir}/man&quot;<br>
<br>
-RDEPENDS_${PN}-ptest =3D &quot;${PN}-modules ${PN}-tests unzip bzip2 libgc=
c tzdata-europe coreutils sed&quot;<br>
+RDEPENDS_${PN}-ptest =3D &quot;${PN}-modules ${PN}-tests unzip bzip2 libgc=
c tzdata-europe coreutils sed locale-base-tr-tr.iso-8859-9&quot;</blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">While this is a test packag=
e i must mention that locale packaged are specific to Glibc so it would be =
better to append it with libc override=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><br>
=C2=A0RDEPENDS_${PN}-tkinter +=3D &quot;${@bb.utils.contains(&#39;PACKAGECO=
NFIG&#39;, &#39;tk&#39;, &#39;tk&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0RDEPENDS_${PN}-dev =3D &quot;&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000d6aed105864bd63a--
