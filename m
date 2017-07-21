Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 72D1D783BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 17:30:12 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id h63so2644347lfg.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HOaVcUaMAv+W0nRDIOc8/L0uMTJ+JgRcaoDrdUsTVtU=;
	b=cIDU+/yxnsWVc8+rsH36D+rEC3X3bAfRPPbgdH5TEWvU7AhEfz19lZGVSOJidmtTUB
	Qbp1xS7ASwPzTeDINLGlnBzoayIYQMMLDOUtb+kkDJoEQbyTUH88es/j4GFPsPRnEH69
	tLIAR6QWUWoUKpsiN5jSMA/Cn6XerATi8J9BO43xmDJjSm5TZ2cWjV8IGBTddequDXM+
	+MiKH8QKmzfD6MNjqykY+hHE2hei2W2VlVaqhVDp/X6q/Gvm0q/0Y2uTFV60YfQdec7g
	2zBRpuMab+5YDT7IsBpbwGmNAKALuCfIkBdijdcvYBLWfzQQ7Vt0fOiHivokAzIYB4hc
	1zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HOaVcUaMAv+W0nRDIOc8/L0uMTJ+JgRcaoDrdUsTVtU=;
	b=QbWX26VHtsk/OwYAgxrrJj+aM/WsojYeAdbRJRo6k57yTVnh5erVk5Jpa7xv1AQG5d
	gGFEnW95JflGV9VXPnPyMoQtDovmeGug42LrpG8MsIht1fJtZwTb/S2pQBFTiLFX8Svq
	Rl8FiqHCpUIVM5re+WpT3RjSn9DQNSFGwVHbN6ixeipunW2dX4X8gIrjVvOuVMBN8ePB
	p7DmNCUTApnmYfK0FgLNPLHoPZr+A4cWOdiocXTXKbR7TO5LhGbM+PEGVNomMLOHSiV8
	R/vUCQa6S/HeT/Y6ihe0gm5m/utmGFUbPD0yJdIsIsA7QPUXw4yDsOJozUR5xOg/pwaf
	ABjg==
X-Gm-Message-State: AIVw113pf96uDbfE/eZWc9tjbKVs4aAC+IdzsXMfzwoSCHxud5tgYv8Z
	jTRyhGjbjwlqp2CPeE/0FzXTxE0j9A==
X-Received: by 10.25.23.106 with SMTP id n103mr2546042lfi.97.1500658212895;
	Fri, 21 Jul 2017 10:30:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.14.2 with HTTP; Fri, 21 Jul 2017 10:30:12 -0700 (PDT)
In-Reply-To: <1500657197-10664-1-git-send-email-jslater@windriver.com>
References: <1500657197-10664-1-git-send-email-jslater@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Jul 2017 13:30:12 -0400
Message-ID: <CADkTA4Oq7UdB-cVwuFWD-v8+jkKrLAXLW_bPr-q4mx8eTq2iGA@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] modules: move creation of some module related tools
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
X-List-Received-Date: Fri, 21 Jul 2017 17:30:12 -0000
Content-Type: multipart/alternative; boundary="001a113fba4ab5832e0554d73742"

--001a113fba4ab5832e0554d73742
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 21, 2017 at 1:13 PM, Joe Slater <jslater@windriver.com> wrote:

> Move creation of tools needed by module building recipes into
> kernel.bbclass but invoke the task only from the module recipes.
> Without this change, one module recipe can fail trying to use the
> tools while another is (re-)building them.
>

You are changing some core code that has been protecting our builds for
quite some time .. yet, you have no example of the errors that are being
seen, and no proof that this actually fixes the problem (and that it doesn't
introduce other issues).

i.e. how are the lock files no protecting this in whatever is breaking for
you ?

Looking at the change, I'm not convinced it is the right thing to do.

i.e. putting something in kernel.bbclass that is only used by the modules
is less than ideal, without some sort of justification.

Bruce


>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/classes/kernel.bbclass      | 15 +++++++++++++++
>  meta/classes/module-base.bbclass | 10 ++--------
>  meta/classes/module.bbclass      |  4 ----
>  3 files changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 7670c71..131387e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -280,6 +280,11 @@ kernel_do_compile() {
>
>  do_compile_kernelmodules() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> +
> +       # build modpost, etc
> +       make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +                  -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR}
> scripts
> +
>         if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
>                 oe_runmake -C ${B} ${PARALLEL_MAKE} modules
> CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>
> @@ -296,6 +301,16 @@ do_compile_kernelmodules() {
>  }
>  addtask compile_kernelmodules after do_compile before do_strip
>
> +# Task to ensure the kernel scripts are created. Expected to be invoked
> +# only by module building recipes. See module.bbclass for an example.
> +do_make_scripts() {
> +       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +       make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +                  -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR}
> scripts
> +}
> +addtask make_scripts after do_compile_kernelmodules
> +do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
> +
>  kernel_do_install() {
>         #
>         # First install the modules
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.
> bbclass
> index 6fe77c0..c1fe191 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -1,7 +1,8 @@
>  inherit kernel-arch
>
>  # This is instead of DEPENDS = "virtual/kernel"
> -do_configure[depends] += "virtual/kernel:do_compile_kernelmodules"
> +# do_make_scripts() used to be in here, but is now in kernel.bbclass
> +do_configure[depends] += "virtual/kernel:do_make_scripts"
>
>  export OS = "${TARGET_OS}"
>  export CROSS_COMPILE = "${TARGET_PREFIX}"
> @@ -18,10 +19,3 @@ KERNEL_OBJECT_SUFFIX = ".ko"
>  # kernel modules are generally machine specific
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
> -# Function to ensure the kernel scripts are created. Expected to
> -# be called before do_compile. See module.bbclass for an example.
> -do_make_scripts() {
> -       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -       make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> -                  -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR}
> scripts
> -}
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 391776d..e344960 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -1,9 +1,5 @@
>  inherit module-base kernel-module-split pkgconfig
>
> -addtask make_scripts after do_prepare_recipe_sysroot before do_compile
> -do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
> -do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
> -
>  EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
>
>  MODULES_INSTALL_TARGET ?= "modules_install"
> --
> 2.7.4
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

--001a113fba4ab5832e0554d73742
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Jul 21, 2017 at 1:13 PM, Joe Slater <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:jslater@windriver.com" target=3D"_blank">jslater@windriver.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Move creation of t=
ools needed by module building recipes into<br>
kernel.bbclass but invoke the task only from the module recipes.<br>
Without this change, one module recipe can fail trying to use the<br>
tools while another is (re-)building them.<br></blockquote><div><br></div><=
div>You are changing some core code that has been protecting our builds for=
</div><div>quite some time .. yet, you have no example of the errors that a=
re being</div><div>seen, and no proof that this actually fixes the problem =
(and that it doesn&#39;t</div><div>introduce other issues).</div><div><br><=
/div><div>i.e. how are the lock files no protecting this in whatever is bre=
aking for you ?</div><div><br></div><div>Looking at the change, I&#39;m not=
 convinced it is the right thing to do.</div><div><br></div><div>i.e. putti=
ng something in kernel.bbclass that is only used by the modules</div><div>i=
s less than ideal, without some sort of justification.</div><div><br></div>=
<div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:jslater@windriver.com">jsla=
ter@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 | 15 +++++++++++++++<=
br>
=C2=A0meta/classes/module-base.<wbr>bbclass | 10 ++--------<br>
=C2=A0meta/classes/module.bbclass=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ----<br>
=C2=A03 files changed, 17 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 7670c71..131387e 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -280,6 +280,11 @@ kernel_do_compile() {<br>
<br>
=C2=A0do_compile_kernelmodules() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# build modpost, etc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0make CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;$=
{KERNEL_LD}&quot; AR=3D&quot;${KERNEL_AR}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -C ${STAGIN=
G_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} scripts<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grep -q -i -e &#39;^CONFIG_MODULES=3Dy$&#39=
; ${B}/.config); then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${B} =
${PARALLEL_MAKE} modules CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_=
LD}&quot; ${KERNEL_EXTRA_ARGS}<br>
<br>
@@ -296,6 +301,16 @@ do_compile_kernelmodules() {<br>
=C2=A0}<br>
=C2=A0addtask compile_kernelmodules after do_compile before do_strip<br>
<br>
+# Task to ensure the kernel scripts are created. Expected to be invoked<br=
>
+# only by module building recipes. See module.bbclass for an example.<br>
+do_make_scripts() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0make CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;$=
{KERNEL_LD}&quot; AR=3D&quot;${KERNEL_AR}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -C ${STAGIN=
G_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} scripts<br>
+}<br>
+addtask make_scripts after do_compile_kernelmodules<br>
+do_make_scripts[lockfiles] =3D &quot;${TMPDIR}/kernel-scripts.<wbr>lock&qu=
ot;<br>
+<br>
=C2=A0kernel_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # First install the modules<br>
diff --git a/meta/classes/module-base.<wbr>bbclass b/meta/classes/module-ba=
se.<wbr>bbclass<br>
index 6fe77c0..c1fe191 100644<br>
--- a/meta/classes/module-base.<wbr>bbclass<br>
+++ b/meta/classes/module-base.<wbr>bbclass<br>
@@ -1,7 +1,8 @@<br>
=C2=A0inherit kernel-arch<br>
<br>
=C2=A0# This is instead of DEPENDS =3D &quot;virtual/kernel&quot;<br>
-do_configure[depends] +=3D &quot;virtual/kernel:do_compile_<wbr>kernelmodu=
les&quot;<br>
+# do_make_scripts() used to be in here, but is now in kernel.bbclass<br>
+do_configure[depends] +=3D &quot;virtual/kernel:do_make_<wbr>scripts&quot;=
<br>
<br>
=C2=A0export OS =3D &quot;${TARGET_OS}&quot;<br>
=C2=A0export CROSS_COMPILE =3D &quot;${TARGET_PREFIX}&quot;<br>
@@ -18,10 +19,3 @@ KERNEL_OBJECT_SUFFIX =3D &quot;.ko&quot;<br>
=C2=A0# kernel modules are generally machine specific<br>
=C2=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
-# Function to ensure the kernel scripts are created. Expected to<br>
-# be called before do_compile. See module.bbclass for an example.<br>
-do_make_scripts() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0make CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;$=
{KERNEL_LD}&quot; AR=3D&quot;${KERNEL_AR}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -C ${STAGIN=
G_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} scripts<br>
-}<br>
diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass<br>
index 391776d..e344960 100644<br>
--- a/meta/classes/module.bbclass<br>
+++ b/meta/classes/module.bbclass<br>
@@ -1,9 +1,5 @@<br>
=C2=A0inherit module-base kernel-module-split pkgconfig<br>
<br>
-addtask make_scripts after do_prepare_recipe_sysroot before do_compile<br>
-do_make_scripts[lockfiles] =3D &quot;${TMPDIR}/kernel-scripts.<wbr>lock&qu=
ot;<br>
-do_make_scripts[depends] +=3D &quot;virtual/kernel:do_shared_<wbr>workdir&=
quot;<br>
-<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;KERNEL_SRC=3D${STAGING_KERNEL_<wbr>DIR}&quot;=
<br>
<br>
=C2=A0MODULES_INSTALL_TARGET ?=3D &quot;modules_install&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a113fba4ab5832e0554d73742--
