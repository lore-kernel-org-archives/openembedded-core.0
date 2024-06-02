Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83B4C27C44
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 22:32:22 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.70121.1717367539498515029
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 15:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Imrj/ljG;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a68ca4d6545so161217366b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717367538; x=1717972338; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PNrbtvE4Rptbut8tFzUX7bJuLDgtHF6dmcVzpXd4/wU=;
        b=Imrj/ljGuRb2MMbWKxWtau9UahxZQXEqxacaf8q0hxyQpoDLRrLDzPnDSIUQe+mmC5
         NbpoVkqcXTcOP6dBzyEEk9s+PJAm4Jhrx20HwYL//mLOSmbi57mBUPbcbBoI+htqyTZi
         mTrx2+T8DJitb8w5Rq/hXz0caFxwHfLf/EgBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717367538; x=1717972338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNrbtvE4Rptbut8tFzUX7bJuLDgtHF6dmcVzpXd4/wU=;
        b=moUN30LTDfmFMIEKGdNb32d8gG6p4fVFcQCOIWdEKVjjyhLRrgvWSoNKT2ujea88TY
         O45n+90HulvgtjRcFXKaB21zb/L8fnxj9v7oybPjqC6DlQG3DuM56QkaPN74ypNqVw9E
         NmmJNLR9BpWfg+dLf8I3tgxTFF2K0Ex7ST8tM2XMUHH2nH+bRnXTDNjOD7lNB0Zn6hkC
         /aH8kXhoO0mHJxwSWkk0Qq/vzj9AObeKcbC9N4ObJuGHc0ymwqh2752AU1u3jpojsZP/
         T06nuZb49Wq7avsh/HsJSukr1PVjeJFNHARGfbsWLTkwFH4nThkDIT3tY0K5KmHEKrCL
         gsyA==
X-Gm-Message-State: AOJu0YzA1ZSkC+UJNclsU9MzQ1SZaSn7kGqgVDByxzyGttTzH8KCjKiW
	HeiBKfMSNKJndLUzquiMWhk4pNGAfr/LxrJWX4rwn7fFdFC6YwlJP0gvSB+V9zPMLquGDzuIqP+
	yAKRM4w2VdBgQY7yCoCtFThJ5gQP7GBszqIMxqw==
X-Google-Smtp-Source: AGHT+IHKepai6XV+y31RBsAohQsED/jzKNN57eE9rTvx+3u0fr0AqHZJyoYjWbh7nFfohjoEF2wS1ne9/c+TX857dMI=
X-Received: by 2002:a17:907:3f09:b0:a68:f736:403c with SMTP id
 a640c23a62f3a-a68f73643d9mr191133066b.14.1717367537485; Sun, 02 Jun 2024
 15:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <0101018fd4dd34f7-5726b585-30b2-45d5-9eeb-f50bbb6b8bda-000000@us-west-2.amazonses.com>
 <CAOyo-84ow3Ugj8=qFD5bNrpq23t8xPKZ-E0L8=KvvkCVHnOVPg@mail.gmail.com>
In-Reply-To: <CAOyo-84ow3Ugj8=qFD5bNrpq23t8xPKZ-E0L8=KvvkCVHnOVPg@mail.gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Sun, 2 Jun 2024 15:32:06 -0700
Message-ID: <CAOyo-86XYzVo1aw09r0S+rT5L+VGby=7+1_3O-MS1_c11a3odw@mail.gmail.com>
Subject: Re: [AUH] python3-meson-python: upgrading to 0.16.0 FAILED
To: auh@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000563250619efca7c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 22:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200225

--0000000000000563250619efca7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2024 at 3:16=E2=80=AFPM Tim Orling <tim.orling@konsulko.com>=
 wrote:

>
>
> On Sat, Jun 1, 2024 at 10:33=E2=80=AFAM <auh@yoctoproject.org> wrote:
>
>> Hello,
>>
>> this email is a notification from the Auto Upgrade Helper
>> that the automatic attempt to upgrade the recipe *python3-meson-python*
>> to *0.16.0* has Failed (devtool error).
>>
>> Detailed error information:
>>
>> The following devtool command failed:  upgrade python3-meson-python -V
>> 0.16.0
>> NOTE: Reconnecting to bitbake server...
>> Loading cache...done.
>> Loaded 1878 entries from dependency cache.
>> Removing 1 recipes from the x86_64 sysroot...done.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION           =3D "2.9.1"
>> BUILD_SYS            =3D "x86_64-linux"
>> NATIVELSBSTRING      =3D "universal"
>> TARGET_SYS           =3D "x86_64-poky-linux"
>> MACHINE              =3D "qemux86-64"
>> DISTRO               =3D "poky"
>> DISTRO_VERSION       =3D
>> "5.0+snapshot-f545f76df362714d49c9cdad3a9c02789a25890a"
>> TUNE_FEATURES        =3D "m64 core2"
>> TARGET_FPU           =3D ""
>> meta
>> meta-poky
>> meta-yocto-bsp
>> workspace            =3D
>> "tmp-auh-upgrades:f545f76df362714d49c9cdad3a9c02789a25890a"
>>
>> Initialising tasks...NOTE: The /proc/pressure files can't be read.
>> Continuing build without monitoring pressure
>> Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100%
>> match, 100% complete)
>> done.
>> NOTE: Executing Tasks
>> NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be
>> rerun and all succeeded.
>> NOTE: Writing buildhistory
>> NOTE: Writing buildhistory took: 3 seconds
>> Loading cache...done.
>> Loaded 1878 entries from dependency cache.
>> Parsing recipes...done.
>> Parsing of 919 .bb files complete (917 cached, 2 parsed). 1878 targets,
>> 35 skipped, 0 masked, 0 errors.
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION           =3D "2.9.1"
>> BUILD_SYS            =3D "x86_64-linux"
>> NATIVELSBSTRING      =3D "universal"
>> TARGET_SYS           =3D "x86_64-poky-linux"
>> MACHINE              =3D "qemux86-64"
>> DISTRO               =3D "poky"
>> DISTRO_VERSION       =3D
>> "5.0+snapshot-f545f76df362714d49c9cdad3a9c02789a25890a"
>> TUNE_FEATURES        =3D "m64 core2"
>> TARGET_FPU           =3D ""
>> meta
>> meta-poky
>> meta-yocto-bsp
>> workspace            =3D
>> "tmp-auh-upgrades:f545f76df362714d49c9cdad3a9c02789a25890a"
>>
>> Initialising tasks...NOTE: The /proc/pressure files can't be read.
>> Continuing build without monitoring pressure
>> Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match,
>> 0% complete)
>> done.
>> NOTE: Executing Tasks
>> WARNING: tmp-recipetool-2s05wgwo: the directory
>> /home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-7a3kjcz=
y/emptysrc
>> (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/recipetool-7a3kjc=
zy/emptysrc)
>> pointed to by the S variable doesn't exist - please set S within the rec=
ipe
>> to point to where the source has been unpacked to
>> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be reru=
n
>> and all succeeded.
>> NOTE: Writing buildhistory
>> NOTE: Writing buildhistory took: 3 seconds
>> DEBUG 5 [Errno 25] Inappropriate ioctl for device
>> Adding changed files:   0% |                                   | ETA:
>> --:--:--
>> INFO: Extracting current version source...
>> INFO: Extracting upgraded version source...
>> INFO: Fetching
>> https://files.pythonhosted.org/packages/source/m/meson_python/meson_pyth=
on-0.16.0.tar.gz;downloadfilename=3Dmeson_python-0.16.0.tar.gz.
>> ..
>> ERROR: Execution of 'git add -f -A ".readthedocs.yaml"
>> "tests/packages/complex/complex/more/baz.pyx"
>> "tests/packages/complex/complex/more/meson.build"
>> "tests/packages/complex/foo.py" "tests/packages/complex/move.py"
>> "tests/packages/custom-target-dir/codegen.py"
>> "tests/packages/custom-target-dir/meson.build"
>> "tests/packages/custom-target-dir/pyproject.toml"
>> "tests/packages/encoding/meson.build"
>> "tests/packages/encoding/pyproject.toml"
>> ""tests/packages/encoding/\343\203\206\343\202\271\343\203\210.py""
>> ".cirrus.yml" ".github/workflows/docs.yml" ".github/workflows/tests.yml"
>> ".pre-commit-config.yaml" ".readthedocs.yml" "CHANGELOG.rst" "PKG-INFO"
>> "README.rst" "ci/alpine-3.docker" "ci/debian-11.docker"
>> "ci/debian-12.docker" "ci/fedora-37.docker" "ci/miniconda.docker"
>> "docs/changelog.rst" "docs/conf.py" "docs/contributing/commit-format.rst=
"
>> "docs/contributing/documentation.rst"
>> "docs/contributing/getting-started.rst" "docs/contributing/index.rst"
>> "docs/contributing/release-process.rst" "do
>>  cs/contributing/test-suite.rst" "docs/explanations/design.rst"
>> "docs/explanations/editable-installs.rst"
>> "docs/explanations/internal-dependencies.rst"
>> "docs/how-to-guides/build-directory.rst"
>> "docs/how-to-guides/config-settings.rst"
>> "docs/how-to-guides/first-project.rst" "docs/index.rst"
>> "docs/projects-using-meson-python.rst"
>> "docs/reference/environment-variables.rst"
>> "docs/reference/meson-compatibility.rst"
>> "docs/reference/pyproject-settings.rst" "docs/reference/quirks.rst"
>> "docs/tutorials/entrypoints.rst" "docs/tutorials/executable.rst"
>> "docs/tutorials/introduction.rst" "meson.build" "mesonpy/__init__.py"
>> "mesonpy/_editable.py" "mesonpy/_tags.py" "mesonpy/_util.py"
>> "pyproject.toml" "tests/packages/complex/meson.build"
>> "tests/packages/imports-itself-during-build/meson.build"
>> "tests/test_editable.py" "tests/test_output.py" "tests/test_project.py"
>> "tests/test_tags.py" "tests/test_wheel.py"' failed with exit code 128:
>> fatal: pathspec 'tests/packages/encoding/343203206343202271343203210.py'
>> did not match any files
>>
>
> It seems this is a problem with unicode characters in the filename:
> ls meson_python-0.16.0/tests/packages/encoding/
> meson.build  pyproject.toml  =E3=83=86=E3=82=B9=E3=83=88.py
>
> Doing a manual upgrade has no problems, so it is something specific to ho=
w
> "devtool upgrade" is handling the file names?
>
> NOTE: the 0.15.0 version did not have tests/packages/encoding at all
>
>

Filed a bug for this:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15500

I have a recollection that using unicode characters in layer names also
does not work, so this might be a limitation of bitbake or elsewhere and
not a problem in devtool itself.


>
>>
>>
>> Please review the attached files for further information and build/updat=
e
>> failures.
>> Any problem please file a bug at
>> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Up=
date%20Handler
>>
>> Regards,
>> The Upgrade Helper
>
>

--0000000000000563250619efca7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 2, 2024 at 3:16=E2=80=AFP=
M Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com">tim.orling@kons=
ulko.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 1, 2024 at 10:33=
=E2=80=AFAM &lt;<a href=3D"mailto:auh@yoctoproject.org" target=3D"_blank">a=
uh@yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hello,<br>
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
</div></div></div></blockquote><div><br></div><div>Filed a bug for this:</d=
iv><div><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1550=
0">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15500</a></div><div>=
<br></div><div>I have a recollection that using unicode characters in layer=
 names also does not work, so this might be a limitation of bitbake or else=
where and not a problem in devtool itself.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div></div>

--0000000000000563250619efca7c--

