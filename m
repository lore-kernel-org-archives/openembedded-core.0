Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E502EC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 18:21:21 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.1109.1645554080402785933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dt/1mSoB;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a23so45355300eju.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FhbaLsoCANX2Cle6cKKUAXieG/hX7Oqp8RXE2tg01pE=;
        b=dt/1mSoBA5gUhsXCdiYy5bm0UjklWZHLDmoHEVkoWRMDICJ+oiriN/JiDW5uYZoFn4
         OKJTbShj6ZuYAV4MCt5+YZbAJdcVqsvWPI2c4iE33omHY5RFYnKL1PhrXKME2onm9Fmd
         8uanwVWW4LDX3t8Z8S/Kdy0TCODPKmUXqrboMRhE/pd49DvveCJc4P425cy5ppAltDhD
         3FP3kYlg+9eMC341L/NavzDMVy3ynRvSa7czV+Hj8ayPIelDvlrbM3GremArt1bMILk8
         r/WB89UyKNbW5UQ9+KRgFrPJqkMCLLVK/CPlC2gTTqu2ce0x8yeWL0ci9mVfvIbZqOsj
         TOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FhbaLsoCANX2Cle6cKKUAXieG/hX7Oqp8RXE2tg01pE=;
        b=kTQ99Ab32wvbdxqg+81iCSfPKnSxwE1bt8ZZLreHGvuZ9G8y19aP1xxUEwYg/06XXO
         YoN0ZJqhOSotxJsCQiFtPblJieXYu49vh202datl61pAUGrnobxgUX7aHRFd9MAxP8Wf
         zCSUjSHcjavMp6LmWeIawsJskl+OnZpQbyR0lAu9v+3csLBEZi/kuBUuo6qRuqrR8um0
         HPIxgSpGNaMyeJI4xh2cHkISA92JHKRrVdGzZub1o0qZXw8qf6CgJ/T9w5Q3H2S26orY
         5/hOewTGFJeXsdzyRVK5yrGS/kB9E4SnPYYHiCbtQfZ5AzRa6khZS+Adw1jbfQabBL6J
         jfWg==
X-Gm-Message-State: AOAM531PDTBYQaZ3ot1FakZmbVhe8Ad+mOc49D5Ws3zyBcGFPinPImlU
	ITSyI4JMl8xh2JlFBivdHbSMqI5/lXY0IVjUDPw=
X-Google-Smtp-Source: 
 ABdhPJw2bu99Wq7I+9YaWO1FgdA4MG7/K9QFExmCKe/U71l7diTqY9L8uFoNGBYlcWJFcUva5Lzt4KVswF9cgbIx6iU=
X-Received: by 2002:a17:906:f293:b0:6b6:bc93:f01f with SMTP id
 gu19-20020a170906f29300b006b6bc93f01fmr18887555ejb.743.1645554078632; Tue, 22
 Feb 2022 10:21:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645478020.git.tim.orling@konsulko.com>
 <CAMKF1sobUZW4FbtdoGpk7yj8XZwNht4YqwHD=ohT_CmOmDry3Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sobUZW4FbtdoGpk7yj8XZwNht4YqwHD=ohT_CmOmDry3Q@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 22 Feb 2022 10:21:07 -0800
Message-ID: 
 <CANx9H-Bx_AFnAnCjJSoMqS59pGR3dH5vuYN0fvLPdz+CBy=z7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 00/32] Python PEP-517: build wheels and
 install with pip
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000050cfda05d89f6aa1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 18:21:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162185

--00000000000050cfda05d89f6aa1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 9:22 AM Khem Raj <raj.khem@gmail.com> wrote:

> this is going into dep loops Try
>
> bitbake python3-wheel-native


It shouldn=E2=80=99t
https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/python=
/python3-wheel_0.37.1.bb?h=3Dtimo/bootstrap-wheels

DEPENDS:remove:class-native =3D "python3-pip-native"
do_install:class-native () {
    # We need to bootstrap python3-wheel-native
    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
    PYPA_WHEEL=3D"${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
    bbfatal_log "Failed to install"}


>
>
> On Mon, Feb 21, 2022 at 1:23 PM Tim Orling <ticotimo@gmail.com> wrote:
> >
> > Upstream Python is moving to pyproject.toml rather than setup.py and
> > wheels rather than eggs. The main place this is documented is in
> > PEP-517[1]. Installing packages with setup.py install is deprecated.
> >
> > We have a choice with the 'kirkstone' LTS release of introducing this
> > series (and fixing any fall out during the stabilization period) or
> > living with deprecated Python packaging for the duration of the LTS (at
> > a minimum 2 years). This seems to be a compelling enough reason to brin=
g
> > in this series, even if it results in a slight slip of the 'feature
> > freeze', which is officially tomorrow, Monday 21 Feb, 2022.
> >
> > This series bootstraps python3-setuptools-native,
> > python3-flit-core-native, python3-wheel-native and python3-pip-native,
> > simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This allows al=
l
> > other recipes to be installed with pip, as intended by upstream.
> >
> > Three new classes are introduced:
> > (1) flit_core which builds PEP-517 compliant packages which use
> >     flit_core.buildapi as their build-backend.
> > (2) setuptools_build_meta which builds PEP-517 compliant packages which
> use
> >     setuptools_build_meta  as their build-backend.
> > (3) pip_install_wheel, which simply installs wheels built by other
> >     classes.
> >
> > The original setuptools3.bbclass do_compile is modified to
> > 'setup.py bdist_wheel' (from python3-wheel-native) rather than the
> deprecated
> > 'setup.py build' mechanism.
> >
> > The original setuptools3.bbclass do_install is modified to
> > use the pip_install_wheel.bbclass to install wheels with pip rather tha=
n
> > the deprecated 'setup.py install' mechanism.
> >
> > For pip install, we disable dependency checking (--no-deps) because it
> > proves to be brittle in our environment without providing full wheel
> > cache that seems like overhead that we do not need. We also disable
> > fetching wheels from pypi (--no-index). This is no different than our
> > normal workflow of requiring dependencies to be defined in a recipe.
> >
> > Missing from this series is documentation of the new features, classes
> > and variables (this will be done under separate cover).
> >
> > Also desired and previously discussed in YP meetings is a helper
> > function to warn that a recipe which currently inherits setuptools3
> > but has a pyproject.toml and defines a build-system.build-backend shoul=
d
> > instead use of the new PEP-517 classes. This function is still in
> progress.
> >
> > During testing, recipes which use python3-setuptools-scm are failing to
> > determine the version of the python package, For several recipes, the f=
ix
> > was to use pyproject.toml and PEP-517 build backends. To be sure, other
> recipes
> > are still going to fail for the short term, until the root cause can be
> > determined. This was not seen again in v2 builds.
> >
> > Another PEP-517 build-backend, poetry.core.masonry.api has been
> > identified in recipes in meta-python, but not in oe-core. The
> > python3-poetry-core recipe is WIP, but brings in a number of
> > dependencies that are perhaps not worth it to bring into oe-core at thi=
s
> > time. Rather we can support these recipes in meta-python?
> >
> > Fixes in v2 include passing --root=3D${D} to pip install (rather than
> --target)
> > and also passing --prefix so that scripts are (usually) installed in th=
e
> proper
> > location. pip install also 'helpfully' overwrites python3 intepreter
> with nativepython3
> > in #!, so add a fix to return the values to what is actually correct
> (similar to what is
> > done in setuptools3.bbclass). Also several recipes still needed
> PIP_INSTALL_PACKAGE defined.
> >
> > Also added self as maintainer of new recipes.
> >
> > [YOCTO #14638]
> >
> > [1] https://www.python.org/dev/peps/pep-0517/
> >
> > The following changes since commit
> 41ae26ecab731f2fb6593df143476c94183be209:
> >
> >   releases: update to include 3.4.2 (2022-02-21 16:46:22 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.yoctoproject.org/git/poky-contrib timo/bootstrap-wheels
> >
> http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=3Dtimo/boots=
trap-wheels
> >
> > Tim Orling (32):
> >   python3-wheel: move 0.37.0 from meta-python
> >   python3-flit-core: add recipe for 3.6.0
> >   flit_core.bbclass: add helper for newer python packaging
> >   python3-wheel: inherit flit_core
> >   pip_install_wheel.bbclass: add helper class
> >   setuptools_build_meta.bbclass: add helper class
> >   python3-pip: inherit setuptools_build_meta
> >   python3-attrs: inherit setuptools_build_meta
> >   python3-git: inherit setuptools_build_meta
> >   python3-pytest: inherit setuptools_build_meta
> >   python3-setuptools-scm: inherit setuptools_build_meta
> >   python3-zipp: inherit setuptools_build_meta
> >   python3-iniconfig: inherit setuptools_build_meta
> >   python3-py: inherit setuptools_build_meta
> >   python3-pluggy: inherit setuptools_build_meta
> >   python3-setuptools: inherit setuptools_base_meta
> >   setuptools3.bbclass: refactor for wheels
> >   python3-more-itertools: set PIP_INSTALL_PACKAGE
> >   meson: inherit setuptools_build_meta
> >   python3-libarchive-d: set PIP_INSTALL_PACKAGE
> >   python3-smartypants: patch hash bang to python3
> >   python3-scons: merge -native recipe
> >   python3-subunit: merge inc; set PIP_INSTALL_PACKAGE
> >   python3-magic: set PIP_INSTALL_PACKAGE
> >   bmap-tools: set PIP_INSTALL_PACKAGE, BASEVER
> >   asciidoc: set PIP_INSTALL_PACKAGE
> >   gi-docgen: set PIP_INSTALL_PACKAGE
> >   numpy: set PIP_INSTALL_PACKAGE
> >   python3-dbusmock: set PIP_INSTALL_PACKAGE
> >   python3-mako: inherit setuptools_build_meta
> >   python3-packaging: inherit setuptools_build_meta
> >   python3-nose: drop recipe
> >
> >  meta/classes/flit_core.bbclass                |  16 +++
> >  meta/classes/pip_install_wheel.bbclass        |  37 +++++++
> >  meta/classes/setuptools3.bbclass              |  20 ++--
> >  meta/classes/setuptools_build_meta.bbclass    |  18 ++++
> >  meta/conf/distro/include/maintainers.inc      |   3 +-
> >  meta/recipes-devtools/meson/meson_0.61.2.bb   |   4 +-
> >  meta/recipes-devtools/python/python-nose.inc  |  18 ----
> >  .../python/python-subunit.inc                 |  14 ---
> >  .../python/python3-attrs_21.4.0.bb            |   2 +-
> >  .../python/python3-dbusmock_0.25.0.bb         |   1 +
> >  .../python/python3-flit-core_3.6.0.bb         |  41 +++++++
> >  .../python/python3-git_3.1.26.bb              |   2 +-
> >  .../python/python3-iniconfig_1.1.1.bb         |   4 +-
> >  .../python/python3-libarchive-c_4.0.bb        |   2 +
> >  .../python/python3-magic_0.4.25.bb            |   1 +
> >  .../python/python3-mako_1.1.6.bb              |   2 +-
> >  .../python/python3-more-itertools_8.12.0.bb   |   2 +
> >  .../python/python3-nose_1.3.7.bb              |   2 -
> >  .../python/python3-numpy_1.22.2.bb            |   1 +
> >  .../python/python3-packaging_21.3.bb          |   2 +-
> >  .../python/python3-pip_22.0.3.bb              |  19 +++-
> >  .../python/python3-pluggy_1.0.0.bb            |   2 +-
> >  .../python/python3-py_1.11.0.bb               |   2 +-
> >  .../python/python3-pytest_7.0.1.bb            |   4 +-
> >  .../python/python3-scons-native_4.3.0.bb      |   7 --
> >  .../python/python3-scons_4.3.0.bb             |  13 ++-
> >  .../python/python3-setuptools-scm_6.4.2.bb    |   2 +-
> >  .../python/python3-setuptools_59.5.0.bb       |  19 +++-
> >  .../0001-Change-hash-bang-to-python3.patch    |  47 ++++++++
> >  .../python/python3-smartypants_2.0.0.bb       |   1 +
> >  ...001-setup.py-use-vendored-_distutils.patch |  27 +++++
> >  .../python/python3-strict-rfc3339_0.7.bb      |   4 +-
> >  .../python/python3-subunit_1.4.0.bb           |  17 ++-
> >  ...roject.toml-from-flit-backend-branch.patch | 100 ++++++++++++++++++
> >  .../python/python3-wheel_0.37.1.bb            |  24 +++++
> >  .../python/python3-zipp_3.7.0.bb              |   2 +-
> >  .../asciidoc/asciidoc_10.1.1.bb               |   1 +
> >  meta/recipes-gnome/gi-docgen/gi-docgen_git.bb |   1 +
> >  .../{bmap-tools_3.6.bb =3D> bmap-tools_git.bb}  |   6 +-
> >  39 files changed, 412 insertions(+), 78 deletions(-)
> >  create mode 100644 meta/classes/flit_core.bbclass
> >  create mode 100644 meta/classes/pip_install_wheel.bbclass
> >  create mode 100644 meta/classes/setuptools_build_meta.bbclass
> >  delete mode 100644 meta/recipes-devtools/python/python-nose.inc
> >  delete mode 100644 meta/recipes-devtools/python/python-subunit.inc
> >  create mode 100644 meta/recipes-devtools/python/
> python3-flit-core_3.6.0.bb
> >  delete mode 100644 meta/recipes-devtools/python/python3-nose_1.3.7.bb
> >  delete mode 100644 meta/recipes-devtools/python/
> python3-scons-native_4.3.0.bb
> >  create mode 100644
> meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-to=
-python3.patch
> >  create mode 100644
> meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-ven=
dored-_distutils.patch
> >  create mode 100644
> meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-f=
rom-flit-backend-branch.patch
> >  create mode 100644 meta/recipes-devtools/python/python3-wheel_0.37.1.b=
b
> >  rename meta/recipes-support/bmap-tools/{bmap-tools_3.6.bb =3D>
> bmap-tools_git.bb} (86%)
> >
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#162076):
> https://lists.openembedded.org/g/openembedded-core/message/162076
> > Mute This Topic: https://lists.openembedded.org/mt/89304007/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000050cfda05d89f6aa1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 22, 2022 at 9:22 AM Khem Raj &lt;<a href=3D"mai=
lto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">this is going into dep loops Try<br>
<br>
bitbake python3-wheel-native</blockquote><div dir=3D"auto"><br></div><div d=
ir=3D"auto">It shouldn=E2=80=99t=C2=A0</div><div dir=3D"auto"><div><a href=
=3D"https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/py=
thon/python3-wheel_0.37.1.bb?h=3Dtimo/bootstrap-wheels">https://git.yoctopr=
oject.org/poky-contrib/tree/meta/recipes-devtools/python/python3-wheel_0.37=
.1.bb?h=3Dtimo/bootstrap-wheels</a></div><br></div><div dir=3D"auto"><pre s=
tyle=3D"padding:0px;margin-top:0px;margin-bottom:0px;font-size:13.333333015=
441895px;font-family:monospace;color:rgb(0,0,0)"><span class=3D"nv" style=
=3D"font-family:monospace;color:rgb(51,102,153)">DEPENDS</span><span class=
=3D"p" style=3D"font-family:monospace">:</span><span class=3D"nv" style=3D"=
font-family:monospace;color:rgb(51,102,153)">remove</span><span class=3D"p"=
 style=3D"font-family:monospace">:</span><span class=3D"nv" style=3D"font-f=
amily:monospace;color:rgb(51,102,153)">class</span><span class=3D"o" style=
=3D"font-family:monospace">-</span><span class=3D"nv" style=3D"font-family:=
monospace;color:rgb(51,102,153)">native</span> <span class=3D"o" style=3D"f=
ont-family:monospace">=3D</span> <span class=3D"s2" style=3D"font-family:mo=
nospace;background-color:rgb(255,240,240);color:rgb(221,34,0)">&quot;python=
3-pip-native&quot;</span>

<span class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)">do=
_install</span><span class=3D"p" style=3D"font-family:monospace">:</span><s=
pan class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)">clas=
s</span><span class=3D"o" style=3D"font-family:monospace">-</span><span cla=
ss=3D"nf" style=3D"font-weight:bold;font-family:monospace;color:rgb(0,102,1=
87)">native</span> <span class=3D"p" style=3D"font-family:monospace">()</sp=
an> <span class=3D"err" style=3D"font-family:monospace;background-color:rgb=
(227,210,210);color:rgb(166,23,23)">{</span>
    <span class=3D"err" style=3D"font-family:monospace;background-color:rgb=
(227,210,210);color:rgb(166,23,23)">#</span> <span class=3D"nv" style=3D"fo=
nt-family:monospace;color:rgb(51,102,153)">We</span> <span class=3D"nv" sty=
le=3D"font-family:monospace;color:rgb(51,102,153)">need</span> <span class=
=3D"kr" style=3D"font-weight:bold;font-family:monospace;color:rgb(0,136,0)"=
>to</span> <span class=3D"nv" style=3D"font-family:monospace;color:rgb(51,1=
02,153)">bootstrap</span> <span class=3D"nv" style=3D"font-family:monospace=
;color:rgb(51,102,153)">python3</span><span class=3D"o" style=3D"font-famil=
y:monospace">-</span><span class=3D"nv" style=3D"font-family:monospace;colo=
r:rgb(51,102,153)">wheel</span><span class=3D"o" style=3D"font-family:monos=
pace">-</span><span class=3D"nv" style=3D"font-family:monospace;color:rgb(5=
1,102,153)">native</span>
    <span class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)=
">install</span> <span class=3D"o" style=3D"font-family:monospace">-</span>=
<span class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)">d<=
/span> <span class=3D"kt" style=3D"font-weight:bold;font-family:monospace;c=
olor:rgb(136,136,136)">$</span><span class=3D"err" style=3D"font-family:mon=
ospace;background-color:rgb(227,210,210);color:rgb(166,23,23)">{</span><spa=
n class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)">D</spa=
n><span class=3D"err" style=3D"font-family:monospace;background-color:rgb(2=
27,210,210);color:rgb(166,23,23)">}${</span><span class=3D"nv" style=3D"fon=
t-family:monospace;color:rgb(51,102,153)">PYTHON_SITEPACKAGES_DIR</span><sp=
an class=3D"err" style=3D"font-family:monospace;background-color:rgb(227,21=
0,210);color:rgb(166,23,23)">}</span>
    <span class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)=
">PYPA_WHEEL</span><span class=3D"o" style=3D"font-family:monospace">=3D</s=
pan><span class=3D"s2" style=3D"font-family:monospace;background-color:rgb(=
255,240,240);color:rgb(221,34,0)">&quot;${B}/dist/${PYPI_PACKAGE}-${PV}-*.w=
hl&quot;</span>
    <span class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)=
">unzip</span> <span class=3D"o" style=3D"font-family:monospace">-</span><s=
pan class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)">d</s=
pan> <span class=3D"kt" style=3D"font-weight:bold;font-family:monospace;col=
or:rgb(136,136,136)">$</span><span class=3D"err" style=3D"font-family:monos=
pace;background-color:rgb(227,210,210);color:rgb(166,23,23)">{</span><span =
class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)">D</span>=
<span class=3D"err" style=3D"font-family:monospace;background-color:rgb(227=
,210,210);color:rgb(166,23,23)">}${</span><span class=3D"nv" style=3D"font-=
family:monospace;color:rgb(51,102,153)">PYTHON_SITEPACKAGES_DIR</span><span=
 class=3D"err" style=3D"font-family:monospace;background-color:rgb(227,210,=
210);color:rgb(166,23,23)">}</span> <span class=3D"err" style=3D"font-famil=
y:monospace;background-color:rgb(227,210,210);color:rgb(166,23,23)">${</spa=
n><span class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)">=
PYPA_WHEEL</span><span class=3D"err" style=3D"font-family:monospace;backgro=
und-color:rgb(227,210,210);color:rgb(166,23,23)">}</span> <span class=3D"er=
r" style=3D"font-family:monospace;background-color:rgb(227,210,210);color:r=
gb(166,23,23)">||</span> <span class=3D"p" style=3D"font-family:monospace">=
\</span>
    <span class=3D"nv" style=3D"font-family:monospace;color:rgb(51,102,153)=
">bbfatal_log</span> <span class=3D"s2" style=3D"font-family:monospace;back=
ground-color:rgb(255,240,240);color:rgb(221,34,0)">&quot;Failed to install&=
quot;</span>
<span class=3D"err" style=3D"font-family:monospace;background-color:rgb(227=
,210,210);color:rgb(166,23,23)">}</span></pre></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D=
"auto"><br>
<br>
<br>
On Mon, Feb 21, 2022 at 1:23 PM Tim Orling &lt;<a href=3D"mailto:ticotimo@g=
mail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Upstream Python is moving to pyproject.toml rather than setup.py and<b=
r>
&gt; wheels rather than eggs. The main place this is documented is in<br>
&gt; PEP-517[1]. Installing packages with setup.py install is deprecated.<b=
r>
&gt;<br>
&gt; We have a choice with the &#39;kirkstone&#39; LTS release of introduci=
ng this<br>
&gt; series (and fixing any fall out during the stabilization period) or<br=
>
&gt; living with deprecated Python packaging for the duration of the LTS (a=
t<br>
&gt; a minimum 2 years). This seems to be a compelling enough reason to bri=
ng<br>
&gt; in this series, even if it results in a slight slip of the &#39;featur=
e<br>
&gt; freeze&#39;, which is officially tomorrow, Monday 21 Feb, 2022.<br>
&gt;<br>
&gt; This series bootstraps python3-setuptools-native,<br>
&gt; python3-flit-core-native, python3-wheel-native and python3-pip-native,=
<br>
&gt; simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This allows a=
ll<br>
&gt; other recipes to be installed with pip, as intended by upstream.<br>
&gt;<br>
&gt; Three new classes are introduced:<br>
&gt; (1) flit_core which builds PEP-517 compliant packages which use<br>
&gt;=C2=A0 =C2=A0 =C2=A0flit_core.buildapi as their build-backend.<br>
&gt; (2) setuptools_build_meta which builds PEP-517 compliant packages whic=
h use<br>
&gt;=C2=A0 =C2=A0 =C2=A0setuptools_build_meta=C2=A0 as their build-backend.=
<br>
&gt; (3) pip_install_wheel, which simply installs wheels built by other<br>
&gt;=C2=A0 =C2=A0 =C2=A0classes.<br>
&gt;<br>
&gt; The original setuptools3.bbclass do_compile is modified to<br>
&gt; &#39;setup.py bdist_wheel&#39; (from python3-wheel-native) rather than=
 the deprecated<br>
&gt; &#39;setup.py build&#39; mechanism.<br>
&gt;<br>
&gt; The original setuptools3.bbclass do_install is modified to<br>
&gt; use the pip_install_wheel.bbclass to install wheels with pip rather th=
an<br>
&gt; the deprecated &#39;setup.py install&#39; mechanism.<br>
&gt;<br>
&gt; For pip install, we disable dependency checking (--no-deps) because it=
<br>
&gt; proves to be brittle in our environment without providing full wheel<b=
r>
&gt; cache that seems like overhead that we do not need. We also disable<br=
>
&gt; fetching wheels from pypi (--no-index). This is no different than our<=
br>
&gt; normal workflow of requiring dependencies to be defined in a recipe.<b=
r>
&gt;<br>
&gt; Missing from this series is documentation of the new features, classes=
<br>
&gt; and variables (this will be done under separate cover).<br>
&gt;<br>
&gt; Also desired and previously discussed in YP meetings is a helper<br>
&gt; function to warn that a recipe which currently inherits setuptools3<br=
>
&gt; but has a pyproject.toml and defines a build-system.build-backend shou=
ld<br>
&gt; instead use of the new PEP-517 classes. This function is still in prog=
ress.<br>
&gt;<br>
&gt; During testing, recipes which use python3-setuptools-scm are failing t=
o<br>
&gt; determine the version of the python package, For several recipes, the =
fix<br>
&gt; was to use pyproject.toml and PEP-517 build backends. To be sure, othe=
r recipes<br>
&gt; are still going to fail for the short term, until the root cause can b=
e<br>
&gt; determined. This was not seen again in v2 builds.<br>
&gt;<br>
&gt; Another PEP-517 build-backend, poetry.core.masonry.api has been<br>
&gt; identified in recipes in meta-python, but not in oe-core. The<br>
&gt; python3-poetry-core recipe is WIP, but brings in a number of<br>
&gt; dependencies that are perhaps not worth it to bring into oe-core at th=
is<br>
&gt; time. Rather we can support these recipes in meta-python?<br>
&gt;<br>
&gt; Fixes in v2 include passing --root=3D${D} to pip install (rather than =
--target)<br>
&gt; and also passing --prefix so that scripts are (usually) installed in t=
he proper<br>
&gt; location. pip install also &#39;helpfully&#39; overwrites python3 inte=
preter with nativepython3<br>
&gt; in #!, so add a fix to return the values to what is actually correct (=
similar to what is<br>
&gt; done in setuptools3.bbclass). Also several recipes still needed PIP_IN=
STALL_PACKAGE defined.<br>
&gt;<br>
&gt; Also added self as maintainer of new recipes.<br>
&gt;<br>
&gt; [YOCTO #14638]<br>
&gt;<br>
&gt; [1] <a href=3D"https://www.python.org/dev/peps/pep-0517/" rel=3D"noref=
errer" target=3D"_blank">https://www.python.org/dev/peps/pep-0517/</a><br>
&gt;<br>
&gt; The following changes since commit 41ae26ecab731f2fb6593df143476c94183=
be209:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0releases: update to include 3.4.2 (2022-02-21 16:46:22 +00=
00)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.yoctoproject.org/git/poky-cont=
rib" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/git/poky-con=
trib</a> timo/bootstrap-wheels<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/git/poky-c=
ontrib/log/?h=3Dtimo/bootstrap-wheels" rel=3D"noreferrer" target=3D"_blank"=
>http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=3Dtimo/bootst=
rap-wheels</a><br>
&gt;<br>
&gt; Tim Orling (32):<br>
&gt;=C2=A0 =C2=A0python3-wheel: move 0.37.0 from meta-python<br>
&gt;=C2=A0 =C2=A0python3-flit-core: add recipe for 3.6.0<br>
&gt;=C2=A0 =C2=A0flit_core.bbclass: add helper for newer python packaging<b=
r>
&gt;=C2=A0 =C2=A0python3-wheel: inherit flit_core<br>
&gt;=C2=A0 =C2=A0pip_install_wheel.bbclass: add helper class<br>
&gt;=C2=A0 =C2=A0setuptools_build_meta.bbclass: add helper class<br>
&gt;=C2=A0 =C2=A0python3-pip: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-attrs: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-git: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-pytest: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-setuptools-scm: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-zipp: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-iniconfig: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-py: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-pluggy: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-setuptools: inherit setuptools_base_meta<br>
&gt;=C2=A0 =C2=A0setuptools3.bbclass: refactor for wheels<br>
&gt;=C2=A0 =C2=A0python3-more-itertools: set PIP_INSTALL_PACKAGE<br>
&gt;=C2=A0 =C2=A0meson: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-libarchive-d: set PIP_INSTALL_PACKAGE<br>
&gt;=C2=A0 =C2=A0python3-smartypants: patch hash bang to python3<br>
&gt;=C2=A0 =C2=A0python3-scons: merge -native recipe<br>
&gt;=C2=A0 =C2=A0python3-subunit: merge inc; set PIP_INSTALL_PACKAGE<br>
&gt;=C2=A0 =C2=A0python3-magic: set PIP_INSTALL_PACKAGE<br>
&gt;=C2=A0 =C2=A0bmap-tools: set PIP_INSTALL_PACKAGE, BASEVER<br>
&gt;=C2=A0 =C2=A0asciidoc: set PIP_INSTALL_PACKAGE<br>
&gt;=C2=A0 =C2=A0gi-docgen: set PIP_INSTALL_PACKAGE<br>
&gt;=C2=A0 =C2=A0numpy: set PIP_INSTALL_PACKAGE<br>
&gt;=C2=A0 =C2=A0python3-dbusmock: set PIP_INSTALL_PACKAGE<br>
&gt;=C2=A0 =C2=A0python3-mako: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-packaging: inherit setuptools_build_meta<br>
&gt;=C2=A0 =C2=A0python3-nose: drop recipe<br>
&gt;<br>
&gt;=C2=A0 meta/classes/flit_core.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +++<br>
&gt;=C2=A0 meta/classes/pip_install_wheel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 37 +++++++<br>
&gt;=C2=A0 meta/classes/setuptools3.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 20 ++--<br>
&gt;=C2=A0 meta/classes/setuptools_build_meta.bbclass=C2=A0 =C2=A0 |=C2=A0 =
18 ++++<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +-<br>
&gt;=C2=A0 meta/recipes-devtools/meson/<a href=3D"http://meson_0.61.2.bb" r=
el=3D"noreferrer" target=3D"_blank">meson_0.61.2.bb</a>=C2=A0 =C2=A0|=C2=A0=
 =C2=A04 +-<br>
&gt;=C2=A0 meta/recipes-devtools/python/python-nose.inc=C2=A0 |=C2=A0 18 --=
--<br>
&gt;=C2=A0 .../python/python-subunit.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 ---<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-attrs_21.4.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-attrs_21.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-dbusmock_0.25.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-dbusmock_0.25.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-flit-core_3.6.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-flit-core_3.6.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 41 +++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-git_3.1.26.bb" rel=3D"noref=
errer" target=3D"_blank">python3-git_3.1.26.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-iniconfig_1.1.1.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-iniconfig_1.1.1.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-libarchive-c_4.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-libarchive-c_4.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-magic_0.4.25.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-magic_0.4.25.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-mako_1.1.6.bb" rel=3D"noref=
errer" target=3D"_blank">python3-mako_1.1.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-more-itertools_8.12.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-more-itertools_8.12.0.bb</a>=C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-nose_1.3.7.bb" rel=3D"noref=
errer" target=3D"_blank">python3-nose_1.3.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-numpy_1.22.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-numpy_1.22.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-packaging_21.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-packaging_21.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pip_22.0.3.bb" rel=3D"noref=
errer" target=3D"_blank">python3-pip_22.0.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +++-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pluggy_1.0.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-pluggy_1.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-py_1.11.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-py_1.11.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-pytest_7.0.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-pytest_7.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-scons-native_4.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-scons-native_4.3.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A07 --<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-scons_4.3.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-scons_4.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 ++-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-setuptools-scm_6.4.2.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-setuptools-scm_6.4.2.bb</a>=C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-setuptools_59.5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-setuptools_59.5.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 19 +++-<br>
&gt;=C2=A0 .../0001-Change-hash-bang-to-python3.patch=C2=A0 =C2=A0 |=C2=A0 =
47 ++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-smartypants_2.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-smartypants_2.0.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 ...001-setup.py-use-vendored-_distutils.patch |=C2=A0 27 +++++<b=
r>
&gt;=C2=A0 .../python/<a href=3D"http://python3-strict-rfc3339_0.7.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-strict-rfc3339_0.7.bb</a>=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-subunit_1.4.0.bb" rel=3D"no=
referrer" target=3D"_blank">python3-subunit_1.4.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 ++-<br>
&gt;=C2=A0 ...roject.toml-from-flit-backend-branch.patch | 100 ++++++++++++=
++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-wheel_0.37.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-wheel_0.37.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 +++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-zipp_3.7.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-zipp_3.7.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 .../asciidoc/<a href=3D"http://asciidoc_10.1.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">asciidoc_10.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 meta/recipes-gnome/gi-docgen/<a href=3D"http://gi-docgen_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">gi-docgen_git.bb</a> |=C2=A0 =C2=A01 =
+<br>
&gt;=C2=A0 .../{<a href=3D"http://bmap-tools_3.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">bmap-tools_3.6.bb</a> =3D&gt; <a href=3D"http://bmap-tools_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_git.bb</a>}=C2=A0 |=
=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 39 files changed, 412 insertions(+), 78 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/classes/flit_core.bbclass<br>
&gt;=C2=A0 create mode 100644 meta/classes/pip_install_wheel.bbclass<br>
&gt;=C2=A0 create mode 100644 meta/classes/setuptools_build_meta.bbclass<br=
>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python-nose.inc<=
br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python-subunit.i=
nc<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-flit-core_3.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
flit-core_3.6.0.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-nose_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-nose_=
1.3.7.bb</a><br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-scons-native_4.3.0.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-scons-native_4.3.0.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-smartypa=
nts/0001-Change-hash-bang-to-python3.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-strict-r=
fc3339/0001-setup.py-use-vendored-_distutils.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-wheel/00=
01-Backport-pyproject.toml-from-flit-backend-branch.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-wheel_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-whe=
el_0.37.1.bb</a><br>
&gt;=C2=A0 rename meta/recipes-support/bmap-tools/{<a href=3D"http://bmap-t=
ools_3.6.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.6.bb</a> =3D=
&gt; <a href=3D"http://bmap-tools_git.bb" rel=3D"noreferrer" target=3D"_bla=
nk">bmap-tools_git.bb</a>} (86%)<br>
&gt;<br>
&gt; --<br>
&gt; 2.30.2<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#162076): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/162076" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/162076</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89304007=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/89304007/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--00000000000050cfda05d89f6aa1--

