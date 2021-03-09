Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web08.7539.1615291287863514736
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 04:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UT43XVyq;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id o20so4423180uaj.9
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 04:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qSKIywtOcE4T89ZnJXOPpp7zwYMJvzKp6hyhws8Vqm4=;
        b=UT43XVyqeH4dIqnzbK58QZLZ/jYIXKwE6sdlzzAGcb9wSXPFf183ULpXi+bDVThfvV
         C7tA0+uE0TrYoPo1Plc+9PqUmiCNrsbEfmgBaCCTfkRE8Rn1OpBScNglykT5j53cEwMM
         O0jLT0eHukYgGwXyKqFAeqrUqTJWf4zt+PKogMSvo1oJ88AD74k/ZZkkRB2kqWfv2YiN
         WoVuJ8qaTQP990neIL7ZRm5nN5jRNNu+z62iRQ83yAZsXr8ns2Iss9IFXF59h/KMBH4c
         KHCM3yFlFz/koxCKwIL/ibV6/++LSfIMBHnYTu60sn1LzomxExKeud+RCcgcNBWfwbOC
         wA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qSKIywtOcE4T89ZnJXOPpp7zwYMJvzKp6hyhws8Vqm4=;
        b=UPTqKtuK/lHekIni0swz+wWSx6rD0MPkhGBu3FyL6HRbrXdDRKjYeAlE5TmJJqWb5S
         anCNpjDAEzbRdYKdIkz4T28e9/A3MShc7rHT1PhTslgmfgW+/OjNvQyHHiTegGNkHCfJ
         UaGDzokYhfymA51CgSeFuWa+HuZhwruyopiSAjoIesTupaKb5DTfOzBwfKtTojYa3W3D
         BMBwhuGj67LGhUk87y1fi4b9qCwdizAKUMxOSOzkUVy/Y4nxbv6vNsx/vLJKs/xb5dvx
         LqoAsb2/ro5UV2skAdCsHjQHZyZUoEAH378WljkRnLI1S3cFmUUoDGPEcJFqDucLuxUj
         vSmw==
X-Gm-Message-State: AOAM530ZLaP8swjlpQe1tCUE6qO+YIm2FvqqP/tofOFVt7mDLp6eYsrk
	n/23dBKmKIKY2OT/OPTWjD8q0Jx7xDqNMDgIo8c=
X-Google-Smtp-Source: ABdhPJwpKk9FLWr+GYbNV4cv4+vxsw800R6Za9Mn1sHxg+++RgRGK9woawFz5R/VsK0jqinzm7w2FyPJD/0fMthOlN8=
X-Received: by 2002:ab0:6045:: with SMTP id o5mr16019000ual.100.1615291286785;
 Tue, 09 Mar 2021 04:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20210308235953.2230531-1-raj.khem@gmail.com> <CANNYZj-bjpj0VFu-Db-x917m07nQLaVKNuvs-=UaLd=H-=h=VQ@mail.gmail.com>
 <CAMKF1sp7iP4sT4HWWeBhEPnanaEy4cEdoPP90sGYPe22dCFu=Q@mail.gmail.com>
In-Reply-To: <CAMKF1sp7iP4sT4HWWeBhEPnanaEy4cEdoPP90sGYPe22dCFu=Q@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 9 Mar 2021 13:01:15 +0100
Message-ID: <CANNYZj-0eTz84WfXGQP-f9uf6V4_AeAT8QiNXJziLeCm1uv3Zw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Use linker options to reduce memory overhead during linking
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005b92f605bd194f53"

--0000000000005b92f605bd194f53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Khem, this makes sense.

Alex

On Tue, 9 Mar 2021 at 05:05, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Mar 8, 2021 at 7:50 PM Alexander Kanavin <alex.kanavin@gmail.com=
>
> wrote:
> >
> > Can you please explain the context for this? Why would we want to
> support building webkit on such constrained machines? 8g of ram means th=
ey
> can=E2=80=99t run more than 4-6 gcc processes, so webkit builds will be =
unbearably
> slow anyway.
> >
>
> this helps to avoid unwanted build breaks since gcc crashes when
> memory pressure is too high,
> when doing parallel builds this can happen very often since there are
> other tasks running in parallel, so these situations can arise often
> we have seen this happen on machines with 16GB RAM
> therefore saving some of the memory during linking helps reduce these
> breakages. they can still happen if say machine was doing more than 1
> builds in parallel but at least tools have done what they could.
>
> > Alex
> >
> > On Tue 9. Mar 2021 at 1.00, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Helps builds on machines with less RAM ( 8G )
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  .../webkitgtk/reduce-memory-overheads.patch   | 22 +++++++++++++++++=
++
> >>  meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
> >>  2 files changed, 23 insertions(+)
> >>  create mode 100644
> meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
> >>
> >> diff --git
> a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
> b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patch
> >> new file mode 100644
> >> index 0000000000..0493150a91
> >> --- /dev/null
> >> +++ b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.patc=
h
> >> @@ -0,0 +1,22 @@
> >> +From: Alberto Garcia <berto@igalia.com>
> >> +Subject: Reduce memory usage when not using the Gold linker
> >> +Bug-Debian: https://bugs.debian.org/949621
> >> +Forwarded: no
> >> +
> >> +Upstream-Status: Pending
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +--- a/Source/cmake/OptionsCommon.cmake
> >> ++++ b/Source/cmake/OptionsCommon.cmake
> >> +@@ -95,6 +95,12 @@ option(GCC_OFFLINEASM_SOURCE_MAP
> >> +   "Produce debug line information for offlineasm-generated code"
> >> +   ${GCC_OFFLINEASM_SOURCE_MAP_DEFAULT})
> >> +
> >> ++# Pass --reduce-memory-overheads to the bfd linker in order to save
> memory
> >> ++if (NOT USE_LD_GOLD)
> >> ++    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}
> -Wl,--reduce-memory-overheads")
> >> ++    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS}
> -Wl,--reduce-memory-overheads")
> >> ++endif ()
> >> ++
> >> + # Enable the usage of OpenMP.
> >> + #  - At this moment, OpenMP is only used as an alternative
> implementation
> >> + #    to native threads for the parallelization of the SVG filters.
> >> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> >> index 2928b8e55b..a1dd76ce81 100644
> >> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> >> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> >> @@ -18,6 +18,7 @@ SRC_URI =3D "
> https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
> >>             file://0001-Fix-build-with-musl.patch \
> >>             file://include_array.patch \
> >>             file://include_xutil.patch \
> >> +           file://reduce-memory-overheads.patch \
> >>             "
> >>  SRC_URI[sha256sum] =3D
> "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
> >>
> >> --
> >> 2.30.1
> >>
> >>
> >>=20
> >>
>

--0000000000005b92f605bd194f53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Khem, this makes sense.</div><div><br></div><d=
iv>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, 9 Mar 2021 at 05:05, Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On Mon, Mar 8, 2021 at 7:50 PM Alex=
ander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blan=
k">alex.kanavin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Can you please explain the context for this? Why would we want to sup=
port building webkit on such constrained machines? 8g of ram means they can=
=
=E2=80=99t run more than 4-6 gcc processes, so webkit builds will be unbea=
rably slow anyway.<br>
&gt;<br>
<br>
this helps to avoid unwanted build breaks since gcc crashes when<br>
memory pressure is too high,<br>
when doing parallel builds this can happen very often since there are<br>
other tasks running in parallel, so these situations can arise often<br>
we have seen this happen on machines with 16GB RAM<br>
therefore saving some of the memory during linking helps reduce these<br>
breakages. they can still happen if say machine was doing more than 1<br>
builds in parallel but at least tools have done what they could.<br>
<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue 9. Mar 2021 at 1.00, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Helps builds on machines with less RAM ( 8G )<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../webkitgtk/reduce-memory-overheads.patch=C2=A0 =C2=A0| 2=
2 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5=
.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a>=C2=A0 |=
=C2=A0 1 +<br>
&gt;&gt;=C2=A0 2 files changed, 23 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-sato/webkit/webkitgtk/reduc=
e-memory-overheads.patch<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-sato/webkit/webkitgtk/reduce-memory-ove=
rheads.patch b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.p=
atch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..0493150a91<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta/recipes-sato/webkit/webkitgtk/reduce-memory-overheads.=
patch<br>
&gt;&gt; @@ -0,0 +1,22 @@<br>
&gt;&gt; +From: Alberto Garcia &lt;<a href=3D"mailto:berto@igalia.com" tar=
get=3D"_blank">berto@igalia.com</a>&gt;<br>
&gt;&gt; +Subject: Reduce memory usage when not using the Gold linker<br>
&gt;&gt; +Bug-Debian: <a href=3D"https://bugs.debian.org/949621" rel=3D"no=
referrer" target=3D"_blank">https://bugs.debian.org/949621</a><br>
&gt;&gt; +Forwarded: no<br>
&gt;&gt; +<br>
&gt;&gt; +Upstream-Status: Pending<br>
&gt;&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; +--- a/Source/cmake/OptionsCommon.cmake<br>
&gt;&gt; ++++ b/Source/cmake/OptionsCommon.cmake<br>
&gt;&gt; +@@ -95,6 +95,12 @@ option(GCC_OFFLINEASM_SOURCE_MAP<br>
&gt;&gt; +=C2=A0 =C2=A0&quot;Produce debug line information for offlineasm=
-generated code&quot;<br>
&gt;&gt; +=C2=A0 =C2=A0${GCC_OFFLINEASM_SOURCE_MAP_DEFAULT})<br>
&gt;&gt; +<br>
&gt;&gt; ++# Pass --reduce-memory-overheads to the bfd linker in order to =
save memory<br>
&gt;&gt; ++if (NOT USE_LD_GOLD)<br>
&gt;&gt; ++=C2=A0 =C2=A0 set(CMAKE_EXE_LINKER_FLAGS &quot;${CMAKE_EXE_LINK=
ER_FLAGS} -Wl,--reduce-memory-overheads&quot;)<br>
&gt;&gt; ++=C2=A0 =C2=A0 set(CMAKE_SHARED_LINKER_FLAGS &quot;${CMAKE_EXE_L=
INKER_FLAGS} -Wl,--reduce-memory-overheads&quot;)<br>
&gt;&gt; ++endif ()<br>
&gt;&gt; ++<br>
&gt;&gt; + # Enable the usage of OpenMP.<br>
&gt;&gt; + #=C2=A0 - At this moment, OpenMP is only used as an alternative=
 implementation<br>
&gt;&gt; + #=C2=A0 =C2=A0 to native threads for the parallelization of the=
 SVG filters.<br>
&gt;&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk=
_2.30.5.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a> b/=
meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=3D"nore=
ferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
&gt;&gt; index 2928b8e55b..a1dd76ce81 100644<br>
&gt;&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5=
.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
&gt;&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5=
.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
&gt;&gt; @@ -18,6 +18,7 @@ SRC_URI =3D &quot;<a href=3D"https://www.webkit=
gtk.org/releases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"=
_blank">https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-bu=
ild-with-musl.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://include_arr=
ay.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://include_xut=
il.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://reduce-memory-ov=
erheads.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;7d0dab08e3c5ae07bec80b2822ef42=
e952765d5724cac86eb23999bfed5a7f1f&quot;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.30.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div>

--0000000000005b92f605bd194f53--
