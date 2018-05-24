Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9944B74B06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 16:07:47 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id a15-v6so4135000wrm.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 09:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=XZQVBIO/iqTxoGnehp2GegRlSaKcdZE6xvOP/eOkEA8=;
	b=Mi9RBGGkgSDmAfg0Y1QyNucUpmbrXhfNot3zHIFOz6DN9BdzW3Vcxy9f6R+nscIG3C
	QEb/Er+XegrW5CHXn3FHl3GJjeLNvipz5KdkVTrnlG5RgM3qH6k+NLfUbWlozaTOu3nD
	ZdOL2JK3Ku/pKRpRD0OJY7/c6Arp6+AacelbiC0E7CUa+adBDA8WS8IMQt5zzYwShHT4
	7YuSvaO3jxjmao4D5omQ3OIDtJI5M7mWm2BtnSFhOvbDYTHbFbmF/qQmfWb7jFFxy92O
	4Gc/VgB2SIgl7PtS5gksAHT8QN2DstPdlE2JRvNwNoy4NKM/DOTmG30Jrq3r7qcA/7KV
	dP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=XZQVBIO/iqTxoGnehp2GegRlSaKcdZE6xvOP/eOkEA8=;
	b=BYaNqatDpJm7xB6sA+VFYjzZgUTwRQIMbJzsWubzBjzE2+q59bDWxw8GvDWtQQv6JH
	FXoztF538DRFVlOCRcLjH4QBAnKWKZwYHZymRL8ZzcyAdCb363yXGIbnc3yQj1FkcOw8
	EOMhrXUN7oVJyF7Osi71J8nF/HXT3kLa4BIRya5i4b668Y+YIaemW8RD6jNT5nbjsuB8
	f0qsfJI9pSThuQl2HDm68AwYWCnAU0v3MDqG1vH4XKjgd6tj8uqBduiIf5R+WlM2SEIq
	Nh0nx3aZSIhpJqAn4z/H9zsigHAlSjX8kk/0F3HlTRM5QULgOZGXLqDhQtPKzFVYS0mW
	6VrQ==
X-Gm-Message-State: ALKqPwcx/IVgsPZ9J7Vd1V7dyffwCL6wVa1lv773fLuhqcRvmJq1GZ47
	K9D/ZlncnDN6IxWLgdeTMHjRPBziILAjBRvJh8k=
X-Google-Smtp-Source: AB8JxZpMEBXF0eJV/9QIDK12JC/ZF5/GgEumkCtJAHwjRc+4DIitz2F5cDLBbmXIdKBGiBU66jLNwNx6/Sro58DD5B4=
X-Received: by 2002:adf:93e5:: with SMTP id
	92-v6mr6859756wrp.230.1527178067763; 
	Thu, 24 May 2018 09:07:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180524145601.26722-1-Martin.Jansa@gmail.com>
In-Reply-To: <20180524145601.26722-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 24 May 2018 18:07:36 +0200
Message-ID: <CA+chaQfAAvHsxxzNHydUFccmvtVT3Jaq8yHvJEisaMvkdydZ0w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: fix build with kernel older than 4.8
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
X-List-Received-Date: Thu, 24 May 2018 16:07:47 -0000
Content-Type: multipart/alternative; boundary="0000000000003ce4ba056cf5da3a"

--0000000000003ce4ba056cf5da3a
Content-Type: text/plain; charset="UTF-8"

Even older kernels than 4.4 might need even more files to be copied first,
with 3.16 kernel I'm seeing:

  FLAGS:   * new build flags or prefix
Makefile:358: scripts/Kbuild.include: No such file or directory
Makefile:614: arch/arm/Makefile: No such file or directory
/bin/bash: ./scripts/gcc-goto.sh: No such file or directory
Makefile:755: scripts/Makefile.kasan: No such file or directory
Makefile:756: scripts/Makefile.extrawarn: No such file or directory
make[2]: *** No rule to make target `scripts/Makefile.extrawarn'.  Stop.
  PERF_VERSION =

Adding scripts, arch, lib to PERF_SRC fixes the build with 3.16, but not
sure if you want to support such old kernel in oe-core.

Adding PERF_SRC_append = "scripts arch lib" in perf.bbappend works as well.

On Thu, May 24, 2018 at 4:55 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> * perf is failing to build for me since this oe-core commit:
>   commit 9b38c824961fc9dce51bda95c25dac91a69fc64f
>   Author: Hongxu Jia <hongxu.jia@windriver.com>
>   Date:   Tue Apr 24 11:33:47 2018 +0800
>
>     perf: make a copy of kernel source to perf workdir
>
>   the problem is that perf sources in kernel older than 4.8 (in my case
>   4.4) are depending on the "global" include headers outside tools
>   directory, e.g. swab.h in:
>   kernel-source/tools$ git grep swab.h
>   perf/MANIFEST:include/linux/swab.h
>   perf/MANIFEST:include/uapi/linux/swab.h
>   perf/util/include/asm/byteorder.h:#include
> "../../../../include/uapi/linux/swab.h"
>
>   this was resolved in 4.8 with:
>   commit 7e3f36411342a54f1981fa97b43550b8406a3d69
>   Author: Arnaldo Carvalho de Melo <acme@redhat.com>
>   Date:   Mon Jul 18 17:42:16 2016 -0300
>
>     perf tools: Remove tools/perf/util/include/asm/byteorder.h
>
>     Not used anymore. This also stops include linux/swab.h directly
>     from the kernel sources, remove that reference from the MANIFEST.
>
>   and few more changes to make tools/include more complete and standalone:
>   tools/include in 4.15:
>   asm  asm-generic  linux  tools  trace  uapi
>
>   tools/include in 4.4:
>   asm  asm-generic  linux  tools
>
>   but copying the include header even for kernels which don't really
>   need it doesn't add big overhead, so just copy include to perf sources
>   for all kernels.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index fb4e3ac668..51f5597eb9 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -98,6 +98,7 @@ EXTRA_OEMAKE += "\
>  "
>
>  PERF_SRC ?= "Makefile \
> +             include \
>               tools/arch \
>               tools/build \
>               tools/include \
> --
> 2.17.0
>
>

--0000000000003ce4ba056cf5da3a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Even older kernels than 4.4 might need even more files to =
be copied first, with 3.16 kernel I&#39;m seeing:<div><br></div><div><div>=
=C2=A0 FLAGS:=C2=A0 =C2=A0* new build flags or prefix</div><div>Makefile:35=
8: scripts/Kbuild.include: No such file or directory</div><div>Makefile:614=
: arch/arm/Makefile: No such file or directory</div><div>/bin/bash: ./scrip=
ts/gcc-goto.sh: No such file or directory</div><div>Makefile:755: scripts/M=
akefile.kasan: No such file or directory</div><div>Makefile:756: scripts/Ma=
kefile.extrawarn: No such file or directory</div><div>make[2]: *** No rule =
to make target `scripts/Makefile.extrawarn&#39;.=C2=A0 Stop.</div><div>=C2=
=A0 PERF_VERSION =3D=C2=A0</div></div><div><br></div><div>Adding scripts, a=
rch, lib to=C2=A0<span style=3D"color:rgb(34,34,34);font-family:sans-serif;=
font-size:13px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial;float:none;display:inline">PERF_SRC fixes the build with 3.16, but=
 not sure if you want to support such old kernel in oe-core.</span></div><d=
iv><span style=3D"color:rgb(34,34,34);font-family:sans-serif;font-size:13px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline"><br></span></div><div>Adding=C2=A0<span style=3D"colo=
r:rgb(34,34,34);font-family:sans-serif;font-size:13px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial;float:none;display:inline">=
PERF_SRC_append =3D &quot;scripts arch lib&quot; in perf.bbappend works as =
well.</span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On =
Thu, May 24, 2018 at 4:55 PM Martin Jansa &lt;<a href=3D"mailto:martin.jans=
a@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">* perf is failing to build for me since t=
his oe-core commit:<br>
=C2=A0 commit 9b38c824961fc9dce51bda95c25dac91a69fc64f<br>
=C2=A0 Author: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0 Date:=C2=A0 =C2=A0Tue Apr 24 11:33:47 2018 +0800<br>
<br>
=C2=A0 =C2=A0 perf: make a copy of kernel source to perf workdir<br>
<br>
=C2=A0 the problem is that perf sources in kernel older than 4.8 (in my cas=
e<br>
=C2=A0 4.4) are depending on the &quot;global&quot; include headers outside=
 tools<br>
=C2=A0 directory, e.g. swab.h in:<br>
=C2=A0 kernel-source/tools$ git grep swab.h<br>
=C2=A0 perf/MANIFEST:include/linux/swab.h<br>
=C2=A0 perf/MANIFEST:include/uapi/linux/swab.h<br>
=C2=A0 perf/util/include/asm/byteorder.h:#include &quot;../../../../include=
/uapi/linux/swab.h&quot;<br>
<br>
=C2=A0 this was resolved in 4.8 with:<br>
=C2=A0 commit 7e3f36411342a54f1981fa97b43550b8406a3d69<br>
=C2=A0 Author: Arnaldo Carvalho de Melo &lt;<a href=3D"mailto:acme@redhat.c=
om" target=3D"_blank">acme@redhat.com</a>&gt;<br>
=C2=A0 Date:=C2=A0 =C2=A0Mon Jul 18 17:42:16 2016 -0300<br>
<br>
=C2=A0 =C2=A0 perf tools: Remove tools/perf/util/include/asm/byteorder.h<br=
>
<br>
=C2=A0 =C2=A0 Not used anymore. This also stops include linux/swab.h direct=
ly<br>
=C2=A0 =C2=A0 from the kernel sources, remove that reference from the MANIF=
EST.<br>
<br>
=C2=A0 and few more changes to make tools/include more complete and standal=
one:<br>
=C2=A0 tools/include in 4.15:<br>
=C2=A0 asm=C2=A0 asm-generic=C2=A0 linux=C2=A0 tools=C2=A0 trace=C2=A0 uapi=
<br>
<br>
=C2=A0 tools/include in 4.4:<br>
=C2=A0 asm=C2=A0 asm-generic=C2=A0 linux=C2=A0 tools<br>
<br>
=C2=A0 but copying the include header even for kernels which don&#39;t real=
ly<br>
=C2=A0 need it doesn&#39;t add big overhead, so just copy include to perf s=
ources<br>
=C2=A0 for all kernels.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index fb4e3ac668..51f5597eb9 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -98,6 +98,7 @@ EXTRA_OEMAKE +=3D &quot;\<br>
=C2=A0&quot;<br>
<br>
=C2=A0PERF_SRC ?=3D &quot;Makefile \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tools/arch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tools/build \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tools/include \<br>
-- <br>
2.17.0<br>
<br>
</blockquote></div>

--0000000000003ce4ba056cf5da3a--
