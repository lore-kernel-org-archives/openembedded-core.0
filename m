Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
 by mx.groups.io with SMTP id smtpd.web12.3873.1592282704080117995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 21:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=YUx6tr71;
 spf=pass (domain: linaro.org, ip: 209.85.166.66, mailfrom: arthur.she@linaro.org)
Received: by mail-io1-f66.google.com with SMTP id i25so164321iog.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 21:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RUbWF3xTeaAYQJf1QJRcXe2PbQ97WJt0BZTzBNOlqnk=;
        b=YUx6tr71ezJ+MVXUkDJj7wrFUfOdrUCHo94lM8RREKQHnAB1u23oOXINsxAiej1Hgo
         ut1WYPk8yZReaNOBZ7POQB1v+8XTBCMAU79WALbPl4e6tbMbel/8e9X7wZsf/w6pINIh
         QPZnwmPIALY8hC4IQWRgNCz/SZDZmyGPy9gZHLDxHXrgZL9ZJmZagXnhvY3OYx8A41/v
         ir5E30h06VrXUSMNOHek6xRXUhKMbmtFXwqGilbJhCyXVeIWX/6YycfxPPUrSSMC71qK
         CDWK3b02bhdMjIuqj1Cvgve/S5ZCUi3N6ygjReUD5HLjLyenKCAb47v9aAZViNxAc7h+
         btxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RUbWF3xTeaAYQJf1QJRcXe2PbQ97WJt0BZTzBNOlqnk=;
        b=VHIHqWRXg15SCEGl38DQs6HdvqyZQADKigjWusShi/Rx4B8cGNLIlxooLPjmwRtgXk
         LPwHGlQQWySZfp3/jyEzsKCkUPMPgP3lpMAB/faTfiZmEbA3IBSwlfqbTAuiXF1i17WO
         S5DQAVVaF4xjgbNcQ2rGXhK40qvIb6Bgy7zz9DcxD+eHs6N/hmsvXH0Yk4pZQXlgCF6w
         ApWDGKYNYTEUvRcIw3nAcB8VdDtal77qF9BVCsRWZH/mrsteBKgGLgE2P2tQ+L5qXS6C
         15dLUUeFr69cwXFxOgRMfuLKrhB1gyxv1tzXSCJmFrZVx8lqrlCOhH/cz9gfqZuyoENv
         pAgg==
X-Gm-Message-State: AOAM532qwT3XxIm12mwnsA4nx/iexP6FD/AEshIxWIQaVcAg10oExsgf
	QCFBBe7ckBLOEG/SQFhIcT5AdyJPR4asbqm57kncoQ==
X-Google-Smtp-Source: ABdhPJyuSzJYK8Vzw5csPn3IcbyfEBE8uwMbGdeOcQYE3da2jS2OkaZFW1tRKB3TB1O3zOs5aythRhktVNqzo+gLHmI=
X-Received: by 2002:a02:654a:: with SMTP id u71mr25442626jab.7.1592282703419;
 Mon, 15 Jun 2020 21:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200615060025.171354-1-arthur.she@linaro.org>
 <CANNYZj9RLRjTgB-Qy4Rzx9iWN4PMGzay-XxgZGEei_HC8gEq=w@mail.gmail.com> <20200615075646.GU17660@denix.org>
In-Reply-To: <20200615075646.GU17660@denix.org>
From: "Arthur She" <arthur.she@linaro.org>
Date: Mon, 15 Jun 2020 21:44:52 -0700
Message-ID: <CAJ8hLzH2JMoJ7QspxnjAZ1ZwKshj+REUu=HrE7A2tspu_pH=Zw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] igt-gpu-tools: add new package
To: Denys Dmytriyenko <denis@denix.org>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	"Mittal, Anuj" <anuj.mittal@intel.com>
Content-Type: multipart/alternative; boundary="000000000000eb7ca905a82c34b4"

--000000000000eb7ca905a82c34b4
Content-Type: text/plain; charset="UTF-8"

Hi Alexander and Denys,
Thanks for your feedback.
I have no problem submitting it to meta-oe.
Since the meta-intel maintainer requested to submit it to oe-core, do you
mind sharing some thought about the reason?

Thank you so much,
Arthur

On Mon, Jun 15, 2020 at 12:56 AM Denys Dmytriyenko <denis@denix.org> wrote:

> https://lists.openembedded.org/g/openembedded-devel/topic/74775294
>
> But I tend to agree.
>
> --
> Denys
>
>
> On Mon, Jun 15, 2020 at 09:45:25AM +0200, Alexander Kanavin wrote:
> > This should go to meta-oe, rather than core?
> >
> > Alex
> >
> > On Mon 15. Jun 2020 at 8.00, Arthur She <arthur.she@linaro.org> wrote:
> >
> > > igt-gpu-tools is a collection of tools for development and testing of
> the
> > > DRM
> > > drivers. (https://gitlab.freedesktop.org/drm/igt-gpu-tools)
> > > This recipe is originally copied from meta-intel and added the
> following
> > > modifications
> > > 1. Enable ARM architecture
> > > 2. Enable igt-runner and Chamelium
> > > 3. Build git HEAD code instead of a specific version
> > > The original recipe in the meta-intel will be removed and replaced by
> > > this one once it get merged.
> > >
> > > Signed-off-by: Arthur She <arthur.she@linaro.org>
> > > ---
> > >  .../igt-gpu-tools/igt-gpu-tools_git.bb        | 47
> +++++++++++++++++++
> > >  1 file changed, 47 insertions(+)
> > >  create mode 100644 meta/recipes-graphics/igt-gpu-tools/
> > > igt-gpu-tools_git.bb
> > >
> > > diff --git a/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > > b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > > new file mode 100644
> > > index 0000000000..dc9537c9e3
> > > --- /dev/null
> > > +++ b/meta/recipes-graphics/igt-gpu-tools/igt-gpu-tools_git.bb
> > > @@ -0,0 +1,47 @@
> > > +SUMMARY = "IGT GPU Tools"
> > > +DESCRIPTION = "IGT GPU Tools is a collection of tools for development
> and
> > > testing of the DRM drivers"
> > > +
> > > +LIC_FILES_CHKSUM =
> "file://COPYING;md5=67bfee4df38fa6ecbe3a675c552d4c08"
> > > +
> > > +LICENSE = "MIT"
> > > +
> > > +inherit meson
> > > +
> > > +SRCREV = "d16ad07e7f2a028e14d61f570931c87fa5ce404c"
> > > +PV = "1.25+git${SRCPV}"
> > > +
> > > +SRC_URI = "git://
> > > gitlab.freedesktop.org/drm/igt-gpu-tools.git;protocol=https"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +DEPENDS += "libdrm libpciaccess cairo udev glib-2.0 procps libunwind
> kmod
> > > openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native"
> > > +RDEPENDS_${PN} += "bash"
> > > +RDEPENDS_${PN}-tests += "bash"
> > > +
> > > +PACKAGE_BEFORE_PN = "${PN}-benchmarks ${PN}-tests"
> > > +
> > > +EXTRA_OEMESON = "-Ddocs=disabled -Drunner=enabled -Dchamelium=enabled"
> > > +COMPATIBLE_HOST = "(x86_64.*|i.86.*|arm.*|aarch64).*-linux"
> > > +COMPATIBLE_HOST_libc-musl_class-target = "null"
> > > +SECURITY_LDFLAGS = "${SECURITY_X_LDFLAGS}"
> > > +
> > > +gputools_sysroot_preprocess() {
> > > +       rm -f ${SYSROOT_DESTDIR}${libdir}/pkgconfig/intel-gen4asm.pc
> > > +}
> > > +SYSROOT_PREPROCESS_FUNCS += "gputools_sysroot_preprocess"
> > > +
> > > +do_install_append() {
> > > +    install -d ${D}/usr/share/${BPN}/scripts
> > > +    install ${S}/scripts/run-tests.sh ${D}/usr/share/${BPN}/scripts
> > > +    install -d ${D}/usr/share/${BPN}/runner
> > > +    install -D ${B}/runner/igt_runner ${D}/usr/share/${BPN}/runner
> > > +    install -D ${B}/runner/igt_resume ${D}/usr/share/${BPN}/runner
> > > +}
> > > +
> > > +FILES_${PN}-benchmarks += "${libexecdir}/${BPN}/benchmarks"
> > > +FILES_${PN}-tests += "\
> > > +        ${libexecdir}/${BPN}/*\
> > > +        ${datadir}/${BPN}/1080p-right.png\
> > > +        ${datadir}/${BPN}/1080p-left.png\
> > > +        ${datadir}/${BPN}/pass.png\
> > > +        ${datadir}/${BPN}/test-list.txt"
> > > --
> > > 2.25.1
> > >
> > >
> > >
>
> > 
>
>

--000000000000eb7ca905a82c34b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alexander and Denys,<div>Thanks for your feedback.</div=
><div>I have no problem submitting it to meta-oe.</div><div>Since the meta-=
intel maintainer requested to submit it to oe-core, do you mind sharing som=
e thought about the reason?</div><div><br></div><div>Thank you so much,</di=
v><div>Arthur</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Jun 15, 2020 at 12:56 AM Denys Dmytriyenko &lt;<=
a href=3D"mailto:denis@denix.org">denis@denix.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><a href=3D"https://lists.o=
penembedded.org/g/openembedded-devel/topic/74775294" rel=3D"noreferrer" tar=
get=3D"_blank">https://lists.openembedded.org/g/openembedded-devel/topic/74=
775294</a><br>
<br>
But I tend to agree.<br>
<br>
-- <br>
Denys<br>
<br>
<br>
On Mon, Jun 15, 2020 at 09:45:25AM +0200, Alexander Kanavin wrote:<br>
&gt; This should go to meta-oe, rather than core?<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt; On Mon 15. Jun 2020 at 8.00, Arthur She &lt;<a href=3D"mailto:arthur.=
she@linaro.org" target=3D"_blank">arthur.she@linaro.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; igt-gpu-tools is a collection of tools for development and testi=
ng of the<br>
&gt; &gt; DRM<br>
&gt; &gt; drivers. (<a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-=
tools" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/=
drm/igt-gpu-tools</a>)<br>
&gt; &gt; This recipe is originally copied from meta-intel and added the f=
ollowing<br>
&gt; &gt; modifications<br>
&gt; &gt; 1. Enable ARM architecture<br>
&gt; &gt; 2. Enable igt-runner and Chamelium<br>
&gt; &gt; 3. Build git HEAD code instead of a specific version<br>
&gt; &gt; The original recipe in the meta-intel will be removed and replac=
ed by<br>
&gt; &gt; this one once it get merged.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Arthur She &lt;<a href=3D"mailto:arthur.she@linar=
o.org" target=3D"_blank">arthur.she@linaro.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../igt-gpu-tools/<a href=3D"http://igt-gpu-tools_git.bb" =
rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a>=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 | 47 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 1 file changed, 47 insertions(+)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-graphics/igt-gpu-tools/<br=
>
&gt; &gt; <a href=3D"http://igt-gpu-tools_git.bb" rel=3D"noreferrer" targe=
t=3D"_blank">igt-gpu-tools_git.bb</a><br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http=
://igt-gpu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools=
_git.bb</a><br>
&gt; &gt; b/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-gpu-=
tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb</a>=
<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..dc9537c9e3<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-graphics/igt-gpu-tools/<a href=3D"http://igt-=
gpu-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">igt-gpu-tools_git.bb=
</a><br>
&gt; &gt; @@ -0,0 +1,47 @@<br>
&gt; &gt; +SUMMARY =3D &quot;IGT GPU Tools&quot;<br>
&gt; &gt; +DESCRIPTION =3D &quot;IGT GPU Tools is a collection of tools fo=
r development and<br>
&gt; &gt; testing of the DRM drivers&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D67bfee4df38fa6e=
cbe3a675c552d4c08&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit meson<br>
&gt; &gt; +<br>
&gt; &gt; +SRCREV =3D &quot;d16ad07e7f2a028e14d61f570931c87fa5ce404c&quot;=
<br>
&gt; &gt; +PV =3D &quot;1.25+git${SRCPV}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI =3D &quot;git://<br>
&gt; &gt; <a href=3D"http://gitlab.freedesktop.org/drm/igt-gpu-tools.git;p=
rotocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gitlab.freedesktop.or=
g/drm/igt-gpu-tools.git;protocol=3Dhttps</a>&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +DEPENDS +=3D &quot;libdrm libpciaccess cairo udev glib-2.0 proc=
ps libunwind kmod<br>
&gt; &gt; openssl xmlrpc-c gsl elfutils alsa-lib json-c bison-native&quot;=
<br>
&gt; &gt; +RDEPENDS_${PN} +=3D &quot;bash&quot;<br>
&gt; &gt; +RDEPENDS_${PN}-tests +=3D &quot;bash&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +PACKAGE_BEFORE_PN =3D &quot;${PN}-benchmarks ${PN}-tests&quot;<=
br>
&gt; &gt; +<br>
&gt; &gt; +EXTRA_OEMESON =3D &quot;-Ddocs=3Ddisabled -Drunner=3Denabled -D=
chamelium=3Denabled&quot;<br>
&gt; &gt; +COMPATIBLE_HOST =3D &quot;(x86_64.*|i.86.*|arm.*|aarch64).*-lin=
ux&quot;<br>
&gt; &gt; +COMPATIBLE_HOST_libc-musl_class-target =3D &quot;null&quot;<br>
&gt; &gt; +SECURITY_LDFLAGS =3D &quot;${SECURITY_X_LDFLAGS}&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +gputools_sysroot_preprocess() {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${SYSROOT_DESTDIR}${libdir}/pk=
gconfig/intel-gen4asm.pc<br>
&gt; &gt; +}<br>
&gt; &gt; +SYSROOT_PREPROCESS_FUNCS +=3D &quot;gputools_sysroot_preprocess=
&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +do_install_append() {<br>
&gt; &gt; +=C2=A0 =C2=A0 install -d ${D}/usr/share/${BPN}/scripts<br>
&gt; &gt; +=C2=A0 =C2=A0 install ${S}/scripts/run-tests.sh ${D}/usr/share/=
${BPN}/scripts<br>
&gt; &gt; +=C2=A0 =C2=A0 install -d ${D}/usr/share/${BPN}/runner<br>
&gt; &gt; +=C2=A0 =C2=A0 install -D ${B}/runner/igt_runner ${D}/usr/share/=
${BPN}/runner<br>
&gt; &gt; +=C2=A0 =C2=A0 install -D ${B}/runner/igt_resume ${D}/usr/share/=
${BPN}/runner<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +FILES_${PN}-benchmarks +=3D &quot;${libexecdir}/${BPN}/benchmar=
ks&quot;<br>
&gt; &gt; +FILES_${PN}-tests +=3D &quot;\<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libexecdir}/${BPN}/*\<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/1080p-right.png\<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/1080p-left.png\<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/pass.png\<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${datadir}/${BPN}/test-list.txt&quo=
t;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000eb7ca905a82c34b4--
