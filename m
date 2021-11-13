Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DD4C433F5
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 17:17:30 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web08.71.1636823839982166392
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:17:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JB5tPRE8;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id b17so25703767uas.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 09:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=14X/W6FcuC9xw+rUlRS8ydaalnTEdw+2G0Ml1GZE9eQ=;
        b=JB5tPRE8VfsuGxerHazz3bEVpa5ph/Cz8HgVB8bwGSIyoOmYkJ++6e3dcpz4mIAxTl
         +adcAdbhZWtOVMPr54Jtw8ae/b7gLPSY31646va0n8ssW+MXdHsU67kPuWeFh1ZFnwAy
         dNIeMBmR7wdGrj4INY5NQLqZbz6BgaTi6HQcdw3afgA9bJgUlx+NqG5McjaA6qSh24w9
         bm7yQ52su8YNTreEn9bl6Ji3bUJthKM8/hVTrOkCyQdm4bnBVXBHyi+0/rcpaY8/fpxV
         19K8zOrjiquHLjKoZkUDYR+qlCabfwLvJs+z5zzGnxoN5UAEmtyyW7CR0P2UOFb0vm/z
         HtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=14X/W6FcuC9xw+rUlRS8ydaalnTEdw+2G0Ml1GZE9eQ=;
        b=eQ0IcxghdxeDKx9MuGqGqpkOzGi+9GjOQlaC1KAPYusILY+I73XvauFGMYNWa4ZEYR
         y2UPmi66dlsNR8uIfXJeG3l3p6F8bHxJ0b44h/9WmtTnkBec5G/t/H/pJf4ie2Asa7RO
         f8ZWb6ma+6It22+7voJpjet4mwHHDUfG8VsI9U+/wXsfg/bneIHpwCf9mOXVcZk1krT6
         ldla9oWhylGmKzrGXYnFzgy+DmsB5Sqqtn/WhQjr2xv6Ntfv7nvFuVFjVvZJu44mVQ8W
         FrKW+P1ssJzRLmGdfliDd3kByfQLWjWxMnx/+G16qcTZvv2UEtpxLWiGc9bqEr9oeGJB
         +v9g==
X-Gm-Message-State: AOAM530ia1S1UOArC748QWUR5GpWj/dl9k7U53R0Q/TnYqyeUUgD8ce6
	j/pO1LtGFkok903O3Xvr2dWQ1J7OK3a81AhMCDU=
X-Google-Smtp-Source: 
 ABdhPJzG4FbZK/UV53x9UltaSzpBFOpRFZPVfzg+vX1oTqRAv75J4kx9UZLj9N9m8VvshBJzUZnL8UwgyoThhG5x5Zk=
X-Received: by 2002:a05:6102:2c6:: with SMTP id
 h6mr23326867vsh.13.1636823839047;
 Sat, 13 Nov 2021 09:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20211113170219.372539-1-yi.zhao@windriver.com>
In-Reply-To: <20211113170219.372539-1-yi.zhao@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 13 Nov 2021 18:17:07 +0100
Message-ID: 
 <CANNYZj8t10xMk+oZTJquNWVmBXC9+BgpHUS3-Z7ZSppWX9GGqw@mail.gmail.com>
Subject: Re: [PATCH V2] python-numpy: move recipe to python directory
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007c81f505d0aebf7f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 17:17:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158250

--0000000000007c81f505d0aebf7f
Content-Type: text/plain; charset="UTF-8"

This is identical to v1 :)

Alex

On Sat, 13 Nov 2021 at 18:02, Yi Zhao <yi.zhao@windriver.com> wrote:

> This recipe had been moved out from python directory since 2016[1] in
> order to share patches between python2 and python3. But now there is no
> reason to keep it in its own directory as we only keep python3-nump.
> Move it back to python directory.
>
> Also add python3-json to RDEPENDS to fix import error:
> $ python3
> >>> import numpy
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib/python3.10/site-packages/numpy/__init__.py", line 138, in
> <module>
>     from ._version import get_versions
>   File "/usr/lib/python3.10/site-packages/numpy/_version.py", line 7, in
> <module>
>     import json
> ModuleNotFoundError: No module named 'json'
> >>>
>
> [1]
> https://git.openembedded.org/openembedded-core/commit/?id=9bffe2f9fb4ce6c0b265f27e5b484fbe076c6349
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  ...01-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 0
>  .../python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch | 0
>  .../{python-numpy/files => python/python3-numpy}/run-ptest       | 0
>  .../{python-numpy => python}/python3-numpy_1.21.4.bb             | 1 +
>  4 files changed, 1 insertion(+)
>  rename meta/recipes-devtools/{python-numpy/files =>
> python/python3-numpy}/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> (100%)
>  rename meta/recipes-devtools/{python-numpy/files =>
> python/python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch (100%)
>  rename meta/recipes-devtools/{python-numpy/files =>
> python/python3-numpy}/run-ptest (100%)
>  rename meta/recipes-devtools/{python-numpy => python}/
> python3-numpy_1.21.4.bb (98%)
>
> diff --git
> a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> rename to
> meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
> diff --git
> a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
> b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
> similarity index 100%
> rename from
> meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
> rename to
> meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
> diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest
> b/meta/recipes-devtools/python/python3-numpy/run-ptest
> similarity index 100%
> rename from meta/recipes-devtools/python-numpy/files/run-ptest
> rename to meta/recipes-devtools/python/python3-numpy/run-ptest
> diff --git a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
> b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
> similarity index 98%
> rename from meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
> rename to meta/recipes-devtools/python/python3-numpy_1.21.4.bb
> index 8988a5bc39..a3ea4ab5aa 100644
> --- a/meta/recipes-devtools/python-numpy/python3-numpy_1.21.4.bb
> +++ b/meta/recipes-devtools/python/python3-numpy_1.21.4.bb
> @@ -47,6 +47,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-unittest \
>                    ${PYTHON_PN}-ctypes \
>                    ${PYTHON_PN}-threading \
>                    ${PYTHON_PN}-multiprocessing \
> +                  ${PYTHON_PN}-json \
>  "
>  RDEPENDS:${PN}-ptest += "${PYTHON_PN}-pytest \
>                           ${PYTHON_PN}-hypothesis \
> --
> 2.25.1
>
>

--0000000000007c81f505d0aebf7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is identical to v1 :)</div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat, 13 Nov 2021 at 18:02, Yi Zhao &lt;<a href=3D"mailto:yi=
.zhao@windriver.com">yi.zhao@windriver.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">This recipe had been moved out fr=
om python directory since 2016[1] in<br>
order to share patches between python2 and python3. But now there is no<br>
reason to keep it in its own directory as we only keep python3-nump.<br>
Move it back to python directory.<br>
<br>
Also add python3-json to RDEPENDS to fix import error:<br>
$ python3<br>
&gt;&gt;&gt; import numpy<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;<br>
=C2=A0 File &quot;/usr/lib/python3.10/site-packages/numpy/__init__.py&quot;=
, line 138, in &lt;module&gt;<br>
=C2=A0 =C2=A0 from ._version import get_versions<br>
=C2=A0 File &quot;/usr/lib/python3.10/site-packages/numpy/_version.py&quot;=
, line 7, in &lt;module&gt;<br>
=C2=A0 =C2=A0 import json<br>
ModuleNotFoundError: No module named &#39;json&#39;<br>
&gt;&gt;&gt;<br>
<br>
[1] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D=
9bffe2f9fb4ce6c0b265f27e5b484fbe076c6349" rel=3D"noreferrer" target=3D"_bla=
nk">https://git.openembedded.org/openembedded-core/commit/?id=3D9bffe2f9fb4=
ce6c0b265f27e5b484fbe076c6349</a><br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0...01-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch | 0<=
br>
=C2=A0.../python3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch | 0<=
br>
=C2=A0.../{python-numpy/files =3D&gt; python/python3-numpy}/run-ptest=C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../{python-numpy =3D&gt; python}/<a href=3D"http://python3-numpy_1.2=
1.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.21.4.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A04 files changed, 1 insertion(+)<br>
=C2=A0rename meta/recipes-devtools/{python-numpy/files =3D&gt; python/pytho=
n3-numpy}/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch (=
100%)<br>
=C2=A0rename meta/recipes-devtools/{python-numpy/files =3D&gt; python/pytho=
n3-numpy}/0001-numpy-core-Define-RISCV-32-support.patch (100%)<br>
=C2=A0rename meta/recipes-devtools/{python-numpy/files =3D&gt; python/pytho=
n3-numpy}/run-ptest (100%)<br>
=C2=A0rename meta/recipes-devtools/{python-numpy =3D&gt; python}/<a href=3D=
"http://python3-numpy_1.21.4.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-numpy_1.21.4.bb</a> (98%)<br>
<br>
diff --git a/meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr=
-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/p=
ython3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patc=
h<br>
similarity index 100%<br>
rename from meta/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-=
and-so-on-for-libraries-by-default-.patch<br>
rename to meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-=
and-so-on-for-libraries-by-default-.patch<br>
diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Defin=
e-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-=
numpy-core-Define-RISCV-32-support.patch<br>
similarity index 100%<br>
rename from meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define=
-RISCV-32-support.patch<br>
rename to meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define=
-RISCV-32-support.patch<br>
diff --git a/meta/recipes-devtools/python-numpy/files/run-ptest b/meta/reci=
pes-devtools/python/python3-numpy/run-ptest<br>
similarity index 100%<br>
rename from meta/recipes-devtools/python-numpy/files/run-ptest<br>
rename to meta/recipes-devtools/python/python3-numpy/run-ptest<br>
diff --git a/meta/recipes-devtools/python-numpy/<a href=3D"http://python3-n=
umpy_1.21.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.21.4.b=
b</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-numpy_1.21.4=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.21.4.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-devtools/python-numpy/<a href=3D"http://python3-nu=
mpy_1.21.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.21.4.bb=
</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-numpy_1.21=
.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.21.4.bb</a><br>
index 8988a5bc39..a3ea4ab5aa 100644<br>
--- a/meta/recipes-devtools/python-numpy/<a href=3D"http://python3-numpy_1.=
21.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.21.4.bb</a><b=
r>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-numpy_1.21.4.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-numpy_1.21.4.bb</a><br>
@@ -47,6 +47,7 @@ RDEPENDS:${PN} =3D &quot;${PYTHON_PN}-unittest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTH=
ON_PN}-ctypes \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTH=
ON_PN}-threading \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTH=
ON_PN}-multiprocessing \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PYTHON_PN=
}-json \<br>
=C2=A0&quot;<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot;${PYTHON_PN}-pytest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${PYTHON_PN}-hypothesis \<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000007c81f505d0aebf7f--

