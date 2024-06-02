Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99924C25B74
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 22:17:12 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.69815.1717366623858371833
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 15:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cgT4xYxo;
 spf=pass (domain: konsulko.com, ip: 209.85.218.49, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a634e03339dso369391566b.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 15:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717366622; x=1717971422; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=89jVvCuxphT4ZmQYrip+BBlSLR4VAMLzmIdPs0HyuU0=;
        b=cgT4xYxohDD8oXCjP882hjqE5gzNaimbwKBQvk64j1tMuK6on/XFoAPRHlJ7bE5N2d
         WesdK3aO20zet5lTaU+JXHObQA6T9NS6LYKCCSltvfioQ9dd/txj+94aQCDjJ2TYc8GR
         YS5T45U5bvZcgHMWESuJxgmh7dji9N5biO9yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717366622; x=1717971422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89jVvCuxphT4ZmQYrip+BBlSLR4VAMLzmIdPs0HyuU0=;
        b=GVFS0fbzExqc5xuzAdEAori780MSwyb148qWjsWxr7wCwEuj6aqQR+eFCpcVIxX275
         /XIgpyiHol9LAWkA8tpOph8f17lrdjyrooQwIusz+lZiU721O5AOKOoxjCQx51Ivg/yR
         IGXVJwxjTBPoKOcN271jRtZbHSaWjrAopGyGBX+UqJx4ptaG8EAuzdnvcqItaAzAGO+C
         3kw/jTBex+RAPRzFMrGcU+CIbxwimzrNOX1LZsAHD098ejLPeCCNVSeXJohXHJSN16h4
         3P6f+huF2FqUgFLSV6sc9WSW/RCChElkKFSLZXSpIJIHWNAnWeJZSihLQyaardmAdZo9
         NubQ==
X-Gm-Message-State: AOJu0YxPxSplwBfQt8nAli/BfcpL3Cs8jeewy1pikXZxBmmc0GZcrTtO
	iMFTvcNIctvqRliZp8zl1PuZL7dYeynYc+jceUfSTKSfWaEzNJBbUnfNxYNAK9j/9lcAjzT8fJW
	rBTI3ljHvuspvcmPmpDz85MhAqBGMPTtR61VyZQ==
X-Google-Smtp-Source: AGHT+IGpjK3k04pBBduoMpp47nRaHbY7P7hYjZqabRnqnzUwNH0ri9l5aSeaY2H1l/IiynkwP4Eybn46OinYy4GVYro=
X-Received: by 2002:a17:906:22d2:b0:a68:f83b:22f3 with SMTP id
 a640c23a62f3a-a68f83b2562mr128100466b.7.1717366621876; Sun, 02 Jun 2024
 15:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <0101018fd4dd34f7-5726b585-30b2-45d5-9eeb-f50bbb6b8bda-000000@us-west-2.amazonses.com>
In-Reply-To: <0101018fd4dd34f7-5726b585-30b2-45d5-9eeb-f50bbb6b8bda-000000@us-west-2.amazonses.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Sun, 2 Jun 2024 15:16:50 -0700
Message-ID: <CAOyo-84ow3Ugj8=qFD5bNrpq23t8xPKZ-E0L8=KvvkCVHnOVPg@mail.gmail.com>
Subject: Re: [AUH] python3-meson-python: upgrading to 0.16.0 FAILED
To: auh@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000724cc10619ef93d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 22:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200224

--000000000000724cc10619ef93d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 1, 2024 at 10:33=E2=80=AFAM <auh@yoctoproject.org> wrote:

> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe *python3-meson-python* t=
o
> *0.16.0* has Failed (devtool error).
>
> Detailed error information:
>
> The following devtool command failed:  upgrade python3-meson-python -V
> 0.16.0
> NOTE: Reconnecting to bitbake server...
> Loading cache...done.
> Loaded 1878 entries from dependency cache.
> Removing 1 recipes from the x86_64 sysroot...done.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.9.1"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D
> "5.0+snapshot-f545f76df362714d49c9cdad3a9c02789a25890a"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp
> workspace            =3D
> "tmp-auh-upgrades:f545f76df362714d49c9cdad3a9c02789a25890a"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read.
> Continuing build without monitoring pressure
> Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100%
> match, 100% complete)
> done.
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be
> rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 3 seconds
> Loading cache...done.
> Loaded 1878 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 919 .bb files complete (917 cached, 2 parsed). 1878 targets, 3=
5
> skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           =3D "2.9.1"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D
> "5.0+snapshot-f545f76df362714d49c9cdad3a9c02789a25890a"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp
> workspace            =3D
> "tmp-auh-upgrades:f545f76df362714d49c9cdad3a9c02789a25890a"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read.
> Continuing build without monitoring pressure
> Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match,
> 0% complete)
> done.
> NOTE: Executing Tasks
> WARNING: tmp-recipetool-2s05wgwo: the directory
> /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-7a3kjczy=
/emptysrc
> (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-7a3kjcz=
y/emptysrc)
> pointed to by the S variable doesn't exist - please set S within the reci=
pe
> to point to where the source has been unpacked to
> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun
> and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 3 seconds
> DEBUG 5 [Errno 25] Inappropriate ioctl for device
> Adding changed files:   0% |                                   | ETA:
> --:--:--
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> INFO: Fetching
> https://files.pythonhosted.org/packages/source/m/meson_python/meson_pytho=
n-0.16.0.tar.gz;downloadfilename=3Dmeson_python-0.16.0.tar.gz.
> ..
> ERROR: Execution of 'git add -f -A ".readthedocs.yaml"
> "tests/packages/complex/complex/more/baz.pyx"
> "tests/packages/complex/complex/more/meson.build"
> "tests/packages/complex/foo.py" "tests/packages/complex/move.py"
> "tests/packages/custom-target-dir/codegen.py"
> "tests/packages/custom-target-dir/meson.build"
> "tests/packages/custom-target-dir/pyproject.toml"
> "tests/packages/encoding/meson.build"
> "tests/packages/encoding/pyproject.toml"
> ""tests/packages/encoding/\343\203\206\343\202\271\343\203\210.py""
> ".cirrus.yml" ".github/workflows/docs.yml" ".github/workflows/tests.yml"
> ".pre-commit-config.yaml" ".readthedocs.yml" "CHANGELOG.rst" "PKG-INFO"
> "README.rst" "ci/alpine-3.docker" "ci/debian-11.docker"
> "ci/debian-12.docker" "ci/fedora-37.docker" "ci/miniconda.docker"
> "docs/changelog.rst" "docs/conf.py" "docs/contributing/commit-format.rst"
> "docs/contributing/documentation.rst"
> "docs/contributing/getting-started.rst" "docs/contributing/index.rst"
> "docs/contributing/release-process.rst" "do
>  cs/contributing/test-suite.rst" "docs/explanations/design.rst"
> "docs/explanations/editable-installs.rst"
> "docs/explanations/internal-dependencies.rst"
> "docs/how-to-guides/build-directory.rst"
> "docs/how-to-guides/config-settings.rst"
> "docs/how-to-guides/first-project.rst" "docs/index.rst"
> "docs/projects-using-meson-python.rst"
> "docs/reference/environment-variables.rst"
> "docs/reference/meson-compatibility.rst"
> "docs/reference/pyproject-settings.rst" "docs/reference/quirks.rst"
> "docs/tutorials/entrypoints.rst" "docs/tutorials/executable.rst"
> "docs/tutorials/introduction.rst" "meson.build" "mesonpy/__init__.py"
> "mesonpy/_editable.py" "mesonpy/_tags.py" "mesonpy/_util.py"
> "pyproject.toml" "tests/packages/complex/meson.build"
> "tests/packages/imports-itself-during-build/meson.build"
> "tests/test_editable.py" "tests/test_output.py" "tests/test_project.py"
> "tests/test_tags.py" "tests/test_wheel.py"' failed with exit code 128:
> fatal: pathspec 'tests/packages/encoding/343203206343202271343203210.py'
> did not match any files
>

It seems this is a problem with unicode characters in the filename:
ls meson_python-0.16.0/tests/packages/encoding/
meson.build  pyproject.toml  =E3=83=86=E3=82=B9=E3=83=88.py

Doing a manual upgrade has no problems, so it is something specific to how
"devtool upgrade" is handling the file names?

NOTE: the 0.15.0 version did not have tests/packages/encoding at all


>
>
>
> Please review the attached files for further information and build/update
> failures.
> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
>
> Regards,
> The Upgrade Helper

--000000000000724cc10619ef93d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 1, 2024 at 10:33=E2=80=AF=
AM &lt;<a href=3D"mailto:auh@yoctoproject.org">auh@yoctoproject.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<b=
r>
<br>
this email is a notification from the Auto Upgrade Helper<br>
that the automatic attempt to upgrade the recipe *python3-meson-python* to =
*0.16.0* has Failed (devtool error).<br>
<br>
Detailed error information:<br>
<br>
The following devtool command failed:=C2=A0 upgrade python3-meson-python -V=
 0.16.0<br>
NOTE: Reconnecting to bitbake server...<br>
Loading cache...done.<br>
Loaded 1878 entries from dependency cache.<br>
Removing 1 recipes from the x86_64 sysroot...done.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.9.1&quot;<br=
>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;5.0+snapshot-f545f76df36=
2714d49c9cdad3a9c02789a25890a&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;tmp-auh-upgrad=
es:f545f76df362714d49c9cdad3a9c02789a25890a&quot;<br>
<br>
Initialising tasks...NOTE: The /proc/pressure files can&#39;t be read. Cont=
inuing build without monitoring pressure<br>
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% matc=
h, 100% complete)<br>
done.<br>
NOTE: Executing Tasks<br>
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn&#39;t need to be=
 rerun and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 3 seconds<br>
Loading cache...done.<br>
Loaded 1878 entries from dependency cache.<br>
Parsing recipes...done.<br>
Parsing of 919 .bb files complete (917 cached, 2 parsed). 1878 targets, 35 =
skipped, 0 masked, 0 errors.<br>
NOTE: Resolving any missing task queue dependencies<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.9.1&quot;<br=
>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&q=
uot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-poky-li=
nux&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemux86-6=
4&quot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;poky=
&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;5.0+snapshot-f545f76df36=
2714d49c9cdad3a9c02789a25890a&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m64 core2&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
meta-poky=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;tmp-auh-upgrad=
es:f545f76df362714d49c9cdad3a9c02789a25890a&quot;<br>
<br>
Initialising tasks...NOTE: The /proc/pressure files can&#39;t be read. Cont=
inuing build without monitoring pressure<br>
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0%=
 complete)<br>
done.<br>
NOTE: Executing Tasks<br>
WARNING: tmp-recipetool-2s05wgwo: the directory /home/pokybuild/yocto-worke=
r/auh/build/build/tmp/work/recipetool-7a3kjczy/emptysrc (/home/pokybuild/yo=
cto-worker/auh/build/build/tmp/work/recipetool-7a3kjczy/emptysrc) pointed t=
o by the S variable doesn&#39;t exist - please set S within the recipe to p=
oint to where the source has been unpacked to<br>
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn&#39;t need to be rer=
un and all succeeded.<br>
NOTE: Writing buildhistory<br>
NOTE: Writing buildhistory took: 3 seconds<br>
DEBUG 5 [Errno 25] Inappropriate ioctl for device<br>
Adding changed files:=C2=A0 =C2=A00% |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| ETA:=C2=A0 --:--:--<br>
INFO: Extracting current version source...<br>
INFO: Extracting upgraded version source...<br>
INFO: Fetching <a href=3D"https://files.pythonhosted.org/packages/source/m/=
meson_python/meson_python-0.16.0.tar.gz;downloadfilename=3Dmeson_python-0.1=
6.0.tar.gz." rel=3D"noreferrer" target=3D"_blank">https://files.pythonhoste=
d.org/packages/source/m/meson_python/meson_python-0.16.0.tar.gz;downloadfil=
ename=3Dmeson_python-0.16.0.tar.gz.</a>..<br>
ERROR: Execution of &#39;git add -f -A &quot;.readthedocs.yaml&quot; &quot;=
tests/packages/complex/complex/more/baz.pyx&quot; &quot;tests/packages/comp=
lex/complex/more/meson.build&quot; &quot;tests/packages/complex/foo.py&quot=
; &quot;tests/packages/complex/move.py&quot; &quot;tests/packages/custom-ta=
rget-dir/codegen.py&quot; &quot;tests/packages/custom-target-dir/meson.buil=
d&quot; &quot;tests/packages/custom-target-dir/pyproject.toml&quot; &quot;t=
ests/packages/encoding/meson.build&quot; &quot;tests/packages/encoding/pypr=
oject.toml&quot; &quot;&quot;tests/packages/encoding/\343\203\206\343\202\2=
71\343\203\210.py&quot;&quot; &quot;.cirrus.yml&quot; &quot;.github/workflo=
ws/docs.yml&quot; &quot;.github/workflows/tests.yml&quot; &quot;.pre-commit=
-config.yaml&quot; &quot;.readthedocs.yml&quot; &quot;CHANGELOG.rst&quot; &=
quot;PKG-INFO&quot; &quot;README.rst&quot; &quot;ci/alpine-3.docker&quot; &=
quot;ci/debian-11.docker&quot; &quot;ci/debian-12.docker&quot; &quot;ci/fed=
ora-37.docker&quot; &quot;ci/miniconda.docker&quot; &quot;docs/changelog.rs=
t&quot; &quot;docs/conf.py&quot; &quot;docs/contributing/commit-format.rst&=
quot; &quot;docs/contributing/documentation.rst&quot; &quot;docs/contributi=
ng/getting-started.rst&quot; &quot;docs/contributing/index.rst&quot; &quot;=
docs/contributing/release-process.rst&quot; &quot;do<br>
=C2=A0cs/contributing/test-suite.rst&quot; &quot;docs/explanations/design.r=
st&quot; &quot;docs/explanations/editable-installs.rst&quot; &quot;docs/exp=
lanations/internal-dependencies.rst&quot; &quot;docs/how-to-guides/build-di=
rectory.rst&quot; &quot;docs/how-to-guides/config-settings.rst&quot; &quot;=
docs/how-to-guides/first-project.rst&quot; &quot;docs/index.rst&quot; &quot=
;docs/projects-using-meson-python.rst&quot; &quot;docs/reference/environmen=
t-variables.rst&quot; &quot;docs/reference/meson-compatibility.rst&quot; &q=
uot;docs/reference/pyproject-settings.rst&quot; &quot;docs/reference/quirks=
.rst&quot; &quot;docs/tutorials/entrypoints.rst&quot; &quot;docs/tutorials/=
executable.rst&quot; &quot;docs/tutorials/introduction.rst&quot; &quot;meso=
n.build&quot; &quot;mesonpy/__init__.py&quot; &quot;mesonpy/_editable.py&qu=
ot; &quot;mesonpy/_tags.py&quot; &quot;mesonpy/_util.py&quot; &quot;pyproje=
ct.toml&quot; &quot;tests/packages/complex/meson.build&quot; &quot;tests/pa=
ckages/imports-itself-during-build/meson.build&quot; &quot;tests/test_edita=
ble.py&quot; &quot;tests/test_output.py&quot; &quot;tests/test_project.py&q=
uot; &quot;tests/test_tags.py&quot; &quot;tests/test_wheel.py&quot;&#39; fa=
iled with exit code 128:<br>
fatal: pathspec &#39;tests/packages/encoding/343203206343202271343203210.py=
&#39; did not match any files<br></blockquote><div><br></div><div>It seems =
this is a problem with unicode characters in the filename:<br>ls meson_pyth=
on-0.16.0/tests/packages/encoding/<br>meson.build =C2=A0pyproject.toml =C2=
=A0=E3=83=86=E3=82=B9=E3=83=88.py</div><div><br></div><div>Doing a manual u=
pgrade has no problems, so it is something specific to how &quot;devtool up=
grade&quot; is handling the file names?</div><div><br></div><div>NOTE: the =
0.15.0 version did not have tests/packages/encoding at all</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
<br>
Please review the attached files for further information and build/update f=
ailures.<br>
Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproject.o=
rg/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"noreferrer"=
 target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=
=3DAutomated%20Update%20Handler</a><br>
<br>
Regards,<br>
The Upgrade Helper</blockquote></div></div>

--000000000000724cc10619ef93d2--

