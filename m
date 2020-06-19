Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web12.623.1592590143251056656
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 11:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=KJ75N8Ac;
 spf=pass (domain: linaro.org, ip: 209.85.166.47, mailfrom: arthur.she@linaro.org)
Received: by mail-io1-f47.google.com with SMTP id i4so9243945iov.11
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ghtfsokdwhafBG+ZG60LEumDRYr3eO94F6eQ9SRjmuw=;
        b=KJ75N8Ac9pwd2BEoDrt6mrVbV/V41cmWj/8yJ3UV2em+UqGImQkexjk91oZN5CwuVt
         STcGGS6cbUAJ84z7e4OtoVNJt9dJKAI6OdkrhzgOAb7a98iQt+IYwigIOVUlGvsm9UOa
         y1YRvA6C1PhlBhYfWB1UdCObDjQ/64Vg746vE1YgJYhYrBY6bvpoMnnIyuFwaMga1Gpt
         rM1bc6t7YEj8cW5OEzXgRato9nigoyOTxNaG9GZZyUoYmPe5Vc6JUaTGXmxiWWyaBKBL
         VAsMKZNrrTOMcgRK7PDbudZkgIHJAjZ0VKLV3VXW1fhS1jwOX30YA2mmzdL4ej8s6LLb
         zS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ghtfsokdwhafBG+ZG60LEumDRYr3eO94F6eQ9SRjmuw=;
        b=OOLmThwuY90D2MMfCGy9M3XDMvajPzYwuyMsEzioSHtMkFFEsIho5U8vF68Tii1Yb3
         mK85PVkK5MI3nIbC4/2Pp5Zx8qHJp3uY7bWKAaDuIBGNaTaceA0VwajetEjyHtmbkUkf
         WzU7hqQGQIam8gsLOQEKvwH1QQnfdYRphiuT7dhMRb+d1cTZRywdprnBCsCP8jS1UGC+
         R9KoeYvYMz+BM35C8qREC8LTGrQI8970tlIl/f/CYUf9t97h3BxFz7HCQbm5/aRKqwN5
         3/4nZyLdRb2SbmSDMyFwwvU0bdRAllHzUOyUTPsuXGRluCc0Jeh8ydeFnk8X2Rr0iTHf
         OeMw==
X-Gm-Message-State: AOAM533ldnWbUNSz1Q8eOwFq6HqyRCq71nPjDmbjQiyHN1O5/L8qCJNd
	kmZhrSpEk8XZnXutfnWH1qHDsRZ6fwVRFR1Vt4x2FA==
X-Google-Smtp-Source: ABdhPJxmO+N4z8aHAiyNA6wMC+L6XvTpnCo5d0mtimeusNW1Xeu0GkyRpO7v7R9TMj0393fiLt9p6Nhgh1aniy2MSks=
X-Received: by 2002:a5e:9318:: with SMTP id k24mr3981402iom.115.1592590142653;
 Fri, 19 Jun 2020 11:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200619021057.18734-1-arthur.she@linaro.org> <CANNYZj_o_GC9B-hJ9XJ=0rG5+iUE-6E79Bahrv9A5ipfHVSrjw@mail.gmail.com>
In-Reply-To: <CANNYZj_o_GC9B-hJ9XJ=0rG5+iUE-6E79Bahrv9A5ipfHVSrjw@mail.gmail.com>
From: "Arthur She" <arthur.she@linaro.org>
Date: Fri, 19 Jun 2020 11:08:51 -0700
Message-ID: <CAJ8hLzH7T8PgUkBr74ZSmd0wHKaPvKUNpSa4Lja3egZSkuBRQQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] igt-gpu-tools: add new package
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b9d81905a873c987"

--000000000000b9d81905a873c987
Content-Type: text/plain; charset="UTF-8"

Hi Alex,
Since Anuj is the original maintainer, I'll put his name on it.

Thanks,
Arthur

On Fri, Jun 19, 2020 at 1:15 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> You also need to add a maintainers.inc entry (this will be used by auto
> upgrade helper to send version upgrade patches or reminders to upgrade).
>
> Alex
>
> On Fri, 19 Jun 2020 at 04:11, Arthur She <arthur.she@linaro.org> wrote:
>
>> igt-gpu-tools is a collection of tools for development and testing of the
>> DRM
>> drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
>> This recipe is originally copied from meta-intel and added the following
>> modifications
>> 1. Enable ARM architecture
>> 2. Enable igt-runner and Chamelium
>> 3. Build git HEAD code instead of a specific version
>> The original recipe in the meta-intel will be removed and replaced by
>> this one to avoid having a duplicate recipe.
>> It is applicable to be submitted to oe-core, because it provides
>> a core validation functionality that is needed by all providing DRM
>> drivers and not just to a single arch.
>>
>> Signed-off-by: Arthur She <arthur.she@linaro.org>
>> ---
>>  .../igt-gpu-tools/igt-gpu-tools_git.bb        | 47 +++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 meta/recipes-graphics/igt-gpu-tools/
>> igt-gpu-tools_git.bb
>>
>> diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
>> b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
>> new file mode 100644
>> index 0000000000..dc9537c9e3
>> --- /dev/null
>> +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
>> @@ -0,0 +1,47 @@
>> +SUMMARY = "IGT GPU Tools"
>> +DESCRIPTION = "IGT GPU Tools is a collection of tools for development
>> and testing of the DRM drivers"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
>> +
>> +LICENSE = "MIT"
>> +
>> +inherit meson
>> +
>> +SRCREV = "d16ad07e7f2a028e14d61f570931c87fa5ce404c"
>> +PV = "1.25+git${SRCPV}"
>> +
>> +SRC_URI = "git://
>> gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind
>> kmod openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native"
>> +RDEPENDS_${PN} += "bash"
>> +RDEPENDS_${PN}-tests += "bash"
>> +
>> +PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
>> +
>> +EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=enabled"
>> +COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
>> +COMPATIBLE_HOST_libc-musl_class-target = "null"
>> +SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
>> +
>> +gputools_sysroot_preprocess() {
>> +       rm -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/intel-gen4asm.pc
>> +}
>> +SYSROOT_PREPROCESS_FUNCS += "gputools_sysroot_preprocess"
>> +
>> +do_install_append() {
>> +    install -d ${D}/usr/share/${BPN}/scripts
>> +    install ${S}/scripts/run-tests.sh ${D}/usr/share/${BPN}/scripts
>> +    install -d ${D}/usr/share/${BPN}/runner
>> +    install -D ${B}/runner/igt_runner ${D}/usr/share/${BPN}/runner
>> +    install -D ${B}/runner/igt_resume ${D}/usr/share/${BPN}/runner
>> +}
>> +
>> +FILES_${PN}-benchmarks += "${libexecdir}/${BPN}/benchmarks"
>> +FILES_${PN}-tests += "\
>> +        ${libexecdir}/${BPN}/*\
>> +        ${datadir}/${BPN}/1080p-right.png\
>> +        ${datadir}/${BPN}/1080p-left.png\
>> +        ${datadir}/${BPN}/pass.png\
>> +        ${datadir}/${BPN}/test-list.txt"
>> --
>> 2.25.1
>>
>> 
>>
>

--000000000000b9d81905a873c987
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div>Since Anuj is the original maintainer, I&#39;=
ll put his name on it.<br></div><div><br></div><div>Thanks,</div><div>Arthu=
r</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Jun 19, 2020 at 1:15 AM Alexander Kanavin &lt;<a href=3D"mai=
lto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>You=
 also need to add a maintainers.inc entry (this will be used by auto upgrad=
e helper to send version upgrade patches or reminders to upgrade).</div><di=
v><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, 19 Jun 2020 at 04:11, Arthur She &lt=
;<a href=3D"mailto:arthur.she@linaro.org" target=3D"_blank">arthur.she@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">igt-gpu-tools is a collection of tools for development and testing of=
 the DRM<br>
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
this one to avoid having a duplicate recipe.<br>
It is applicable to be submitted to oe-core, because it provides<br>
a core validation functionality that is needed by all providing DRM<br>
drivers and not just to a single arch.<br>
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
</blockquote></div>
</blockquote></div>

--000000000000b9d81905a873c987--
