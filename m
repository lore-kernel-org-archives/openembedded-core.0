Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
	[209.85.222.41])
	by mail.openembedded.org (Postfix) with ESMTP id 547BD7F23A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2019 18:58:58 +0000 (UTC)
Received: by mail-ua1-f41.google.com with SMTP id k12so3083585uan.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2019 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EUmLvXUW09eg8ngWylZTzdwXL1vDLt0hmGJVewhYnHA=;
	b=jQwIc34Nm4SjDS7SnugSSMZjVMGwUYLAoukhwfhJD7enTeTwq9f6ooJgRorXu/S94a
	z5D5CmdETMQnzCBuJsfjMl4DAMj5F5WFk2qcCNFdPg381P0v1gaxk1nYeAjQcgNfvNb+
	kwFmcg1qh3wknUnp+Qx9rhTUKzgDQH+C5VfCBl5AWDzX6FrHxXoGo4urD1wi+wQV8MpX
	dYEUxCWxJV6J9gBnyJTMuNjiYRp5RM9Mt5LKj3dSZh0Xv5USfmB6ykIfFcjdKo5Fom9P
	lJigg9qyskjZiAQhI/2ky0tw7mQ0IgPvh48LNJMEksjsEBj0vCBMTRjBUqYX5puDHgb4
	IMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EUmLvXUW09eg8ngWylZTzdwXL1vDLt0hmGJVewhYnHA=;
	b=uRl/rYdtPRL9TokdxR23cE7sXh86WJx7n3p7+zFglvjU5hlV9O4dLsTrVp0sImDs1g
	hiDeyjZzi9USDFmo1qk+qsnodF/yEbZfNxKqrVRVvPdMWB7A5WRGpHGAr78NE4x8jC+t
	MiM6S1m9+F60/FSItpw/dI87RckHC+NwunKEM1Pl8qFFG3v1ehhqeALW+OnMsNG/qm/V
	0ySEmAKqvUJzlyRp9QVuBKOVFo0rsi1Njqs7eenS/hYeHEHxRkXstNa+US5fHAuDi7F+
	cGhcciQABdQtOi9jWdvuCtwKYAMU8DXxYnwks+C2Xpg8botwu2gVwQ39JmJV+ZYlq6FJ
	cuvQ==
X-Gm-Message-State: APjAAAXzqjTBy7g5KBFdY7T3HGaGFNMM39rvDQ6HOgAO3XSFRay+l4Cz
	q6TkSjjjcwv7/xRR1aJycL0pNbRhipYqsEwBhyo=
X-Google-Smtp-Source: APXvYqy3nQolgxlfqms8e0Hsi2M9YRd0WezS42lsYOMjs0bfJIiAMdQHsySUuWnqcuJG0rZ9vaXpTaAPHnVqdvzH/B4=
X-Received: by 2002:ab0:e19:: with SMTP id g25mr19449402uak.71.1567623539194; 
	Wed, 04 Sep 2019 11:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190904184928.8414-1-raj.khem@gmail.com>
In-Reply-To: <20190904184928.8414-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Sep 2019 20:58:47 +0200
Message-ID: <CANNYZj-J1YCrZaKvyH8u=aqy45wXfvSyXERvkmgCFY8C1-xZnQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] python3native, pythonnative: export PYTHON_LIBRARY and PYTHON_INCLUDE_DIR
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
X-List-Received-Date: Wed, 04 Sep 2019 18:58:58 -0000
Content-Type: multipart/alternative; boundary="0000000000003207430591beccb8"

--0000000000003207430591beccb8
Content-Type: text/plain; charset="UTF-8"

Thanks, this looks good now.

Alex

On Wed, 4 Sep 2019 at 20:49, Khem Raj <raj.khem@gmail.com> wrote:

> packages can use
>
> find_package(PythonInterp REQUIRED)
> find_package(PythonLibs REQUIRED)
>
> while we control PYTHON pointing to native py3 the libs and include
> directories will then point to build host version, which can result in
> unexpected combination and if we are lucky we get errors if its quite
> different e.g. py2 libs/includes and py3 executable
>
> This variable can be then used to export PYTHON_LIBRARY and
> PYTHON_INCLUDE_DIR so that above find_packages can work correctly
>
> see [1] for how it happens in cmake
>
> LLDB uses it see [2]
>
> [1]
> https://github.com/Kitware/CMake/blob/master/Modules/FindPythonLibs.cmake
> [2]
> https://github.com/llvm/llvm-project/blob/master/lldb/cmake/modules/LLDBConfig.cmake#L226
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Use PYTHON_DIR variable
>
>  meta/classes/python3native.bbclass | 8 ++++++++
>  meta/classes/pythonnative.bbclass  | 8 ++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/meta/classes/python3native.bbclass
> b/meta/classes/python3native.bbclass
> index a3acaf61bb..768302488b 100644
> --- a/meta/classes/python3native.bbclass
> +++ b/meta/classes/python3native.bbclass
> @@ -9,6 +9,14 @@ DEPENDS_append = " python3-native "
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
>
> +# Packages can use
> +# find_package(PythonInterp REQUIRED)
> +# find_package(PythonLibs REQUIRED)
> +# which ends up using libs/includes from build host
> +# Therefore pre-empt that effort
> +export PYTHON_LIBRARY="${STAGING_LIBDIR}/${PYTHON_DIR}"
> +export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
> +
>  export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
>
>  # suppress host user's site-packages dirs.
> diff --git a/meta/classes/pythonnative.bbclass
> b/meta/classes/pythonnative.bbclass
> index ae6600cd15..604423b80e 100644
> --- a/meta/classes/pythonnative.bbclass
> +++ b/meta/classes/pythonnative.bbclass
> @@ -12,6 +12,14 @@ DEPENDS_append = " python-native "
>  export STAGING_INCDIR
>  export STAGING_LIBDIR
>
> +# Packages can use
> +# find_package(PythonInterp REQUIRED)
> +# find_package(PythonLibs REQUIRED)
> +# which ends up using libs/includes from build host
> +# Therefore pre-empt that effort
> +export PYTHON_LIBRARY="${STAGING_LIBDIR}/${PYTHON_DIR}"
> +export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
> +
>  # suppress host user's site-packages dirs.
>  export PYTHONNOUSERSITE = "1"
>
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003207430591beccb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, this looks good now.</div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 4 Sep 2019 at 20:49, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">packages can use<br>
<br>
find_package(PythonInterp REQUIRED)<br>
find_package(PythonLibs REQUIRED)<br>
<br>
while we control PYTHON pointing to native py3 the libs and include<br>
directories will then point to build host version, which can result in<br>
unexpected combination and if we are lucky we get errors if its quite<br>
different e.g. py2 libs/includes and py3 executable<br>
<br>
This variable can be then used to export PYTHON_LIBRARY and<br>
PYTHON_INCLUDE_DIR so that above find_packages can work correctly<br>
<br>
see [1] for how it happens in cmake<br>
<br>
LLDB uses it see [2]<br>
<br>
[1] <a href=3D"https://github.com/Kitware/CMake/blob/master/Modules/FindPyt=
honLibs.cmake" rel=3D"noreferrer" target=3D"_blank">https://github.com/Kitw=
are/CMake/blob/master/Modules/FindPythonLibs.cmake</a><br>
[2] <a href=3D"https://github.com/llvm/llvm-project/blob/master/lldb/cmake/=
modules/LLDBConfig.cmake#L226" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/llvm/llvm-project/blob/master/lldb/cmake/modules/LLDBConfig.cma=
ke#L226</a><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
v2: Use PYTHON_DIR variable<br>
<br>
=C2=A0meta/classes/python3native.bbclass | 8 ++++++++<br>
=C2=A0meta/classes/pythonnative.bbclass=C2=A0 | 8 ++++++++<br>
=C2=A02 files changed, 16 insertions(+)<br>
<br>
diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3nativ=
e.bbclass<br>
index a3acaf61bb..768302488b 100644<br>
--- a/meta/classes/python3native.bbclass<br>
+++ b/meta/classes/python3native.bbclass<br>
@@ -9,6 +9,14 @@ DEPENDS_append =3D &quot; python3-native &quot;<br>
=C2=A0export STAGING_INCDIR<br>
=C2=A0export STAGING_LIBDIR<br>
<br>
+# Packages can use<br>
+# find_package(PythonInterp REQUIRED)<br>
+# find_package(PythonLibs REQUIRED)<br>
+# which ends up using libs/includes from build host<br>
+# Therefore pre-empt that effort<br>
+export PYTHON_LIBRARY=3D&quot;${STAGING_LIBDIR}/${PYTHON_DIR}&quot;<br>
+export PYTHON_INCLUDE_DIR=3D&quot;${STAGING_INCDIR}/${PYTHON_DIR}&quot;<br=
>
+<br>
=C2=A0export _PYTHON_SYSCONFIGDATA_NAME=3D&quot;_sysconfigdata&quot;<br>
<br>
=C2=A0# suppress host user&#39;s site-packages dirs.<br>
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.=
bbclass<br>
index ae6600cd15..604423b80e 100644<br>
--- a/meta/classes/pythonnative.bbclass<br>
+++ b/meta/classes/pythonnative.bbclass<br>
@@ -12,6 +12,14 @@ DEPENDS_append =3D &quot; python-native &quot;<br>
=C2=A0export STAGING_INCDIR<br>
=C2=A0export STAGING_LIBDIR<br>
<br>
+# Packages can use<br>
+# find_package(PythonInterp REQUIRED)<br>
+# find_package(PythonLibs REQUIRED)<br>
+# which ends up using libs/includes from build host<br>
+# Therefore pre-empt that effort<br>
+export PYTHON_LIBRARY=3D&quot;${STAGING_LIBDIR}/${PYTHON_DIR}&quot;<br>
+export PYTHON_INCLUDE_DIR=3D&quot;${STAGING_INCDIR}/${PYTHON_DIR}&quot;<br=
>
+<br>
=C2=A0# suppress host user&#39;s site-packages dirs.<br>
=C2=A0export PYTHONNOUSERSITE =3D &quot;1&quot;<br>
<br>
-- <br>
2.23.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000003207430591beccb8--
