Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295EDC4707B
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 10:09:00 +0000 (UTC)
Subject: create-spdx-2.2.bbclass issue 
To: openembedded-core@lists.openembedded.org
From: "Jamin Lin" <jamin_lin@aspeedtech.com>
X-Originating-Location: Daan, Taipei City, TW (118.99.190.129)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 11 Jan 2024 02:08:50 -0800
Message-ID: <FBdb.1704967730905147297.gmcF@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="gaZ5EePCXb4a3swzGpis"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 10:09:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193535

--gaZ5EePCXb4a3swzGpis
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I encountered the issue about do_create_spdx task and my descriptions as fo=
llowing.

1. I have two target machines whcih are ast2700-default and ast2700-emmc, r=
espectively.
2. I have an appliction package call phosphor-logging.

I succesfully to build ast2700-emmc target machine and created spdx files f=
rom tmp/deploy/spdx directory.
Howerver, I changed machine name to ast2700-default to build the whole imag=
e again. I noticed do_create_spdx failed and it trited to search file "ssta=
te:base-files:ast2700_emmc-openbmc-linux:3.0.14:r0:ast2700_emmc" but I chan=
ged my machine to "ast2700-default". It searched the wrong base-files and i=
t caused this build error. Do you have any suggestion about how to fix it?
Thanks-Jamin

[['base-files', 'False sstate:base-files:ast2700_emmc-openbmc-linux:3.0.14:=
r0:ast2700_emmc:11: sstate:base-files::3.0.14:r0::11:']

fatal_error_here:
https://github.com/openembedded/openembedded-core/blob/master/meta/classes/=
create-spdx-2.2.bbclass#L1135
Build Configuration:
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "2.6.0"
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "x86_64-linux"
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D "ubuntu-20.04"
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "aarch64-openbmc-lin=
ux"
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "ast2700-defaul=
t"
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "openbmc-p=
hosphor"
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "nodistro.0"
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "aarch64 armv8a crc cortexa35"
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D ""
meta
meta-poky
meta-oe
meta-networking
meta-perl
meta-python
meta-phosphor
meta-arm
meta-arm-toolchain
meta-security
meta-aspeed-sdk
meta-ast2700-sdk=C2=A0 =C2=A0 =C2=A0=3D "aspeed-dev:a56e2eb3f529ed117af0312=
cef7fd257478ea59a"
ERROR: phosphor-logging-1.0+git-r1 do_create_spdx: Cannot find any SPDX fil=
e for recipe base-files, False sstate:base-files:ast2700_emmc-openbmc-linux=
:3.0.14:r0:ast2700_emmc:11: sstate:base-files::3.0.14:r0::11:
ERROR: Logfile of failure stored in: /home/jamin_lin/openbmc-ast2700/0111/b=
uild-ast2700/tmp/work/cortexa35-openbmc-linux/phosphor-logging/1.0+git/temp=
/log.do_create_spdx.2905089
ERROR: Task (/home/jamin_lin/openbmc-ast2700/0111/openbmc/meta-phosphor/rec=
ipes-phosphor/logging/phosphor-logging_git.bb:do_create_spdx) failed with e=
xit code '1'

Log:
DEBUG: Executing python function extend_recipe_sysroot
NOTE: Direct dependencies are ['/home/jamin_lin/openbmc-ast2700/0111/openbm=
c/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', 'v=
irtual:native:/home/jamin_lin/openbmc-ast2700/0111/openbmc/meta/recipes-dev=
tools/patch/patch_2.7.6.bb:do_populate_sysroot']
NOTE: Installed into sysroot: []
NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'li=
btool-native', 'quilt-native', 'texinfo-dummy-native', 'patch-native', 'att=
r-native']
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing python function do_create_spdx
DEBUG: Looking for patches that solves CVEs for phosphor-logging
ERROR: Cannot find any SPDX file for recipe base-files, False sstate:base-f=
iles:ast2700_emmc-openbmc-linux:3.0.14:r0:ast2700_emmc:11: sstate:base-file=
s::3.0.14:r0::11:
jamin debug0 ['x86_64', 'x86_64_ubuntu-20.04', 'x86_64_x86_64_linux', 'x86_=
64_linux', 'x86_64_x86_64-nativesdk', 'allarch', 'cortexa35', 'aarch64', 'a=
rmv8a', 'armv8a-crc', 'cortexa35', 'ast2700_default']
jamin debug0 reverse ['ast2700_default', 'cortexa35', 'armv8a-crc', 'armv8a=
', 'aarch64', 'cortexa35', 'allarch', 'x86_64_x86_64-nativesdk', 'x86_64_li=
nux', 'x86_64_x86_64_linux', 'x86_64_ubuntu-20.04', 'x86_64']
jamin debug1 [['base-files', 'False sstate:base-files:ast2700_emmc-openbmc-=
linux:3.0.14:r0:ast2700_emmc:11: sstate:base-files::3.0.14:r0::11:'], ['bas=
e-passwd', 'False sstate:base-passwd:cortexa35-openbmc-linux:3.6.2:r0:corte=
xa35:11: sstate:base-passwd::3.6.2:r0::11:'], ['dbus', 'False sstate:dbus:c=
ortexa35-openbmc-linux:1.14.10:r0:cortexa35:11: sstate:dbus::1.14.10:r0::11=
:'], ['gcc-cross-aarch64', 'True sstate:gcc-cross-aarch64:x86_64-openbmc-li=
nux:13.2.0:r0:x86_64:11: sstate:gcc-cross-aarch64::13.2.0:r0::11:'], ['gcc-=
runtime', 'False sstate:gcc-runtime:cortexa35-openbmc-linux:13.2.0:r0:corte=
xa35:11: sstate:gcc-runtime::13.2.0:r0::11:'], ['glibc', 'False sstate:glib=
c:cortexa35-openbmc-linux:2.38+git:r0:cortexa35:11: sstate:glibc::2.38+git:=
r0::11:'], ['libcereal', 'False sstate:libcereal:cortexa35-openbmc-linux:1.=
3.2+git:r0:cortexa35:11: sstate:libcereal::1.3.2+git:r0::11:'], ['meson-nat=
ive', 'True sstate:meson-native:x86_64-linux:1.3.0:r0:x86_64:11: sstate:mes=
on-native::1.3.0:r0::11:'], ['ninja-native', 'True sstate:ninja-native:x86_=
64-linux:1.11.1:r0:x86_64:11: sstate:ninja-native::1.11.1:r0::11:'], ['pack=
agegroup-obmc-yaml-providers', 'False sstate:packagegroup-obmc-yaml-provide=
rs:cortexa35-openbmc-linux:1.0:r1:cortexa35:11: sstate:packagegroup-obmc-ya=
ml-providers::1.0:r1::11:'], ['phosphor-dbus-interfaces', 'False sstate:pho=
sphor-dbus-interfaces:cortexa35-openbmc-linux:1.0+git:r1:cortexa35:11: ssta=
te:phosphor-dbus-interfaces::1.0+git:r1::11:'], ['phosphor-logging-callouts=
-example-native', 'True sstate:phosphor-logging-callouts-example-native:x86=
_64-linux:1.0:r1:x86_64:11: sstate:phosphor-logging-callouts-example-native=
::1.0:r1::11:'], ['pkgconfig-native', 'True sstate:pkgconfig-native:x86_64-=
linux:0.29.2+git:r0:x86_64:11: sstate:pkgconfig-native::0.29.2+git:r0::11:'=
], ['python3-mako-native', 'True sstate:python3-mako-native:x86_64-linux:1.=
3.0:r0:x86_64:11: sstate:python3-mako-native::1.3.0:r0::11:'], ['python3-na=
tive', 'True sstate:python3-native:x86_64-linux:3.11.5:r0:x86_64:11: sstate=
:python3-native::3.11.5:r0::11:'], ['python3-pyyaml-native', 'True sstate:p=
ython3-pyyaml-native:x86_64-linux:6.0.1:r0:x86_64:11: sstate:python3-pyyaml=
-native::6.0.1:r0::11:'], ['python3-sdbus++-native', 'True sstate:python3-s=
dbus++-native:x86_64-linux:1.0:r1:x86_64:11: sstate:python3-sdbus++-native:=
:1.0:r1::11:'], ['qemu-native', 'True sstate:qemu-native:x86_64-linux:8.1.2=
:r0:x86_64:11: sstate:qemu-native::8.1.2:r0::11:'], ['sdbusplus', 'False ss=
tate:sdbusplus:cortexa35-openbmc-linux:git:r1:cortexa35:11: sstate:sdbusplu=
s::git:r1::11:'], ['sdeventplus', 'False sstate:sdeventplus:cortexa35-openb=
mc-linux:0.1+git:r1:cortexa35:11: sstate:sdeventplus::0.1+git:r1::11:'], ['=
shadow', 'False sstate:shadow:cortexa35-openbmc-linux:4.13:r0:cortexa35:11:=
 sstate:shadow::4.13:r0::11:'], ['shadow-native', 'True sstate:shadow-nativ=
e:x86_64-linux:4.13:r0:x86_64:11: sstate:shadow-native::4.13:r0::11:'], ['s=
hadow-sysroot', 'False sstate:shadow-sysroot:cortexa35-openbmc-linux:4.6:r0=
:cortexa35:11: sstate:shadow-sysroot::4.6:r0::11:'], ['systemd', 'False sst=
ate:systemd:cortexa35-openbmc-linux:254.4:r0:cortexa35:11: sstate:systemd::=
254.4:r0::11:'], ['systemd-systemctl-native', 'True sstate:systemd-systemct=
l-native:x86_64-linux:1.0:r0:x86_64:11: sstate:systemd-systemctl-native::1.=
0:r0::11:']]
jamin debug2 /home/jamin_lin/openbmc-ast2700/0111/build-ast2700/tmp/deploy/=
spdx
jamin debug3 /home/jamin_lin/openbmc-ast2700/0111/build-ast2700/tmp/work/co=
rtexa35-openbmc-linux/phosphor-logging/1.0+git/spdx/deps.json
jamin 4 ['ast2700_default', 'cortexa35', 'armv8a-crc', 'armv8a', 'aarch64',=
 'cortexa35', 'allarch', 'x86_64_x86_64-nativesdk', 'x86_64_linux', 'x86_64=
_x86_64_linux', 'x86_64_ubuntu-20.04', 'x86_64']
jamin 5 base-files
jamin 6 False sstate:base-files:ast2700_emmc-openbmc-linux:3.0.14:r0:ast270=
0_emmc:11: sstate:base-files::3.0.14:r0::11:
jamin 7 None
DEBUG: Python function do_create_spdx finished

--gaZ5EePCXb4a3swzGpis
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,&nbsp;<br /><br />I encountered the issue about do_create_spdx task =
and my descriptions as following.<br /><br />1. I have two target machines =
whcih are ast2700-default and ast2700-emmc, respectively.<br />2. I have an=
 appliction package call phosphor-logging.<br /><br />I succesfully to buil=
d ast2700-emmc target machine and created spdx files from tmp/deploy/spdx d=
irectory.<br />Howerver, I changed machine name to ast2700-default to build=
 the whole image again. I noticed do_create_spdx failed and it trited to se=
arch file "sstate:base-files:ast2700_emmc-openbmc-linux:3.0.14:r0:ast2700_e=
mmc" but I changed my machine to "ast2700-default". It searched the wrong b=
ase-files and it caused this build error. Do you have any suggestion about =
how to fix it?&nbsp;<br />Thanks-Jamin<br /><br />[['base-files', 'False ss=
tate:base-files:ast2700_emmc-openbmc-linux:3.0.14:r0:ast2700_emmc:11: sstat=
e:base-files::3.0.14:r0::11:']<br /><br />fatal_error_here:<br /><a href=3D=
"https://github.com/openembedded/openembedded-core/blob/master/meta/classes=
/create-spdx-2.2.bbclass#L1135" target=3D"_blank" rel=3D"noopener">https://=
github.com/openembedded/openembedded-core/blob/master/meta/classes/create-s=
pdx-2.2.bbclass#L1135</a>&nbsp;<br />
<div>Build Configuration:</div>
<div>BB_VERSION&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "2.6.0"</div>
<div>BUILD_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "x86_64-linux"<=
/div>
<div>NATIVELSBSTRING&nbsp; &nbsp; &nbsp; =3D "ubuntu-20.04"</div>
<div>TARGET_SYS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "aarch64-openbm=
c-linux"</div>
<div>MACHINE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =3D "ast2700-d=
efault"</div>
<div>DISTRO&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D "open=
bmc-phosphor"</div>
<div>DISTRO_VERSION&nbsp; &nbsp; &nbsp; &nbsp;=3D "nodistro.0"</div>
<div>TUNE_FEATURES&nbsp; &nbsp; &nbsp; &nbsp; =3D "aarch64 armv8a crc corte=
xa35"</div>
<div>TARGET_FPU&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=3D ""</div>
<div>meta</div>
<div>meta-poky</div>
<div>meta-oe</div>
<div>meta-networking</div>
<div>meta-perl</div>
<div>meta-python</div>
<div>meta-phosphor</div>
<div>meta-arm</div>
<div>meta-arm-toolchain</div>
<div>meta-security</div>
<div>meta-aspeed-sdk</div>
<div>meta-ast2700-sdk&nbsp; &nbsp; &nbsp;=3D "aspeed-dev:a56e2eb3f529ed117a=
f0312cef7fd257478ea59a"</div>
<div>ERROR: phosphor-logging-1.0+git-r1 do_create_spdx: Cannot find any SPD=
X file for recipe base-files, False sstate:base-files:ast2700_emmc-openbmc-=
linux:3.0.14:r0:ast2700_emmc:11: sstate:base-files::3.0.14:r0::11:</div>
<div>ERROR: Logfile of failure stored in: /home/jamin_lin/openbmc-ast2700/0=
111/build-ast2700/tmp/work/cortexa35-openbmc-linux/phosphor-logging/1.0+git=
/temp/log.do_create_spdx.2905089</div>
<div>ERROR: Task (/home/jamin_lin/openbmc-ast2700/0111/openbmc/meta-phospho=
r/recipes-phosphor/logging/phosphor-logging_git.bb:do_create_spdx) failed w=
ith exit code '1'</div>
<div>&nbsp;</div>
Log:<br />
<div>DEBUG: Executing python function extend_recipe_sysroot</div>
<div>NOTE: Direct dependencies are ['/home/jamin_lin/openbmc-ast2700/0111/o=
penbmc/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot=
', 'virtual:native:/home/jamin_lin/openbmc-ast2700/0111/openbmc/meta/recipe=
s-devtools/patch/patch_2.7.6.bb:do_populate_sysroot']</div>
<div>NOTE: Installed into sysroot: []</div>
<div>NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native'=
, 'libtool-native', 'quilt-native', 'texinfo-dummy-native', 'patch-native',=
 'attr-native']</div>
<div>DEBUG: Python function extend_recipe_sysroot finished</div>
<div>DEBUG: Executing python function sstate_task_prefunc</div>
<div>DEBUG: Python function sstate_task_prefunc finished</div>
<div>DEBUG: Executing python function do_create_spdx</div>
<div>DEBUG: Looking for patches that solves CVEs for phosphor-logging</div>
<div>ERROR: Cannot find any SPDX file for recipe base-files, False sstate:b=
ase-files:ast2700_emmc-openbmc-linux:3.0.14:r0:ast2700_emmc:11: sstate:base=
-files::3.0.14:r0::11:</div>
<div>jamin debug0 ['x86_64', 'x86_64_ubuntu-20.04', 'x86_64_x86_64_linux', =
'x86_64_linux', 'x86_64_x86_64-nativesdk', 'allarch', 'cortexa35', 'aarch64=
', 'armv8a', 'armv8a-crc', 'cortexa35', 'ast2700_default']</div>
<div>jamin debug0 reverse ['ast2700_default', 'cortexa35', 'armv8a-crc', 'a=
rmv8a', 'aarch64', 'cortexa35', 'allarch', 'x86_64_x86_64-nativesdk', 'x86_=
64_linux', 'x86_64_x86_64_linux', 'x86_64_ubuntu-20.04', 'x86_64']</div>
<div>jamin debug1 [['base-files', 'False sstate:base-files:ast2700_emmc-ope=
nbmc-linux:3.0.14:r0:ast2700_emmc:11: sstate:base-files::3.0.14:r0::11:'], =
['base-passwd', 'False sstate:base-passwd:cortexa35-openbmc-linux:3.6.2:r0:=
cortexa35:11: sstate:base-passwd::3.6.2:r0::11:'], ['dbus', 'False sstate:d=
bus:cortexa35-openbmc-linux:1.14.10:r0:cortexa35:11: sstate:dbus::1.14.10:r=
0::11:'], ['gcc-cross-aarch64', 'True sstate:gcc-cross-aarch64:x86_64-openb=
mc-linux:13.2.0:r0:x86_64:11: sstate:gcc-cross-aarch64::13.2.0:r0::11:'], [=
'gcc-runtime', 'False sstate:gcc-runtime:cortexa35-openbmc-linux:13.2.0:r0:=
cortexa35:11: sstate:gcc-runtime::13.2.0:r0::11:'], ['glibc', 'False sstate=
:glibc:cortexa35-openbmc-linux:2.38+git:r0:cortexa35:11: sstate:glibc::2.38=
+git:r0::11:'], ['libcereal', 'False sstate:libcereal:cortexa35-openbmc-lin=
ux:1.3.2+git:r0:cortexa35:11: sstate:libcereal::1.3.2+git:r0::11:'], ['meso=
n-native', 'True sstate:meson-native:x86_64-linux:1.3.0:r0:x86_64:11: sstat=
e:meson-native::1.3.0:r0::11:'], ['ninja-native', 'True sstate:ninja-native=
:x86_64-linux:1.11.1:r0:x86_64:11: sstate:ninja-native::1.11.1:r0::11:'], [=
'packagegroup-obmc-yaml-providers', 'False sstate:packagegroup-obmc-yaml-pr=
oviders:cortexa35-openbmc-linux:1.0:r1:cortexa35:11: sstate:packagegroup-ob=
mc-yaml-providers::1.0:r1::11:'], ['phosphor-dbus-interfaces', 'False sstat=
e:phosphor-dbus-interfaces:cortexa35-openbmc-linux:1.0+git:r1:cortexa35:11:=
 sstate:phosphor-dbus-interfaces::1.0+git:r1::11:'], ['phosphor-logging-cal=
louts-example-native', 'True sstate:phosphor-logging-callouts-example-nativ=
e:x86_64-linux:1.0:r1:x86_64:11: sstate:phosphor-logging-callouts-example-n=
ative::1.0:r1::11:'], ['pkgconfig-native', 'True sstate:pkgconfig-native:x8=
6_64-linux:0.29.2+git:r0:x86_64:11: sstate:pkgconfig-native::0.29.2+git:r0:=
:11:'], ['python3-mako-native', 'True sstate:python3-mako-native:x86_64-lin=
ux:1.3.0:r0:x86_64:11: sstate:python3-mako-native::1.3.0:r0::11:'], ['pytho=
n3-native', 'True sstate:python3-native:x86_64-linux:3.11.5:r0:x86_64:11: s=
state:python3-native::3.11.5:r0::11:'], ['python3-pyyaml-native', 'True sst=
ate:python3-pyyaml-native:x86_64-linux:6.0.1:r0:x86_64:11: sstate:python3-p=
yyaml-native::6.0.1:r0::11:'], ['python3-sdbus++-native', 'True sstate:pyth=
on3-sdbus++-native:x86_64-linux:1.0:r1:x86_64:11: sstate:python3-sdbus++-na=
tive::1.0:r1::11:'], ['qemu-native', 'True sstate:qemu-native:x86_64-linux:=
8.1.2:r0:x86_64:11: sstate:qemu-native::8.1.2:r0::11:'], ['sdbusplus', 'Fal=
se sstate:sdbusplus:cortexa35-openbmc-linux:git:r1:cortexa35:11: sstate:sdb=
usplus::git:r1::11:'], ['sdeventplus', 'False sstate:sdeventplus:cortexa35-=
openbmc-linux:0.1+git:r1:cortexa35:11: sstate:sdeventplus::0.1+git:r1::11:'=
], ['shadow', 'False sstate:shadow:cortexa35-openbmc-linux:4.13:r0:cortexa3=
5:11: sstate:shadow::4.13:r0::11:'], ['shadow-native', 'True sstate:shadow-=
native:x86_64-linux:4.13:r0:x86_64:11: sstate:shadow-native::4.13:r0::11:']=
, ['shadow-sysroot', 'False sstate:shadow-sysroot:cortexa35-openbmc-linux:4=
.6:r0:cortexa35:11: sstate:shadow-sysroot::4.6:r0::11:'], ['systemd', 'Fals=
e sstate:systemd:cortexa35-openbmc-linux:254.4:r0:cortexa35:11: sstate:syst=
emd::254.4:r0::11:'], ['systemd-systemctl-native', 'True sstate:systemd-sys=
temctl-native:x86_64-linux:1.0:r0:x86_64:11: sstate:systemd-systemctl-nativ=
e::1.0:r0::11:']]</div>
<div>jamin debug2 /home/jamin_lin/openbmc-ast2700/0111/build-ast2700/tmp/de=
ploy/spdx</div>
<div>jamin debug3 /home/jamin_lin/openbmc-ast2700/0111/build-ast2700/tmp/wo=
rk/cortexa35-openbmc-linux/phosphor-logging/1.0+git/spdx/deps.json</div>
<div>jamin 4 ['ast2700_default', 'cortexa35', 'armv8a-crc', 'armv8a', 'aarc=
h64', 'cortexa35', 'allarch', 'x86_64_x86_64-nativesdk', 'x86_64_linux', 'x=
86_64_x86_64_linux', 'x86_64_ubuntu-20.04', 'x86_64']</div>
<div>jamin 5 base-files</div>
<div>jamin 6 False sstate:base-files:ast2700_emmc-openbmc-linux:3.0.14:r0:a=
st2700_emmc:11: sstate:base-files::3.0.14:r0::11:</div>
<div>jamin 7 None</div>
<div>DEBUG: Python function do_create_spdx finished</div>

--gaZ5EePCXb4a3swzGpis--

