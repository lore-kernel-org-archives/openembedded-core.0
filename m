Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.2419.1628239357183419177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 01:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gAsWdAHC;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id a8so4766192vsl.4
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RlxLl54xcJnkl+UxgRl61sc8FtSZrl5QqAs2FNeoCPE=;
        b=gAsWdAHCaDgdVhBXFJbhT9X1BoR3CdIf0Zez8WFu8lG0NIlYhwVkz+UIGFzFSHJz6V
         zJHVpNEezZMXn9YBOnL/C55/I6zDvUaFoyAjqUYUWwup0eRV4adLVdGE1j30ANk6qXOR
         u4eE6wAPXdbnHSpvF9xU4RLPpLsIjDQLBpNvG77E+Aw1AvC04GhBSUXTe2HchkN5YDg6
         voEEbVWNaoThJUk5EViKx0bGOCEXHjkUasV+CXM7r54GUAee0u1o/X3s8HgU4DuxeTee
         57xPHiBFi+ak4VVovLAc7nvBQo0bJMOiTiEvJC7RAOuCwVytHlRKo3j7AmsfDn5vtwTx
         XDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RlxLl54xcJnkl+UxgRl61sc8FtSZrl5QqAs2FNeoCPE=;
        b=Ogqd4uZH/hHY/Fxf+UzbOaxUzGAlDoTb6pRl2xrFRlaiprP7/hOP6JUTRshVYhMrR6
         XWxOwBPlxtTzBe7sZni0oYGF6ctpZxBq/P2/ZXqyRhiiirUmm2hV5A9nk3B0UglxSjy+
         65zWdhz3b7gXlg1nVjj+DGjNlg7H3kp4tzDqOi304r801zdYJspgQbbF5u2SMRGmB0nW
         Ji/fhyHHnWiSKS2QzSqb3lb1/T2tn5JpErFG6vcjSiQsprmYen0XRrusQb452px4mviA
         XZS7colu/Xev4NabIdTsi44gD64DvKGR17IjyhDH0fbiQth5HbDKfWGh4hWeaggJ4Lyt
         36MA==
X-Gm-Message-State: AOAM533oDZUbVYi7rbgZ/wf1fZjyjLE91rufHMKP+bhMU/jauoVTLsI7
	xlnI7keVIv8nPTfhg3zlyIyn92vnT3m8u8Xw37c=
X-Google-Smtp-Source: ABdhPJyANHgX9HnDIdWywNSkmUKs1DhH3ySBLTuxIvw4ATD6OIko6U6+ZTz0ONoeo7UNrdKgjfINhSekMvcCnlO69Yo=
X-Received: by 2002:a67:e981:: with SMTP id b1mr7990776vso.41.1628239356348;
 Fri, 06 Aug 2021 01:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210805201805.83727-1-joe.slater@windriver.com>
In-Reply-To: <20210805201805.83727-1-joe.slater@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 6 Aug 2021 10:42:25 +0200
Message-ID: <CANNYZj_+M0GkJG1Jq3CEGVaD9p6PhN7-fvN_XZ7M+Yt7mRLawQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] icu: increase command buffer size
To: Joe Slater <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000071cc4f05c8e004b1"

--00000000000071cc4f05c8e004b1
Content-Type: text/plain; charset="UTF-8"

Upstream-Status is missing, and this looks like something that should be
sent upstream first for review.

Alex

On Thu, 5 Aug 2021 at 22:22, Joe Slater <joe.slater@windriver.com> wrote:

> Make cmd in pkg_installLibrary() LARGE_BUFFER_SIZE to avoid
> pathname truncation if the install path is longer than about
> 150 characters.  For default compilation, the U_ASSERT does
> not detect buffer overflow.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  ...pkgdata-increase-command-buffer-size.patch | 41 +++++++++++++++++++
>  meta/recipes-support/icu/icu_69.1.bb          |  1 +
>  2 files changed, 42 insertions(+)
>  create mode 100644
> meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
>
> diff --git
> a/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
> b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
> new file mode 100644
> index 0000000000..14d17f9742
> --- /dev/null
> +++
> b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
> @@ -0,0 +1,41 @@
> +From ab6b1acdeed76899f8227c38ab7e7675c7673ff1 Mon Sep 17 00:00:00 2001
> +From: Joe Slater <joe.slater@windriver.com>
> +Date: Thu, 5 Aug 2021 09:23:48 -0700
> +Subject: [oe-core][PATCH 1/1] pkgdata: increase command buffer size
> +
> +Make cmd LARGE_BUFFER_SIZE to avoid pathname truncation
> +when install paths are longer than about 150 characters.
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +---
> + source/tools/pkgdata/pkgdata.cpp | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/source/tools/pkgdata/pkgdata.cpp
> b/source/tools/pkgdata/pkgdata.cpp
> +index 5ab682e..d4b70ef 100644
> +--- a/tools/pkgdata/pkgdata.cpp
> ++++ b/tools/pkgdata/pkgdata.cpp
> +@@ -1131,17 +1131,17 @@ normal_symlink_mode:
> +
> + static int32_t pkg_installLibrary(const char *installDir, const char
> *targetDir, UBool noVersion) {
> +     int32_t result = 0;
> +-    char cmd[SMALL_BUFFER_MAX_SIZE];
> ++    char cmd[LARGE_BUFFER_MAX_SIZE];
> +
> +     auto ret = snprintf(cmd,
> +-            SMALL_BUFFER_MAX_SIZE,
> ++            LARGE_BUFFER_MAX_SIZE,
> +             "cd %s && %s %s %s%s%s",
> +             targetDir,
> +             pkgDataFlags[INSTALL_CMD],
> +             libFileNames[LIB_FILE_VERSION],
> +             installDir, PKGDATA_FILE_SEP_STRING,
> libFileNames[LIB_FILE_VERSION]);
> +     (void)ret;
> +-    U_ASSERT(0 <= ret && ret < SMALL_BUFFER_MAX_SIZE);
> ++    U_ASSERT(0 <= ret && ret < LARGE_BUFFER_MAX_SIZE);
> +
> +     result = runCommand(cmd);
> +
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-support/icu/icu_69.1.bb
> b/meta/recipes-support/icu/icu_69.1.bb
> index bfeea8d2f0..00c22372b5 100644
> --- a/meta/recipes-support/icu/icu_69.1.bb
> +++ b/meta/recipes-support/icu/icu_69.1.bb
> @@ -107,6 +107,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
>             file://filter.json \
>             file://fix-install-manx.patch \
>             file://0001-icu-Added-armeb-support.patch \
> +           file://0001-pkgdata-increase-command-buffer-size.patch \
>             "
>
>  SRC_URI_append_class-target = "\
> --
> 2.29.2
>
>
> 
>
>

--00000000000071cc4f05c8e004b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Upstream-Status is missing, and this looks like somet=
hing that should be sent upstream first for review.</div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, 5 Aug 2021 at 22:22, Joe Slater &lt;<a href=3D"mail=
to:joe.slater@windriver.com">joe.slater@windriver.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Make cmd in pkg_instal=
lLibrary() LARGE_BUFFER_SIZE to avoid<br>
pathname truncation if the install path is longer than about<br>
150 characters.=C2=A0 For default compilation, the U_ASSERT does<br>
not detect buffer overflow.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" t=
arget=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0...pkgdata-increase-command-buffer-size.patch | 41 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-support/icu/<a href=3D"http://icu_69.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_69.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A02 files changed, 42 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-support/icu/icu/0001-pkgdata-increase=
-command-buffer-size.patch<br>
<br>
diff --git a/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buf=
fer-size.patch b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command=
-buffer-size.patch<br>
new file mode 100644<br>
index 0000000000..14d17f9742<br>
--- /dev/null<br>
+++ b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-siz=
e.patch<br>
@@ -0,0 +1,41 @@<br>
+From ab6b1acdeed76899f8227c38ab7e7675c7673ff1 Mon Sep 17 00:00:00 2001<br>
+From: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" target=3D=
"_blank">joe.slater@windriver.com</a>&gt;<br>
+Date: Thu, 5 Aug 2021 09:23:48 -0700<br>
+Subject: [oe-core][PATCH 1/1] pkgdata: increase command buffer size<br>
+<br>
+Make cmd LARGE_BUFFER_SIZE to avoid pathname truncation<br>
+when install paths are longer than about 150 characters.<br>
+<br>
+Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" =
target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
+---<br>
+ source/tools/pkgdata/pkgdata.cpp | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/source/tools/pkgdata/pkgdata.cpp b/source/tools/pkgdata/pkgda=
ta.cpp<br>
+index 5ab682e..d4b70ef 100644<br>
+--- a/tools/pkgdata/pkgdata.cpp<br>
++++ b/tools/pkgdata/pkgdata.cpp<br>
+@@ -1131,17 +1131,17 @@ normal_symlink_mode:<br>
+ <br>
+ static int32_t pkg_installLibrary(const char *installDir, const char *tar=
getDir, UBool noVersion) {<br>
+=C2=A0 =C2=A0 =C2=A0int32_t result =3D 0;<br>
+-=C2=A0 =C2=A0 char cmd[SMALL_BUFFER_MAX_SIZE];<br>
++=C2=A0 =C2=A0 char cmd[LARGE_BUFFER_MAX_SIZE];<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0auto ret =3D snprintf(cmd,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SMALL_BUFFER_MAX_SIZE,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LARGE_BUFFER_MAX_SIZE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;cd %s &amp;&amp; %s =
%s %s%s%s&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targetDir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkgDataFlags[INSTALL_CMD],=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libFileNames[LIB_FILE_VERS=
ION],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0installDir, PKGDATA_FILE_S=
EP_STRING, libFileNames[LIB_FILE_VERSION]);<br>
+=C2=A0 =C2=A0 =C2=A0(void)ret;<br>
+-=C2=A0 =C2=A0 U_ASSERT(0 &lt;=3D ret &amp;&amp; ret &lt; SMALL_BUFFER_MAX=
_SIZE);<br>
++=C2=A0 =C2=A0 U_ASSERT(0 &lt;=3D ret &amp;&amp; ret &lt; LARGE_BUFFER_MAX=
_SIZE);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0result =3D runCommand(cmd);<br>
+ <br>
+-- <br>
+2.29.2<br>
+<br>
diff --git a/meta/recipes-support/icu/<a href=3D"http://icu_69.1.bb" rel=3D=
"noreferrer" target=3D"_blank">icu_69.1.bb</a> b/meta/recipes-support/icu/<=
a href=3D"http://icu_69.1.bb" rel=3D"noreferrer" target=3D"_blank">icu_69.1=
.bb</a><br>
index bfeea8d2f0..00c22372b5 100644<br>
--- a/meta/recipes-support/icu/<a href=3D"http://icu_69.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_69.1.bb</a><br>
+++ b/meta/recipes-support/icu/<a href=3D"http://icu_69.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">icu_69.1.bb</a><br>
@@ -107,6 +107,7 @@ SRC_URI =3D &quot;${BASE_SRC_URI};name=3Dcode \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://filter.json \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://fix-install-manx.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-icu-Added-armeb-suppo=
rt.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-pkgdata-increase-comm=
and-buffer-size.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI_append_class-target =3D &quot;\<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000071cc4f05c8e004b1--
