Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web08.22921.1625672991149964057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 08:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IkhsbIX6;
 spf=pass (domain: gmail.com, ip: 209.85.222.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id v22so947393uaj.13
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sAutDj51mMoMPAQ2hVgtMLvPXqmJRHEp6CzRKDchvNw=;
        b=IkhsbIX6Lh7ySE7FXm7dxL5N9YjysVj7ZF4sjVSzhb6UrYjc0sBG/+aAPviWbcDyLa
         uDBMJ0wN3GGTNWfTh6pG3SS2jEEk48Q2Wjt29No+BeWmvZGK1RXUduGh6wLI6El3/ToE
         Nxpt8FGBgqyFJeSdkGaBOzjargdZih0N4hs+E3tehaZ7yjEAgoeUXMneb/7gv7LiI+A2
         vbyQvQ2ethy8zFiIfaTZL+TPxY2QFB0zA7y9MlegrWX4H9EPtHLC1INFp5wTyJ0Te0qh
         oZDx9Hj3Bqx/tIuUJZ+FjQ2+8mALTMRLmWQXeqZFvrWcT1yHAb1ztIbf+ggAToD4DMrG
         a+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sAutDj51mMoMPAQ2hVgtMLvPXqmJRHEp6CzRKDchvNw=;
        b=KJySfLL3IybRPbX+/P19OInYCLil8BAskV1I4vOdv1Xrp+mXByl0UtLfJK6cZcjQDm
         gVQ8Q57UnbVFnK8kA2lQI37xzM0SbETVIn2uFw5VYg70yCy2UTtKPYKvMzicZg8khXpT
         PlccgUHewfuxMxNUGTgmFKpr+qnoDWfDVGL1ZXhyvS0SP+qYuT2gFbtoyiblS+jVTUPt
         Fx/HAXcacfYnFMErYlOt//dlYibyHrwqWI6qiHoqF2ZnZPkvlwXTOoLR5FUh+XVtYX9M
         mFjOAxe6jyNZ2yR827qNDyGImau3H7dkf8CM+koi0p87OI/5yVWC52zwg0Och/tE4qhU
         z3Pg==
X-Gm-Message-State: AOAM530ZLF2P3XT0muzE50EP3IGL7fsShhiyBCwGSZsg/c7lV5bINH8Z
	vSR9outh7sSVAl+65xodJYPMgRQhBkR3GyEe3oo=
X-Google-Smtp-Source: ABdhPJxDh/PbldnSFsd55Z8uyAKpAghScRpPKjZk0hzflFIDa21oQSUlCbxyRX9N7SeJVpBrEfCB8HCKrqJCACZdGi0=
X-Received: by 2002:ab0:5962:: with SMTP id o31mr22639265uad.89.1625672990262;
 Wed, 07 Jul 2021 08:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <1625672669-3918-1-git-send-email-wangmy@fujitsu.com> <1625672669-3918-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1625672669-3918-3-git-send-email-wangmy@fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 7 Jul 2021 17:49:38 +0200
Message-ID: <CANNYZj8hv+OZvKpYd=azJb7ReSEJKzYxc88dsG-y=hQ5SE3S9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-setuptools: upgrade 57.0.0 -> 57.1.0
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001b0a0f05c68a7d2e"

--0000000000001b0a0f05c68a7d2e
Content-Type: text/plain; charset="UTF-8"

Seems like reproducibility.patch can actually be removed, as it was
accepted upstream?

Alex

On Wed, 7 Jul 2021 at 17:45, wangmy <wangmy@fujitsu.com> wrote:

> refresh reproducibility.patch
>
> v57.1.0
> -------
>
> Changes
> ^^^^^^^
> * #2692: Globs are now sorted in 'license_files' restoring reproducibility
> by eliminating variance from disk order.
> * #2714: Update to distutils at pypa/distutils@e2627b7.
> * #2715: Removed reliance on deprecated ssl.match_hostname by removing the
> ssl support. Now any index operations rely on the native SSL implementation.
>
> Documentation changes
> ^^^^^^^^^^^^^^^^^^^^^
> * #2604: Revamped the backward/cross tool compatibility section to remove
>   some confusion.
>   Add some examples and the version since when ``entry_points`` are
>   supported in declarative configuration.
>   Tried to make the reading flow a bit leaner, gather some informations
>   that were a bit dispersed.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python3-setuptools/reproducibility.patch  | 21 ++++++++++++-------
>  ...57.0.0.bb => python3-setuptools_57.1.0.bb} |  2 +-
>  2 files changed, 15 insertions(+), 8 deletions(-)
>  rename meta/recipes-devtools/python/{python3-setuptools_57.0.0.bb =>
> python3-setuptools_57.1.0.bb} (94%)
>
> diff --git
> a/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
> b/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
> index 149d8ad5ce..fda520658e 100644
> --- a/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
> +++ b/meta/recipes-devtools/python/python3-setuptools/reproducibility.patch
> @@ -1,4 +1,4 @@
> -The License-File lines in PKG-INFO change ordering depending on the order
> on disk,
> +The License-File lines in PKG-INFO change ordering depending on the order
> on disk,
>  for example for python-packaging, one build shows:
>
>  License-File: LICENSE
> @@ -15,11 +15,15 @@ This is because glob uses os.listdir() which is
> unsorted. Sort the result to avo
>
>  Upstream-Status: Submitted [
> https://github.com/pypa/setuptools/issues/2691]
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> +---
> + setuptools/dist.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
>
> -Index: setuptools-57.0.0/setuptools/dist.py
> -===================================================================
> ---- setuptools-57.0.0.orig/setuptools/dist.py
> -+++ setuptools-57.0.0/setuptools/dist.py
> +diff --git a/setuptools/dist.py b/setuptools/dist.py
> +index df071c1..fe3c5da 100644
> +--- a/setuptools/dist.py
> ++++ b/setuptools/dist.py
>  @@ -15,7 +15,7 @@ import distutils.command
>   from distutils.util import strtobool
>   from distutils.debug import DEBUG
> @@ -29,12 +33,15 @@ Index: setuptools-57.0.0/setuptools/dist.py
>   import itertools
>   import textwrap
>   from typing import List, Optional, TYPE_CHECKING
> -@@ -603,7 +603,7 @@ class Distribution(_Distribution):
> +@@ -609,7 +609,7 @@ class Distribution(_Distribution):
>           return (
>               path
>               for pattern in patterns
> --            for path in iglob(pattern)
> +-            for path in sorted(iglob(pattern))
>  +            for path in sorted(glob(pattern))
>               if not path.endswith('~')
>               and os.path.isfile(path)
>           )
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
> b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
> rename to meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
> index a15b51e31c..3c7aa4c4c5 100644
> --- a/meta/recipes-devtools/python/python3-setuptools_57.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-setuptools_57.1.0.bb
> @@ -11,7 +11,7 @@ SRC_URI_append_class-native = "
> file://0001-conditionally-do-not-fetch-code-by-e
>  SRC_URI += "file://0001-change-shebang-to-python3.patch \
>              file://reproducibility.patch"
>
> -SRC_URI[sha256sum] =
> "401cbf33a7bf817d08014d51560fc003b895c4cdc1a5b521ad2969e928a07535"
> +SRC_URI[sha256sum] =
> "cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63afddd82d681de4d22a597b"
>
>  DEPENDS += "${PYTHON_PN}"
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000001b0a0f05c68a7d2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Seems like reproducibility.patch can actually be remo=
ved, as it was accepted upstream?</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, 7 Jul 2021 at 17:45, wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com"=
>wangmy@fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">refresh reproducibility.patch<br>
<br>
v57.1.0<br>
-------<br>
<br>
Changes<br>
^^^^^^^<br>
* #2692: Globs are now sorted in &#39;license_files&#39; restoring reprodu=
cibility by eliminating variance from disk order.<br>
* #2714: Update to distutils at pypa/distutils@e2627b7.<br>
* #2715: Removed reliance on deprecated ssl.match_hostname by removing the=
 ssl support. Now any index operations rely on the native SSL implementatio=
n.<br>
<br>
Documentation changes<br>
^^^^^^^^^^^^^^^^^^^^^<br>
* #2604: Revamped the backward/cross tool compatibility section to remove<=
br>
=C2=A0 some confusion.<br>
=C2=A0 Add some examples and the version since when ``entry_points`` are<b=
r>
=C2=A0 supported in declarative configuration.<br>
=C2=A0 Tried to make the reading flow a bit leaner, gather some informatio=
ns<br>
=C2=A0 that were a bit dispersed.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../python3-setuptools/reproducibility.patch=C2=A0 | 21 ++++++++++++=
-------<br>
=C2=A0...<a href=3D"http://57.0.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>57.0.0.bb</a> =3D&gt; <a href=3D"http://python3-setuptools_57.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-setuptools_57.1.0.bb</a>} |=C2=
=A0 2 +-<br>
=C2=A02 files changed, 15 insertions(+), 8 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3-setup=
tools_57.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57=
.0.0.bb</a> =3D&gt; <a href=3D"http://python3-setuptools_57.1.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-setuptools_57.1.0.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-setuptools/reproducibili=
ty.patch b/meta/recipes-devtools/python/python3-setuptools/reproducibility.=
patch<br>
index 149d8ad5ce..fda520658e 100644<br>
--- a/meta/recipes-devtools/python/python3-setuptools/reproducibility.patc=
h<br>
+++ b/meta/recipes-devtools/python/python3-setuptools/reproducibility.patc=
h<br>
@@ -1,4 +1,4 @@<br>
-The License-File lines in PKG-INFO change ordering depending on the order=
 on disk, <br>
+The License-File lines in PKG-INFO change ordering depending on the order=
 on disk,<br>
=C2=A0for example for python-packaging, one build shows:<br>
<br>
=C2=A0License-File: LICENSE<br>
@@ -15,11 +15,15 @@ This is because glob uses os.listdir() which is unsort=
ed. Sort the result to avo<br>
<br>
=C2=A0Upstream-Status: Submitted [<a href=3D"https://github.com/pypa/setup=
tools/issues/2691" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
pypa/setuptools/issues/2691</a>]<br>
=C2=A0Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a=
>&gt;<br>
+Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targ=
et=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
+---<br>
+ setuptools/dist.py | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
-Index: setuptools-57.0.0/setuptools/dist.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- setuptools-57.0.0.orig/setuptools/dist.py<br>
-+++ setuptools-57.0.0/setuptools/dist.py<br>
+diff --git a/setuptools/dist.py b/setuptools/dist.py<br>
+index df071c1..fe3c5da 100644<br>
+--- a/setuptools/dist.py<br>
++++ b/setuptools/dist.py<br>
=C2=A0@@ -15,7 +15,7 @@ import distutils.command<br>
=C2=A0 from distutils.util import strtobool<br>
=C2=A0 from distutils.debug import DEBUG<br>
@@ -29,12 +33,15 @@ Index: setuptools-57.0.0/setuptools/dist.py<br>
=C2=A0 import itertools<br>
=C2=A0 import textwrap<br>
=C2=A0 from typing import List, Optional, TYPE_CHECKING<br>
-@@ -603,7 +603,7 @@ class Distribution(_Distribution):<br>
+@@ -609,7 +609,7 @@ class Distribution(_Distribution):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for pattern in patterns<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path in iglob(pattern)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path in sorted(iglob(patte=
rn))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for path in sorted(glob(p=
attern))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not path.endswith(&#39=
;~&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and os.path.isfile(path)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-setupt=
ools_57.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.=
0.0.bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-setupto=
ols_57.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.1=
.0.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-devtools/python/<a href=3D"http://python3-setupto=
ols_57.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.0=
.0.bb</a><br>
rename to meta/recipes-devtools/python/<a href=3D"http://python3-setuptool=
s_57.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.1.0=
.bb</a><br>
index a15b51e31c..3c7aa4c4c5 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-setuptools_57=
.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.0.0.bb<=
/a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-setuptools_57=
.1.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_57.1.0.bb<=
/a><br>
@@ -11,7 +11,7 @@ SRC_URI_append_class-native =3D &quot; file://0001-condi=
tionally-do-not-fetch-code-by-e<br>
=C2=A0SRC_URI +=3D &quot;file://0001-change-shebang-to-python3.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reproducibility.pat=
ch&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;401cbf33a7bf817d08014d51560fc003b895c4cdc1a5=
b521ad2969e928a07535&quot;<br>
+SRC_URI[sha256sum] =3D &quot;cfca9c97e7eebbc8abe18d5e5e962a08dcad55bb63af=
ddd82d681de4d22a597b&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;${PYTHON_PN}&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000001b0a0f05c68a7d2e--
