Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web10.43326.1591033713091767378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 10:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qtT1rtyH;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id z13so408698vsn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 10:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sv3UYCakpIwUPwERWZT9ioBydcg3ujfVHD0Ng4myK08=;
        b=qtT1rtyHBH9zp+YEFI7yogN4GGavNuTCOUa7R1PeBMoi8sL8UQFI5VtqKgYgpKelMA
         Pt7nHzDaRLBNAhl8cJMpImM3/go2gNa6rbj8C5RzhCnynwMeCZRlqS9lxUB5G0tgMpPg
         xG0D7B2ujcbRwWIlF0Pswd1D2hMFOjd4/L3BSJgZVX6NmYjhq+ymclkQVQSwtdeV49QL
         ItTxtgdhDPvbxuQsvrjsTtkPPyybwc2tldz3gOP7iaNq9S7gW1nIdU+3NL0CQi3d4mgX
         adw2kWidsA4A+8adeu9XfI0QluG5SqTy9GMfyUTPhVb3QpUBqBbgXOOk+1t9K7/LwvNB
         /kHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sv3UYCakpIwUPwERWZT9ioBydcg3ujfVHD0Ng4myK08=;
        b=KV+hWhIRWx/zWDUn/v8plEL2UbYPgLnXd1kWoUZZiNkjMGk4XYUKJ3VuFEpVWF7ZwQ
         J3mNp32+2Mt1+xadFgnCUHzYyEBPtZNprBaMSptciUG8qPJMxV2FXZ6hVjo9eVTMDXuo
         EmLCIoNA8WMyFT6USYV0D5kAsbXmJCOcpzmWv7uVLWTI3Q1YvzZ5DAL0kXhUhqF8Bk3Q
         Btnn36V5m4hqa3yBtRc8NEuKFMHus87Dskcq4SzARYFZUn0riFdw6Zk7Y5BtR5CxeGTE
         p+DCtRy6uoJPopI2C4ZrDviFWjFftZPhKKA0tdASs9Dz+ONgp34s48OnBMkqnQcLnMMT
         lzdg==
X-Gm-Message-State: AOAM5318o0jUkG92jiC25rUyqWEB0YHKeE6JM8zFT5SxtO77ztBrjRDB
	+UKtBGQpECjEp3UCpha4qn3qmfidP1SWphdk0KA=
X-Google-Smtp-Source: ABdhPJyuVzADAUhb4dNvToXwQP+onFQHiOBtc9SPb5Hcqxr2Q0lL/S6331GZKe3vZGVkmlYAYP4547mE/K3q0Cm/j54=
X-Received: by 2002:a67:d098:: with SMTP id s24mr15019441vsi.25.1591033712179;
 Mon, 01 Jun 2020 10:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-45-alex.kanavin@gmail.com> <CAMKF1soxBMZZ92i6fmS_KqSdrR19QqWWrJesZYoZuT2NROKcFg@mail.gmail.com>
In-Reply-To: <CAMKF1soxBMZZ92i6fmS_KqSdrR19QqWWrJesZYoZuT2NROKcFg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 1 Jun 2020 19:48:20 +0200
Message-ID: <CANNYZj_Kxp60vrkHZduUnhk22xK8dY3Z_ORk1A9h=80uAAifSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 45/70] libunwind: upgrade 1.3.1 -> 1.4.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003d7e0405a7096704"

--0000000000003d7e0405a7096704
Content-Type: text/plain; charset="UTF-8"

Seems like an arm-specific item, as x86 musl builds passed fine on the AB.

Alex

On Mon, 1 Jun 2020 at 18:51, Khem Raj <raj.khem@gmail.com> wrote:

> Fails to build on musl
>
> https://errors.yoctoproject.org/Errors/Details/414866/
>
> On Sun, May 31, 2020 at 8:54 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../libunwind/musl-header-conflict.patch      | 27 ++++++++++++-------
> >  ...{libunwind_1.3.1.bb => libunwind_1.4.0.bb} |  4 +--
> >  2 files changed, 19 insertions(+), 12 deletions(-)
> >  rename meta/recipes-support/libunwind/{libunwind_1.3.1.bb =>
> libunwind_1.4.0.bb} (87%)
> >
> > diff --git
> a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
> b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
> > index 79f63fd84e..63b78a8a30 100644
> > --- a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
> > +++ b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.patch
> > @@ -1,4 +1,7 @@
> > -If you:
> > +From 49b21f0fe5fb93b30b94cc449429fd33de0652a7 Mon Sep 17 00:00:00 2001
> > +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +Date: Thu, 18 Aug 2016 14:46:32 +0100
> > +Subject: [PATCH] If you:
> >
> >  TCLIBC=musl bitbake unwind
> >  TCLIBC=musl bitbake gcc-runtime -c cleansstate
> > @@ -6,12 +9,12 @@ TCLIBC=musl bitbake gcc-runtime
> >
> >  you will see libstdc++ fail to build due to finding libunwind's header
> file.
> >
> > -Khem: "When we build any of gcc components they expect to use internal
> version
> > -and that works with glibc based gcc since the search headers first look
> into gcc
> > -headers, however with musl the gcc headers are searched after the
> standard
> > +Khem: "When we build any of gcc components they expect to use internal
> version
> > +and that works with glibc based gcc since the search headers first look
> into gcc
> > +headers, however with musl the gcc headers are searched after the
> standard
> >  headers ( which is by design the right thing )."
> >
> > -This patch hacks around the issue by looking for a define used during
> gcc-runtime's
> > +This patch hacks around the issue by looking for a define used during
> gcc-runtime's
> >  build and skipping to the internal header in that case.
> >
> >  [YOCTO #10129]
> > @@ -20,11 +23,15 @@ RP 2016/8/18
> >
> >  Upstream-Status: Inappropriate [really need to fix gcc]
> >
> > -Index: git/include/unwind.h
> > -===================================================================
> > ---- git.orig/include/unwind.h
> > -+++ git/include/unwind.h
> > -@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER L
> > +---
> > + include/unwind.h | 4 ++++
> > + 1 file changed, 4 insertions(+)
> > +
> > +diff --git a/include/unwind.h b/include/unwind.h
> > +index 7cf128d..31c2871 100644
> > +--- a/include/unwind.h
> > ++++ b/include/unwind.h
> > +@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> WHETHER IN AN ACTION
> >   OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> >   WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.  */
> >
> > diff --git a/meta/recipes-support/libunwind/libunwind_1.3.1.bb
> b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
> > similarity index 87%
> > rename from meta/recipes-support/libunwind/libunwind_1.3.1.bb
> > rename to meta/recipes-support/libunwind/libunwind_1.4.0.bb
> > index 037e04c3c0..f50205f1b9 100644
> > --- a/meta/recipes-support/libunwind/libunwind_1.3.1.bb
> > +++ b/meta/recipes-support/libunwind/libunwind_1.4.0.bb
> > @@ -10,8 +10,8 @@ SRC_URI = "
> http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
> >             "
> >  SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
> >
> > -SRC_URI[md5sum] = "a04f69d66d8e16f8bf3ab72a69112cd6"
> > -SRC_URI[sha256sum] =
> "43997a3939b6ccdf2f669b50fdb8a4d3205374728c2923ddc2354c65260214f8"
> > +SRC_URI[md5sum] = "5114504c74ac3992ac06aa551cd55678"
> > +SRC_URI[sha256sum] =
> "df59c931bd4d7ebfd83ee481c943edf015138089b8e50abed8d9c57ba9338435"
> >
> >  EXTRA_OECONF_append_libc-musl = " --disable-documentation
> --disable-tests --enable-static"
> >
> > --
> > 2.26.2
> >
> > 
>

--0000000000003d7e0405a7096704
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Seems like an arm-specific item, as x86 musl builds p=
assed fine on the AB.</div><div><br></div><div>Alex<br></div><div dir=3D"lt=
r"><br></div><div dir=3D"ltr">On Mon, 1 Jun 2020 at 18:51, Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Fails to build on musl<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/414866/" rel=3D"=
noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Detail=
s/414866/</a><br>
<br>
On Sun, May 31, 2020 at 8:54 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanav=
in@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libunwind/musl-header-conflict.patch=C2=A0 =C2=A0 =C2=A0 | =
27 ++++++++++++-------<br>
&gt;=C2=A0 ...{<a href=3D"http://libunwind_1.3.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libunwind_1.3.1.bb</a> =3D&gt; <a href=3D"http://libunwind_=
1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.4.0.bb</a>} |=C2=
=
=A0 4 +--<br>
&gt;=C2=A0 2 files changed, 19 insertions(+), 12 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-support/libunwind/{<a href=3D"http://libunw=
ind_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.3.1.bb</a> =
=3D&gt; <a href=3D"http://libunwind_1.4.0.bb" rel=3D"noreferrer" target=3D=
"_blank">libunwind_1.4.0.bb</a>} (87%)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libunwind/libunwind/musl-header-con=
flict.patch b/meta/recipes-support/libunwind/libunwind/musl-header-conflict=
.patch<br>
&gt; index 79f63fd84e..63b78a8a30 100644<br>
&gt; --- a/meta/recipes-support/libunwind/libunwind/musl-header-conflict.p=
atch<br>
&gt; +++ b/meta/recipes-support/libunwind/libunwind/musl-header-conflict.p=
atch<br>
&gt; @@ -1,4 +1,7 @@<br>
&gt; -If you:<br>
&gt; +From 49b21f0fe5fb93b30b94cc449429fd33de0652a7 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; +Date: Thu, 18 Aug 2016 14:46:32 +0100<br>
&gt; +Subject: [PATCH] If you:<br>
&gt;<br>
&gt;=C2=A0 TCLIBC=3Dmusl bitbake unwind<br>
&gt;=C2=A0 TCLIBC=3Dmusl bitbake gcc-runtime -c cleansstate<br>
&gt; @@ -6,12 +9,12 @@ TCLIBC=3Dmusl bitbake gcc-runtime<br>
&gt;<br>
&gt;=C2=A0 you will see libstdc++ fail to build due to finding libunwind&#=
39;s header file.<br>
&gt;<br>
&gt; -Khem: &quot;When we build any of gcc components they expect to use i=
nternal version<br>
&gt; -and that works with glibc based gcc since the search headers first l=
ook into gcc<br>
&gt; -headers, however with musl the gcc headers are searched after the st=
andard<br>
&gt; +Khem: &quot;When we build any of gcc components they expect to use i=
nternal version<br>
&gt; +and that works with glibc based gcc since the search headers first l=
ook into gcc<br>
&gt; +headers, however with musl the gcc headers are searched after the st=
andard<br>
&gt;=C2=A0 headers ( which is by design the right thing ).&quot;<br>
&gt;<br>
&gt; -This patch hacks around the issue by looking for a define used durin=
g gcc-runtime&#39;s<br>
&gt; +This patch hacks around the issue by looking for a define used durin=
g gcc-runtime&#39;s<br>
&gt;=C2=A0 build and skipping to the internal header in that case.<br>
&gt;<br>
&gt;=C2=A0 [YOCTO #10129]<br>
&gt; @@ -20,11 +23,15 @@ RP 2016/8/18<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [really need to fix gcc]<br>
&gt;<br>
&gt; -Index: git/include/unwind.h<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- git.orig/include/unwind.h<br>
&gt; -+++ git/include/unwind.h<br>
&gt; -@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER L<br>
&gt; +---<br>
&gt; + include/unwind.h | 4 ++++<br>
&gt; + 1 file changed, 4 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/include/unwind.h b/include/unwind.h<br>
&gt; +index 7cf128d..31c2871 100644<br>
&gt; +--- a/include/unwind.h<br>
&gt; ++++ b/include/unwind.h<br>
&gt; +@@ -23,6 +23,10 @@ LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,=
 WHETHER IN AN ACTION<br>
&gt;=C2=A0 =C2=A0OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR I=
N CONNECTION<br>
&gt;=C2=A0 =C2=A0WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOF=
TWARE.=C2=A0 */<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libunwind/<a href=3D"http://libunwi=
nd_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.3.1.bb</a> b/=
meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.4.0.bb" rel=3D=
"noreferrer" target=3D"_blank">libunwind_1.4.0.bb</a><br>
&gt; similarity index 87%<br>
&gt; rename from meta/recipes-support/libunwind/<a href=3D"http://libunwin=
d_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.3.1.bb</a><br>
&gt; rename to meta/recipes-support/libunwind/<a href=3D"http://libunwind_=
1.4.0.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.4.0.bb</a><br>
&gt; index 037e04c3c0..f50205f1b9 100644<br>
&gt; --- a/meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.3.=
1.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.3.1.bb</a><br>
&gt; +++ b/meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.4.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.4.0.bb</a><br>
&gt; @@ -10,8 +10,8 @@ SRC_URI =3D &quot;<a href=3D"http://download.savann=
ah.nongnu.org/releases/libunwind/libunwind-$%7BPV" rel=3D"noreferrer" targe=
t=3D"_blank">http://download.savannah.nongnu.org/releases/libunwind/libunwi=
nd-${PV</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 SRC_URI_append_libc-musl =3D &quot; file://musl-header-conflict=
.patch&quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;a04f69d66d8e16f8bf3ab72a69112cd6&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;43997a3939b6ccdf2f669b50fdb8a4d32053747=
28c2923ddc2354c65260214f8&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;5114504c74ac3992ac06aa551cd55678&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;df59c931bd4d7ebfd83ee481c943edf01513808=
9b8e50abed8d9c57ba9338435&quot;<br>
&gt;<br>
&gt;=C2=A0 EXTRA_OECONF_append_libc-musl =3D &quot; --disable-documentatio=
n --disable-tests --enable-static&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.26.2<br>
&gt;<br>
&gt; <br>
</blockquote></div></div>

--0000000000003d7e0405a7096704--
