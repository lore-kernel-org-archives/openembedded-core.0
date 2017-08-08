Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6FAD777A63
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 20:31:27 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id s143so28507299ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qGFdQR1DHzKxq9SjAhUHk7sF0w8uuPUjf43xn4PQ9YA=;
	b=S5FQ54DquFeg8y8u+AyGiF4D/Pfl8VOFZG5e7+4arqGAyJg3LmQX3mRgBF6C27ySX2
	6zQVWRrXHUZPMtVxlHYRP5E32ibX6SHsmsF3bxLqtAOvsCGXXcaZZ2tFcuPIfnk8p3xr
	ue50gcY2Qs2cdjxRXBd9nC5phgntXDrXKh+qTkLiQYRn8fxEjoDRPTVFPu17uf7unGAe
	aB0f0tgLgw8bzjcjtTgEzNKEe3mDEFNABIzH6k5PUbEeQgsMAJ+EYdRN6mI5C1FtfBwp
	e5/xZYPncCNV7U6mcjSMiMOM/A52eYP+PHMyzTKEi+Le1qyAypN761mPMBBkDsOg81Dn
	tUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qGFdQR1DHzKxq9SjAhUHk7sF0w8uuPUjf43xn4PQ9YA=;
	b=QlJcpevzguMI4Gqx/1RpxJRbcRe5csjbt5ccd7zROmJ8K7bTx6gD5hx7oBCIMgr7dp
	tDXFowmlwUapn9SuSARv89lXyVH+B2fdebqxD8vOB8wmKOfgalYAauQMB0HMlahIrCAT
	4B7lu0DUhBpkwQ7sIkbb0jeGQOQiKqXM8ITSg6QIVQ7NJEWLj2vbzN/Ddzghm481QI+q
	2rnMLRLgQaKkA9yIdSwLlhh4aCkixWNeR5XxdURbGfTtBg4XHPMSM+0WL/wK+8kyRWHQ
	1wKjJ3+yAG3C/SC9pKA+X3pf9VEi1lMPQ/KWUIdwpRQWXqKXzJ+RtY4+dauuTn3DR3qk
	PkVg==
X-Gm-Message-State: AHYfb5j5krfXZTOOCOX1+FVe4nAR3zDvhvA9LwvTQ5pIBf28rryNYDyz
	2Whw3+5hb+MZaa1XDkHwiG4VhBuzUQ==
X-Received: by 10.129.108.139 with SMTP id h133mr4529552ywc.106.1502224288758; 
	Tue, 08 Aug 2017 13:31:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.172.196 with HTTP; Tue, 8 Aug 2017 13:31:28 -0700 (PDT)
In-Reply-To: <1502224623.1934.32.camel@linux.intel.com>
References: <20170808201605.139537-1-jslater@windriver.com>
	<1502224623.1934.32.camel@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 8 Aug 2017 21:31:28 +0100
Message-ID: <CA+chaQdH7vowdB3fTz41zgyF+SkHZGHn6qS6hvAH_AduL_wrDw@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Joe Slater <jslater@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] php: move to version 7.1.8
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
X-List-Received-Date: Tue, 08 Aug 2017 20:31:28 -0000
Content-Type: multipart/alternative; boundary="001a114da5e21ae6aa055643d93d"

--001a114da5e21ae6aa055643d93d
Content-Type: text/plain; charset="UTF-8"

And wrong ML

On Tue, Aug 8, 2017 at 9:37 PM, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> On Tue, 2017-08-08 at 13:16 -0700, Joe Slater wrote:
> > Fixes many CVEs.
>
> would be a plus if you list those.
>
> why LIC_FILES_CHKSUM changed?
>
> Leo
>
> >
> > Signed-off-by: Joe Slater <jslater@windriver.com>
> > ---
> >  .../{php-7.1.0 => php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
> >  meta-oe/recipes-devtools/php/{php_7.1.0.bb => php_7.1.8.bb}         |
> 6 +++---
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-devtools/php/{php-7.1.0 =>
> php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
> >  rename meta-oe/recipes-devtools/php/{php_7.1.0.bb => php_7.1.8.bb}
> (64%)
> >
> > diff --git a/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> b/meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_
> RUN-to-AC_TRY_LINK.patch
> > similarity index 100%
> > rename from meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-
> to-AC_TRY_LINK.patch
> > rename to meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-
> to-AC_TRY_LINK.patch
> > diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb
> b/meta-oe/recipes-devtools/php/php_7.1.8.bb
> > similarity index 64%
> > rename from meta-oe/recipes-devtools/php/php_7.1.0.bb
> > rename to meta-oe/recipes-devtools/php/php_7.1.8.bb
> > index 210d91f..c0b2541 100644
> > --- a/meta-oe/recipes-devtools/php/php_7.1.0.bb
> > +++ b/meta-oe/recipes-devtools/php/php_7.1.8.bb
> > @@ -1,10 +1,10 @@
> >  require php.inc
> >
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078f
> e4"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=c0af599f66d0461c5837c695fcbc5c
> 1e"
> >
> >  SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
> > -SRC_URI[md5sum] = "54e364b60a88db77adb96aacb10f10a4"
> > -SRC_URI[sha256sum] = "68bcfd7deed5b3474d81dec9f74d12
> 2058327e2bed0ac25bbc9ec70995228e61"
> > +SRC_URI[md5sum] = "d22451dc20bbdf4b8bb656dc787c2a36"
> > +SRC_URI[sha256sum] = "7064a00a9450565190890c7a4be04e
> 646e0be73b2e0f8c46ae34419f343ca2f8"
> >
> >  PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config
> \
> >                          --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config
> \
> > --
> > 2.7.4
> >
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114da5e21ae6aa055643d93d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">And wrong ML</div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Tue, Aug 8, 2017 at 9:37 PM, Leonardo Sandoval <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com=
" target=3D"_blank">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Tue, 2017-08-08 at 13:16 -07=
00, Joe Slater wrote:<br>
&gt; Fixes many CVEs.<br>
<br>
would be a plus if you list those.<br>
<br>
why LIC_FILES_CHKSUM changed?<br>
<br>
Leo<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Signed-off-by: Joe Slater &lt;<a href=3D"mailto:jslater@windriver.com"=
>jslater@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../{php-7.1.0 =3D&gt; php-7.1.8}/change-AC_TRY_RUN-<wbr>to-AC_T=
RY_LINK.patch | 0<br>
&gt;=C2=A0 meta-oe/recipes-devtools/php/{<a href=3D"http://php_7.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank"><wbr>php_7.1.0.bb</a> =3D&gt; <a href=3D=
"http://php_7.1.8.bb" rel=3D"noreferrer" target=3D"_blank">php_7.1.8.bb</a>=
}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-devtools/php/{<wbr>php-7.1.0 =3D&gt; php-=
7.1.8}/change-AC_TRY_RUN-<wbr>to-AC_TRY_LINK.patch (100%)<br>
&gt;=C2=A0 rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_7.1.0=
.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>php_7.1.0.bb</a> =3D&gt; <a =
href=3D"http://php_7.1.8.bb" rel=3D"noreferrer" target=3D"_blank">php_7.1.8=
.bb</a>} (64%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-devtools/<wbr>php/php-7.1.0/change-AC_TRY=
_<wbr>RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/<wbr>php/php-7.1.=
8/change-AC_TRY_<wbr>RUN-to-AC_TRY_LINK.patch<br>
&gt; similarity index 100%<br>
&gt; rename from meta-oe/recipes-devtools/php/<wbr>php-7.1.0/change-AC_TRY_=
RUN-<wbr>to-AC_TRY_LINK.patch<br>
&gt; rename to meta-oe/recipes-devtools/php/<wbr>php-7.1.8/change-AC_TRY_RU=
N-<wbr>to-AC_TRY_LINK.patch<br>
&gt; diff --git a/meta-oe/recipes-devtools/<wbr>php/<a href=3D"http://php_7=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">php_7.1.0.bb</a> b/meta-oe/re=
cipes-devtools/<wbr>php/<a href=3D"http://php_7.1.8.bb" rel=3D"noreferrer" =
target=3D"_blank">php_7.1.8.bb</a><br>
&gt; similarity index 64%<br>
&gt; rename from meta-oe/recipes-devtools/php/<a href=3D"http://php_7.1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">p<wbr>hp_7.1.0.bb</a><br>
&gt; rename to meta-oe/recipes-devtools/php/<a href=3D"http://php_7.1.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">p<wbr>hp_7.1.8.bb</a><br>
&gt; index 210d91f..c0b2541 100644<br>
&gt; --- a/meta-oe/recipes-devtools/<wbr>php/<a href=3D"http://php_7.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">php_7.1.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-devtools/<wbr>php/<a href=3D"http://php_7.1.8.bb=
" rel=3D"noreferrer" target=3D"_blank">php_7.1.8.bb</a><br>
&gt; @@ -1,10 +1,10 @@<br>
&gt;=C2=A0 require php.inc<br>
&gt;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>b602636d46a61c0a=
c0432bbf5c078f<wbr>e4&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D<wbr>c0af599f66d0461c=
5837c695fcbc5c<wbr>1e&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI +=3D &quot;file://change-AC_TRY_RUN-to-<wbr>AC_TRY_LINK.=
patch&quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;<wbr>54e364b60a88db77adb96aacb10f10<wbr>a4&=
quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;<wbr>68bcfd7deed5b3474d81dec9f74d12<wbr>=
2058327e2bed0ac25bbc9ec7099522<wbr>8e61&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;<wbr>d22451dc20bbdf4b8bb656dc787c2a<wbr>36&=
quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;<wbr>7064a00a9450565190890c7a4be04e<wbr>=
646e0be73b2e0f8c46ae34419f343c<wbr>a2f8&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[mysql] =3D &quot;--with-mysqli=3D${STAGING_<wbr>BI=
NDIR_CROSS}/mysql_config \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 --with-pdo-mysql=3D${STAGING_<wbr>BINDIR_CROSS}/mysql_=
config \<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114da5e21ae6aa055643d93d--
