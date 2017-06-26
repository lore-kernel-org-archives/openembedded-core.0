Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 27BB977E9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:50:54 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id t72so493238lff.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A6aDPm8/ufCJLx+dSTVCEwp+ak+YYgxbUEW1MLC+ODw=;
	b=fUUNYBsoiVL9PIA8olUZtfEPzMamdtNvGgd8IC+MdjvP5LCE8wUBMBySGgStdVv43L
	3xDS/R3yeZBsvRBipted3REm/DcuPLqiTl2+8Y77tD3Km1B0i4ni0OJpySUKyZNKd35f
	rUNms2DgwZuN5bYhkNc39ZI55Z+hmvegvmo+2nPdv21G8N1RRkvLzklIjMv3oQuueWxb
	LT80qE8edFGQh/BzfJX7QGf0CbkbpkSfxYRLY1WQ8R2Mg+8rNyKGq+NGD7oP4CzsM4Al
	FOheBZhlT+EyDKybrQLxa/U1lyZBdzv0EKxwoBXQhewQyGOqL/h+liwUZEp6AdnqsQec
	U5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A6aDPm8/ufCJLx+dSTVCEwp+ak+YYgxbUEW1MLC+ODw=;
	b=X1Bqpw3rZX9rNpRkIRnqxblzhXSMoqYSyXuI92Ef01oo/iSBNbvJaMhNEKJd2uLVhe
	+PA0+nguRKMu5yKimb9BObrrC987DK2X/C0ZM2FEATJsZA3Iej73Crw17ovtOx4ZtWzb
	PtTR13T8CH2mKxe2DfuJaGlLdkCtgHP9lmbQgsfFIJABPVf9+8+ouvyEl/y82tHyzVSx
	X4o9Swbt9y9O59diFtYOcZHvz2Fb9vBVHvDUwozUM1ZOlv5L4ITgQXCNfkITKdA0j6P7
	4n9MvlJjZ6tWQ7uX0PTWGXuvHZJapIrKRtXI0InlgqCWoAx6Z4GAfxShFtyazfUYFHrO
	TFKA==
X-Gm-Message-State: AKS2vOyRIRKhUd+u4rkQccY7UDFawKOJKJUNbBDjn2zSUcUzFMdR6MLg
	sncKXyHbKACY0iALdniG/BoKtug6ow==
X-Received: by 10.25.213.129 with SMTP id m123mr259874lfg.28.1498492255444;
	Mon, 26 Jun 2017 08:50:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Mon, 26 Jun 2017 08:50:54 -0700 (PDT)
In-Reply-To: <20170621120003.6440-1-razvan.heghedus@ni.com>
References: <20170621120003.6440-1-razvan.heghedus@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 26 Jun 2017 11:50:54 -0400
Message-ID: <CADkTA4PQB7Yi-UXSg6Y+CePfX+bh08Znmh9t-cMgwOLAJy3fZQ@mail.gmail.com>
To: Heghedus Razvan <razvan.heghedus@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel: add package version in dependencies for kernel packages
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
X-List-Received-Date: Mon, 26 Jun 2017 15:50:55 -0000
Content-Type: multipart/alternative; boundary="001a1142038095b1320552deea41"

--001a1142038095b1320552deea41
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan <razvan.heghedus@ni.com>
wrote:

> Make all dependencies from kernel family packages which depend
> on another kernel related package to depend on the same version.
> This creates a consistent state where kernel, kernel images and
> kernel modules have the same version, making a kernel upgrade
> leading to upgrades of the image and modules.
>
> The upgrade works only if the KERNEL_VERSION_PKG_NAME remains
> the same for the newer versions.
>
> Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com>
> ---
>  meta/classes/kernel-module-split.bbclass  |  7 ++++---
>  meta/classes/kernel.bbclass               | 15 +++++++++------
>  meta/recipes-kernel/linux/linux-yocto.inc |  4 ++++
>  3 files changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/kernel-module-split.bbclass
> b/meta/classes/kernel-module-split.bbclass
> index 5e10dcf735..e247e66901 100644
> --- a/meta/classes/kernel-module-split.bbclass
> +++ b/meta/classes/kernel-module-split.bbclass
> @@ -33,7 +33,7 @@ PACKAGESPLITFUNCS_prepend =
> "split_kernel_module_packages "
>  KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>
>  KERNEL_MODULE_PACKAGE_PREFIX ?= ""
> -KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
> +KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION_PKG_NAME}"
>  KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
>
>  python split_kernel_module_packages () {
> @@ -114,6 +114,7 @@ python split_kernel_module_packages () {
>              for dep in vals["depends"].split(","):
>                  on = legitimize_package_name(dep)
>                  dependency_pkg = format % on
> +                dependency_pkg += ' ${@get_full_package_version(d)}'
>                  modinfo_deps.append(dependency_pkg)
>          for dep in modinfo_deps:
>              if not dep in rdepends:
> @@ -138,10 +139,10 @@ python split_kernel_module_packages () {
>      postinst = d.getVar('pkg_postinst_modules')
>      postrm = d.getVar('pkg_postrm_modules')
>
> -    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules',
> file_regex=module_regex, output_pattern=module_pattern, description='%s
> kernel module', postinst=postinst, postrm=postrm, recursive=True,
> hook=frob_metadata, extra_depends='kernel-%s' %
> (d.getVar("KERNEL_VERSION")))
> +    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules',
> file_regex=module_regex, output_pattern=module_pattern, description='%s
> kernel module', postinst=postinst, postrm=postrm, recursive=True,
> hook=frob_metadata, extra_depends='kernel-%s %s' %
> (d.getVar("KERNEL_VERSION_PKG_NAME"), get_full_package_version(d)))
>      if modules:
>          metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
> -        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> +        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(['{0}
> {1}'.format(module, get_full_package_version(d)) for module in modules]))
>
>      # If modules-load.d and modprobe.d are empty at this point, remove
> them to
>      # avoid warnings. removedirs only raises an OSError if an empty
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 7a134d5c29..605c101e62 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -55,7 +55,7 @@ python __anonymous () {
>
>          d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/'
> + type + '-${KERNEL_VERSION_NAME}')
>
> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
> typelower)
> +        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
> typelower + ' ${@get_full_package_version(d)}')
>
>          d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' +
> typelower + '-${KERNEL_VERSION_PKG_NAME}')
>
> @@ -493,14 +493,17 @@ FILES_kernel-image = ""
>  FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*
> ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>  FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>  FILES_kernel-modules = ""
> -RDEPENDS_kernel = "kernel-base"
> +RDEPENDS_kernel = "kernel-base ${@get_full_package_version(d)}"
>

Is that really supposed to be a space, between kernel-base and the package
version
call ? I guess so, since I see the same thing below in the
RDEPENDS_kernel-base
line below .. but it just reads strange to me.  i.e. if that's a RDEPENDS,
where is the
package get_full_package_version(d) created ?

Are you trying to set a generic versionless RDEPENDS and a versioned one
that doesn't
contain 'kernel-' in the name ?


>  # Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
> -RDEPENDS_kernel-base ?= "kernel-image"
> -PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_
> VERSION}')}"
> +RDEPENDS_kernel-base ?= "kernel-image ${@get_full_package_version(d)}"
> +PKG_kernel-image = "kernel-image-${KERNEL_VERSION_PKG_NAME}"
>  RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE',
> 'vmlinux', 'kernel-vmlinux', '', d)}"
> -PKG_kernel-base = "kernel-${@legitimize_package_
> name('${KERNEL_VERSION}')}"
> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
> +PKG_kernel-base = "kernel-${KERNEL_VERSION_PKG_NAME}"
> +RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION_PKG_NAME}"
> +PKG_kernel-vmlinux = "kernel-vmlinux-${KERNEL_VERSION_PKG_NAME}"
>
+PKG_kernel-modules = "kernel-modules-${KERNEL_VERSION_PKG_NAME}"
> +PKG_kernel-dev = "kernel-dev-${KERNEL_VERSION_PKG_NAME}"
>  ALLOW_EMPTY_kernel = "1"
>  ALLOW_EMPTY_kernel-base = "1"
>  ALLOW_EMPTY_kernel-image = "1"
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index 637506a2a8..c3d1284ad2 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -67,3 +67,7 @@ do_install_append(){
>  addtask kernel_version_sanity_check after do_kernel_metadata
> do_kernel_checkout before do_compile
>  addtask validate_branches before do_patch after do_kernel_checkout
>  addtask kernel_configcheck after do_configure before do_compile
> +
> +def get_full_package_version(d):
> +    return "(= " + d.getVar("PKGV") + "-" + d.getVar("PKGR") + ")"
>

This doesn't belong in linux-yocto.inc, since it is called in
kernel.bbclass. It needs to be in the base
class and have a namespace that indicates it is specific to the kernel.

Bruce


> +
> --
> 2.13.1
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

--001a1142038095b1320552deea41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan <span dir=3D"ltr">&lt;=
<a href=3D"mailto:razvan.heghedus@ni.com" target=3D"_blank">razvan.heghedus=
@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Make all dependencies from kernel family packages which depend<br>
on another kernel related package to depend on the same version.<br>
This creates a consistent state where kernel, kernel images and<br>
kernel modules have the same version, making a kernel upgrade<br>
leading to upgrades of the image and modules.<br>
<br>
The upgrade works only if the KERNEL_VERSION_PKG_NAME remains<br>
the same for the newer versions.<br>
<br>
Signed-off-by: Heghedus Razvan &lt;<a href=3D"mailto:razvan.heghedus@ni.com=
">razvan.heghedus@ni.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel-module-<wbr>split.bbclass=C2=A0 |=C2=A0 7 ++++---=
<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 15 +++++++++------<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto.inc |=C2=A0 4 ++++<br>
=C2=A03 files changed, 17 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel-module-<wbr>split.bbclass b/meta/classes/k=
ernel-module-<wbr>split.bbclass<br>
index 5e10dcf735..e247e66901 100644<br>
--- a/meta/classes/kernel-module-<wbr>split.bbclass<br>
+++ b/meta/classes/kernel-module-<wbr>split.bbclass<br>
@@ -33,7 +33,7 @@ PACKAGESPLITFUNCS_prepend =3D &quot;split_kernel_module_p=
ackages &quot;<br>
=C2=A0KERNEL_MODULES_META_PACKAGE ?=3D &quot;kernel-modules&quot;<br>
<br>
=C2=A0KERNEL_MODULE_PACKAGE_PREFIX ?=3D &quot;&quot;<br>
-KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL_VERSION}&quot;<br>
+KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL_VERSION_PKG_NAME}&quot;<=
br>
=C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quot;1&quot;<br>
<br>
=C2=A0python split_kernel_module_packages () {<br>
@@ -114,6 +114,7 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in vals[&quot;depen=
ds&quot;].split(&quot;,&quot;):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0on =3D legiti=
mize_package_name(dep)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependency_pk=
g =3D format % on<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependency_pkg +=
=3D &#39; ${@get_full_package_version(d)<wbr>}&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modinfo_deps.=
append(<wbr>dependency_pkg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in modinfo_deps:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not dep in rdepends:<br>
@@ -138,10 +139,10 @@ python split_kernel_module_packages () {<br>
=C2=A0 =C2=A0 =C2=A0postinst =3D d.getVar(&#39;pkg_postinst_<wbr>modules&#3=
9;)<br>
=C2=A0 =C2=A0 =C2=A0postrm =3D d.getVar(&#39;pkg_postrm_modules&#39;)<br>
<br>
-=C2=A0 =C2=A0 modules =3D do_split_packages(d, root=3D&#39;${nonarch_base_=
libdir}/<wbr>modules&#39;, file_regex=3Dmodule_regex, output_pattern=3Dmodu=
le_pattern, description=3D&#39;%s kernel module&#39;, postinst=3Dpostinst, =
postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata, extra_depends=3D&#=
39;kernel-%s&#39; % (d.getVar(&quot;KERNEL_VERSION&quot;)))<br>
+=C2=A0 =C2=A0 modules =3D do_split_packages(d, root=3D&#39;${nonarch_base_=
libdir}/<wbr>modules&#39;, file_regex=3Dmodule_regex, output_pattern=3Dmodu=
le_pattern, description=3D&#39;%s kernel module&#39;, postinst=3Dpostinst, =
postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata, extra_depends=3D&#=
39;kernel-%s %s&#39; % (d.getVar(&quot;KERNEL_VERSION_PKG_<wbr>NAME&quot;),=
 get_full_package_version(d)))<br>
=C2=A0 =C2=A0 =C2=A0if modules:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0metapkg =3D d.getVar(&#39;KERNEL_MODULES_=
META_<wbr>PACKAGE&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; + metapkg, &#3=
9; &#39;+&#39; &#39;.join(modules))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; + metapkg, &#3=
9; &#39;+&#39; &#39;.join([&#39;{0} {1}&#39;.format(module, get_full_packag=
e_version(d)) for module in modules]))<br>
<br>
=C2=A0 =C2=A0 =C2=A0# If modules-load.d and modprobe.d are empty at this po=
int, remove them to<br>
=C2=A0 =C2=A0 =C2=A0# avoid warnings. removedirs only raises an OSError if =
an empty<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 7a134d5c29..605c101e62 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -55,7 +55,7 @@ python __anonymous () {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;FILES_kernel-image-&#39; + =
typelower, &#39;/&#39; + imagedest + &#39;/&#39; + type + &#39;-${KERNEL_VE=
RSION_NAME}&#39;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_kernel-<wbr>image&#3=
9;, &#39; &#39; + &#39;kernel-image-&#39; + typelower)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_kernel-<wbr>image&#3=
9;, &#39; &#39; + &#39;kernel-image-&#39; + typelower + &#39; ${@get_full_p=
ackage_version(d)<wbr>}&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;PKG_kernel-image-&#39; + ty=
pelower, &#39;kernel-image-&#39; + typelower + &#39;-${KERNEL_VERSION_PKG_N=
AME}&#39;)<br>
<br>
@@ -493,14 +493,17 @@ FILES_kernel-image =3D &quot;&quot;<br>
=C2=A0FILES_kernel-dev =3D &quot;/boot/System.map* /boot/Module.symvers* /b=
oot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/<wbr>modules/${KERNEL=
_VERSION}/<wbr>build&quot;<br>
=C2=A0FILES_kernel-vmlinux =3D &quot;/boot/vmlinux-${KERNEL_<wbr>VERSION_NA=
ME}&quot;<br>
=C2=A0FILES_kernel-modules =3D &quot;&quot;<br>
-RDEPENDS_kernel =3D &quot;kernel-base&quot;<br>
+RDEPENDS_kernel =3D &quot;kernel-base ${@get_full_package_version(d)<wbr>}=
&quot;<br></blockquote><div><br></div><div>Is that really supposed to be a =
space, between kernel-base and the package version<br></div><div>call ? I g=
uess so, since I see the same thing below in the RDEPENDS_kernel-base</div>=
<div>line below .. but it just reads strange to me. =C2=A0i.e. if that&#39;=
s a RDEPENDS, where is the</div><div>package get_full_package_version(d) cr=
eated ?</div><div><br></div><div>Are you trying to set a generic versionles=
s RDEPENDS and a versioned one that doesn&#39;t</div><div>contain &#39;kern=
el-&#39; in the name ?</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
=C2=A0# Allow machines to override this dependency if kernel image files ar=
e<br>
=C2=A0# not wanted in images as standard<br>
-RDEPENDS_kernel-base ?=3D &quot;kernel-image&quot;<br>
-PKG_kernel-image =3D &quot;kernel-image-${@legitimize_<wbr>package_name(&#=
39;${KERNEL_<wbr>VERSION}&#39;)}&quot;<br>
+RDEPENDS_kernel-base ?=3D &quot;kernel-image ${@get_full_package_version(d=
)<wbr>}&quot;<br>
+PKG_kernel-image =3D &quot;kernel-image-${KERNEL_<wbr>VERSION_PKG_NAME}&qu=
ot;<br>
=C2=A0RDEPENDS_kernel-image +=3D &quot;${@base_conditional(&#39;KERNEL_<wbr=
>IMAGETYPE&#39;, &#39;vmlinux&#39;, &#39;kernel-vmlinux&#39;, &#39;&#39;, d=
)}&quot;<br>
-PKG_kernel-base =3D &quot;kernel-${@legitimize_package_<wbr>name(&#39;${KE=
RNEL_VERSION}&#39;)}&quot;<br>
-RPROVIDES_kernel-base +=3D &quot;kernel-${KERNEL_VERSION}&quot;<br>
+PKG_kernel-base =3D &quot;kernel-${KERNEL_VERSION_PKG_<wbr>NAME}&quot;<br>
+RPROVIDES_kernel-base +=3D &quot;kernel-${KERNEL_VERSION_PKG_<wbr>NAME}&qu=
ot;<br>
+PKG_kernel-vmlinux =3D &quot;kernel-vmlinux-${KERNEL_<wbr>VERSION_PKG_NAME=
}&quot;<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=
PKG_kernel-modules =3D &quot;kernel-modules-${KERNEL_<wbr>VERSION_PKG_NAME}=
&quot;<br>
+PKG_kernel-dev =3D &quot;kernel-dev-${KERNEL_VERSION_<wbr>PKG_NAME}&quot;<=
br>
=C2=A0ALLOW_EMPTY_kernel =3D &quot;1&quot;<br>
=C2=A0ALLOW_EMPTY_kernel-base =3D &quot;1&quot;<br>
=C2=A0ALLOW_EMPTY_kernel-image =3D &quot;1&quot;<br>
diff --git a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc b/meta/recipes-=
kernel/linux/<wbr>linux-yocto.inc<br>
index 637506a2a8..c3d1284ad2 100644<br>
--- a/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/<wbr>linux-yocto.inc<br>
@@ -67,3 +67,7 @@ do_install_append(){<br>
=C2=A0addtask kernel_version_sanity_check after do_kernel_metadata do_kerne=
l_checkout before do_compile<br>
=C2=A0addtask validate_branches before do_patch after do_kernel_checkout<br=
>
=C2=A0addtask kernel_configcheck after do_configure before do_compile<br>
+<br>
+def get_full_package_version(d):<br>
+=C2=A0 =C2=A0 return &quot;(=3D &quot; + d.getVar(&quot;PKGV&quot;) + &quo=
t;-&quot; + d.getVar(&quot;PKGR&quot;) + &quot;)&quot;<br></blockquote><div=
><br></div><div>This doesn&#39;t belong in linux-yocto.inc, since it is cal=
led in kernel.bbclass. It needs to be in the base</div><div>class and have =
a namespace that indicates it is specific to the kernel.</div><div><br></di=
v><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.13.1<br>
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
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a1142038095b1320552deea41--
