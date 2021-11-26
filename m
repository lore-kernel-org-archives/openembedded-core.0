Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4168C433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 16:08:04 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.25470.1637942883724645790
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 08:08:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MpzAHhS+;
 spf=pass (domain: gmail.com, ip: 209.85.166.172,
 mailfrom: ticotimo@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id a11so9243795ilj.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 08:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fgJzuSmAf630djh28FqQlzg5gsREZhFwnn50ZBmgyic=;
        b=MpzAHhS+BlUbs/aOUlyeKSfN2Qowz/ET2Yn5OJxqLn0jqh2e3SI1zEZZKp5QRxaozP
         a5LQe/LiCnEmfUIrRnt6SRqY9QR62Hzl9Lxp6LoelhvHtq+jC7zL5E974902sv6b5+VG
         JUiz4HByUPfVxcPe3TWI9kM48xiMfCYb0u51txVzgtnhNT6vp3dbNa3mK8OwBTC3jtec
         Dl/zew86SBrryiz67qbjrJlzlhcq/bAFSsVAQVYcdFYXIXO2RABfalXQ0ZO7gMCrmSz+
         dxS8BF3IZAXwbHOMnENysBuUbo4r3J7gds1ePVXMRh/N80DwXCuG77FhaoT78pCJKRq8
         bw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fgJzuSmAf630djh28FqQlzg5gsREZhFwnn50ZBmgyic=;
        b=qmv//1F73bAjNARW18nikDdAPlOxevF7k9AenqRh8cvdYQxqttdofizneCfGysgDol
         qIycdhRERsqLPXf7Je5fQT+b2xQDMLlD6J5vKHJC2xzaYjlYtBjg6BXFU7A/ViAC+qMQ
         mqOBuTGvhZA+sFyUPdRScJTHuqYtu6Ph5YMVy7Sa7Z4aam2xBpqWez9dJbE/BGlfQEOW
         NG64eiHekz9Q8SHFOsh4IuX2sUHjfAd153stacjJa4t0tSv7TrHmH7handJO2Cq0FvBS
         FRNfN+wn58sI01z6U4/acNPfm3Q3UpBker/5hlqscyHJB20vFkoBEHNoQi3VkNmcKQky
         PoDw==
X-Gm-Message-State: AOAM53367kqbD8ajykJycHacI5V7jP5Vr2Tp9H8UOyOZ55d7q3w2Ywco
	2WKGIe+5LrtyjW75IDWmhUMWEGBXCcZjtXRvu40=
X-Google-Smtp-Source: 
 ABdhPJztO2jBaaPcC2Ab+eP/W7LzzcVVoXyNSSHMB8dDzespKRPxh/zMx9xM2B1ZVnhU+IS42iDwhF1N9YA7BLXyFg4=
X-Received: by 2002:a05:6e02:1647:: with SMTP id
 v7mr36102557ilu.217.1637942882947;
 Fri, 26 Nov 2021 08:08:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637900380.git.timothy.t.orling@intel.com>
 <ccb8f5e5b91450066e8cd677ba7552b0518df760.1637900380.git.timothy.t.orling@intel.com>
 <AM9PR09MB4642085E4B0028C36F228346A8639@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642085E4B0028C36F228346A8639@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 26 Nov 2021 08:07:51 -0800
Message-ID: 
 <CANx9H-B28cH99G3NVmY9Qp8ueGVfdU-n8ON9iuFQDVTDNrx+fQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 02/26] setuptools: refactor for no distutils
 bbclasses
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b3577b05d1b34bb5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 16:08:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158834

--000000000000b3577b05d1b34bb5
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 25, 2021 at 11:37 PM Konrad Weihmann <kweihmann@outlook.com>
wrote:

>
>
> On 26.11.21 05:35, Tim Orling wrote:
> > Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
> > ---
> >   meta/classes/setuptools3-base.bbclass | 31 +++++++++++++
> >   meta/classes/setuptools3.bbclass      | 67 ++++++++++++++++++++++++++-
> >   2 files changed, 97 insertions(+), 1 deletion(-)
> >   create mode 100644 meta/classes/setuptools3-base.bbclass
> >
> > diff --git a/meta/classes/setuptools3-base.bbclass
> b/meta/classes/setuptools3-base.bbclass
> > new file mode 100644
> > index 00000000000..5098ae9d64e
> > --- /dev/null
> > +++ b/meta/classes/setuptools3-base.bbclass
> > @@ -0,0 +1,31 @@
> > +DEPENDS:append:class-target = " ${PYTHON_PN}-native ${PYTHON_PN}"
> > +DEPENDS:append:class-nativesdk = " ${PYTHON_PN}-native ${PYTHON_PN}"
> > +RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' ==
> 'class-target']}"
> > +
> > +export STAGING_INCDIR
> > +export STAGING_LIBDIR
> > +
> > +# LDSHARED is the ld *command* used to create shared library
> > +export LDSHARED  = "${CCLD} -shared"
> > +# LDXXSHARED is the ld *command* used to create shared library of C++
> > +# objects
> > +export LDCXXSHARED  = "${CXX} -shared"
> > +# CCSHARED are the C *flags* used to create objects to go into a shared
> > +# library (module)
> > +export CCSHARED  = "-fPIC -DPIC"
> > +# LINKFORSHARED are the flags passed to the $(CC) command that links
> > +# the python executable
> > +export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
> > +
> > +FILES:${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
> > +
> > +FILES:${PN}-staticdev += "\
> > +  ${PYTHON_SITEPACKAGES_DIR}/*.a \
> > +"
> > +FILES:${PN}-dev += "\
> > +  ${datadir}/pkgconfig \
> > +  ${libdir}/pkgconfig \
> > +  ${PYTHON_SITEPACKAGES_DIR}/*.la \
> > +"
> > +inherit python3native python3targetconfig
> > +
> > diff --git a/meta/classes/setuptools3.bbclass
> b/meta/classes/setuptools3.bbclass
> > index 8ca66ee708e..4b8eca3f96e 100644
> > --- a/meta/classes/setuptools3.bbclass
> > +++ b/meta/classes/setuptools3.bbclass
> > @@ -1,4 +1,69 @@
> > -inherit distutils3
> > +inherit setuptools3-base
> >
> > +B = "${WORKDIR}/build"
> > +distutils_do_configure[cleandirs] = "${B}"
>
> I hope this will be removed in a later patch, as the function name
> doesn't match the rest of the class code function naming.
> Or this here deserves a in code explantion
>
> This was a copy-paste oversight and needs to be changed in a v2.
I believe I was trying to contemplate if it was still needed and forgot to
loop back.
 https://git.yoctoproject.org/poky/tree/meta/classes/distutils3.bbclass#n4

> +
> > +SETUPTOOLS_BUILD_ARGS ?= ""
> > +SETUPTOOLS_INSTALL_ARGS ?= "--root=${D} \
> > +    --prefix=${prefix} \
> > +    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> > +    --install-data=${datadir}"
> > +
> > +SETUPTOOLS_PYTHON = "python3"
> > +SETUPTOOLS_PYTHON:class-native = "nativepython3"
> > +
> > +SETUPTOOLS_SETUP_PATH ?= "${S}"
> > +
> > +setuptools3_do_configure() {
> > +    :
> > +}
>
> Why do we need to export an empty function?
> Wouldn't it make sense to use noexec here?
>
> This is what was in the original distutils3.bbclass
https://git.yoctoproject.org/poky/tree/meta/classes/distutils3.bbclass#n18
The colon (:) makes it a no-op (not empty). I believe this is our version
of defining an "interface" that can be implemented by subsequent recipes
inheriting the class.

> +
> > +setuptools3_do_compile() {
> > +        cd ${SETUPTOOLS_SETUP_PATH}
> > +        NO_FETCH_BUILD=1 \
> > +        STAGING_INCDIR=${STAGING_INCDIR} \
> > +        STAGING_LIBDIR=${STAGING_LIBDIR} \
> > +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py \
> > +        build --build-base=${B} ${SETUPTOOLS_BUILD_ARGS} || \
> > +        bbfatal_log "'${PYTHON_PN} setup.py build
> ${SETUPTOOLS_BUILD_ARGS}' execution failed."
> > +}
> > +setuptools3_do_compile[vardepsexclude] = "MACHINE"
>
> Please append or += here otherwise manipulation done to this function
> vardepexclude done *before* the inherit in the recipe will be lost,
> without people noticing that easily
>
> This is directly from the original distutils3.bbclass
 https://git.yoctoproject.org/poky/tree/meta/classes/distutils3.bbclass#n30

> +
> > +setuptools3_do_install() {
> > +        cd ${SETUPTOOLS_SETUP_PATH}
> > +        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
> > +        STAGING_INCDIR=${STAGING_INCDIR} \
> > +        STAGING_LIBDIR=${STAGING_LIBDIR} \
> > +        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
> > +        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}
> setup.py \
> > +        build --build-base=${B} install --skip-build
> ${SETUPTOOLS_INSTALL_ARGS} || \
> > +        bbfatal_log "'${PYTHON_PN} setup.py install
> ${SETUPTOOLS_INSTALL_ARGS}' execution failed."
> > +
> > +        # support filenames with *spaces*
> > +        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
> > +                               -exec sed -i -e s:${D}::g {} \;
> > +
> > +        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> > +            if [ -f "$i" ]; then
> > +                sed -i -e s:${PYTHON}:${USRBINPATH}/env\
> ${SETUPTOOLS_PYTHON}:g $i
> > +                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> > +            fi
> > +        done
> > +
> > +        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
> > +
> > +        #
> > +        # FIXME: Bandaid against wrong datadir computation
> > +        #
> > +        if [ -e ${D}${datadir}/share ]; then
> > +            mv -f ${D}${datadir}/share/* ${D}${datadir}/
> > +            rmdir ${D}${datadir}/share
> > +        fi
> > +}
> > +setuptools3_do_install[vardepsexclude] = "MACHINE"
>
> Same here about the vardepexclude
>
> Again, this is directly from the distutil3.bbclass
 https://git.yoctoproject.org/poky/tree/meta/classes/distutils3.bbclass#n63

> +
> > +EXPORT_FUNCTIONS do_configure do_compile do_install
> > +
> > +export LDSHARED="${CCLD} -shared"
> >   DEPENDS += "python3-setuptools-native"
> >
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#158798):
> https://lists.openembedded.org/g/openembedded-core/message/158798
> > Mute This Topic: https://lists.openembedded.org/mt/87313857/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000b3577b05d1b34bb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 25, 2021 at 11:37 PM Konr=
ad Weihmann &lt;<a href=3D"mailto:kweihmann@outlook.com">kweihmann@outlook.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
<br>
On 26.11.21 05:35, Tim Orling wrote:<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@intel=
.com" target=3D"_blank">timothy.t.orling@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes/setuptools3-base.bbclass | 31 +++++++++++++<b=
r>
&gt;=C2=A0 =C2=A0meta/classes/setuptools3.bbclass=C2=A0 =C2=A0 =C2=A0 | 67 =
++++++++++++++++++++++++++-<br>
&gt;=C2=A0 =C2=A02 files changed, 97 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta/classes/setuptools3-base.bbclass<b=
r>
&gt; <br>
&gt; diff --git a/meta/classes/setuptools3-base.bbclass b/meta/classes/setu=
ptools3-base.bbclass<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..5098ae9d64e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/classes/setuptools3-base.bbclass<br>
&gt; @@ -0,0 +1,31 @@<br>
&gt; +DEPENDS:append:class-target =3D &quot; ${PYTHON_PN}-native ${PYTHON_P=
N}&quot;<br>
&gt; +DEPENDS:append:class-nativesdk =3D &quot; ${PYTHON_PN}-native ${PYTHO=
N_PN}&quot;<br>
&gt; +RDEPENDS:${PN} +=3D &quot;${@[&#39;&#39;, &#39;${PYTHON_PN}-core&#39;=
][&#39;${CLASSOVERRIDE}&#39; =3D=3D &#39;class-target&#39;]}&quot;<br>
&gt; +<br>
&gt; +export STAGING_INCDIR<br>
&gt; +export STAGING_LIBDIR<br>
&gt; +<br>
&gt; +# LDSHARED is the ld *command* used to create shared library<br>
&gt; +export LDSHARED=C2=A0 =3D &quot;${CCLD} -shared&quot;<br>
&gt; +# LDXXSHARED is the ld *command* used to create shared library of C++=
<br>
&gt; +# objects<br>
&gt; +export LDCXXSHARED=C2=A0 =3D &quot;${CXX} -shared&quot;<br>
&gt; +# CCSHARED are the C *flags* used to create objects to go into a shar=
ed<br>
&gt; +# library (module)<br>
&gt; +export CCSHARED=C2=A0 =3D &quot;-fPIC -DPIC&quot;<br>
&gt; +# LINKFORSHARED are the flags passed to the $(CC) command that links<=
br>
&gt; +# the python executable<br>
&gt; +export LINKFORSHARED =3D &quot;${SECURITY_CFLAGS} -Xlinker -export-dy=
namic&quot;<br>
&gt; +<br>
&gt; +FILES:${PN} +=3D &quot;${libdir}/* ${libdir}/${PYTHON_DIR}/*&quot;<br=
>
&gt; +<br>
&gt; +FILES:${PN}-staticdev +=3D &quot;\<br>
&gt; +=C2=A0 ${PYTHON_SITEPACKAGES_DIR}/*.a \<br>
&gt; +&quot;<br>
&gt; +FILES:${PN}-dev +=3D &quot;\<br>
&gt; +=C2=A0 ${datadir}/pkgconfig \<br>
&gt; +=C2=A0 ${libdir}/pkgconfig \<br>
&gt; +=C2=A0 ${PYTHON_SITEPACKAGES_DIR}/*.la \<br>
&gt; +&quot;<br>
&gt; +inherit python3native python3targetconfig<br>
&gt; +<br>
&gt; diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptool=
s3.bbclass<br>
&gt; index 8ca66ee708e..4b8eca3f96e 100644<br>
&gt; --- a/meta/classes/setuptools3.bbclass<br>
&gt; +++ b/meta/classes/setuptools3.bbclass<br>
&gt; @@ -1,4 +1,69 @@<br>
&gt; -inherit distutils3<br>
&gt; +inherit setuptools3-base<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +B =3D &quot;${WORKDIR}/build&quot;<br>
&gt; +distutils_do_configure[cleandirs] =3D &quot;${B}&quot;<br>
<br>
I hope this will be removed in a later patch, as the function name <br>
doesn&#39;t match the rest of the class code function naming.<br>
Or this here deserves a in code explantion<br>
<br></blockquote><div>This was a copy-paste oversight and needs to be chang=
ed in a v2.</div><div>I believe I was trying to contemplate if it was still=
 needed and forgot to loop back.</div><div>=C2=A0<a href=3D"https://git.yoc=
toproject.org/poky/tree/meta/classes/distutils3.bbclass#n4">https://git.yoc=
toproject.org/poky/tree/meta/classes/distutils3.bbclass#n4</a></div><div><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +SETUPTOOLS_BUILD_ARGS ?=3D &quot;&quot;<br>
&gt; +SETUPTOOLS_INSTALL_ARGS ?=3D &quot;--root=3D${D} \<br>
&gt; +=C2=A0 =C2=A0 --prefix=3D${prefix} \<br>
&gt; +=C2=A0 =C2=A0 --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \<br>
&gt; +=C2=A0 =C2=A0 --install-data=3D${datadir}&quot;<br>
&gt; +<br>
&gt; +SETUPTOOLS_PYTHON =3D &quot;python3&quot;<br>
&gt; +SETUPTOOLS_PYTHON:class-native =3D &quot;nativepython3&quot;<br>
&gt; +<br>
&gt; +SETUPTOOLS_SETUP_PATH ?=3D &quot;${S}&quot;<br>
&gt; +<br>
&gt; +setuptools3_do_configure() {<br>
&gt; +=C2=A0 =C2=A0 :<br>
&gt; +}<br>
<br>
Why do we need to export an empty function?<br>
Wouldn&#39;t it make sense to use noexec here?<br>
<br></blockquote><div>This is what was in the original distutils3.bbclass</=
div><div><a href=3D"https://git.yoctoproject.org/poky/tree/meta/classes/dis=
tutils3.bbclass#n18">https://git.yoctoproject.org/poky/tree/meta/classes/di=
stutils3.bbclass#n18</a><br></div><div>The colon (:) makes it a no-op (not =
empty). I believe this is our version of defining an &quot;interface&quot; =
that can be implemented by subsequent recipes inheriting the class.</div><d=
iv><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +setuptools3_do_compile() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${SETUPTOOLS_SETUP_PATH}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 NO_FETCH_BUILD=3D1 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 STAGING_INCDIR=3D${STAGING_INCDIR} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-nat=
ive/${PYTHON_PN} setup.py \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 build --build-base=3D${B} ${SETUPTOOLS_BU=
ILD_ARGS} || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;&#39;${PYTHON_PN} setup=
.py build ${SETUPTOOLS_BUILD_ARGS}&#39; execution failed.&quot;<br>
&gt; +}<br>
&gt; +setuptools3_do_compile[vardepsexclude] =3D &quot;MACHINE&quot;<br>
<br>
Please append or +=3D here otherwise manipulation done to this function <br=
>
vardepexclude done *before* the inherit in the recipe will be lost, <br>
without people noticing that easily<br>
<br></blockquote><div>This is directly from the original distutils3.bbclass=
</div><div>=C2=A0<a href=3D"https://git.yoctoproject.org/poky/tree/meta/cla=
sses/distutils3.bbclass#n30">https://git.yoctoproject.org/poky/tree/meta/cl=
asses/distutils3.bbclass#n30</a></div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
&gt; +<br>
&gt; +setuptools3_do_install() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${SETUPTOOLS_SETUP_PATH}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PYTHON_SITEPACKAGES_DIR}=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 STAGING_INCDIR=3D${STAGING_INCDIR} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 PYTHONPATH=3D${D}${PYTHON_SITEPACKAGES_DI=
R} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-nat=
ive/${PYTHON_PN} setup.py \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 build --build-base=3D${B} install --skip-=
build ${SETUPTOOLS_INSTALL_ARGS} || \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;&#39;${PYTHON_PN} setup=
.py install ${SETUPTOOLS_INSTALL_ARGS}&#39; execution failed.&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # support filenames with *spaces*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 find ${D} -name &quot;*.py&quot; -exec gr=
ep -q ${D} {} \; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-exec sed -i -e s:${D}::g {} \;<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in ${D}${bindir}/* ${D}${sbindir}/*=
; do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -f &quot;$i&quot; ]; t=
hen<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e s:$=
{PYTHON}:${USRBINPATH}/env\ ${SETUPTOOLS_PYTHON}:g $i<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e s:$=
{STAGING_BINDIR_NATIVE}:${bindir}:g $i<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy=
-install.pth<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # FIXME: Bandaid against wrong datadir co=
mputation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${datadir}/share ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv -f ${D}${datadir}/share/=
* ${D}${datadir}/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rmdir ${D}${datadir}/share<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; +}<br>
&gt; +setuptools3_do_install[vardepsexclude] =3D &quot;MACHINE&quot;<br>
<br>
Same here about the vardepexclude<br>
<br></blockquote><div>Again, this is directly from the distutil3.bbclass</d=
iv><div>=C2=A0<a href=3D"https://git.yoctoproject.org/poky/tree/meta/classe=
s/distutils3.bbclass#n63">https://git.yoctoproject.org/poky/tree/meta/class=
es/distutils3.bbclass#n63</a></div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
&gt; +<br>
&gt; +EXPORT_FUNCTIONS do_configure do_compile do_install<br>
&gt; +<br>
&gt; +export LDSHARED=3D&quot;${CCLD} -shared&quot;<br>
&gt;=C2=A0 =C2=A0DEPENDS +=3D &quot;python3-setuptools-native&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#158798): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/158798" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/158798</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87313857=
/3647476" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/87313857/3647476</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:kweihmann@outlook.com=
" target=3D"_blank">kweihmann@outlook.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--000000000000b3577b05d1b34bb5--

