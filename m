Return-Path: <sujith.h@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 26F036069C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 06:10:41 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id e5so5488674qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 23:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BH4w6ucBmtMDp9d4aY4LLaf0FmSfwIh1pOKKOQXXou0=;
	b=y+fw9j7VD9lepMvFKsX0DXcPQwL2eVTR4ZWYHUcaL5jolSo2oT4hAgYKh7JhquAMHX
	ftUx+jEL9SHQow6EtM0KIG+w5tHbpEI/C/5A4li/nyqJOtpdQMqKNdL81AkpDC2xMxuf
	Qqames+Jat5nXq6lkLU68xeco/ZkAnvjskFtOsbvZquAu+S43RRvwOOJGYzE43qJ3zZv
	T0cerHbzHeJcW/teTB6vV5547vH9GalYfSZGpyik4VxlnHE/9sx+0nMvukMrsTbaN3Yv
	i6aWOYmVpDwCey/M9Ql3GZnRHiAhAAI+hR1J/knqR0RhRh9e59etSLVTnL2y1knbRdTu
	+7iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BH4w6ucBmtMDp9d4aY4LLaf0FmSfwIh1pOKKOQXXou0=;
	b=VMbAWrT+E+lM8f/d3F3HtdwfubuTQM/uCuPt0KPVIUFP5v1+ur3aKTri5DUYok+ihg
	ZVZYBBtuIhCEz2Fc6jS2r3ZySk5cCCWT9ka3ZxUtKnqe6+XbU1KeAGloLXj3+Vqm8ij0
	7SHnm1n4D8nuQKFZrJb+v4lw2kZLZ0U0TFvB1ziHK5YewwH8GOWqF0bdJxVFx+Cdeza+
	NftqCYgxwMCimr28UBzA4Z7pHccW0GNs9yBxgNIw7CXUpHdqls6dqzVgTbkAfN59hu1v
	i4coQZqW9WO0Sx0wQp/uivKCiHVnr3ShVxJQiOHNwkGwd4pFposNB5lWXHMeNpPwePR5
	E+og==
X-Gm-Message-State: AA6/9RliyYhu1JdmXUWipuugVrOZrsGJFPomEbh1jL/lQ6GV/bUqicI3PJu2SwzkXU1PuBFRm/fw1Bu9NeQKWQ==
X-Received: by 10.237.59.174 with SMTP id r43mr20972002qte.77.1474870243074;
	Sun, 25 Sep 2016 23:10:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Sun, 25 Sep 2016 23:10:22 -0700 (PDT)
In-Reply-To: <1474435062-3183-1-git-send-email-sujith.h@gmail.com>
References: <1474435062-3183-1-git-send-email-sujith.h@gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Mon, 26 Sep 2016 11:40:22 +0530
Message-ID: <CADyYWLnN_sDqZEg23oe1rD1ZO3GeXE76UmhJNMgzB5d1tooS7Q@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] perf: Fix to obey LD failure on qemux86-64
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
X-List-Received-Date: Mon, 26 Sep 2016 06:10:44 -0000
Content-Type: multipart/alternative; boundary=94eb2c0e61aceda9ca053d62fc1e

--94eb2c0e61aceda9ca053d62fc1e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Let me know if we need to make any changes to this patch. If so I would be
happy to do that.

Thanks,
Sujith H

On Wed, Sep 21, 2016 at 10:47 AM, Sujith H <sujith.h@gmail.com> wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> When built on an i686 host for qemux86-64 without the
> fix to obey LD and it fails:
>
> /scratch/dogwood/toolchains/x86_64/bin/i686-pc-linux-gnu-ld:
> Relocatable linking with relocations from format elf64-x86-64
> (/scratch/dogwood/perf-ld-test/build/tmp/work/qemux86_
> 64-mel-linux/perf/1.0-r9/perf-1.0/fs/fs.o)
> to format elf32-i386 (/scratch/dogwood/perf-ld-
> test/build/tmp/work/qemux86_64-mel-linux/perf/1.0-r9/perf-
> 1.0/fs/libapi-in.o)
> is not supported
>
> This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,
> which is -m elf32_x86_64 for x86_64. Without that, direct use of ld will
> fail.
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index 88e3a0a..0d104d3 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -79,6 +79,7 @@ EXTRA_OEMAKE =3D '\
>      ARCH=3D${ARCH} \
>      CC=3D"${CC}" \
>      AR=3D"${AR}" \
> +    LD=3D"${LD}" \
>      EXTRA_CFLAGS=3D"-ldw" \
>      perfexecdir=3D${libexecdir} \
>      NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIND_DEFINES} \
> @@ -98,7 +99,6 @@ EXTRA_OEMAKE +=3D "\
>      'infodir=3D${@os.path.relpath(infodir, prefix)}' \
>  "
>
> -
>  do_compile() {
>         # Linux kernel build system is expected to do the right thing
>         unset CFLAGS
> @@ -174,6 +174,7 @@ do_configure_prepend () {
>      if [ -e "${S}/tools/lib/api/Makefile" ]; then
>          sed -i 's,CC =3D $(CROSS_COMPILE)gcc,#CC,'
> ${S}/tools/lib/api/Makefile
>          sed -i 's,AR =3D $(CROSS_COMPILE)ar,#AR,'
> ${S}/tools/lib/api/Makefile
> +        sed -i 's,LD =3D $(CROSS_COMPILE)ld,#LD,'
> ${S}/tools/lib/api/Makefile
>      fi
>      if [ -e "${S}/tools/lib/subcmd/Makefile" ]; then
>          sed -i 's,CC =3D $(CROSS_COMPILE)gcc,#CC,'
> ${S}/tools/lib/subcmd/Makefile
> --
> 1.9.1
>
>


--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--94eb2c0e61aceda9ca053d62fc1e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>Let me know if we need to =
make any changes to this patch. If so I would be happy to do that.<br><br><=
/div>Thanks,<br></div>Sujith H<br></div><div class=3D"gmail_extra"><br><div=
 class=3D"gmail_quote">On Wed, Sep 21, 2016 at 10:47 AM, Sujith H <span dir=
=3D"ltr">&lt;<a href=3D"mailto:sujith.h@gmail.com" target=3D"_blank">sujith=
.h@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: =
Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com">chris_lar=
son@mentor.com</a>&gt;<br>
<br>
When built on an i686 host for qemux86-64 without the<br>
fix to obey LD and it fails:<br>
<br>
/scratch/dogwood/toolchains/<wbr>x86_64/bin/i686-pc-linux-gnu-<wbr>ld:<br>
Relocatable linking with relocations from format elf64-x86-64<br>
(/scratch/dogwood/perf-ld-<wbr>test/build/tmp/work/qemux86_<wbr>64-mel-linu=
x/perf/1.0-r9/perf-<wbr>1.0/fs/fs.o)<br>
to format elf32-i386 (/scratch/dogwood/perf-ld-<wbr>test/build/tmp/work/qem=
ux86_<wbr>64-mel-linux/perf/1.0-r9/perf-<wbr>1.0/fs/libapi-in.o)<br>
is not supported<br>
<br>
This is because LD includes HOST_LD_ARCH, which contains TUNE_LDARGS,<br>
which is -m elf32_x86_64 for x86_64. Without that, direct use of ld will fa=
il.<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br>
Signed-off-by: Sujith Haridasan &lt;<a href=3D"mailto:Sujith_Haridasan@ment=
or.com">Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.<wbr>bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">per<wbr>f.bb</a> b/meta/recipes-kernel/perf/<a h=
ref=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">per<wbr>f.bb</a=
><br>
index 88e3a0a..0d104d3 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">per<wbr>f.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">per<wbr>f.bb</a><br>
@@ -79,6 +79,7 @@ EXTRA_OEMAKE =3D &#39;\<br>
=C2=A0 =C2=A0 =C2=A0ARCH=3D${ARCH} \<br>
=C2=A0 =C2=A0 =C2=A0CC=3D&quot;${CC}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0AR=3D&quot;${AR}&quot; \<br>
+=C2=A0 =C2=A0 LD=3D&quot;${LD}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0EXTRA_CFLAGS=3D&quot;-ldw&quot; \<br>
=C2=A0 =C2=A0 =C2=A0perfexecdir=3D${libexecdir} \<br>
=C2=A0 =C2=A0 =C2=A0NO_GTK2=3D1 ${TUI_DEFINES} NO_DWARF=3D1 ${LIBUNWIND_DEF=
INES} \<br>
@@ -98,7 +99,6 @@ EXTRA_OEMAKE +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0&#39;infodir=3D${@os.path.relpath(<wbr>infodir, prefix)=
}&#39; \<br>
=C2=A0&quot;<br>
<br>
-<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Linux kernel build system is expected to do t=
he right thing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS<br>
@@ -174,6 +174,7 @@ do_configure_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0if [ -e &quot;${S}/tools/lib/api/Makefile&quot; ]; then=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,CC =3D $(CROSS_COMPILE)gcc,=
#CC,&#39; ${S}/tools/lib/api/Makefile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,AR =3D $(CROSS_COMPILE)ar,#=
AR,&#39; ${S}/tools/lib/api/Makefile<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;s,LD =3D $(CROSS_COMPILE)ld,#LD,&#=
39; ${S}/tools/lib/api/Makefile<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0if [ -e &quot;${S}/tools/lib/subcmd/<wbr>Makefile&quot;=
 ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s,CC =3D $(CROSS_COMPILE)gcc,=
#CC,&#39; ${S}/tools/lib/subcmd/Makefile<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><=
div><div dir=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=
=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=
=B5=8D<br>Bangalore<br>&lt;Project&gt;Contributor to KDE project<br></div><=
div>&lt;Project&gt;Contributor to Yocto project<br></div><div><a href=3D"ht=
tp://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wik=
ia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh=
.info" target=3D"_blank">http://sujithh.info</a><br></div><div>C-x C-c<br><=
/div></div></div></div></div>
</div>

--94eb2c0e61aceda9ca053d62fc1e--
