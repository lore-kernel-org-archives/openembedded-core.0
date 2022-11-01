Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3125BC433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 15:18:11 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web08.7672.1667315880717575506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 08:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U6D/Xwiv;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id b2so37866756eja.6
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 08:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yb9axKfP9jABz+QICcJbc8fdQJYnJ7WbN2otnhtZZds=;
        b=U6D/Xwiva1I5z2nA4i0RvFxN3Mgk1X4vEjOZ3wsyorDiZFPxOht3oLgAPj/JXBcRYl
         DKibygfyQRa9t6NfjXhkvEF54e9Y9sEn5SvVZLkv0Pn2/Zu1j6E79SYl8IZHTpXchU0b
         Au2/WybONReiijU4GHcmCjOo30FRZE89DzTW5BnMkWQ9m6vkDXD3L3EAmNzXC810Jujp
         +QLnNki1PYtxoXN8Wphe8acVWm8D8n+953SXm0l8bOWN4+/SUcJmM/vHpZpvEWR9QQMD
         jAVi141+vPPNb8OZ8+7TagQCZwpA3E0L3YPeBAeaqtemdMOIU61LREMU7XthJ0/DaGF0
         9tCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yb9axKfP9jABz+QICcJbc8fdQJYnJ7WbN2otnhtZZds=;
        b=Grkt35bdX9JzvL4OX/f1YM+fS3CezkA8DV4NLraIYHhKO9XgjKIT5yVw2BkbvX6quM
         QHTZlh4zfBLdoUBhRvWzc1u393B/zf8VjIH4XCWblaTWVgDr4T7//J2PAOXf72z23rj2
         Gwdc9vcqYLYd/BwLxUXF58Pg/YqYl9xVMhkNW83GSBfAiQ4ypA9DYzg0iDbg2qE6kgMd
         IA+Jhj7d/z7iwBkVEbt5yXYuP+Ff9kiuiyoqCvL0t1Ea9t9cyKQbi4n/qP7DfvXoJOSa
         0jWGZXoFTNTHNmi06CHDcyGQs0K4Sp1rJM+b4bvRY2QvoZWj0aRf6xWGj/HxQxwj4QiD
         viVw==
X-Gm-Message-State: ACrzQf3/N6/naYV+t+VS7VVlxoM3xlX4qhaMG9xMGtJX4BUxb0OKxBh5
	U5xIxFdEN0jvW33iOyXWT1vvf8LG8x1jmQEXIaQ=
X-Google-Smtp-Source: AMsMyM7E/CvQhm2Q1VmCEQ7foH6qXeReVSTCp8eBLloei54KnafozS19OFNeMQWfSmxxIN1CPUEunUa9qhGdyD9iloU=
X-Received: by 2002:a17:907:3207:b0:741:3a59:738d with SMTP id
 xg7-20020a170907320700b007413a59738dmr18598974ejb.110.1667315878911; Tue, 01
 Nov 2022 08:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221027083541.1757707-1-narpat.mali@windriver.com>
In-Reply-To: <20221027083541.1757707-1-narpat.mali@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 1 Nov 2022 08:17:47 -0700
Message-ID: <CANx9H-AzEchfTH796JGdD1AFRAa3zYD6wBDmWU3JYQiX+VVzvw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] python3-mako: upgrade 1.1.6 -> 1.2.0
To: Narpat Mali <narpat.mali@windriver.com>
Cc: openembedded-core@lists.openembedded.org, archana.polampalli@windriver.com, 
	hari.gpillai@windriver.com, Alexander Kanavin <alex@linutronix.de>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000b0e4c405ec6a3a29"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 15:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172363

--000000000000b0e4c405ec6a3a29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This would break stable policy as it includes new features:

https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.0

1.2.0 <https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.0=
>
Released: Thu Mar 10 2022 changed
<https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.0-chang=
ed>

   -

   *[changed] [py3k]*
   <https://docs.makotemplates.org/en/latest/changelog.html#change-0dbd7512=
3f8119e63fdcc0a442bc5113>

   Corrected =E2=80=9Cuniversal wheel=E2=80=9D directive in setup.cfg so th=
at building a
   wheel does not target Python 2.

   References: #351 <https://github.com/sqlalchemy/mako/issues/351>

   -

   *[changed] [py3k]*
   <https://docs.makotemplates.org/en/latest/changelog.html#change-8485f890=
cb72df59b5f3f4bf19db2252>

   The bytestring_passthrough template argument is removed, as this flag
   only applied to Python 2.

   -

   *[changed] [py3k]*
   <https://docs.makotemplates.org/en/latest/changelog.html#change-2ce5a2bc=
81c4690be5216769085a6721>

   With the removal of Python 2=E2=80=99s cStringIO, Mako now uses its own =
internal
   FastEncodingBuffer exclusively.

   -

   *[changed] [py3k]*
   <https://docs.makotemplates.org/en/latest/changelog.html#change-54c870bf=
a9e0a339f1334434165e87ea>

   Removed disable_unicode flag, that=E2=80=99s no longer used in Python 3.

   -

   *[changed]*
   <https://docs.makotemplates.org/en/latest/changelog.html#change-0900c030=
3cb688a6d1702244e22320b2>

   Refactored test utilities into mako.testing module. Removed
   unittest.TestCase dependency in favor of pytest.

   References: #349 <https://github.com/sqlalchemy/mako/issues/349>

   -

   *[changed] [setup]*
   <https://docs.makotemplates.org/en/latest/changelog.html#change-0007ecb8=
22c473326561cd0f9d7cb35c>

   Replaced the use of pkg_resources with the importlib library. For Python
   < 3.8 the library importlib_metadata is used.

   -

   *[changed] [py3k]*
   <https://docs.makotemplates.org/en/latest/changelog.html#change-e9b48a2c=
87837a89fc445f43f2ea0b62>

   Removed support for Python 2 and Python 3.6. Mako now requires Python >=
=3D
   3.7.


bug
<https://docs.makotemplates.org/en/latest/changelog.html#change-1.2.0-bug>

   -

   *[bug] [py3k]*
   <https://docs.makotemplates.org/en/latest/changelog.html#change-cc67f729=
bc0307e8fae39f27e355c7aa>

   Mako now performs exception chaining using raise from, correctly
   identifying underlying exception conditions when it raises its own
   exceptions. Pull request courtesy Ram Rachum.


On Thu, Oct 27, 2022 at 1:38 AM Narpat Mali <narpat.mali@windriver.com>
wrote:

> License-Update: copyright years
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> Upstream master commit:
>
> https://git.openembedded.org/openembedded-core/commit/?id=3Df273900e846b8=
ac416c9d579db32a08c2f34141e
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  .../python/{python3-mako_1.1.6.bb =3D> python3-mako_1.2.0.bb} | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-mako_1.1.6.bb =3D>
> python3-mako_1.2.0.bb} (59%)
>
> diff --git a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
> b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
> similarity index 59%
> rename from meta/recipes-devtools/python/python3-mako_1.1.6.bb
> rename to meta/recipes-devtools/python/python3-mako_1.2.0.bb
> index 71e5d96ba1..11e5f326bd 100644
> --- a/meta/recipes-devtools/python/python3-mako_1.1.6.bb
> +++ b/meta/recipes-devtools/python/python3-mako_1.2.0.bb
> @@ -2,16 +2,18 @@ SUMMARY =3D "Templating library for Python"
>  HOMEPAGE =3D "http://www.makotemplates.org/"
>  SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D943eb67718222db21d44a4ef18366=
75f"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db32291f107a8f1ea94c4a41e00a6a=
18d"
>
>  PYPI_PACKAGE =3D "Mako"
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI[sha256sum] =3D
> "4e9e345a41924a954251b95b4b28e14a301145b544901332e658907a7464b6b2"
> +SRC_URI[sha256sum] =3D
> "9a7c7e922b87db3686210cf49d5d767033a41d4010b284e747682c92bddd8b39"
>
>  RDEPENDS:${PN} =3D "${PYTHON_PN}-html \
> +                  ${PYTHON_PN}-markupsafe \
>                    ${PYTHON_PN}-netclient \
> +                  ${PYTHON_PN}-pygments \
>                    ${PYTHON_PN}-threading \
>  "
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172188):
> https://lists.openembedded.org/g/openembedded-core/message/172188
> Mute This Topic: https://lists.openembedded.org/mt/94600007/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b0e4c405ec6a3a29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This would break stable policy as it includes new fea=
tures:</div><div><br></div><div><a href=3D"https://docs.makotemplates.org/e=
n/latest/changelog.html#change-1.2.0">https://docs.makotemplates.org/en/lat=
est/changelog.html#change-1.2.0</a></div><div><br></div><div><h3 class=3D"g=
mail-release-version">1.2.0<a class=3D"gmail-headerlink" href=3D"https://do=
cs.makotemplates.org/en/latest/changelog.html#change-1.2.0" title=3D"Permal=
ink to this heading"></a></h3>
Released: Thu Mar 10 2022
<h4>changed<a class=3D"gmail-headerlink" href=3D"https://docs.makotemplates=
.org/en/latest/changelog.html#change-1.2.0-changed" title=3D"Permalink to t=
his heading"></a></h4>
<ul class=3D"gmail-simple"><li><p class=3D"gmail-caption" id=3D"gmail-chang=
e-1.2.0-0"><span class=3D"gmail-target" id=3D"gmail-change-0dbd75123f8119e6=
3fdcc0a442bc5113"><strong>[changed] [py3k]</strong> <a class=3D"gmail-chang=
elog-reference gmail-headerlink gmail-reference gmail-internal" href=3D"htt=
ps://docs.makotemplates.org/en/latest/changelog.html#change-0dbd75123f8119e=
63fdcc0a442bc5113"></a></span></p><p>Corrected =E2=80=9Cuniversal wheel=E2=
=80=9D directive in <code class=3D"gmail-docutils gmail-literal gmail-notra=
nslate"><span class=3D"gmail-pre">setup.cfg</span></code> so that building =
a
wheel does not target Python 2.</p>
<p>References: <a class=3D"gmail-reference external" href=3D"https://github=
.com/sqlalchemy/mako/issues/351">#351</a></p>
<p></p>
</li><li><p class=3D"gmail-caption" id=3D"gmail-change-1.2.0-1"><span class=
=3D"gmail-target" id=3D"gmail-change-8485f890cb72df59b5f3f4bf19db2252"><str=
ong>[changed] [py3k]</strong> <a class=3D"gmail-changelog-reference gmail-h=
eaderlink gmail-reference gmail-internal" href=3D"https://docs.makotemplate=
s.org/en/latest/changelog.html#change-8485f890cb72df59b5f3f4bf19db2252"></a=
></span></p><p>The <code class=3D"gmail-docutils gmail-literal gmail-notran=
slate"><span class=3D"gmail-pre">bytestring_passthrough</span></code> templ=
ate argument is removed, as this
flag only applied to Python 2.</p>
<p></p>
<p></p>
</li><li><p class=3D"gmail-caption" id=3D"gmail-change-1.2.0-2"><span class=
=3D"gmail-target" id=3D"gmail-change-2ce5a2bc81c4690be5216769085a6721"><str=
ong>[changed] [py3k]</strong> <a class=3D"gmail-changelog-reference gmail-h=
eaderlink gmail-reference gmail-internal" href=3D"https://docs.makotemplate=
s.org/en/latest/changelog.html#change-2ce5a2bc81c4690be5216769085a6721"></a=
></span></p><p>With the removal of Python 2=E2=80=99s <code class=3D"gmail-=
docutils gmail-literal gmail-notranslate"><span class=3D"gmail-pre">cString=
IO</span></code>, Mako now uses its own
internal <code class=3D"gmail-docutils gmail-literal gmail-notranslate"><sp=
an class=3D"gmail-pre">FastEncodingBuffer</span></code> exclusively.</p>
<p></p>
<p></p>
</li><li><p class=3D"gmail-caption" id=3D"gmail-change-1.2.0-3"><span class=
=3D"gmail-target" id=3D"gmail-change-54c870bfa9e0a339f1334434165e87ea"><str=
ong>[changed] [py3k]</strong> <a class=3D"gmail-changelog-reference gmail-h=
eaderlink gmail-reference gmail-internal" href=3D"https://docs.makotemplate=
s.org/en/latest/changelog.html#change-54c870bfa9e0a339f1334434165e87ea"></a=
></span></p><p>Removed <code class=3D"gmail-docutils gmail-literal gmail-no=
translate"><span class=3D"gmail-pre">disable_unicode</span></code> flag, th=
at=E2=80=99s no longer used in Python 3.</p>
<p></p>
<p></p>
</li><li><p class=3D"gmail-caption" id=3D"gmail-change-1.2.0-4"><span class=
=3D"gmail-target" id=3D"gmail-change-0900c0303cb688a6d1702244e22320b2"><str=
ong>[changed]</strong> <a class=3D"gmail-changelog-reference gmail-headerli=
nk gmail-reference gmail-internal" href=3D"https://docs.makotemplates.org/e=
n/latest/changelog.html#change-0900c0303cb688a6d1702244e22320b2"></a></span=
></p><p>Refactored test utilities into <code class=3D"gmail-docutils gmail-=
literal gmail-notranslate"><span class=3D"gmail-pre">mako.testing</span></c=
ode> module. Removed
<code class=3D"gmail-docutils gmail-literal gmail-notranslate"><span class=
=3D"gmail-pre">unittest.TestCase</span></code> dependency in favor of <code=
 class=3D"gmail-docutils gmail-literal gmail-notranslate"><span class=3D"gm=
ail-pre">pytest</span></code>.</p>
<p>References: <a class=3D"gmail-reference external" href=3D"https://github=
.com/sqlalchemy/mako/issues/349">#349</a></p>
<p></p>
</li><li><p class=3D"gmail-caption" id=3D"gmail-change-1.2.0-5"><span class=
=3D"gmail-target" id=3D"gmail-change-0007ecb822c473326561cd0f9d7cb35c"><str=
ong>[changed] [setup]</strong> <a class=3D"gmail-changelog-reference gmail-=
headerlink gmail-reference gmail-internal" href=3D"https://docs.makotemplat=
es.org/en/latest/changelog.html#change-0007ecb822c473326561cd0f9d7cb35c"></=
a></span></p><p>Replaced the use of <code class=3D"gmail-docutils gmail-lit=
eral gmail-notranslate"><span class=3D"gmail-pre">pkg_resources</span></cod=
e> with the <code class=3D"gmail-docutils gmail-literal gmail-notranslate">=
<span class=3D"gmail-pre">importlib</span></code> library.
For Python &lt; 3.8 the library <code class=3D"gmail-docutils gmail-literal=
 gmail-notranslate"><span class=3D"gmail-pre">importlib_metadata</span></co=
de> is used.</p>
<p></p>
<p></p>
</li><li><p class=3D"gmail-caption" id=3D"gmail-change-1.2.0-6"><span class=
=3D"gmail-target" id=3D"gmail-change-e9b48a2c87837a89fc445f43f2ea0b62"><str=
ong>[changed] [py3k]</strong> <a class=3D"gmail-changelog-reference gmail-h=
eaderlink gmail-reference gmail-internal" href=3D"https://docs.makotemplate=
s.org/en/latest/changelog.html#change-e9b48a2c87837a89fc445f43f2ea0b62"></a=
></span></p><p>Removed support for Python 2 and Python 3.6. Mako now requir=
es Python &gt;=3D
3.7.</p>
<p></p>
<p></p>
</li></ul>


<h4>bug<a class=3D"gmail-headerlink" href=3D"https://docs.makotemplates.org=
/en/latest/changelog.html#change-1.2.0-bug" title=3D"Permalink to this head=
ing"></a></h4>
<ul class=3D"gmail-simple"><li><p class=3D"gmail-caption" id=3D"gmail-chang=
e-1.2.0-7"><span class=3D"gmail-target" id=3D"gmail-change-cc67f729bc0307e8=
fae39f27e355c7aa"><strong>[bug] [py3k]</strong> <a class=3D"gmail-changelog=
-reference gmail-headerlink gmail-reference gmail-internal" href=3D"https:/=
/docs.makotemplates.org/en/latest/changelog.html#change-cc67f729bc0307e8fae=
39f27e355c7aa"></a></span></p><p>Mako now performs exception chaining using=
 <code class=3D"gmail-docutils gmail-literal gmail-notranslate"><span class=
=3D"gmail-pre">raise</span> <span class=3D"gmail-pre">from</span></code>, c=
orrectly
identifying underlying exception conditions when it raises its own
exceptions. Pull request courtesy Ram Rachum.</p></li></ul></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oc=
t 27, 2022 at 1:38 AM Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriv=
er.com">narpat.mali@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">License-Update: copyright years<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
Signed-off-by: Luca Ceresoli &lt;<a href=3D"mailto:luca.ceresoli@bootlin.co=
m" target=3D"_blank">luca.ceresoli@bootlin.com</a>&gt;<br>
<br>
Upstream master commit:<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3Df273=
900e846b8ac416c9d579db32a08c2f34141e" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3Df273900e846b8ac=
416c9d579db32a08c2f34141e</a><br>
<br>
Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com"=
 target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../python/{<a href=3D"http://python3-mako_1.1.6.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-mako_1.1.6.bb</a> =3D&gt; <a href=3D"http://py=
thon3-mako_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.=
0.bb</a>} | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-mako_1=
.1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.1.6.bb</a> =3D=
&gt; <a href=3D"http://python3-mako_1.2.0.bb" rel=3D"noreferrer" target=3D"=
_blank">python3-mako_1.2.0.bb</a>} (59%)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.=
1.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.1.6.bb</a> b/me=
ta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-mako_1.2.0.bb</a><br>
similarity index 59%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.1=
.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.1.6.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.0.bb</a><br>
index 71e5d96ba1..11e5f326bd 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.1.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-mako_1.1.6.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-mako_1.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-mako_1.2.0.bb</a><br>
@@ -2,16 +2,18 @@ SUMMARY =3D &quot;Templating library for Python&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.makotemplates.org/" rel=3D"n=
oreferrer" target=3D"_blank">http://www.makotemplates.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D943eb67718222db21d44a4ef18=
36675f&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db32291f107a8f1ea94c4a41e00=
a6a18d&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;Mako&quot;<br>
<br>
=C2=A0inherit pypi python_setuptools_build_meta<br>
<br>
-SRC_URI[sha256sum] =3D &quot;4e9e345a41924a954251b95b4b28e14a301145b544901=
332e658907a7464b6b2&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9a7c7e922b87db3686210cf49d5d767033a41d4010b28=
4e747682c92bddd8b39&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-html \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN=
}-markupsafe \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTH=
ON_PN}-netclient \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN=
}-pygments \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTH=
ON_PN}-threading \<br>
=C2=A0&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#172188): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/172188" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/172188</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94600007/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
94600007/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b0e4c405ec6a3a29--

