Return-Path: <kergoth@gmail.com>
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
	[209.85.210.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6A27FDD3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 18:20:05 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id h9so2490991otj.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 10:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Dw7SnCSQQJaJEYYuyxNUtg6KdEn2f6VE1GzpsFOJYrA=;
	b=Jf3uFfcHw4+tVI9ANDcxu1RDDankOlxm88sTNcDLIsK+DxwUm9aiwhVGLxlkgC2JWY
	mYdKPPsohnGiVTVdpsjyh55E5ZyNsH5h9HSDw7bjP2YemgB9WyVyYanxx5KcUG7BIOu3
	fSNw/lMpJwlcaAANoZISqgVnGxW4/xl1mkA2TZczactmBCNnXQuhGucTIDzE0UrIweDx
	ZlBqzYO/w5SsA67+kn7HqpfsrT/LPHYNZzHXPcZzFtyJR8c+aCMFujIxWmhU+eJYbIzt
	J1ohLcMwO2T8eWINytB6yiwXWItl1gAsZkk11RTruFn/rCanYC9P3/6AEESyoyf8mQOu
	/lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Dw7SnCSQQJaJEYYuyxNUtg6KdEn2f6VE1GzpsFOJYrA=;
	b=GP3aN6l38QvXrr6ysl9G/t3qM5PpfOUZbcMQFOXdQz8pUNAfekxMsiwRPF0sKY5LpQ
	JbMeCBXX/IqIwyRgO8DvGiQbV1qdhFr6//NkTPMF5+sgMOSm5DiaydAl4KCfNm3I160O
	6PmoYoAebRawuklzCgidMkXiapHQt5oXqfgAqEx2YXsKOFUymsHhFAl/kk1LIhDK0szC
	Rlt5WKntNR7htorZh/bAGTiGK7gmYIG0RM+X3wlGFlgjzLQaS5FJcsVaH17V9O8JHzau
	J/QL7QCP9/rdmxzU8J95UYrHi0CtH6B4GStCKmxX9kC7EhV1fXT+W9YUUwgv7W6NLs2L
	7sYQ==
X-Gm-Message-State: APjAAAX2QKc/kmO1IX9hZNRlMusoko4UYHRpuE7+sgq5DNCN2dI9HuXI
	8xQwQR8lPALeUJ1UfZmnkrs0vZ5rBUkJS64tY+cu7fEA
X-Google-Smtp-Source: APXvYqzwQoN4mPw7+1B9QXxC+pismKNkTBkNIQ/SudAqnR+iJitgPy8/unVzd03w8Hu4i+ggskYSdRDidAkBmeKMejg=
X-Received: by 2002:a9d:1c9c:: with SMTP id l28mr3116217ota.210.1579890006875; 
	Fri, 24 Jan 2020 10:20:06 -0800 (PST)
MIME-Version: 1.0
References: <20200123223449.90548-1-jason.wessel@windriver.com>
In-Reply-To: <20200123223449.90548-1-jason.wessel@windriver.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 24 Jan 2020 11:19:55 -0700
Message-ID: <CABcZANnAW-HYaJmDs8U2iwfzJSb1ig3KsVMvXuz6QjTAR6vqtw@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] module.bbclass: swap AR and LD order
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
X-List-Received-Date: Fri, 24 Jan 2020 18:20:06 -0000
Content-Type: multipart/alternative; boundary="000000000000a4e0f9059ce6ce21"

--000000000000a4e0f9059ce6ce21
Content-Type: text/plain; charset="UTF-8"

What makefile change caused this? That behavior doesn't make much sense
given how make processes its command-line arguments.

On Thu, Jan 23, 2020 at 3:34 PM Jason Wessel <jason.wessel@windriver.com>
wrote:

> The 5.x kernels seem to have made a change to the linker command line
> processing.
>
> When trying to build out of tree kernel modules, such as the
> virtualbox guest additions, the following error is printed:
>
> | make[1]: Entering directory
> '/opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxvideo'
> | make[3]: Entering directory
> '/opt/build-x86-64/tmp/work-shared/qemux86-64/kernel-build-artifacts'
> | make V= CONFIG_MODULE_SIG= CONFIG_MODULE_SIG_ALL= -C
> /opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/5.2.28-yocto-standard/build
> M=/opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxguest
> SRCROOT=/opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxguest
> modules
> | make[3]: Entering directory
> '/opt/build-x86-64/tmp/work-shared/qemux86-64/kernel-build-artifacts'
> |   LD [M]
> /opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxvideo/vboxvideo.o
> | x86_64-poky-linux-ld.bfd: cannot find AR=x86_64-poky-linux-ar: No such
> file or directory
>
> The AR arguments passed to the make command are being processed as
> command line arguments to the linker due to some changes in the
> kernel's Makefile.  For now the easiest fix is to just swap the
> arguments in the module.bbclass.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/module.bbclass | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index c0dfa35061..e1e5fdaa72 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -38,8 +38,7 @@ module_do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
>                    KERNEL_VERSION=${KERNEL_VERSION}    \
> -                  CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
> -                  AR="${KERNEL_AR}" \
> +                  CC="${KERNEL_CC}" AR="${KERNEL_AR}" LD="${KERNEL_LD}" \
>                    O=${STAGING_KERNEL_BUILDDIR} \
>                    KBUILD_EXTRA_SYMBOLS="${KBUILD_EXTRA_SYMBOLS}" \
>                    ${MAKE_TARGETS}
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000a4e0f9059ce6ce21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What makefile change caused this? That behavior doesn&#39;=
t make much sense given how make processes its command-line arguments.</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Jan 23, 2020 at 3:34 PM Jason Wessel &lt;<a href=3D"mailto:jason.wessel@=
windriver.com">jason.wessel@windriver.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">The 5.x kernels seem to have made =
a change to the linker command line processing.<br>
<br>
When trying to build out of tree kernel modules, such as the<br>
virtualbox guest additions, the following error is printed:<br>
<br>
| make[1]: Entering directory &#39;/opt/build-x86-64/tmp/work/qemux86_64-po=
ky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxvideo&#39;<br>
| make[3]: Entering directory &#39;/opt/build-x86-64/tmp/work-shared/qemux8=
6-64/kernel-build-artifacts&#39;<br>
| make V=3D CONFIG_MODULE_SIG=3D CONFIG_MODULE_SIG_ALL=3D -C /opt/build-x86=
-64/tmp/work/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/5.2.28-yocto-s=
tandard/build M=3D/opt/build-x86-64/tmp/work/qemux86_64-poky-linux/vboxgues=
tdrivers/6.1.2-r0/vbox_module/vboxguest SRCROOT=3D/opt/build-x86-64/tmp/wor=
k/qemux86_64-poky-linux/vboxguestdrivers/6.1.2-r0/vbox_module/vboxguest mod=
ules<br>
| make[3]: Entering directory &#39;/opt/build-x86-64/tmp/work-shared/qemux8=
6-64/kernel-build-artifacts&#39;<br>
|=C2=A0 =C2=A0LD [M]=C2=A0 /opt/build-x86-64/tmp/work/qemux86_64-poky-linux=
/vboxguestdrivers/6.1.2-r0/vbox_module/vboxvideo/vboxvideo.o<br>
| x86_64-poky-linux-ld.bfd: cannot find AR=3Dx86_64-poky-linux-ar: No such =
file or directory<br>
<br>
The AR arguments passed to the make command are being processed as<br>
command line arguments to the linker due to some changes in the<br>
kernel&#39;s Makefile.=C2=A0 For now the easiest fix is to just swap the<br=
>
arguments in the module.bbclass.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m" target=3D"_blank">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/module.bbclass | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass<br>
index c0dfa35061..e1e5fdaa72 100644<br>
--- a/meta/classes/module.bbclass<br>
+++ b/meta/classes/module.bbclass<br>
@@ -38,8 +38,7 @@ module_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake KERNEL_PATH=3D${STAGING_KERNEL_DIR}=
=C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KERNEL=
_VERSION=3D${KERNEL_VERSION}=C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D&quot;=
${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_LD}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AR=3D&quot;=
${KERNEL_AR}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D&quot;=
${KERNEL_CC}&quot; AR=3D&quot;${KERNEL_AR}&quot; LD=3D&quot;${KERNEL_LD}&qu=
ot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O=3D${=
STAGING_KERNEL_BUILDDIR} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0KBUILD=
_EXTRA_SYMBOLS=3D&quot;${KBUILD_EXTRA_SYMBOLS}&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${MAKE=
_TARGETS}<br>
-- <br>
2.23.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>

--000000000000a4e0f9059ce6ce21--
