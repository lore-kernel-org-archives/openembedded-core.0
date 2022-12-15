Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5705C77B7F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.144516.1671136353651806261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WawRZIDG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010185177d1b99-31859777-755e-4109-a21d-da15cb1ce7ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0BE8n16Mo5qqiJlL2lmJ/Wc0Hhs95wYElBJEDNRW230=;
	b=WawRZIDGe9vEFl7ozD4IguNWNccnuXBBEmQj/CcTCIL0auKCuN8UGfpzdqYvPEAX
	R2xp08bOxIJBT9smkNmL7iBTXkrVvw6MiBeKa/AAyHsTpriYljmyjPSSczRqFvBYAn7
	hIUyhTL5oFRuaaU8daXIGrF/SnugA9MxwI7ajJ0Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0BE8n16Mo5qqiJlL2lmJ/Wc0Hhs95wYElBJEDNRW230=;
	b=kHE9FqK83Z/EnHx/YyZGDYM2mDdK9kSO/ChQsY9hPXmy+BQuU+TU4RoBsYmvGC0S
	UDUlkyDr8sHoOvppNMAUsguSWMJUzhBUPZS/aF/XvjW0xSE1M+HKTzr+crFkZmxJ9t7
	FcH+Dvf8hBC0SVje/yfB/Lm+b3CJAowPWyNrdCoU=
Content-Type: multipart/mixed; boundary="===============2715846969755823690=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.236.0 FAILED
Message-ID: <01010185177d1b99-31859777-755e-4109-a21d-da15cb1ce7ea-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174700

--===============2715846969755823690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.236.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.231.1-1.3.236.0.patch
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
--===============2715846969755823690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d26bdf2603d4832d5944e5139be758012106d30c"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 105 Local 98 Mirrors 0 Missed 7 Current 217 (93% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1128 of 1197 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_fetch: Succeeded
NOTE: Running task 1183 of 1197 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb:do_unpack)
NOTE: Running task 1184 of 1197 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_unpack: Succeeded
NOTE: Running task 1185 of 1197 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_patch: Succeeded
NOTE: Running task 1186 of 1197 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1187 of 1197 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb:do_generate_toolchain_file)
NOTE: Running task 1188 of 1197 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1189 of 1197 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.24.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.231.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.231.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sy
 sroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'cmake-native', 'gcc-cross-i686', 'gcc-runtime', 'quilt-native', 'vulkan-headers', 'vulkan-loader', 'wayland', 'libx11', 'libxcb', 'libxrandr', 'ninja-native', 'patch-native', 'pseudo-native', 'curl-native', 'xz-native', 'zstd-native', 'bzip2-native', 'ncurses-native', 'zlib-native', 'linux-libc-headers', 'libtool-native', 'attr-native', 'libxau', 'xcb-proto', 'libpthread-stubs', 'libxdmcp', 'xorgproto', 'libxml2', 'libffi', 'expat', 'gmp-native', 'flex-native', 'gnu-config-native', 'libmpc-native', 'binutils-cross-i686', 'texinfo-dummy-native', 'mpfr-native', 'libgcc', 'autoconf-archive', 'xtrans', 'util-macros', 'libxrender', 'libxext', 're2c-native', 'openssl-native', 'gettext-minimal-native', 'python3', 'zlib', 'm4-native', 'perl-native', 'opkg-utils', 'openssl', 'sqlite3', 'readline', 'util-linux-libuuid', 'libtirpc', 'libnsl2', 'libxcrypt', 'xz', 'ncurses', 'gdbm', 'bzip2', 'gdbm-native', 'make-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 12.2.0
| -- The CXX compiler identification is GNU 12.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Using find_package to locate Vulkan
| -- Found Vulkan: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/recipe-sysroot/usr/lib/libvulkan.so
| CMake Error at CMakeLists.txt:88 (find_package):
|   Could not find a package configuration file provided by "VulkanHeaders"
|   with any of the following names:
| 
|     VulkanHeadersConfig.cmake
|     vulkanheaders-config.cmake
| 
|   Add the installation prefix of "VulkanHeaders" to CMAKE_PREFIX_PATH or set
|   "VulkanHeaders_DIR" to a directory containing one of the above files.  If
|   "VulkanHeaders" provides a separate development package or SDK, be sure it
|   has been installed.
| 
| 
| -- Configuring incomplete, errors occurred!
| See also "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/temp/run.do_configure.2048806:162 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/git -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/home/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/home/pokybuild/yocto-wo
 rker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DBUILD_TESTS=OFF -DBUILD_CUBE=OFF -DPYTHON_EXECUTABLE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/python3 -DBUILD_WSI_WAYLAND_SUPPORT=ON -DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/temp/run.do_configure.2048806, line 162
| 	#2: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/temp/run.do_configure.2048806, line 141
| 	#3: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/temp/run.do_configure.2048806, line 198
NOTE: recipe vulkan-tools-1.3.236.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1189 tasks of which 1181 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.236.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/temp/run.do_configure.2048806', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.236.0-r0/temp/log.do_configure.2048806
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb:do_configure) failed with exit code '1'

--===============2715846969755823690==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.231.1-1.3.236.0.patch"

RnJvbSAwM2YxMTE0ODM0NDA0NzViNTNmZTMzNDFjMGU5M2JjMTE5ODNiZGQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTY6MTc6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS4zLjIzMS4xIC0+IDEuMy4yMzYuMAoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjMuMjMxLjEuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yMzYuMC5iYn0gIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi10b29sc18xLjMuMjMx
LjEuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yMzYuMC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjMxLjEuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjM2LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS4zLjIzMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjM2LjAuYmIKaW5kZXggOTA2NjgyMWRlMC4uYTM1
NjFiYmI1YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4t
dG9vbHNfMS4zLjIzMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXRvb2xzXzEuMy4yMzYuMC5iYgpAQCAtNiw4ICs2LDggQEAgU0VDVElPTiA9ICJsaWJzIgog
CiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFLnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCi1TUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPXNk
ay0xLjMuMjMxO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjhkMmQzZTIyZDY4NDU0MGZkYzVh
NzZjMTVlNDU2ZmMyZmQxMWU0YjciCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25v
c0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKK1NS
Q1JFViA9ICJjZTQ1MzM3YzUxZWQ1M2U2ZjFiMzM3YWE3NDZhNWE5NmM1MDE4Zjg2IgogCiBTID0g
IiR7V09SS0RJUn0vZ2l0IgogCi0tIAoyLjM3LjMKCg==

--===============2715846969755823690==--

