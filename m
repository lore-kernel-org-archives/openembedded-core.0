Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id C5EB776E3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 13:36:43 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id v123so10396613qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dFB6PPQH0kuo2uLIrmuVQo56JRsk/FF04PY+dqEiQLU=;
	b=HGxnQNTRB5+QHwd8nHjZRy5HIBVL6lHshdVLWFNBXc8Tq/Vv+aizCjgIDQ/oMxtyTk
	uVKOMHZaY+kG9W/QbaqW5QNsA7zJrHclSNW4YNgWy3xUjcdvwb75j1jsQG46mv6PBNfB
	ZS7jEWzrb2OeFheS3u9OthF5pHYn+X2EKTTsivqXtsrIKyuWVfugJZSTeh1UqoPwoc33
	+JILfK9y/fP49nTa78EuzK3yzK5sHQ4AJkCkw8dKWVGusSmSWMDTsF6masKkv9Vq1XKy
	eV5hUMuL/zpal/vZCKflVaneKx6nFnxq68IDG9QIiIggLkSXhANw+il785v+yBlLORAY
	0yeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dFB6PPQH0kuo2uLIrmuVQo56JRsk/FF04PY+dqEiQLU=;
	b=jDnM1+Gs3PSrAqQO1SJjeiK8gvHVBaT3sY+dVWcSxGMbVwOpKbOheS16Ak60ZSROcb
	dnQB7EcyeZBx3yBo1QAJobnzK1rIrYoOqUX3WRF8/LUR2bv+wiMbBU+6eDd0Rmlx/yBl
	xHjDNrqIjcGLk4GLnkADgmdpTB9Opu1WCm4CadRg9ezWQ4BiOmiW0oIG+y4NAddr1n+u
	+JVtFvKcEeAEsSHmMH2iliSMKPdrOR6RK19vpsZjautZACbAHUDEQ5MvImjv5t0QXQ+t
	2Ldo28Tbt+oZh84fPeU76qEBWC7uaerBZZyMK72fe5drtP0ceZeTY3GitFqM1orFqTAc
	OJ+Q==
X-Gm-Message-State: AEkoouteqwtkVXXxCvPqBzS/OV2HuISBufdRjmdQxij/KxCdpfeENvhBwtJbqD03WH4xJAhMSUfp4wIhikkaaQ==
X-Received: by 10.55.190.68 with SMTP id o65mr28195240qkf.92.1471959404173;
	Tue, 23 Aug 2016 06:36:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Tue, 23 Aug 2016 06:36:43 -0700 (PDT)
In-Reply-To: <d703e7a1226ccde6956de23fc1b04a7fa00c5086.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<d703e7a1226ccde6956de23fc1b04a7fa00c5086.1471936926.git-series.jeremy.rosen@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 Aug 2016 09:36:43 -0400
Message-ID: <CADkTA4NU-X9mif2cK03piq+6YyrGtw8ak-A9ysfvwrUu3eVX3Q@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] [linux-yocto] allow overriding compiler name in KConfig
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
X-List-Received-Date: Tue, 23 Aug 2016 13:36:44 -0000
Content-Type: multipart/alternative; boundary=94eb2c043be268e1a9053abd414f

--94eb2c043be268e1a9053abd414f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 3:25 AM, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile=
.fr> wrote:

> The KConfig infrastructure hardwires the compiler name to gcc, which brea=
ks
> the BUILD_CC feature. This is needed even when cross compiling because
> make *config rely on the kconfig infrastructure
>

Can you elaborate ? I'm not aware of any issues with either the host builds
or
target builds with the kernel.

If there's an issue, we need to fix it upstream .. not here.


> ---
>  meta/recipes-kernel/linux/linux-yocto.inc
>                              |  4 ++++
>  meta/recipes-kernel/linux/linux-yocto/0001-Allow-
> overriding-host-compiler-name-from-environment.patch | 32
> ++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-Allow-
> overriding-host-compiler-name-from-environment.patch
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 98a48ec..63c1531 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -58,3 +58,7 @@ do_install_append(){
>  addtask kernel_link_images after do_compile before do_install
>  addtask validate_branches before do_patch after do_kernel_checkout
>  addtask kernel_configcheck after do_configure before do_compile
> +
> +SRC_URI_append =3D " file://0001-Allow-overriding-host-compiler-name-fro=
m-
> environment.patch"
>

We don't carry patches to linux-yocto like this, they are sent to the
linux-yocto mailing list, and
integrated into the tree itself.

Bruce


> +export HOSTCC =3D "${BUILD_CC}"
> +export HOSTCXX =3D "${BUILD_CXX}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-Allow-
> overriding-host-compiler-name-from-environment.patch
> b/meta/recipes-kernel/linux/linux-

yocto/0001-Allow-overriding-host-compiler-name-from-environment.patch
> new file mode 100644
> index 0000000..6fcfbc8
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/0001-Allow-
> overriding-host-compiler-name-from-environment.patch
> @@ -0,0 +1,32 @@
> +From 0ce4c4f29b5d456a7707e870c7affe524f7c8807 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9my=3D20Rosen?=3D <jeremy.rosen@s=
mile.fr>
> +Date: Tue, 16 Aug 2016 22:39:29 +0200
> +Subject: [PATCH] Allow overriding host-compiler name from environment
> + variables
> +
> +---
> + Makefile | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 70dea02..1f0d2d2 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -295,10 +295,10 @@ CONFIG_SHELL :=3D $(shell if [ -x "$$BASH" ]; then
> echo $$BASH; \
> +         else if [ -x /bin/bash ]; then echo /bin/bash; \
> +         else echo sh; fi ; fi)
> +
> +-HOSTCC       =3D gcc
> +-HOSTCXX      =3D g++
> +-HOSTCFLAGS   =3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2
> -fomit-frame-pointer -std=3Dgnu89
> +-HOSTCXXFLAGS =3D -O2
> ++HOSTCC       ?=3D gcc
> ++HOSTCXX      ?=3D g++
> ++HOSTCFLAGS   ?=3D -Wall -Wmissing-prototypes -Wstrict-prototypes -O2
> -fomit-frame-pointer -std=3Dgnu89
> ++HOSTCXXFLAGS ?=3D -O2
> +
> + ifeq ($(shell $(HOSTCC) -v 2>&1 | grep -c "clang version"), 1)
> + HOSTCFLAGS  +=3D -Wno-unused-value -Wno-unused-parameter \
> +--
> +2.8.1
> +
> --
> git-series 0.8.9
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c043be268e1a9053abd414f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_extra"><div class=3D"gmail_quote"=
>On Tue, Aug 23, 2016 at 3:25 AM, J=C3=A9r=C3=A9my Rosen <span dir=3D"ltr">=
&lt;<a href=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen=
@smile.fr</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The KCon=
fig infrastructure hardwires the compiler name to gcc, which breaks<br>
the BUILD_CC feature. This is needed even when cross compiling because<br>
make *config rely on the kconfig infrastructure<br></blockquote><div><br></=
div><div>Can you elaborate ? I&#39;m not aware of any issues with either th=
e host builds or<br></div><div>target builds with the kernel.<br><br></div>=
<div>If there&#39;s an issue, we need to fix it upstream .. not here.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto/0001-Allow-<wbr>overriding=
-host-compiler-name-<wbr>from-environment.patch | 32 ++++++++++++++++++++++=
++++++++<wbr>++<br>
=C2=A02 files changed, 36 insertions(+), 0 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<wbr>linux-yocto/0001-Al=
low-<wbr>overriding-host-compiler-name-<wbr>from-environment.patch<br>
<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc b/meta/recipes-=
kernel/linux/<wbr>linux-yocto.inc<br>
index 98a48ec..63c1531 100644<br>
--- a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
@@ -58,3 +58,7 @@ do_install_append(){<br>
=C2=A0addtask kernel_link_images after do_compile before do_install<br>
=C2=A0addtask validate_branches before do_patch after do_kernel_checkout<br=
>
=C2=A0addtask kernel_configcheck after do_configure before do_compile<br>
+<br>
+SRC_URI_append =3D &quot; file://0001-Allow-overriding-<wbr>host-compiler-=
name-from-<wbr>environment.patch&quot;<br></blockquote><div><br></div><div>=
We don&#39;t carry patches to linux-yocto like this, they are sent to the l=
inux-yocto mailing list, and<br></div><div>integrated into the tree itself.=
<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
+export HOSTCC =3D &quot;${BUILD_CC}&quot;<br>
+export HOSTCXX =3D &quot;${BUILD_CXX}&quot;<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto/0001-Allow-<wbr>ove=
rriding-host-compiler-name-<wbr>from-environment.patch b/meta/recipes-kerne=
l/linux/<wbr>linux-</blockquote><div></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">y=
octo/0001-Allow-<wbr>overriding-host-compiler-name-<wbr>from-environment.pa=
tch<br>
new file mode 100644<br>
index 0000000..6fcfbc8<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto/0001-Allow-<wbr>overriding=
-host-compiler-name-<wbr>from-environment.patch<br>
@@ -0,0 +1,32 @@<br>
+From 0ce4c4f29b5d456a7707e870c7affe<wbr>524f7c8807 Mon Sep 17 00:00:00 200=
1<br>
+From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9my=3D<wbr>20Rosen?=3D &lt;<a href=
=3D"mailto:jeremy.rosen@smile.fr">jeremy.rosen@smile.fr</a>&gt;<br>
+Date: Tue, 16 Aug 2016 22:39:29 +0200<br>
+Subject: [PATCH] Allow overriding host-compiler name from environment<br>
+ variables<br>
+<br>
+---<br>
+ Makefile | 8 ++++----<br>
+ 1 file changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 70dea02..1f0d2d2 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -295,10 +295,10 @@ CONFIG_SHELL :=3D $(shell if [ -x &quot;$$BASH&quot;=
 ]; then echo $$BASH; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if [ -x /bin/bash ]; then echo /bin=
/bash; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else echo sh; fi ; fi)<br>
+<br>
+-HOSTCC=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D gcc<br>
+-HOSTCXX=C2=A0 =C2=A0 =C2=A0 =3D g++<br>
+-HOSTCFLAGS=C2=A0 =C2=A0=3D -Wall -Wmissing-prototypes -Wstrict-prototypes=
 -O2 -fomit-frame-pointer -std=3Dgnu89<br>
+-HOSTCXXFLAGS =3D -O2<br>
++HOSTCC=C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D gcc<br>
++HOSTCXX=C2=A0 =C2=A0 =C2=A0 ?=3D g++<br>
++HOSTCFLAGS=C2=A0 =C2=A0?=3D -Wall -Wmissing-prototypes -Wstrict-prototype=
s -O2 -fomit-frame-pointer -std=3Dgnu89<br>
++HOSTCXXFLAGS ?=3D -O2<br>
+<br>
+ ifeq ($(shell $(HOSTCC) -v 2&gt;&amp;1 | grep -c &quot;clang version&quot=
;), 1)<br>
+ HOSTCFLAGS=C2=A0 +=3D -Wno-unused-value -Wno-unused-parameter \<br>
+--<br>
+2.8.1<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
git-series 0.8.9<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div></div>

--94eb2c043be268e1a9053abd414f--
