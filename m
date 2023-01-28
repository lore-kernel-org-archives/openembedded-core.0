Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B7FCC54EAA
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 01:27:02 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.4450.1674869215296407497
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 17:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qEpXSXo8;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-506609635cbso89882437b3.4
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 17:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6nanehHFsysyJ6txlPkNpDhcrSu7EjajpioGHCXasp4=;
        b=qEpXSXo87N9kIdKBK03ZXDSmnmqrJcXmQ+jXvsqTSTpP+kum3DcQBRNCVBoSkdWFDn
         EHfWqYoMaRGcOMCX0DowDUB/XwVx+bquqGWJcDcDM2eqRDMA7dZs9wEahDDz7KBx2ZJQ
         0LV3Nboe6CC+n3BdtaIBPZGdLZFfZI8AS/QOpCDGBSxFis06Mm+202FHgOkAZ/q6ophS
         ofMXD/ODfYVVMPq2evlmAfh40j4cpK/1vU7ghi3l5bENz8MvJplXH2fXgGS8dCMBxI00
         bIjHTuhuv6JYlpfJX57SdHMxqFGS19z/mIf0+C8IwOqwJiol72tDCK7MbnpWe7n1fSQz
         GJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nanehHFsysyJ6txlPkNpDhcrSu7EjajpioGHCXasp4=;
        b=iB3OtzXReekRcrokpGvawvkbZhXL5hCSUms8UYkbRZutDwvPwkbm/50zDLqpYlzPhZ
         eTPScLHjpEsSrbu+HqqFY4L6crVJLhavRBi+UCQMxW4GuK5ISxpErSXptglVh2Rqa2MY
         19IzB43Cez6i9rqCBVv4Ou2PSGmriT2EgNg5luHx9Zn0QlvmbShm2+0eI7lkVSsPn31s
         dtY3kQsL9SYmIioeHD6PDFQ1uopKx2+frtmIDSCvuT1zIbU94yiENu+MRKowbGDXndj4
         7QjFJ8WO5bic29g1CfiHjqdHh4uniuNVgZWKt7nguPYU5lxbXoGkdfPAOFNgAkgfPgWO
         CRHg==
X-Gm-Message-State: AFqh2koElrVuIWQ7mJ/Fm1/xD4jCxwhj0sYUX3ro4DL2wBbqAlhzkqEh
	dkICNJPnkJGpHfR44IWBcRkhjWJJaQF5vhVr9u3EQA94
X-Google-Smtp-Source: AMrXdXuRTNQRtIGQF8XmyEyFtzXOXjWOFFy5vCDhIiIV9nbXqPtXHA+nPi5Ro+fUlVyF4T202j6iQtZ7T/4XabORCpE=
X-Received: by 2002:a81:5a46:0:b0:4fc:962d:7dc1 with SMTP id
 o67-20020a815a46000000b004fc962d7dc1mr3232919ywb.301.1674869214285; Fri, 27
 Jan 2023 17:26:54 -0800 (PST)
MIME-Version: 1.0
References: <cccfbf0c-5bb9-45f2-db6d-4d2692a7b729@amd.com> <CANx9H-BuquWnmXAcRmzDdpwgxtKE_-+BbdvEKHnEXvmEsHrOPA@mail.gmail.com>
 <10b31bd2-c183-122f-fa53-292ca5c5db6c@amd.com>
In-Reply-To: <10b31bd2-c183-122f-fa53-292ca5c5db6c@amd.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 27 Jan 2023 17:26:43 -0800
Message-ID: <CANx9H-AuMKCpjs9FmWXfs_TsXXcz4Qq9LcWcZV2UrErsGtLNmw@mail.gmail.com>
Subject: Re: python3-bqplot build issues
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Cc: "Hatle, Mark" <mark.hatle@amd.com>, 
	Openembedded Core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000090135805f348e0de"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 01:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176455

--00000000000090135805f348e0de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2023 at 8:28 PM Gundlupet Raju, Sandeep <
sandeep.gundlupet-raju@amd.com> wrote:

> Thanks Tim for your help.
> On 1/26/2023 1:40 PM, Tim Orling wrote:
>
>
>
> On Wed, Jan 25, 2023 at 11:17 AM Gundlupet Raju, Sandeep <
> sandeep.gundlupet-raju@amd.com> wrote:
>
>> Hello,
>>
>> I'm upgrading python3-bqplot from honister to langdale in meta-jupyter,
>> I've migrated the recipe version from 0.12.31 ->0.12.36 but I'm running
>> into build missing dependencies issues. Even if I use 0.12.31 issues
>> exists in kirkstone and langdale.
>>
>> Any help from community will be much appreciated.
>>
>>
>> https://github.com/Xilinx/meta-jupyter/blob/langdale/recipes-python/pyth=
on3-bqplot_0.12.31.bb
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Source repo:
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> https://github.com/bqplot/bqplot/tree/0.12.36
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> 0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch:
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>  From c4681f95099516e96b1c7be757da6e0f302f50fe Mon Sep 17 00:00:00 2001
>> From: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> Date: Tue, 13 Dec 2022 15:41:18 -0700
>> Subject: [PATCH] pyproject.toml: Allow jupyter packaging to be greater
>> than
>>   0.7
>>
>> Signed-off-by: Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>
>> ---
>>   pyproject.toml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/pyproject.toml b/pyproject.toml
>> index ba04c53f..7a3cc3a9 100644
>> --- a/pyproject.toml
>> +++ b/pyproject.toml
>> @@ -1,3 +1,3 @@
>>   [build-system]
>> -requires =3D ["jupyter_packaging~=3D0.7.9", "jupyterlab~=3D3.0",
>> "setuptools>=3D40.8.0", "wheel"]
>> +requires =3D ["jupyter_packaging~=3D0.9,<2", "jupyterlab~=3D3.0,<4",
>
> These are build time dependencies so they need to be in DEPENDS, not
> RDEPENDS.
>
>>
>> "setuptools", "wheel"]
>>   build-backend =3D "setuptools.build_meta"
>> --
>> 2.17.1
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> python3-bqplot_0.12.36.bb recipe:
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> SUMMARY =3D "Interactive plotting for the Jupyter notebook, using d3.js =
and
>> \
>>         ipywidgets."
>> LICENSE =3D "Apache-2.0"
>> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D822b4ff4dd277d70fc2b796617ae1=
bf7"
>>
>> PYPI_PACKAGE =3D "bqplot"
>> inherit pypi python_setuptools_build_meta
>>
>> SRC_URI[sha256sum] =3D
>> "6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af"
>> SRC_URI +=3D "\
>> file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch \
>>      "
>>
>> In the prior 0.12.31 ecipe, you had
>  DEPENDS +=3D " \
> ${PYTHON_PN}-jupyter-packaging-native \
> "
> So according to the "requires =3D" in [build-system], you should also nee=
d
> python3-jupyterlab-native
>
> [Sandeep]: I tried this still same issue. But I can build all the
> jupyter-packaging and jupyterlab packages.
>
>
Did you build the -native versions? I think there are some missing -native
dependencies (some recipes need BBCLASSEXTEND =3D =E2=80=9Cnative=E2=80=9D.=
 After that, it
looks like bqplot wants to call yarn or npm. Not a well behaved python
library.

=3D=3D=3D=3D=3D=3D=3D
>
> recipe:
>
> =3D=3D=3D=3D=3D=3D
>
> SUMMARY =3D "Interactive plotting for the Jupyter notebook, using d3.js a=
nd \
>            ipywidgets."
> LICENSE =3D "Apache-2.0"
> LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D822b4ff4dd277d70fc2b796617ae1b=
f7"
>
> PYPI_PACKAGE =3D "bqplot"
> inherit pypi python_setuptools_build_meta
>
> SRC_URI[sha256sum] =3D
> "6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af"
> SRC_URI +=3D "\
>     file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patc=
h
> \
>     "
> DEPENDS +=3D " \
>         ${PYTHON_PN}-jupyter-packaging-native \
>         ${PYTHON_PN}-jupyterlab-native \
>         "
>
> RDEPENDS:${PN} +=3D " \
>         ${PYTHON_PN}-ipywidgets \
>         ${PYTHON_PN}-traitlets \
>         ${PYTHON_PN}-traittypes \
>         ${PYTHON_PN}-numpy \
>         ${PYTHON_PN}-pandas \
>         "
>
> do_install:append() {
>         # this files will be installed by python3-json5
>         rm -f
> ${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc
> }
>
> FILES:${PN} +=3D "${datadir}/*"
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> bootlogs:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> ERROR: python3-bqplot-0.12.36-r0 do_compile:
> ExecutionError('/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/corte=
xa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3=
184642',
> 1, None, None)
> ERROR: Logfile of failure stored in:
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-x=
ilinx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3184642
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | Missing build dependencies:
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyter_packaging~=3D0.7.9,<2
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | - jupyterlab~=3D3.0,<4
> | WARNING:
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-x=
ilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642:157
> exit 1 from 'nativepython3 -m picobuild --source
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-x=
ilinx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36
> --dest
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-x=
ilinx-linux/python3-bqplot/0.12.36-r0/dist
> --wheel'
> | WARNING: Backtrace (BB generated script):
> |       #1: python_pep517_do_compile,
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-x=
ilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
> line 157
> |       #2: do_compile,
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-x=
ilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
> line 152
> |       #3: main,
> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-x=
ilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
> line 161
>
>
> ERROR: Task
> (/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/=
recipes-python/python3-bqplot_0.12.36.bb:do_compile)
> failed with exit code '1
>
>
> RDEPENDS:${PN} +=3D " \
>>      ${PYTHON_PN}-jupyter-packaging \
>>      ${PYTHON_PN}-jupyterlab \
>>      ${PYTHON_PN}-ipywidgets \
>>      ${PYTHON_PN}-traitlets \
>>      ${PYTHON_PN}-traittypes \
>>      ${PYTHON_PN}-numpy \
>>      ${PYTHON_PN}-pandas \
>>      "
>>
>> do_install:append() {
>>      # this files will be installed by python3-json5
>>      rm -f
>> ${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.pyc
>> }
>>
>> FILES:${PN} +=3D "${datadir}/*"
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> Build error logs:
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> NOTE: Executing Tasks
>> ERROR: python3-bqplot-0.12.36-r0 do_compile:
>> ExecutionError('/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cort=
exa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.=
3777058',
>>
>> 1, None, None)
>> ERROR: Logfile of failure stored in:
>>
>> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-=
xilinx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3777058
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | Missing build dependencies:
>> | - jupyter_packaging~=3D0.9,<2
>> | - jupyterlab~=3D3.0,<4
>> | WARNING:
>> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-=
xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058:157
>>
>> exit 1 from 'nativepython3 -m picobuild --source
>> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-=
xilinx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36
>>
>> --dest
>> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-=
xilinx-linux/python3-bqplot/0.12.36-r0/dist
>>
>> --wheel'
>> | WARNING: Backtrace (BB generated script):
>> |       #1: python_pep517_do_compile,
>> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-=
xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>>
>> line 157
>> |       #2: do_compile,
>> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-=
xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>>
>> line 152
>> |       #3: main,
>> /tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-=
xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
>>
>> line 161
>> ERROR: Task
>>
>> (/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter=
/recipes-python/python3-bqplot_0.12.36.bb:do_compile)
>>
>> failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 2249 tasks of which 2241 didn't need to
>> be rerun and 1 failed.
>>
>> Summary: 1 task failed:
>>
>> /group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/=
recipes-python/python3-bqplot_0.12.36.bb:
>> do_compile
>> Summary: There was 1 WARNING message.
>> Summary: There was 1 ERROR message, returning a non-zero exit code.
>>
>> Thanks,
>>
>> Sandeep
>>
>>
>>

--00000000000090135805f348e0de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jan 26, 2023 at 8:28 PM Gundlupet Raju, Sandeep &lt=
;<a href=3D"mailto:sandeep.gundlupet-raju@amd.com">sandeep.gundlupet-raju@a=
md.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

 =20
  <div>
    <p>Thanks Tim for your help.<br>
    </p></div><div>
    <div>On 1/26/2023 1:40 PM, Tim Orling wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 25, 2023 at
            11:17 AM Gundlupet Raju, Sandeep &lt;<a href=3D"mailto:sandeep.=
gundlupet-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a=
>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            Hello,<br>
            <br>
            I&#39;m upgrading python3-bqplot from honister to langdale in
            meta-jupyter, <br>
            I&#39;ve migrated the recipe version from 0.12.31 -&gt;0.12.36
            but I&#39;m running <br>
            into build missing dependencies issues. Even if I use
            0.12.31 issues <br>
            exists in kirkstone and langdale.<br>
            <br>
            Any help from community will be much appreciated.<br>
            <br>
            <a href=3D"https://github.com/Xilinx/meta-jupyter/blob/langdale=
/recipes-python/python3-bqplot_0.12.31.bb" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/Xilinx/meta-jupyter/blob/langdale/recipes-python/py=
thon3-bqplot_0.12.31.bb</a><br>
            <br>
            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
            <br>
            Source repo:<br>
            <br>
            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
            <br>
            <a href=3D"https://github.com/bqplot/bqplot/tree/0.12.36" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/bqplot/bqplot/tree/0.1=
2.36</a><br>
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
            =C2=A0From c4681f95099516e96b1c7be757da6e0f302f50fe Mon Sep 17
            00:00:00 2001<br>
            From: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:sandeep.gund=
lupet-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.com</a>&gt=
;<br>
            Date: Tue, 13 Dec 2022 15:41:18 -0700<br>
            Subject: [PATCH] pyproject.toml: Allow jupyter packaging to
            be greater than<br>
            =C2=A0=C2=A00.7<br>
            <br>
            Signed-off-by: Sandeep Gundlupet Raju &lt;<a href=3D"mailto:san=
deep.gundlupet-raju@amd.com" target=3D"_blank">sandeep.gundlupet-raju@amd.c=
om</a>&gt;<br>
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
            -requires =3D [&quot;jupyter_packaging~=3D0.7.9&quot;, &quot;ju=
pyterlab~=3D3.0&quot;,
            <br>
            &quot;setuptools&gt;=3D40.8.0&quot;, &quot;wheel&quot;]<br>
            +requires =3D [&quot;jupyter_packaging~=3D0.9,&lt;2&quot;,
            &quot;jupyterlab~=3D3.0,&lt;4&quot;,</blockquote>
          <div>These are build time dependencies so they need to be in
            DEPENDS, not RDEPENDS.=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            &quot;setuptools&quot;, &quot;wheel&quot;]<br>
            =C2=A0=C2=A0build-backend =3D &quot;setuptools.build_meta&quot;=
<br>
            -- <br>
            2.17.1<br>
            <br>
            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
            <br>
            <a href=3D"http://python3-bqplot_0.12.36.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-bqplot_0.12.36.bb</a>
            recipe:<br>
            <br>
            =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
            <br>
            SUMMARY =3D &quot;Interactive plotting for the Jupyter notebook=
,
            using d3.js and \<br>
            =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ipywidgets.&quot;<br>
            LICENSE =3D &quot;Apache-2.0&quot;<br>
            LIC_FILES_CHKSUM =3D
            <a>&quot;file://LICENSE;md5=3D822b4ff4dd277d70fc2b796617ae1bf7&=
quot;</a><br>
            <br>
            PYPI_PACKAGE =3D &quot;bqplot&quot;<br>
            inherit pypi python_setuptools_build_meta<br>
            <br>
            SRC_URI[sha256sum] =3D <br>
&quot;6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921af&quot=
;<br>
            SRC_URI +=3D &quot;\<br>
<a>file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.patch</=
a> \<br>
            =C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>
            <br>
          </blockquote>
          <div>In the prior 0.12.31 ecipe, you had</div>
          <div>=C2=A0DEPENDS +=3D &quot; \</div>
          ${PYTHON_PN}-jupyter-packaging-native \<br>
          &quot;</div>
        <div class=3D"gmail_quote">So according to the &quot;requires =3D&q=
uot; in
          [build-system], you should also need python3-jupyterlab-native</d=
iv>
      </div>
    </blockquote>
    </div><div><p>[Sandeep]: I tried this still same issue. But I can build=
 all the
      jupyter-packaging and jupyterlab packages.<br>
    </p>
    <p></p></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Did you build the -native versions? I think there are some missing -native=
 dependencies (some recipes need BBCLASSEXTEND =3D =E2=80=9Cnative=E2=80=9D=
. After that, it looks like bqplot wants to call yarn or npm. Not a well be=
haved python library.</div><div dir=3D"auto"><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div><p dir=3D"auto">=3D=3D=3D=3D=3D=3D=3D<br>
    </p>
    <p>recipe:</p>
    <p>=3D=3D=3D=3D=3D=3D<br>
    </p>
    <p>SUMMARY =3D &quot;Interactive plotting for the Jupyter notebook, usi=
ng
      d3.js and \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ipywidge=
ts.&quot;<br>
      LICENSE =3D &quot;Apache-2.0&quot;<br>
      LIC_FILES_CHKSUM =3D
      <a>&quot;file://LICENSE;md5=3D822b4ff4dd277d70fc2b796617ae1bf7&quot;<=
/a><br>
      <br>
      PYPI_PACKAGE =3D &quot;bqplot&quot;<br>
      inherit pypi python_setuptools_build_meta<br>
      <br>
      SRC_URI[sha256sum] =3D
      &quot;6a553e55fdbcc4f62e05679bd74b2549d1efbe43e120ad3b0bcb03a65c7921a=
f&quot;<br>
      SRC_URI +=3D &quot;\<br>
      =C2=A0=C2=A0=C2=A0
      <a>file://0001-pyproject.toml-Allow-jupyter-packaging-to-be-greater.p=
atch</a>
      \<br>
      =C2=A0=C2=A0=C2=A0 &quot;<br>
      DEPENDS +=3D &quot; \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-jupyter-packa=
ging-native \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-jupyterlab-na=
tive \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>
      <br>
      RDEPENDS:${PN} +=3D &quot; \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-ipywidgets \<=
br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-traitlets \<b=
r>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-traittypes \<=
br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-numpy \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${PYTHON_PN}-pandas \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>
      <br>
      do_install:append() {<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # this files will be insta=
lled by python3-json5<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f
      ${D}${PYTHON_SITEPACKAGES_DIR}/tests/__pycache__/__init__.cpython-37.=
pyc<br>
      }<br>
      <br>
      FILES:${PN} +=3D &quot;${datadir}/*&quot;</p>
    <p>=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
    </p>
    <p>bootlogs:</p>
    <p>=3D=3D=3D=3D=3D=3D=3D=3D=3D</p>
    <p>ERROR: python3-bqplot-0.12.36-r0 do_compile:
ExecutionError(&#39;/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cor=
texa72-cortexa53-xilinx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile=
.3184642&#39;,
      1, None, None)<br>
      ERROR: Logfile of failure stored in:
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/log.do_compile.3184642<br>
      Log data follows:<br>
      | DEBUG: Executing shell function do_compile<br>
      | Missing build dependencies:<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyter_packaging~=3D0.7.9,&lt;2<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | - jupyterlab~=3D3.0,&lt;4<br>
      | WARNING:
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642:157
      exit 1 from &#39;nativepython3 -m picobuild --source
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36
      --dest
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/dist
      --wheel&#39;<br>
      | WARNING: Backtrace (BB generated script):<br>
      |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #1: python_pep517_do_compile,
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
      line 157<br>
      |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #2: do_compile,
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
      line 152<br>
      |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #3: main,
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3184642,
      line 161</p></div><div><p><br>
      ERROR: Task
(/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/re=
cipes-python/python3-bqplot_0.12.36.bb:do_compile)
      failed with exit code &#39;1<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote"><br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
            =C2=A0=C2=A0=C2=A0 =C2=A0# this files will be installed by pyth=
on3-json5<br>
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
.3777058&#39;,
            <br>
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
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058:157
            <br>
            exit 1 from &#39;nativepython3 -m picobuild --source <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/bqplot-0.12.36
            <br>
            --dest <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/dist
            <br>
            --wheel&#39;<br>
            | WARNING: Backtrace (BB generated script):<br>
            |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #1: python_pep517_do_comp=
ile, <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
            <br>
            line 157<br>
            |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #2: do_compile, <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
            <br>
            line 152<br>
            |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #3: main, <br>
/tmp/sandeepg/yocto/2023.1/build-jupyter-kr260/work/cortexa72-cortexa53-xil=
inx-linux/python3-bqplot/0.12.36-r0/temp/run.do_compile.3777058,
            <br>
            line 161<br>
            ERROR: Task <br>
(/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/re=
cipes-python/python3-bqplot_0.12.36.bb:do_compile)
            <br>
            failed with exit code &#39;1&#39;<br>
            NOTE: Tasks Summary: Attempted 2249 tasks of which 2241
            didn&#39;t need to <br>
            be rerun and 1 failed.<br>
            <br>
            Summary: 1 task failed:<br>
/group/bcapps/sandeepg/yocto/2023.1/yp-dev/sources/poky/../meta-jupyter/rec=
ipes-python/python3-bqplot_0.12.36.bb:do_compile<br>
            Summary: There was 1 WARNING message.<br>
            Summary: There was 1 ERROR message, returning a non-zero
            exit code.<br>
            <br>
            Thanks,<br>
            <br>
            Sandeep<br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>

--00000000000090135805f348e0de--

