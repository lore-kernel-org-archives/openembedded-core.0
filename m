Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4941CD13D2
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 19:14:50 +0000 (UTC)
Received: from xmbgsz5.mail.qq.com (xmbgsz5.mail.qq.com [113.108.92.87])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2550.1762811000682691156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 13:43:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foxmail.com header.s=s201512 header.b=haprAZcI;
 spf=pass (domain: foxmail.com, ip: 113.108.92.87, mailfrom: wenyang.linux@foxmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1762810994;
	bh=WkjJVqI30Vr6UKNEMjRGyKuI+GnElpZkiwBvR3xs6lA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=haprAZcIntGGWVnk3mQLw+rH401s+xx+sezlIRkQWk8WeECJJsooskMv6RESatfyB
	 z+lOEiQmsFFob5egiICQ+PT/Vug7JHDWLc55Wly/wvDhRzO1H2o+9dRzhVsb1oFjpX
	 /IUVj8RhunBkjb+sa5omUO5j19UJIkvb/SqTCtA8=
Received: from [IPV6:2409:891f:8f61:a4de:3269:82a4:45e:bbb5] ([2409:891f:8f61:a4de:3269:82a4:45e:bbb5])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 89501098; Tue, 11 Nov 2025 01:34:21 +0800
X-QQ-mid: xmsmtpt1762796061th70fcbca
Message-ID: <tencent_2677F8D13FDF5559505F041D4D26A4CB320A@qq.com>
X-QQ-XMAILINFO: Od8VqZhFMB3Nw9hRbF/tsKmOfzaShABSRV4Bc/i7QjXjjs3dTKxK16bVbqRSgo
	 x1FAqYNXvtgRH5uAgTeNewaBpYMDmWA2lUUYCh2clhgOkS4w6nX9Y/mocxh7V4WFHTJYBDQdrE3E
	 Ltm5N527qMAPCk9zNNfynnmHBiKh4+vekSZPHUyVSdK/aKMaPgsLO02m8ftrLpKIkoCKaXkzplzf
	 GjDzCJ8jq1sQ031u/nqR1oU8t+p90P4tMO2AeWUou3fypPcbrcz0ByNdxmCwH+ML6pbUtV9FFmZo
	 jPLo6Qa4/fFTBkSC8/0zsxtdf8uheetH8H2heCwKOpFaM/QMravxtSaiacWfd2YN7Ih8e1pFlKL8
	 vKppJxuXCLkO+9A0ErctoOzJXhe0V2no4wkoXBE77QsfXNcNePwOOF0MiF0el/BE7TQvbzBj37UE
	 GeApH6cQ+yahhJMzH1cl6h/Gx1eq4VO0IcDipBRi2BMuS0Q01RqYqOjnMCHK2JRJdyoQaAvHg+Ps
	 qdp41JRm1FjASMDsGXsWDTfkn3jQHwfEwjSa9Kt93OBmI/kGZPiOW8UmiSaftEtVT5JpsnTlV5tt
	 MLVWNfX4pcdCmmklH9nXxdNXsLqcFqKbRpFkB1cWFy/Ln4mE0LDXq7JQPuzLJGHJAwW32sXF4jdU
	 PXqKYVJbPUgMo4CYoZ8hTqnroB5fABJz3Ch7Pr6LocVX2wrO79+YP0prCypWrDFMiPCtKD3FDzNb
	 OwrXhoaF/2PAEdZvvLP63l6a9y29NyFAbyMKlfR5JsqGm+pXFu0b8rWPUux5Br6xMYeSpvzy0zQj
	 O65N9rE85tWchXhXNN9G3HpTcAk8Lp4iop/sAg+xyv3ozwgW58TxgUVPnuEMGwFDCOaq8kStTXAA
	 V4KuLEInRUP5h/1KwUXAC6BWTjlzUMr7ScmIcR5xKCVXEpzi7AAASiX2hM/7Vjir9CquYUr8R3K4
	 4Rx5k3VQom2i6xs/ascbAJv3Fi2HnmcGzZLW2ysAEYv4Ta40wJfmWe59ZTuibQ+Au5GJyh87SSuT
	 +f6xxDbTxS/xKJVhepGQoTV8Hrp/E/yl+l53nzsA==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-OQ-MSGID: <28452022-c9d2-4d76-9470-d1bd5abd0518@foxmail.com>
Date: Tue, 11 Nov 2025 01:34:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH v3] nethogs: add recipe
To: Khem Raj <raj.khem@gmail.com>,
 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <tencent_299EFFAA32A8918332261FD2A599A3FC0A09@qq.com>
 <CAMKF1srzy2bm6VTL7n-jat4pdeP-2wiKhb5YzitQ02+57iTFtQ@mail.gmail.com>
 <AS8PR02MB102010B3EA18EBF85BC0C1382EFC0A@AS8PR02MB10201.eurprd02.prod.outlook.com>
 <8c92344c-a5c8-427c-96ea-4743bc7fae4d@gmail.com>
From: Wen Yang <wenyang.linux@foxmail.com>
In-Reply-To: <8c92344c-a5c8-427c-96ea-4743bc7fae4d@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 19:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226188


Thanks for your feedback.
We have tried multiple times to test this v3 patch, and nethogs have 
been successfully, as follows:

bitbake nethogs -c cleanall
bitbake nethogs -v



NOTE: nethogs-0.8.8+git-r0 do_patch: Installed into sysroot: 
['quilt-native', 'patch-native']
NOTE: nethogs-0.8.8+git-r0 do_patch: Skipping as already exists in 
sysroot: ['gettext-minimal-native', 'libtool-native', 
'texinfo-dummy-native', 'attr-native']

NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch 
'0001-meson-cleanup-version-detection.patch' 
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-version-detection.patch)
NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch 
'0002-meson-fix-build-with-libnethogs-disabled.patch' 
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-build-with-libnethogs-disabled.patch)
NOTE: nethogs-0.8.8+git-r0 do_collect_spdx_deps: Direct dependencies are 
['/mnt_vde/work/yocto/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 
'virtual:native:/mnt_vde/work/yocto/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot']
NOTE: nethogs-0.8.8+git-r0 do_collect_spdx_deps: Installed into sysroot: []
NOTE: nethogs-0.8.8+git-r0 do_collect_spdx_deps: Skipping as already 
exists in sysroot: ['gettext-minimal-native', 'libtool-native', 
'quilt-native', 'texinfo-dummy-native', 'patch-native', 'attr-native']


NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch 
'0003-meson-run-meson-format.patch' 
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-meson-format.patch)
NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch 
'0004-meson-fix-library-name.patch' 
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-library-name.patch)
NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch 
'0005-Add-security-flags-to-LDFLAGS-for-Linux.patch' 
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-flags-to-LDFLAGS-for-Linux.patch)
NOTE: nethogs-0.8.8+git-r0 do_patch: Applying patch 
'0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch' 
(../meta-openembedded/meta-oe/recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch)



NOTE: nethogs-0.8.8+git-r0 do_populate_lic: nethogs: md5 checksum 
matched for file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263


...
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-dbg
NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p 
/mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+git/packages-split/nethogs-dbg/usr/bin/.debug/nethogs
NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p 
/mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+git/packages-split/nethogs-dbg/usr/lib/.debug/libnethogs.so.0.8.8

NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: Not creating empty 
archive for nethogs-locale-0.8.8+git0+632a78846e-r0
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping 
done: glibc -> libc6
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping 
done: libgcc -> libgcc1
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping 
done: libpcap -> libpcap1
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping 
done: libstdc++ -> libstdc++6
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping 
done: ncurses-libncurses -> libncurses5
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: package name mapping 
done: ncurses-libtinfo -> libtinfo5
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-dev
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: 
nethogs-staticdev
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: Not creating empty 
archive for nethogs-doc-0.8.8+git0+632a78846e-r0
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libc6-dev rprovides 
glibc-dev, not replacing the latter
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libgcc-s-dev rprovides 
libgcc-dev, not replacing the latter
NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p 
/mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+git/packages-split/nethogs/usr/bin/nethogs
NOTE: nethogs-0.8.8+git-r0 do_package_qa: riscv64-oe-linux-objdump -p 
/mnt_vde/work/yocto/build/tmp/work/riscv64imafdc-oe-linux/nethogs/0.8.8+git/packages-split/nethogs/usr/lib/libnethogs.so.0.8.8
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: Not creating empty 
archive for nethogs-staticdev-0.8.8+git0+632a78846e-r0
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libc6-dbg rprovides 
glibc-dbg, not replacing the latter
NOTE: nethogs-0.8.8+git-r0 do_package_write_deb: libgcc-s-dbg rprovides 
libgcc-dbg, not replacing the latter
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-locale
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-src
NOTE: nethogs-0.8.8+git-r0 do_package_qa: Checking Package: nethogs-doc

---
Best wishes,
Wen


On 11/10/25 00:09, Khem Raj wrote:
> v3 ends up with
> 
> ERROR: nethogs-0.8.8+git-r0 do_patch: Applying patch 
> '0003-meson-run-meson-format.patch' on target directory 
> '/mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/nethogs/0.8.8+git/sources/nethogs-0.8.8+git'
> CmdError('quilt --quiltrc 
> /mnt/b/yoe/master/build/tmp/work/cortexa72-yoe-linux/nethogs/0.8.8+git/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0003-meson-run-meson-format.patch
> patching file meson.build
> patching file src/meson.build
> Hunk #1 FAILED at 3.
> 1 out of 1 hunk FAILED -- rejects in file src/meson.build
> Patch 0003-meson-run-meson-format.patch does not apply (enforce with -f)
> 
> stderr: ')
> 
> On 11/8/25 10:23 AM, Peter Kjellerstedt wrote:
>> For what it’s worth, libnethogs.so is a symbolic link when I build 
>> (for aarch64), both with v2 and v3 of the patch.
>>
>> //Peter
>>
>> *From:*openembedded-devel@lists.openembedded.org <openembedded- 
>> devel@lists.openembedded.org> *On Behalf Of *Khem Raj via 
>> lists.openembedded.org
>> *Sent:* den 8 november 2025 18:07
>> *To:* wenyang.linux@foxmail.com
>> *Cc:* openembedded-core@lists.openembedded.org; openembedded- 
>> devel@lists.openembedded.org; Peter Kjellerstedt 
>> <peter.kjellerstedt@axis.com>
>> *Subject:* Re: [oe] [meta-oe][PATCH v3] nethogs: add recipe
>>
>> Seeing this error
>>
>> https://errors.yoctoproject.org/Errors/Details/887661/ <https:// 
>> errors.yoctoproject.org/Errors/Details/887661/>
>>
>> On Fri, Nov 7, 2025 at 10:40 PM <wenyang.linux@foxmail.com 
>> <mailto:wenyang.linux@foxmail.com>> wrote:
>>
>>     From: Wen Yang <wenyang.linux@foxmail.com
>>     <mailto:wenyang.linux@foxmail.com>>
>>
>>     NetHogs is a small 'net top' tool. Instead of breaking the traffic
>>     down per protocol or per subnet, like most tools do, it groups
>>     bandwidth by process.
>>
>>     Signed-off-by: Wen Yang <wenyang.linux@foxmail.com
>>     <mailto:wenyang.linux@foxmail.com>>
>>     ---
>>       ...0001-meson-cleanup-version-detection.patch |  49 +++++
>>       ...n-fix-build-with-libnethogs-disabled.patch |  38 ++++
>>       .../files/0003-meson-run-meson-format.patch   | 183 
>> ++++++++++++++++++
>>       .../files/0004-meson-fix-library-name.patch   |  25 +++
>>       ...-security-flags-to-LDFLAGS-for-Linux.patch |  25 +++
>>       ...S-for-devices.cpp-and-libnethogs.cpp.patch |  30 +++
>>       .../nethogs/nethogs_git.bb <http://nethogs_git.bb>          |  
>> 21 ++
>>       7 files changed, 371 insertions(+)
>>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>>     files/0001-meson-cleanup-version-detection.patch
>>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>>     files/0002-meson-fix-build-with-libnethogs-disabled.patch
>>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>>     files/0003-meson-run-meson-format.patch
>>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>>     files/0004-meson-fix-library-name.patch
>>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>>     files/0005-Add-security-flags-to-LDFLAGS-for-Linux.patch
>>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>>     files/0006-Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch
>>       create mode 100644 meta-oe/recipes-connectivity/nethogs/
>>     nethogs_git.bb <http://nethogs_git.bb>
>>
>>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0001-meson-
>>     cleanup-version-detection.patch b/meta-oe/recipes-connectivity/
>>     nethogs/files/0001-meson-cleanup-version-detection.patch
>>     new file mode 100644
>>     index 0000000000..797c79225d
>>     --- /dev/null
>>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0001-meson-cleanup-
>>     version-detection.patch
>>     @@ -0,0 +1,49 @@
>>     +From 049fff5623720fcd0b4fdc92501b586addbb6b48 Mon Sep 17 00:00:00 
>> 2001
>>     +From: Sam James <sam@gentoo.org <mailto:sam@gentoo.org>>
>>     +Date: Sat, 25 Jan 2025 16:03:12 +0000
>>     +Subject: [PATCH 1/6] meson: cleanup version detection
>>     +
>>     +Tell Meson what version the project is, so that we set the right
>>     versioning
>>     +on libnethogs.
>>     +
>>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>>     commit/049fff5623720fcd0b4fdc92501b586addbb6b48 <https://github.com/
>>     raboof/nethogs/commit/049fff5623720fcd0b4fdc92501b586addbb6b48>]
>>     +---
>>     + meson.build | 8 ++++----
>>     + 1 file changed, 4 insertions(+), 4 deletions(-)
>>     +
>>     +diff --git a/meson.build b/meson.build
>>     +index 81d7b59..16e61b4 100644
>>     +--- a/meson.build
>>     ++++ b/meson.build
>>     +@@ -5,11 +5,11 @@
>>     + project('nethogs',
>>     +         ['c', 'cpp'],
>>     +         default_options : ['warning_level=3',
>>     +-                           'cpp_std=c++14']
>>     ++                           'cpp_std=c++14'],
>>     ++        version : run_command('./
>>     determineVersion.sh').stdout().strip(),
>>     +         )
>>     +
>>     + cc = meson.get_compiler('cpp')
>>     +-version = run_command('./determineVersion.sh', check:
>>     true).stdout().strip()
>>     +
>>     + #######################################
>>     + ## Dependencies and flags definition ##
>>     +@@ -19,7 +19,7 @@ projectinc = [include_directories('.', 'src')]
>>     +
>>     + # flags
>>     + c_args = [
>>     +-  '-DVERSION="' + version + '"'
>>     ++  '-DVERSION="' + meson.project_version() + '"'
>>     + ]
>>     +
>>     + # dependencies
>>     +@@ -42,5 +42,5 @@ pkgconfig = import('pkgconfig')
>>     + pkgconfig_install_dir = join_paths(get_option('libdir'), 
>> 'pkgconfig')
>>     + pkgconfig.generate(libnethogs,
>>     +                    requires: ['libpcap'],
>>     +-                   version: version
>>     ++                   version: meson.project_version()
>>     +                    )
>>     +--
>>     +2.25.1
>>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0002-meson-
>>     fix-build-with-libnethogs-disabled.patch b/meta-oe/recipes-
>>     connectivity/nethogs/files/0002-meson-fix-build-with-libnethogs-
>>     disabled.patch
>>     new file mode 100644
>>     index 0000000000..c9a7cf69d6
>>     --- /dev/null
>>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0002-meson-fix-
>>     build-with-libnethogs-disabled.patch
>>     @@ -0,0 +1,38 @@
>>     +From 5afce747f142f6df6a264ab368c99f47050d9984 Mon Sep 17 00:00:00 
>> 2001
>>     +From: Sam James <sam@gentoo.org <mailto:sam@gentoo.org>>
>>     +Date: Sat, 25 Jan 2025 16:05:20 +0000
>>     +Subject: [PATCH 2/6] meson: fix build with libnethogs disabled
>>     +
>>     +Fix `meson.build:43:19: ERROR: Unknown variable "libnethogs".`.
>>     +
>>     +While src/ has this correct, the top-level meson.build wasn't right.
>>     +
>>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>>     commit/5afce747f142f6df6a264ab368c99f47050d9984 <https://github.com/
>>     raboof/nethogs/commit/5afce747f142f6df6a264ab368c99f47050d9984>]
>>     +---
>>     + meson.build | 14 ++++++++------
>>     + 1 file changed, 8 insertions(+), 6 deletions(-)
>>     +
>>     +diff --git a/meson.build b/meson.build
>>     +index 16e61b4..8537718 100644
>>     +--- a/meson.build
>>     ++++ b/meson.build
>>     +@@ -38,9 +38,11 @@ subdir('src')
>>     + #############################
>>     + ## Pkgconfig definition    ##
>>     + #############################
>>     +-pkgconfig = import('pkgconfig')
>>     +-pkgconfig_install_dir = join_paths(get_option('libdir'), 
>> 'pkgconfig')
>>     +-pkgconfig.generate(libnethogs,
>>     +-                   requires: ['libpcap'],
>>     +-                   version: meson.project_version()
>>     +-                   )
>>     ++if get_option('enable-libnethogs').enabled()
>>     ++  pkgconfig = import('pkgconfig')
>>     ++  pkgconfig_install_dir = join_paths(get_option('libdir'),
>>     'pkgconfig')
>>     ++  pkgconfig.generate(libnethogs,
>>     ++                     requires: ['libpcap'],
>>     ++                     version: meson.project_version()
>>     ++                     )
>>     ++endif
>>     +--
>>     +2.25.1
>>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0003-meson-
>>     run-meson-format.patch b/meta-oe/recipes-connectivity/nethogs/
>>     files/0003-meson-run-meson-format.patch
>>     new file mode 100644
>>     index 0000000000..9c92a9d835
>>     --- /dev/null
>>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0003-meson-run-
>>     meson-format.patch
>>     @@ -0,0 +1,183 @@
>>     +From fcbde46b0082b4c571392ea9b6427f5e11941393 Mon Sep 17 00:00:00 
>> 2001
>>     +From: Sam James <sam@gentoo.org <mailto:sam@gentoo.org>>
>>     +Date: Sat, 25 Jan 2025 16:06:12 +0000
>>     +Subject: [PATCH 3/6] meson: run `meson format`
>>     +
>>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>>     commit/fcbde46b0082b4c571392ea9b6427f5e11941393 <https://github.com/
>>     raboof/nethogs/commit/fcbde46b0082b4c571392ea9b6427f5e11941393>]
>>     +---
>>     + meson.build     | 34 +++++++++----------
>>     + src/meson.build | 87 
>> ++++++++++++++++++++++---------------------------
>>     + 2 files changed, 54 insertions(+), 67 deletions(-)
>>     +
>>     +diff --git a/meson.build b/meson.build
>>     +index 8537718..eb9f16e 100644
>>     +--- a/meson.build
>>     ++++ b/meson.build
>>     +@@ -2,12 +2,12 @@
>>     + # See COPYING for more information about licensing
>>     + #
>>     +
>>     +-project('nethogs',
>>     +-        ['c', 'cpp'],
>>     +-        default_options : ['warning_level=3',
>>     +-                           'cpp_std=c++14'],
>>     +-        version : run_command('./
>>     determineVersion.sh').stdout().strip(),
>>     +-        )
>>     ++project(
>>     ++    'nethogs',
>>     ++    ['c', 'cpp'],
>>     ++    default_options: ['warning_level=3', 'cpp_std=c++14'],
>>     ++    version: run_command('./determineVersion.sh').stdout().strip(),
>>     ++)
>>     +
>>     + cc = meson.get_compiler('cpp')
>>     +
>>     +@@ -18,17 +18,12 @@ cc = meson.get_compiler('cpp')
>>     + projectinc = [include_directories('.', 'src')]
>>     +
>>     + # flags
>>     +-c_args = [
>>     +-  '-DVERSION="' + meson.project_version() + '"'
>>     +-]
>>     ++c_args = ['-DVERSION="' + meson.project_version() + '"']
>>     +
>>     + # dependencies
>>     + thread_dep = dependency('threads', required: true)
>>     + libpcap_dep = dependency('libpcap', required: true)
>>     +-project_deps = [
>>     +-  thread_dep,
>>     +-  libpcap_dep
>>     +-]
>>     ++project_deps = [thread_dep, libpcap_dep]
>>     +
>>     + #############################
>>     + ## Code Compilation        ##
>>     +@@ -39,10 +34,11 @@ subdir('src')
>>     + ## Pkgconfig definition    ##
>>     + #############################
>>     + if get_option('enable-libnethogs').enabled()
>>     +-  pkgconfig = import('pkgconfig')
>>     +-  pkgconfig_install_dir = join_paths(get_option('libdir'),
>>     'pkgconfig')
>>     +-  pkgconfig.generate(libnethogs,
>>     +-                     requires: ['libpcap'],
>>     +-                     version: meson.project_version()
>>     +-                     )
>>     ++    pkgconfig = import('pkgconfig')
>>     ++    pkgconfig_install_dir = join_paths(get_option('libdir'),
>>     'pkgconfig')
>>     ++    pkgconfig.generate(
>>     ++        libnethogs,
>>     ++        requires: ['libpcap'],
>>     ++        version: meson.project_version(),
>>     ++    )
>>     + endif
>>     +diff --git a/src/meson.build b/src/meson.build
>>     +index 03f1b58..1329df4 100644
>>     +--- a/src/meson.build
>>     ++++ b/src/meson.build
>>     +@@ -3,65 +3,56 @@
>>     + #
>>     +
>>     + sources = [
>>     +-  files([
>>     +-    'connection.cpp',
>>     +-    'conninode.cpp',
>>     +-    'decpcap.c',
>>     +-    'devices.cpp',
>>     +-    'inode2prog.cpp',
>>     +-    'packet.cpp',
>>     +-    'process.cpp',
>>     +-  ])
>>     ++    files(
>>     ++        'connection.cpp',
>>     ++        'conninode.cpp',
>>     ++        'decpcap.c',
>>     ++        'devices.cpp',
>>     ++        'inode2prog.cpp',
>>     ++        'packet.cpp',
>>     ++        'process.cpp',
>>     ++    ),
>>     + ]
>>     +
>>     + # --- Executable Compilation ---
>>     +
>>     + if get_option('enable-nethogs-app').enabled()
>>     +-  app_sources = [
>>     +-    files([
>>     +-      'main.cpp',
>>     +-      'cui.cpp',
>>     +-    ])
>>     +-  ]
>>     +-
>>     +-  cursespp_dep = dependency('ncurses++', required: true)
>>     +-  curses_dep = dependency('ncurses', required: true)
>>     +-
>>     +-  executable('nethogs',
>>     +-    [app_sources + sources],
>>     +-    include_directories: [projectinc],
>>     +-    cpp_args: c_args,
>>     +-    c_args: c_args,
>>     +-    install: true,
>>     +-    dependencies : [project_deps, cursespp_dep, curses_dep]
>>     +-  )
>>     ++    app_sources = [files('cui.cpp', 'main.cpp')]
>>     ++
>>     ++    cursespp_dep = dependency('ncurses++', required: true)
>>     ++    curses_dep = dependency('ncurses', required: true)
>>     ++
>>     ++    executable(
>>     ++        'nethogs',
>>     ++        [app_sources + sources],
>>     ++        include_directories: [projectinc],
>>     ++        cpp_args: c_args,
>>     ++        c_args: c_args,
>>     ++        install: true,
>>     ++        dependencies: [project_deps, cursespp_dep, curses_dep],
>>     ++    )
>>     + endif
>>     +
>>     + # --- Library Compilation ---
>>     +
>>     + if get_option('enable-libnethogs').enabled()
>>     +-  lib_sources = [
>>     +-    files([
>>     +-      'libnethogs.cpp',
>>     +-    ])
>>     +-  ]
>>     ++    lib_sources = [files('libnethogs.cpp')]
>>     ++
>>     ++    libnethogs = shared_library(
>>     ++        'libnethogs' ,
>>     ++        sources + lib_sources,
>>     ++        cpp_args: c_args,
>>     ++        c_args: c_args,
>>     ++        install: true,
>>     ++        soversion: meson.project_version(),
>>     ++        include_directories: [projectinc],
>>     ++        dependencies: [project_deps],
>>     ++    )
>>     +
>>     +-  libnethogs = shared_library('libnethogs' ,
>>     +-    sources + lib_sources,
>>     +-    cpp_args: c_args,
>>     +-    c_args: c_args,
>>     +-    install: true,
>>     +-    soversion: meson.project_version(),
>>     +-    include_directories: [projectinc],
>>     +-    dependencies: [project_deps]
>>     +-  )
>>     +-
>>     +-  libnethogs_dep = declare_dependency(link_with: libnethogs)
>>     ++    libnethogs_dep = declare_dependency(link_with: libnethogs)
>>     +
>>     +-  # --- Header Installation ---
>>     ++    # --- Header Installation ---
>>     +
>>     +-  lib_headers = [
>>     +-    files('libnethogs.h'),
>>     +-  ]
>>     +-  install_headers(lib_headers, subdir : 'libnethogs')
>>     ++    lib_headers = [files('libnethogs.h')]
>>     ++    install_headers(lib_headers, subdir: 'libnethogs')
>>     + endif
>>     +--
>>     +2.25.1
>>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0004-meson-
>>     fix-library-name.patch b/meta-oe/recipes-connectivity/nethogs/
>>     files/0004-meson-fix-library-name.patch
>>     new file mode 100644
>>     index 0000000000..cc69a66748
>>     --- /dev/null
>>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0004-meson-fix-
>>     library-name.patch
>>     @@ -0,0 +1,25 @@
>>     +From ba25a64dcd35f4a58c4d397160e90560e9851c79 Mon Sep 17 00:00:00 
>> 2001
>>     +From: CAB233 <yidaduizuoye@outlook.com
>>     <mailto:yidaduizuoye@outlook.com>>
>>     +Date: Mon, 24 Feb 2025 20:06:52 +0800
>>     +Subject: [PATCH 4/6] meson: fix library name
>>     +
>>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>>     commit/ba25a64dcd35f4a58c4d397160e90560e9851c79 <https://github.com/
>>     raboof/nethogs/commit/ba25a64dcd35f4a58c4d397160e90560e9851c79>]
>>     +---
>>     + src/meson.build | 2 +-
>>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>>     +
>>     +diff --git a/src/meson.build b/src/meson.build
>>     +index 1329df4..7f6dcba 100644
>>     +--- a/src/meson.build
>>     ++++ b/src/meson.build
>>     +@@ -39,7 +39,7 @@ if get_option('enable-libnethogs').enabled()
>>     +     lib_sources = [files('libnethogs.cpp')]
>>     +
>>     +     libnethogs = shared_library(
>>     +-        'libnethogs' ,
>>     ++        'nethogs' ,
>>     +         sources + lib_sources,
>>     +         cpp_args: c_args,
>>     +         c_args: c_args,
>>     +--
>>     +2.25.1
>>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0005-Add-
>>     security-flags-to-LDFLAGS-for-Linux.patch b/meta-oe/recipes-
>>     connectivity/nethogs/files/0005-Add-security-flags-to-LDFLAGS-for-
>>     Linux.patch
>>     new file mode 100644
>>     index 0000000000..553b382a66
>>     --- /dev/null
>>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0005-Add-security-
>>     flags-to-LDFLAGS-for-Linux.patch
>>     @@ -0,0 +1,25 @@
>>     +From 42e7950db8e412160e3f1f74b6cbc7298714c587 Mon Sep 17 00:00:00 
>> 2001
>>     +From: Matheus Polkorny <mpolkorny@ipt.br <mailto:mpolkorny@ipt.br>>
>>     +Date: Tue, 25 Mar 2025 00:47:04 -0300
>>     +Subject: [PATCH 5/6] Add security flags to LDFLAGS for Linux
>>     +
>>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>>     commit/42e7950db8e412160e3f1f74b6cbc7298714c587 <https://github.com/
>>     raboof/nethogs/commit/42e7950db8e412160e3f1f74b6cbc7298714c587>]
>>     +---
>>     + src/MakeLib.mk | 2 +-
>>     + 1 file changed, 1 insertion(+), 1 deletion(-)
>>     +
>>     +diff --git a/src/MakeLib.mk b/src/MakeLib.mk
>>     +index 96ba694..1be0361 100644
>>     +--- a/src/MakeLib.mk
>>     ++++ b/src/MakeLib.mk
>>     +@@ -10,7 +10,7 @@ all: $(LIBNAME) libnethogs.a
>>     +
>>     + UNAME_S := $(shell uname -s)
>>     + ifeq ($(UNAME_S),Linux)
>>     +-  LDFLAGS:= -shared -Wl,-soname,$(SO_NAME)
>>     ++  LDFLAGS:= -shared -Wl,-soname,$(SO_NAME) -Wl,-z,now -Wl,-z,relro
>>     + else ifeq ($(UNAME_S),FreeBSD)
>>     +   LDFLAGS:= -shared -Wl,-soname,$(SO_NAME)
>>     + else
>>     +--
>>     +2.25.1
>>     diff --git a/meta-oe/recipes-connectivity/nethogs/files/0006-
>>     Include-CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch b/meta-oe/
>>     recipes-connectivity/nethogs/files/0006-Include-CPPFLAGS-for-
>>     devices.cpp-and-libnethogs.cpp.patch
>>     new file mode 100644
>>     index 0000000000..485d476c50
>>     --- /dev/null
>>     +++ b/meta-oe/recipes-connectivity/nethogs/files/0006-Include-
>>     CPPFLAGS-for-devices.cpp-and-libnethogs.cpp.patch
>>     @@ -0,0 +1,30 @@
>>     +From 1407f83485c31cd6f29614402bb2a3e912a3dd34 Mon Sep 17 00:00:00 
>> 2001
>>     +From: Matheus Polkorny <mpolkorny@ipt.br <mailto:mpolkorny@ipt.br>>
>>     +Date: Tue, 25 Mar 2025 00:48:20 -0300
>>     +Subject: [PATCH 6/6] Include $(CPPFLAGS) for devices.cpp and
>>     libnethogs.cpp
>>     +
>>     +Upstream-Status: Backport [https://github.com/raboof/nethogs/
>>     commit/1407f83485c31cd6f29614402bb2a3e912a3dd34 <https://github.com/
>>     raboof/nethogs/commit/1407f83485c31cd6f29614402bb2a3e912a3dd34>]
>>     +---
>>     + src/MakeLib.mk | 4 ++--
>>     + 1 file changed, 2 insertions(+), 2 deletions(-)
>>     +
>>     +diff --git a/src/MakeLib.mk b/src/MakeLib.mk
>>     +index 1be0361..513096e 100644
>>     +--- a/src/MakeLib.mk
>>     ++++ b/src/MakeLib.mk
>>     +@@ -97,11 +97,11 @@ $(ODIR)/conninode.o: conninode.cpp nethogs.h
>>     conninode.h
>>     +
>>     + $(ODIR)/devices.o: devices.cpp devices.h
>>     +       @mkdir -p $(ODIR)
>>     +-      $(CXX) $(CXXFLAGS) -o $@ -c devices.cpp
>>     ++      $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c devices.cpp
>>     +
>>     + $(ODIR)/libnethogs.o: libnethogs.cpp libnethogs.h
>>     +       @mkdir -p $(ODIR)
>>     +-      $(CXX) $(CXXFLAGS) -o $@ -c libnethogs.cpp -
>>     DVERSION=\"$(LIBVERSION)\"
>>     ++      $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ -c libnethogs.cpp -
>>     DVERSION=\"$(LIBVERSION)\"
>>     +
>>     + .PHONY: clean
>>     + clean:
>>     +--
>>     +2.25.1
>>     diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb
>>     <http://nethogs_git.bb> b/meta-oe/recipes-connectivity/nethogs/
>>     nethogs_git.bb <http://nethogs_git.bb>
>>     new file mode 100644
>>     index 0000000000..816cd9c542
>>     --- /dev/null
>>     +++ b/meta-oe/recipes-connectivity/nethogs/nethogs_git.bb <http://
>>     nethogs_git.bb>
>>     @@ -0,0 +1,21 @@
>>     +SUMMARY = "NetHogs is a small 'net top' tool that can group
>>     bandwidth by process"
>>     +HOMEPAGE = "https://github.com/raboof/nethogs <https://github.com/
>>     raboof/nethogs>"
>>     +SECTION = "console/network"
>>     +LICENSE = "GPL-2.0-only"
>>     +LIC_FILES_CHKSUM = "file://
>>     COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 <file://
>>     COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263>"
>>     +
>>     +SRC_URI = "git://github.com/raboof/
>>     nethogs.git;branch=main;protocol=https <http://github.com/raboof/
>>     nethogs.git;branch=main;protocol=https> \
>>     + file://0001-meson-cleanup-version-detection.patch <file://0001-
>>     meson-cleanup-version-detection.patch> \
>>     + file://0002-meson-fix-build-with-libnethogs-disabled.patch
>>     <file://0002-meson-fix-build-with-libnethogs-disabled.patch> \
>>     + file://0003-meson-run-meson-format.patch <file://0003-meson-run-
>>     meson-format.patch> \
>>     + file://0004-meson-fix-library-name.patch <file://0004-meson-fix-
>>     library-name.patch> \
>>     + file://0005-Add-security-flags-to-LDFLAGS-for-Linux.patch
>>     <file://0005-Add-security-flags-to-LDFLAGS-for-Linux.patch> \
>>     + file://0006-Include-CPPFLAGS-for-devices.cpp-and-
>>     libnethogs.cpp.patch <file://0006-Include-CPPFLAGS-for-devices.cpp-
>>     and-libnethogs.cpp.patch> \
>>     +           "
>>     +
>>     +DEPENDS = "ncurses libpcap"
>>     +
>>     +inherit meson pkgconfig
>>     +
>>     +SRCREV = "632a78846eb3cc3259dc45c59a47fa9c293a2831"
>>     +PV = "0.8.8+git"
>>     --     2.25.1
>>


