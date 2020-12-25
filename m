Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web08.8118.1608883931927331372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Dec 2020 00:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q5CyDPRH;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id h16so2043254qvu.8
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Dec 2020 00:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mzUuX1X9/UK5iJMa4G+xacyWXlRm9zYEMvQHBh9ZlwI=;
        b=Q5CyDPRHACpwWNwHv+r+ZW11I1mZO5s9ekWlJCBuUNEFUDn+SLYJ1wv5vRCzUTQl5W
         YQH1RnXRLS5+11Up1UMj+yWfjD7ADU6ZO4sKJRIaV4OtB1Xq6CmJDnLdVl8t4dipnugd
         Z1/WV2NDUcrCles+ZovW1rODhEOpO+ZVCMrYqbCf64qp0v5YbsKiCLrHzpgsvyzqwT7Q
         mvcsfY5dsh3nNXfDp75lAOsCUHyIxGNUJPwZ/2Lh7xwAPrPMR6pPYo7FgAPxFwatM1yO
         D/aRcj5+77q1T/3dKfYdzIiqrNP4SFDRoYZ0B0oN28J5EP2f4qbjBdXMryC/mkaXtP0u
         Sfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mzUuX1X9/UK5iJMa4G+xacyWXlRm9zYEMvQHBh9ZlwI=;
        b=gXErlamPC4At7Qtl7y9Rs2qZDpBKSHjvWcfi8eOZjBxwk9QDLPpx58FrhyeUtOAtmp
         tV4usRqedU8++57B5n3ZmRa9bX7ETv/7d0+Em1ex9kW9mpNzNm6Z4Tx05QVcc1loCEb/
         Kjj0YGivxcrV/HFXUnfZ0OvugNnhaRU5qM9K+A88y8Tciv/yxo57XFwYofd4tvcbbLnx
         tf5kB+vViosb2mbt3EEkeQGQajUo2yMXZPfaeAM4KgfQGxRMnSTb9MnrsyOBtTkZEMp4
         YpPVylSYbt0i6/ARiclKLJ45uyHcXzktmIsj5uVTnAG4J1y6GeelPdfS3nCutnOduMvZ
         OM1w==
X-Gm-Message-State: AOAM533p8xZjdY7tvoS3yuGgQccFkMZoIUaS31gA/aPtr7UvTbvyniId
	hRbD/LMYbjbQGdfksFejtyZ7h+pZOoVg1Kgzm6u+MeGC
X-Google-Smtp-Source: ABdhPJzYMBtbmri6G5QApa9EyTMKTgYbcLUoa9Y1cZCYgSLHDq/EGEmc0wHzxwE+DHLOvYo0lmqEbrMHrAwddVorNHI=
X-Received: by 2002:a1f:dec2:: with SMTP id v185mr24359649vkg.8.1608882124504;
 Thu, 24 Dec 2020 23:42:04 -0800 (PST)
MIME-Version: 1.0
References: <1608859814-70850-1-git-send-email-zangrc.fnst@cn.fujitsu.com> <47c12c7e-9476-cdb2-4b9f-edc728fde815@gmail.com>
In-Reply-To: <47c12c7e-9476-cdb2-4b9f-edc728fde815@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 25 Dec 2020 08:41:53 +0100
Message-ID: <CANNYZj9y6onGc_WQhCWL3-+a5-hLz0tgSDuZsAT3VnCTPkh50w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ell: upgrade 0.33 -> 0.35
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	zangrc <zangrc.fnst@cn.fujitsu.com>
Content-Type: multipart/alternative; boundary="0000000000008443ec05b7450f37"

--0000000000008443ec05b7450f37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Also, don=E2=80=99t forget upstream-status please. The missing header patch=
 can be
backported, which is preferred.

Alex

On Fri 25. Dec 2020 at 4.42, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 12/24/20 5:30 PM, zangrc wrote:
> > Add the following patch to solve the compilation error when using musl=
:
> > 0001-Fix-bug-caused-by-missing-types.h-file.patch
> > 0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch
> >
> > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > ---
> >   ...x-bug-caused-by-missing-types.h-file.patch | 48 +++++++++++++++++=
++
> >   ...ed-by-using-functions-not-provided-b.patch | 26 ++++++++++
> >   .../ell/{ell_0.33.bb =3D> ell_0.35.bb}          |  9 +++-
> >   3 files changed, 81 insertions(+), 2 deletions(-)
> >   create mode 100644
> meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.pa=
tch
> >   create mode 100644
> meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-not=
-provided-b.patch
> >   rename meta/recipes-core/ell/{ell_0.33.bb =3D> ell_0.35.bb} (70%)
> >
> > diff --git
> a/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.=
patch
> b/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.=
patch
> > new file mode 100644
> > index 0000000000..6f26ec4e7d
> > --- /dev/null
> > +++
> b/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.h-file.=
patch
> > @@ -0,0 +1,48 @@
> > +Subject: [PATCH] Fix bug caused by missing types.h file.
> > +
> > +Fix the following error:
> > +../ell-0.35/ell/dhcp-private.h:75:2: error: unknown type name '__be32=
'
> > +|    75 |  __be32 xid;
> > +|       |  ^~~~~~
> > +| ../ell-0.35/ell/dhcp-private.h:76:2: error: unknown type name '__be=
16'
> > +|    76 |  __be16 secs;
> > +|       |  ^~~~~~
> > +| ../ell-0.35/ell/dhcp-private.h:77:2: error: unknown type name '__be=
16'
> > +|    77 |  __be16 flags;
> > +|       |  ^~~~~~
> > +| ../ell-0.35/ell/dhcp-private.h:85:2: error: unknown type name '__be=
32'
> > +|    85 |  __be32 magic;
> > +
> > +Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > +---
> > + ell/dhcp-private.h  | 1 +
> > + ell/dhcp6-private.h | 1 +
> > + 2 files changed, 2 insertions(+)
> > +
> > +diff --git a/ell/dhcp-private.h b/ell/dhcp-private.h
> > +index 204e54e..b418535 100644
> > +--- a/ell/dhcp-private.h
> > ++++ b/ell/dhcp-private.h
> > +@@ -19,6 +19,7 @@
> > +  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
> 02110-1301  USA
> > +  *
> > +  */
> > ++#include <linux/types.h>
> > +
> > + struct l_dhcp_client;
> > + struct l_dhcp_server;
> > +diff --git a/ell/dhcp6-private.h b/ell/dhcp6-private.h
> > +index 2bbd1d3..14dd85c 100644
> > +--- a/ell/dhcp6-private.h
> > ++++ b/ell/dhcp6-private.h
> > +@@ -19,6 +19,7 @@
> > +  *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
> 02110-1301  USA
> > +  *
> > +  */
> > ++#include <linux/types.h>
> > +
> > + struct l_dhcp6_client;
> > +
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-n=
ot-provided-b.patch
> b/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-n=
ot-provided-b.patch
> > new file mode 100644
> > index 0000000000..da0018a8df
> > --- /dev/null
> > +++
> b/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-functions-n=
ot-provided-b.patch
> > @@ -0,0 +1,26 @@
> > +Subject: [PATCH] Fix the bug caused by using functions not provided b=
y
> musl.
> > +
> > +Fix the following error:
> > +/usr/src/debug/ell/0.35-r0/build/../ell-0.35/ell/pem.c:227: undefined
> reference to `rawmemchr'
> > +
> > +Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > +---
> > + ell/pem.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/ell/pem.c b/ell/pem.c
> > +index 790f2c2..27d47a0 100644
> > +--- a/ell/pem.c
> > ++++ b/ell/pem.c
> > +@@ -224,7 +224,7 @@ static uint8_t *pem_load_buffer(const void *buf,
> size_t buf_len,
> > +
> > +             /* Check that each header line has a key and a colon */
> > +             while (start < end) {
> > +-                    const char *lf =3D rawmemchr(start, '\n');
> > ++                    const char *lf =3D strchr(start, '\n');
>
> Lets make this patch like below
>
> #if defined(__GLIBC__)
>                          const char *lf =3D rawmemchr(start, '\n');
> #else
>                         const char *lf =3D memchr(start, '\n', end - sta=
rt);
> #endif
>
>
> > +                     const char *colon =3D memchr(start, ':', lf - st=
art);
> > +
> > +                     if (!colon)
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-core/ell/ell_0.33.bb b/meta/recipes-core/ell=
/
> ell_0.35.bb
> > similarity index 70%
> > rename from meta/recipes-core/ell/ell_0.33.bb
> > rename to meta/recipes-core/ell/ell_0.35.bb
> > index 2fa05104fb..718b01f5cb 100644
> > --- a/meta/recipes-core/ell/ell_0.33.bb
> > +++ b/meta/recipes-core/ell/ell_0.35.bb
> > @@ -13,8 +13,13 @@ DEPENDS =3D "dbus"
> >
> >   inherit autotools pkgconfig
> >
> > -SRC_URI =3D "
> https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.x=
z"
> > -SRC_URI[sha256sum] =3D
> "d9e40e641164150394b74b719b9726fc734f24b2cde679cf5f3be6915c34eded"
> > +SRC_URI =3D "
> https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.x=
z
> \
> > +           file://0001-Fix-bug-caused-by-missing-types.h-file.patch \
> > +"
> > +
> > +SRC_URI_append_libc-musl =3D
> "file://0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch"
>
> Provided the patch is done like I mentioned this patch is not needed to
> be musl specific anymore.
>
> > +
> > +SRC_URI[sha256sum] =3D
> "2bfe9da7781f65f1cb1595a5a068a3ae74d4b68b74f287c6f0c892cfe623913f"
> >
> >   do_configure_prepend () {
> >       mkdir -p ${S}/build-aux
> >
> >
> >
> >
> >
>
>=20
>
>

--0000000000008443ec05b7450f37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Also, don=E2=80=99t forget upstream-status please. The mi=
ssing header patch can be backported, which is preferred.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 25. Dec 2020 at 4.42, Khe=
m Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)"><br>
<br>
On 12/24/20 5:30 PM, zangrc wrote:<br>
&gt; Add the following patch to solve the compilation error when using mus=
l:<br>
&gt; 0001-Fix-bug-caused-by-missing-types.h-file.patch<br>
&gt; 0001-Fix-the-bug-caused-by-using-functions-not-provided-b.patch<br>
&gt; <br>
&gt; Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuji=
tsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...x-bug-caused-by-missing-types.h-file.patch | 48 ++++++=
+++++++++++++<br>
&gt;=C2=A0 =C2=A0...ed-by-using-functions-not-provided-b.patch | 26 ++++++=
++++<br>
&gt;=C2=A0 =C2=A0.../ell/{<a href=3D"http://ell_0.33.bb" rel=3D"noreferrer=
" target=3D"_blank">ell_0.33.bb</a> =3D&gt; <a href=3D"http://ell_0.35.bb" =
rel=3D"noreferrer" target=3D"_blank">ell_0.35.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 9 +++-<br>
&gt;=C2=A0 =C2=A03 files changed, 81 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/ell/ell/0001-Fix-bug=
-caused-by-missing-types.h-file.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/recipes-core/ell/ell/0001-Fix-the=
-bug-caused-by-using-functions-not-provided-b.patch<br>
&gt;=C2=A0 =C2=A0rename meta/recipes-core/ell/{<a href=3D"http://ell_0.33.=
bb" rel=3D"noreferrer" target=3D"_blank">ell_0.33.bb</a> =3D&gt; <a href=3D=
"http://ell_0.35.bb" rel=3D"noreferrer" target=3D"_blank">ell_0.35.bb</a>} =
(70%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing=
-types.h-file.patch b/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-miss=
ing-types.h-file.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6f26ec4e7d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/ell/ell/0001-Fix-bug-caused-by-missing-types.=
h-file.patch<br>
&gt; @@ -0,0 +1,48 @@<br>
&gt; +Subject: [PATCH] Fix bug caused by missing types.h file.<br>
&gt; +<br>
&gt; +Fix the following error:<br>
&gt; +../ell-0.35/ell/dhcp-private.h:75:2: error: unknown type name &#39;_=
_be32&#39;<br>
&gt; +|=C2=A0 =C2=A0 75 |=C2=A0 __be32 xid;<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 ^~~~~~<br>
&gt; +| ../ell-0.35/ell/dhcp-private.h:76:2: error: unknown type name &#39=
;__be16&#39;<br>
&gt; +|=C2=A0 =C2=A0 76 |=C2=A0 __be16 secs;<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 ^~~~~~<br>
&gt; +| ../ell-0.35/ell/dhcp-private.h:77:2: error: unknown type name &#39=
;__be16&#39;<br>
&gt; +|=C2=A0 =C2=A0 77 |=C2=A0 __be16 flags;<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 ^~~~~~<br>
&gt; +| ../ell-0.35/ell/dhcp-private.h:85:2: error: unknown type name &#39=
;__be32&#39;<br>
&gt; +|=C2=A0 =C2=A0 85 |=C2=A0 __be32 magic;<br>
&gt; +<br>
&gt; +Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; +---<br>
&gt; + ell/dhcp-private.h=C2=A0 | 1 +<br>
&gt; + ell/dhcp6-private.h | 1 +<br>
&gt; + 2 files changed, 2 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/ell/dhcp-private.h b/ell/dhcp-private.h<br>
&gt; +index 204e54e..b418535 100644<br>
&gt; +--- a/ell/dhcp-private.h<br>
&gt; ++++ b/ell/dhcp-private.h<br>
&gt; +@@ -19,6 +19,7 @@<br>
&gt; +=C2=A0 *=C2=A0 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston=
, MA=C2=A0 02110-1301=C2=A0 USA<br>
&gt; +=C2=A0 *<br>
&gt; +=C2=A0 */<br>
&gt; ++#include &lt;linux/types.h&gt;<br>
&gt; +<br>
&gt; + struct l_dhcp_client;<br>
&gt; + struct l_dhcp_server;<br>
&gt; +diff --git a/ell/dhcp6-private.h b/ell/dhcp6-private.h<br>
&gt; +index 2bbd1d3..14dd85c 100644<br>
&gt; +--- a/ell/dhcp6-private.h<br>
&gt; ++++ b/ell/dhcp6-private.h<br>
&gt; +@@ -19,6 +19,7 @@<br>
&gt; +=C2=A0 *=C2=A0 Foundation, Inc., 51 Franklin St, Fifth Floor, Boston=
, MA=C2=A0 02110-1301=C2=A0 USA<br>
&gt; +=C2=A0 *<br>
&gt; +=C2=A0 */<br>
&gt; ++#include &lt;linux/types.h&gt;<br>
&gt; +<br>
&gt; + struct l_dhcp6_client;<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-usi=
ng-functions-not-provided-b.patch b/meta/recipes-core/ell/ell/0001-Fix-the-=
bug-caused-by-using-functions-not-provided-b.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..da0018a8df<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/ell/ell/0001-Fix-the-bug-caused-by-using-func=
tions-not-provided-b.patch<br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +Subject: [PATCH] Fix the bug caused by using functions not provided =
by musl.<br>
&gt; +<br>
&gt; +Fix the following error:<br>
&gt; +/usr/src/debug/ell/0.35-r0/build/../ell-0.35/ell/pem.c:227: undefine=
d reference to `rawmemchr&#39;<br>
&gt; +<br>
&gt; +Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zangrc.fnst@cn.fuj=
itsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; +---<br>
&gt; + ell/pem.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/ell/pem.c b/ell/pem.c<br>
&gt; +index 790f2c2..27d47a0 100644<br>
&gt; +--- a/ell/pem.c<br>
&gt; ++++ b/ell/pem.c<br>
&gt; +@@ -224,7 +224,7 @@ static uint8_t *pem_load_buffer(const void *buf,=
 size_t buf_len,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check that each h=
eader line has a key and a colon */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (start &lt; en=
d) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *lf =3D rawmemchr(start, &#39;\n&#39;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const char *lf =3D strchr(start, &#39;\n&#39;);<br>
<br>
Lets make this patch like below<br>
<br>
#if defined(__GLIBC__)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const char *lf =3D rawmemchr(start, &#39;\n&#39;);<br>
#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const char *lf =3D memchr(start, &#39;\n&#39;, end - start);<br=
>
#endif<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0const char *colon =3D memchr(start, &#39;:&#39;, lf - start);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!colon)<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/ell/<a href=3D"http://ell_0.33.bb" rel=
=
=3D"noreferrer" target=3D"_blank">ell_0.33.bb</a> b/meta/recipes-core/ell/=
<a href=3D"http://ell_0.35.bb" rel=3D"noreferrer" target=3D"_blank">ell_0.3=
5.bb</a><br>
&gt; similarity index 70%<br>
&gt; rename from meta/recipes-core/ell/<a href=3D"http://ell_0.33.bb" rel=
=3D"noreferrer" target=3D"_blank">ell_0.33.bb</a><br>
&gt; rename to meta/recipes-core/ell/<a href=3D"http://ell_0.35.bb" rel=3D=
"noreferrer" target=3D"_blank">ell_0.35.bb</a><br>
&gt; index 2fa05104fb..718b01f5cb 100644<br>
&gt; --- a/meta/recipes-core/ell/<a href=3D"http://ell_0.33.bb" rel=3D"nor=
eferrer" target=3D"_blank">ell_0.33.bb</a><br>
&gt; +++ b/meta/recipes-core/ell/<a href=3D"http://ell_0.35.bb" rel=3D"nor=
eferrer" target=3D"_blank">ell_0.35.bb</a><br>
&gt; @@ -13,8 +13,13 @@ DEPENDS =3D &quot;dbus&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit autotools pkgconfig<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://mirrors.edge.kernel.org/pub/lin=
ux/libs/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-$=
{PV}.tar.xz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d9e40e641164150394b74b719b9726fc734f24b=
2cde679cf5f3be6915c34eded&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://mirrors.edge.kernel.org/pub/lin=
ux/libs/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=
=3D"_blank">https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-$=
{PV}.tar.xz</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-bug-caused-=
by-missing-types.h-file.patch \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SRC_URI_append_libc-musl =3D &quot;file://0001-Fix-the-bug-caused-by=
-using-functions-not-provided-b.patch&quot;<br>
<br>
Provided the patch is done like I mentioned this patch is not needed to <b=
r>
be musl specific anymore.<br>
<br>
&gt; +<br>
&gt; +SRC_URI[sha256sum] =3D &quot;2bfe9da7781f65f1cb1595a5a068a3ae74d4b68=
b74f287c6f0c892cfe623913f&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0do_configure_prepend () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p ${S}/build-aux<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000008443ec05b7450f37--
