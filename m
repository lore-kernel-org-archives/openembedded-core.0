Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.23253.1612719908940904859
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 09:45:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ftsa2OOZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id t5so15475861eds.12
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 09:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ATBy2bSTXlccY+hXkWBASpmxWSKA/5tpS7+UeMQVHc=;
        b=Ftsa2OOZrrJgEeULe0S10LkU2jJLxe0f77LlEIMTY9Xcr8NAJ1yN7SgkTsiIYRqZNw
         opvtZbV3l+lp9kSzl1MGhy0Vn8L/t6TbKKQesCtJe98LlTzwM5btfbU7gLGLwb7Dohz0
         ykDTcFH8l6vxyr03bbbyBfK66WLWczSKHmxH3TxQ2b8NatJ1axS8nysUMiGTlOVohfl8
         Q0xDlWgNiXHZ9bCuz/8/gn2MT1jSnAmaiHiXR+YuwYKBZfqAVWyXsfM8SxAm+ypzCOHc
         eCVJO7/jEThTwj36UNFfMQj1Vpzg/TOVOJRFZgrhSnKENU/S42j4JMuWj5Gy+tx9c9rr
         jiMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ATBy2bSTXlccY+hXkWBASpmxWSKA/5tpS7+UeMQVHc=;
        b=IKRaJ1iJ0n8fFo6uIgS6BMYzGVmSeKCoNTtlWdaFuvbdEiZjGoV2uJtgPf4RObIM8Z
         2tSq9T5TcUm2g4sfu4ntxxot3PYDmu9W5IUUVGbIdMl/hLtiyhwn3lCtq6NV1JCJOcF5
         HZS/HFjuGMyKxGl+/cRfvfrcsnc0shU2EOBjBiaykxLgLCDegSBqQIZTfzj4pXKoUnep
         vGYaFWvLNvXgs/Ygz8/A80xm9J0jurgAZ5tebU6VvgqjZhTaRKMCoZBPYMnZXgRyxZQU
         FndulTOEPh7jYhaFn1Y5D3PPFRNj7itTDQkyrkOvoZkpO+0A2cc10tBeZ9PBXkbTJRr6
         EmYw==
X-Gm-Message-State: AOAM530J5trBxl+baULi9THwRIJeGALreqsOZBOa1o7rKObQ3hZf65eJ
	M/pPdG5rhMZZPTXkbUbfEmIaaQtC9YP0RyaW8sQ=
X-Google-Smtp-Source: ABdhPJwVrdstt/hlb1HmzTriJvXAPwsXbd/DnZooJWR1Vj3pNgUOMpUQozcP4hiOwl1Mi1QsJvlpkzpez+q8SUdHNAQ=
X-Received: by 2002:a05:6402:50ca:: with SMTP id h10mr2558122edb.95.1612719907422;
 Sun, 07 Feb 2021 09:45:07 -0800 (PST)
MIME-Version: 1.0
References: <1661542D5AB7E6CB.25597@lists.openembedded.org>
In-Reply-To: <1661542D5AB7E6CB.25597@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sun, 7 Feb 2021 17:44:57 +0000
Message-ID: <CANPvuRktjWmu-ddmBoV=XX24_Xxn5eeQGXRDAMjZuiEWOHL7Eg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] glslang: only build shared libs for dev packages
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003442e405bac29d08"

--0000000000003442e405bac29d08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This patch fail at do_package_qa
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/3035/ste=
ps/11/logs/errors

So I will sent a V2 that drop this patch


Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia domingo, 7/02/2021 =C3=
=A0(s)
01:51:

> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  ...g-default-resource-limits-lib-static.patch | 28 +++++++++++++++++++
>  .../glslang/glslang_11.1.0.bb                 |  7 ++---
>  2 files changed, 31 insertions(+), 4 deletions(-)
>  create mode 100644
> meta/recipes-graphics/glslang/glslang/0001-build-the-glslang-default-res=
ource-limits-lib-static.patch
>
> diff --git
> a/meta/recipes-graphics/glslang/glslang/0001-build-the-glslang-default-r=
esource-limits-lib-static.patch
> b/meta/recipes-graphics/glslang/glslang/0001-build-the-glslang-default-r=
esource-limits-lib-static.patch
> new file mode 100644
> index 0000000000..111d85b212
> --- /dev/null
> +++
> b/meta/recipes-graphics/glslang/glslang/0001-build-the-glslang-default-r=
esource-limits-lib-static.patch
> @@ -0,0 +1,28 @@
> +From 58ebb16f1ea50dbc4096ea24292be8e174528d75 Mon Sep 17 00:00:00 2001
> +From: Jose Quaresma <quaresma.jose@gmail.com>
> +Date: Sun, 7 Feb 2021 01:30:39 +0000
> +Subject: [PATCH] build the glslang-default-resource-limits lib statical=
ly
> +
> +Taken from
> https://src.fedoraproject.org/rpms/glslang/blob/main/f/glslang-default-r=
esource-limits_staticlib.patch
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> +
> +---
> + StandAlone/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/StandAlone/CMakeLists.txt b/StandAlone/CMakeLists.txt
> +index bff9ab61..c4d10ae9 100644
> +--- a/StandAlone/CMakeLists.txt
> ++++ b/StandAlone/CMakeLists.txt
> +@@ -31,7 +31,7 @@
> + # ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
> + # POSSIBILITY OF SUCH DAMAGE.
> +
> +-add_library(glslang-default-resource-limits
> ++add_library(glslang-default-resource-limits STATIC
> +             ${CMAKE_CURRENT_SOURCE_DIR}/ResourceLimits.cpp
> +             ${CMAKE_CURRENT_SOURCE_DIR}/resource_limits_c.cpp)
> + set_property(TARGET glslang-default-resource-limits PROPERTY FOLDER
> glslang)
> diff --git a/meta/recipes-graphics/glslang/glslang_11.1.0.bb
> b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
> index fe21dbcf50..7e83ff0626 100644
> --- a/meta/recipes-graphics/glslang/glslang_11.1.0.bb
> +++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
> @@ -9,7 +9,9 @@ LICENSE =3D "BSD-3-Clause & BSD-2-Clause & MIT & Apache-=
2.0
> & GPL-3-with-bison-exc
>  LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3Dc5ce49c0456e9b413b98a4368c378229"
>
>  SRCREV =3D "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
> -SRC_URI =3D "git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps=
"
> +SRC_URI =3D "git://github.com/KhronosGroup/glslang.git;protocol=3Dhttps=
 \
> +
>  file://0001-build-the-glslang-default-resource-limits-lib-static.patch =
\
> +           "
>  UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)$"
>  S =3D "${WORKDIR}/git"
>
> @@ -23,7 +25,4 @@ EXTRA_OECMAKE =3D " \
>      -DBUILD_EXTERNAL=3DOFF \
>  "
>
> -SOLIBSDEV =3D "glslang.so"
> -FILES_${PN} +=3D "${libdir}/*.so"
> -
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.30.0
>
>
>=20
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--0000000000003442e405bac29d08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div>This patch fail at=C2=A0do_pa=
ckage_qa<div><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/buil=
ders/45/builds/3035/steps/11/logs/errors">https://autobuilder.yoctoproject.=
org/typhoon/#/builders/45/builds/3035/steps/11/logs/errors</a><br></div><di=
v><br></div><div>So I will sent a V2 that drop this patch</div><div><br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Jose Quaresma via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org">gmail.com@lists.openembedded.org</a>&gt; escreveu no dia doming=
o, 7/02/2021 =C3=A0(s) 01:51:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.j=
ose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0...g-default-resource-limits-lib-static.patch | 28 +++++++++++++++++=
++<br>
=C2=A0.../glslang/<a href=3D"http://glslang_11.1.0.bb" rel=3D"noreferrer" =
target=3D"_blank">glslang_11.1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 ++---<br>
=C2=A02 files changed, 31 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/glslang/glslang/0001-build-=
the-glslang-default-resource-limits-lib-static.patch<br>
<br>
diff --git a/meta/recipes-graphics/glslang/glslang/0001-build-the-glslang-=
default-resource-limits-lib-static.patch b/meta/recipes-graphics/glslang/gl=
slang/0001-build-the-glslang-default-resource-limits-lib-static.patch<br>
new file mode 100644<br>
index 0000000000..111d85b212<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/glslang/glslang/0001-build-the-glslang-default=
-resource-limits-lib-static.patch<br>
@@ -0,0 +1,28 @@<br>
+From 58ebb16f1ea50dbc4096ea24292be8e174528d75 Mon Sep 17 00:00:00 2001<br=
>
+From: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=
=
=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
+Date: Sun, 7 Feb 2021 01:30:39 +0000<br>
+Subject: [PATCH] build the glslang-default-resource-limits lib statically=
<br>
+<br>
+Taken from <a href=3D"https://src.fedoraproject.org/rpms/glslang/blob/mai=
n/f/glslang-default-resource-limits_staticlib.patch" rel=3D"noreferrer" tar=
get=3D"_blank">https://src.fedoraproject.org/rpms/glslang/blob/main/f/glsla=
ng-default-resource-limits_staticlib.patch</a><br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.co=
m" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
+<br>
+---<br>
+ StandAlone/CMakeLists.txt | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/StandAlone/CMakeLists.txt b/StandAlone/CMakeLists.txt<br>
+index bff9ab61..c4d10ae9 100644<br>
+--- a/StandAlone/CMakeLists.txt<br>
++++ b/StandAlone/CMakeLists.txt<br>
+@@ -31,7 +31,7 @@<br>
+ # ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE<br>
+ # POSSIBILITY OF SUCH DAMAGE.<br>
+ <br>
+-add_library(glslang-default-resource-limits<br>
++add_library(glslang-default-resource-limits STATIC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${CMAKE_CURRENT_SOURCE_DI=
R}/ResourceLimits.cpp<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${CMAKE_CURRENT_SOURCE_DI=
R}/resource_limits_c.cpp)<br>
+ set_property(TARGET glslang-default-resource-limits PROPERTY FOLDER glsl=
ang)<br>
diff --git a/meta/recipes-graphics/glslang/<a href=3D"http://glslang_11.1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">glslang_11.1.0.bb</a> b/meta/rec=
ipes-graphics/glslang/<a href=3D"http://glslang_11.1.0.bb" rel=3D"noreferre=
r" target=3D"_blank">glslang_11.1.0.bb</a><br>
index fe21dbcf50..7e83ff0626 100644<br>
--- a/meta/recipes-graphics/glslang/<a href=3D"http://glslang_11.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">glslang_11.1.0.bb</a><br>
+++ b/meta/recipes-graphics/glslang/<a href=3D"http://glslang_11.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">glslang_11.1.0.bb</a><br>
@@ -9,7 +9,9 @@ LICENSE =3D &quot;BSD-3-Clause &amp; BSD-2-Clause &amp; MI=
T &amp; Apache-2.0 &amp; GPL-3-with-bison-exc<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3Dc5ce49c0456e9b41=
3b98a4368c378229&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;c594de23cdd790d64ad5f9c8b059baae0ee2941d&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/glslang=
.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/Khro=
nosGroup/glslang.git;protocol=3Dhttps</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/glslang=
.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/Khro=
nosGroup/glslang.git;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-the-glslang-de=
fault-resource-limits-lib-static.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;^(?P&lt;pver&gt;\d+(\.\d+)+)$&q=
uot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
@@ -23,7 +25,4 @@ EXTRA_OECMAKE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-DBUILD_EXTERNAL=3DOFF \<br>
=C2=A0&quot;<br>
<br>
-SOLIBSDEV =3D &quot;glslang.so&quot;<br>
-FILES_${PN} +=3D &quot;${libdir}/*.so&quot;<br>
-<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.30.0<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Qua=
resma</div></div>

--0000000000003442e405bac29d08--
