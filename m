Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5BF3671A3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 04:50:09 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id y16so9123856vky.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 21:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=g0UTIWPer/QQ6vdsTFUJa86t3tM/gO2hAYSIHsGy9gw=;
	b=IZ57YQmPVOnb7bvFdCitZM1hnqVYUmh924A5RsAIRUU9J6U9Z/ShBp9BnchnkoP8lD
	IAf6p3EEgxHIcoh8TjjdYl6JagJ36rh/WPh7Wupdh65K3hJ3gra3jCO66E3BjrrlPH95
	D6xMMB6xVBwb8bn5YxbBnHfvOIvEI42Qt/3JLHKtbSltMVpBlKBrASqimLXbrhoyOcCD
	TfqEUleqGzDC8imuA3BfskMKUQMR9KWrpFxIcnQ4lUjB+PPoGNVo1H8IwkugoKUx9IXB
	uo/XCRsysK5sRxllVdV+qb4J1h74ln58dKZQWBvq3tTs6uGbpYxQ+piWIP5dJ/JnIf3w
	9wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=g0UTIWPer/QQ6vdsTFUJa86t3tM/gO2hAYSIHsGy9gw=;
	b=imsbrg/pdKqXtlQmoMaS4LCUbXbolDW0LZM4eDzai1ULOAYGrmUfeIXm4Ieg0fCG1d
	gArgyka+ThyeO7OE5mvp1WEP9CzArQOW4O2P4hYewcDUis1dnPBOnDc8W3fOvij6ZYgi
	d1eauEcyFwYggwsQO1sSuilVw+co2K0zwyJUVnWILQYNW/IppKsURy5M+mHSr4+HWN9R
	pTH8EKcN7UHOT1EuXC1WsezQtI/padpbteolZu8/GQlMjss9DO5z8jWZLiYKniXdFv4c
	aBFdoX31hU071yBrPELka/YH+hZo0iOe3XyHZ4IS5cOrcBPAGKgZ4O8TZ1oUa+aJxaX+
	K+uA==
X-Gm-Message-State: AFeK/H1Xk0QbOS20EdDdrFTeZupZHA+IJh7xOuDDd5CpOkHCtcA79J5afgqFzxcJ80S3elmjGaNAdR1gtyTVRw==
X-Received: by 10.31.198.133 with SMTP id w127mr16010585vkf.115.1490158211139; 
	Tue, 21 Mar 2017 21:50:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.76.218 with HTTP; Tue, 21 Mar 2017 21:50:10 -0700 (PDT)
In-Reply-To: <1490106891-13909-5-git-send-email-liu.ming50@gmail.com>
References: <1490106891-13909-1-git-send-email-liu.ming50@gmail.com>
	<1490106891-13909-5-git-send-email-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 22 Mar 2017 05:50:10 +0100
Message-ID: <CALatG=7f5qLqJqp3zXg9naE5NrKzQOoWwHpgjxRfJr1-6p1Nig@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] kernel-initramfs: add recipe
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
X-List-Received-Date: Wed, 22 Mar 2017 04:50:10 -0000
Content-Type: multipart/alternative; boundary=001a114db432d58fff054b4a7e52

--001a114db432d58fff054b4a7e52
Content-Type: text/plain; charset=UTF-8

This patch needs to be adjusted, please ignore this patch set 3, will send
a V4 soon.

//Ming Liu

2017-03-21 15:34 GMT+01:00 <liu.ming50@gmail.com>:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> To implement initramfs bundled kernel packaging.
>
> The kernel images are copied from DEPLOY_DIR_IMAGE, and a list of
> packages will be generated according to KERNEL_IMAGETYPES setting.
>
> For instance:
> For KERNEL_IMAGETYPES = "bzImage vmlinux"
>
> the generated packages would be:
> - kernel-initramfs (Base package, RDEPENDS on kernel-initramfs-image)
> - kernel-initramfs-image (Image package, RDEPENDS on all sub images)
> - kernel-initramfs-image-bzimage (Contains bzImage image)
> - kernel-initramfs-vmlinux (Contains vmlinux image)
>
> This recipe would be skipped if INITRAMFS_IMAGE_BUNDLE or
> INITRAMFS_IMAGE is not being set correctly.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/recipes-kernel/linux/kernel-initramfs.bb | 100
> ++++++++++++++++++++++++++
>  1 file changed, 100 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb
>
> diff --git a/meta/recipes-kernel/linux/kernel-initramfs.bb
> b/meta/recipes-kernel/linux/kernel-initramfs.bb
> new file mode 100644
> index 0000000..91ea55e
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/kernel-initramfs.bb
> @@ -0,0 +1,100 @@
> +SUMMARY = "Initramfs bundled kernel images"
> +DESCRIPTION = "When built, it packages initramfs bundled kernel images of
> the \
> +preferred virtual/kernel provider."
> +SECTION = "kernel"
> +LICENSE = "GPLv2"
> +
> +inherit linux-kernel-base
> +
> +# Whilst not a module, this ensures we don't get multilib extended.
> (which would make no sense)
> +inherit module-base
> +
> +S = "${STAGING_KERNEL_DIR}"
> +B = "${WORKDIR}/build"
> +
> +# we dont need the default dependencies.
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +KERNEL_ALT_IMAGETYPE ??= ""
> +KERNEL_IMAGETYPES_append = " vmlinux"
> +KERNEL_IMAGETYPE ?= "zImage"
> +KERNEL_IMAGEDEST ?= "boot"
> +KERNEL_VERSION = "${@['1.0.0', get_kernelversion_file('${
> STAGING_KERNEL_BUILDDIR}')][get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}')
> != None]}"
> +KERNEL_PKG_NAME = "${@legitimize_package_name(d.
> getVar('KERNEL_VERSION'))}"
> +KERNEL_PRIORITY ?= "${@int(d.getVar('KERNEL_
> VERSION').split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
> +                       int(d.getVar('KERNEL_VERSION')
> .split('-')[0].split('+')[0].split('.')[1]) * 100 + \
> +                       int(d.getVar('KERNEL_VERSION')
> .split('-')[0].split('+')[0].split('.')[-1])}"
> +
> +PACKAGES = "${PN} ${PN}-image"
> +
> +FILES_${PN} = ""
> +FILES_${PN}-image = ""
> +RDEPENDS_${PN} = "${PN}-image"
> +PKG_${PN} = "${PN}-${KERNEL_PKG_NAME}"
> +PKG_${PN}-image = "${PN}-image-${KERNEL_PKG_NAME}"
> +RPROVIDES_${PN} += "${PN}-${KERNEL_VERSION}"
> +ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY_${PN}-image = "1"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PACKAGES_DYNAMIC = "^kernel-initramfs-image-.*"
> +
> +python __anonymous () {
> +    # Skip processing of this recipe if INITRAMFS_IMAGE or
> INITRAMFS_IMAGE_BUNDLE
> +    # is not set correctly, to avoid generating only empty packages which
> makes
> +    # no sense.
> +    if not d.getVar('INITRAMFS_IMAGE') or d.getVar('INITRAMFS_IMAGE_BUNDLE')
> != '1':
> +        raise bb.parse.SkipPackage("Set INITRAMFS_IMAGE and
> INITRAMFS_IMAGE_BUNDLE to enable it")
> +
> +    # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into
> KERNEL_IMAGETYPES
> +    types = set((d.getVar('KERNEL_IMAGETYPES') or "").split())
> +    types.add(d.getVar('KERNEL_IMAGETYPE') or "")
> +    types.add(d.getVar('KERNEL_ALT_IMAGETYPE') or "")
> +    types = ' '.join(sorted(types)).strip()
> +    d.setVar('KERNEL_IMAGETYPES', types)
> +
> +    for type in types.split():
> +        pn = d.getVar('PN')
> +        imagedest = d.getVar('KERNEL_IMAGEDEST')
> +        if type == "vmlinux":
> +            typelower = type.lower()
> +        else:
> +            typelower = "image-%s" % type.lower()
> +
> +        d.appendVar('PACKAGES', ' %s-%s' % (pn, typelower))
> +        if type != 'vmlinux' or 'vmlinux' in
> (d.getVar('KERNEL_IMAGETYPE') or ""):
> +            d.appendVar('RDEPENDS_%s-image' % pn, ' %s-%s' % (pn,
> typelower))
> +
> +        d.setVar('FILES_%s-%s' % (pn, typelower),
> '/%s/%s-initramfs-${KERNEL_VERSION}' % (imagedest, type))
> +        d.setVar('PKG_%s-%s' % ( pn, typelower),
> '%s-%s-${KERNEL_PKG_NAME}' % (pn, typelower))
> +
> +        priority = d.getVar('KERNEL_PRIORITY')
> +        postinst = '#!/bin/sh\nupdate-alternatives --install
> /%s/%s-initramfs %s-initramfs %s-initramfs-${KERNEL_VERSION} %s || true\n'
> % (imagedest, type, type, type, priority)
> +        d.setVar('pkg_postinst_%s-%s' % (pn, typelower), postinst)
> +
> +        postrm = '#!/bin/sh\nupdate-alternatives --remove %s-initramfs
> %s-initramfs-${KERNEL_VERSION} || true\n' % (type, type)
> +        d.setVar('pkg_postrm_%s-%s' % (pn, typelower), postrm)
> +}
> +
> +# Need the output of deploy.
> +do_install[depends] += "virtual/kernel:do_deploy"
> +
> +# We only need the packaging tasks - disable the rest
> +do_fetch[noexec] = "1"
> +do_unpack[noexec] = "1"
> +do_patch[noexec] = "1"
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +do_populate_sysroot[noexec] = "1"
> +
> +do_install() {
> +       if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =
> x1 ]; then
> +               echo "Copying initramfs bundled kernel images from
> ${DEPLOY_DIR_IMAGE}..."
> +               install -d ${D}/${KERNEL_IMAGEDEST}
> +               for type in ${KERNEL_IMAGETYPES}; do
> +                       echo "Copying initramfs bundled kernel image:
> $type-initramfs-${MACHINE}.bin"
> +                       install -m 0644 ${DEPLOY_DIR_IMAGE}/$type-initramfs-${MACHINE}.bin
> ${D}/${KERNEL_IMAGEDEST}/$type-initramfs-${KERNEL_VERSION}
> +               done
> +       fi
> +}
> --
> 2.7.4
>
>

--001a114db432d58fff054b4a7e52
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch needs to be adjusted, please ignore this patch =
set 3, will send a V4 soon.<div><br></div><div>//Ming Liu</div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-03-21 15:34 GMT+01=
:00  <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascopc=
o.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
<br>
To implement initramfs bundled kernel packaging.<br>
<br>
The kernel images are copied from DEPLOY_DIR_IMAGE, and a list of<br>
packages will be generated according to KERNEL_IMAGETYPES setting.<br>
<br>
For instance:<br>
For KERNEL_IMAGETYPES =3D &quot;bzImage vmlinux&quot;<br>
<br>
the generated packages would be:<br>
- kernel-initramfs (Base package, RDEPENDS on kernel-initramfs-image)<br>
- kernel-initramfs-image (Image package, RDEPENDS on all sub images)<br>
- kernel-initramfs-image-bzimage (Contains bzImage image)<br>
- kernel-initramfs-vmlinux (Contains vmlinux image)<br>
<br>
This recipe would be skipped if INITRAMFS_IMAGE_BUNDLE or<br>
INITRAMFS_IMAGE is not being set correctly.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-initramfs.bb" rel=
=3D"noreferrer" target=3D"_blank">kern<wbr>el-initramfs.bb</a> | 100 ++++++=
++++++++++++++++++++<br>
=C2=A01 file changed, 100 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/linux/<a href=3D"http://kernel=
-initramfs.bb" rel=3D"noreferrer" target=3D"_blank">kern<wbr>el-initramfs.b=
b</a><br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-initramfs.b=
b" rel=3D"noreferrer" target=3D"_blank">ke<wbr>rnel-initramfs.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://kernel-initramfs.bb" rel=3D"norefer=
rer" target=3D"_blank">ke<wbr>rnel-initramfs.bb</a><br>
new file mode 100644<br>
index 0000000..91ea55e<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-initramfs.bb" rel=
=3D"noreferrer" target=3D"_blank">ke<wbr>rnel-initramfs.bb</a><br>
@@ -0,0 +1,100 @@<br>
+SUMMARY =3D &quot;Initramfs bundled kernel images&quot;<br>
+DESCRIPTION =3D &quot;When built, it packages initramfs bundled kernel ima=
ges of the \<br>
+preferred virtual/kernel provider.&quot;<br>
+SECTION =3D &quot;kernel&quot;<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+<br>
+inherit linux-kernel-base<br>
+<br>
+# Whilst not a module, this ensures we don&#39;t get multilib extended. (w=
hich would make no sense)<br>
+inherit module-base<br>
+<br>
+S =3D &quot;${STAGING_KERNEL_DIR}&quot;<br>
+B =3D &quot;${WORKDIR}/build&quot;<br>
+<br>
+# we dont need the default dependencies.<br>
+INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
+<br>
+KERNEL_ALT_IMAGETYPE ??=3D &quot;&quot;<br>
+KERNEL_IMAGETYPES_append =3D &quot; vmlinux&quot;<br>
+KERNEL_IMAGETYPE ?=3D &quot;zImage&quot;<br>
+KERNEL_IMAGEDEST ?=3D &quot;boot&quot;<br>
+KERNEL_VERSION =3D &quot;${@[&#39;1.0.0&#39;, get_kernelversion_file(&#39;=
${<wbr>STAGING_KERNEL_BUILDDIR}&#39;)][<wbr>get_kernelversion_file(&#39;${<=
wbr>STAGING_KERNEL_BUILDDIR}&#39;) !=3D None]}&quot;<br>
+KERNEL_PKG_NAME =3D &quot;${@legitimize_package_name(d.<wbr>getVar(&#39;KE=
RNEL_VERSION&#39;))}&quot;<br>
+KERNEL_PRIORITY ?=3D &quot;${@int(d.getVar(&#39;KERNEL_<wbr>VERSION&#39;).=
split(&#39;-&#39;)[0].split(<wbr>&#39;+&#39;)[0].split(&#39;.&#39;)[0]) * 1=
0000 + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int(d.getVar(&#39;KERNEL_VERSION&#39;)<wbr>.split(&#39;-&#39;)[0]=
.split(&#39;+&#39;)[0].<wbr>split(&#39;.&#39;)[1]) * 100 + \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int(d.getVar(&#39;KERNEL_VERSION&#39;)<wbr>.split(&#39;-&#39;)[0]=
.split(&#39;+&#39;)[0].<wbr>split(&#39;.&#39;)[-1])}&quot;<br>
+<br>
+PACKAGES =3D &quot;${PN} ${PN}-image&quot;<br>
+<br>
+FILES_${PN} =3D &quot;&quot;<br>
+FILES_${PN}-image =3D &quot;&quot;<br>
+RDEPENDS_${PN} =3D &quot;${PN}-image&quot;<br>
+PKG_${PN} =3D &quot;${PN}-${KERNEL_PKG_NAME}&quot;<br>
+PKG_${PN}-image =3D &quot;${PN}-image-${KERNEL_PKG_<wbr>NAME}&quot;<br>
+RPROVIDES_${PN} +=3D &quot;${PN}-${KERNEL_VERSION}&quot;<br>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
+ALLOW_EMPTY_${PN}-image =3D &quot;1&quot;<br>
+<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
+<br>
+PACKAGES_DYNAMIC =3D &quot;^kernel-initramfs-image-.*&quot;<br>
+<br>
+python __anonymous () {<br>
+=C2=A0 =C2=A0 # Skip processing of this recipe if INITRAMFS_IMAGE or INITR=
AMFS_IMAGE_BUNDLE<br>
+=C2=A0 =C2=A0 # is not set correctly, to avoid generating only empty packa=
ges which makes<br>
+=C2=A0 =C2=A0 # no sense.<br>
+=C2=A0 =C2=A0 if not d.getVar(&#39;INITRAMFS_IMAGE&#39;) or d.getVar(&#39;=
INITRAMFS_IMAGE_<wbr>BUNDLE&#39;) !=3D &#39;1&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipPackage(&quot;Set INITRAMFS=
_IMAGE and INITRAMFS_IMAGE_BUNDLE to enable it&quot;)<br>
+<br>
+=C2=A0 =C2=A0 # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNE=
L_IMAGETYPES<br>
+=C2=A0 =C2=A0 types =3D set((d.getVar(&#39;KERNEL_<wbr>IMAGETYPES&#39;) or=
 &quot;&quot;).split())<br>
+=C2=A0 =C2=A0 types.add(d.getVar(&#39;KERNEL_<wbr>IMAGETYPE&#39;) or &quot=
;&quot;)<br>
+=C2=A0 =C2=A0 types.add(d.getVar(&#39;KERNEL_<wbr>ALT_IMAGETYPE&#39;) or &=
quot;&quot;)<br>
+=C2=A0 =C2=A0 types =3D &#39; &#39;.join(sorted(types)).strip()<br>
+=C2=A0 =C2=A0 d.setVar(&#39;KERNEL_IMAGETYPES&#39;, types)<br>
+<br>
+=C2=A0 =C2=A0 for type in types.split():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 imagedest =3D d.getVar(&#39;KERNEL_IMAGEDEST&#=
39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if type =3D=3D &quot;vmlinux&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typelower =3D type.lower()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 typelower =3D &quot;image-%s&quo=
t; % type.lower()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;PACKAGES&#39;, &#39; %s-%s&#3=
9; % (pn, typelower))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if type !=3D &#39;vmlinux&#39; or &#39;vmlinux=
&#39; in (d.getVar(&#39;KERNEL_IMAGETYPE&#39;) or &quot;&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.appendVar(&#39;RDEPENDS_%s-<wb=
r>image&#39; % pn, &#39; %s-%s&#39; % (pn, typelower))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;FILES_%s-%s&#39; % (pn, typelowe=
r), &#39;/%s/%s-initramfs-${KERNEL_<wbr>VERSION}&#39; % (imagedest, type))<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;PKG_%s-%s&#39; % ( pn, typelower=
), &#39;%s-%s-${KERNEL_PKG_NAME}&#39; % (pn, typelower))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 priority =3D d.getVar(&#39;KERNEL_PRIORITY&#39=
;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 postinst =3D &#39;#!/bin/sh\nupdate-<wbr>alter=
natives --install /%s/%s-initramfs %s-initramfs %s-initramfs-${KERNEL_VERSI=
ON} %s || true\n&#39; % (imagedest, type, type, type, priority)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;pkg_postinst_%s-%s&#39; % (pn, t=
ypelower), postinst)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 postrm =3D &#39;#!/bin/sh\nupdate-<wbr>alterna=
tives --remove %s-initramfs %s-initramfs-${KERNEL_VERSION} || true\n&#39; %=
 (type, type)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;pkg_postrm_%s-%s&#39; % (pn, typ=
elower), postrm)<br>
+}<br>
+<br>
+# Need the output of deploy.<br>
+do_install[depends] +=3D &quot;virtual/kernel:do_deploy&quot;<br>
+<br>
+# We only need the packaging tasks - disable the rest<br>
+do_fetch[noexec] =3D &quot;1&quot;<br>
+do_unpack[noexec] =3D &quot;1&quot;<br>
+do_patch[noexec] =3D &quot;1&quot;<br>
+do_configure[noexec] =3D &quot;1&quot;<br>
+do_compile[noexec] =3D &quot;1&quot;<br>
+do_populate_sysroot[noexec] =3D &quot;1&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -z &quot;${INITRAMFS_IMAGE}&quot; -a x&q=
uot;${INITRAMFS_IMAGE_BUNDLE}&quot; =3D x1 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Copying =
initramfs bundled kernel images from ${DEPLOY_DIR_IMAGE}...&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${K=
ERNEL_IMAGEDEST}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for type in ${KERNE=
L_IMAGETYPES}; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0echo &quot;Copying initramfs bundled kernel image: $type-initramf=
s-${MACHINE}.<wbr>bin&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -m 0644 ${DEPLOY_DIR_IMAGE}/$type-<wbr>initramfs-${MACHIN=
E}.bin ${D}/${KERNEL_IMAGEDEST}/$<wbr>type-initramfs-${KERNEL_<wbr>VERSION}=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a114db432d58fff054b4a7e52--
