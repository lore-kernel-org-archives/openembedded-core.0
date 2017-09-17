Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 966FB7806D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 09:18:54 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u48so3464833wrf.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 02:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ierTdYSTskEjDoWGXzeou8B1duzK6gWBwoMtx+SuOHE=;
	b=KFOlGZ5j9jiwMQIkNfMNnbKIdLf5c2rIv+EqnOU+bgP8w54aZ/JWQkObQ//rWzcbYS
	N9rEYH6aSBDFtusDuJA9S+nOplxmT4FoEZM4S2whcpj1mf6bP169yZbbkXlQyFX0xkZb
	NJcnlZEN2Vgdg5BJMejYWR75haUGr6FY+vJ8vk0Wf70i1WSF7M6RhFXBNzTxlVpZnn1/
	PQJ2/d21OfRf5rl1pwQNNiIgYn3m0ZDgutSx4Ctfq6SUqNqR8kzrwUyWmXAkXFq+DYdL
	htSjBB44G83uQFcSIGq2dUnCX33LYBRo//2XnQNTYAQ7lAfWPIf62qUsmGHM339yWc5A
	CqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ierTdYSTskEjDoWGXzeou8B1duzK6gWBwoMtx+SuOHE=;
	b=DJEcfDFD49tkjxbr37C/J1UwwSadt6/aIp7r6Ix4UjeFq3gj40ccD9jWRkg4x1LhXL
	Bstpcr42UtvKSeNEz8I927QcD+t+fdYPnNE5QE0O8R1ijCG3cHLgaMDLkTrTFiEN60Ap
	aSCiPlYT64FRA9vfIXrsFy5Buqqi8MWYO0jAbclSWNC3k1yHfR1K+aY3B1jy8gYdjpk+
	CrCGQ7s2E3GL3oChh7iU0Oxdz+uCtrPXJUE89OQ7KsfqWXJlk0EnPSK6iCU6h/w5hdkT
	htcWKCr8yKWnIBINgOivbWZzGm7on8blyua+6An+P4B/vfBrKGrKQvJHz9qh1eco8pjd
	P4Hw==
X-Gm-Message-State: AHPjjUjP8l6aiLl52SD8f7KWCls9zgdOzqJNmLHkfS32/NzSp2PzVU3b
	Pr6HGtIzvjuYYxpm5+8T3QQMGs7hpy1pXORAolQ=
X-Google-Smtp-Source: ADKCNb5TdAHKzYe2XsAOntJ2Xv0mL4qYvFan76Uga17blD8dJZRz8u1J55obKJNLRMH/7gMpuuDjerieQ5nLNBdgfbA=
X-Received: by 10.223.161.22 with SMTP id o22mr23297577wro.99.1505639935227;
	Sun, 17 Sep 2017 02:18:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Sun, 17 Sep 2017 02:18:54 -0700 (PDT)
In-Reply-To: <20170911203056.22156-1-otavio@ossystems.com.br>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 17 Sep 2017 11:18:54 +0200
Message-ID: <CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Sun, 17 Sep 2017 09:18:54 -0000
Content-Type: multipart/alternative; boundary="f403045e20767fbe8905595f1df4"

--f403045e20767fbe8905595f1df4
Content-Type: text/plain; charset="UTF-8"

Is anyone seeing u-boot-fw-utils.do_install failure with this?

u-boot-fw-utils/1_2017.09-r0/git/tools/env/fw_printenv: No such file or
directory

I've tried u-boot-fw-utils-cross, but it fails as well even sooner in
do_compile:

Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 32 ARCH=arm CC=gcc
-isystemwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/include
-O2 -pipe
-Lwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/lib
-Lwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib
-Wl,-rpath-link,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/lib
-Wl,-rpath-link,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib
-Wl,-rpath,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/usr/lib
-Wl,-rpath,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib
-Wl,-O1 V=1 rpi_3_32b_config
| make -f ./scripts/Makefile.build obj=scripts/basic
|   cc -Wp,-MD,scripts/basic/.fixdep.d -Wall -Wstrict-prototypes -O2
-fomit-frame-pointer      -o scripts/basic/fixdep scripts/basic/fixdep.c
| /bin/sh: 1: cc: not found
| make[1]: *** [scripts/basic/fixdep] Error 127
| make: *** [scripts_basic] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/temp/log.do_compile.12859)
ERROR: Task
(virtual:cross:oe-core/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb:do_compile)
failed with exit code '1'


On Mon, Sep 11, 2017 at 10:30 PM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> This upgrades the U-Boot to the 2017.09 release.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  .../u-boot/{u-boot-common_2017.07.inc => u-boot-common_2017.09.inc}
>  | 2 +-
>  .../u-boot/{u-boot-fw-utils_2017.07.bb => u-boot-fw-utils_2017.09.bb}
>  | 0
>  .../u-boot/{u-boot-mkimage_2017.07.bb => u-boot-mkimage_2017.09.bb}
>  | 0
>  meta/recipes-bsp/u-boot/{u-boot_2017.07.bb => u-boot_2017.09.bb}
> | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.07.inc =>
> u-boot-common_2017.09.inc} (89%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.07.bb =>
> u-boot-fw-utils_2017.09.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.07.bb =>
> u-boot-mkimage_2017.09.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2017.07.bb => u-boot_2017.09.bb}
> (100%)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> b/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> similarity index 89%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> index e37f5fd409..02e51242cb 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.09.inc
> @@ -7,7 +7,7 @@ PE = "1"
>
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "d85ca029f257b53a96da6c2fb421e78a003a9943"
> +SRCREV = "c98ac3487e413c71e5d36322ef3324b21c6f60f9"
>
>  SRC_URI = "git://git.denx.de/u-boot.git \
>      file://MPC8315ERDB-enable-DHCP.patch \
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
> b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
> b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2017.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2017.09.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2017.07.bb
> b/meta/recipes-bsp/u-boot/u-boot_2017.09.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2017.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2017.09.bb
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045e20767fbe8905595f1df4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is anyone seeing u-boot-fw-utils.do_install failure with t=
his?<div><br><div><div>u-boot-fw-utils/1_2017.09-r0/git/tools/env/fw_printe=
nv: No such file or directory</div></div><div><br></div></div><div>I&#39;ve=
 tried u-boot-fw-utils-cross, but it fails as well even sooner in do_compil=
e:</div><div><br></div><div><div>Log data follows:</div><div>| DEBUG: Execu=
ting shell function do_compile</div><div>| NOTE: make -j 32 ARCH=3Darm CC=
=3Dgcc=C2=A0 -isystemwork/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/r=
ecipe-sysroot-native/usr/include -O2 -pipe -Lwork/x86_64-linux/u-boot-fw-ut=
ils-cross/1_2017.09-r0/recipe-sysroot-native/usr/lib -Lwork/x86_64-linux/u-=
boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib -Wl,-rpath-link,=
work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/=
usr/lib -Wl,-rpath-link,work/x86_64-linux/u-boot-fw-utils-cross/1_2017.09-r=
0/recipe-sysroot-native/lib -Wl,-rpath,work/x86_64-linux/u-boot-fw-utils-cr=
oss/1_2017.09-r0/recipe-sysroot-native/usr/lib -Wl,-rpath,work/x86_64-linux=
/u-boot-fw-utils-cross/1_2017.09-r0/recipe-sysroot-native/lib -Wl,-O1 V=3D1=
 rpi_3_32b_config</div><div>| make -f ./scripts/Makefile.build obj=3Dscript=
s/basic</div><div>|=C2=A0 =C2=A0cc -Wp,-MD,scripts/basic/.fixdep.d -Wall -W=
strict-prototypes -O2 -fomit-frame-pointer=C2=A0 =C2=A0 =C2=A0 -o scripts/b=
asic/fixdep scripts/basic/fixdep.c</div><div>| /bin/sh: 1: cc: not found</d=
iv><div>| make[1]: *** [scripts/basic/fixdep] Error 127</div><div>| make: *=
** [scripts_basic] Error 2</div><div>| ERROR: oe_runmake failed</div><div>|=
 WARNING: exit code 1 from a shell command.</div><div>| ERROR: Function fai=
led: do_compile (log file is located at work/x86_64-linux/u-boot-fw-utils-c=
ross/1_2017.09-r0/temp/log.do_compile.12859)</div><div>ERROR: Task (virtual=
:cross:oe-core/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.09.bb:do_compil=
e) failed with exit code &#39;1&#39;</div></div><div><br></div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Sep 11, 2017 at=
 10:30 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio@o=
ssystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">This upgrades the U-Boot to the 201=
7.09 release.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
=C2=A0.../u-boot/{u-boot-common_<wbr>2017.07.inc =3D&gt; u-boot-common_2017=
.09.inc}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../u-boot/{<a href=3D"http://u-boot-fw-utils_2017.07.bb" rel=3D"nore=
ferrer" target=3D"_blank">u-boot-fw-utils_<wbr>2017.07.bb</a> =3D&gt; <a hr=
ef=3D"http://u-boot-fw-utils_2017.09.bb" rel=3D"noreferrer" target=3D"_blan=
k">u-boot-fw-utils_2017.09.bb</a>}=C2=A0 =C2=A0| 0<br>
=C2=A0.../u-boot/{<a href=3D"http://u-boot-mkimage_2017.07.bb" rel=3D"noref=
errer" target=3D"_blank">u-boot-mkimage_<wbr>2017.07.bb</a> =3D&gt; <a href=
=3D"http://u-boot-mkimage_2017.09.bb" rel=3D"noreferrer" target=3D"_blank">=
u-boot-mkimage_2017.09.bb</a>}=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot_2017.07.bb" rel=3D"=
noreferrer" target=3D"_blank">u-<wbr>boot_2017.07.bb</a> =3D&gt; <a href=3D=
"http://u-boot_2017.09.bb" rel=3D"noreferrer" target=3D"_blank">u-boot_2017=
.09.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 0<br>
=C2=A04 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{u-<wbr>boot-common_2017.07.inc =3D&gt=
; u-boot-common_2017.09.inc} (89%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-fw-utils_201=
7.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017.07.=
bb</a> =3D&gt; <a href=3D"http://u-boot-fw-utils_2017.09.bb" rel=3D"norefer=
rer" target=3D"_blank">u-boot-fw-utils_2017.09.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot-mkimage_2017=
.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2017.07.bb=
</a> =3D&gt; <a href=3D"http://u-boot-mkimage_2017.09.bb" rel=3D"noreferrer=
" target=3D"_blank">u-boot-mkimage_2017.09.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-bsp/u-boot/{<a href=3D"http://u-boot_2017.07.bb" =
rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.07.bb</a> =3D&gt; <a =
href=3D"http://u-boot_2017.09.bb" rel=3D"noreferrer" target=3D"_blank">u-bo=
ot_2017.09.bb</a>} (100%)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.07.inc b/meta/=
recipes-bsp/u-boot/u-<wbr>boot-common_2017.09.inc<br>
similarity index 89%<br>
rename from meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.07.inc<br>
rename to meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.09.inc<br>
index e37f5fd409..02e51242cb 100644<br>
--- a/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.07.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-<wbr>boot-common_2017.09.inc<br>
@@ -7,7 +7,7 @@ PE =3D &quot;1&quot;<br>
<br>
=C2=A0# We use the revision in order to avoid having to fetch it from the<b=
r>
=C2=A0# repo during parse<br>
-SRCREV =3D &quot;<wbr>d85ca029f257b53a96da6c2fb421e7<wbr>8a003a9943&quot;<=
br>
+SRCREV =3D &quot;<wbr>c98ac3487e413c71e5d36322ef3324<wbr>b21c6f60f9&quot;<=
br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git" rel=
=3D"noreferrer" target=3D"_blank">git.denx.de/u-boot.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://MPC8315ERDB-enable-<wbr>DHCP.patch \<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017=
.07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017.07.b=
b</a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017.09.b=
b" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017.09.bb</a>=
<br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017.=
07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017.07.bb=
</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2017.09=
.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-fw-utils_2017.09.bb</=
a><br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2017.=
07.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2017.07.bb<=
/a> b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2017.09.bb" =
rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2017.09.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2017.0=
7.bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2017.07.bb</=
a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2017.09.=
bb" rel=3D"noreferrer" target=3D"_blank">u-<wbr>boot-mkimage_2017.09.bb</a>=
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.07.bb" r=
el=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.07.bb</a> b/meta/recip=
es-bsp/u-boot/<a href=3D"http://u-boot_2017.09.bb" rel=3D"noreferrer" targe=
t=3D"_blank">u-<wbr>boot_2017.09.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.07.bb" re=
l=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.07.bb</a><br>
rename to meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2017.09.bb" rel=
=3D"noreferrer" target=3D"_blank">u-<wbr>boot_2017.09.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--f403045e20767fbe8905595f1df4--
