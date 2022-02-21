Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C996EC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 05:01:31 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7263.1645419688854908413
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QMsYkGC/;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: ticotimo@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id h15so9866366edv.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 21:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OP+tiNwG/HNEeCepUKa1M5ZJseF2h9dwnzLkLc8Yg2Y=;
        b=QMsYkGC/MX1itKpd2dmVpouevsXS2R8TcNaOPIQqhyliWrlZxwkWzc/xj1jpVsJcc4
         WXwY+n+zFrkD6KJGj0tjx9nO0VRBJgAvaakUOe0Id7OpnrRFwlgzltcwmBvuegYkAtHr
         e9tsfDVwb1yIRz55hEze82H1w/1qvd2vRfEmKy7qvO0XUZWlhG1/0+2DFQmWtXXR7vPZ
         6DKhEFVRuEP/s60mW1gBYDdK+ly9COBdXokTNB6icJ+MgUBKBJWGi77spTuo05iTufcD
         NTgMNoseI3YfLUxLM82+zy/tGSOjji6oI37CnKMPAb5tTnSvI40jb58fRXFBJZVK03Bv
         WpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OP+tiNwG/HNEeCepUKa1M5ZJseF2h9dwnzLkLc8Yg2Y=;
        b=P4fLZGzKr8WoPzqcE6DIXgEnmnl9jPralytk6+WGn4IlnYv30UugjsAvnLKyyi2mHn
         YbdpynJ8jT9ULeGg3ez0VsJWvvWCaWaAwxZJZSIEQ2ly470wKTikqSVChILD3rUREI5X
         ig6bylw2X77Y/q9U6JslsRAmdtcTBUCPWEaiXCqWzxVhEbhHnEkovE+yY2vAcuOVQQCR
         X3qVVlNIjpcRf3mssMlzxuxfrjbVmGwWrY6d/hGue41ToD/pvEnwVHOzPHQc8pvwaC/Z
         oEGSVpxmMgaqnop7Ikip6gWtIbP+OwOnwIJvny/3aqmIaOVZxDWDIJWfw72SzxHZCRGh
         TP0g==
X-Gm-Message-State: AOAM533k7yQUNNYLlqWNp/lMEkPPCgPFJhInfjP+gE03Q8TGGxsqjvGu
	dvIgCwm6MmqCwsGYtxsj3abkt2i7jX+5mEnukvs=
X-Google-Smtp-Source: 
 ABdhPJzW3+IWlKCpOI7jlAbN9fqdj1n2FMVkcB63P7jVAq7A4vAQvGvPBZpHKX+N4BwD80e6QKIw9qtUrub0Nx5Rw3k=
X-Received: by 2002:a05:6402:40c9:b0:40f:9397:a2a0 with SMTP id
 z9-20020a05640240c900b0040f9397a2a0mr19426988edb.249.1645419687172; Sun, 20
 Feb 2022 21:01:27 -0800 (PST)
MIME-Version: 1.0
References: <16D5A8D5A2383D07.27174@lists.openembedded.org>
In-Reply-To: <16D5A8D5A2383D07.27174@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 20 Feb 2022 21:01:16 -0800
Message-ID: 
 <CANx9H-CTRd_81zL04J1b-D2C5hxwuuG09X4K3EoUcw6FU18xeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/19] Python PEP-517: build wheels and installw
 with pip
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f5de7305d8801f7d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 05:01:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162012

--000000000000f5de7305d8801f7d
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 20, 2022 at 5:27 PM Tim Orling via lists.openembedded.org
<ticotimo=gmail.com@lists.openembedded.org> wrote:

> Upstream Python is moving to pyproject.toml rather than setup.py and
> wheels rather than eggs. The main place this is documented is in
> PEP-517[1]. Installing packages with setup.py install is deprecated.
>
> We have a choice with the 'kirkstone' LTS release of introducing this
> series (and fixing any fall out during the stabilization period) or
> living with deprecated Python packaging for the duration of the LTS (at
> a minimum 2 years). This seems to be a compelling enough reason to bring
> in this series, even if it results in a slight slip of the 'feature
> freeze', which is officially tomorrow, Monday 21 Feb, 2022.
>
> This series bootstraps python3-setuptools-native,
> python3-flit-core-native, python3-wheel-native and python3-pip-native,
> simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This allows all
> other recipes to be installed with pip, as intended by upstream.
>
> Three new classes are introduced:
> (1) flit_core which builds PEP-517 compliant packages which use
>     flit_core.buildapi as their build-backend.
> (2) setuptools_build_meta which builds PEP-517 compliant packages which use
>     setuptools_build_meta  as their build-backend.
> (3) pip_install_wheel, which simply installs wheels built by other
>     classes.
>
> The original setuptools3.bbclass do_compile is modified to
> 'setup.py bdist_wheel' (from python3-wheel-native) rather than the
> deprecated
> 'setup.py build' mechanism.
>
> The original setuptools3.bbclass do_install is modified to
> use the pip_install_wheel.bbclass to install wheels with pip rather than
> the deprecated 'setup.py install' mechanism.
>
> For pip install, we disable dependency checking (--no-deps) because it
> proves to be brittle in our environment without providing full wheel
> cache that seems like overhead that we do not need. We also disable
> fetching wheels from pypi (--no-index). This is no different than our
> normal workflow of requiring dependencies to be defined in a recipe.
>
> Missing from this series is documentation of the new features, classes
> and variables (this will be done under separate cover).
>
> Also desired and previously discussed in YP meetings is a helper
> function to warn that a recipe which currently inherits setuptools3
> but has a pyproject.toml and defines a build-system.build-backend should
> instead use of the new PEP-517 classes. This function is still in progress.
>
> During testing, recipes which use python3-setuptools-scm are failing to
> determine the version of the python package, For several recipes, the fix
> was to use pyproject.toml and PEP-517 build backends. To be sure, other
> recipes
> are still going to fail for the short term, until the root cause can be
> determined.
>
> Another PEP-517 build-backend, poetry.core.masonry.api has been
> identified in recipes in meta-python, but not in oe-core. The
> python3-poetry-core recipe is WIP, but brings in a number of
> dependencies that are perhaps not worth it to bring into oe-core at this
> time. Rather we can support these recipes in meta-python?
>
> [YOCTO #14638]
>
> [1] https://www.python.org/dev/peps/pep-0517/
>
> The following changes since commit
> 0539b563c6f41fef383429a13c28bf918231d404:
>
>   libhandy: Use upstream regex to check version of upgrade. (2022-02-20
> 16:45:25 +0000)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/git/poky-contrib timo/bootstrap-wheels
>
> http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=timo/bootstrap-wheels
>
>
I pushed a few more fixes to the same branch. Several recipes are failing
in package qa because somehow
the hash bang of e.g. #!/usr/bin/env python3 is being expanded to the full
path to nativepython3 and this ends up being too long (ignore the fact that
it is completely wrong):
"maximum shebang size exceeded, the maximum size is 128. [shebang-size]"

The installed files do not have the path to nativepython3 in them, they
have the exepected #!/usr/bin/env python3 or similar.


> Tim Orling (19):
>   python3-wheel: move 0.37.0 from meta-python
>   python3-flit-core: add recipe for 3.6.0
>   python3-flit-core: simplify
>   flit_core.bbclass: add helper for newer python packaging
>   python3-wheel: inherit flit_core
>   pip_install_wheel.bbclass: add helper class
>   setuptools_build_meta.bbclass: add helper class
>   python3-pip: inherit setuptools_build_meta
>   python3-attrs: inherit setuptools_build_meta
>   python3-git: inherit setuptools_build_meta
>   python3-pytest: inherit setuptools_build_meta
>   python3-setuptools-scm: inherit setuptools_build_meta
>   python3-zipp: inherit setuptools_build_meta
>   python3-iniconfig: inherit setuptools_build_meta
>   python3-py: inherit setuptools_build_meta
>   python3-pluggy: inherit setuptools_build_meta
>   python3-setuptools: inherit setuptools_base_meta
>   setuptools3.bbclass: refactor for wheels
>   python3-more-itertools: set PIP_INSTALL_PACKAGE
>
>  meta/classes/flit_core.bbclass                |  16 +++
>  meta/classes/pip_install_wheel.bbclass        |  18 ++++
>  meta/classes/setuptools3.bbclass              |  20 ++--
>  meta/classes/setuptools_build_meta.bbclass    |  18 ++++
>  .../python/python3-attrs_21.4.0.bb            |   2 +-
>  .../python/python3-flit-core_3.6.0.bb         |  41 +++++++
>  .../python/python3-git_3.1.26.bb              |   2 +-
>  .../python/python3-iniconfig_1.1.1.bb         |   4 +-
>  .../python/python3-more-itertools_8.12.0.bb   |   2 +
>  .../python/python3-pip_22.0.3.bb              |  19 +++-
>  .../python/python3-pluggy_1.0.0.bb            |   2 +-
>  .../python/python3-py_1.11.0.bb               |   2 +-
>  .../python/python3-pytest_7.0.1.bb            |   4 +-
>  .../python/python3-setuptools-scm_6.4.2.bb    |   2 +-
>  .../python/python3-setuptools_59.5.0.bb       |  19 +++-
>  ...roject.toml-from-flit-backend-branch.patch | 100 ++++++++++++++++++
>  .../python/python3-wheel_0.37.1.bb            |  24 +++++
>  .../python/python3-zipp_3.7.0.bb              |   2 +-
>  18 files changed, 269 insertions(+), 28 deletions(-)
>  create mode 100644 meta/classes/flit_core.bbclass
>  create mode 100644 meta/classes/pip_install_wheel.bbclass
>  create mode 100644 meta/classes/setuptools_build_meta.bbclass
>  create mode 100644 meta/recipes-devtools/python/
> python3-flit-core_3.6.0.bb
>  create mode 100644
> meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
>  create mode 100644 meta/recipes-devtools/python/python3-wheel_0.37.1.bb
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161992):
> https://lists.openembedded.org/g/openembedded-core/message/161992
> Mute This Topic: https://lists.openembedded.org/mt/89285058/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000f5de7305d8801f7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 20, 2022 at 5:27 PM Tim O=
rling via <a href=3D"http://lists.openembedded.org">lists.openembedded.org<=
/a> &lt;ticotimo=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmai=
l.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">Upstream Python is moving to pyproject.toml rat=
her than setup.py and<br>
wheels rather than eggs. The main place this is documented is in<br>
PEP-517[1]. Installing packages with setup.py install is deprecated.<br>
<br>
We have a choice with the &#39;kirkstone&#39; LTS release of introducing th=
is<br>
series (and fixing any fall out during the stabilization period) or<br>
living with deprecated Python packaging for the duration of the LTS (at<br>
a minimum 2 years). This seems to be a compelling enough reason to bring<br=
>
in this series, even if it results in a slight slip of the &#39;feature<br>
freeze&#39;, which is officially tomorrow, Monday 21 Feb, 2022.<br>
<br>
This series bootstraps python3-setuptools-native,<br>
python3-flit-core-native, python3-wheel-native and python3-pip-native,<br>
simply unzipping the wheel into PYTHON_SITEPACKAGES_DIR. This allows all<br=
>
other recipes to be installed with pip, as intended by upstream.<br>
<br>
Three new classes are introduced:<br>
(1) flit_core which builds PEP-517 compliant packages which use<br>
=C2=A0 =C2=A0 flit_core.buildapi as their build-backend.<br>
(2) setuptools_build_meta which builds PEP-517 compliant packages which use=
<br>
=C2=A0 =C2=A0 setuptools_build_meta=C2=A0 as their build-backend.<br>
(3) pip_install_wheel, which simply installs wheels built by other<br>
=C2=A0 =C2=A0 classes.<br>
<br>
The original setuptools3.bbclass do_compile is modified to<br>
&#39;setup.py bdist_wheel&#39; (from python3-wheel-native) rather than the =
deprecated<br>
&#39;setup.py build&#39; mechanism. <br>
<br>
The original setuptools3.bbclass do_install is modified to<br>
use the pip_install_wheel.bbclass to install wheels with pip rather than<br=
>
the deprecated &#39;setup.py install&#39; mechanism. <br>
<br>
For pip install, we disable dependency checking (--no-deps) because it<br>
proves to be brittle in our environment without providing full wheel<br>
cache that seems like overhead that we do not need. We also disable<br>
fetching wheels from pypi (--no-index). This is no different than our<br>
normal workflow of requiring dependencies to be defined in a recipe.<br>
<br>
Missing from this series is documentation of the new features, classes<br>
and variables (this will be done under separate cover).<br>
<br>
Also desired and previously discussed in YP meetings is a helper<br>
function to warn that a recipe which currently inherits setuptools3<br>
but has a pyproject.toml and defines a build-system.build-backend should<br=
>
instead use of the new PEP-517 classes. This function is still in progress.=
<br>
<br>
During testing, recipes which use python3-setuptools-scm are failing to<br>
determine the version of the python package, For several recipes, the fix<b=
r>
was to use pyproject.toml and PEP-517 build backends. To be sure, other rec=
ipes<br>
are still going to fail for the short term, until the root cause can be<br>
determined.<br>
<br>
Another PEP-517 build-backend, poetry.core.masonry.api has been<br>
identified in recipes in meta-python, but not in oe-core. The<br>
python3-poetry-core recipe is WIP, but brings in a number of<br>
dependencies that are perhaps not worth it to bring into oe-core at this<br=
>
time. Rather we can support these recipes in meta-python?<br>
<br>
[YOCTO #14638]<br>
<br>
[1] <a href=3D"https://www.python.org/dev/peps/pep-0517/" rel=3D"noreferrer=
" target=3D"_blank">https://www.python.org/dev/peps/pep-0517/</a><br>
<br>
The following changes since commit 0539b563c6f41fef383429a13c28bf918231d404=
:<br>
<br>
=C2=A0 libhandy: Use upstream regex to check version of upgrade. (2022-02-2=
0 16:45:25 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/git/poky-contrib" rel=
=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/git/poky-contrib</a>=
 timo/bootstrap-wheels<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log=
/?h=3Dtimo/bootstrap-wheels" rel=3D"noreferrer" target=3D"_blank">http://gi=
t.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=3Dtimo/bootstrap-wheels=
</a><br>
<br></blockquote><div><br></div><div>I pushed a few more fixes to the same =
branch. Several recipes are failing in package qa because somehow</div><div=
>the hash bang of e.g. #!/usr/bin/env python3 is being expanded to the full=
 path to nativepython3 and this ends up being too long (ignore the fact tha=
t it is completely wrong):</div><div>&quot;maximum shebang size exceeded, t=
he maximum size is 128. [shebang-size]&quot;</div><div><br></div><div>The i=
nstalled files do not have the path to nativepython3 in them, they have the=
 exepected=C2=A0#!/usr/bin/env python3 or similar.</div><div>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
Tim Orling (19):<br>
=C2=A0 python3-wheel: move 0.37.0 from meta-python<br>
=C2=A0 python3-flit-core: add recipe for 3.6.0<br>
=C2=A0 python3-flit-core: simplify<br>
=C2=A0 flit_core.bbclass: add helper for newer python packaging<br>
=C2=A0 python3-wheel: inherit flit_core<br>
=C2=A0 pip_install_wheel.bbclass: add helper class<br>
=C2=A0 setuptools_build_meta.bbclass: add helper class<br>
=C2=A0 python3-pip: inherit setuptools_build_meta<br>
=C2=A0 python3-attrs: inherit setuptools_build_meta<br>
=C2=A0 python3-git: inherit setuptools_build_meta<br>
=C2=A0 python3-pytest: inherit setuptools_build_meta<br>
=C2=A0 python3-setuptools-scm: inherit setuptools_build_meta<br>
=C2=A0 python3-zipp: inherit setuptools_build_meta<br>
=C2=A0 python3-iniconfig: inherit setuptools_build_meta<br>
=C2=A0 python3-py: inherit setuptools_build_meta<br>
=C2=A0 python3-pluggy: inherit setuptools_build_meta<br>
=C2=A0 python3-setuptools: inherit setuptools_base_meta<br>
=C2=A0 setuptools3.bbclass: refactor for wheels<br>
=C2=A0 python3-more-itertools: set PIP_INSTALL_PACKAGE<br>
<br>
=C2=A0meta/classes/flit_core.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 16 +++<br>
=C2=A0meta/classes/pip_install_wheel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 18 ++++<br>
=C2=A0meta/classes/setuptools3.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 20 ++--<br>
=C2=A0meta/classes/setuptools_build_meta.bbclass=C2=A0 =C2=A0 |=C2=A0 18 ++=
++<br>
=C2=A0.../python/<a href=3D"http://python3-attrs_21.4.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-attrs_21.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-flit-core_3.6.0.bb" rel=3D"noref=
errer" target=3D"_blank">python3-flit-core_3.6.0.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 41 +++++++<br>
=C2=A0.../python/<a href=3D"http://python3-git_3.1.26.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-git_3.1.26.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-iniconfig_1.1.1.bb" rel=3D"noref=
errer" target=3D"_blank">python3-iniconfig_1.1.1.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../python/<a href=3D"http://python3-more-itertools_8.12.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-more-itertools_8.12.0.bb</a>=C2=A0 =
=C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-pip_22.0.3.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-pip_22.0.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 +++-<br>
=C2=A0.../python/<a href=3D"http://python3-pluggy_1.0.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pluggy_1.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-py_1.11.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-py_1.11.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-pytest_7.0.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pytest_7.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../python/<a href=3D"http://python3-setuptools-scm_6.4.2.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-setuptools-scm_6.4.2.bb</a>=C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-setuptools_59.5.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-setuptools_59.5.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 19 +++-<br>
=C2=A0...roject.toml-from-flit-backend-branch.patch | 100 +++++++++++++++++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-wheel_0.37.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-wheel_0.37.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 24 +++++<br>
=C2=A0.../python/<a href=3D"http://python3-zipp_3.7.0.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-zipp_3.7.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A018 files changed, 269 insertions(+), 28 deletions(-)<br>
=C2=A0create mode 100644 meta/classes/flit_core.bbclass<br>
=C2=A0create mode 100644 meta/classes/pip_install_wheel.bbclass<br>
=C2=A0create mode 100644 meta/classes/setuptools_build_meta.bbclass<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-flit-core_3.6.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-flit-=
core_3.6.0.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Ba=
ckport-pyproject.toml-from-flit-backend-branch.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<a href=3D"http://pyt=
hon3-wheel_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-wheel_0.=
37.1.bb</a><br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#161992): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/161992" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/161992</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89285058/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89285058/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f5de7305d8801f7d--

