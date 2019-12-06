Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 26E307F7CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 13:22:27 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id p6so4963701vsj.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 05:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6n4nwSAy2WLSXB4+3cNdsKR6YP7GqxoKAskJdIlH9ys=;
	b=NLLGMisQkWBuMTT5re+4+8/9CebxkETXmFO8ZkAkAUvuYhQPc45XVPmMzIDS1vCzJf
	seA/UyfvjqPhfo0pSpa4ty9AScdDbqzRi8HdFYoZh227YmNDMUw6Wz8EgozWcimjNikD
	4GpC7aLcksazRb3lYrjeXK4fEy8FokyZTuIDIn2NhKVZQH3KsdxXNiRbRdZhHYmL/GKV
	jYxIZIcexMETGSj66KUOHKyu5NjtqIcDhMRv6BUr90jQ6BqGIb2g8i5ypfAxMDuNokyi
	ah7UEnfInijJWp/qKfGBJbemsvj2i/PYUKIfuhIdWeie5aCwzrm2VDlGKUY15HrZBZvM
	Y+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6n4nwSAy2WLSXB4+3cNdsKR6YP7GqxoKAskJdIlH9ys=;
	b=NvZ91jqqUl/Nlu1E+XAr2OREjRw3b7AGtYfhZd4p6xUFFlfehcPRfAfKtnwpME8YrA
	QMd7No+LzI0ZiXD/WrlP7zfRtsGvQ1A7GEJvd179tVShu8ZhkaJ59/DXKr/zTVa457ys
	kM8OCldn6suYb+kuYn1tygUheSWcWf0R1Ynf6YZNkm5MK0ZrTr1sSMVNr1U5auxrDsS0
	Il0OUQ7+8fuEPkH2HaAWV4+XNKFMnFhT8vlt9vBj9j3OfUfWJwvMAA1fXA16vMcNqGrX
	rQtK4kzVbmV4MWfa65aVmKPp+nnzY/xHqUv1/4yjlrgH3S4nh61ImVpA6Z+0PN3sSxXs
	Sr3Q==
X-Gm-Message-State: APjAAAUEdSETuH+KtGL9X1YxOFBeYzN1O2IuwGjTUETjRDPg02QcEHfl
	GV7C1P6vlHy6GrDhA+eUJvtyDwAHRs2a6N9M/PI=
X-Google-Smtp-Source: APXvYqwxViMAJQc2kvJlNtJmKTnas0zyL+b6/bAeB9+j4PxpssObqDXgvLfWCRC3d61kL+MXYKTFYagHzFdpUwWlMPc=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr9708058vsq.94.1575638548866; 
	Fri, 06 Dec 2019 05:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
	<20191205154357.121346-16-alex.kanavin@gmail.com>
	<CAMKF1sqZ6qN=BA4hXvVxXD=QOo7gQijovo137oy+EyGSbQBAcw@mail.gmail.com>
In-Reply-To: <CAMKF1sqZ6qN=BA4hXvVxXD=QOo7gQijovo137oy+EyGSbQBAcw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Dec 2019 14:22:17 +0100
Message-ID: <CANNYZj_frOnpj9YrONE5hoFF2m6L6Yp5g-CrPFoZHKGrs62OxA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/24] libtasn1: update to 4.15.0
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
X-List-Received-Date: Fri, 06 Dec 2019 13:22:28 -0000
Content-Type: multipart/alternative; boundary="000000000000ffebfb059908efd6"

--000000000000ffebfb059908efd6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, will change that and resend.

Alex

On Thu, 5 Dec 2019 at 17:55, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Dec 5, 2019 at 7:47 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Drop backports.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../gnutls/libtasn1/fix-gtkdoc.patch          | 38 -------------------
> >  .../gnutls/libtasn1/fix-ldflags.patch         | 31 ---------------
> >  .../{libtasn1_4.14.bb =3D> libtasn1_4.15.0.bb}  | 11 ++++--
> >  3 files changed, 7 insertions(+), 73 deletions(-)
> >  delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.pat=
ch
> >  delete mode 100644
> meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
> >  rename meta/recipes-support/gnutls/{libtasn1_4.14.bb =3D>
> libtasn1_4.15.0.bb} (71%)
> >
> > diff --git a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
> b/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
> > deleted file mode 100644
> > index bfc9b9fca7e..00000000000
> > --- a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -Upstream-Status: Backport [
> https://gitlab.com/gnutls/libtasn1/merge_requests/49]
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -From ebd4f871b5241809f6a5b461444a6d331e15c949 Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@intel.com>
> > -Date: Mon, 9 Sep 2019 13:11:39 +0100
> > -Subject: [PATCH] doc/reference: don't add empty object hierarchy chapt=
er
> > -
> > -The object hierarchy section is empty because there are no GObjects in
> the
> > -libtasn1 API.  With gtk-doc 1.30 onwards if there are no objects then
> the object
> > -hierarchy file won't exist, resulting in a failure when building the
> > -documentation:
> > -
> > -| ../libtasn1-docs.xml:39: element include: XInclude error : could not
> load ../xml/tree_index.sgml, and no fallback was found
> > -
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ----
> > - doc/reference/libtasn1-docs.xml | 4 ----
> > - 1 file changed, 4 deletions(-)
> > -
> > -diff --git a/doc/reference/libtasn1-docs.xml
> b/doc/reference/libtasn1-docs.xml
> > -index accdb85..f88b888 100644
> > ---- a/doc/reference/libtasn1-docs.xml
> > -+++ b/doc/reference/libtasn1-docs.xml
> > -@@ -34,10 +34,6 @@
> > -         <xi:include href=3D"xml/libtasn1.xml"/>
> > -
> > -   </chapter>
> > --  <chapter id=3D"object-tree">
> > --    <title>Object Hierarchy</title>
> > --    <xi:include href=3D"xml/tree_index.sgml"/>
> > --  </chapter>
> > -   <index id=3D"api-index-full">
> > -     <title>API Index</title>
> > -     <xi:include href=3D"xml/api-index-full.xml"><xi:fallback
> /></xi:include>
> > ---
> > -2.20.1
> > -
> > diff --git a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
> b/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
> > deleted file mode 100644
> > index f18f3c62679..00000000000
> > --- a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -From a6f93b7ace347bc4fe29eb4a8fe4383d786cc8d0 Mon Sep 17 00:00:00 2001
> > -From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D <tim.ruehsen@gmx.de>
> > -Date: Tue, 23 Jul 2019 20:44:01 +0200
> > -Subject: [PATCH] Fix LDFLAGS to AM_LDFLAGS in src/Makefile.am
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Signed-off-by: Tim R=C3=BChsen <tim.ruehsen@gmx.de>
> > -Upstream-Status: Backport
> > -Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ----
> > - src/Makefile.am | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/src/Makefile.am b/src/Makefile.am
> > -index 5bf3622..4459767 100644
> > ---- a/src/Makefile.am
> > -+++ b/src/Makefile.am
> > -@@ -21,7 +21,7 @@ AM_CPPFLAGS =3D -I$(top_builddir)/lib/includes
> -I$(top_srcdir)/lib/includes \
> > -  -I$(top_builddir)/lib/gl -I$(top_srcdir)/lib/gl
> $(CODE_COVERAGE_CPPFLAGS)
> > -
> > - LDADD =3D ../lib/libtasn1.la
> > --LDFLAGS =3D $(CODE_COVERAGE_LDFLAGS)
> > -+AM_LDFLAGS =3D $(CODE_COVERAGE_LDFLAGS)
> > -
> > - bin_PROGRAMS =3D asn1Parser asn1Coding asn1Decoding
> > -
> > ---
> > -2.21.0
> > -
> > diff --git a/meta/recipes-support/gnutls/libtasn1_4.14.bb
> b/meta/recipes-support/gnutls/libtasn1_4.15.0.bb
> > similarity index 71%
> > rename from meta/recipes-support/gnutls/libtasn1_4.14.bb
> > rename to meta/recipes-support/gnutls/libtasn1_4.15.0.bb
> > index ef2c1956a24..cd00d17b803 100644
> > --- a/meta/recipes-support/gnutls/libtasn1_4.14.bb
> > +++ b/meta/recipes-support/gnutls/libtasn1_4.15.0.bb
> > @@ -10,15 +10,18 @@ LIC_FILES_CHKSUM =3D
> "file://doc/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
> >
> >  SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
> >             file://dont-depend-on-help2man.patch \
> > -           file://fix-ldflags.patch \
> > -           file://fix-gtkdoc.patch \
> >             "
> >
> >  DEPENDS =3D "bison-native"
> >
> > -SRC_URI[md5sum] =3D "e9918200ed4a778e2b3cbe34c1be4205"
> > -SRC_URI[sha256sum] =3D
> "9e604ba5c5c8ea403487695c2e407405820d98540d9de884d6e844f9a9c5ba08"
> > +SRC_URI[md5sum] =3D "33e3fb5501bb2142184238c815b0beb8"
> > +SRC_URI[sha256sum] =3D
> "dd77509fe8f5304deafbca654dc7f0ea57f5841f41ba530cff9a5bf71382739e"
> >
> >  inherit autotools texinfo lib_package gtk-doc
> >
> > +do_install_append () {
> > +    # this utility is not useful and has a bogus RPATH
>
> if bogus rpath is the reason to delete it then its better to nick it
> with chrpath --delete
>
> > +    rm ${D}/${bindir}/corpus2array
> > +}
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ffebfb059908efd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, will change that and resend.</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, 5 Dec 2019 at 17:55, Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Dec 5, 2019 at 7:47 A=
M Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D=
"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Drop backports.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gnutls/libtasn1/fix-gtkdoc.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 38 -------------------<br>
&gt;=C2=A0 .../gnutls/libtasn1/fix-ldflags.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 31 ---------------<br>
&gt;=C2=A0 .../{<a href=3D"http://libtasn1_4.14.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libtasn1_4.14.bb</a> =3D&gt; <a href=3D"http://libtasn1_4.15.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.15.0.bb</a>}=C2=A0 | =
11 ++++--<br>
&gt;=C2=A0 3 files changed, 7 insertions(+), 73 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-gtkd=
oc.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-ldfl=
ags.patch<br>
&gt;=C2=A0 rename meta/recipes-support/gnutls/{<a href=3D"http://libtasn1_4=
.14.bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.14.bb</a> =3D&gt; <=
a href=3D"http://libtasn1_4.15.0.bb" rel=3D"noreferrer" target=3D"_blank">l=
ibtasn1_4.15.0.bb</a>} (71%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch b/m=
eta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch<br>
&gt; deleted file mode 100644<br>
&gt; index bfc9b9fca7e..00000000000<br>
&gt; --- a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,38 +0,0 @@<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/libta=
sn1/merge_requests/49" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
com/gnutls/libtasn1/merge_requests/49</a>]<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -From ebd4f871b5241809f6a5b461444a6d331e15c949 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -Date: Mon, 9 Sep 2019 13:11:39 +0100<br>
&gt; -Subject: [PATCH] doc/reference: don&#39;t add empty object hierarchy =
chapter<br>
&gt; -<br>
&gt; -The object hierarchy section is empty because there are no GObjects i=
n the<br>
&gt; -libtasn1 API.=C2=A0 With gtk-doc 1.30 onwards if there are no objects=
 then the object<br>
&gt; -hierarchy file won&#39;t exist, resulting in a failure when building =
the<br>
&gt; -documentation:<br>
&gt; -<br>
&gt; -| ../libtasn1-docs.xml:39: element include: XInclude error : could no=
t load ../xml/tree_index.sgml, and no fallback was found<br>
&gt; -<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; ----<br>
&gt; - doc/reference/libtasn1-docs.xml | 4 ----<br>
&gt; - 1 file changed, 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/doc/reference/libtasn1-docs.xml b/doc/reference/libtasn1=
-docs.xml<br>
&gt; -index accdb85..f88b888 100644<br>
&gt; ---- a/doc/reference/libtasn1-docs.xml<br>
&gt; -+++ b/doc/reference/libtasn1-docs.xml<br>
&gt; -@@ -34,10 +34,6 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;xi:include href=3D&quot;xml/lib=
tasn1.xml&quot;/&gt;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0&lt;/chapter&gt;<br>
&gt; --=C2=A0 &lt;chapter id=3D&quot;object-tree&quot;&gt;<br>
&gt; --=C2=A0 =C2=A0 &lt;title&gt;Object Hierarchy&lt;/title&gt;<br>
&gt; --=C2=A0 =C2=A0 &lt;xi:include href=3D&quot;xml/tree_index.sgml&quot;/=
&gt;<br>
&gt; --=C2=A0 &lt;/chapter&gt;<br>
&gt; -=C2=A0 =C2=A0&lt;index id=3D&quot;api-index-full&quot;&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&lt;title&gt;API Index&lt;/title&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0&lt;xi:include href=3D&quot;xml/api-index-full.xm=
l&quot;&gt;&lt;xi:fallback /&gt;&lt;/xi:include&gt;<br>
&gt; ---<br>
&gt; -2.20.1<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch b/=
meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch<br>
&gt; deleted file mode 100644<br>
&gt; index f18f3c62679..00000000000<br>
&gt; --- a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,31 +0,0 @@<br>
&gt; -From a6f93b7ace347bc4fe29eb4a8fe4383d786cc8d0 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: =3D?UTF-8?q?Tim=3D20R=3DC3=3DBChsen?=3D &lt;<a href=3D"mailto:t=
im.ruehsen@gmx.de" target=3D"_blank">tim.ruehsen@gmx.de</a>&gt;<br>
&gt; -Date: Tue, 23 Jul 2019 20:44:01 +0200<br>
&gt; -Subject: [PATCH] Fix LDFLAGS to AM_LDFLAGS in src/Makefile.am<br>
&gt; -MIME-Version: 1.0<br>
&gt; -Content-Type: text/plain; charset=3DUTF-8<br>
&gt; -Content-Transfer-Encoding: 8bit<br>
&gt; -<br>
&gt; -Signed-off-by: Tim R=C3=BChsen &lt;<a href=3D"mailto:tim.ruehsen@gmx.=
de" target=3D"_blank">tim.ruehsen@gmx.de</a>&gt;<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.co=
m" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/Makefile.am | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/src/Makefile.am b/src/Makefile.am<br>
&gt; -index 5bf3622..4459767 100644<br>
&gt; ---- a/src/Makefile.am<br>
&gt; -+++ b/src/Makefile.am<br>
&gt; -@@ -21,7 +21,7 @@ AM_CPPFLAGS =3D -I$(top_builddir)/lib/includes -I$(=
top_srcdir)/lib/includes \<br>
&gt; -=C2=A0 -I$(top_builddir)/lib/gl -I$(top_srcdir)/lib/gl $(CODE_COVERAG=
E_CPPFLAGS)<br>
&gt; -<br>
&gt; - LDADD =3D ../lib/<a href=3D"http://libtasn1.la" rel=3D"noreferrer" t=
arget=3D"_blank">libtasn1.la</a><br>
&gt; --LDFLAGS =3D $(CODE_COVERAGE_LDFLAGS)<br>
&gt; -+AM_LDFLAGS =3D $(CODE_COVERAGE_LDFLAGS)<br>
&gt; -<br>
&gt; - bin_PROGRAMS =3D asn1Parser asn1Coding asn1Decoding<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.21.0<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.=
14.bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.14.bb</a> b/meta/rec=
ipes-support/gnutls/<a href=3D"http://libtasn1_4.15.0.bb" rel=3D"noreferrer=
" target=3D"_blank">libtasn1_4.15.0.bb</a><br>
&gt; similarity index 71%<br>
&gt; rename from meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.1=
4.bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.14.bb</a><br>
&gt; rename to meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.15.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.15.0.bb</a><br>
&gt; index ef2c1956a24..cd00d17b803 100644<br>
&gt; --- a/meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.14.bb" =
rel=3D"noreferrer" target=3D"_blank">libtasn1_4.14.bb</a><br>
&gt; +++ b/meta/recipes-support/gnutls/<a href=3D"http://libtasn1_4.15.0.bb=
" rel=3D"noreferrer" target=3D"_blank">libtasn1_4.15.0.bb</a><br>
&gt; @@ -10,15 +10,18 @@ LIC_FILES_CHKSUM =3D &quot;file://doc/COPYING;md5=
=3Dd32239bcb673463ab874e80d47fae504 \<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://dont-depend-on-h=
elp2man.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-ldflags.patch \<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fix-gtkdoc.patch \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;bison-native&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;e9918200ed4a778e2b3cbe34c1be4205&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;9e604ba5c5c8ea403487695c2e407405820d9854=
0d9de884d6e844f9a9c5ba08&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;33e3fb5501bb2142184238c815b0beb8&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;dd77509fe8f5304deafbca654dc7f0ea57f5841f=
41ba530cff9a5bf71382739e&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit autotools texinfo lib_package gtk-doc<br>
&gt;<br>
&gt; +do_install_append () {<br>
&gt; +=C2=A0 =C2=A0 # this utility is not useful and has a bogus RPATH<br>
<br>
if bogus rpath is the reason to delete it then its better to nick it<br>
with chrpath --delete<br>
<br>
&gt; +=C2=A0 =C2=A0 rm ${D}/${bindir}/corpus2array<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ffebfb059908efd6--
