Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12419.1602843683121280001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9DDE938C179D
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.7.1 SUCCEEDED
Message-ID: <MADEUP.163E71D6A99A5974.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143440
Content-Type: multipart/mixed; boundary="===============3062665005241543666=="

--===============3062665005241543666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pygments* to *2.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.6.1-2.7.1.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============3062665005241543666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site-packages/pygme
 nts/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site-packages/pygme
 nts/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site-packages/py
 gments/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site-packages
 /pygments/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/
 lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info
  /usr/lib/python3.8/site-packages/pygments/lexers/arrow.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/bare.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/devicetree.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/promql.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/yang.py was added

--===============3062665005241543666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1448 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (784 cached, 1 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d19b9665a0b5c253c21743f491b41a7375fe1536"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 49 Found 41 Missed 8 Current 668 (83% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 686 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 687 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 695 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 712 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Started
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-src went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dbg went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-staticdev went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
NOTE: Running task 1586 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_fetch)
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dev went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-doc went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-locale went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pygments-2.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1806 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_unpack)
NOTE: Running task 1892 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2221 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_patch)
NOTE: recipe python3-pygments-2.7.1-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2238 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_lic)
NOTE: recipe python3-pygments-2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_lic unihash changed to a33df94122a13671cdd69007418e01326cc887a4dfe06fd5528987eaaa4ed6e3
NOTE: recipe python3-pygments-2.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2239 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_configure)
NOTE: recipe python3-pygments-2.7.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2240 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_compile)
NOTE: recipe python3-pygments-2.7.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2241 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_install)
NOTE: recipe python3-pygments-2.7.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_install: Succeeded
NOTE: Running task 2242 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package)
NOTE: Running task 2243 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-pygments-2.7.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_package: Succeeded
NOTE: Running task 2244 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_packagedata)
NOTE: recipe python3-pygments-2.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2245 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package_write_rpm)
NOTE: Running task 2246 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package_qa)
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2247 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2247 tasks of which 2232 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============3062665005241543666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1411 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d19b9665a0b5c253c21743f491b41a7375fe1536"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 47 Found 39 Missed 8 Current 670 (82% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 687 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 688 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 696 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 712 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_packagedata_setscene)
NOTE: Running task 1586 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_fetch)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1798 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_unpack)
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-src went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dbg went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-staticdev went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
NOTE: Running task 1883 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_prepare_recipe_sysroot)
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dev went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-doc went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-locale went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
NOTE: recipe python3-pygments-2.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pygments-2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2114 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_patch)
NOTE: recipe python3-pygments-2.7.1-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2238 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_lic)
NOTE: recipe python3-pygments-2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_lic unihash changed to a33df94122a13671cdd69007418e01326cc887a4dfe06fd5528987eaaa4ed6e3
NOTE: recipe python3-pygments-2.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2239 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_configure)
NOTE: recipe python3-pygments-2.7.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2240 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_compile)
NOTE: recipe python3-pygments-2.7.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2241 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_install)
NOTE: recipe python3-pygments-2.7.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_install: Succeeded
NOTE: Running task 2242 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package)
NOTE: Running task 2243 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-pygments-2.7.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_package: Succeeded
NOTE: Running task 2244 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_packagedata)
NOTE: recipe python3-pygments-2.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2245 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package_write_rpm)
NOTE: Running task 2246 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package_qa)
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2247 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2247 tasks of which 2232 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============3062665005241543666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1410 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 46 skipped, 0 masked, 0 errors.
Removing 105 recipes from the core2-32 sysroot...done.
Removing 108 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d19b9665a0b5c253c21743f491b41a7375fe1536"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 539 Found 531 Missed 8 Current 189 (98% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 190 of 728 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 191 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 192 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 193 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 194 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 195 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 196 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 203 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 253 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 254 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 255 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 256 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 257 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 259 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 260 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 261 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_package_write_rpm_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 264 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 265 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 266 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 269 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 271 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 272 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 275 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 276 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 286 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.8.0.bb:do_packagedata_setscene)
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 287 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 288 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 296 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 299 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 301 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 302 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 303 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 304 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 305 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 306 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 308 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 309 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 311 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 312 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 313 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 315 of 728 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 317 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 318 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_package_write_rpm_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.8.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 321 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 323 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 324 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 325 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 328 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 329 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 339 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_packagedata_setscene)
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 344 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_packagedata_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 358 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 366 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.7.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.180.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.43-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 373 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 377 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 382 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.1.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 386 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 390 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-src went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dbg went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-staticdev went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dev went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-doc went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-locale went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 391 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe grep-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.64.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.180-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 728 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_fetch)
NOTE: Running setscene task 446 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 448 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 450 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.43.bb:do_packagedata_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.1.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.7.1-r0: task do_fetch: Started
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_fetch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 985 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_unpack)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 469 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1011 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_patch)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.7.1-r0: task do_patch: Started
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 491 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1030 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1031 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_lic)
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 511 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 521 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_lic unihash changed to a33df94122a13671cdd69007418e01326cc887a4dfe06fd5528987eaaa4ed6e3
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 527 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.64.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 540 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 577 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: recipe python3-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 592 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1g-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 640 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.8.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 644 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 645 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 650 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.8.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 658 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 659 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 660 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 662 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.33.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 665 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 668 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 669 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-1.1.1g-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 673 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.33.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-1.1.1g-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.7.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.7.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-1.1.1g-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 686 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.7.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 687 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 688 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 698 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 704 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 711 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+a5aff1972c-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 722 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 724 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 725 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 728 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2005 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2260 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_configure)
NOTE: recipe python3-pygments-2.7.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2261 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_compile)
NOTE: recipe python3-pygments-2.7.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2262 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_install)
NOTE: recipe python3-pygments-2.7.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_install: Succeeded
NOTE: Running task 2263 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package)
NOTE: Running task 2264 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-pygments-2.7.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_package: Succeeded
NOTE: Running task 2265 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_packagedata)
NOTE: recipe python3-pygments-2.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2266 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package_write_rpm)
NOTE: Running task 2267 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package_qa)
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2268 of 2268 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2268 tasks of which 2253 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============3062665005241543666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1411 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d19b9665a0b5c253c21743f491b41a7375fe1536"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 50 Found 42 Missed 8 Current 667 (84% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 685 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 686 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 694 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 712 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1586 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_fetch)
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-src went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dbg went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-staticdev went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dev went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-doc went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-locale went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
NOTE: recipe python3-pygments-2.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pygments-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1814 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_unpack)
NOTE: Running task 1892 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_patch)
NOTE: recipe python3-pygments-2.7.1-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2238 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_lic)
NOTE: recipe python3-pygments-2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_lic unihash changed to a33df94122a13671cdd69007418e01326cc887a4dfe06fd5528987eaaa4ed6e3
NOTE: recipe python3-pygments-2.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2239 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_configure)
NOTE: recipe python3-pygments-2.7.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2240 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_compile)
NOTE: recipe python3-pygments-2.7.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2241 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_install)
NOTE: recipe python3-pygments-2.7.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_install: Succeeded
NOTE: Running task 2242 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package)
NOTE: Running task 2243 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-pygments-2.7.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_package: Succeeded
NOTE: Running task 2244 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_packagedata)
NOTE: recipe python3-pygments-2.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2245 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package_write_rpm)
NOTE: Running task 2246 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package_qa)
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2247 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2247 tasks of which 2232 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============3062665005241543666==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.6.1-2.7.1.patch"

From a495ea5db56eb62ef50e5eaf1907ab4d3a16afc1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 04:26:00 +0000
Subject: [PATCH] python3-pygments: upgrade 2.6.1 -> 2.7.1

---
 ...nts_2.6.1.bb => python3-pygments_2.7.1.bb} | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.6.1.bb => python3-pygments_2.7.1.bb} (31%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.6.1.bb b/meta/recipes-devtools/python/python3-pygments_2.7.1.bb
similarity index 31%
rename from meta/recipes-devtools/python/python3-pygments_2.6.1.bb
rename to meta/recipes-devtools/python/python3-pygments_2.7.1.bb
index bffef59e69..8d87e26eb5 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.6.1.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.7.1.bb
@@ -1,12 +1,30 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright (c) 2006-2019 by the respective authors (see AUTHORS file).
+# +Copyright (c) 2006-2020 by the respective authors (see AUTHORS file).
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# 
+#
+
 SUMMARY = "Pygments is a syntax highlighting package written in Python."
 DESCRIPTION = "Pygments is a syntax highlighting package written in Python."
 HOMEPAGE = "http://pygments.org/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e1d7b7bffbfeaa14083fd2bd3236aea8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1f5d0c4cf38dfc8122c00d6f1a97a0cc"
 
 inherit setuptools3
-SRC_URI[md5sum] = "a48c5219de92f12c41acba814730b31a"
-SRC_URI[sha256sum] = "647344a061c249a3b74e230c739f434d7ea4d8b1d5f3721bc0f3558049b38f44"
+SRC_URI[sha256sum] = "926c3f319eda178d1bd90851e4317e6d8cdb5e292a3386aac9bd75eca29cf9c7"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.18.4


--===============3062665005241543666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1411 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (783 cached, 2 parsed). 1356 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d19b9665a0b5c253c21743f491b41a7375fe1536"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 47 Found 39 Missed 8 Current 670 (82% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 686 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 687 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 695 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.19.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 712 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.36.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 717 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.19.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1586 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_fetch)
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-src went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dbg went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-staticdev went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dev went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-doc went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-locale went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
ERROR: python3-pycairo-1.19.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo went backwards which would break package feeds (from 0:1.20.0-r0 to 0:1.19.1-r0) [version-going-backwards]
NOTE: recipe python3-pygments-2.7.1-r0: task do_fetch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1845 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_unpack)
NOTE: recipe python3-pycairo-1.19.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1883 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: recipe python3-pygments-2.7.1-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_patch)
NOTE: recipe python3-pygments-2.7.1-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2237 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2238 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_lic)
NOTE: recipe python3-pygments-2.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_lic: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_lic unihash changed to a33df94122a13671cdd69007418e01326cc887a4dfe06fd5528987eaaa4ed6e3
NOTE: recipe python3-pygments-2.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2239 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_configure)
NOTE: recipe python3-pygments-2.7.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_configure: Succeeded
NOTE: Running task 2240 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_compile)
NOTE: recipe python3-pygments-2.7.1-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_compile: Succeeded
NOTE: Running task 2241 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_install)
NOTE: recipe python3-pygments-2.7.1-r0: task do_install: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_install: Succeeded
NOTE: Running task 2242 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package)
NOTE: Running task 2243 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_populate_sysroot)
NOTE: recipe python3-pygments-2.7.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_package: Succeeded
NOTE: Running task 2244 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_packagedata)
NOTE: recipe python3-pygments-2.7.1-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2245 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package_write_rpm)
NOTE: Running task 2246 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_package_qa)
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_qa: Started
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pygments-2.7.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2247 of 2247 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.7.1.bb:do_build)
NOTE: Tasks Summary: Attempted 2247 tasks of which 2232 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 7 ERROR messages shown, returning a non-zero exit code.

--===============3062665005241543666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pygments: PV changed from "2.6.1" to "2.7.1"
packages/core2-32-poky-linux/python3-pygments: PKGV changed from 2.6.1 [default] to 2.7.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site-pa
 ckages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.6.1" to "2.7.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.6.1 [default] to 2.7.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site-pa
 ckages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.6.1" to "2.7.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.6.1 [default] to 2.7.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site-pa
 ckages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.6.1" to "2.7.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.6.1 [default] to 2.7.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site
 -packages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.6.1" to "2.7.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.6.1 [default] to 2.7.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site-pa
 ckages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.6.1" to "2.7.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.6.1 [default] to 2.7.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/s
 ite-packages/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.6.1" to "2.7.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.6.1 [default] to 2.7.1 [default]
packages/core2-32-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info -> /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info, added "/usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/bare.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/arrow.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc /usr/lib/python3.8/site-packag
 es/pygments/lexers/devicetree.py /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py /usr/lib/python3.8/site-packages/pygments/lexers/yang.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/promql.py /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 5594256 to 5784682 (+3%)
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PV changed from "2.6.1" to "2.7.1"
packages/core2-32-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.6.1 [default] to 2.7.1 [default]
Changes to packages/core2-32-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.8/site-packages/Pygments-2.6.1-py3.8.egg-info moved to /usr/lib/python3.8/site-packages/Pygments-2.7.1-py3.8.egg-info
  /usr/lib/python3.8/site-packages/pygments/lexers/arrow.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/bare.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/devicetree.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/gdscript.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/_mysql_builtins.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/pointless.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/promql.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/arrow.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/bare.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/devicetree.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/gdscript.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/_mysql_builtins.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/pointless.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/promql.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/tnt.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/__pycache__/yang.cpython-38.pyc was added
  /usr/lib/python3.8/site-packages/pygments/lexers/tnt.py was added
  /usr/lib/python3.8/site-packages/pygments/lexers/yang.py was added

--===============3062665005241543666==--
