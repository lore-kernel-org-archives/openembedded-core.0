Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8B1FE776D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 01:10:49 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id h22so26486555lfk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 18:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=y+KhI7rQ64jE3s1tBu25XsgM5epJKj8PPllbLGG8IOE=;
	b=WeQSzVL1m7sIZyqVrcO6GcDJyiG6QPHoSo3RaoI65bSD+MCCWhq1jFdMwKQbPlO3e2
	WCzMg02Y8HYG7qk9qybw+CgZxzQjHDTXAHGST+KobqE+nVGpYkMn6kYsIw86qevTleGu
	LixnAYppdKhNwhhfP6PI9St/ZjCqF1XNikpkj/cIT1eAgz2qJwMxA1OJrM/3RMJ25S5a
	8DB1CHapufRk+iUaOKurtbf/qQVEAb9laCC6nAhk0JEh4j/ztjAU+ZqfVQLE4f6IDGsn
	wZ+1B7HTZS2AjV2bR6QWhcrtPV7b73is7D0XsCXcTJKlIH4PNrlGWzJ1I5j7o0m20hHA
	DU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=y+KhI7rQ64jE3s1tBu25XsgM5epJKj8PPllbLGG8IOE=;
	b=ScgTiEm+py3PRLQxqxqFATwvz6bBDj4A1LBoyGvD8wA8ixm5CpIZNompOmfZxtEPAc
	C306QLgpwUPWaY+BylL1dB5Y6sfmlP/wx1DZdsU6MLPRrW+p3uRtAbCVZJ2nSAbDREYW
	8JZLGYiElRM0vdcQ4UNfa2gRvNl6y0kM224eppytaYdz7Qic8bALoEcysi+/ymXBSlZ5
	2WvKS6t0Ml/aiTL2PdwFQq6N3eP5msCuCKaDACiLjYVe/+tLmVWWI9mdyZvvSAmVK+qR
	b6jDpcbBzvwvClrISu9NdOGxeip9K1cacVWk3CYholq9nAijCBaeE+DeSVBWfj4/jq+q
	+TJw==
X-Gm-Message-State: AKS2vOx6ICMtdXtgaeHVQXLkkMctiwPZIMX3JnxFR/jBw6EnxLGb9iJ1
	IlLCUB9UqWAnt5BDXra/v/87Z8xgAg==
X-Received: by 10.46.22.72 with SMTP id 8mr2439862ljw.126.1498612250533; Tue,
	27 Jun 2017 18:10:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.9.137 with HTTP; Tue, 27 Jun 2017 18:10:50 -0700 (PDT)
In-Reply-To: <83c5936e-f9b9-93c8-ee14-29c0734d813e@ni.com>
References: <20170621120003.6440-1-razvan.heghedus@ni.com>
	<CADkTA4PQB7Yi-UXSg6Y+CePfX+bh08Znmh9t-cMgwOLAJy3fZQ@mail.gmail.com>
	<83c5936e-f9b9-93c8-ee14-29c0734d813e@ni.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Jun 2017 21:10:50 -0400
Message-ID: <CADkTA4P8MjrFk720BzJbSq=_QBqfp8MAFghJXFRzsN4sAeuKAA@mail.gmail.com>
To: Razvan Heghedus <razvan.heghedus@ni.com>
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
X-List-Received-Date: Wed, 28 Jun 2017 01:10:51 -0000
Content-Type: multipart/alternative; boundary="f403045fbdd0d966eb0552fada8d"

--f403045fbdd0d966eb0552fada8d
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 27, 2017 at 4:51 AM, Razvan Heghedus <razvan.heghedus@ni.com>
wrote:

>
>
> On 06/26/2017 06:50 PM, Bruce Ashfield wrote:
>
>
>
> On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan <razvan.heghedus@ni.com>
> wrote:
>
>> Make all dependencies from kernel family packages which depend
>> on another kernel related package to depend on the same version.
>> This creates a consistent state where kernel, kernel images and
>> kernel modules have the same version, making a kernel upgrade
>> leading to upgrades of the image and modules.
>>
>> The upgrade works only if the KERNEL_VERSION_PKG_NAME remains
>> the same for the newer versions.
>>
>> Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com>
>> ---
>>  meta/classes/kernel-module-split.bbclass  |  7 ++++---
>>  meta/classes/kernel.bbclass               | 15 +++++++++------
>>  meta/recipes-kernel/linux/linux-yocto.inc |  4 ++++
>>  3 files changed, 17 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes/kernel-module-split.bbclass
>> b/meta/classes/kernel-module-split.bbclass
>> index 5e10dcf735..e247e66901 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -33,7 +33,7 @@ PACKAGESPLITFUNCS_prepend =
>> "split_kernel_module_packages "
>>  KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>>
>>  KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>> -KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>> +KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION_PKG_NAME}"
>>  KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
>>
>>  python split_kernel_module_packages () {
>> @@ -114,6 +114,7 @@ python split_kernel_module_packages () {
>>              for dep in vals["depends"].split(","):
>>                  on = legitimize_package_name(dep)
>>                  dependency_pkg = format % on
>> +                dependency_pkg += ' ${@get_full_package_version(d)}'
>>                  modinfo_deps.append(dependency_pkg)
>>          for dep in modinfo_deps:
>>              if not dep in rdepends:
>> @@ -138,10 +139,10 @@ python split_kernel_module_packages () {
>>      postinst = d.getVar('pkg_postinst_modules')
>>      postrm = d.getVar('pkg_postrm_modules')
>>
>> -    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules',
>> file_regex=module_regex, output_pattern=module_pattern, description='%s
>> kernel module', postinst=postinst, postrm=postrm, recursive=True,
>> hook=frob_metadata, extra_depends='kernel-%s' %
>> (d.getVar("KERNEL_VERSION")))
>> +    modules = do_split_packages(d, root='${nonarch_base_libdir}/modules',
>> file_regex=module_regex, output_pattern=module_pattern, description='%s
>> kernel module', postinst=postinst, postrm=postrm, recursive=True,
>> hook=frob_metadata, extra_depends='kernel-%s %s' %
>> (d.getVar("KERNEL_VERSION_PKG_NAME"), get_full_package_version(d)))
>>      if modules:
>>          metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>> -        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>> +        d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(['{0}
>> {1}'.format(module, get_full_package_version(d)) for module in modules]))
>>
>>      # If modules-load.d and modprobe.d are empty at this point, remove
>> them to
>>      # avoid warnings. removedirs only raises an OSError if an empty
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 7a134d5c29..605c101e62 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -55,7 +55,7 @@ python __anonymous () {
>>
>>          d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest +
>> '/' + type + '-${KERNEL_VERSION_NAME}')
>>
>> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
>> typelower)
>> +        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' +
>> typelower + ' ${@get_full_package_version(d)}')
>>
>>          d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' +
>> typelower + '-${KERNEL_VERSION_PKG_NAME}')
>>
>> @@ -493,14 +493,17 @@ FILES_kernel-image = ""
>>  FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>> /boot/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules
>> /${KERNEL_VERSION}/build"
>>  FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>>  FILES_kernel-modules = ""
>> -RDEPENDS_kernel = "kernel-base"
>> +RDEPENDS_kernel = "kernel-base ${@get_full_package_version(d)}"
>>
>
> Is that really supposed to be a space, between kernel-base and the package
> version
> call ? I guess so, since I see the same thing below in the
> RDEPENDS_kernel-base
> line below .. but it just reads strange to me.  i.e. if that's a RDEPENDS,
> where is the
> package get_full_package_version(d) created ?
>
> Yes, the space is supposed to be there. If it's inconvenient here, it can
> be moved in the string returned by get_full_package_version()
>
> Are you trying to set a generic versionless RDEPENDS and a versioned one
> that doesn't
> contain 'kernel-' in the name ?
>
>
> This will create a versioned RDEPENDS. The syntax for a versioned package
> is: "package_name (= package_version)". This only append the version to the
> current value.
>

right. I was thinking of package rdepends, but not from the point of view
of a
package manager.

I think it would be better to get it all from the utility function, since
that makes it
clear that it is a constructed value of the form you mentioned.

Also, what if someone doesn't want the versioned depends ? If everything is
in a
routine, they could override to get the behaviour they want.

Out of curiosity .. have you tested this with both rpm and ipk ? I've run
into problems
with versioned depends and ipk in the past, so it would be good to confirm
that this
works consistently.


>
>  # Allow machines to override this dependency if kernel image files are
>>  # not wanted in images as standard
>> -RDEPENDS_kernel-base ?= "kernel-image"
>> -PKG_kernel-image = "kernel-image-${@legitimize_pa
>> ckage_name('${KERNEL_VERSION}')}"
>> +RDEPENDS_kernel-base ?= "kernel-image ${@get_full_package_version(d)}"
>> +PKG_kernel-image = "kernel-image-${KERNEL_VERSION_PKG_NAME}"
>>  RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE',
>> 'vmlinux', 'kernel-vmlinux', '', d)}"
>> -PKG_kernel-base = "kernel-${@legitimize_package_
>> name('${KERNEL_VERSION}')}"
>> -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>> +PKG_kernel-base = "kernel-${KERNEL_VERSION_PKG_NAME}"
>> +RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION_PKG_NAME}"
>> +PKG_kernel-vmlinux = "kernel-vmlinux-${KERNEL_VERSION_PKG_NAME}"
>>
> +PKG_kernel-modules = "kernel-modules-${KERNEL_VERSION_PKG_NAME}"
>> +PKG_kernel-dev = "kernel-dev-${KERNEL_VERSION_PKG_NAME}"
>>  ALLOW_EMPTY_kernel = "1"
>>  ALLOW_EMPTY_kernel-base = "1"
>>  ALLOW_EMPTY_kernel-image = "1"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 637506a2a8..c3d1284ad2 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -67,3 +67,7 @@ do_install_append(){
>>  addtask kernel_version_sanity_check after do_kernel_metadata
>> do_kernel_checkout before do_compile
>>  addtask validate_branches before do_patch after do_kernel_checkout
>>  addtask kernel_configcheck after do_configure before do_compile
>> +
>> +def get_full_package_version(d):
>> +    return "(= " + d.getVar("PKGV") + "-" + d.getVar("PKGR") + ")"
>>
>
> This doesn't belong in linux-yocto.inc, since it is called in
> kernel.bbclass. It needs to be in the base
> class and have a namespace that indicates it is specific to the kernel.
>
> Yeah, you're right, this shouldn't be in linux-yocto.inc. I will move it
> to the base class, but I need some info about namespace thing, because I
> don't recall reading about it in documentations.
>

Nothing fancy here, more convention than something technical. If this is
only working for
the kernel, it should be def kernel_get_full_package_version() so the
context is clear and
if another class/package add something similar, we won't collide.

Bruce


>
> Bruce
>
>
>> +
>> --
>> 2.13.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>
>
> --
>
> Razvan
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--f403045fbdd0d966eb0552fada8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 27, 2017 at 4:51 AM, Razvan Heghedus <span dir=3D"ltr">&lt;=
<a href=3D"mailto:razvan.heghedus@ni.com" target=3D"_blank">razvan.heghedus=
@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"h5">
    <p><br>
    </p>
    <br>
    <div class=3D"m_-2468894063971137113moz-cite-prefix">On 06/26/2017 06:5=
0 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On Wed, Jun 21, 2017 at 8:00 AM,
            Heghedus Razvan <span dir=3D"ltr">&lt;<a href=3D"mailto:razvan.=
heghedus@ni.com" target=3D"_blank">razvan.heghedus@ni.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Make all depe=
ndencies
              from kernel family packages which depend<br>
              on another kernel related package to depend on the same
              version.<br>
              This creates a consistent state where kernel, kernel
              images and<br>
              kernel modules have the same version, making a kernel
              upgrade<br>
              leading to upgrades of the image and modules.<br>
              <br>
              The upgrade works only if the KERNEL_VERSION_PKG_NAME
              remains<br>
              the same for the newer versions.<br>
              <br>
              Signed-off-by: Heghedus Razvan &lt;<a href=3D"mailto:razvan.h=
eghedus@ni.com" target=3D"_blank">razvan.heghedus@ni.com</a>&gt;<br>
              ---<br>
              =C2=A0meta/classes/kernel-module-sp<wbr>lit.bbclass=C2=A0 |=
=C2=A0 7
              ++++---<br>
              =C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 15
              +++++++++------<br>
              =C2=A0meta/recipes-kernel/linux/lin<wbr>ux-yocto.inc |=C2=A0 =
4 ++++<br>
              =C2=A03 files changed, 17 insertions(+), 9 deletions(-)<br>
              <br>
              diff --git a/meta/classes/kernel-module-s<wbr>plit.bbclass
              b/meta/classes/kernel-module-s<wbr>plit.bbclass<br>
              index 5e10dcf735..e247e66901 100644<br>
              --- a/meta/classes/kernel-module-s<wbr>plit.bbclass<br>
              +++ b/meta/classes/kernel-module-s<wbr>plit.bbclass<br>
              @@ -33,7 +33,7 @@ PACKAGESPLITFUNCS_prepend =3D
              &quot;split_kernel_module_packages &quot;<br>
              =C2=A0KERNEL_MODULES_META_PACKAGE ?=3D &quot;kernel-modules&q=
uot;<br>
              <br>
              =C2=A0KERNEL_MODULE_PACKAGE_PREFIX ?=3D &quot;&quot;<br>
              -KERNEL_MODULE_PACKAGE_SUFFIX ?=3D &quot;-${KERNEL_VERSION}&q=
uot;<br>
              +KERNEL_MODULE_PACKAGE_SUFFIX ?=3D
              &quot;-${KERNEL_VERSION_PKG_NAME}&quot;<br>
              =C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D &quot;1&quot;<br>
              <br>
              =C2=A0python split_kernel_module_packages () {<br>
              @@ -114,6 +114,7 @@ python split_kernel_module_packages ()
              {<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in va=
ls[&quot;depends&quot;].split(&quot;,&quot;):<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0on =3D legitimize_package_name(dep)<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0dependency_pkg =3D format % on<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depe=
ndency_pkg +=3D &#39;
              ${@get_full_package_version(d)<wbr>}&#39;<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0modinfo_deps.append(dependenc<wbr>y_pkg)<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for dep in modinfo_deps:<br=
>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not dep in=
 rdepends:<br>
              @@ -138,10 +139,10 @@ python split_kernel_module_packages
              () {<br>
              =C2=A0 =C2=A0 =C2=A0postinst =3D d.getVar(&#39;pkg_postinst_m=
odules<wbr>&#39;)<br>
              =C2=A0 =C2=A0 =C2=A0postrm =3D d.getVar(&#39;pkg_postrm_modul=
es&#39;)<br>
              <br>
              -=C2=A0 =C2=A0 modules =3D do_split_packages(d,
              root=3D&#39;${nonarch_base_libdir}/m<wbr>odules&#39;,
              file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern,
              description=3D&#39;%s kernel module&#39;, postinst=3Dpostinst=
,
              postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata,
              extra_depends=3D&#39;kernel-%s&#39; % (d.getVar(&quot;KERNEL_=
VERSION&quot;)))<br>
              +=C2=A0 =C2=A0 modules =3D do_split_packages(d,
              root=3D&#39;${nonarch_base_libdir}/m<wbr>odules&#39;,
              file_regex=3Dmodule_regex, output_pattern=3Dmodule_pattern,
              description=3D&#39;%s kernel module&#39;, postinst=3Dpostinst=
,
              postrm=3Dpostrm, recursive=3DTrue, hook=3Dfrob_metadata,
              extra_depends=3D&#39;kernel-%s %s&#39; %
              (d.getVar(&quot;KERNEL_VERSION_PKG_<wbr>NAME&quot;),
              get_full_package_version(d)))<br>
              =C2=A0 =C2=A0 =C2=A0if modules:<br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0metapkg =3D d.getVar(&#39;K=
ERNEL_MODULES_META_<wbr>PACKAGE&#39;)<br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; =
+ metapkg, &#39; &#39;+&#39;
              &#39;.join(modules))<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_&#39; =
+ metapkg, &#39; &#39;+&#39;
              &#39;.join([&#39;{0} {1}&#39;.format(module,
              get_full_package_version(d)) for module in modules]))<br>
              <br>
              =C2=A0 =C2=A0 =C2=A0# If modules-load.d and modprobe.d are em=
pty at this
              point, remove them to<br>
              =C2=A0 =C2=A0 =C2=A0# avoid warnings. removedirs only raises =
an OSError
              if an empty<br>
              diff --git a/meta/classes/kernel.bbclass
              b/meta/classes/kernel.bbclass<br>
              index 7a134d5c29..605c101e62 100644<br>
              --- a/meta/classes/kernel.bbclass<br>
              +++ b/meta/classes/kernel.bbclass<br>
              @@ -55,7 +55,7 @@ python __anonymous () {<br>
              <br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;FILES_kernel-=
image-<wbr>&#39; + typelower, &#39;/&#39; +
              imagedest + &#39;/&#39; + type + &#39;-${KERNEL_VERSION_NAME}=
&#39;)<br>
              <br>
              -=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_kernel=
-i<wbr>mage&#39;, &#39; &#39; +
              &#39;kernel-image-&#39; + typelower)<br>
              +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_kernel=
-i<wbr>mage&#39;, &#39; &#39; +
              &#39;kernel-image-&#39; + typelower + &#39;
              ${@get_full_package_version(d)<wbr>}&#39;)<br>
              <br>
              =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVar(&#39;PKG_kernel-im=
age-&#39; + typelower,
              &#39;kernel-image-&#39; + typelower +
              &#39;-${KERNEL_VERSION_PKG_NAME}&#39;)<br>
              <br>
              @@ -493,14 +493,17 @@ FILES_kernel-image =3D &quot;&quot;<br>
              =C2=A0FILES_kernel-dev =3D &quot;/boot/System.map*
              /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}
              ${nonarch_base_libdir}/modules<wbr>/${KERNEL_VERSION}/build&q=
uot;<br>
              =C2=A0FILES_kernel-vmlinux =3D &quot;/boot/vmlinux-${KERNEL_V=
ERSIO<wbr>N_NAME}&quot;<br>
              =C2=A0FILES_kernel-modules =3D &quot;&quot;<br>
              -RDEPENDS_kernel =3D &quot;kernel-base&quot;<br>
              +RDEPENDS_kernel =3D &quot;kernel-base
              ${@get_full_package_version(d)<wbr>}&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>Is that really supposed to be a space, between
              kernel-base and the package version<br>
            </div>
            <div>call ? I guess so, since I see the same thing below in
              the RDEPENDS_kernel-base</div>
            <div>line below .. but it just reads strange to me. =C2=A0i.e. =
if
              that&#39;s a RDEPENDS, where is the</div>
            <div>package get_full_package_version(d) created ?</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote></div></div>
    Yes, the space is supposed to be there. If it&#39;s inconvenient here,
    it can be moved in the string returned by get_full_package_version()<sp=
an class=3D""><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>Are you trying to set a generic versionless RDEPENDS
              and a versioned one that doesn&#39;t</div>
            <div>contain &#39;kernel-&#39; in the name ?</div>
            <div>=C2=A0</div>
          </div>
        </div>
      </div>
    </blockquote></span>
    This will create a versioned RDEPENDS. The syntax for a versioned
    package is: &quot;package_name (=3D package_version)&quot;. This only a=
ppend the
    version to the current value.</div></blockquote><div><br></div><div>rig=
ht. I was thinking of package rdepends, but not from the point of view of a=
</div><div>package manager.</div><div><br></div><div>I think it would be be=
tter to get it all from the utility function, since that makes it</div><div=
>clear that it is a constructed value of the form you mentioned.</div><div>=
<br></div><div>Also, what if someone doesn&#39;t want the versioned depends=
 ? If everything is in a</div><div>routine, they could override to get the =
behaviour they want.</div><div><br></div><div>Out of curiosity .. have you =
tested this with both rpm and ipk ? I&#39;ve run into problems</div><div>wi=
th versioned depends and ipk in the past, so it would be good to confirm th=
at this</div><div>works consistently.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex"><div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=
=3D"h5"><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              =C2=A0# Allow machines to override this dependency if kernel
              image files are<br>
              =C2=A0# not wanted in images as standard<br>
              -RDEPENDS_kernel-base ?=3D &quot;kernel-image&quot;<br>
              -PKG_kernel-image =3D &quot;kernel-image-${@legitimize_pa<wbr=
>ckage_name(&#39;${KERNEL_VERSION}&#39;<wbr>)}&quot;<br>
              +RDEPENDS_kernel-base ?=3D &quot;kernel-image
              ${@get_full_package_version(d)<wbr>}&quot;<br>
              +PKG_kernel-image =3D &quot;kernel-image-${KERNEL_VERSION<wbr=
>_PKG_NAME}&quot;<br>
              =C2=A0RDEPENDS_kernel-image +=3D &quot;${@base_conditional(&#=
39;KERNEL_I<wbr>MAGETYPE&#39;,
              &#39;vmlinux&#39;, &#39;kernel-vmlinux&#39;, &#39;&#39;, d)}&=
quot;<br>
              -PKG_kernel-base =3D &quot;kernel-${@legitimize_package_<wbr>=
name(&#39;${KERNEL_VERSION}&#39;)}&quot;<br>
              -RPROVIDES_kernel-base +=3D &quot;kernel-${KERNEL_VERSION}&qu=
ot;<br>
              +PKG_kernel-base =3D &quot;kernel-${KERNEL_VERSION_PKG_N<wbr>=
AME}&quot;<br>
              +RPROVIDES_kernel-base +=3D &quot;kernel-${KERNEL_VERSION_PKG=
_N<wbr>AME}&quot;<br>
              +PKG_kernel-vmlinux =3D &quot;kernel-vmlinux-${KERNEL_VERSI<w=
br>ON_PKG_NAME}&quot;<br>
            </blockquote>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+PKG_kernel-m=
odules =3D
              &quot;kernel-modules-${KERNEL_VERSI<wbr>ON_PKG_NAME}&quot;<br=
>
              +PKG_kernel-dev =3D &quot;kernel-dev-${KERNEL_VERSION_P<wbr>K=
G_NAME}&quot;<br>
              =C2=A0ALLOW_EMPTY_kernel =3D &quot;1&quot;<br>
              =C2=A0ALLOW_EMPTY_kernel-base =3D &quot;1&quot;<br>
              =C2=A0ALLOW_EMPTY_kernel-image =3D &quot;1&quot;<br>
              diff --git a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc
              b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
              index 637506a2a8..c3d1284ad2 100644<br>
              --- a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
              +++ b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
              @@ -67,3 +67,7 @@ do_install_append(){<br>
              =C2=A0addtask kernel_version_sanity_check after
              do_kernel_metadata do_kernel_checkout before do_compile<br>
              =C2=A0addtask validate_branches before do_patch after
              do_kernel_checkout<br>
              =C2=A0addtask kernel_configcheck after do_configure before
              do_compile<br>
              +<br>
              +def get_full_package_version(d):<br>
              +=C2=A0 =C2=A0 return &quot;(=3D &quot; + d.getVar(&quot;PKGV=
&quot;) + &quot;-&quot; +
              d.getVar(&quot;PKGR&quot;) + &quot;)&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>This doesn&#39;t belong in linux-yocto.inc, since it is
              called in kernel.bbclass. It needs to be in the base</div>
            <div>class and have a namespace that indicates it is
              specific to the kernel.</div>
            <div><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote></div></div>
    Yeah, you&#39;re right, this shouldn&#39;t be in linux-yocto.inc. I wil=
l
    move it to the base class, but I need some info about namespace
    thing, because I don&#39;t recall reading about it in documentations.</=
div></blockquote><div><br></div><div>Nothing fancy here, more convention th=
an something technical. If this is only working for</div><div>the kernel, i=
t should be def kernel_get_full_package_version() so the context is clear a=
nd</div><div>if another class/package add something similar, we won&#39;t c=
ollide.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div text=3D"#000000" bgcolor=3D"#FFFFFF"><span class=3D""=
><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div>Bruce</div>
            <div>=C2=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              +<br>
              <span class=3D"m_-2468894063971137113gmail-HOEnZb"><font colo=
r=3D"#888888">--<br>
                  2.13.1<br>
                  <br>
                  --<br>
                  ______________________________<wbr>_________________<br>
                  Openembedded-core mailing list<br>
                  <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g" target=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                  <a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                </font></span></blockquote>
          </div>
          <br>
          <br clear=3D"all">
          <div><br>
          </div>
          -- <br>
          <div class=3D"m_-2468894063971137113gmail_signature">&quot;Thou s=
halt not follow the NULL
            pointer, for chaos and madness await thee at its end&quot;</div=
>
        </div>
      </div>
    </blockquote>
    <br>
    </span><span class=3D"HOEnZb"><font color=3D"#888888"><pre class=3D"m_-=
2468894063971137113moz-signature" cols=3D"72">--=20

Razvan
</pre>
  </font></span></div>

</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--f403045fbdd0d966eb0552fada8d--
