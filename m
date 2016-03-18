Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 44DCB6E5CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 12:02:06 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id ts10so113409659obc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 05:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gSUB+YDj/A19A4xr8WjyyfcoikhpMv6ZROhIaNMjKkY=;
	b=IJ5OyuygshXMvkl8nhRGPmEGdh/zaNZvIrwC7km2QSvnDP3145cNqPery7dIy87mXG
	AUClqYGZMKBHOV3LaCIgaTkRV3zkJFBK2+ag81v0jeYMdxBMrORBYTcXhA1vyTpftvJA
	aLqVbEZmBrKPFwyAR6JkeOCxYFu/n3XDj1hYZsG7z9fqBVBElOKIhkTFuqKxUWehO2AC
	1CUjtxPPHDMVlEUCovBVzPU8Xk5w1HbrW9Cjb65IpiBe4zVYhDf0pHec2Iiivat1ufcj
	CF9zR4zyMA72PedguH9BCpNqLUJgn5/v9V+Cz8sIh+Wh2tT589S47TjFEHp33rP3oHLB
	+pNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gSUB+YDj/A19A4xr8WjyyfcoikhpMv6ZROhIaNMjKkY=;
	b=i4Sg9E/Psjdp+748jhH2ufBwkohT2aBxQQa8kEUmfIAhYjga1PEXLk3h/NAKsUMkTK
	uj0F39/HT4JxsU9BLSZcXF9zip/DqV6oTcSUIfWisWRGuxQBDBhfxTdBXm4hVW/jyrZO
	FfjiHSltoZky4jojSQc5ql3r1m3fii4Bk8Pj7wTC6T1oVA8JU2zNZd14gTps95SK6Xl1
	r5+8NHAEZxoTrG9+hpFS2CT/Tk13236jU/wY26WLaUu1+PVN9e2/Bc/lUNul5x0ZT83+
	l9vetD04NYs18T1m5JBqEhfngbit9DCGC+HNR4o6SL3xfohpp1q9fsO35W+NWEfOwpMp
	Vlew==
X-Gm-Message-State: AD7BkJKZfvs5PpcViI0AtPW8Vzyyj2QkwVFe7AxYmLNc2QrWUZtWjeUd8tUPoKqf4kaYWAJKqrAm/LNNMoVz4gBd
X-Received: by 10.60.98.106 with SMTP id eh10mr9317378oeb.48.1458302526595;
	Fri, 18 Mar 2016 05:02:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.75.144 with HTTP; Fri, 18 Mar 2016 05:01:37 -0700 (PDT)
In-Reply-To: <bf3c411f84f26b13de2a4f40d1d7141b735ccb3f.1458282563.git.hongxu.jia@windriver.com>
References: <cover.1458282563.git.hongxu.jia@windriver.com>
	<bf3c411f84f26b13de2a4f40d1d7141b735ccb3f.1458282563.git.hongxu.jia@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 18 Mar 2016 14:01:37 +0200
Message-ID: <CAHiDW_HdK9jJmmFvt+PMgbK9O0qukSRw=MuY_+N-zXMH+wup=w@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/18] dtc.inc: fix buildpaths QA issue
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
X-List-Received-Date: Fri, 18 Mar 2016 12:02:08 -0000
Content-Type: multipart/alternative; boundary=089e01161ae612dedb052e51848c

--089e01161ae612dedb052e51848c
Content-Type: text/plain; charset=UTF-8

On 18 March 2016 at 11:01, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> Previous Makefile define its own CFLAGS, pass DEBUG_FLAGS to
> it could fix build path issue in DWARF.
>
> [YOCTO #8457]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-kernel/dtc/dtc.inc                    |  3 +++
>  .../dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch       | 30
> ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644
> meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
>
> diff --git a/meta/recipes-kernel/dtc/dtc.inc
> b/meta/recipes-kernel/dtc/dtc.inc
> index 0c409b0..a1a30fc 100644
> --- a/meta/recipes-kernel/dtc/dtc.inc
> +++ b/meta/recipes-kernel/dtc/dtc.inc
> @@ -7,8 +7,11 @@ DEPENDS = "flex-native bison-native"
>  SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git \
>             file://make_install.patch \
>           "
> +SRC_URI_append_class-target = " file://pass-DEBUG_FLAGS-to-CFLAGS.patch \
> +"
>
>  EXTRA_OEMAKE='PREFIX="${prefix}" LIBDIR="${libdir}" DESTDIR="${D}"'
> +EXTRA_OEMAKE_class-target += 'DEBUG_FLAGS="${DEBUG_FLAGS}"'
>
>  S = "${WORKDIR}/git"
>
> diff --git a/meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
> b/meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
> new file mode 100644
> index 0000000..3f17ee9
> --- /dev/null
> +++ b/meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch
> @@ -0,0 +1,30 @@
> +From 4019e29b0c1ec441fa43d9969197c24ad73f3b1a Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Fri, 26 Feb 2016 03:28:15 -0500
> +Subject: [PATCH] Makefile: pass DEBUG_FLAGS to CFLAGS
> +
> +It fixes buildpaths issue while compiling.
> +
> +Upstream-Status: Inappropriate [openembedded specific]
>

Is this really an openembedded specific change?

+
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 18838cc..4954f32 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =
> + CPPFLAGS = -I libfdt -I .
> + WARNINGS = -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
> +       -Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
> +-CFLAGS = -g -Os -fPIC -Werror $(WARNINGS)
> ++CFLAGS = $(DEBUG_FLAGS) -Os -fPIC -Werror $(WARNINGS)
> +
> + BISON = bison
> + LEX = flex
> +--
> +1.9.1
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e01161ae612dedb052e51848c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
8 March 2016 at 11:01, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mailto:h=
ongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Previous Makefile define i=
ts own CFLAGS, pass DEBUG_FLAGS to<br>
it could fix build path issue in DWARF.<br>
<br>
[YOCTO #8457]<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/dtc/dtc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
=C2=A0.../dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 30 ++++++++++++++++++++++<br>
=C2=A02 files changed, 33 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CF=
LAGS.patch<br>
<br>
diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.=
inc<br>
index 0c409b0..a1a30fc 100644<br>
--- a/meta/recipes-kernel/dtc/dtc.inc<br>
+++ b/meta/recipes-kernel/dtc/dtc.inc<br>
@@ -7,8 +7,11 @@ DEPENDS =3D &quot;flex-native bison-native&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/pub/scm/util=
s/dtc/dtc.git" rel=3D"noreferrer" target=3D"_blank">git.kernel.org/pub/scm/=
utils/dtc/dtc.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://make_install.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+SRC_URI_append_class-target =3D &quot; file://pass-DEBUG_FLAGS-to-CFLAGS.p=
atch \<br>
+&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE=3D&#39;PREFIX=3D&quot;${prefix}&quot; LIBDIR=3D&quot;${l=
ibdir}&quot; DESTDIR=3D&quot;${D}&quot;&#39;<br>
+EXTRA_OEMAKE_class-target +=3D &#39;DEBUG_FLAGS=3D&quot;${DEBUG_FLAGS}&quo=
t;&#39;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
diff --git a/meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch b=
/meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch<br>
new file mode 100644<br>
index 0000000..3f17ee9<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/dtc/dtc/pass-DEBUG_FLAGS-to-CFLAGS.patch<br>
@@ -0,0 +1,30 @@<br>
+From 4019e29b0c1ec441fa43d9969197c24ad73f3b1a Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Fri, 26 Feb 2016 03:28:15 -0500<br>
+Subject: [PATCH] Makefile: pass DEBUG_FLAGS to CFLAGS<br>
+<br>
+It fixes buildpaths issue while compiling.<br>
+<br>
+Upstream-Status: Inappropriate [openembedded specific]<br>
</blockquote><div><br></div><div>Is this really an openembedded specific ch=
ange?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ Makefile | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 18838cc..4954f32 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -18,7 +18,7 @@ CONFIG_LOCALVERSION =3D<br>
+ CPPFLAGS =3D -I libfdt -I .<br>
+ WARNINGS =3D -Werror -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-Wstrict-prototypes -Wmissing-prototypes -Wredu=
ndant-decls -Wshadow<br>
+-CFLAGS =3D -g -Os -fPIC -Werror $(WARNINGS)<br>
++CFLAGS =3D $(DEBUG_FLAGS) -Os -fPIC -Werror $(WARNINGS)<br>
+<br>
+ BISON =3D bison<br>
+ LEX =3D flex<br>
+--<br>
+1.9.1<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--089e01161ae612dedb052e51848c--
