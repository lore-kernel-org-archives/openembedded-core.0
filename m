Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web12.12429.1592207137587524692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 00:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eCF16S1J;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id z47so5329870uad.5
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 00:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0MNpWwV/emmd6DA/4QW0lOflZSDtqUT0O+Omqh0+Orw=;
        b=eCF16S1J2LHywlIJVnyeqs0NpcryiOP3mMBEQn+xe96i4puiZc1BkdPLC5WooZqBwB
         ZnC4dEqXBCXceRxiW6YCO6ShNT22Mu6+QoZ8bfQ6BZnBRNHjmPhHlKCJcobvJOkaKueB
         plEqOIH//QfQmtnYl+HXSaUKVXY56tGBmdYncIl0dwl3NVwi6/8iRNrnbC7qBYwLw3ZY
         ZlSfSVNEooKeFDPOT748mvSV2xHeFFaSA6iGFGlpFgHgnaka3ZfNEfWTMJKUB+/9NnwV
         CvrDuPxR1DVgEuzXGZiOrnaQkYRL7XsYRIS2UFIWeugZGeB2cxHvNnujEOM1qEGe3TPW
         /qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0MNpWwV/emmd6DA/4QW0lOflZSDtqUT0O+Omqh0+Orw=;
        b=n0cgdCOfaMDO3b+AJuDrEP4clbbRODu1nkGlo0TzI48PB5fjWs2wgitU25hzELIiUm
         4ZEgssaKMhPJOPRImxEtuwDVHDb2Om9Xc7ATwauZocQr/KRhq5vOsN49C1C7RbpdlVLW
         8lecYI8apQ0cpSUtrF69BGReRengKwsXmXmOgnBPY47r1GcMN3Qrxavxn6DGs+7KHZpD
         Sw+DEk8I1gMqz4XrdB4ZiWlEa/lYpGxsBPiqyZ41M/sTtVUp8MB339sc+RXX4oRAwc1T
         z0jOhy1e1q1+z7MrTWs0wMAClyHT28vuH7KccKetzV+kz/jqrSkLAVXIiBMvrWSDLy7c
         /pFA==
X-Gm-Message-State: AOAM531C1ahuikI4eb3QyjnglkTOVjkGEGuqR2vyPsWmBY/kMV6Y11Ng
	EeEoT+qDaDScW+JQd1uYQ+V1gC4kNISpLcW55ck=
X-Google-Smtp-Source: ABdhPJzd3QGep9WsLLWjnyTIBI71m5k5if5CJo4G6vRta3XevMSrVzoT/dZiPzfyt3sbeCn0QV54xbHtATw7+euHC+Q=
X-Received: by 2002:a9f:3b1c:: with SMTP id i28mr8150694uah.22.1592207136669;
 Mon, 15 Jun 2020 00:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200615060025.171354-1-arthur.she@linaro.org>
In-Reply-To: <20200615060025.171354-1-arthur.she@linaro.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 15 Jun 2020 09:45:25 +0200
Message-ID: <CANNYZj9RLRjTgB-Qy4Rzx9iWN4PMGzay-XxgZGEei_HC8gEq=w@mail.gmail.com>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add new package
To: Arthur She <arthur.she@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ca452205a81a9c14"

--000000000000ca452205a81a9c14
Content-Type: text/plain; charset="UTF-8"

This should go to meta-oe, rather than core?

Alex

On Mon 15. Jun 2020 at 8.00, Arthur She <arthur.she@linaro.org> wrote:

> igt-gpu-tools is a collection of tools for development and testing of the
> DRM
> drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
> This recipe is originally copied from meta-intel and added the following
> modifications
> 1. Enable ARM architecture
> 2. Enable igt-runner and Chamelium
> 3. Build git HEAD code instead of a specific version
> The original recipe in the meta-intel will be removed and replaced by
> this one once it get merged.
>
> Signed-off-by: Arthur She <arthur.she@linaro.org>
> ---
>  .../igt-gpu-tools/igt-gpu-tools_git.bb        | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 meta/recipes-graphics/igt-gpu-tools/
> igt-gpu-tools_git.bb
>
> diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> new file mode 100644
> index 0000000000..dc9537c9e3
> --- /dev/null
> +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> @@ -0,0 +1,47 @@
> +SUMMARY = "IGT GPU Tools"
> +DESCRIPTION = "IGT GPU Tools is a collection of tools for development and
> testing of the DRM drivers"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
> +
> +LICENSE = "MIT"
> +
> +inherit meson
> +
> +SRCREV = "d16ad07e7f2a028e14d61f570931c87fa5ce404c"
> +PV = "1.25+git${SRCPV}"
> +
> +SRC_URI = "git://
> gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod
> openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native"
> +RDEPENDS_${PN} += "bash"
> +RDEPENDS_${PN}-tests += "bash"
> +
> +PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
> +
> +EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=enabled"
> +COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
> +COMPATIBLE_HOST_libc-musl_class-target = "null"
> +SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
> +
> +gputools_sysroot_preprocess() {
> +       rm -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/intel-gen4asm.pc
> +}
> +SYSROOT_PREPROCESS_FUNCS += "gputools_sysroot_preprocess"
> +
> +do_install_append() {
> +    install -d ${D}/usr/share/${BPN}/scripts
> +    install ${S}/scripts/run-tests.sh ${D}/usr/share/${BPN}/scripts
> +    install -d ${D}/usr/share/${BPN}/runner
> +    install -D ${B}/runner/igt_runner ${D}/usr/share/${BPN}/runner
> +    install -D ${B}/runner/igt_resume ${D}/usr/share/${BPN}/runner
> +}
> +
> +FILES_${PN}-benchmarks += "${libexecdir}/${BPN}/benchmarks"
> +FILES_${PN}-tests += "\
> +        ${libexecdir}/${BPN}/*\
> +        ${datadir}/${BPN}/1080p-right.png\
> +        ${datadir}/${BPN}/1080p-left.png\
> +        ${datadir}/${BPN}/pass.png\
> +        ${datadir}/${BPN}/test-list.txt"
> --
> 2.25.1
>
> 
>

--000000000000ca452205a81a9c14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">This should go to meta-oe, rather than core?</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Alex</div></div><div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 15. Jun 2=
020 at 8.00, Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.org">arthur=
.she@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:so=
lid;padding-left:1ex;border-left-color:rgb(204,204,204)">igt-gpu-tools is a=
 collection of tools for development and testing of the DRM<br>
drivers. (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools" rel=
=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/drm/igt-g=
pu-tools</a>)<br>
This recipe is originally copied from meta-intel and added the following<b=
r>
modifications<br>
1. Enable ARM architecture<br>
2. Enable igt-runner and Chamelium<br>
3. Build git HEAD code instead of a specific version<br>
The original recipe in the meta-intel will be removed and replaced by<br>
this one once it get merged.<br>
<br>
Signed-off-by: Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.org" tar=
get=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../igt-gpu-tools/<a href=3D"http://igt-gpu-tools_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">igt-gpu-tools_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 | 47 +++++++++++++++++++<br>
=C2=A01 file changed, 47 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/igt-gpu-tools/<a href=3D"ht=
tp://igt-gpu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-too=
ls_git.bb</a><br>
<br>
diff --git a/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu=
-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a=
> b/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-tools_git=
.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a><br>
new file mode 100644<br>
index 0000000000..dc9537c9e3<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-tools_=
git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a><br>
@@ -0,0 +1,47 @@<br>
+SUMMARY =3D &quot;IGT GPU Tools&quot;<br>
+DESCRIPTION =3D &quot;IGT GPU Tools is a collection of tools for developm=
ent and testing of the DRM drivers&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D67bfee4df38fa6ecbe3a675c5=
52d4c08&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+<br>
+inherit meson<br>
+<br>
+SRCREV =3D &quot;d16ad07e7f2a028e14d61f570931c87fa5ce404c&quot;<br>
+PV =3D &quot;1.25+git${SRCPV}&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/drm/igt-=
gpu-tools.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gitlab=
.freedesktop.org/drm/igt-gpu-tools.git;protocol=3Dhttps</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+DEPENDS +=3D &quot;libdrm libpciaccess cairo udev glib-2.0 procps libunwi=
nd kmod openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native&quot;<br=
>
+RDEPENDS_${PN} +=3D &quot;bash&quot;<br>
+RDEPENDS_${PN}-tests +=3D &quot;bash&quot;<br>
+<br>
+PACKAGE_BEFORE_PN =3D &quot;${PN}-benchmarks ${PN}-tests&quot;<br>
+<br>
+EXTRA_OEMESON =3D &quot;-Ddocs=3Ddisabled -Drunner=3Denabled -Dchamelium=
=3Denabled&quot;<br>
+COMPATIBLE_HOST =3D &quot;(x86_64.*|i.86.*|arm.*|aarch64).*-linux&quot;<b=
r>
+COMPATIBLE_HOST_libc-musl_class-target =3D &quot;null&quot;<br>
+SECURITY_LDFLAGS =3D &quot;${SECURITY_X_LDFLAGS}&quot;<br>
+<br>
+gputools_sysroot_preprocess() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/in=
tel-gen4asm.pc<br>
+}<br>
+SYSROOT_PREPROCESS_FUNCS +=3D &quot;gputools_sysroot_preprocess&quot;<br>
+<br>
+do_install_append() {<br>
+=C2=A0 =C2=A0 install -d ${D}/usr/share/${BPN}/scripts<br>
+=C2=A0 =C2=A0 install ${S}/scripts/run-tests.sh ${D}/usr/share/${BPN}/scr=
ipts<br>
+=C2=A0 =C2=A0 install -d ${D}/usr/share/${BPN}/runner<br>
+=C2=A0 =C2=A0 install -D ${B}/runner/igt_runner ${D}/usr/share/${BPN}/run=
ner<br>
+=C2=A0 =C2=A0 install -D ${B}/runner/igt_resume ${D}/usr/share/${BPN}/run=
ner<br>
+}<br>
+<br>
+FILES_${PN}-benchmarks +=3D &quot;${libexecdir}/${BPN}/benchmarks&quot;<b=
r>
+FILES_${PN}-tests +=3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libexecdir}/${BPN}/*\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/1080p-right.png\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/1080p-left.png\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/pass.png\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/test-list.txt&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000ca452205a81a9c14--
