Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web12.2253.1591688608931596478
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 00:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h7oJa6t5;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id 190so600041vsr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 00:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=460GLEAYaZfnch6Etb2gCzu6CPgASRvx8HzAg7gM++A=;
        b=h7oJa6t5Qvqu2w6k9p3RHOZ+HcsI3Bxcjr1n47KbMLD7pUxZVenaTHoeHKki1+EEO7
         sC3QrenNXL1c2cfuIb9peqh6uQUfQw58ohnDsNG6n5n5qykcVlhDrXrvzhC4tskg95ev
         SW7dcEJKnTdftUHiAFA8cKEUKoBZRkio3qFrgnoN5Ilf9ZVB6agBvo8JcFQZTLUlJPcN
         NSNF6Xk/H8Lpuc0ZpC8TtXhpkVUFkNQ+wMA65U0zZkC30u3A8EDpGMopLhpvYYy3e3kv
         4O7SlwoQxlRXOW5whLjiVgzklRevBhQFfIFxGQmumirAHpqsw2U46zkQ4YvBlpoQ2hkX
         Ggmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=460GLEAYaZfnch6Etb2gCzu6CPgASRvx8HzAg7gM++A=;
        b=sUuBAXHGNjlwIumXMX9ATyVsGwE57QcUTBK1wnJEfpRKzbd4GRW2AcAdJo1kpYtp/i
         Zg7aZUtjm8Ss4YRSiUQQNEvU9P07n3rKy50cz7oGdT7QekUxXviMi9dWkjrsAUmrjQhO
         iHZXqhQn3eAmMzla27fmqFUisExJ1E6ogHtZv//IWtoORr5wDgc2lf9Ad2RAvPdP7t53
         FkWYGBnZsdRsaJ7aXUOneGzh2JQxwx0T5JSQ9bpD6iVsJFsAqGhfWzRFmiydRfnrgBfR
         zXix501DvurqTgytj3QeYxeNWvoA+cWeWOULWqGhBQkHskXZ2Fm4GJ5QY746nYS4DcGM
         NUfg==
X-Gm-Message-State: AOAM53182OQbsub9/iSFoFIKAt6jmH6PQk/iuse/PFWjx5Vvdz7r++cj
	NsgcSLGKGhUXRKOz365fiR4U0PTxWkgDbZ4Ssco=
X-Google-Smtp-Source: ABdhPJxHQzyxtDXbK8/fUEA3AY0IIjgeRHebJa0cxlddtLG+7cn4bMAYyKgXDFZQ/OBZT6kzznyUPzgooPNj2C/nYa8=
X-Received: by 2002:a67:db0b:: with SMTP id z11mr1797257vsj.25.1591688608087;
 Tue, 09 Jun 2020 00:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200609054305.183149-1-arthur.she@linaro.org>
In-Reply-To: <20200609054305.183149-1-arthur.she@linaro.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 9 Jun 2020 09:43:17 +0200
Message-ID: <CANNYZj9ogpHN4g5000sayoSqgCf2pLORYh_sXmGvL2pW_YDegA@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] igt-gpu-tools: add new package
To: Arthur She <arthur.she@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000014101f05a7a1e2e3"

--00000000000014101f05a7a1e2e3
Content-Type: text/plain; charset="UTF-8"

This should be sent to oe-devel list.

Alex

On Tue 9. Jun 2020 at 7.43, Arthur She <arthur.she@linaro.org> wrote:

> igt-gpu-tools is a collection of tools for development and testing of the
> DRM
> drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
>
> Signed-off-by: Arthur She <arthur.she@linaro.org>
> ---
>  .../igt-gpu-tools/igt-gpu-tools_git.bb        | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/igt-gpu-tools/
> igt-gpu-tools_git.bb
>
> diff --git a/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> b/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> new file mode 100644
> index 000000000..761df1cbb
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> @@ -0,0 +1,46 @@
> +SUMMARY = "IGT GPU Tools"
> +DESCRIPTION = "IGT GPU Tools is a collection of tools for development and
> testing of the DRM drivers"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
> +
> +LICENSE_append = " & ISC"
> +
> +inherit meson gtk-doc
> +
> +SRCREV = "${AUTOREV}"
> +
> +SRC_URI = "git://
> gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind kmod
> openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native"
> +RDEPENDS_${PN} += "bash python3-mako python3-six git net-snmp"
> +
> +PACKAGE_BEFORE_PN = "${PN}-benchmarks"
> +
> +EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=enabled"
> +COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
> +COMPATIBLE_HOST_libc-musl_class-target = "null"
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
> +FILES_${PN} += "\
> +        ${libexecdir}/${BPN}/*\
> +        ${libdir}/intel_aubdump.so \
> +        ${datadir}/${BPN}/1080p-right.png \
> +        ${datadir}/${BPN}/1080p-left.png \
> +        ${datadir}/${BPN}/pass.png \
> +        ${datadir}/${BPN}/test-list.txt \
> +        ${libexecdir}/${BPN}/benchmarks \
> +        "
> --
> 2.25.1
>
> 
>

--00000000000014101f05a7a1e2e3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">This should be sent to oe-devel list.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Alex</div></div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 9. Jun 2020 =
at 7.43, Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.org">arthur.she=
@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)">igt-gpu-tools is a co=
llection of tools for development and testing of the DRM<br>
drivers. (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools" rel=
=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/drm/igt-g=
pu-tools</a>)<br>
<br>
Signed-off-by: Arthur She &lt;<a href=3D"mailto:arthur.she@linaro.org" tar=
get=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../igt-gpu-tools/<a href=3D"http://igt-gpu-tools_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">igt-gpu-tools_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 | 46 +++++++++++++++++++<br>
=C2=A01 file changed, 46 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/igt-gpu-tools/<a href=3D=
"http://igt-gpu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-=
tools_git.bb</a><br>
<br>
diff --git a/meta-oe/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-=
gpu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb=
</a> b/meta-oe/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-too=
ls_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a><br=
>
new file mode 100644<br>
index 000000000..761df1cbb<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-too=
ls_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a><br=
>
@@ -0,0 +1,46 @@<br>
+SUMMARY =3D &quot;IGT GPU Tools&quot;<br>
+DESCRIPTION =3D &quot;IGT GPU Tools is a collection of tools for developm=
ent and testing of the DRM drivers&quot;<br>
+<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D67bfee4df38fa6ecbe3a675c5=
52d4c08&quot;<br>
+<br>
+LICENSE_append =3D &quot; &amp; ISC&quot;<br>
+<br>
+inherit meson gtk-doc<br>
+<br>
+SRCREV =3D &quot;${AUTOREV}&quot;<br>
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
+RDEPENDS_${PN} +=3D &quot;bash python3-mako python3-six git net-snmp&quot=
;<br>
+<br>
+PACKAGE_BEFORE_PN =3D &quot;${PN}-benchmarks&quot;<br>
+<br>
+EXTRA_OEMESON =3D &quot;-Ddocs=3Ddisabled -Drunner=3Denabled -Dchamelium=
=3Denabled&quot;<br>
+COMPATIBLE_HOST =3D &quot;(x86_64.*|i.86.*|arm.*|aarch64).*-linux&quot;<b=
r>
+COMPATIBLE_HOST_libc-musl_class-target =3D &quot;null&quot;<br>
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
+FILES_${PN} +=3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libexecdir}/${BPN}/*\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/intel_aubdump.so \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/1080p-right.png \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/1080p-left.png \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/pass.png \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/test-list.txt \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libexecdir}/${BPN}/benchmarks \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000014101f05a7a1e2e3--
