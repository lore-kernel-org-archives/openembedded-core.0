Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web08.871.1624387437288109654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 11:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rqZR6p3R;
 spf=pass (domain: gmail.com, ip: 209.85.221.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id az3so4677293vkb.12
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 11:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Puw19a+YDelCJkmTmOXZatKbNXYTcDZ/ltCwl7Oo7hs=;
        b=rqZR6p3R6nzheqfpDodIb9z2zzub1Q1PGd06dPn82yFWl1HYcsPX+JFunC+J0toYRS
         sTaIL3vhYJXVsqqMdM50FIOgTe3zZ5Hr8lp/ZAJwxOyuVHR1ocycbScqtXgKwlaE625u
         UqUZ+gSW5tU2gBXDvnAnvuiJt8Z8KMzblDUs0oILF7y3CyBP5wmV4L/1S5bP2geFigxS
         DYDsxAj1HkbZz2GI+OwJBKzyVFn2jCzpWicT5aCpqtvYbJFdPEw0JGXTbXoiQlUieVEw
         ZY/F0/8O0aOtDm4g0VcG09DAGkHz1IL4fG7tqFtVynse9vbc8V4JS1bGfGHnGb7UbsnJ
         Whdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Puw19a+YDelCJkmTmOXZatKbNXYTcDZ/ltCwl7Oo7hs=;
        b=Dw1wLNY0nLGPpXMJI0bF8vFBUCqfwHzMeSyQp8ivQztpAAip0ecLB/OrVSHDANGo0f
         BIY4V2CYQPYMBfBNRriQDTpv1/PPtP5LbzlJNJZONUM5JKS0TnP6E3Cf+KOfWCvm4kQc
         bH66OeyStdVLUPekke1WrJl7TXGymEoA1EoIMx5MasraCl1/0mtf5n1dFs6c/smCTRLN
         71GbTY15G4Z7mZGyAEjiRuZBA2SBtpXprEA9/FXOYxrBXjGO4vbyEp8YnkWmfZYR9U0Z
         5dpQNzykVNS4eYmbsQoqgZGUtVwa1ZCNka3oUavrjBQ4O554Oy0VCdfr1cXuktasQD0u
         J5YA==
X-Gm-Message-State: AOAM531ov6uBYceGjgggVCuuU1VThkjEFpvH7WklXe3vedhb/YC+TGDC
	rPkqmo2e5xV6PgKAjNjzY3ZCtWgJtyhY/zambvT+mXSFP8w=
X-Google-Smtp-Source: ABdhPJySz1KPf9JE5w1o+KGu3PXqPeMMP1CH7kyt7NOfgdJ/zv0mJsh4rzQFLbrjTxnFZuoEMbi4/wFqTdtdvl/47nA=
X-Received: by 2002:a1f:1854:: with SMTP id 81mr16635619vky.16.1624387436376;
 Tue, 22 Jun 2021 11:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210622173743.1231362-1-trevor.gamblin@windriver.com>
In-Reply-To: <20210622173743.1231362-1-trevor.gamblin@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 22 Jun 2021 20:43:45 +0200
Message-ID: <CANNYZj-Kz8eyaYZy-VTWe=d+crK_3+ExNjE+fAACdz3+HC_a5w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] python3-pip: upgrade 20.0.2 -> 21.1.2
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001f767705c55f2c7b"

--0000000000001f767705c55f2c7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you please check why 'devtool check-upgrade-status' wasn't able to
report that all these new versions have been available?

Alex

On Tue, 22 Jun 2021 at 19:37, Trevor Gamblin <trevor.gamblin@windriver.com=
>
wrote:

> 21.1.2 contains a fix for CVE-2021-3572
> (
> https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb=
30b
> )
>
> The LICENSE.txt signature changed due to an update to the copyright
> dates, but the terms are the same.
>
> Also update 0001-change-shebang-to-python3.patch to cover all files in
> pip's src directory, since we need to ensure compatibility.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../0001-change-shebang-to-python3.patch      | 128 ++++++++++++++----
>  ...n3-pip_20.0.2.bb =3D> python3-pip_21.1.2.bb} |   6 +-
>  2 files changed, 101 insertions(+), 33 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pip_20.0.2.bb =3D>
> python3-pip_21.1.2.bb} (73%)
>
> diff --git
> a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python=
3.patch
> b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python=
3.patch
> index 00cffe169b..0187001168 100644
> ---
> a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python=
3.patch
> +++
> b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-python=
3.patch
> @@ -1,32 +1,30 @@
> -From e7a00e9b5104ae2fbcea32a35c85760b77fae7e5 Mon Sep 17 00:00:00 2001
> -From: Changqing Li <changqing.li@windriver.com>
> -Date: Thu, 23 Apr 2020 09:42:10 +0000
> +From baa85a4dab2e8d64eb25d1181b6420db25ce919a Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <trevor.gamblin@windriver.com>
> +Date: Tue, 22 Jun 2021 12:31:46 -0400
>  Subject: [PATCH] change shebang to python3
>
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate (OE-specific)
>
> -pip will drop support of python2 from 21.0
> +Despite no longer supporting python2, some files in the pip source refe=
r
> +to "python" instead of "python3", so patch them as needed to ensure tha=
t
> +they correctly reference the python3 binary.
>
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
>  ---
> - src/pip/_internal/__init__.py             | 2 +-
> - src/pip/_vendor/appdirs.py                | 2 +-
> - src/pip/_vendor/chardet/cli/chardetect.py | 2 +-
> - src/pip/_vendor/requests/certs.py         | 2 +-
> - 4 files changed, 4 insertions(+), 4 deletions(-)
> + src/pip/_vendor/appdirs.py                    | 2 +-
> + src/pip/_vendor/chardet/langbulgarianmodel.py | 2 +-
> + src/pip/_vendor/chardet/langgreekmodel.py     | 2 +-
> + src/pip/_vendor/chardet/langhebrewmodel.py    | 2 +-
> + src/pip/_vendor/chardet/langhungarianmodel.py | 2 +-
> + src/pip/_vendor/chardet/langrussianmodel.py   | 2 +-
> + src/pip/_vendor/chardet/langthaimodel.py      | 2 +-
> + src/pip/_vendor/chardet/langturkishmodel.py   | 2 +-
> + src/pip/_vendor/chardet/metadata/languages.py | 2 +-
> + src/pip/_vendor/requests/certs.py             | 2 +-
> + 10 files changed, 10 insertions(+), 10 deletions(-)
>
> -diff --git a/src/pip/_internal/__init__.py b/src/pip/_internal/__init__=
.py
> -index 3aa8a46..e1ad179 100755
> ---- a/src/pip/_internal/__init__.py
> -+++ b/src/pip/_internal/__init__.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - import pip._internal.utils.inject_securetransport  # noqa
> - from pip._internal.utils.typing import MYPY_CHECK_RUNNING
> -
>  diff --git a/src/pip/_vendor/appdirs.py b/src/pip/_vendor/appdirs.py
> -index 3a52b75..ad3f81d 100644
> +index 33a3b7741..60b9ef5f7 100644
>  --- a/src/pip/_vendor/appdirs.py
>  +++ b/src/pip/_vendor/appdirs.py
>  @@ -1,4 +1,4 @@
> @@ -35,18 +33,88 @@ index 3a52b75..ad3f81d 100644
>   # -*- coding: utf-8 -*-
>   # Copyright (c) 2005-2010 ActiveState Software Inc.
>   # Copyright (c) 2013 Eddy Petri=C8=99or
> -diff --git a/src/pip/_vendor/chardet/cli/chardetect.py
> b/src/pip/_vendor/chardet/cli/chardetect.py
> -index c61136b..a497e98 100644
> ---- a/src/pip/_vendor/chardet/cli/chardetect.py
> -+++ b/src/pip/_vendor/chardet/cli/chardetect.py
> +diff --git a/src/pip/_vendor/chardet/langbulgarianmodel.py
> b/src/pip/_vendor/chardet/langbulgarianmodel.py
> +index e963a5097..97ea6cea8 100644
> +--- a/src/pip/_vendor/chardet/langbulgarianmodel.py
> ++++ b/src/pip/_vendor/chardet/langbulgarianmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langgreekmodel.py
> b/src/pip/_vendor/chardet/langgreekmodel.py
> +index d99528ede..4a127ea83 100644
> +--- a/src/pip/_vendor/chardet/langgreekmodel.py
> ++++ b/src/pip/_vendor/chardet/langgreekmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langhebrewmodel.py
> b/src/pip/_vendor/chardet/langhebrewmodel.py
> +index 484c652a4..676c1a711 100644
> +--- a/src/pip/_vendor/chardet/langhebrewmodel.py
> ++++ b/src/pip/_vendor/chardet/langhebrewmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langhungarianmodel.py
> b/src/pip/_vendor/chardet/langhungarianmodel.py
> +index bbc5cda64..042eae70a 100644
> +--- a/src/pip/_vendor/chardet/langhungarianmodel.py
> ++++ b/src/pip/_vendor/chardet/langhungarianmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langrussianmodel.py
> b/src/pip/_vendor/chardet/langrussianmodel.py
> +index 5594452b5..564b02e58 100644
> +--- a/src/pip/_vendor/chardet/langrussianmodel.py
> ++++ b/src/pip/_vendor/chardet/langrussianmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langthaimodel.py
> b/src/pip/_vendor/chardet/langthaimodel.py
> +index 9a37db573..c97487959 100644
> +--- a/src/pip/_vendor/chardet/langthaimodel.py
> ++++ b/src/pip/_vendor/chardet/langthaimodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/langturkishmodel.py
> b/src/pip/_vendor/chardet/langturkishmodel.py
> +index 43f4230ae..7e710c371 100644
> +--- a/src/pip/_vendor/chardet/langturkishmodel.py
> ++++ b/src/pip/_vendor/chardet/langturkishmodel.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
> +
> + from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
> +diff --git a/src/pip/_vendor/chardet/metadata/languages.py
> b/src/pip/_vendor/chardet/metadata/languages.py
> +index 3237d5abf..aa2ec7c35 100644
> +--- a/src/pip/_vendor/chardet/metadata/languages.py
> ++++ b/src/pip/_vendor/chardet/metadata/languages.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + # -*- coding: utf-8 -*-
>   """
> - Script which takes one or more file paths and reports on their detecte=
d
> - encodings
> + Metadata about languages used by our model training code for our
>  diff --git a/src/pip/_vendor/requests/certs.py
> b/src/pip/_vendor/requests/certs.py
> -index 06a594e..bfa7839 100644
> +index 06a594e58..bfa7839a4 100644
>  --- a/src/pip/_vendor/requests/certs.py
>  +++ b/src/pip/_vendor/requests/certs.py
>  @@ -1,4 +1,4 @@
> @@ -56,5 +124,5 @@ index 06a594e..bfa7839 100644
>
>   """
>  --
> -2.24.1
> +2.31.1
>
> diff --git a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
> b/meta/recipes-devtools/python/python3-pip_21.1.2.bb
> similarity index 73%
> rename from meta/recipes-devtools/python/python3-pip_20.0.2.bb
> rename to meta/recipes-devtools/python/python3-pip_21.1.2.bb
> index 99eeea2edf..fd7a145205 100644
> --- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
> +++ b/meta/recipes-devtools/python/python3-pip_21.1.2.bb
> @@ -2,14 +2,14 @@ SUMMARY =3D "The PyPA recommended tool for installing
> Python packages"
>  HOMEPAGE =3D "https://pypi.org/project/pip"
>  SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D8ba06d529c955048e5ddd7c45459eb2e"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Dc4fa2b50f55649f43060fa04b0919b9b"
>
>  DEPENDS +=3D "python3 python3-setuptools-native"
>
>  SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
>
> -SRC_URI[md5sum] =3D "7d42ba49b809604f0df3d55df1c3fd86"
> -SRC_URI[sha256sum] =3D
> "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967f"
> +SRC_URI[md5sum] =3D "a867fd51eacfd5293f5b7e0c2e7867a7"
> +SRC_URI[sha256sum] =3D
> "eb5df6b9ab0af50fe1098a52fd439b04730b6e066887ff7497357b9ebd19f79b"
>
>  inherit pypi distutils3
>
> --
> 2.31.1
>
>
>=20
>
>

--0000000000001f767705c55f2c7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you please check why &#39;devtool check-upgrade-s=
tatus&#39; wasn&#39;t able to report that all these new versions have been =
available?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 22 Jun 2021 at 19=
:37, Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com">tre=
vor.gamblin@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">21.1.2 contains a fix for CVE-2021-3572<br>
(<a href=3D"https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175b=
ae6db847cb30b" rel=3D"noreferrer" target=3D"_blank">https://github.com/pypa=
/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb30b</a>)<br>
<br>
The LICENSE.txt signature changed due to an update to the copyright<br>
dates, but the terms are the same.<br>
<br>
Also update 0001-change-shebang-to-python3.patch to cover all files in<br>
pip&#39;s src directory, since we need to ensure compatibility.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriv=
er.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-change-shebang-to-python3.patch=C2=A0 =C2=A0 =C2=A0 | 128 +=
+++++++++++++----<br>
=C2=A0...<a href=3D"http://n3-pip_20.0.2.bb" rel=3D"noreferrer" target=3D"=
_blank">n3-pip_20.0.2.bb</a> =3D&gt; <a href=3D"http://python3-pip_21.1.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pip_21.1.2.bb</a>} |=C2=A0 =
=
=C2=A06 +-<br>
=C2=A02 files changed, 101 insertions(+), 33 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-pip_2=
0.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_20.0.2.bb</a> =
=3D&gt; <a href=3D"http://python3-pip_21.1.2.bb" rel=3D"noreferrer" target=
=
=3D"_blank">python3-pip_21.1.2.bb</a>} (73%)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-=
to-python3.patch b/meta/recipes-devtools/python/python3-pip/0001-change-she=
bang-to-python3.patch<br>
index 00cffe169b..0187001168 100644<br>
--- a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-pyth=
on3.patch<br>
+++ b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-pyth=
on3.patch<br>
@@ -1,32 +1,30 @@<br>
-From e7a00e9b5104ae2fbcea32a35c85760b77fae7e5 Mon Sep 17 00:00:00 2001<br=
>
-From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targ=
et=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
-Date: Thu, 23 Apr 2020 09:42:10 +0000<br>
+From baa85a4dab2e8d64eb25d1181b6420db25ce919a Mon Sep 17 00:00:00 2001<br=
>
+From: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" =
target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
+Date: Tue, 22 Jun 2021 12:31:46 -0400<br>
=C2=A0Subject: [PATCH] change shebang to python3<br>
<br>
-Upstream-Status: Pending<br>
+Upstream-Status: Inappropriate (OE-specific)<br>
<br>
-pip will drop support of python2 from 21.0<br>
+Despite no longer supporting python2, some files in the pip source refer<=
br>
+to &quot;python&quot; instead of &quot;python3&quot;, so patch them as ne=
eded to ensure that<br>
+they correctly reference the python3 binary.<br>
<br>
-Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.=
com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windri=
ver.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
=C2=A0---<br>
- src/pip/_internal/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2 +-<br>
- src/pip/_vendor/appdirs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
- src/pip/_vendor/chardet/cli/chardetect.py | 2 +-<br>
- src/pip/_vendor/requests/certs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +=
-<br>
- 4 files changed, 4 insertions(+), 4 deletions(-)<br>
+ src/pip/_vendor/appdirs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ src/pip/_vendor/chardet/langbulgarianmodel.py | 2 +-<br>
+ src/pip/_vendor/chardet/langgreekmodel.py=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ src/pip/_vendor/chardet/langhebrewmodel.py=C2=A0 =C2=A0 | 2 +-<br>
+ src/pip/_vendor/chardet/langhungarianmodel.py | 2 +-<br>
+ src/pip/_vendor/chardet/langrussianmodel.py=C2=A0 =C2=A0| 2 +-<br>
+ src/pip/_vendor/chardet/langthaimodel.py=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ src/pip/_vendor/chardet/langturkishmodel.py=C2=A0 =C2=A0| 2 +-<br>
+ src/pip/_vendor/chardet/metadata/languages.py | 2 +-<br>
+ src/pip/_vendor/requests/certs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
+ 10 files changed, 10 insertions(+), 10 deletions(-)<br>
<br>
-diff --git a/src/pip/_internal/__init__.py b/src/pip/_internal/__init__.p=
y<br>
-index 3aa8a46..e1ad179 100755<br>
---- a/src/pip/_internal/__init__.py<br>
-+++ b/src/pip/_internal/__init__.py<br>
-@@ -1,4 +1,4 @@<br>
--#!/usr/bin/env python<br>
-+#!/usr/bin/env python3<br>
- import pip._internal.utils.inject_securetransport=C2=A0 # noqa<br>
- from pip._internal.utils.typing import MYPY_CHECK_RUNNING<br>
- <br>
=C2=A0diff --git a/src/pip/_vendor/appdirs.py b/src/pip/_vendor/appdirs.py=
<br>
-index 3a52b75..ad3f81d 100644<br>
+index 33a3b7741..60b9ef5f7 100644<br>
=C2=A0--- a/src/pip/_vendor/appdirs.py<br>
=C2=A0+++ b/src/pip/_vendor/appdirs.py<br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -35,18 +33,88 @@ index 3a52b75..ad3f81d 100644<br>
=C2=A0 # -*- coding: utf-8 -*-<br>
=C2=A0 # Copyright (c) 2005-2010 ActiveState Software Inc.<br>
=C2=A0 # Copyright (c) 2013 Eddy Petri=C8=99or<br>
-diff --git a/src/pip/_vendor/chardet/cli/chardetect.py b/src/pip/_vendor/=
chardet/cli/chardetect.py<br>
-index c61136b..a497e98 100644<br>
---- a/src/pip/_vendor/chardet/cli/chardetect.py<br>
-+++ b/src/pip/_vendor/chardet/cli/chardetect.py<br>
+diff --git a/src/pip/_vendor/chardet/langbulgarianmodel.py b/src/pip/_ven=
dor/chardet/langbulgarianmodel.py<br>
+index e963a5097..97ea6cea8 100644<br>
+--- a/src/pip/_vendor/chardet/langbulgarianmodel.py<br>
++++ b/src/pip/_vendor/chardet/langbulgarianmodel.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ # -*- coding: utf-8 -*-<br>
+ <br>
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel<b=
r>
+diff --git a/src/pip/_vendor/chardet/langgreekmodel.py b/src/pip/_vendor/=
chardet/langgreekmodel.py<br>
+index d99528ede..4a127ea83 100644<br>
+--- a/src/pip/_vendor/chardet/langgreekmodel.py<br>
++++ b/src/pip/_vendor/chardet/langgreekmodel.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ # -*- coding: utf-8 -*-<br>
+ <br>
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel<b=
r>
+diff --git a/src/pip/_vendor/chardet/langhebrewmodel.py b/src/pip/_vendor=
/chardet/langhebrewmodel.py<br>
+index 484c652a4..676c1a711 100644<br>
+--- a/src/pip/_vendor/chardet/langhebrewmodel.py<br>
++++ b/src/pip/_vendor/chardet/langhebrewmodel.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ # -*- coding: utf-8 -*-<br>
+ <br>
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel<b=
r>
+diff --git a/src/pip/_vendor/chardet/langhungarianmodel.py b/src/pip/_ven=
dor/chardet/langhungarianmodel.py<br>
+index bbc5cda64..042eae70a 100644<br>
+--- a/src/pip/_vendor/chardet/langhungarianmodel.py<br>
++++ b/src/pip/_vendor/chardet/langhungarianmodel.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ # -*- coding: utf-8 -*-<br>
+ <br>
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel<b=
r>
+diff --git a/src/pip/_vendor/chardet/langrussianmodel.py b/src/pip/_vendo=
r/chardet/langrussianmodel.py<br>
+index 5594452b5..564b02e58 100644<br>
+--- a/src/pip/_vendor/chardet/langrussianmodel.py<br>
++++ b/src/pip/_vendor/chardet/langrussianmodel.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ # -*- coding: utf-8 -*-<br>
+ <br>
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel<b=
r>
+diff --git a/src/pip/_vendor/chardet/langthaimodel.py b/src/pip/_vendor/c=
hardet/langthaimodel.py<br>
+index 9a37db573..c97487959 100644<br>
+--- a/src/pip/_vendor/chardet/langthaimodel.py<br>
++++ b/src/pip/_vendor/chardet/langthaimodel.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ # -*- coding: utf-8 -*-<br>
+ <br>
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel<b=
r>
+diff --git a/src/pip/_vendor/chardet/langturkishmodel.py b/src/pip/_vendo=
r/chardet/langturkishmodel.py<br>
+index 43f4230ae..7e710c371 100644<br>
+--- a/src/pip/_vendor/chardet/langturkishmodel.py<br>
++++ b/src/pip/_vendor/chardet/langturkishmodel.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ # -*- coding: utf-8 -*-<br>
+ <br>
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel<b=
r>
+diff --git a/src/pip/_vendor/chardet/metadata/languages.py b/src/pip/_ven=
dor/chardet/metadata/languages.py<br>
+index 3237d5abf..aa2ec7c35 100644<br>
+--- a/src/pip/_vendor/chardet/metadata/languages.py<br>
++++ b/src/pip/_vendor/chardet/metadata/languages.py<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#!/usr/bin/env python<br>
=C2=A0+#!/usr/bin/env python3<br>
+ # -*- coding: utf-8 -*-<br>
=C2=A0 &quot;&quot;&quot;<br>
- Script which takes one or more file paths and reports on their detected<=
br>
- encodings<br>
+ Metadata about languages used by our model training code for our<br>
=C2=A0diff --git a/src/pip/_vendor/requests/certs.py b/src/pip/_vendor/req=
uests/certs.py<br>
-index 06a594e..bfa7839 100644<br>
+index 06a594e58..bfa7839a4 100644<br>
=C2=A0--- a/src/pip/_vendor/requests/certs.py<br>
=C2=A0+++ b/src/pip/_vendor/requests/certs.py<br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -56,5 +124,5 @@ index 06a594e..bfa7839 100644<br>
<br>
=C2=A0 &quot;&quot;&quot;<br>
=C2=A0-- <br>
-2.24.1<br>
+2.31.1<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-pip_20=
.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_20.0.2.bb</a> b/m=
eta/recipes-devtools/python/<a href=3D"http://python3-pip_21.1.2.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-pip_21.1.2.bb</a><br>
similarity index 73%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-pip_20.=
0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_20.0.2.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-pip_21.1.=
2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pip_21.1.2.bb</a><br>
index 99eeea2edf..fd7a145205 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-pip_20.0.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-pip_20.0.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-pip_21.1.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-pip_21.1.2.bb</a><br>
@@ -2,14 +2,14 @@ SUMMARY =3D &quot;The PyPA recommended tool for installi=
ng Python packages&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/project/pip" rel=3D"n=
oreferrer" target=3D"_blank">https://pypi.org/project/pip</a>&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D8ba06d529c955048e5ddd=
7c45459eb2e&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Dc4fa2b50f55649f43060f=
a04b0919b9b&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;python3 python3-setuptools-native&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-change-shebang-to-python3.patch&quot;=
<br>
<br>
-SRC_URI[md5sum] =3D &quot;7d42ba49b809604f0df3d55df1c3fd86&quot;<br>
-SRC_URI[sha256sum] =3D &quot;7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4=
949920675563a5a6967f&quot;<br>
+SRC_URI[md5sum] =3D &quot;a867fd51eacfd5293f5b7e0c2e7867a7&quot;<br>
+SRC_URI[sha256sum] =3D &quot;eb5df6b9ab0af50fe1098a52fd439b04730b6e066887=
ff7497357b9ebd19f79b&quot;<br>
<br>
=C2=A0inherit pypi distutils3<br>
<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000001f767705c55f2c7b--
