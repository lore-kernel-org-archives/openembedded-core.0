Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id D26AC6C3A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 21:44:33 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id y195so4518775qka.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 13:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NjMXavrRdR4+LKv4E8zheEMT4j1I02Cq9Zu4yvnUc48=;
	b=pFyTNV7cesxBQXLHlq0/WgEqINXazihjR2oDQ3wxFL8VzQLt39OwYrlV6jeha7YX+N
	LYKge0Pf1DdMGF/T00KzmAUnh3ZAbgSsINPWWiQbliJWGi7h8k/HHvufLO897vDFUWYl
	ZKecSv5DOtesHkIE38F9QB3O1iOWsDOs1D2fyX+jIqiya/M98oBI+9eoIRXlb899si5q
	xQr2iePO9meoKcl2K4lifHdhwDVY4Jikj2t4oYjI8Aja8SJGgtgFX9VKHJ7PIup7ym/X
	7+WJrYFcN5UH+1f3GfzE6BYpEw/hyWKnMkd3nu+EtuXK1x1tpOWJKZ4IrgUccqYs4rsa
	RAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NjMXavrRdR4+LKv4E8zheEMT4j1I02Cq9Zu4yvnUc48=;
	b=hL3PEAv7B4sBqQ2MY0mwq3ezsEVsJ6IrsbB0Wky7fm2zmcRIhD4T+ri7u0oKY4e0jw
	IqD2EKXjoeX3c+yPEcL0SVoXftHWxeXDFVg0AICEnPpm4VLWbVblPJuA9qdNYTf5tTtu
	Mn0aZaTFGuo2HSPs+dmMZ2IaOB9fZAAb80cnITdzm+6KCQZeXqZlHuphoSTLBqk/EMpM
	vcRHr8dVTXQsW2bPx+TEFp2JV7gXjpWDzVsZFw1hQgFlWnrgByB2InvfMsUXATkyRr/q
	/9BClpGGaDRQvobyu2AaQo8ImnaP28bqQCrTy+7F+JMRwWBhrVY+oAzLlFWv3WXWFgFs
	05JA==
X-Gm-Message-State: AHQUAuayrPreYuuy7mGH1rYzgh0sg+7KNE+BRBZUki/J4Tf7GQVGV08o
	O5Ytb6OQSpfX/XUW4xKwimL1P3bfb+XDsOfmm9g=
X-Google-Smtp-Source: AHgI3IaM4DK7I5Xm7kSuqf7islnW3oxslFIsHPWDMt1qV4tkHUiQqtWjc6yQWgEOwnbmDBO7J2eQIwd+ihziWOCV1g0=
X-Received: by 2002:a37:a7ca:: with SMTP id q193mr4670478qke.102.1550180674488;
	Thu, 14 Feb 2019 13:44:34 -0800 (PST)
MIME-Version: 1.0
References: <20190214054857.18876-1-anuj.mittal@intel.com>
	<20190214054857.18876-3-anuj.mittal@intel.com>
	<CAMKF1sqiTB5-pPBQw8xSdg0h=_GTQ4MTtdqATM8_HvWJmWd+-Q@mail.gmail.com>
	<9475d743dd65589d56dbb2f55a582144f11b6ecb.camel@intel.com>
In-Reply-To: <9475d743dd65589d56dbb2f55a582144f11b6ecb.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Feb 2019 13:44:22 -0800
Message-ID: <CAMKF1spR0d0raBmb0E1Hr2yTdBV7=43xSv37KXFw50cAZJRNnw@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] pixman: upgrade 0.34.0 -> 0.38.0
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
X-List-Received-Date: Thu, 14 Feb 2019 21:44:34 -0000
Content-Type: multipart/alternative; boundary="00000000000070d1d00581e19085"

--00000000000070d1d00581e19085
Content-Type: text/plain; charset="UTF-8"

Thanks!


On Thu, Feb 14, 2019 at 11:53 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:

> On Thu, 2019-02-14 at 07:58 -0800, Khem Raj wrote:
> > On Wed, Feb 13, 2019 at 9:49 PM Anuj Mittal <anuj.mittal@intel.com>
> > wrote:
> > >
> > > For changes, see:
> > >
> > >
>
> https://cgit.freedesktop.org/pixman/log/?qt=range&q=pixman-0.38.0...pixman-0.34.0
> > >
> > > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > > ---
> > >  .../xorg-lib/pixman/asm_include.patch         | 29 -------------
> > > ------
> > >  .../{pixman_0.34.0.bb => pixman_0.38.0.bb}    |  5 ++--
> > >  2 files changed, 2 insertions(+), 32 deletions(-)
> > >  delete mode 100644 meta/recipes-graphics/xorg-
> > > lib/pixman/asm_include.patch
> > >  rename meta/recipes-graphics/xorg-lib/{pixman_0.34.0.bb =>
> > > pixman_0.38.0.bb} (89%)
> > >
> > > diff --git a/meta/recipes-graphics/xorg-
> > > lib/pixman/asm_include.patch b/meta/recipes-graphics/xorg-
> > > lib/pixman/asm_include.patch
> > > deleted file mode 100644
> > > index b52a5707d6..0000000000
> > > --- a/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch
> > > +++ /dev/null
> > > @@ -1,29 +0,0 @@
> > > -Fixes errors like
> > > -
> > > -Assembler messages:
> > > -Fatal error: can't create .libs/pixman-mips-dspr2-asm.o: No such
> > > file or directory
> > > -
> > > -it works with glibc because it uses gcc fixed-headers but thats
> > > not right.
> > > -
> > > -We move the include under C block
> > > -
> > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > -Upstream-Status: Pending
> > > -Index: pixman-0.32.6/pixman/pixman-private.h
> > > -==================================================================
> > > =
> > > ---- pixman-0.32.6.orig/pixman/pixman-private.h
> > > -+++ pixman-0.32.6/pixman/pixman-private.h
> > > -@@ -1,4 +1,3 @@
> > > --#include <float.h>
> > > -
> > > - #ifndef PIXMAN_PRIVATE_H
> > > - #define PIXMAN_PRIVATE_H
> > > -@@ -17,6 +16,8 @@
> > > -
> > > - #ifndef __ASSEMBLER__
> > > -
> > > -+#include <float.h>
> > > -+
> > > - #ifndef PACKAGE
> > > - #  error config.h must be included before pixman-private.h
> > > - #endif
> > > diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
> > > b/meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
> > > similarity index 89%
> > > rename from meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
> > > rename to meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
> > > index c290fa4614..49c3d62342 100644
> > > --- a/meta/recipes-graphics/xorg-lib/pixman_0.34.0.bb
> > > +++ b/meta/recipes-graphics/xorg-lib/pixman_0.38.0.bb
> > > @@ -31,11 +31,10 @@ EXTRA_OECONF_class-nativesdk = "--disable-gtk"
> > >
> > >  SRC_URI += "\
> > >              file://0001-ARM-qemu-related-workarounds-in-cpu-
> > > features-detecti.patch \
> > > -           file://asm_include.patch \
> >
> > can you confirm you tested a build with musl/mips ?
>
> I tested with musl. The change is also present upstream now:
>
>
>
> https://cgit.freedesktop.org/pixman/commit/?id=7c6066b700c7cdd4aeb8be426b14b3a5f0de4b6c
>

--00000000000070d1d00581e19085
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks!</div><div dir=3D"auto"><br></div><div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 14, 2019 at 11:53 =
AM Mittal, Anuj &lt;<a href=3D"mailto:anuj.mittal@intel.com">anuj.mittal@in=
tel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2019=
-02-14 at 07:58 -0800, Khem Raj wrote:<br>
&gt; On Wed, Feb 13, 2019 at 9:49 PM Anuj Mittal &lt;<a href=3D"mailto:anuj=
.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; For changes, see:<br>
&gt; &gt; <br>
&gt; &gt; <br>
<a href=3D"https://cgit.freedesktop.org/pixman/log/?qt=3Drange&amp;q=3Dpixm=
an-0.38.0...pixman-0.34.0" rel=3D"noreferrer" target=3D"_blank">https://cgi=
t.freedesktop.org/pixman/log/?qt=3Drange&amp;q=3Dpixman-0.38.0...pixman-0.3=
4.0</a><br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@inte=
l.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../xorg-lib/pixman/asm_include.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 29 -------------<br>
&gt; &gt; ------<br>
&gt; &gt;=C2=A0 .../{<a href=3D"http://pixman_0.34.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">pixman_0.34.0.bb</a> =3D&gt; <a href=3D"http://pixman_0.=
38.0.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.38.0.bb</a>}=C2=A0 =
=C2=A0 |=C2=A0 5 ++--<br>
&gt; &gt;=C2=A0 2 files changed, 2 insertions(+), 32 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-graphics/xorg-<br>
&gt; &gt; lib/pixman/asm_include.patch<br>
&gt; &gt;=C2=A0 rename meta/recipes-graphics/xorg-lib/{<a href=3D"http://pi=
xman_0.34.0.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.34.0.bb</a> =
=3D&gt;<br>
&gt; &gt; <a href=3D"http://pixman_0.38.0.bb" rel=3D"noreferrer" target=3D"=
_blank">pixman_0.38.0.bb</a>} (89%)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-graphics/xorg-<br>
&gt; &gt; lib/pixman/asm_include.patch b/meta/recipes-graphics/xorg-<br>
&gt; &gt; lib/pixman/asm_include.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index b52a5707d6..0000000000<br>
&gt; &gt; --- a/meta/recipes-graphics/xorg-lib/pixman/asm_include.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,29 +0,0 @@<br>
&gt; &gt; -Fixes errors like<br>
&gt; &gt; -<br>
&gt; &gt; -Assembler messages:<br>
&gt; &gt; -Fatal error: can&#39;t create .libs/pixman-mips-dspr2-asm.o: No =
such<br>
&gt; &gt; file or directory<br>
&gt; &gt; -<br>
&gt; &gt; -it works with glibc because it uses gcc fixed-headers but thats<=
br>
&gt; &gt; not right.<br>
&gt; &gt; -<br>
&gt; &gt; -We move the include under C block<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; -Upstream-Status: Pending<br>
&gt; &gt; -Index: pixman-0.32.6/pixman/pixman-private.h<br>
&gt; &gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; =3D<br>
&gt; &gt; ---- pixman-0.32.6.orig/pixman/pixman-private.h<br>
&gt; &gt; -+++ pixman-0.32.6/pixman/pixman-private.h<br>
&gt; &gt; -@@ -1,4 +1,3 @@<br>
&gt; &gt; --#include &lt;float.h&gt;<br>
&gt; &gt; -<br>
&gt; &gt; - #ifndef PIXMAN_PRIVATE_H<br>
&gt; &gt; - #define PIXMAN_PRIVATE_H<br>
&gt; &gt; -@@ -17,6 +16,8 @@<br>
&gt; &gt; -<br>
&gt; &gt; - #ifndef __ASSEMBLER__<br>
&gt; &gt; -<br>
&gt; &gt; -+#include &lt;float.h&gt;<br>
&gt; &gt; -+<br>
&gt; &gt; - #ifndef PACKAGE<br>
&gt; &gt; - #=C2=A0 error config.h must be included before pixman-private.h=
<br>
&gt; &gt; - #endif<br>
&gt; &gt; diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://pix=
man_0.34.0.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.34.0.bb</a><br=
>
&gt; &gt; b/meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.38.0.=
bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.38.0.bb</a><br>
&gt; &gt; similarity index 89%<br>
&gt; &gt; rename from meta/recipes-graphics/xorg-lib/<a href=3D"http://pixm=
an_0.34.0.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.34.0.bb</a><br>
&gt; &gt; rename to meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman=
_0.38.0.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.38.0.bb</a><br>
&gt; &gt; index c290fa4614..49c3d62342 100644<br>
&gt; &gt; --- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.3=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.34.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://pixman_0.3=
8.0.bb" rel=3D"noreferrer" target=3D"_blank">pixman_0.38.0.bb</a><br>
&gt; &gt; @@ -31,11 +31,10 @@ EXTRA_OECONF_class-nativesdk =3D &quot;--disa=
ble-gtk&quot;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 SRC_URI +=3D &quot;\<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-ARM-q=
emu-related-workarounds-in-cpu-<br>
&gt; &gt; features-detecti.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://asm_include.patc=
h \<br>
&gt; <br>
&gt; can you confirm you tested a build with musl/mips ?<br>
<br>
I tested with musl. The change is also present upstream now:<br>
<br>
<br>
<a href=3D"https://cgit.freedesktop.org/pixman/commit/?id=3D7c6066b700c7cdd=
4aeb8be426b14b3a5f0de4b6c" rel=3D"noreferrer" target=3D"_blank">https://cgi=
t.freedesktop.org/pixman/commit/?id=3D7c6066b700c7cdd4aeb8be426b14b3a5f0de4=
b6c</a><br>
</blockquote></div></div>

--00000000000070d1d00581e19085--
