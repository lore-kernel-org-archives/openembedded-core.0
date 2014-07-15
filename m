Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id D2E0A6AC6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 20:00:43 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id c1so45317igq.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5U0g9SxVw7Xx8WYK4SRlBAV1EanYLedwB3T0GnyEhnU=;
	b=VgyAb/SKM0JZP0fYzeSZh6YVzCF1IdmsqiUiVrQHwji0BS0HJBDm/ZWNNpeuf1+110
	1pDZWEIB/Syri0DkO78ccFGBU2o91Ce7Ad8tct809qTMR+Im9U3Y3l34WTZBa6oKoWtL
	G5miuRoqfld2udY0iGbdxVmxGdcZTGmCjN/+DtH7ApiVpWmIkMcmrRicGeMYOD+4kGIn
	SxqYPVZ5aFDCio31yXFKAoyz5fCtsq+z71HYUjKZIMhoMukArFGEJXzDIafBBbzNOUrs
	W6qfGkt0ol3RvWelBrNmYbdvzrphhYgMcUDeum0xkrve0uUOaZvpaCLpiYJ8KFkjX9XY
	zXKA==
MIME-Version: 1.0
X-Received: by 10.42.90.74 with SMTP id j10mr32534617icm.29.1405454444197;
	Tue, 15 Jul 2014 13:00:44 -0700 (PDT)
Received: by 10.50.78.105 with HTTP; Tue, 15 Jul 2014 13:00:44 -0700 (PDT)
Received: by 10.50.78.105 with HTTP; Tue, 15 Jul 2014 13:00:44 -0700 (PDT)
In-Reply-To: <1405449014-17065-1-git-send-email-Martin.Jansa@gmail.com>
References: <1405449014-17065-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 15 Jul 2014 13:00:44 -0700
Message-ID: <CAMKF1spDMkZOpj59jYsXEB7d4QjLW+2TaGRA_wMdpCGXvWePyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb: force arm mode
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
X-List-Received-Date: Tue, 15 Jul 2014 20:00:46 -0000
Content-Type: multipart/alternative; boundary=90e6ba53b27ce5018104fe40dc24

--90e6ba53b27ce5018104fe40dc24
Content-Type: text/plain; charset=UTF-8

On Jul 15, 2014 11:30 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>
> * triggers some issue in gcc-4.9, this call:
> arm-oe-linux-gnueabi-gcc  -march=armv5te -mthumb -mthumb-interwork
-mtune=xscale
> --sysroot=/OE/build/shr-core/tmp-eglibc/sysroots/spitz -O2 -pipe -g
> -feliminate-unused-debug-types   -I.
>
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb
>
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/common
>
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/config
> -DLOCALEDIR="\"/usr/share/locale\"" -DHAVE_CONFIG_H
>
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/../include/opcode
>
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/../opcodes/..
> -I../bfd
>
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/../bfd
>
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/../include
> -I../libdecnumber
>
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/../libdecnumber
>
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/gnulib/import
> -Ibuild-gnulib/import    -Wall -Wdeclaration-after-statement
> -Wpointer-arith -Wpointer-sign -Wno-unused -Wunused-value
> -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes
> -Wdeclaration-after-statement -Wempty-body -Wmissing-parameter-type
> -Wold-style-declaration -Wold-style-definition -Wformat-nonliteral  -c
> -o eval.o -MT eval.o -MMD -MP -MF .deps/eval.Tpo
>
/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r0/gdb-7.7/gdb/eval.c
>
> just hangs (strace shows occasional call to mmap, brk, munmap) and eats
all available memory
> (in my case 20GB), I've waited for 2,5 hours and it didn't finish,
> after removing -mthumb it builds in second.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb_7.7.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/gdb/gdb_7.7.bb
b/meta/recipes-devtools/gdb/gdb_7.7.bb
> index 1abc9d8..bc042ec 100644
> --- a/meta/recipes-devtools/gdb/gdb_7.7.bb
> +++ b/meta/recipes-devtools/gdb/gdb_7.7.bb
> @@ -7,6 +7,9 @@ PACKAGECONFIG ??= ""
>  PACKAGECONFIG[python] =
"--with-python=${WORKDIR}/python,--without-python,python"
>  PACKAGECONFIG[babeltrace] =
"--with-babeltrace,--without-babeltrace,babeltrace"
>
> +# cc1 (4.9) call with -mthumb gets stuck and eats all available memory
(over 20GB in my case)
> +ARM_INSTRUCTION_SET = "arm"

we dont want to turn thumb off unconditionally since thumb2 may be ok.

> +
>  do_configure_prepend() {
>         if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'python',
'python', '', d)}" ]; then
>                 cat > ${WORKDIR}/python << EOF
> --
> 2.0.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--90e6ba53b27ce5018104fe40dc24
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Jul 15, 2014 11:30 AM, &quot;Martin Jansa&quot; &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; * triggers some issue in gcc-4.9, this call:<br>
&gt; arm-oe-linux-gnueabi-gcc =C2=A0-march=3Darmv5te -mthumb -mthumb-interw=
ork -mtune=3Dxscale<br>
&gt; --sysroot=3D/OE/build/shr-core/tmp-eglibc/sysroots/spitz -O2 -pipe -g<=
br>
&gt; -feliminate-unused-debug-types =C2=A0 -I.<br>
&gt; -I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7=
-r0/gdb-7.7/gdb<br>
&gt; -I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7=
-r0/gdb-7.7/gdb/common<br>
&gt; -I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7=
-r0/gdb-7.7/gdb/config<br>
&gt; -DLOCALEDIR=3D&quot;\&quot;/usr/share/locale\&quot;&quot; -DHAVE_CONFI=
G_H<br>
&gt; -I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7=
-r0/gdb-7.7/gdb/../include/opcode<br>
&gt; -I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7=
-r0/gdb-7.7/gdb/../opcodes/..<br>
&gt; -I../bfd<br>
&gt; -I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7=
-r0/gdb-7.7/gdb/../bfd<br>
&gt; -I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7=
-r0/gdb-7.7/gdb/../include<br>
&gt; -I../libdecnumber<br>
&gt; -I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7=
-r0/gdb-7.7/gdb/../libdecnumber<br>
&gt; -I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7=
-r0/gdb-7.7/gdb/gnulib/import<br>
&gt; -Ibuild-gnulib/import =C2=A0 =C2=A0-Wall -Wdeclaration-after-statement=
<br>
&gt; -Wpointer-arith -Wpointer-sign -Wno-unused -Wunused-value<br>
&gt; -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototype=
s<br>
&gt; -Wdeclaration-after-statement -Wempty-body -Wmissing-parameter-type<br=
>
&gt; -Wold-style-declaration -Wold-style-definition -Wformat-nonliteral =C2=
=A0-c<br>
&gt; -o eval.o -MT eval.o -MMD -MP -MF .deps/eval.Tpo<br>
&gt; /OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/gdb/7.7-r=
0/gdb-7.7/gdb/eval.c<br>
&gt;<br>
&gt; just hangs (strace shows occasional call to mmap, brk, munmap) and eat=
s all available memory<br>
&gt; (in my case 20GB), I&#39;ve waited for 2,5 hours and it didn&#39;t fin=
ish,<br>
&gt; after removing -mthumb it builds in second.<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.7.bb">gdb_7.7.=
bb</a> | 3 +++<br>
&gt; =C2=A01 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.7.bb">g=
db_7.7.bb</a> b/meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.7.bb">gdb=
_7.7.bb</a><br>
&gt; index 1abc9d8..bc042ec 100644<br>
&gt; --- a/meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.7.bb">gdb_7.7.=
bb</a><br>
&gt; +++ b/meta/recipes-devtools/gdb/<a href=3D"http://gdb_7.7.bb">gdb_7.7.=
bb</a><br>
&gt; @@ -7,6 +7,9 @@ PACKAGECONFIG ??=3D &quot;&quot;<br>
&gt; =C2=A0PACKAGECONFIG[python] =3D &quot;--with-python=3D${WORKDIR}/pytho=
n,--without-python,python&quot;<br>
&gt; =C2=A0PACKAGECONFIG[babeltrace] =3D &quot;--with-babeltrace,--without-=
babeltrace,babeltrace&quot;<br>
&gt;<br>
&gt; +# cc1 (4.9) call with -mthumb gets stuck and eats all available memor=
y (over 20GB in my case)<br>
&gt; +ARM_INSTRUCTION_SET =3D &quot;arm&quot;</p>
<p dir=3D"ltr">we dont want to turn thumb off unconditionally since thumb2 =
may be ok. </p>
<p dir=3D"ltr">&gt; +<br>
&gt; =C2=A0do_configure_prepend() {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${@bb.utils.contains(&#39;PA=
CKAGECONFIG&#39;, &#39;python&#39;, &#39;python&#39;, &#39;&#39;, d)}&quot;=
 ]; then<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt; ${WOR=
KDIR}/python &lt;&lt; EOF<br>
&gt; --<br>
&gt; 2.0.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--90e6ba53b27ce5018104fe40dc24--
