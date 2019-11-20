Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 139FB7F3B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 12:10:24 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id n9so16651587vsa.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 04:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e9G9h8xIj0vuFYlHS3mE2lnS3BxJTbDCJVVfLkOi12c=;
	b=R8yoggZzmdS2+GcXqFFvpB80A/2zYxCzAH1B1OzgHInYc5Pi2ixElRzKUX7lQHJ29H
	4Gmjf67C1wNYpskvOtT0DmealsfuR5wWB3dGr4WA45gDE/DJN+tGdEitiV+znpnE0el2
	6ZPA1qc6PNIAZF+2Yfi4bzvjTyZmnHUVPKllxbU+32PC4SUzfZ3dGCa4EMO1CVRARu+K
	UdHdHxXYoej4oGlKUFQdAnDN5A+YLdNHZJDg8xKxliywgu/fJZmreN/WZiGltpth4Iav
	c4kvamRvm0VpI8wC34qisiySYhJurYMB5wpw0fQ1G86PrJAV0b2+vK5BI9Sewm82gga/
	yjRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e9G9h8xIj0vuFYlHS3mE2lnS3BxJTbDCJVVfLkOi12c=;
	b=TE1VLI4xVVfU3tWMlRJbEsgtUWJuzpUaMMMZVxQJDl+n0AcnWNe++gH2b/TQnGAz+A
	eH0slGolmk575pf1Ckc8TpNA+s++VtEb8n5k8pY/f4kKU5l/vm9U+wA+OA7SizoXMo2T
	hV6c7uhzq6+HYYdMfn7bqNiFB4cynhJMbCxob+wCTU6J6EY6+cG4agTxH9IWLsnD2Ik4
	av+54r3UGvo7LMw/KwcVbKlPno4vtebi4BSZITo0cAfSGIR3mVdWPwxpqAodooZokcuO
	TXlZ4vRzgVj0s0fXcTt6aryxtoo5mTEuUyD1M8+RRuw40+YzdQaMZlt9Ii5J2IT2xRkC
	tpoQ==
X-Gm-Message-State: APjAAAVtY3AZ9vYNUCUmTnDFPFXTiezaK/9VUQRV4LljgFLAzvUsx8He
	TIN/bt8ybGSx+YrssaQ9EqrsgC7PR1HfSBVKW2Q=
X-Google-Smtp-Source: APXvYqy2+j7pvO0CTF0hNxfN/9hmo0909NsylE7lyCxSwN+8bvdXyENji3rJK+DpJLJ14TOwCpeFBiT5zYy3WjJg4GQ=
X-Received: by 2002:a67:f44b:: with SMTP id r11mr1372122vsn.23.1574251825842; 
	Wed, 20 Nov 2019 04:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20191120051704.24066-1-zangrc.fnst@cn.fujitsu.com>
	<7620b40b6ba965474794d7a4b9b280c8c5a849bf.camel@intel.com>
In-Reply-To: <7620b40b6ba965474794d7a4b9b280c8c5a849bf.camel@intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Nov 2019 13:10:14 +0100
Message-ID: <CANNYZj9mjTQyz=dWVcGwSAucHAbkYtBfMaGCEMZ5FFtsRS=r=w@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>, Tanu Kaskinen <tanuk@iki.fi>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib:upgrade 1.1.9 -> 1.2.1.1
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
X-List-Received-Date: Wed, 20 Nov 2019 12:10:25 -0000
Content-Type: multipart/alternative; boundary="000000000000ddd0460597c61076"

--000000000000ddd0460597c61076
Content-Type: text/plain; charset="UTF-8"

If Tanu is still around, he should probably chime in.

Alex

On Wed, 20 Nov 2019 at 12:55, Mittal, Anuj <anuj.mittal@intel.com> wrote:

> This version has moved ucm and topology conf files to separate
> repositories. We should also probably fetch and package those.
>
>
> https://github.com/alsa-project/alsa-lib/commit/1f37ba2a2b1c07c04de1c368cd4943f712cccfa5
>
>
> https://github.com/alsa-project/alsa-lib/commit/cdc8aacbb57c82a81e3b398f2ede6440d49334a5
>
> Thanks,
>
> Anuj
>
> On Wed, 2019-11-20 at 13:17 +0800, Zang Ruochen wrote:
> > The following error occurred during the steps of do-configure:
> > > Fixing libtool for -rpath problems.
> > > ../alsa-lib-1.2.1.1/configure: line 16567: libtool: No such file or
> > > directory
> > > mv: cannot stat 'libtool-2': No such file or directory
> > > chmod: cannot access 'libtool': No such file or directory
> >
> > add alsa-lib/0001-Fix-problem-with-libtool-not-found.patch to fix it.
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >  ...1-Fix-problem-with-libtool-not-found.patch | 31
> > +++++++++++++++++++
> >  ...{alsa-lib_1.1.9.bb => alsa-lib_1.2.1.1.bb} |  8 +++--
> >  2 files changed, 36 insertions(+), 3 deletions(-)
> >  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-
> > problem-with-libtool-not-found.patch
> >  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.9.bb => alsa-
> > lib_1.2.1.1.bb} (83%)
> >
> > diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-problem-
> > with-libtool-not-found.patch b/meta/recipes-multimedia/alsa/alsa-
> > lib/0001-Fix-problem-with-libtool-not-found.patch
> > new file mode 100644
> > index 0000000000..5fb84cd6f8
> > --- /dev/null
> > +++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-problem-with-
> > libtool-not-found.patch
> > @@ -0,0 +1,31 @@
> > +From f419276a716daf8d98846b3df50995e5ac030134 Mon Sep 17 00:00:00
> > 2001
> > +From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > +Date: Wed, 20 Nov 2019 11:24:17 +0800
> > +Subject: [PATCH] Fix problem with libtool not found
> > +
> > +Upstream-Status: Inappropriate
> > +Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > +---
> > + configure.ac | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index 35eb315..548b9ea 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -769,9 +769,9 @@ dnl Taken from
> > https://wiki.debian.org/RpathIssue
> > + case $host in
> > +    *-*-linux-gnu)
> > +    AC_MSG_RESULT([Fixing libtool for -rpath problems.])
> > +-   sed < libtool > libtool-2 \
> > ++   sed < "$srcdir"/libtool > "$srcdir"/libtool-2 \
> > +      's/^hardcode_libdir_flag_spec.*$'/'hardcode_libdir_flag_spec="
> > -D__LIBTOOL_IS_A_FOOL__ "/'
> > +-   mv libtool-2 libtool
> > +-   chmod 755 libtool
> > ++   mv "$srcdir"/libtool-2 "$srcdir"/libtool
> > ++   chmod 755 "$srcdir"/libtool
> > +  ;;
> > + esac
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
> > b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.1.bb
> > similarity index 83%
> > rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
> > rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.1.1.bb
> > index 2c63ee7522..56544b0d45 100644
> > --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
> > +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.1.bb
> > @@ -7,9 +7,11 @@ LIC_FILES_CHKSUM = "
> > file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
> >                      file://src/socket.c;md5=dd1bc7f44872690224d89c1a
> > 9806e495;beginline=1;endline=26 \
> >                      "
> >
> > -SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
> > -SRC_URI[md5sum] = "e6d429dbdcfaa0f034d907fa6dc3735e"
> > -SRC_URI[sha256sum] =
> > "488373aef5396682f3a411a6d064ae0ad196b9c96269d0bb912fbdeec94b994b"
> > +SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2
> > \
> > +           file://0001-Fix-problem-with-libtool-not-found.patch \
> > +          "
> > +SRC_URI[md5sum] = "1d428f46d6160f5e4bbdd64a2ff34f45"
> > +SRC_URI[sha256sum] =
> > "c95ac63c0aad43a6ac457d960569096b0b2ef72dc4e3737e77e3e2de87022cec"
> >
> >  inherit autotools pkgconfig
> >
> > --
> > 2.20.1
> >
> >
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000ddd0460597c61076
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>If Tanu is still around, he should probably chime in.=
</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 20 Nov 2019 at 12:55, Mitta=
l, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@intel.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">T=
his version has moved ucm and topology conf files to separate<br>
repositories. We should also probably fetch and package those.<br>
<br>
<a href=3D"https://github.com/alsa-project/alsa-lib/commit/1f37ba2a2b1c07c0=
4de1c368cd4943f712cccfa5" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/alsa-project/alsa-lib/commit/1f37ba2a2b1c07c04de1c368cd4943f712cccfa=
5</a><br>
<br>
<a href=3D"https://github.com/alsa-project/alsa-lib/commit/cdc8aacbb57c82a8=
1e3b398f2ede6440d49334a5" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/alsa-project/alsa-lib/commit/cdc8aacbb57c82a81e3b398f2ede6440d49334a=
5</a><br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
On Wed, 2019-11-20 at 13:17 +0800, Zang Ruochen wrote:<br>
&gt; The following error occurred during the steps of do-configure:<br>
&gt; &gt; Fixing libtool for -rpath problems.<br>
&gt; &gt; ../alsa-lib-1.2.1.1/configure: line 16567: libtool: No such file =
or<br>
&gt; &gt; directory<br>
&gt; &gt; mv: cannot stat &#39;libtool-2&#39;: No such file or directory<br=
>
&gt; &gt; chmod: cannot access &#39;libtool&#39;: No such file or directory=
<br>
&gt; <br>
&gt; add alsa-lib/0001-Fix-problem-with-libtool-not-found.patch to fix it.<=
br>
&gt; <br>
&gt; Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujit=
su.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...1-Fix-problem-with-libtool-not-found.patch | 31<br>
&gt; +++++++++++++++++++<br>
&gt;=C2=A0 ...{<a href=3D"http://alsa-lib_1.1.9.bb" rel=3D"noreferrer" targ=
et=3D"_blank">alsa-lib_1.1.9.bb</a> =3D&gt; <a href=3D"http://alsa-lib_1.2.=
1.1.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.2.1.1.bb</a>} |=C2=
=A0 8 +++--<br>
&gt;=C2=A0 2 files changed, 36 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-Fi=
x-<br>
&gt; problem-with-libtool-not-found.patch<br>
&gt;=C2=A0 rename meta/recipes-multimedia/alsa/{<a href=3D"http://alsa-lib_=
1.1.9.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.9.bb</a> =3D&gt=
; alsa-<br>
&gt; <a href=3D"http://lib_1.2.1.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>lib_1.2.1.1.bb</a>} (83%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-problem-<b=
r>
&gt; with-libtool-not-found.patch b/meta/recipes-multimedia/alsa/alsa-<br>
&gt; lib/0001-Fix-problem-with-libtool-not-found.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5fb84cd6f8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-problem-with-<br>
&gt; libtool-not-found.patch<br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +From f419276a716daf8d98846b3df50995e5ac030134 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.com" =
target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; +Date: Wed, 20 Nov 2019 11:24:17 +0800<br>
&gt; +Subject: [PATCH] Fix problem with libtool not found<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate<br>
&gt; +Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuji=
tsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 6 +++---<br>
&gt; + 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
&gt; +index 35eb315..548b9ea 100644<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -769,9 +769,9 @@ dnl Taken from <br>
&gt; <a href=3D"https://wiki.debian.org/RpathIssue" rel=3D"noreferrer" targ=
et=3D"_blank">https://wiki.debian.org/RpathIssue</a><br>
&gt; + case $host in<br>
&gt; +=C2=A0 =C2=A0 *-*-linux-gnu)<br>
&gt; +=C2=A0 =C2=A0 AC_MSG_RESULT([Fixing libtool for -rpath problems.])<br=
>
&gt; +-=C2=A0 =C2=A0sed &lt; libtool &gt; libtool-2 \<br>
&gt; ++=C2=A0 =C2=A0sed &lt; &quot;$srcdir&quot;/libtool &gt; &quot;$srcdir=
&quot;/libtool-2 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 &#39;s/^hardcode_libdir_flag_spec.*$&#39;/&#39;h=
ardcode_libdir_flag_spec=3D&quot;<br>
&gt; -D__LIBTOOL_IS_A_FOOL__ &quot;/&#39;<br>
&gt; +-=C2=A0 =C2=A0mv libtool-2 libtool<br>
&gt; +-=C2=A0 =C2=A0chmod 755 libtool<br>
&gt; ++=C2=A0 =C2=A0mv &quot;$srcdir&quot;/libtool-2 &quot;$srcdir&quot;/li=
btool<br>
&gt; ++=C2=A0 =C2=A0chmod 755 &quot;$srcdir&quot;/libtool<br>
&gt; +=C2=A0 ;;<br>
&gt; + esac<br>
&gt; +-- <br>
&gt; +2.20.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1=
.1.9.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.9.bb</a><br>
&gt; b/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.2.1.1.bb" =
rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.2.1.1.bb</a><br>
&gt; similarity index 83%<br>
&gt; rename from meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.=
1.9.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.9.bb</a><br>
&gt; rename to meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.2.=
1.1.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.2.1.1.bb</a><br>
&gt; index 2c63ee7522..56544b0d45 100644<br>
&gt; --- a/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.1.9.bb=
" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.1.9.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.2.1.1.=
bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.2.1.1.bb</a><br>
&gt; @@ -7,9 +7,11 @@ LIC_FILES_CHKSUM =3D &quot;<br>
&gt; file://COPYING;md5=3Da916467b91076e631dd8edb7424769c7 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://src/socket.c;md5=3Ddd1bc7f44872690224d89c1a<br>
&gt; 9806e495;beginline=3D1;endline=3D26 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;=C2=A0 <br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://www.alsa-project.org/files/pub/l=
ib/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https://www.alsa=
-project.org/files/pub/lib/${BP}.tar.bz2</a>&quot;<br>
&gt; -SRC_URI[md5sum] =3D &quot;e6d429dbdcfaa0f034d907fa6dc3735e&quot;<br>
&gt; -SRC_URI[sha256sum] =3D<br>
&gt; &quot;488373aef5396682f3a411a6d064ae0ad196b9c96269d0bb912fbdeec94b994b=
&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://www.alsa-project.org/files/pub/l=
ib/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https://www.alsa=
-project.org/files/pub/lib/${BP}.tar.bz2</a><br>
&gt; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-problem-with=
-libtool-not-found.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;1d428f46d6160f5e4bbdd64a2ff34f45&quot;<br>
&gt; +SRC_URI[sha256sum] =3D<br>
&gt; &quot;c95ac63c0aad43a6ac457d960569096b0b2ef72dc4e3737e77e3e2de87022cec=
&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 inherit autotools pkgconfig<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000ddd0460597c61076--
