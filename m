Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0007318A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 14:54:36 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n66so3779022qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 07:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6cn1XSv289uTcj1SsuqYtOhVAZrNykVl2f9K3Gyd0FM=;
	b=AlHpdbp+dUoh10IuN1JxhtZdQjnSmERzY7oj6D9r2GPOXK2JnskLpG+ZN1l4ksz4sL
	zp9NLZ06C4rvSYvKu5fPw+c/ihWIEXKp7+5YlrBqNhS64GPFGGupbE6IZd3NIdT0LY7p
	XwrM6WzPJrktVeOkQIN67SY3joRxgdIWobtR5sISQrXuf5Cx3lqBRPG09aI7VaeOOp75
	RddDGlo+dsA2qU7ApQzrFN4fzXVxQ1KtifnX9iPGe4I+HbpZQh776G0TUngTfvx5OD/G
	AQydm/60FcmUrPu8YNULw/sD+CmXCt9a/OQg440P9rc6BXJogziDWYr7xeoMMtLI1ynt
	Qzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6cn1XSv289uTcj1SsuqYtOhVAZrNykVl2f9K3Gyd0FM=;
	b=fR2EvbxiWNwYsRDH7uxB3yJlTFEiMEQtpz7TLK8FSOsxqIZ5OstnJHSvoUHS1TB6a2
	ck94jv9Fp9+e98tbX1MytnVUxG5RmATDXWBnbWGBuuqZKW2V0RVS1x3OSvpsqx6PI1Tm
	P0WfVbTJipigaB/xErzTsLC7Ubs6Ac7ulAnrFRhJviCJ9QfQ0vFAGQ9DSpITEtrqTcbr
	sRRrlebUIxZRJx9Elo06Ra2JW8iDHtV/NuUoaEySrykYjAwFYj6JtqdiZpbNFznz+d6Y
	kHM+Mz1iRa62XxltXdCRzCxkGq4kA6DE4dqr41WXluGSD/Nco+pvrc27WXrxO4OxMv1a
	8Vqw==
X-Gm-Message-State: AE9vXwPT3kyPcGbZhYi7rD7hVKX5ZQyU2lniPUcGuRq3DbcfVnvvHVE0V6KUZqp4AJBvAn3G8h7HppLeASgI+g==
X-Received: by 10.55.166.137 with SMTP id p131mr10804652qke.161.1472136876529; 
	Thu, 25 Aug 2016 07:54:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Thu, 25 Aug 2016 07:54:35 -0700 (PDT)
In-Reply-To: <1471411501-3523-1-git-send-email-california.l.sullivan@intel.com>
References: <1471411501-3523-1-git-send-email-california.l.sullivan@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Aug 2016 10:54:35 -0400
Message-ID: <CADkTA4MRmD1-phGfE36szinDh82jeG=SDUdGPQma3SJ7=GwurQ@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/1] kernel.bbclass: Add kernel_version_sanity_check function
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
X-List-Received-Date: Thu, 25 Aug 2016 14:54:39 -0000
Content-Type: multipart/alternative; boundary=94eb2c06eda09635e4053ae693db

--94eb2c06eda09635e4053ae693db
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 17, 2016 at 1:25 AM, California Sullivan <
california.l.sullivan@intel.com> wrote:

> The kernel being built should match what the recipe claims it is
> building. This function ensures that happens for anyone using
> LINUX_VERSION as they should. As it will likely break outside kernels
> not using LINUX_VERSION, only enable the function for linux-yocto for
> now.
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
> I'm not absolutely sure this is the correct path to solve the issue.
> This patch relies on LINUX_VERSION being set which isn't a guarantee.
> There is probably a more general solution that I'm not thinking of.
>

I can't say that I know of all the options either, but I can ask questions
and perhaps
others will have more ideas.


>
>  meta/classes/kernel.bbclass               | 21 +++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto.inc |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index db42744..ac2611f 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -330,6 +330,27 @@ kernel_do_install() {
>  }
>  do_install[prefuncs] += "package_get_auto_pr"
>
> +# Must be ran some time after do_kernel_checkout or else Makefile won't
> be in ${S}/Makefile
> +do_kernel_version_sanity_check() {
> +       # The Makefile determines the kernel version shown at runtime
> +       # Don't use KERNEL_VERSION because the headers it grabs the
> version from aren't generated until do_compile
>
+       VERSION=$(grep "^VERSION =" ${S}/Makefile | sed s/.*=\ //)
> +       PATCHLEVEL=$(grep "^PATCHLEVEL =" ${S}/Makefile | sed s/.*=\ //)
> +       SUBLEVEL=$(grep "^SUBLEVEL =" ${S}/Makefile | sed s/.*=\ //)
>

I was also trying to think of a way to avoid duplicating code that is
yanking out version
numbers, but yes if we depend on utsrelease, we also have to do some level
of
building .. but that can actually be pretty lightweight.

Have you tried just invoking the prepare1 target in the kernel build ? That
should
generate the utsrelease, and not much more.


> +
> +       # If SUBLEVEL is zero or doesn't exist we ignore it as
> VERSION.PATCHLEVEL is normal
> +       if [ -n "${SUBLEVEL}" ] && [ "${SUBLEVEL}" != "0" ]; then
> +               if [ "${VERSION}.${PATCHLEVEL}.${SUBLEVEL}" !=
> "${LINUX_VERSION}" ]; then
> +                       bbfatal "LINUX_VERSION (${LINUX_VERSION}) does not
> match kernel being built (${VERSION}.${PATCHLEVEL}.${SUBLEVEL}).\nTo fix
> this correct the LINUX_VERSION variable in your kernel recipe."
>

I know that I use LINUX_VERSION in the linux-yocto recipes, but it isn't
something
enforced or widespread (as far as I know). Since this is kernel.bbclass
versus kernel-yocto.bbclass
should this be checking against PV versus LINUX_VERSION ? Alternatively,
this could just
move to kernel-yocto.bbclass as we try and make it more general.

Bruce



> +               fi
> +       else
> +               if [ "${VERSION}.${PATCHLEVEL}" != "${LINUX_VERSION}" ];
> then
> +                       bbfatal "LINUX_VERSION (${LINUX_VERSION}) does not
> match kernel being built (${VERSION}.${PATCHLEVEL}).\nTo fix this correct
> the LINUX_VERSION variable in your kernel recipe."
> +               fi
> +       fi
> +       exit 0
> +}
> +
>  addtask shared_workdir after do_compile before do_compile_kernelmodules
>  addtask shared_workdir_setscene
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 98a48ec..d979662 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -55,6 +55,7 @@ do_install_append(){
>  }
>
>  # extra tasks
> +addtask kernel_version_sanity_check after do_kernel_checkout before
> do_compile
>  addtask kernel_link_images after do_compile before do_install
>  addtask validate_branches before do_patch after do_kernel_checkout
>  addtask kernel_configcheck after do_configure before do_compile
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c06eda09635e4053ae693db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 17, 2016 at 1:25 AM, California Sullivan <span dir=3D"ltr">=
&lt;<a href=3D"mailto:california.l.sullivan@intel.com" target=3D"_blank">ca=
lifornia.l.sullivan@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">The kernel being built should match what the recipe claims it is=
<br>
building. This function ensures that happens for anyone using<br>
LINUX_VERSION as they should. As it will likely break outside kernels<br>
not using LINUX_VERSION, only enable the function for linux-yocto for<br>
now.<br>
<br>
Signed-off-by: California Sullivan &lt;<a href=3D"mailto:california.l.sulli=
van@intel.com">california.l.sullivan@intel.<wbr>com</a>&gt;<br>
---<br>
I&#39;m not absolutely sure this is the correct path to solve the issue.<br=
>
This patch relies on LINUX_VERSION being set which isn&#39;t a guarantee.<b=
r>
There is probably a more general solution that I&#39;m not thinking of.<br>=
</blockquote><div><br></div><div>I can&#39;t say that I know of all the opt=
ions either, but I can ask questions and perhaps<br></div><div>others will =
have more ideas.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 21 +++++++++++++++++++++<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto.inc |=C2=A0 1 +<br>
=C2=A02 files changed, 22 insertions(+)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index db42744..ac2611f 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -330,6 +330,27 @@ kernel_do_install() {<br>
=C2=A0}<br>
=C2=A0do_install[prefuncs] +=3D &quot;package_get_auto_pr&quot;<br>
<br>
+# Must be ran some time after do_kernel_checkout or else Makefile won&#39;=
t be in ${S}/Makefile<br>
+do_kernel_version_sanity_<wbr>check() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# The Makefile determines the kernel version sh=
own at runtime<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Don&#39;t use KERNEL_VERSION because the head=
ers it grabs the version from aren&#39;t generated until do_compile <br></b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0VERSION=3D$(grep &quot;^VERSION =3D&quot; ${S}/=
Makefile | sed s/.*=3D\ //)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0PATCHLEVEL=3D$(grep &quot;^PATCHLEVEL =3D&quot;=
 ${S}/Makefile | sed s/.*=3D\ //)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SUBLEVEL=3D$(grep &quot;^SUBLEVEL =3D&quot; ${S=
}/Makefile | sed s/.*=3D\ //)<br></blockquote><div><br></div><div>I was als=
o trying to think of a way to avoid duplicating code that is yanking out ve=
rsion<br></div><div>numbers, but yes if we depend on utsrelease, we also ha=
ve to do some level of <br></div><div>building .. but that can actually be =
pretty lightweight.<br><br></div><div>Have you tried just invoking the prep=
are1 target in the kernel build ? That should <br></div><div>generate the u=
tsrelease, and not much more.<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# If SUBLEVEL is zero or doesn&#39;t exist we i=
gnore it as VERSION.PATCHLEVEL is normal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;${SUBLEVEL}&quot; ] &amp;&amp; [ =
&quot;${SUBLEVEL}&quot; !=3D &quot;0&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${VERSIO=
N}.${PATCHLEVEL}.${<wbr>SUBLEVEL}&quot; !=3D &quot;${LINUX_VERSION}&quot; ]=
; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbfatal &quot;LINUX_VERSION (${LINUX_VERSION}) does not match ker=
nel being built (${VERSION}.${PATCHLEVEL}.${<wbr>SUBLEVEL}).\nTo fix this c=
orrect the LINUX_VERSION variable in your kernel recipe.&quot;<br></blockqu=
ote><div><br></div><div>I know that I use LINUX_VERSION in the linux-yocto =
recipes, but it isn&#39;t something<br></div><div>enforced or widespread (a=
s far as I know). Since this is kernel.bbclass versus kernel-yocto.bbclass<=
br></div><div>should this be checking against PV versus LINUX_VERSION ? Alt=
ernatively, this could just<br></div><div>move to kernel-yocto.bbclass as w=
e try and make it more general.<br><br></div><div>Bruce<br></div><div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${VERSIO=
N}.${PATCHLEVEL}&quot; !=3D &quot;${LINUX_VERSION}&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbfatal &quot;LINUX_VERSION (${LINUX_VERSION}) does not match ker=
nel being built (${VERSION}.${PATCHLEVEL}).\<wbr>nTo fix this correct the L=
INUX_VERSION variable in your kernel recipe.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 0<br>
+}<br>
+<br>
=C2=A0addtask shared_workdir after do_compile before do_compile_kernelmodul=
es<br>
=C2=A0addtask shared_workdir_setscene<br>
<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc b/meta/recipes-=
kernel/linux/<wbr>linux-yocto.inc<br>
index 98a48ec..d979662 100644<br>
--- a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
@@ -55,6 +55,7 @@ do_install_append(){<br>
=C2=A0}<br>
<br>
=C2=A0# extra tasks<br>
+addtask kernel_version_sanity_check after do_kernel_checkout before do_com=
pile<br>
=C2=A0addtask kernel_link_images after do_compile before do_install<br>
=C2=A0addtask validate_branches before do_patch after do_kernel_checkout<br=
>
=C2=A0addtask kernel_configcheck after do_configure before do_compile<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.5<br>
<br>
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
</div></div>

--94eb2c06eda09635e4053ae693db--
