Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E183BC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 18:43:31 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.1374.1645555399121382032
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EYsfa5tY;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: ticotimo@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id qk11so45763750ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 10:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pzl0ApEZqCPpsd+kYHsOq9ynC60IQUTDuIkawBdUgvg=;
        b=EYsfa5tYN/JTSdfJT7/IWoH6rVx+ZaFCKzLxDvTE+SXjzNs/lSFoUAmGyp+QGDJyhp
         3WE4BDXQLRUqN0KYYs5xQ8k2kMVEVWfSgzdwyZVX/qm60i+16/YGP24fIC11vRI47YMg
         r2QIEVJ8Di0lwb7W1Bc8R0sbGmSQSUZPN3Y85YbwPAT1cz6ciJ1gCsXDO9gKhNEDyFaT
         1ZlrjgVg8ixbijHRkv1Ujr7xnEyLJyCiwpptHlYBE4kG9S13bJjoYs8wIlrL6OQ44nh6
         B690AdA2mQyxtaB2iZeXBVW3IG9omFkSCHxgp7ptoAPEYar7cPlQ3kNJoeGMmCQZeupj
         gAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pzl0ApEZqCPpsd+kYHsOq9ynC60IQUTDuIkawBdUgvg=;
        b=wEFNVx/ht1TdB+gcp4ozGgnmvOoNLJ1Jc6Kcawytl5szekxUkQR/57NIFsqaPKs0tb
         R8ven7nD9y4eTV6mt33dqj9P61DmQjccXF4cPqFo30vYg9wnpmGJgVyWRuXIW0ped/tx
         7r2CJZam4rELI64TelArledo3ObS1M9BnZJURen8VmfyeWtX+wAv+/nWwbxyvR3ClgKs
         ReQWS4nnfeTs9XC6nzpcRLFgDJFd6yCFCYDu08UxkpDUVoca4Ozky5H7HlSh99XiQ9YW
         VszwItq6EJrhQnjrnwJs6YdnoXrS/tl3pVSnEIaJwIequLW1lqHbZyb/iG5tg/fy9xf5
         dKtQ==
X-Gm-Message-State: AOAM5329FEp0YfaK6DBDwVS36CA16eqrGO53z2QAPv8YZxwDoqZ2FsMp
	hC9RoUFulAxvywkslN4pvJksYea6XCE9XywRwpykPklj1go=
X-Google-Smtp-Source: 
 ABdhPJzUXcjApuiTuzphFVkG/GErpUhOkq7DQMTJpP7Vf4jVXy+i0z0RQo0jTjcknU2vka3NnUcWZPqnLwU8HQAdWlA=
X-Received: by 2002:a17:906:154c:b0:6ce:21d7:2826 with SMTP id
 c12-20020a170906154c00b006ce21d72826mr20137146ejd.9.1645555397541; Tue, 22
 Feb 2022 10:43:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645478020.git.tim.orling@konsulko.com>
 <CAMKF1sobUZW4FbtdoGpk7yj8XZwNht4YqwHD=ohT_CmOmDry3Q@mail.gmail.com>
 <CANx9H-Bx_AFnAnCjJSoMqS59pGR3dH5vuYN0fvLPdz+CBy=z7A@mail.gmail.com>
 <CAMKF1sqNCMhH9_OoVzewjvd1SOHsF+5z3WFBmp51itSsh-eEzA@mail.gmail.com>
 <CANx9H-D-4RZgg4y=B+2QwyCghiwT0uEDHyquxMz6aaVw-cBa0g@mail.gmail.com>
In-Reply-To: 
 <CANx9H-D-4RZgg4y=B+2QwyCghiwT0uEDHyquxMz6aaVw-cBa0g@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 22 Feb 2022 10:43:06 -0800
Message-ID: 
 <CANx9H-Cb9tuNe9SCbSGUn26RgureKk1xkExm8zdARQcER+SmNw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 00/32] Python PEP-517: build wheels and
 install with pip
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000edde6905d89fb8b8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 18:43:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162189

--000000000000edde6905d89fb8b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 22, 2022 at 10:39 AM Tim Orling <ticotimo@gmail.com> wrote:

>
>
> On Tue, Feb 22, 2022 at 10:24 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Tue, Feb 22, 2022 at 10:21 AM Tim Orling <ticotimo@gmail.com> wrote:
>> >
>> >
>> >
>> > On Tue, Feb 22, 2022 at 9:22 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> this is going into dep loops Try
>> >>
>> >> bitbake python3-wheel-native
>> >
>> >
>> > It shouldn=E2=80=99t
>> >
>> https://git.yoctoproject.org/poky-contrib/tree/meta/recipes-devtools/pyt=
hon/python3-wheel_0.37.1.bb?h=3Dtimo/bootstrap-wheels
>> >
>>
>> I have been trying whats on master-next
>>
>>
> I can't reproduce. Can you point me at an error log please?
> It might have something to do with sstate cache, but that's just a hunch.
>
>
Ah. I bet you have meta-python in the bblayers and therefore python3-wheel
recipe from meta-python is winning.


> > DEPENDS:remove:class-native =3D "python3-pip-native"
>> >
>> > do_install:class-native () {
>> >     # We need to bootstrap python3-wheel-native
>> >     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
>> >     PYPA_WHEEL=3D"${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
>> >     unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
>> >     bbfatal_log "Failed to install"
>> > }
>> >>
>> >>
>> >>
>> >>
>> >> On Mon, Feb 21, 2022 at 1:23 PM Tim Orling <ticotimo@gmail.com> wrote=
:
>> >> >
>> >> > Upstream Python is moving to pyproject.toml rather than setup.py an=
d
>> >> > wheels rather than eggs. The main place this is documented is in
>> >> > PEP-517[1]. Installing packages with setup.py install is deprecated=
.
>> >> >
>> >> > We have a choice with the 'kirkstone' LTS release of introducing th=
is
>> >> > series (and fixing any fall out during the stabilization period) or
>> >> > living with deprecated Python packaging for the duration of the LTS
>> (at
>> >> > a minimum 2 years). This seems to be a compelling enough reason to
>> bring
>> >> > in this series, even if it results in a slight slip of the 'feature
>> >> > freeze', which is officially tomorrow, Monday 21 Feb, 2022.
>> >> >
>> >> > This series bootstraps python3-setuptools-native,
>> >> > python3-flit-core-native, python3-wheel-native and
>> python3-pip-native,
>> >> > simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This allow=
s
>> all
>> >> > other recipes to be installed with pip, as intended by upstream.
>> >> >
>> >> > Three new classes are introduced:
>> >> > (1) flit_core which builds PEP-517 compliant packages which use
>> >> >     flit_core.buildapi as their build-backend.
>> >> > (2) setuptools_build_meta which builds PEP-517 compliant packages
>> which use
>> >> >     setuptools_build_meta  as their build-backend.
>> >> > (3) pip_install_wheel, which simply installs wheels built by other
>> >> >     classes.
>> >> >
>> >> > The original setuptools3.bbclass do_compile is modified to
>> >> > 'setup.py bdist_wheel' (from python3-wheel-native) rather than the
>> deprecated
>> >> > 'setup.py build' mechanism.
>> >> >
>> >> > The original setuptools3.bbclass do_install is modified to
>> >> > use the pip_install_wheel.bbclass to install wheels with pip rather
>> than
>> >> > the deprecated 'setup.py install' mechanism.
>> >> >
>> >> > For pip install, we disable dependency checking (--no-deps) because
>> it
>> >> > proves to be brittle in our environment without providing full whee=
l
>> >> > cache that seems like overhead that we do not need. We also disable
>> >> > fetching wheels from pypi (--no-index). This is no different than o=
ur
>> >> > normal workflow of requiring dependencies to be defined in a recipe=
.
>> >> >
>> >> > Missing from this series is documentation of the new features,
>> classes
>> >> > and variables (this will be done under separate cover).
>> >> >
>> >> > Also desired and previously discussed in YP meetings is a helper
>> >> > function to warn that a recipe which currently inherits setuptools3
>> >> > but has a pyproject.toml and defines a build-system.build-backend
>> should
>> >> > instead use of the new PEP-517 classes. This function is still in
>> progress.
>> >> >
>> >> > During testing, recipes which use python3-setuptools-scm are failin=
g
>> to
>> >> > determine the version of the python package, For several recipes,
>> the fix
>> >> > was to use pyproject.toml and PEP-517 build backends. To be sure,
>> other recipes
>> >> > are still going to fail for the short term, until the root cause ca=
n
>> be
>> >> > determined. This was not seen again in v2 builds.
>> >> >
>> >> > Another PEP-517 build-backend, poetry.core.masonry.api has been
>> >> > identified in recipes in meta-python, but not in oe-core. The
>> >> > python3-poetry-core recipe is WIP, but brings in a number of
>> >> > dependencies that are perhaps not worth it to bring into oe-core at
>> this
>> >> > time. Rather we can support these recipes in meta-python?
>> >> >
>> >> > Fixes in v2 include passing --root=3D${D} to pip install (rather th=
an
>> --target)
>> >> > and also passing --prefix so that scripts are (usually) installed i=
n
>> the proper
>> >> > location. pip install also 'helpfully' overwrites python3 inteprete=
r
>> with nativepython3
>> >> > in #!, so add a fix to return the values to what is actually correc=
t
>> (similar to what is
>> >> > done in setuptools3.bbclass). Also several recipes still needed
>> PIP_INSTALL_PACKAGE defined.
>> >> >
>> >> > Also added self as maintainer of new recipes.
>> >> >
>> >> > [YOCTO #14638]
>> >> >
>> >> > [1] https://www.python.org/dev/peps/pep-0517/
>> >> >
>> >> > The following changes since commit
>> 41ae26ecab731f2fb6593df143476c94183be209:
>> >> >
>> >> >   releases: update to include 3.4.2 (2022-02-21 16:46:22 +0000)
>> >> >
>> >> > are available in the Git repository at:
>> >> >
>> >> >   git://git.yoctoproject.org/git/poky-contrib timo/bootstrap-wheels
>> >> >
>> http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=3Dtimo/boot=
strap-wheels
>> >> >
>> >> > Tim Orling (32):
>> >> >   python3-wheel: move 0.37.0 from meta-python
>> >> >   python3-flit-core: add recipe for 3.6.0
>> >> >   flit_core.bbclass: add helper for newer python packaging
>> >> >   python3-wheel: inherit flit_core
>> >> >   pip_install_wheel.bbclass: add helper class
>> >> >   setuptools_build_meta.bbclass: add helper class
>> >> >   python3-pip: inherit setuptools_build_meta
>> >> >   python3-attrs: inherit setuptools_build_meta
>> >> >   python3-git: inherit setuptools_build_meta
>> >> >   python3-pytest: inherit setuptools_build_meta
>> >> >   python3-setuptools-scm: inherit setuptools_build_meta
>> >> >   python3-zipp: inherit setuptools_build_meta
>> >> >   python3-iniconfig: inherit setuptools_build_meta
>> >> >   python3-py: inherit setuptools_build_meta
>> >> >   python3-pluggy: inherit setuptools_build_meta
>> >> >   python3-setuptools: inherit setuptools_base_meta
>> >> >   setuptools3.bbclass: refactor for wheels
>> >> >   python3-more-itertools: set PIP_INSTALL_PACKAGE
>> >> >   meson: inherit setuptools_build_meta
>> >> >   python3-libarchive-d: set PIP_INSTALL_PACKAGE
>> >> >   python3-smartypants: patch hash bang to python3
>> >> >   python3-scons: merge -native recipe
>> >> >   python3-subunit: merge inc; set PIP_INSTALL_PACKAGE
>> >> >   python3-magic: set PIP_INSTALL_PACKAGE
>> >> >   bmap-tools: set PIP_INSTALL_PACKAGE, BASEVER
>> >> >   asciidoc: set PIP_INSTALL_PACKAGE
>> >> >   gi-docgen: set PIP_INSTALL_PACKAGE
>> >> >   numpy: set PIP_INSTALL_PACKAGE
>> >> >   python3-dbusmock: set PIP_INSTALL_PACKAGE
>> >> >   python3-mako: inherit setuptools_build_meta
>> >> >   python3-packaging: inherit setuptools_build_meta
>> >> >   python3-nose: drop recipe
>> >> >
>> >> >  meta/classes/flit_core.bbclass                |  16 +++
>> >> >  meta/classes/pip_install_wheel.bbclass        |  37 +++++++
>> >> >  meta/classes/setuptools3.bbclass              |  20 ++--
>> >> >  meta/classes/setuptools_build_meta.bbclass    |  18 ++++
>> >> >  meta/conf/distro/include/maintainers.inc      |   3 +-
>> >> >  meta/recipes-devtools/meson/meson_0.61.2.bb   |   4 +-
>> >> >  meta/recipes-devtools/python/python-nose.inc  |  18 ----
>> >> >  .../python/python-subunit.inc                 |  14 ---
>> >> >  .../python/python3-attrs_21.4.0.bb            |   2 +-
>> >> >  .../python/python3-dbusmock_0.25.0.bb         |   1 +
>> >> >  .../python/python3-flit-core_3.6.0.bb         |  41 +++++++
>> >> >  .../python/python3-git_3.1.26.bb              |   2 +-
>> >> >  .../python/python3-iniconfig_1.1.1.bb         |   4 +-
>> >> >  .../python/python3-libarchive-c_4.0.bb        |   2 +
>> >> >  .../python/python3-magic_0.4.25.bb            |   1 +
>> >> >  .../python/python3-mako_1.1.6.bb              |   2 +-
>> >> >  .../python/python3-more-itertools_8.12.0.bb   |   2 +
>> >> >  .../python/python3-nose_1.3.7.bb              |   2 -
>> >> >  .../python/python3-numpy_1.22.2.bb            |   1 +
>> >> >  .../python/python3-packaging_21.3.bb          |   2 +-
>> >> >  .../python/python3-pip_22.0.3.bb              |  19 +++-
>> >> >  .../python/python3-pluggy_1.0.0.bb            |   2 +-
>> >> >  .../python/python3-py_1.11.0.bb               |   2 +-
>> >> >  .../python/python3-pytest_7.0.1.bb            |   4 +-
>> >> >  .../python/python3-scons-native_4.3.0.bb      |   7 --
>> >> >  .../python/python3-scons_4.3.0.bb             |  13 ++-
>> >> >  .../python/python3-setuptools-scm_6.4.2.bb    |   2 +-
>> >> >  .../python/python3-setuptools_59.5.0.bb       |  19 +++-
>> >> >  .../0001-Change-hash-bang-to-python3.patch    |  47 ++++++++
>> >> >  .../python/python3-smartypants_2.0.0.bb       |   1 +
>> >> >  ...001-setup.py-use-vendored-_distutils.patch |  27 +++++
>> >> >  .../python/python3-strict-rfc3339_0.7.bb      |   4 +-
>> >> >  .../python/python3-subunit_1.4.0.bb           |  17 ++-
>> >> >  ...roject.toml-from-flit-backend-branch.patch | 100
>> ++++++++++++++++++
>> >> >  .../python/python3-wheel_0.37.1.bb            |  24 +++++
>> >> >  .../python/python3-zipp_3.7.0.bb              |   2 +-
>> >> >  .../asciidoc/asciidoc_10.1.1.bb               |   1 +
>> >> >  meta/recipes-gnome/gi-docgen/gi-docgen_git.bb |   1 +
>> >> >  .../{bmap-tools_3.6.bb =3D> bmap-tools_git.bb}  |   6 +-
>> >> >  39 files changed, 412 insertions(+), 78 deletions(-)
>> >> >  create mode 100644 meta/classes/flit_core.bbclass
>> >> >  create mode 100644 meta/classes/pip_install_wheel.bbclass
>> >> >  create mode 100644 meta/classes/setuptools_build_meta.bbclass
>> >> >  delete mode 100644 meta/recipes-devtools/python/python-nose.inc
>> >> >  delete mode 100644 meta/recipes-devtools/python/python-subunit.inc
>> >> >  create mode 100644 meta/recipes-devtools/python/
>> python3-flit-core_3.6.0.bb
>> >> >  delete mode 100644 meta/recipes-devtools/python/
>> python3-nose_1.3.7.bb
>> >> >  delete mode 100644 meta/recipes-devtools/python/
>> python3-scons-native_4.3.0.bb
>> >> >  create mode 100644
>> meta/recipes-devtools/python/python3-smartypants/0001-Change-hash-bang-t=
o-python3.patch
>> >> >  create mode 100644
>> meta/recipes-devtools/python/python3-strict-rfc3339/0001-setup.py-use-ve=
ndored-_distutils.patch
>> >> >  create mode 100644
>> meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-=
from-flit-backend-branch.patch
>> >> >  create mode 100644 meta/recipes-devtools/python/
>> python3-wheel_0.37.1.bb
>> >> >  rename meta/recipes-support/bmap-tools/{bmap-tools_3.6.bb =3D>
>> bmap-tools_git.bb} (86%)
>> >> >
>> >> > --
>> >> > 2.30.2
>> >> >
>> >> >
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > Links: You receive all messages sent to this group.
>> >> > View/Reply Online (#162076):
>> https://lists.openembedded.org/g/openembedded-core/message/162076
>> >> > Mute This Topic: https://lists.openembedded.org/mt/89304007/1997914
>> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> > Unsubscribe:
>> https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >
>>
>

--000000000000edde6905d89fb8b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 22, 2022 at 10:39 AM Tim =
Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Feb 22, 2022 at 10:24 AM Khem Raj &lt=
;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Tue, Feb 22, 2022 at 10:21 AM Tim Orling &lt;<a href=3D"mailto:ticotimo@=
gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Feb 22, 2022 at 9:22 AM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; this is going into dep loops Try<br>
&gt;&gt;<br>
&gt;&gt; bitbake python3-wheel-native<br>
&gt;<br>
&gt;<br>
&gt; It shouldn=E2=80=99t<br>
&gt; <a href=3D"https://git.yoctoproject.org/poky-contrib/tree/meta/recipes=
-devtools/python/python3-wheel_0.37.1.bb?h=3Dtimo/bootstrap-wheels" rel=3D"=
noreferrer" target=3D"_blank">https://git.yoctoproject.org/poky-contrib/tre=
e/meta/recipes-devtools/python/python3-wheel_0.37.1.bb?h=3Dtimo/bootstrap-w=
heels</a><br>
&gt;<br>
<br>
I have been trying whats on master-next<br>
<br></blockquote><div><br></div><div>I can&#39;t reproduce. Can you point m=
e at an error log please?</div><div>It might have something to do with ssta=
te cache, but that&#39;s just a hunch.</div><div>=C2=A0</div></div></div></=
blockquote><div>Ah. I bet you have meta-python in the bblayers and therefor=
e python3-wheel recipe from meta-python is winning.</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; DEPENDS:remove:class-native =3D &quot;python3-pip-native&quot;<br>
&gt;<br>
&gt; do_install:class-native () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0# We need to bootstrap python3-wheel-native<br>
&gt;=C2=A0 =C2=A0 =C2=A0install -d ${D}${PYTHON_SITEPACKAGES_DIR}<br>
&gt;=C2=A0 =C2=A0 =C2=A0PYPA_WHEEL=3D&quot;${B}/dist/${PYPI_PACKAGE}-${PV}-=
*.whl&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEE=
L} || \<br>
&gt;=C2=A0 =C2=A0 =C2=A0bbfatal_log &quot;Failed to install&quot;<br>
&gt; }<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Feb 21, 2022 at 1:23 PM Tim Orling &lt;<a href=3D"mailto:t=
icotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Upstream Python is moving to pyproject.toml rather than setup=
.py and<br>
&gt;&gt; &gt; wheels rather than eggs. The main place this is documented is=
 in<br>
&gt;&gt; &gt; PEP-517[1]. Installing packages with setup.py install is depr=
ecated.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We have a choice with the &#39;kirkstone&#39; LTS release of =
introducing this<br>
&gt;&gt; &gt; series (and fixing any fall out during the stabilization peri=
od) or<br>
&gt;&gt; &gt; living with deprecated Python packaging for the duration of t=
he LTS (at<br>
&gt;&gt; &gt; a minimum 2 years). This seems to be a compelling enough reas=
on to bring<br>
&gt;&gt; &gt; in this series, even if it results in a slight slip of the &#=
39;feature<br>
&gt;&gt; &gt; freeze&#39;, which is officially tomorrow, Monday 21 Feb, 202=
2.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This series bootstraps python3-setuptools-native,<br>
&gt;&gt; &gt; python3-flit-core-native, python3-wheel-native and python3-pi=
p-native,<br>
&gt;&gt; &gt; simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This=
 allows all<br>
&gt;&gt; &gt; other recipes to be installed with pip, as intended by upstre=
am.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Three new classes are introduced:<br>
&gt;&gt; &gt; (1) flit_core which builds PEP-517 compliant packages which u=
se<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0flit_core.buildapi as their build-backend.=
<br>
&gt;&gt; &gt; (2) setuptools_build_meta which builds PEP-517 compliant pack=
ages which use<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0setuptools_build_meta=C2=A0 as their build=
-backend.<br>
&gt;&gt; &gt; (3) pip_install_wheel, which simply installs wheels built by =
other<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0classes.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The original setuptools3.bbclass do_compile is modified to<br=
>
&gt;&gt; &gt; &#39;setup.py bdist_wheel&#39; (from python3-wheel-native) ra=
ther than the deprecated<br>
&gt;&gt; &gt; &#39;setup.py build&#39; mechanism.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The original setuptools3.bbclass do_install is modified to<br=
>
&gt;&gt; &gt; use the pip_install_wheel.bbclass to install wheels with pip =
rather than<br>
&gt;&gt; &gt; the deprecated &#39;setup.py install&#39; mechanism.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; For pip install, we disable dependency checking (--no-deps) b=
ecause it<br>
&gt;&gt; &gt; proves to be brittle in our environment without providing ful=
l wheel<br>
&gt;&gt; &gt; cache that seems like overhead that we do not need. We also d=
isable<br>
&gt;&gt; &gt; fetching wheels from pypi (--no-index). This is no different =
than our<br>
&gt;&gt; &gt; normal workflow of requiring dependencies to be defined in a =
recipe.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Missing from this series is documentation of the new features=
, classes<br>
&gt;&gt; &gt; and variables (this will be done under separate cover).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Also desired and previously discussed in YP meetings is a hel=
per<br>
&gt;&gt; &gt; function to warn that a recipe which currently inherits setup=
tools3<br>
&gt;&gt; &gt; but has a pyproject.toml and defines a build-system.build-bac=
kend should<br>
&gt;&gt; &gt; instead use of the new PEP-517 classes. This function is stil=
l in progress.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; During testing, recipes which use python3-setuptools-scm are =
failing to<br>
&gt;&gt; &gt; determine the version of the python package, For several reci=
pes, the fix<br>
&gt;&gt; &gt; was to use pyproject.toml and PEP-517 build backends. To be s=
ure, other recipes<br>
&gt;&gt; &gt; are still going to fail for the short term, until the root ca=
use can be<br>
&gt;&gt; &gt; determined. This was not seen again in v2 builds.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Another PEP-517 build-backend, poetry.core.masonry.api has be=
en<br>
&gt;&gt; &gt; identified in recipes in meta-python, but not in oe-core. The=
<br>
&gt;&gt; &gt; python3-poetry-core recipe is WIP, but brings in a number of<=
br>
&gt;&gt; &gt; dependencies that are perhaps not worth it to bring into oe-c=
ore at this<br>
&gt;&gt; &gt; time. Rather we can support these recipes in meta-python?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Fixes in v2 include passing --root=3D${D} to pip install (rat=
her than --target)<br>
&gt;&gt; &gt; and also passing --prefix so that scripts are (usually) insta=
lled in the proper<br>
&gt;&gt; &gt; location. pip install also &#39;helpfully&#39; overwrites pyt=
hon3 intepreter with nativepython3<br>
&gt;&gt; &gt; in #!, so add a fix to return the values to what is actually =
correct (similar to what is<br>
&gt;&gt; &gt; done in setuptools3.bbclass). Also several recipes still need=
ed PIP_INSTALL_PACKAGE defined.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Also added self as maintainer of new recipes.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [YOCTO #14638]<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [1] <a href=3D"https://www.python.org/dev/peps/pep-0517/" rel=
=3D"noreferrer" target=3D"_blank">https://www.python.org/dev/peps/pep-0517/=
</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The following changes since commit 41ae26ecab731f2fb6593df143=
476c94183be209:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0releases: update to include 3.4.2 (2022-02-21 16:=
46:22 +0000)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; are available in the Git repository at:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0git://<a href=3D"http://git.yoctoproject.org/git/=
poky-contrib" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/git=
/poky-contrib</a> timo/bootstrap-wheels<br>
&gt;&gt; &gt;=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/g=
it/poky-contrib/log/?h=3Dtimo/bootstrap-wheels" rel=3D"noreferrer" target=
=3D"_blank">http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=3D=
timo/bootstrap-wheels</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Tim Orling (32):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-wheel: move 0.37.0 from meta-python<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-flit-core: add recipe for 3.6.0<br>
&gt;&gt; &gt;=C2=A0 =C2=A0flit_core.bbclass: add helper for newer python pa=
ckaging<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-wheel: inherit flit_core<br>
&gt;&gt; &gt;=C2=A0 =C2=A0pip_install_wheel.bbclass: add helper class<br>
&gt;&gt; &gt;=C2=A0 =C2=A0setuptools_build_meta.bbclass: add helper class<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-pip: inherit setuptools_build_meta<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-attrs: inherit setuptools_build_meta<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-git: inherit setuptools_build_meta<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-pytest: inherit setuptools_build_meta<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-setuptools-scm: inherit setuptools_build_=
meta<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-zipp: inherit setuptools_build_meta<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-iniconfig: inherit setuptools_build_meta<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-py: inherit setuptools_build_meta<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-pluggy: inherit setuptools_build_meta<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-setuptools: inherit setuptools_base_meta<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0setuptools3.bbclass: refactor for wheels<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-more-itertools: set PIP_INSTALL_PACKAGE<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0meson: inherit setuptools_build_meta<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-libarchive-d: set PIP_INSTALL_PACKAGE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-smartypants: patch hash bang to python3<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-scons: merge -native recipe<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-subunit: merge inc; set PIP_INSTALL_PACKA=
GE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-magic: set PIP_INSTALL_PACKAGE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0bmap-tools: set PIP_INSTALL_PACKAGE, BASEVER<br>
&gt;&gt; &gt;=C2=A0 =C2=A0asciidoc: set PIP_INSTALL_PACKAGE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0gi-docgen: set PIP_INSTALL_PACKAGE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0numpy: set PIP_INSTALL_PACKAGE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-dbusmock: set PIP_INSTALL_PACKAGE<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-mako: inherit setuptools_build_meta<br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-packaging: inherit setuptools_build_meta<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0python3-nose: drop recipe<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 meta/classes/flit_core.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +++<br>
&gt;&gt; &gt;=C2=A0 meta/classes/pip_install_wheel.bbclass=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 37 +++++++<br>
&gt;&gt; &gt;=C2=A0 meta/classes/setuptools3.bbclass=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 ++--<br>
&gt;&gt; &gt;=C2=A0 meta/classes/setuptools_build_meta.bbclass=C2=A0 =C2=A0=
 |=C2=A0 18 ++++<br>
&gt;&gt; &gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-devtools/meson/<a href=3D"http://meson_0.6=
1.2.bb" rel=3D"noreferrer" target=3D"_blank">meson_0.61.2.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-devtools/python/python-nose.inc=C2=A0 |=C2=
=A0 18 ----<br>
&gt;&gt; &gt;=C2=A0 .../python/python-subunit.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 14 ---<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-attrs_21.4.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-attrs_21.4.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-dbusmock_0.25.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-dbusmock_0.25.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-flit-core_3.6.0.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-flit-core_3.6.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 41 +++++++<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-git_3.1.26.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-git_3.1.26.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-iniconfig_1.1.1.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-iniconfig_1.1.1.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-libarchive-c_4.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-libarchive-c_4.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-magic_0.4.25.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-magic_0.4.25.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-mako_1.1.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-mako_1.1.6.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-more-itertools_8.1=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-more-itertools_8.12.0.=
bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-nose_1.3.7.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-nose_1.3.7.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 -<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-numpy_1.22.2.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-numpy_1.22.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-packaging_21.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-packaging_21.3.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-pip_22.0.3.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-pip_22.0.3.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +++-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-pluggy_1.0.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pluggy_1.0.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-py_1.11.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-py_1.11.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-pytest_7.0.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-pytest_7.0.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-scons-native_4.3.0=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons-native_4.3.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 --<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-scons_4.3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-scons_4.3.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 ++-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-setuptools-scm_6.4=
.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools-scm_6.4.2.bb=
</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-setuptools_59.5.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_59.5.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 19 +++-<br>
&gt;&gt; &gt;=C2=A0 .../0001-Change-hash-bang-to-python3.patch=C2=A0 =C2=A0=
 |=C2=A0 47 ++++++++<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-smartypants_2.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-smartypants_2.0.0.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;=C2=A0 ...001-setup.py-use-vendored-_distutils.patch |=C2=A0 2=
7 +++++<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-strict-rfc3339_0.7=
.bb" rel=3D"noreferrer" target=3D"_blank">python3-strict-rfc3339_0.7.bb</a>=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-subunit_1.4.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-subunit_1.4.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 ++-<br>
&gt;&gt; &gt;=C2=A0 ...roject.toml-from-flit-backend-branch.patch | 100 +++=
+++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-wheel_0.37.1.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-wheel_0.37.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 24 +++++<br>
&gt;&gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-zipp_3.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-zipp_3.7.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt; &gt;=C2=A0 .../asciidoc/<a href=3D"http://asciidoc_10.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">asciidoc_10.1.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;&gt; &gt;=C2=A0 meta/recipes-gnome/gi-docgen/<a href=3D"http://gi-docge=
n_git.bb" rel=3D"noreferrer" target=3D"_blank">gi-docgen_git.bb</a> |=C2=A0=
 =C2=A01 +<br>
&gt;&gt; &gt;=C2=A0 .../{<a href=3D"http://bmap-tools_3.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">bmap-tools_3.6.bb</a> =3D&gt; <a href=3D"http://bma=
p-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_git.bb</a>}=
=C2=A0 |=C2=A0 =C2=A06 +-<br>
&gt;&gt; &gt;=C2=A0 39 files changed, 412 insertions(+), 78 deletions(-)<br=
>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/classes/flit_core.bbclass<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/classes/pip_install_wheel.bbcla=
ss<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/classes/setuptools_build_meta.b=
bclass<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python-=
nose.inc<br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python-=
subunit.inc<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=
=3D"http://python3-flit-core_3.6.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-flit-core_3.6.0.bb</a><br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/<a href=
=3D"http://python3-nose_1.3.7.bb" rel=3D"noreferrer" target=3D"_blank">pyth=
on3-nose_1.3.7.bb</a><br>
&gt;&gt; &gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/<a href=
=3D"http://python3-scons-native_4.3.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-scons-native_4.3.0.bb</a><br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3=
-smartypants/0001-Change-hash-bang-to-python3.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3=
-strict-rfc3339/0001-setup.py-use-vendored-_distutils.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3=
-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=
=3D"http://python3-wheel_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-wheel_0.37.1.bb</a><br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-support/bmap-tools/{<a href=3D"http=
://bmap-tools_3.6.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.6.b=
b</a> =3D&gt; <a href=3D"http://bmap-tools_git.bb" rel=3D"noreferrer" targe=
t=3D"_blank">bmap-tools_git.bb</a>} (86%)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.30.2<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#162076): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/162076" rel=3D"noreferrer" target=3D"=
_blank">https://lists.openembedded.org/g/openembedded-core/message/162076</=
a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/89304007/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.opene=
mbedded.org/mt/89304007/1997914</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.openemb=
edded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gma=
il.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000edde6905d89fb8b8--

