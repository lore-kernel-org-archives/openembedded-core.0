Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web12.4177.1615262291391435168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 19:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VxiTzDjU;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id v123so6089415vsv.9
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 19:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kUA7LNTJqSzXf9JJjaFw+72WGLMDswLwrLrZyVQcCik=;
        b=VxiTzDjUO6xXLkdvrX7oEg4whKGtrLobVn/e2hqxVGTM0gTocMIaBSR1SnSEHB5Nda
         Itzb8++D9+VnXX4y5lr6GzUVzapY0F6yquRH5UHZvCAjueu15dEZCIpAnqzhKveibB7b
         xIAWRy7SjJsLE15L3WsaqS4FT2djGp9ISpN3rXp/MbW+9gauKfdF/KNY6QiW+KCUnHH3
         rd/vYeHrT8F4xGEWP7+t2rAKy2SYQnrRCwKFhyhtWPnkLpQv2QqVwuh8jAY5tKdgCzPM
         K0cBtJWVK3ClRSPklOFMi9ej6it3z5UkW5PicWgfMthUJ2Rpol3T3caQQMoBpov6MyoR
         ElXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kUA7LNTJqSzXf9JJjaFw+72WGLMDswLwrLrZyVQcCik=;
        b=ZEJvBSGic/QSY5x1WWoDjWCASgugd/+n2rs1+hrqw6DrhXg58vJz8QyHTh9Av2H0ja
         BMPNnOpFcJ/BWbrkTqSBCtaVWbJy/coCj5jJjKAKborcPhIL4R3uwZJFOCkTeV9xaaEF
         QQB004GSSoFXEBuzTZuzB3K8riIr8l9s1oUtF8ou1QLMTIRYlHXjFx2HiVs4Wki2UK3Z
         zmQn279orF6+qgr9LvdnBRouwRFPJOxKQLJB5aIymkhw7hu5NONfXPvqeB37Mph2EFj2
         HcLCdBa4qT2uh3SrLyqNoFXDgfPHzTIK/E59G67VN3gBlnnmF3xA20NED+8f1Ezo6DyT
         XCOA==
X-Gm-Message-State: AOAM530qRXw0H9DYd34yQQxVOrHgQhHAj4z+4J9y0AOILA0p3Ihw4Jzf
	Nq/5f9eAc3MXZ7XnGHkvhkVm66xMQaki+6INpj8=
X-Google-Smtp-Source: ABdhPJwe1bedQfmlh0HL+eZT7s1zPRsIESA7N3zA/W4p2Fm5+Flf40rMQIC07XEVrAgkVWElyJ7rf8V8YGfjFU++6b0=
X-Received: by 2002:a67:7942:: with SMTP id u63mr15107004vsc.41.1615262290504;
 Mon, 08 Mar 2021 19:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20210309035410.757604-1-raj.khem@gmail.com>
In-Reply-To: <20210309035410.757604-1-raj.khem@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 9 Mar 2021 04:57:59 +0100
Message-ID: <CANNYZj_LvT0=HijEcDMQY=4aoKf26Z0nau=MBucRoFoYAog4pQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Link libatomic on RISCV
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000b6fe105bd128f63"

--0000000000000b6fe105bd128f63
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please send the patches upstream first, I wouldn=E2=80=99t normally ask for=
 it
explicitly, but there=E2=80=99s a history of webkit patches that are forev=
er
pending and cause pain on version updates.

Alex

On Tue 9. Mar 2021 at 4.54, Khem Raj <raj.khem@gmail.com> wrote:

> This fixes linking failures
> Source/WTF/wtf/text/StringImpl.h:1115: undefined reference to
> `__atomic_compare_exchange_1'
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../webkitgtk/webdriver-libatomic.patch       | 23 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  3 +++
>  2 files changed, 26 insertions(+)
>  create mode 100644
> meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patc=
h
> b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
> new file mode 100644
> index 0000000000..bd9ac9d1f5
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
> @@ -0,0 +1,23 @@
> +link with libatomic
> +
> +This fixes build with C11
> +
> +lib/../Source/WTF/wtf/CMakeFiles/WTF.dir/Assertions.cpp.o:/usr/include/=
c++/11.0.1/bits/atomic_base.h:520:
> more undefined references to `__atomic_compare_exchange_1' follow
> +| collect2: error: ld returned 1 exit status
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +--- a/Source/WTF/wtf/CMakeLists.txt
> ++++ b/Source/WTF/wtf/CMakeLists.txt
> +@@ -529,6 +529,10 @@ list(APPEND WTF_LIBRARIES
> +     ICU::uc
> + )
> +
> ++list(APPEND WTF_LIBRARIES
> ++     -Wl,--as-needed -Wl,-latomic -Wl,--no-as-needed
> ++)
> ++
> + set(WTF_INTERFACE_LIBRARIES WTF)
> + set(WTF_INTERFACE_INCLUDE_DIRECTORIES ${WTF_FRAMEWORK_HEADERS_DIR})
> + set(WTF_INTERFACE_DEPENDENCIES WTF_CopyHeaders)
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> index a1dd76ce81..3daf31f7d3 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> @@ -20,6 +20,9 @@ SRC_URI =3D "
> https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://include_xutil.patch \
>             file://reduce-memory-overheads.patch \
>             "
> +SRC_URI_append_riscv64 =3D " file://webdriver-libatomic.patch"
> +SRC_URI_append_riscv32 =3D " file://webdriver-libatomic.patch"
> +
>  SRC_URI[sha256sum] =3D
> "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
>
>  inherit cmake pkgconfig gobject-introspection perlnative features_check
> upstream-version-is-even gtk-doc
> --
> 2.30.1
>
>
>=20
>
>

--0000000000000b6fe105bd128f63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please send the patches upstream first, I wouldn=E2=80=99=
t normally ask for it explicitly, but there=E2=80=99s a history of webkit p=
atches that are forever pending and cause pain on version updates.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 9. Mar 2021 at 4=
.54, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">This fixes linking failures<br>
Source/WTF/wtf/text/StringImpl.h:1115: undefined reference to `__atomic_co=
mpare_exchange_1&#39;<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../webkitgtk/webdriver-libatomic.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
23 +++++++++++++++++++<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a>=C2=A0 |=C2=A0 3 =
+++<br>
=C2=A02 files changed, 26 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/webkitgtk/webdriver-liba=
tomic.patch<br>
<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch =
b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch<br>
new file mode 100644<br>
index 0000000000..bd9ac9d1f5<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch<br>
@@ -0,0 +1,23 @@<br>
+link with libatomic<br>
+<br>
+This fixes build with C11<br>
+<br>
+lib/../Source/WTF/wtf/CMakeFiles/WTF.dir/Assertions.cpp.o:/usr/include/c+=
+/11.0.1/bits/atomic_base.h:520: more undefined references to `__atomic_com=
pare_exchange_1&#39; follow<br>
+| collect2: error: ld returned 1 exit status<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+<br>
+--- a/Source/WTF/wtf/CMakeLists.txt<br>
++++ b/Source/WTF/wtf/CMakeLists.txt<br>
+@@ -529,6 +529,10 @@ list(APPEND WTF_LIBRARIES<br>
+=C2=A0 =C2=A0 =C2=A0ICU::uc<br>
+ )<br>
+ <br>
++list(APPEND WTF_LIBRARIES<br>
++=C2=A0 =C2=A0 =C2=A0-Wl,--as-needed -Wl,-latomic -Wl,--no-as-needed<br>
++)<br>
++<br>
+ set(WTF_INTERFACE_LIBRARIES WTF)<br>
+ set(WTF_INTERFACE_INCLUDE_DIRECTORIES ${WTF_FRAMEWORK_HEADERS_DIR})<br>
+ set(WTF_INTERFACE_DEPENDENCIES WTF_CopyHeaders)<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.b=
b" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a> b/meta/reci=
pes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">webkitgtk_2.30.5.bb</a><br>
index a1dd76ce81..3daf31f7d3 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
@@ -20,6 +20,9 @@ SRC_URI =3D &quot;<a href=3D"https://www.webkitgtk.org/r=
eleases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://include_xutil.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://reduce-memory-overheads.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI_append_riscv64 =3D &quot; file://webdriver-libatomic.patch&quot;<=
br>
+SRC_URI_append_riscv32 =3D &quot; file://webdriver-libatomic.patch&quot;<=
br>
+<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7d0dab08e3c5ae07bec80b2822ef42e952765d5=
724cac86eb23999bfed5a7f1f&quot;<br>
<br>
=C2=A0inherit cmake pkgconfig gobject-introspection perlnative features_ch=
eck upstream-version-is-even gtk-doc<br>
-- <br>
2.30.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000000b6fe105bd128f63--
