Return-Path: <ccasciato@21sw.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F806C3ABD8
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 02:37:20 +0000 (UTC)
Subject: Re: [PATCH 11/15] python3-flit-core: upgrade 3.11.0 -> 3.12.0
To: openembedded-core@lists.openembedded.org
From: "Clayton Casciato" <ccasciato@21sw.us>
X-Originating-Location: Denver, Colorado, US (174.29.216.122)
X-Originating-Platform: Linux Chrome 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 18 May 2025 19:37:17 -0700
References: <1744073502-27695-11-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1744073502-27695-11-git-send-email-wangmy@fujitsu.com>
Message-ID: <1020.1747622237944275271@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zOZwDRLIX174M3IKkszi"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 02:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216806

--zOZwDRLIX174M3IKkszi
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, Wang!

I'm having trouble with the latest Poky builds (core-image-minimal) and bel=
ieve I narrowed down the issue to this commit.

I see python3-flit-core is referenced in recipetool and believe I saw somet=
hing related to this (though my scrollback wasn't enough).

See the three tests below (separated via "--").

Thank you!

Test 1 - commit previous to flit-core - success:
Build Configuration:
BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "2.12.0"
BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "x86_64-linux"
NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D "universal"
TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "arm-poky-linux-gnueabi"
MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "beaglebone-yoc=
to"
DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "poky"
DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D "5.2"
TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "arm vfp cortexa8 neon callcon=
vention-hard"
TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "hard"
meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "HEAD:557c=
12455e406571e829872fa83878510cbe94a1"
meta-selinux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:32adf788c70a3e75e947ea=
7394b9a746686bb01e"
meta-python
meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "HEAD:f3f094acd=
6c83c757378bae20d398cb14783e731"
meta-poky
meta-yocto-bsp =C2=A0 =C2=A0 =C2=A0 =3D "HEAD:557c12455e406571e829872fa8387=
8510cbe94a1"
meta-clang =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:02e254ba1fb493753=
0d94a154b4c713c904c2d06"
meta-security =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:784ca4b6584101e971b2d5=
d76ec7b716ad1301b5"

--

Test 2 - failure - HEAD:
Build Configuration:
BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "2.12.0"
BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "x86_64-linux"
NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D "universal"
TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "arm-poky-linux-gnueabi"
MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "beaglebone-yoc=
to"
DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "poky"
DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D "5.2"
TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "arm vfp cortexa8 neon callcon=
vention-hard"
TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "hard"
meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:e3=
d24e5cd8eee5d0d232abdfef33cacf0ad96787"
meta-selinux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:32adf788c70a3e75e947ea=
7394b9a746686bb01e"
meta-python
meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:1d6095b=
73fa21062fde2b347cd61b6c5104390d9"
meta-poky
meta-yocto-bsp =C2=A0 =C2=A0 =C2=A0 =3D "master:e3d24e5cd8eee5d0d232abdfef3=
3cacf0ad96787"
meta-clang =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:02e254ba1fb493753=
0d94a154b4c713c904c2d06"
meta-security =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:784ca4b6584101e971b2d5=
d76ec7b716ad1301b5"
[...]
ERROR: python3-markupsafe-native-3.0.2-r0 do_compile: Execution of '[...]/p=
oky/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/temp/run.do=
_compile.2646889' failed with exit code 1
ERROR: Logfile of failure stored in: [...]/poky/build/tmp/work/x86_64-linux=
/python3-markupsafe-native/3.0.2/temp/log.do_compile.2646889
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| [...]/poky/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/re=
cipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/_app=
ly_pyprojecttoml.py:82: SetuptoolsDeprecationWarning: `project.license` as =
a TOML table is deprecated
| !!
|
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 *********************************************=
***********************************
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 Please use a simple string containing a SPDX =
expression for `project.license`. You can also use `project.license-files`.=
 (Both options available on setuptools>=3D77.0.0).
|
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 By 2026-Feb-18, you need to update your proje=
ct and remove deprecated calls
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 or your builds will no longer be supported.
|
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 See https://packaging.python.org/en/latest/gu=
ides/writing-pyproject-toml/#license for details.
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 *********************************************=
***********************************
|
| !!
| =C2=A0 corresp(dist, value, root_dir)
| [...]/poky/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/re=
cipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/_app=
ly_pyprojecttoml.py:61: SetuptoolsDeprecationWarning: License classifiers a=
re deprecated.
| !!
|
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 *********************************************=
***********************************
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 Please consider removing the following classi=
fiers in favor of a SPDX license expression:
|
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 License :: OSI Approved :: BSD License
|
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 See https://packaging.python.org/en/latest/gu=
ides/writing-pyproject-toml/#license for details.
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 *********************************************=
***********************************
|
| !!=C2=A0 =C2=A0dist._finalize_license_expression()
| [...]/poky/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/re=
cipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/dist.py:759=
: SetuptoolsDeprecationWarning: License classifiers are deprecated.
| !!
|
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 *********************************************=
***********************************
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 Please consider removing the following classi=
fiers in favor of a SPDX license expression:
|
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 License :: OSI Approved :: BSD License
|
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 See https://packaging.python.org/en/latest/gu=
ides/writing-pyproject-toml/#license for details.
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 *********************************************=
***********************************=C2=A0 =C2=A0 =C2=A0 =C2=A0 |
| !!
| =C2=A0 self._finalize_license_expression()
| usage: _in_process.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ..=
.]
| =C2=A0 =C2=A0or: _in_process.py --help [cmd1 cmd2 ...]
| =C2=A0 =C2=A0or: _in_process.py --help-commands
| =C2=A0 =C2=A0or: _in_process.py cmd --help
|
| error: invalid command 'egg_info'
|
| ERROR Backend subprocess exited when trying to invoke get_requires_for_bu=
ild_wheel
| WARNING: exit code 1 from a shell command.
ERROR: Task (virtual:native:[...]/poky/meta/recipes-devtools/python/python3=
-markupsafe_3.0.2.bb:do_compile) failed with exit code '1'

--

Test 3 - this flit commit - failure:
Build Configuration:
BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "2.12.0"
BUILD_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "x86_64-linux"
NATIVELSBSTRING =C2=A0 =C2=A0 =C2=A0=3D "universal"
TARGET_SYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "arm-poky-linux-gnueabi"
MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "beaglebone-yoc=
to"
DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "poky"
DISTRO_VERSION =C2=A0 =C2=A0 =C2=A0 =3D "5.2"
TUNE_FEATURES =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "arm vfp cortexa8 neon callcon=
vention-hard"
TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "hard"
meta =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "HEAD:0034=
c8aac358fe613018f0456ad7c68c2da04684"
meta-selinux =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:32adf788c70a3e75e947ea=
7394b9a746686bb01e"
meta-python
meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "HEAD:f3f094acd=
6c83c757378bae20d398cb14783e731"
meta-poky
meta-yocto-bsp =C2=A0 =C2=A0 =C2=A0 =3D "HEAD:0034c8aac358fe613018f0456ad7c=
68c2da04684"
meta-clang =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "master:02e254ba1fb493753=
0d94a154b4c713c904c2d06"
meta-security =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "master:784ca4b6584101e971b2d5=
d76ec7b716ad1301b5"
[...]
NOTE: Executing Tasks
ERROR: python3-wheel-native-0.45.1-r0 do_compile: Execution of '[...]/poky/=
build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/temp/run.do_compile=
.2528661' failed with exit code 1
ERROR: Logfile of failure stored in: [...]/poky/build/tmp/work/x86_64-linux=
/python3-wheel-native/0.45.1/temp/log.do_compile.2528661
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| Traceback (most recent call last):
| =C2=A0 File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/=
0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main_=
_.py", line 178, in _handle_build_error
| =C2=A0 =C2=A0 yield
| =C2=A0 File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/=
0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main_=
_.py", line 429, in main
| =C2=A0 =C2=A0 built =3D build_call(
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.srcdir,
| =C2=A0 =C2=A0 ...<5 lines>...
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 args.installer,
| =C2=A0 =C2=A0 )
| =C2=A0 File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/=
0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main_=
_.py", line 238, in build_package
| =C2=A0 =C2=A0 out =3D _build(isolation, srcdir, outdir, distribution, con=
fig_settings, skip_dependency_check, installer)
| =C2=A0 File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/=
0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main_=
_.py", line 172, in _build
| =C2=A0 =C2=A0 return _build_in_current_env(srcdir, outdir, distribution, =
config_settings, skip_dependency_check)
| =C2=A0 File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/=
0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main_=
_.py", line 151, in _build_in_current_env
| =C2=A0 =C2=A0 missing =3D builder.check_dependencies(distribution, config=
_settings or {})
| =C2=A0 File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/=
0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/_builde=
r.py", line 243, in check_dependencies
| =C2=A0 =C2=A0 return {u for d in dependencies for u in check_dependency(d=
)}
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0~~~~~~~~~~~~~~~~^^^
| =C2=A0 File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/=
0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/_util.p=
y", line 53, in check_dependency
| =C2=A0 =C2=A0 if req.specifier and not req.specifier.contains(dist.versio=
n, prereleases=3DTrue):
| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^
| =C2=A0 File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/=
0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/packaging/spe=
cifiers.py", line 917, in contains
| =C2=A0 =C2=A0 item =3D Version(item)
| =C2=A0 File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/=
0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/packaging/ver=
sion.py", line 200, in __init__
| =C2=A0 =C2=A0 match =3D self._regex.search(version)
| TypeError: expected string or bytes-like object, got 'NoneType'
|
| ERROR expected string or bytes-like object, got 'NoneType'
| WARNING: exit code 1 from a shell command.

--
Clayton Casciato

--zOZwDRLIX174M3IKkszi
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi, Wang!</div>
<div>&nbsp;</div>
<div>I'm having trouble with the latest Poky builds (core-image-minimal) an=
d believe I narrowed down the issue to this commit.</div>
<div>&nbsp;</div>
<div>I see python3-flit-core is referenced in recipetool and believe I saw =
something related to this (though my scrollback wasn't enough).</div>
<div>&nbsp;</div>
<div>See the three tests below (separated via "--").</div>
<div>&nbsp;</div>
<div>Thank you!</div>
<div>&nbsp;</div>
<div>
<div>Test 1 - commit previous to flit-core - success:</div>
<div><span style=3D"font-family: 'courier new', courier;">Build Configurati=
on:</span><br /><span style=3D"font-family: 'courier new', courier;">BB_VER=
SION &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "2.12.0"</span><br /><span styl=
e=3D"font-family: 'courier new', courier;">BUILD_SYS &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;=3D "x86_64-linux"</span><br /><span style=3D"font-famil=
y: 'courier new', courier;">NATIVELSBSTRING &nbsp; &nbsp; &nbsp;=3D "univer=
sal"</span><br /><span style=3D"font-family: 'courier new', courier;">TARGE=
T_SYS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "arm-poky-linux-gnueabi"</span=
><br /><span style=3D"font-family: 'courier new', courier;">MACHINE &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "beaglebone-yocto"</span><br /=
><span style=3D"font-family: 'courier new', courier;">DISTRO &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "poky"</span><br /><span style=3D"fo=
nt-family: 'courier new', courier;">DISTRO_VERSION &nbsp; &nbsp; &nbsp; =3D=
 "5.2"</span><br /><span style=3D"font-family: 'courier new', courier;">TUN=
E_FEATURES &nbsp; &nbsp; &nbsp; &nbsp;=3D "arm vfp cortexa8 neon callconven=
tion-hard"</span><br /><span style=3D"font-family: 'courier new', courier;"=
>TARGET_FPU &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "hard"</span><br /><span=
 style=3D"font-family: 'courier new', courier;">meta &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "HEAD:557c12455e406571e829872fa838785=
10cbe94a1"</span><br /><span style=3D"font-family: 'courier new', courier;"=
>meta-selinux &nbsp; &nbsp; &nbsp; &nbsp; =3D "master:32adf788c70a3e75e947e=
a7394b9a746686bb01e"</span><br /><span style=3D"font-family: 'courier new',=
 courier;">meta-python &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><br /><span=
 style=3D"font-family: 'courier new', courier;">meta-oe &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;=3D "HEAD:f3f094acd6c83c757378bae20d398cb14783=
e731"</span><br /><span style=3D"font-family: 'courier new', courier;">meta=
-poky &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><br /><span style=3D"=
font-family: 'courier new', courier;">meta-yocto-bsp &nbsp; &nbsp; &nbsp; =
=3D "HEAD:557c12455e406571e829872fa83878510cbe94a1"</span><br /><span style=
=3D"font-family: 'courier new', courier;">meta-clang &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; =3D "master:02e254ba1fb4937530d94a154b4c713c904c2d06"</span><b=
r /><span style=3D"font-family: 'courier new', courier;">meta-security &nbs=
p; &nbsp; &nbsp; &nbsp;=3D "master:784ca4b6584101e971b2d5d76ec7b716ad1301b5=
"</span></div>
</div>
<div>&nbsp;</div>
<div>--</div>
<div>&nbsp;</div>
<div>Test 2 - failure - HEAD:</div>
<div><span style=3D"font-family: 'courier new', courier;">Build Configurati=
on:</span><br /><span style=3D"font-family: 'courier new', courier;">BB_VER=
SION &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "2.12.0"</span><br /><span styl=
e=3D"font-family: 'courier new', courier;">BUILD_SYS &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;=3D "x86_64-linux"</span><br /><span style=3D"font-famil=
y: 'courier new', courier;">NATIVELSBSTRING &nbsp; &nbsp; &nbsp;=3D "univer=
sal"</span><br /><span style=3D"font-family: 'courier new', courier;">TARGE=
T_SYS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "arm-poky-linux-gnueabi"</span=
><br /><span style=3D"font-family: 'courier new', courier;">MACHINE &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "beaglebone-yocto"</span><br /=
><span style=3D"font-family: 'courier new', courier;">DISTRO &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "poky"</span><br /><span style=3D"fo=
nt-family: 'courier new', courier;">DISTRO_VERSION &nbsp; &nbsp; &nbsp; =3D=
 "5.2"</span><br /><span style=3D"font-family: 'courier new', courier;">TUN=
E_FEATURES &nbsp; &nbsp; &nbsp; &nbsp;=3D "arm vfp cortexa8 neon callconven=
tion-hard"</span><br /><span style=3D"font-family: 'courier new', courier;"=
>TARGET_FPU &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "hard"</span><br /><span=
 style=3D"font-family: 'courier new', courier;">meta &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "master:e3d24e5cd8eee5d0d232abdfef33c=
acf0ad96787"</span><br /><span style=3D"font-family: 'courier new', courier=
;">meta-selinux &nbsp; &nbsp; &nbsp; &nbsp; =3D "master:32adf788c70a3e75e94=
7ea7394b9a746686bb01e"</span><br /><span style=3D"font-family: 'courier new=
', courier;">meta-python</span><br /><span style=3D"font-family: 'courier n=
ew', courier;">meta-oe &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D =
"master:1d6095b73fa21062fde2b347cd61b6c5104390d9"</span><br /><span style=
=3D"font-family: 'courier new', courier;">meta-poky</span><br /><span style=
=3D"font-family: 'courier new', courier;">meta-yocto-bsp &nbsp; &nbsp; &nbs=
p; =3D "master:e3d24e5cd8eee5d0d232abdfef33cacf0ad96787"</span><br /><span =
style=3D"font-family: 'courier new', courier;">meta-clang &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; =3D "master:02e254ba1fb4937530d94a154b4c713c904c2d06"</sp=
an><br /><span style=3D"font-family: 'courier new', courier;">meta-security=
 &nbsp; &nbsp; &nbsp; &nbsp;=3D "master:784ca4b6584101e971b2d5d76ec7b716ad1=
301b5"</span></div>
<div><span style=3D"font-family: 'courier new', courier;">[...]</span></div=
>
<div><span style=3D"font-family: 'courier new', courier;">ERROR: python3-ma=
rkupsafe-native-3.0.2-r0 do_compile: Execution of '[...]/poky/build/tmp/wor=
k/x86_64-linux/python3-markupsafe-native/3.0.2/temp/run.do_compile.2646889'=
 failed with exit code 1 &nbsp; &nbsp;</span><br /><span style=3D"font-fami=
ly: 'courier new', courier;">ERROR: Logfile of failure stored in: [...]/pok=
y/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/temp/log.do_c=
ompile.2646889 &nbsp; &nbsp;</span><br /><span style=3D"font-family: 'couri=
er new', courier;">Log data follows:</span><br /><span style=3D"font-family=
: 'courier new', courier;">| DEBUG: Executing shell function do_compile</sp=
an></div>
<div><span style=3D"font-family: 'courier new', courier;">| * Getting build=
 dependencies for wheel...</span><br /><span style=3D"font-family: 'courier=
 new', courier;">| [...]/poky/build/tmp/work/x86_64-linux/python3-markupsaf=
e-native/3.0.2/recipe-sysroot-native/usr/lib/python3.13/site-packages/setup=
tools/config/_apply_pyprojecttoml.py:82: SetuptoolsDeprecationWarning: `pro=
ject.license` as a TOML table is deprecated</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| !!</span><br />=
<span style=3D"font-family: 'courier new', courier;">|</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; &=
nbsp; &nbsp; **************************************************************=
******************</span><br /><span style=3D"font-family: 'courier new', c=
ourier;">| &nbsp; &nbsp; &nbsp; &nbsp; Please use a simple string containin=
g a SPDX expression for `project.license`. You can also use `project.licens=
e-files`. (Both options available on setuptools&gt;=3D77.0.0).</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp;&nbsp;</s=
pan><br /><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nb=
sp; &nbsp; &nbsp; By 2026-Feb-18, you need to update your project and remov=
e deprecated calls</span><br /><span style=3D"font-family: 'courier new', c=
ourier;">| &nbsp; &nbsp; &nbsp; &nbsp; or your builds will no longer be sup=
ported.</span><br /><span style=3D"font-family: 'courier new', courier;">| =
&nbsp; &nbsp; &nbsp;&nbsp;</span><br /><span style=3D"font-family: 'courier=
 new', courier;">| &nbsp; &nbsp; &nbsp; &nbsp; See https://packaging.python=
.org/en/latest/guides/writing-pyproject-toml/#license for details.</span></=
div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; &=
nbsp; &nbsp; **************************************************************=
******************</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; &=
nbsp;&nbsp;</span><br /><span style=3D"font-family: 'courier new', courier;=
">| !! &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><br /><span style=3D"fon=
t-family: 'courier new', courier;">| &nbsp; corresp(dist, value, root_dir)&=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </=
span></div>
<div><span style=3D"font-family: 'courier new', courier;">| [...]/poky/buil=
d/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/recipe-sysroot-nati=
ve/usr/lib/python3.13/site-packages/setuptools/config/_apply_pyprojecttoml.=
py:61: SetuptoolsDeprecationWarning: License classifiers are deprecated.</s=
pan><br /><span style=3D"font-family: 'courier new', courier;">| !!</span><=
br /><span style=3D"font-family: 'courier new', courier;">|</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; &=
nbsp; &nbsp; **************************************************************=
******************</span><br /><span style=3D"font-family: 'courier new', c=
ourier;">| &nbsp; &nbsp; &nbsp; &nbsp; Please consider removing the followi=
ng classifiers in favor of a SPDX license expression:</span><br /><span sty=
le=3D"font-family: 'courier new', courier;">|</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; &=
nbsp; &nbsp; License :: OSI Approved :: BSD License</span><br /><span style=
=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;&nbsp;</span><br /><span style=3D"font-family: 'courier new', courie=
r;">| &nbsp; &nbsp; &nbsp; &nbsp; See https://packaging.python.org/en/lates=
t/guides/writing-pyproject-toml/#license for details.</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; &=
nbsp; &nbsp; **************************************************************=
******************</span><br /><span style=3D"font-family: 'courier new', c=
ourier;">|</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| !!&nbsp; &nbsp;=
dist._finalize_license_expression() &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&=
nbsp;</span><br /><span style=3D"font-family: 'courier new', courier;">| [.=
..]/poky/build/tmp/work/x86_64-linux/python3-markupsafe-native/3.0.2/recipe=
-sysroot-native/usr/lib/python3.13/site-packages/setuptools/dist.py:759: Se=
tuptoolsDeprecationWarning: License classifiers are deprecated.</span></div=
>
<div><span style=3D"font-family: 'courier new', courier;">| !! &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;</span><br /><span style=3D"font-family: 'courier new=
', courier;">|</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; &=
nbsp; &nbsp; **************************************************************=
******************</span><br /><span style=3D"font-family: 'courier new', c=
ourier;">| &nbsp; &nbsp; &nbsp; &nbsp; Please consider removing the followi=
ng classifiers in favor of a SPDX license expression:</span></div>
<div><span style=3D"font-family: 'courier new', courier;">|</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; &=
nbsp; &nbsp; License :: OSI Approved :: BSD License</span><br /><span style=
=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</spa=
n><br /><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp=
; &nbsp; &nbsp; See https://packaging.python.org/en/latest/guides/writing-p=
yproject-toml/#license for details.</span><br /><span style=3D"font-family:=
 'courier new', courier;">| &nbsp; &nbsp; &nbsp; &nbsp; *******************=
*************************************************************&nbsp; &nbsp; =
&nbsp; &nbsp; |</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| !!</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp; self._fi=
nalize_license_expression()</span><br /><span style=3D"font-family: 'courie=
r new', courier;">| usage: _in_process.py [global_opts] cmd1 [cmd1_opts] [c=
md2 [cmd2_opts] ...]</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp;or=
: _in_process.py --help [cmd1 cmd2 ...]</span><br /><span style=3D"font-fam=
ily: 'courier new', courier;">| &nbsp; &nbsp;or: _in_process.py --help-comm=
ands</span><br /><span style=3D"font-family: 'courier new', courier;">| &nb=
sp; &nbsp;or: _in_process.py cmd --help</span><br /><span style=3D"font-fam=
ily: 'courier new', courier;">| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><br /><span st=
yle=3D"font-family: 'courier new', courier;">| error: invalid command 'egg_=
info'</span></div>
<div><span style=3D"font-family: 'courier new', courier;">|</span></div>
<div><span style=3D"font-family: 'courier new', courier;">| ERROR Backend s=
ubprocess exited when trying to invoke get_requires_for_build_wheel</span><=
br /><span style=3D"font-family: 'courier new', courier;">| WARNING: exit c=
ode 1 from a shell command. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><br /><span style=
=3D"font-family: 'courier new', courier;">ERROR: Task (virtual:native:[...]=
/poky/meta/recipes-devtools/python/python3-markupsafe_3.0.2.bb:do_compile) =
failed with exit code '1'</span></div>
<div>&nbsp;</div>
<div>--</div>
<div>&nbsp;</div>
<div>Test 3 - this flit commit - failure:</div>
<div>
<div><span style=3D"font-family: 'courier new', courier;">Build Configurati=
on:</span><span style=3D"font-family: 'courier new', courier;"></span></div=
>
<div><span style=3D"font-family: 'courier new', courier;">BB_VERSION &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; =3D "2.12.0"</span></div>
<div><span style=3D"font-family: 'courier new', courier;">BUILD_SYS &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "x86_64-linux" &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><br /><span style=3D"font-family: =
'courier new', courier;">NATIVELSBSTRING &nbsp; &nbsp; &nbsp;=3D "universal=
"</span></div>
<div><span style=3D"font-family: 'courier new', courier;">TARGET_SYS &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; =3D "arm-poky-linux-gnueabi"&nbsp;</span><br /=
><span style=3D"font-family: 'courier new', courier;">MACHINE &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "beaglebone-yocto"</span><br /><span=
 style=3D"font-family: 'courier new', courier;">DISTRO &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; =3D "poky"</span><br /><span style=3D"font-fam=
ily: 'courier new', courier;">DISTRO_VERSION &nbsp; &nbsp; &nbsp; =3D "5.2"=
</span><br /><span style=3D"font-family: 'courier new', courier;">TUNE_FEAT=
URES &nbsp; &nbsp; &nbsp; &nbsp;=3D "arm vfp cortexa8 neon callconvention-h=
ard"</span><br /><span style=3D"font-family: 'courier new', courier;">TARGE=
T_FPU &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "hard"</span><br /><span style=
=3D"font-family: 'courier new', courier;">meta &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; =3D "HEAD:0034c8aac358fe613018f0456ad7c68c2da04=
684"</span><br /><span style=3D"font-family: 'courier new', courier;">meta-=
selinux &nbsp; &nbsp; &nbsp; &nbsp; =3D "master:32adf788c70a3e75e947ea7394b=
9a746686bb01e"</span><br /><span style=3D"font-family: 'courier new', couri=
er;">meta-python &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><br /><span style=
=3D"font-family: 'courier new', courier;">meta-oe &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;=3D "HEAD:f3f094acd6c83c757378bae20d398cb14783e731"<=
/span><br /><span style=3D"font-family: 'courier new', courier;">meta-poky =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><br /><span style=3D"font-f=
amily: 'courier new', courier;">meta-yocto-bsp &nbsp; &nbsp; &nbsp; =3D "HE=
AD:0034c8aac358fe613018f0456ad7c68c2da04684"</span><br /><span style=3D"fon=
t-family: 'courier new', courier;">meta-clang &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; =3D "master:02e254ba1fb4937530d94a154b4c713c904c2d06"</span><br /><sp=
an style=3D"font-family: 'courier new', courier;">meta-security &nbsp; &nbs=
p; &nbsp; &nbsp;=3D "master:784ca4b6584101e971b2d5d76ec7b716ad1301b5"</span=
><br /><span style=3D"font-family: courier new, courier;">[...]</span><br /=
><span style=3D"font-family: 'courier new', courier;">NOTE: Executing Tasks=
&nbsp;</span><br /><span style=3D"font-family: 'courier new', courier;">ERR=
OR: python3-wheel-native-0.45.1-r0 do_compile: Execution of '[...]/poky/bui=
ld/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/temp/run.do_compile.25=
28661' failed with exit code 1</span><br /><span style=3D"font-family: 'cou=
rier new', courier;">ERROR: Logfile of failure stored in: [...]/poky/build/=
tmp/work/x86_64-linux/python3-wheel-native/0.45.1/temp/log.do_compile.25286=
61</span><br /><span style=3D"font-family: 'courier new', courier;">Log dat=
a follows:</span><br /><span style=3D"font-family: 'courier new', courier;"=
>| DEBUG: Executing shell function do_compile</span><br /><span style=3D"fo=
nt-family: 'courier new', courier;">| * Getting build dependencies for whee=
l...</span><br /><span style=3D"font-family: 'courier new', courier;">|&nbs=
p;</span><br /><span style=3D"font-family: 'courier new', courier;">| Trace=
back (most recent call last):&nbsp;</span><br /><span style=3D"font-family:=
 'courier new', courier;">| &nbsp; File "[...]/poky/build/tmp/work/x86_64-l=
inux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3.13/s=
ite-packages/build/__main__.py", line 178, in _handle_build_error</span><br=
 /><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; yie=
ld</span><br /><span style=3D"font-family: 'courier new', courier;">| &nbsp=
; File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/=
recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.py", =
line 429, in main</span><br /><span style=3D"font-family: 'courier new', co=
urier;">| &nbsp; &nbsp; built =3D build_call(</span><br /><span style=3D"fo=
nt-family: 'courier new', courier;">| &nbsp; &nbsp; &nbsp; &nbsp; args.srcd=
ir,</span><br /><span style=3D"font-family: 'courier new', courier;">| &nbs=
p; &nbsp; ...&lt;5 lines&gt;...</span><br /><span style=3D"font-family: 'co=
urier new', courier;">| &nbsp; &nbsp; &nbsp; &nbsp; args.installer,</span><=
br /><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbsp; )=
&nbsp;</span><br /><span style=3D"font-family: 'courier new', courier;">| &=
nbsp; File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/0.4=
5.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/__main__.p=
y", line 238, in build_package</span><br /><span style=3D"font-family: 'cou=
rier new', courier;">| &nbsp; &nbsp; out =3D _build(isolation, srcdir, outd=
ir, distribution, config_settings, skip_dependency_check, installer)</span>=
<br /><span style=3D"font-family: 'courier new', courier;">| &nbsp; File "[=
...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sy=
sroot-native/usr/lib/python3.13/site-packages/build/__main__.py", line 172,=
 in _build</span><br /><span style=3D"font-family: 'courier new', courier;"=
>| &nbsp; &nbsp; return _build_in_current_env(srcdir, outdir, distribution,=
 config_settings, skip_dependency_check)</span><br /><span style=3D"font-fa=
mily: 'courier new', courier;">| &nbsp; File "[...]/poky/build/tmp/work/x86=
_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib/python3=
.13/site-packages/build/__main__.py", line 151, in _build_in_current_env</s=
pan><br /><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nb=
sp; missing =3D builder.check_dependencies(distribution, config_settings or=
 {})</span><br /><span style=3D"font-family: 'courier new', courier;">| &nb=
sp; File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.=
1/recipe-sysroot-native/usr/lib/python3.13/site-packages/build/_builder.py"=
, line 243, in check_dependencies</span><br /><span style=3D"font-family: '=
courier new', courier;">| &nbsp; &nbsp; return {u for d in dependencies for=
 u in check_dependency(d)}</span><br /><span style=3D"font-family: 'courier=
 new', courier;">| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;~~~~~~~~~~~~~~~~^^^</span><br /><span style=3D=
"font-family: 'courier new', courier;">| &nbsp; File "[...]/poky/build/tmp/=
work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysroot-native/usr/lib=
/python3.13/site-packages/build/_util.py", line 53, in check_dependency</sp=
an><br /><span style=3D"font-family: 'courier new', courier;">| &nbsp; &nbs=
p; if req.specifier and not req.specifier.contains(dist.version, prerelease=
s=3DTrue):</span><br /><span style=3D"font-family: 'courier new', courier;"=
>| &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^</span><br /><span style=3D"font-family: 'courier new', courier;=
">| &nbsp; File "[...]/poky/build/tmp/work/x86_64-linux/python3-wheel-nativ=
e/0.45.1/recipe-sysroot-native/usr/lib/python3.13/site-packages/packaging/s=
pecifiers.py", line 917, in contains</span><br /><span style=3D"font-family=
: 'courier new', courier;">| &nbsp; &nbsp; item =3D Version(item)</span><br=
 /><span style=3D"font-family: 'courier new', courier;">| &nbsp; File "[...=
]/poky/build/tmp/work/x86_64-linux/python3-wheel-native/0.45.1/recipe-sysro=
ot-native/usr/lib/python3.13/site-packages/packaging/version.py", line 200,=
 in __init__</span><br /><span style=3D"font-family: 'courier new', courier=
;">| &nbsp; &nbsp; match =3D self._regex.search(version)</span><br /><span =
style=3D"font-family: 'courier new', courier;">| TypeError: expected string=
 or bytes-like object, got 'NoneType'</span><br /><span style=3D"font-famil=
y: 'courier new', courier;">|&nbsp;</span><br /><span style=3D"font-family:=
 'courier new', courier;">| ERROR expected string or bytes-like object, got=
 'NoneType'</span><br /><span style=3D"font-family: 'courier new', courier;=
">| WARNING: exit code 1 from a shell command.</span></div>
</div>
<div>&nbsp;</div>
<div>--</div>
<div>Clayton Casciato</div>

--zOZwDRLIX174M3IKkszi--

