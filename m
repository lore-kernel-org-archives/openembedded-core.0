Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.7634.1615291363596668626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 04:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZqpsnpdC;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id m18so6657495vsa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 04:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jNal0tLVqWykACqpnHoZi2wPUuRE0UhBtq2M/8Qz+8Y=;
        b=ZqpsnpdCrEQ7STNGOfuWTXttVeFXiVr46hOw2/AQGpcv2DR+1muiR+jrVE/mirtOHS
         vZgYxFfKgBTZz1znhnwT8LU730n5n3qV+Mpd2dB/kixB/ac77RTeBtFWZ7QhKh2FK9s/
         RHaoX32txj8mZASVdDfX1tvUy2tEJsWAfzjAKPKZXz8BztP1J5paRkKsGZiKbvxBv25m
         Yn7Q4vi9Yvr/WTEVuTvvN7Xf0fDgJvhuUIBSAoC51xn+WQPN9hSHh+FjFnAcavNpp4fT
         qvI2g5nqk5hdlXTvUg0iBuJEMZwLB4habIbqpDMhsdEpUL7ubTXaE+mEfpkPborX/gVF
         yTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jNal0tLVqWykACqpnHoZi2wPUuRE0UhBtq2M/8Qz+8Y=;
        b=h7Wl4W2sYxBKm0nYTWGQvIMDqU5/qGM6QA8YJQ+o9M1DtqIv0zwkhCp7AqvLza/CUq
         hSS8O7dj7saJ1NiHrQSdst6FvU6l6BmVZk7KbWPoy4dPILeTAfWExObvlgLpFlabpH64
         Hck+XF7QrtulUNUE9JkF37aNptAJNGlLc1V+fsTAfu+R8Nb/y8AVCzFAhrjLvkfOGsTH
         nupz0tQqMa27XHamse88dk+of9LQk8nahHIWxcLtLNlzrG1H3NIZr3x28pCP7Lqdx85q
         pBYbf/KUlgLxfOWCWI8TUN97yuFb0uLr9KRyU0GJS7N/m9DMbKAlkk2o76VpldA7nfeO
         rmxg==
X-Gm-Message-State: AOAM531fvMcqBI86SmtNg4LOiMGMR3g6X98krEGYVpcP21s17zY4Hl3T
	rwhUiEXWVrked4SQ7/zWMG+y7aAV4Cpa9Ln97bo=
X-Google-Smtp-Source: ABdhPJy3b1EiddnuUV/e4kAn/LfIZZxP7DpKP+K+6WPsUbYGGvp0fhxhc+KWVLPGB4twyls91ODAeo2ZZACAIKHbHvU=
X-Received: by 2002:a67:f244:: with SMTP id y4mr438440vsm.41.1615291362707;
 Tue, 09 Mar 2021 04:02:42 -0800 (PST)
MIME-Version: 1.0
References: <20210309035410.757604-1-raj.khem@gmail.com> <CANNYZj_LvT0=HijEcDMQY=4aoKf26Z0nau=MBucRoFoYAog4pQ@mail.gmail.com>
 <CAMKF1sp=bs6VfBQ=4yz11U32C3n55E41BdGnRePPY+0SVw70fQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp=bs6VfBQ=4yz11U32C3n55E41BdGnRePPY+0SVw70fQ@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 9 Mar 2021 13:02:31 +0100
Message-ID: <CANNYZj-Am8SUPg3ii8jrp5k6QCkY1DrfAN1gJFN3=FLaqe1e1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Link libatomic on RISCV
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e20d5505bd195389"

--000000000000e20d5505bd195389
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!

Alex

On Tue, 9 Mar 2021 at 06:11, Khem Raj <raj.khem@gmail.com> wrote:

> upstream is informed about this via
> https://bugs.webkit.org/show_bug.cgi?id=3D222959
>
> On Mon, Mar 8, 2021 at 7:58 PM Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
> >
> > Please send the patches upstream first, I wouldn=E2=80=99t normally as=
k for it
> explicitly, but there=E2=80=99s a history of webkit patches that are for=
ever
> pending and cause pain on version updates.
> >
> > Alex
> >
> > On Tue 9. Mar 2021 at 4.54, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> This fixes linking failures
> >> Source/WTF/wtf/text/StringImpl.h:1115: undefined reference to
> `__atomic_compare_exchange_1'
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  .../webkitgtk/webdriver-libatomic.patch       | 23 +++++++++++++++++=
++
> >>  meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  3 +++
> >>  2 files changed, 26 insertions(+)
> >>  create mode 100644
> meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
> >>
> >> diff --git
> a/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
> b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
> >> new file mode 100644
> >> index 0000000000..bd9ac9d1f5
> >> --- /dev/null
> >> +++ b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch
> >> @@ -0,0 +1,23 @@
> >> +link with libatomic
> >> +
> >> +This fixes build with C11
> >> +
> >>
> +lib/../Source/WTF/wtf/CMakeFiles/WTF.dir/Assertions.cpp.o:/usr/include/=
c++/11.0.1/bits/atomic_base.h:520:
> more undefined references to `__atomic_compare_exchange_1' follow
> >> +| collect2: error: ld returned 1 exit status
> >> +
> >> +Upstream-Status: Pending
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +
> >> +--- a/Source/WTF/wtf/CMakeLists.txt
> >> ++++ b/Source/WTF/wtf/CMakeLists.txt
> >> +@@ -529,6 +529,10 @@ list(APPEND WTF_LIBRARIES
> >> +     ICU::uc
> >> + )
> >> +
> >> ++list(APPEND WTF_LIBRARIES
> >> ++     -Wl,--as-needed -Wl,-latomic -Wl,--no-as-needed
> >> ++)
> >> ++
> >> + set(WTF_INTERFACE_LIBRARIES WTF)
> >> + set(WTF_INTERFACE_INCLUDE_DIRECTORIES ${WTF_FRAMEWORK_HEADERS_DIR})
> >> + set(WTF_INTERFACE_DEPENDENCIES WTF_CopyHeaders)
> >> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> >> index a1dd76ce81..3daf31f7d3 100644
> >> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> >> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> >> @@ -20,6 +20,9 @@ SRC_URI =3D "
> https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
> >>             file://include_xutil.patch \
> >>             file://reduce-memory-overheads.patch \
> >>             "
> >> +SRC_URI_append_riscv64 =3D " file://webdriver-libatomic.patch"
> >> +SRC_URI_append_riscv32 =3D " file://webdriver-libatomic.patch"
> >> +
> >>  SRC_URI[sha256sum] =3D
> "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
> >>
> >>  inherit cmake pkgconfig gobject-introspection perlnative
> features_check upstream-version-is-even gtk-doc
> >> --
> >> 2.30.1
> >>
> >>
> >>=20
> >>
>

--000000000000e20d5505bd195389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks!</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, 9 Mar 2021 at 06:11, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">r=
aj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">upstream is informed about this via<br>
<a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D222959" rel=3D"norefe=
rrer" target=3D"_blank">https://bugs.webkit.org/show_bug.cgi?id=3D222959</a=
><br>
<br>
On Mon, Mar 8, 2021 at 7:58 PM Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Please send the patches upstream first, I wouldn=E2=80=99t normally a=
sk for it explicitly, but there=E2=80=99s a history of webkit patches that =
are forever pending and cause pain on version updates.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue 9. Mar 2021 at 4.54, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This fixes linking failures<br>
&gt;&gt; Source/WTF/wtf/text/StringImpl.h:1115: undefined reference to `__=
atomic_compare_exchange_1&#39;<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../webkitgtk/webdriver-libatomic.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 23 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5=
.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a>=C2=A0 |=
=C2=A0 3 +++<br>
&gt;&gt;=C2=A0 2 files changed, 26 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-sato/webkit/webkitgtk/webdr=
iver-libatomic.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-sato/webkit/webkitgtk/webdriver-libatom=
ic.patch b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..bd9ac9d1f5<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-sato/webkit/webkitgtk/webdriver-libatomic.patc=
h<br>
&gt;&gt; @@ -0,0 +1,23 @@<br>
&gt;&gt; +link with libatomic<br>
&gt;&gt; +<br>
&gt;&gt; +This fixes build with C11<br>
&gt;&gt; +<br>
&gt;&gt; +lib/../Source/WTF/wtf/CMakeFiles/WTF.dir/Assertions.cpp.o:/usr/i=
nclude/c++/11.0.1/bits/atomic_base.h:520: more undefined references to `__a=
tomic_compare_exchange_1&#39; follow<br>
&gt;&gt; +| collect2: error: ld returned 1 exit status<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Pending<br>
&gt;&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +--- a/Source/WTF/wtf/CMakeLists.txt<br>
&gt;&gt; ++++ b/Source/WTF/wtf/CMakeLists.txt<br>
&gt;&gt; +@@ -529,6 +529,10 @@ list(APPEND WTF_LIBRARIES<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0ICU::uc<br>
&gt;&gt; + )<br>
&gt;&gt; +<br>
&gt;&gt; ++list(APPEND WTF_LIBRARIES<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0-Wl,--as-needed -Wl,-latomic -Wl,--no-as-ne=
eded<br>
&gt;&gt; ++)<br>
&gt;&gt; ++<br>
&gt;&gt; + set(WTF_INTERFACE_LIBRARIES WTF)<br>
&gt;&gt; + set(WTF_INTERFACE_INCLUDE_DIRECTORIES ${WTF_FRAMEWORK_HEADERS_D=
IR})<br>
&gt;&gt; + set(WTF_INTERFACE_DEPENDENCIES WTF_CopyHeaders)<br>
&gt;&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk=
_2.30.5.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a> b/=
meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
&gt;&gt; index a1dd76ce81..3daf31f7d3 100644<br>
&gt;&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5=
.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
&gt;&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5=
.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
&gt;&gt; @@ -20,6 +20,9 @@ SRC_URI =3D &quot;<a href=3D"https://www.webkit=
gtk.org/releases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"=
_blank">https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://include_xut=
il.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reduce-memo=
ry-overheads.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; +SRC_URI_append_riscv64 =3D &quot; file://webdriver-libatomic.pat=
ch&quot;<br>
&gt;&gt; +SRC_URI_append_riscv32 =3D &quot; file://webdriver-libatomic.pat=
ch&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;7d0dab08e3c5ae07bec80b2822ef42=
e952765d5724cac86eb23999bfed5a7f1f&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 inherit cmake pkgconfig gobject-introspection perlnative fe=
atures_check upstream-version-is-even gtk-doc<br>
&gt;&gt; --<br>
&gt;&gt; 2.30.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div>

--000000000000e20d5505bd195389--
