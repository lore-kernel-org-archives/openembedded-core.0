Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC56ECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 04:44:23 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.10313.1662266658395327209
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 21:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=evLsRjbw;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id g7so8813489lfe.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 21:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=akorTYrvwkaq42pdjo8Rse4lWyNHc15nVf9lyfUytL0=;
        b=evLsRjbwj48jeHhMlPahBQ6DSAgli+VJUlPutd4ckzsrBhv/CYn41Av3+v6CrDXbzH
         s5/RuKfFEqy3HQzaGr/RDVw77zSgYDYIw5orPd9WYQfBuGEXXZzkt0nahhz+1GAJa9FF
         UYyHO+6lIO8gTuE05ibpzfzIuei5X0iZiV587+FQUMbvJYvyzx06Gvr77+qgTF51ecF7
         1eclrzQU0En5OEQRXnlIEZ4MeWsStExTP29ijLIsOJytMypWOpASJMkzK98wLP5R6mtN
         6BXxUvgLJiwh2njSI7nBcyZw7Xap9VIqz89Eyh0tZ3kq3smmHdC3xX+56DKAQgZcoHZQ
         gZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=akorTYrvwkaq42pdjo8Rse4lWyNHc15nVf9lyfUytL0=;
        b=736d7AE3/qgaOtp2u//pCLK2GadNypwDYD8NJBXsIuo1UDa+x1ZCAB/Awves0Y90Io
         ZnJU+mwsHzgJNerJ0yQaeK8YTfm3axL1JofiBCAWtRW6nYJnMPHW3fvRpB9qR7+Bn34K
         FrQDUxs0CzfRD1PJGujpvM+91QxNdyHfwsXlVT6qieNkEZaaYczq4iDXvUiHOZfRobIL
         MV/oa9fRlIbqdUEqBHTluQxoNerk05j+Ybmx+MbEUsNUnoGbXoCJL4JUX2NGg051FSbg
         XFf5mLNW3q09HJCPSJw23u7JQ+48jOJu1eHRV6pWdWvreoMLEmKRkDUaK5xbBr9smg+4
         NqqA==
X-Gm-Message-State: ACgBeo3foGgRclMHwN3ttp4Q71Yj8zGjOIZn3w2o+fwHtTzRu0cJEeuI
	oEFSFHPj54U5DZIpr4LYUNtntBxoFSWc7aGvzV4=
X-Google-Smtp-Source: 
 AA6agR7EIxlHNSEiVPtz52fcDWY8Bz4Smmoh87wG2QqB5dMP+L+l4NRmTKQQFhVEz2wMeZWbEDU0DLSfE28syJ0ppzY=
X-Received: by 2002:a05:6512:33c9:b0:494:79c1:8ea1 with SMTP id
 d9-20020a05651233c900b0049479c18ea1mr7291428lfg.26.1662266656481; Sat, 03 Sep
 2022 21:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220903174558.66575-1-raj.khem@gmail.com>
In-Reply-To: <20220903174558.66575-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 4 Sep 2022 06:44:05 +0200
Message-ID: 
 <CANNYZj_uku5yuHL_4k+Kr_sFCWOYAJB5-4VdVTMp_013itMykw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-lxml: Add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000094e55c05e7d29dc2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 04:44:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170272

--00000000000094e55c05e7d29dc2
Content-Type: text/plain; charset="UTF-8"

But why move the recipe to core? Why not meta-oe?

Alex

On Sat 3. Sep 2022 at 19.46, Khem Raj <raj.khem@gmail.com> wrote:

> Import this recipe from meta-python, as it is needed by many recipes
> from different layers e.g. wireplumber from meta-multimedia,
> opengl-es-cts and vulkan-cts in meta-oe, yelp-tools in meta-gnome to
> name a few, the real issue is that newer vulkan-cts has added this
> dependency which is in meta-oe, and meta-oe can not depend on
> meta-python
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../python/python3-lxml_4.9.1.bb              | 42 +++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-lxml_4.9.1.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 3c80a3a617..fee4e52b10 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -626,6 +626,7 @@ RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie
> <richard.purdie@linuxfound
>  RECIPE_MAINTAINER:pn-python3-jsonpointer = "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-jsonschema = "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <
> JPEWhacker@gmail.com>"
> +RECIPE_MAINTAINER:pn-python3-lxml = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> diff --git a/meta/recipes-devtools/python/python3-lxml_4.9.1.bb
> b/meta/recipes-devtools/python/python3-lxml_4.9.1.bb
> new file mode 100644
> index 0000000000..92a30f7907
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-lxml_4.9.1.bb
> @@ -0,0 +1,42 @@
> +SUMMARY = "Powerful and Pythonic XML processing library combining
> libxml2/libxslt with the ElementTree API."
> +DESCRIPTION = "lxml is a Pythonic, mature binding for the libxml2 and \
> +libxslt libraries. It provides safe and convenient access to these \
> +libraries using the ElementTree API. It extends the ElementTree API \
> +significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \
> +C14N and much more."
> +HOMEPAGE = "https://lxml.de/"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause & GPL-2.0-only & MIT & PSF-2.0"
> +LIC_FILES_CHKSUM =
> "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
> +
> file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
> +
> file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
> +
> file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
> +
> file://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=2;endline=7;md5=fc85684a8dd5fa272c086bceb0d99e10
> \
> +
> file://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron_message.xsl;beginline=2;endline=24;md5=cc86b7b2bbc678e13f58ea403eb9929b
> \
> +
> file://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=2;endline=7;md5=5b03236d293dc3784205542b409d2f53
> \
> +                    "
> +
> +DEPENDS += "libxml2 libxslt"
> +
> +SRC_URI[sha256sum] =
> "fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f"
> +
> +SRC_URI += "${PYPI_SRC_URI}"
> +inherit pkgconfig pypi setuptools3
> +
> +# {standard input}: Assembler messages:
> +# {standard input}:1488805: Error: branch out of range
> +DEBUG_OPTIMIZATION:remove:mips = " -Og"
> +DEBUG_OPTIMIZATION:append:mips = " -O"
> +BUILD_OPTIMIZATION:remove:mips = " -Og"
> +BUILD_OPTIMIZATION:append:mips = " -O"
> +
> +DEBUG_OPTIMIZATION:remove:mipsel = " -Og"
> +DEBUG_OPTIMIZATION:append:mipsel = " -O"
> +BUILD_OPTIMIZATION:remove:mipsel = " -Og"
> +BUILD_OPTIMIZATION:append:mipsel = " -O"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +RDEPENDS:${PN} += "libxml2 libxslt ${PYTHON_PN}-compression"
> +
> +CLEANBROKEN = "1"
> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170270):
> https://lists.openembedded.org/g/openembedded-core/message/170270
> Mute This Topic: https://lists.openembedded.org/mt/93444245/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000094e55c05e7d29dc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But why move the recipe to core? Why not meta-oe?</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 3. Sep 2022 a=
t 19.46, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)">Import this recipe from meta-p=
ython, as it is needed by many recipes<br>
from different layers e.g. wireplumber from meta-multimedia,<br>
opengl-es-cts and vulkan-cts in meta-oe, yelp-tools in meta-gnome to<br>
name a few, the real issue is that newer vulkan-cts has added this<br>
dependency which is in meta-oe, and meta-oe can not depend on<br>
meta-python<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0.../python/<a href=3D"http://python3-lxml_4.9.1.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-lxml_4.9.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 42 +++++++++++++++++++<br>
=C2=A02 files changed, 43 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-lxml_4.9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-lxml_4.9.1=
.bb</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 3c80a3a617..fee4e52b10 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -626,6 +626,7 @@ RECIPE_MAINTAINER:pn-python3-jinja2 =3D &quot;Richard P=
urdie &lt;richard.purdie@linuxfound<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-jsonpointer =3D &quot;Bruce Ashfield &lt=
;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfie=
ld@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-jsonschema =3D &quot;Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-libarchive-c =3D &quot;Joshua Watt &lt;<=
a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.c=
om</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-lxml =3D &quot;Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-magic =3D &quot;Joshua Watt &lt;<a href=
=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com</a>=
&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-mako =3D &quot;Oleksandr Kravchuk &lt;<a=
 href=3D"mailto:open.source@oleksandr-kravchuk.com" target=3D"_blank">open.=
source@oleksandr-kravchuk.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-markdown =3D &quot;Alexander Kanavin &lt=
;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@g=
mail.com</a>&gt;&quot;<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-lxml_4.=
9.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-lxml_4.9.1.bb</a> b/me=
ta/recipes-devtools/python/<a href=3D"http://python3-lxml_4.9.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-lxml_4.9.1.bb</a><br>
new file mode 100644<br>
index 0000000000..92a30f7907<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-lxml_4.9.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-lxml_4.9.1.bb</a><br>
@@ -0,0 +1,42 @@<br>
+SUMMARY =3D &quot;Powerful and Pythonic XML processing library combining l=
ibxml2/libxslt with the ElementTree API.&quot;<br>
+DESCRIPTION =3D &quot;lxml is a Pythonic, mature binding for the libxml2 a=
nd \<br>
+libxslt libraries. It provides safe and convenient access to these \<br>
+libraries using the ElementTree API. It extends the ElementTree API \<br>
+significantly to offer support for XPath, RelaxNG, XML Schema, XSLT, \<br>
+C14N and much more.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://lxml.de/" rel=3D"noreferrer" target=
=3D"_blank">https://lxml.de/</a>&quot;<br>
+SECTION =3D &quot;devel/python&quot;<br>
+LICENSE =3D &quot;BSD-3-Clause &amp; GPL-2.0-only &amp; MIT &amp; PSF-2.0&=
quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSES.txt;md5=3De4c045ebad958ead4b480=
08f70838403 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://doc/licenses/elementtree.txt;md5=3Deb34d036a6e3d56314ee49a6852ac891 \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://doc/licenses/BSD.txt;md5=3D700a1fc17f4797d4f2d34970c8ee694b \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://doc/licenses/GPL.txt;md5=3D94d55d512a9ba36caa9b7df079bae19f \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/lxml/isoschematron/resources/rng/iso-schematron.rng;beginline=3D2;en=
dline=3D7;md5=3Dfc85684a8dd5fa272c086bceb0d99e10 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/lxml/isoschematron/resources/xsl/iso-schematron-xslt1/iso_schematron=
_message.xsl;beginline=3D2;endline=3D24;md5=3Dcc86b7b2bbc678e13f58ea403eb99=
29b \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://src/lxml/isoschematron/resources/xsl/RNG2Schtrn.xsl;beginline=3D2;endlin=
e=3D7;md5=3D5b03236d293dc3784205542b409d2f53 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;<br>
+<br>
+DEPENDS +=3D &quot;libxml2 libxslt&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;fe749b052bb7233fe5d072fcb549221a8cb1a16725c47=
c37e42b0b9cb3ff2c3f&quot;<br>
+<br>
+SRC_URI +=3D &quot;${PYPI_SRC_URI}&quot;<br>
+inherit pkgconfig pypi setuptools3<br>
+<br>
+# {standard input}: Assembler messages:<br>
+# {standard input}:1488805: Error: branch out of range<br>
+DEBUG_OPTIMIZATION:remove:mips =3D &quot; -Og&quot;<br>
+DEBUG_OPTIMIZATION:append:mips =3D &quot; -O&quot;<br>
+BUILD_OPTIMIZATION:remove:mips =3D &quot; -Og&quot;<br>
+BUILD_OPTIMIZATION:append:mips =3D &quot; -O&quot;<br>
+<br>
+DEBUG_OPTIMIZATION:remove:mipsel =3D &quot; -Og&quot;<br>
+DEBUG_OPTIMIZATION:append:mipsel =3D &quot; -O&quot;<br>
+BUILD_OPTIMIZATION:remove:mipsel =3D &quot; -Og&quot;<br>
+BUILD_OPTIMIZATION:append:mipsel =3D &quot; -O&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+RDEPENDS:${PN} +=3D &quot;libxml2 libxslt ${PYTHON_PN}-compression&quot;<b=
r>
+<br>
+CLEANBROKEN =3D &quot;1&quot;<br>
-- <br>
2.37.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#170270): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/170270" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/170270</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93444245/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93444245/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000094e55c05e7d29dc2--

