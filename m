Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF354C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 20:40:35 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.85769.1674765634773786381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 12:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CYd52Psp;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id d8so1604590ybe.9
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 12:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ohBZVE4UEW64+1+jToJUyyFCqQdvNk6APpHCfFjna5k=;
        b=CYd52PspgrRUmKF4Q7n5DOzfLGJx/UCRDf+1lw5MZza0nD02RZXf5VIqH139Iwhu/2
         oxqCKWZfy6+dNlU15Od7MXWY0tI1Jy7hUH1SkGA63P559r1GMW0gG73okAd7BTvmKuIA
         xTfi9FyHvwmkaTVjVy6PJP0GRjOg3z9YSOxuAmz6eFCn3x3qAPJk/q522G4s5/qRnBN/
         vns7qAg6GSNvIOwZTShmuxOPq5S3KSbw09xeqDCteRtE9MrqBpp9bE6ibEVZXrG8JJ9l
         ORRSHZxZA4PQXEvUXfQrHNQMZk6ICkekF3mr/q5uIVRVuCJTbcjP6zmQbAVGbKRCEQlK
         MKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohBZVE4UEW64+1+jToJUyyFCqQdvNk6APpHCfFjna5k=;
        b=gp9GyomGYo9NeghbF+NF1GQh+lr+HM436JuOCTPj8TryDQFXcdwuYCY5z1aWp0ttxW
         DRx+UnfgBQnK5dUF0D9zK3Ct9eN/PIcVxW3YD3lOhldtwAygSFGjuXZr67Zq4ktsrGfA
         8h1ZLFXeo0Wv9DW6hGCaH2Cyw+bbAyStTnl/IOd9wCetS0sGh8+6qKctGC5+6TwH+G++
         kUTb9M43Z4BFGA51QNGoWUlH14XO8EZ1cj1U6KkmwhiQqy+PXZpJDBDlj1/m0cxBpDQs
         wkxc/I2cTs8yg3Y03FmOA9rWo74Iq1q219lg+Uy3e8dJzYNHgrkq42X/s5DB3YdN9jWO
         2m2g==
X-Gm-Message-State: AO0yUKWKm/W7dahxAT9qlWE9iMCD2TkmC9L6c+6pZ6+kX0Rn2PN3FZOg
	WeQtO0K1R6On6Q/obNJOy621o/+AS5ih+8SvaVs=
X-Google-Smtp-Source: AK7set+DmVlkitEu7sH/ooi+2vQyGY5eYgqHjDNOZvuq7v36KEm8qOG8rwDL5dUT7jbjEK1+NIOKoaZEtRz5Jdf36bU=
X-Received: by 2002:a25:86c2:0:b0:80b:7e2e:f94 with SMTP id
 y2-20020a2586c2000000b0080b7e2e0f94mr1069269ybm.273.1674765633776; Thu, 26
 Jan 2023 12:40:33 -0800 (PST)
MIME-Version: 1.0
References: <cccfbf0c-5bb9-45f2-db6d-4d2692a7b729@amd.com>
In-Reply-To: <cccfbf0c-5bb9-45f2-db6d-4d2692a7b729@amd.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 26 Jan 2023 12:40:22 -0800
Message-ID: <CANx9H-BuquWnmXAcRmzDdpwgxtKE_-+BbdvEKHnEXvmEsHrOPA@mail.gmail.com>
Subject: Re: python3-bqplot build issues
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>, 
	"Hatle, Mark" <mark.hatle@amd.com>
Content-Type: multipart/alternative; boundary="000000000000aef14605f330c244"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 20:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176423

--000000000000aef14605f330c244
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 25, 2023 at 11:17 AM Gundlupet Raju, Sandeep <
sandeep.gundlupet-raju@amd.com> wrote:

> Hello,
>
> I'm upgrading python3-bqplot from honister to langdale in meta-jupyter,
> I've migrated the recipe version from 0.12.31 ->0.12.36 but I'm running
> into build missing dependencies issues. Even if I use 0.12.31 issues
> exists in kirkstone and langdale.
>
> Any help from community will be much appreciated.
>
>
> https://github.com/Xilinx/meta-jupyter/blob/langdale/recipes-python/python3-bqplot_0.12.31.bb
>
> ============
>
> Source repo:
>
> ============
>
> https://github.com/bqplot/bqplot/tree/0.12.36
>
> ================================================================
>
> 0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch:
>
> ================================================================
>
>  From c4681f95099516e96b1c7be757da6e0f302f50fe Mon Sep 17 00:00:00 2001
> From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> Date: Tue, 13 Dec 2022 15:41:18 -0700
> Subject: [PATCH] pyproject.toml: Allow jupyter packaging to be greater than
>   0.7
>
> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
> ---
>   pyproject.toml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/pyproject.toml b/pyproject.toml
> index ba04c53f..7a3cc3a9 100644
> --- a/pyproject.toml
> +++ b/pyproject.toml
> @@ -1,3 +1,3 @@
>   [build-system]
> -requires = ["jupyter_packaging~=0.7.9", "jupyterlab~=3.0",
> "setuptools>=40.8.0", "wheel"]
> +requires = ["jupyter_packaging~=0.9,<2", "jupyterlab~=3.0,<4",

These are build time dependencies so they need to be in DEPENDS, not
RDEPENDS.

>
> "setuptools", "wheel"]
>   build-backend = "setuptools.build_meta"
> --
> 2.17.1
>
> =================================
>
> python3-bqplot_0.12.36.bb recipe:
>
> =================================
>
> SUMMARY = "Interactive plotting for the Jupyter notebook, using d3.js and \
>         ipywidgets."
> LICENSE = "Apache-2.0"
> LIC_FILES_CHKSUM = "file://LICENSE;md5=822b4ff4dd277d70fc2b796617ae1bf7"
>
> PYPI_PACKAGE = "bqplot"
> inherit pypi python_setuptools_build_meta
>
> SRC_URI[sha256sum] =
> "6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af"
> SRC_URI += "\
> file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch \
>      "
>
> In the prior 0.12.31 ecipe, you had
 DEPENDS += " \
${PYTHON_PN}-jupyter-packaging-native \
"
So according to the "requires =" in [build-system], you should also need
python3-jupyterlab-native

RDEPENDS:${PN} += " \
>      ${PYTHON_PN}-jupyter-packaging \
>      ${PYTHON_PN}-jupyterlab \
>      ${PYTHON_PN}-ipywidgets \
>      ${PYTHON_PN}-traitlets \
>      ${PYTHON_PN}-traittypes \
>      ${PYTHON_PN}-numpy \
>      ${PYTHON_PN}-pandas \
>      "
>
> do_install:append() {
>      # this files will be installed by python3-json5
>      rm -f
> ${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc
> }
>
> FILES:${PN} += "${datadir}/*"
>
> =================
>
> Build error logs:
>
> =================
>
> NOTE: Executing Tasks
> ERROR: python3-bqplot-0.12.36-r0 do_compile:
> ExecutionError('/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058',
>
> 1, None, None)
> ERROR: Logfile of failure stored in:
>
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3777058
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | Missing build dependencies:
> | - jupyter_packaging~=0.9,<2
> | - jupyterlab~=3.0,<4
> | WARNING:
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058:157
>
> exit 1 from 'nativepython3 -m picobuild --source
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36
>
> --dest
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/dist
>
> --wheel'
> | WARNING: Backtrace (BB generated script):
> |       #1: python_pep517_do_compile,
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>
> line 157
> |       #2: do_compile,
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>
> line 152
> |       #3: main,
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>
> line 161
> ERROR: Task
>
> (/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:do_compile)
>
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2249 tasks of which 2241 didn't need to
> be rerun and 1 failed.
>
> Summary: 1 task failed:
>
> /group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/recipes-python/python3-bqplot_0.12.36.bb:
> do_compile
> Summary: There was 1 WARNING message.
> Summary: There was 1 ERROR message, returning a non-zero exit code.
>
> Thanks,
>
> Sandeep
>
>
>

--000000000000aef14605f330c244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 25, 2023 at 11:17 AM Gund=
lupet Raju, Sandeep &lt;<a href=3D"mailto:sandeep.gundlupet-raju@amd.com">s=
andeep.gundlupet-raju@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Hello,<br>
<br>
I&#39;m upgrading python3-bqplot from honister to langdale in meta-jupyter,=
 <br>
I&#39;ve migrated the recipe version from 0.12.31 -&gt;0.12.36 but I&#39;m =
running <br>
into build missing dependencies issues. Even if I use 0.12.31 issues <br>
exists in kirkstone and langdale.<br>
<br>
Any help from community will be much appreciated.<br>
<br>
<a href=3D"https://github.com/Xilinx/meta-jupyter/blob/langdale/recipes-pyt=
hon/python3-bqplot_0.12.31.bb" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/Xilinx/meta-jupyter/blob/langdale/recipes-python/python3-bqplot=
_0.12.31.bb</a><br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Source repo:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
<a href=3D"https://github.com/bqplot/bqplot/tree/0.12.36" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/bqplot/bqplot/tree/0.12.36</a><br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
=C2=A0From c4681f95099516e96b1c7be757da6e0f302f50fe Mon Sep 17 00:00:00 200=
1<br>
From: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gundlupet-raju@a=
md.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a>&gt;<br>
Date: Tue, 13 Dec 2022 15:41:18 -0700<br>
Subject: [PATCH] pyproject.toml: Allow jupyter packaging to be greater than=
<br>
=C2=A0=C2=A00.7<br>
<br>
Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gundlup=
et-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a>&gt;<b=
r>
---<br>
=C2=A0=C2=A0pyproject.toml | 2 +-<br>
=C2=A0=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/pyproject.toml b/pyproject.toml<br>
index ba04c53f..7a3cc3a9 100644<br>
--- a/pyproject.toml<br>
+++ b/pyproject.toml<br>
@@ -1,3 +1,3 @@<br>
=C2=A0=C2=A0[build-system]<br>
-requires =3D [&quot;jupyter_packaging~=3D0.7.9&quot;, &quot;jupyterlab~=3D=
3.0&quot;, <br>
&quot;setuptools&gt;=3D40.8.0&quot;, &quot;wheel&quot;]<br>
+requires =3D [&quot;jupyter_packaging~=3D0.9,&lt;2&quot;, &quot;jupyterlab=
~=3D3.0,&lt;4&quot;,</blockquote><div>These are build time dependencies so =
they need to be in DEPENDS, not RDEPENDS.=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"> <br>
&quot;setuptools&quot;, &quot;wheel&quot;]<br>
=C2=A0=C2=A0build-backend =3D &quot;setuptools.build_meta&quot;<br>
-- <br>
2.17.1<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
<a href=3D"http://python3-bqplot_0.12.36.bb" rel=3D"noreferrer" target=3D"_=
blank">python3-bqplot_0.12.36.bb</a> recipe:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
SUMMARY =3D &quot;Interactive plotting for the Jupyter notebook, using d3.j=
s and \<br>
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ipywidgets.&quot;<br>
LICENSE =3D &quot;Apache-2.0&quot;<br>
LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D822b4ff4dd277d70fc2b796617a=
e1bf7&quot;<br>
<br>
PYPI_PACKAGE =3D &quot;bqplot&quot;<br>
inherit pypi python_setuptools_build_meta<br>
<br>
SRC_URI[sha256sum] =3D <br>
&quot;6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af&quot=
;<br>
SRC_URI +=3D &quot;\<br>
file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch \<br=
>
=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>
<br></blockquote><div>In the prior 0.12.31 ecipe, you had</div><div>=C2=A0D=
EPENDS +=3D &quot; \</div>	${PYTHON_PN}-jupyter-packaging-native \<br>&quot=
;</div><div class=3D"gmail_quote">So according to the &quot;requires =3D&qu=
ot; in [build-system], you should also need python3-jupyterlab-native</div>=
<div class=3D"gmail_quote"><br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0=C2=A0=C2=A0 =C2=A0${PYTHON_PN}-jupyter-packaging \<br>
=C2=A0=C2=A0=C2=A0 =C2=A0${PYTHON_PN}-jupyterlab \<br>
=C2=A0=C2=A0=C2=A0 =C2=A0${PYTHON_PN}-ipywidgets \<br>
=C2=A0=C2=A0=C2=A0 =C2=A0${PYTHON_PN}-traitlets \<br>
=C2=A0=C2=A0=C2=A0 =C2=A0${PYTHON_PN}-traittypes \<br>
=C2=A0=C2=A0=C2=A0 =C2=A0${PYTHON_PN}-numpy \<br>
=C2=A0=C2=A0=C2=A0 =C2=A0${PYTHON_PN}-pandas \<br>
=C2=A0=C2=A0=C2=A0 =C2=A0&quot;<br>
<br>
do_install:append() {<br>
=C2=A0=C2=A0=C2=A0 =C2=A0# this files will be installed by python3-json5<br=
>
=C2=A0=C2=A0=C2=A0 =C2=A0rm -f <br>
${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc<br=
>
}<br>
<br>
FILES:${PN} +=3D &quot;${datadir}/*&quot;<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Build error logs:<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
NOTE: Executing Tasks<br>
ERROR: python3-bqplot-0.12.36-r0 do_compile: <br>
ExecutionError(&#39;/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cor=
texa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile=
.3777058&#39;, <br>
1, None, None)<br>
ERROR: Logfile of failure stored in: <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3777058<br>
Log data follows:<br>
| DEBUG: Executing shell function do_compile<br>
| Missing build dependencies:<br>
| - jupyter_packaging~=3D0.9,&lt;2<br>
| - jupyterlab~=3D3.0,&lt;4<br>
| WARNING: <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058:157 <br>
exit 1 from &#39;nativepython3 -m picobuild --source <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36 <br>
--dest <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/dist <br>
--wheel&#39;<br>
| WARNING: Backtrace (BB generated script):<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #1: python_pep517_do_compile, <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058, <br>
line 157<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #2: do_compile, <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058, <br>
line 152<br>
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #3: main, <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058, <br>
line 161<br>
ERROR: Task <br>
(/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/re=
cipes-python/python3-bqplot_0.12.36.bb:do_compile) <br>
failed with exit code &#39;1&#39;<br>
NOTE: Tasks Summary: Attempted 2249 tasks of which 2241 didn&#39;t need to =
<br>
be rerun and 1 failed.<br>
<br>
Summary: 1 task failed:<br>
/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/rec=
ipes-python/python3-bqplot_0.12.36.bb:do_compile<br>
Summary: There was 1 WARNING message.<br>
Summary: There was 1 ERROR message, returning a non-zero exit code.<br>
<br>
Thanks,<br>
<br>
Sandeep<br>
<br>
<br>
</blockquote></div></div>

--000000000000aef14605f330c244--

