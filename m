Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 982CE71B99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 10:21:38 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k8so9297902edr.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JJRysSI5AMkm8bxh1+eQ6INT1pzfBXkvOH0NQPIrN7c=;
	b=ljJMxAQ2/LcWCnBx3bEpM9FnODUmtduVar9pzs/jJPupPbyNf9Bb0wSEI0b4uRz4RH
	nqVGm54X26NL30UTmgkJRgnBYYlSdxp+fYwmdJTmNqo5CY0gbG2r4hTAtBmPQ0NS49j5
	NnkCLcUmdzS/2V4mH5Ox0nkrUty5ltyHg/cR91n9SfWHQDYL8vqTqzbILsk5t8LOuwmq
	cpamFR4QpzOhInKR7L0SeCjk5DivSc8hhb5ttXofJ/cRb3rz4c4Wao9SA+3kBtIBReX0
	e0QDTUf/mWSB4l3xzptIvzih7ycIEFVZkI5/yKx5FdjhVkQahlpjqcJDuL0pZJa5p+F5
	J1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JJRysSI5AMkm8bxh1+eQ6INT1pzfBXkvOH0NQPIrN7c=;
	b=el9G5e88XsFm/rA0KCqKPjgZ+ujXUzr4SRA8SwU9ISi35TP3ncolWWtIVSc3fx3GBl
	onqTsDYem/a7OomweaUgRNdHPZPTlHgGZ+J8K5EZ/1F1Vb5zg1LS96mM3cn3b0X+Hu30
	RbQWJN755MxqVjpNUIeWqF9kyc8NBwwLb8ZRPlMfpiek6/CkHuXs44Lf9vLsZ9gkiYJ2
	563BVgOvaKClviITMvwwVKG4hQINl1QrCV4ApsvCKTDZVPJaDZ+JlIbd5klA3T8AOwIb
	uuCU4jyYL5KQs2wYTh/2UCqd5JUbxt/KeKLelCX3+dw/LJofjzgcVjW714rUT63vxbOp
	WUWQ==
X-Gm-Message-State: APjAAAUzuX35LDMDLHzhbJBlX8bydwWl2OkBD7gSBcxXXGECFB338ee+
	8RBRvB8u5HQRN1v6k8j3IP6lT7ibhrnt67UEEpxbuj0w
X-Google-Smtp-Source: APXvYqw5z8DQQsop7pTXrkcCz8nGEdTvIwAlOcVNdIsn/5yAoaFwHw6tVnT0rFek9AsWH91KG6jjNzqdoRyF9Nb7Xmo=
X-Received: by 2002:a50:95d3:: with SMTP id x19mr100498035eda.98.1561112499141;
	Fri, 21 Jun 2019 03:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <efe358c26f3e3e9e83853e72256f54d1b9bd4a7f.camel@linuxfoundation.org>
	<1560844016-105234-1-git-send-email-changqing.li@windriver.com>
	<20190621083230.GA1512@jama>
	<0d708d66-b7d6-118f-8df9-2572fb434e63@windriver.com>
In-Reply-To: <0d708d66-b7d6-118f-8df9-2572fb434e63@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 21 Jun 2019 12:21:27 +0200
Message-ID: <CA+chaQfqW9kGqSUqSW7WrdW014-veA9Oyp6K7V8=+b+Q900tkA@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] gcc-runtime: fix C++ header mapping for n32/x32 tune
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
X-List-Received-Date: Fri, 21 Jun 2019 10:21:39 -0000
Content-Type: multipart/alternative; boundary="000000000000f741cb058bd2d33f"

--000000000000f741cb058bd2d33f
Content-Type: text/plain; charset="UTF-8"

Hi,

see the fix here:
http://lists.openembedded.org/pipermail/openembedded-core/2019-June/283928.html

I think it doesn't need additional explanation.

Any aarch64/arm multilib configuration should trigger this (or anything
where TARGET_OS isn't just "linux").

Regards,

On Fri, Jun 21, 2019 at 11:08 AM Changqing Li <changqing.li@windriver.com>
wrote:

>
> On 6/21/19 4:32 PM, Martin Jansa wrote:
> > On Tue, Jun 18, 2019 at 03:46:56PM +0800, changqing.li@windriver.com
> wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> The SDK was unable to find the C++ header pieces correctly since it's
> >> using a generic compiler, not one specifically targeting the multilib
> >> vendor prefix and default tune.  This adds the right mapping to ensure
> >> SDKs work as expected. And fix problem in below configurations:
> >>
> >> multilib configuration 1:
> >> MACHINE="qemumips64"
> >> MULTILIBS ?= "multilib:lib32 multilib:libn32"
> >> DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
> >> DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
> >> MULTILIB_GLOBAL_VARIANTS_append = " libn32"
> >> require conf/multilib.conf
> >>
> >> ignoring nonexistent directory
> "<path>/sysroots/mips64-poky-linux/usr/include/c++/8.2.0/mips64-poky-linux/32
> >>
> >> multilib configuration 2:
> >> MACHINE="qemumips64"
> >> MULTILIBS = 'multilib:lib64 multilib:lib32'
> >> DEFAULTTUNE = 'mips64-n32'
> >> DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
> >> DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'
> >> require conf/multilib.conf
> >>
> >> For this configuration:
> >> for target gcc-runtime, need to create symlink like mips64-poly-linux
> --> mips64-poky-linux-gnu32
> >> for target lib64-gcc-runtime, need to create symlink like
> mips64-poly-linux/32 --> mips64-pokymllib64-linux
> >> in order to avoid conflict during populate_sdk, create symlink for
> subfoler bits/ext for target gcc-runtime,
> >> this is ugly, but seems no better way to cover all kinds of
> configuration.
> >>
> >> single lib configuration:
> >> MACHINE="qemumips64"
> >> DEFAULTTUNE = "mips64-n32"
> > This seems to be causing:
> >
> > ln: failed to create symbolic link
> 'work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oe-linux-gnueabi/bits':
> No such file or directory
> > WARNING: exit code 1 from a shell command.
> > ERROR: Function failed: do_install (log file is located at
> work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/temp/log.do_install.31049)
> >
> > There is only empty directory without the -gnueabi suffix:
> >
> work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oe-linux/
> >
> > and
> >
> >
> work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oemllib32-linux-gnueabi/
> > bits  ext
>
> Could you send your configuration like this? Thanks.
>
> MACHINE="qemumips64"
> MULTILIBS = 'multilib:lib64 multilib:lib32'
> DEFAULTTUNE = 'mips64-n32'
> DEFAULTTUNE_virtclass-multilib-lib64 = 'mips64'
> DEFAULTTUNE_virtclass-multilib-lib32 = 'mips32r2'
> require conf/multilib.conf
>
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   meta/recipes-devtools/gcc/gcc-runtime.inc | 29
> +++++++++++++++++------------
> >>   1 file changed, 17 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> index 3d03d8e..ba767e1 100644
> >> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> >> @@ -86,10 +86,6 @@ do_install () {
> >>      if [ -d ${D}${infodir} ]; then
> >>              rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
> >>      fi
> >> -    if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a
> "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> >> -            ln -s ${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
> >> -    fi
> >> -
> >>   }
> >>
> >>   do_install_append_class-target () {
> >> @@ -98,20 +94,29 @@ do_install_append_class-target () {
> >>      fi
> >>
> >>      if [ "${TARGET_OS}" = "linux-gnun32" ]; then
> >> -            if [ "${MULTILIBS}" != "" ]; then
> >> -                    mkdir
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux
> >> -                    ln -s ../${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux/32
> >> +            if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a
> "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> >> +                    mkdir
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
> >> +                    ln -s ../${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32
> >> +            elif [ "${MULTILIB_VARIANTS}" != "" ]; then
> >> +                    mkdir
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
> >> +                    ln -s ../${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32
> >>              else
> >>                      ln -s ${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
> >>              fi
> >> -    fi
> >> -    if [ "${TARGET_OS}" = "linux-gnux32" ]; then
> >> -            if [ "${MULTILIBS}" != "" ]; then
> >> -                    mkdir
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux
> >> -                    ln -s ../${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux/x32
> >> +    elif [ "${TARGET_OS}" = "linux-gnux32" ]; then
> >> +            if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a
> "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> >> +                    mkdir
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
> >> +                    ln -s ../${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32
> >> +            elif [ "${MULTILIB_VARIANTS}" != "" ]; then
> >> +                    mkdir
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
> >> +                    ln -s ../${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux/32
> >>              else
> >>                      ln -s ${TARGET_SYS}
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
> >>              fi
> >> +    elif [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a
> "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
> >> +            mkdir
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux
> >> +            ln -s ../${TARGET_SYS}/bits
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/bits
> >> +            ln -s ../${TARGET_SYS}/ext
> ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}/ext
> >>      fi
> >>
> >>      if [ "${TCLIBC}" != "glibc" ]; then
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> BRs
>
> Sandy(Li Changqing)
>
>

--000000000000f741cb058bd2d33f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>see the fix here:</div><div><a href=
=3D"http://lists.openembedded.org/pipermail/openembedded-core/2019-June/283=
928.html">http://lists.openembedded.org/pipermail/openembedded-core/2019-Ju=
ne/283928.html</a><br></div><div><br></div><div>I think it doesn&#39;t need=
 additional explanation.</div><div><br></div><div>Any aarch64/arm multilib =
configuration should trigger this (or anything where TARGET_OS isn&#39;t ju=
st &quot;linux&quot;).</div><div><br></div><div>Regards,</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 2=
1, 2019 at 11:08 AM Changqing Li &lt;<a href=3D"mailto:changqing.li@windriv=
er.com">changqing.li@windriver.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
On 6/21/19 4:32 PM, Martin Jansa wrote:<br>
&gt; On Tue, Jun 18, 2019 at 03:46:56PM +0800, <a href=3D"mailto:changqing.=
li@windriver.com" target=3D"_blank">changqing.li@windriver.com</a> wrote:<b=
r>
&gt;&gt; From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The SDK was unable to find the C++ header pieces correctly since i=
t&#39;s<br>
&gt;&gt; using a generic compiler, not one specifically targeting the multi=
lib<br>
&gt;&gt; vendor prefix and default tune.=C2=A0 This adds the right mapping =
to ensure<br>
&gt;&gt; SDKs work as expected. And fix problem in below configurations:<br=
>
&gt;&gt;<br>
&gt;&gt; multilib configuration 1:<br>
&gt;&gt; MACHINE=3D&quot;qemumips64&quot;<br>
&gt;&gt; MULTILIBS ?=3D &quot;multilib:lib32 multilib:libn32&quot;<br>
&gt;&gt; DEFAULTTUNE_virtclass-multilib-lib32 ?=3D &quot;mips&quot;<br>
&gt;&gt; DEFAULTTUNE_virtclass-multilib-libn32 ?=3D &quot;mips64-n32&quot;<=
br>
&gt;&gt; MULTILIB_GLOBAL_VARIANTS_append =3D &quot; libn32&quot;<br>
&gt;&gt; require conf/multilib.conf<br>
&gt;&gt;<br>
&gt;&gt; ignoring nonexistent directory &quot;&lt;path&gt;/sysroots/mips64-=
poky-linux/usr/include/c++/8.2.0/mips64-poky-linux/32<br>
&gt;&gt;<br>
&gt;&gt; multilib configuration 2:<br>
&gt;&gt; MACHINE=3D&quot;qemumips64&quot;<br>
&gt;&gt; MULTILIBS =3D &#39;multilib:lib64 multilib:lib32&#39;<br>
&gt;&gt; DEFAULTTUNE =3D &#39;mips64-n32&#39;<br>
&gt;&gt; DEFAULTTUNE_virtclass-multilib-lib64 =3D &#39;mips64&#39;<br>
&gt;&gt; DEFAULTTUNE_virtclass-multilib-lib32 =3D &#39;mips32r2&#39;<br>
&gt;&gt; require conf/multilib.conf<br>
&gt;&gt;<br>
&gt;&gt; For this configuration:<br>
&gt;&gt; for target gcc-runtime, need to create symlink like mips64-poly-li=
nux --&gt; mips64-poky-linux-gnu32<br>
&gt;&gt; for target lib64-gcc-runtime, need to create symlink like mips64-p=
oly-linux/32 --&gt; mips64-pokymllib64-linux<br>
&gt;&gt; in order to avoid conflict during populate_sdk, create symlink for=
 subfoler bits/ext for target gcc-runtime,<br>
&gt;&gt; this is ugly, but seems no better way to cover all kinds of config=
uration.<br>
&gt;&gt;<br>
&gt;&gt; single lib configuration:<br>
&gt;&gt; MACHINE=3D&quot;qemumips64&quot;<br>
&gt;&gt; DEFAULTTUNE =3D &quot;mips64-n32&quot;<br>
&gt; This seems to be causing:<br>
&gt;<br>
&gt; ln: failed to create symbolic link &#39;work/aarch64-oemllib32-linux-g=
nueabi/lib32-gcc-runtime/9.1.0-r0/image/usr/include/c++/9.1.0/arm-oe-linux-=
gnueabi/bits&#39;: No such file or directory<br>
&gt; WARNING: exit code 1 from a shell command.<br>
&gt; ERROR: Function failed: do_install (log file is located at work/aarch6=
4-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/temp/log.do_install.31=
049)<br>
&gt;<br>
&gt; There is only empty directory without the -gnueabi suffix:<br>
&gt; work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/=
usr/include/c++/9.1.0/arm-oe-linux/<br>
&gt;<br>
&gt; and<br>
&gt;<br>
&gt; work/aarch64-oemllib32-linux-gnueabi/lib32-gcc-runtime/9.1.0-r0/image/=
usr/include/c++/9.1.0/arm-oemllib32-linux-gnueabi/<br>
&gt; bits=C2=A0 ext<br>
<br>
Could you send your configuration like this? Thanks.<br>
<br>
MACHINE=3D&quot;qemumips64&quot;<br>
MULTILIBS =3D &#39;multilib:lib64 multilib:lib32&#39;<br>
DEFAULTTUNE =3D &#39;mips64-n32&#39;<br>
DEFAULTTUNE_virtclass-multilib-lib64 =3D &#39;mips64&#39;<br>
DEFAULTTUNE_virtclass-multilib-lib32 =3D &#39;mips32r2&#39;<br>
require conf/multilib.conf<br>
<br>
&gt;&gt; Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@win=
driver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc | 29 +++++++=
++++++++++------------<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 17 insertions(+), 12 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/reci=
pes-devtools/gcc/gcc-runtime.inc<br>
&gt;&gt; index 3d03d8e..ba767e1 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt;&gt; +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc<br>
&gt;&gt; @@ -86,10 +86,6 @@ do_install () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if [ -d ${D}${infodir} ]; then<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rmdir --ignore-fai=
l-on-non-empty -p ${D}${infodir}<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt; -=C2=A0 =C2=A0 if [ &quot;${TARGET_VENDOR_MULTILIB_ORIGINAL}&quot;=
 !=3D &quot;&quot; -a &quot;${TARGET_VENDOR}&quot; !=3D &quot;${TARGET_VEND=
OR_MULTILIB_ORIGINAL}&quot; ]; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s ${TARGET_SYS} ${D=
}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}=
-${TARGET_OS}<br>
&gt;&gt; -=C2=A0 =C2=A0 fi<br>
&gt;&gt; -<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0do_install_append_class-target () {<br>
&gt;&gt; @@ -98,20 +94,29 @@ do_install_append_class-target () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if [ &quot;${TARGET_OS}&quot; =3D &quot;linux-=
gnun32&quot; ]; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${MULTILIBS}=
&quot; !=3D &quot;&quot; ]; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-pokymllib64-linux=
<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-=
pokymllib64-linux/32<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${TARGET_VEN=
DOR_MULTILIB_ORIGINAL}&quot; !=3D &quot;&quot; -a &quot;${TARGET_VENDOR}&qu=
ot; !=3D &quot;${TARGET_VENDOR_MULTILIB_ORIGINAL}&quot; ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MU=
LTILIB_ORIGINAL}-linux<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}$=
{TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/32<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ &quot;${MULTILIB=
_VARIANTS}&quot; !=3D &quot;&quot; ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-l=
inux<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}$=
{TARGET_VENDOR}-linux/32<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}=
${TARGET_VENDOR}-linux<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt; -=C2=A0 =C2=A0 fi<br>
&gt;&gt; -=C2=A0 =C2=A0 if [ &quot;${TARGET_OS}&quot; =3D &quot;linux-gnux3=
2&quot; ]; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${MULTILIBS}=
&quot; !=3D &quot;&quot; ]; then<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-poky-linux<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}-=
poky-linux/x32<br>
&gt;&gt; +=C2=A0 =C2=A0 elif [ &quot;${TARGET_OS}&quot; =3D &quot;linux-gnu=
x32&quot; ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${TARGET_VEN=
DOR_MULTILIB_ORIGINAL}&quot; !=3D &quot;&quot; -a &quot;${TARGET_VENDOR}&qu=
ot; !=3D &quot;${TARGET_VENDOR_MULTILIB_ORIGINAL}&quot; ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MU=
LTILIB_ORIGINAL}-linux<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}$=
{TARGET_VENDOR_MULTILIB_ORIGINAL}-linux/x32<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif [ &quot;${MULTILIB=
_VARIANTS}&quot; !=3D &quot;&quot; ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mkdir ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-l=
inux<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ln -s ../${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}$=
{TARGET_VENDOR}-linux/32<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}=
${TARGET_VENDOR}-linux<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt; +=C2=A0 =C2=A0 elif [ &quot;${TARGET_VENDOR_MULTILIB_ORIGINAL}&quo=
t; !=3D &quot;&quot; -a &quot;${TARGET_VENDOR}&quot; !=3D &quot;${TARGET_VE=
NDOR_MULTILIB_ORIGINAL}&quot; ]; then<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir ${D}${includedir}=
/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-linux<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s ../${TARGET_SYS}/=
bits ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_O=
RIGINAL}-${TARGET_OS}/bits<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s ../${TARGET_SYS}/=
ext ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_OR=
IGINAL}-${TARGET_OS}/ext<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 fi<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if [ &quot;${TCLIBC}&quot; !=3D &quot;glibc&qu=
ot; ]; then<br>
&gt;&gt; -- <br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
&gt;&gt; -- <br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
<br>
-- <br>
BRs<br>
<br>
Sandy(Li Changqing)<br>
<br>
</blockquote></div>

--000000000000f741cb058bd2d33f--
