Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8604D783FC;
	Tue, 12 Sep 2017 10:58:49 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id o22so2677825vke.5;
	Tue, 12 Sep 2017 03:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FP704aILaXeR/8FeJTintW5Hl2PehbDKZVCE2J8R4a4=;
	b=r8pLPEG1ST0V3Y2bENP6Et/oJ1ybAJQo/2VqmvhbMUYEENaryl029ke6K2uCyJKHRN
	U2C8EYFhON7W8aWUlagAqcLBsAerKnkZfBakXw4VPaB43az6TvMmo7tOeBl6U2VRX6hY
	veD6i9Ibtp2sK5wPn9Tb5nR0D4357U2yjEeyR2Atp6vvKf6UWdDcEsS+ACntfORQ+IP3
	wwmCnjhMULo5tyGZzOY3TT0wud2RXs2SaYHHw3JNjQAfXm73ftGWBkSPs+iruabkF30m
	pbrRVfAs8LYFBZTUVtMS2s6dwykK+UbHMGoIwYQnh+g8R0NdX9saoX/ug0gn9wklQVxb
	0vzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FP704aILaXeR/8FeJTintW5Hl2PehbDKZVCE2J8R4a4=;
	b=t5lxVjF9KKozdNTXh4m7GeIfzy6/hyo6osKVt3SHSJcoQNn1UEDmSMGAnECFnKhMGq
	35qLo56hG4XMOmfxhieU/HFuhjTY5hlGGQmf9mRloTOLXEpWrl0HcWJ7lIrgq/GlEb/p
	WTJo5RAnVqUfR2VGSIRrwkUmNFVUMiWZPcRSnghU28pjK/Vs1Geq61TZFPhM2aginBTy
	2Y1P0AUDLaobC5Qxr3bTwUOIHP78qmjZA00on5taT0ByBGEFpynb4RvNGlU7dobsrYvh
	tP64GAy7F5Cm8Jt4V9Jb6oiBTPPGkJmmxz3EMWX+VP+gv0ZlZhRn5/dAgP3fPmjDBQ60
	ltvQ==
X-Gm-Message-State: AHPjjUj5tTrGpWKZxWJPZ4/DwKej9JukG2fKtlO1oBszLKVmtF6MHc3C
	BRN9j9cunMtyOzexoxQKg0USbPcMF8Mm
X-Google-Smtp-Source: AOwi7QB8iGhcp1MuXd7vuFx5Zn4iSd/Hp5nxVuTOihBBAB8fH6La9tOSRUJ8GJ4db0ulW+3QKalrILizrvcY2fTaukg=
X-Received: by 10.31.224.134 with SMTP id x128mr9312637vkg.1.1505213930770;
	Tue, 12 Sep 2017 03:58:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Tue, 12 Sep 2017 03:58:50 -0700 (PDT)
In-Reply-To: <150514745160.18411.12374724192281962975@git.openembedded.org>
References: <150514745160.18411.12374724192281962975@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Sep 2017 12:58:50 +0200
Message-ID: <CA+chaQcO6meQ4kwAdz4sN46=NEY9QrmAUN5pCFbC=hji74tisw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Barker <paul@paulbarker.me.uk>, Andrei Gherzan <andrei@gherzan.ro>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] branch master updated (cc319b6 -> 2ebbeb6)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Sep 2017 10:58:51 -0000
Content-Type: multipart/alternative; boundary="94eb2c07afe2a798420558fbed70"

--94eb2c07afe2a798420558fbed70
Content-Type: text/plain; charset="UTF-8"

Hi,

I don't see any obvious change in this update which should cause this, but
rebuilding my image for raspberrypi3-64 after this update (the previous
image was built without errors) shows:

NOTE: Running task 417 of 6399
(/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:
do_validate_branches)
NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
do_validate_branches: Started
....
NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
do_validate_branches: Succeeded
NOTE: Running task 434 of 6399
(/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:
do_kernel_metadata)
NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
do_kernel_metadata: Started
ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
do_kernel_metadata: Could not locate BSP definition for
raspberrypi3-64/standard and no defconfig was provided
NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
do_kernel_metadata: Succeeded
...
NOTE: Running task 454 of 6399
(/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:
do_patch)
NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
do_patch: Started
NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
do_patch: Succeeded
NOTE: Running task 491 of 6399
(/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:
do_kernel_configme)
NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
do_kernel_configme: Started
ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
do_kernel_configme: [ERROR]: no configuration queue found in outdir
(.kernel-meta)

 scc [--help] [--configs] [--force] [-i] [-w] [--cmds <comma separated
list>] [-o outdir:<meta,cfg,patch>] [-D<var>=<value>] [-I<path>] [-v]
infiles

      --help:      This message
      --force:     force overwrite output file if it already exists
      --cmds:      list of supported commands. If not passed, all found
commands are loaded,
                   valid commands are: patch, kconf, branch, define
      --configs:   Output the list of compiled configuration fragments (if
available), -o <outdir> is
                   used to locate the configuration options
      -D:          define <var> to <value> which will be available to sub
scripts
      -I:          include path <path> will be searched for files
      -i:          leave intermediate files on failure
      -w:          only warn on missing files
      -v:          verbose output
      -o:          output directory and artifacts. artifacts follow the
colon and ar a comma
                   separated list of:
                       meta:  full meta-series (patches, config, branches,
etc)
                       cfg:   configure fragment queue
                       patch: patch queue

      infiles      files to preprocess, and output into outfile or stdout
ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
do_kernel_configme: Could not find configuration queue
(.kernel-meta/config.queue)
ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
do_kernel_configme: Function failed: do_kernel_configme (log file is
located at
/OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/log.do_kernel_configme.19498)
ERROR: Logfile of failure stored in:
/OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/log.do_kernel_configme.19498
Log data follows:
| DEBUG: Executing shell function do_kernel_configme
| ERROR: [ERROR]: no configuration queue found in outdir (.kernel-meta)
|
|  scc [--help] [--configs] [--force] [-i] [-w] [--cmds <comma separated
list>] [-o outdir:<meta,cfg,patch>] [-D<var>=<value>] [-I<path>] [-v]
infiles
|
|       --help:      This message
|       --force:     force overwrite output file if it already exists
|       --cmds:      list of supported commands. If not passed, all found
commands are loaded,
|                    valid commands are: patch, kconf, branch, define
|       --configs:   Output the list of compiled configuration fragments
(if available), -o <outdir> is
|                    used to locate the configuration options
|       -D:          define <var> to <value> which will be available to sub
scripts
|       -I:          include path <path> will be searched for files
|       -i:          leave intermediate files on failure
|       -w:          only warn on missing files
|       -v:          verbose output
|       -o:          output directory and artifacts. artifacts follow the
colon and ar a comma
|                    separated list of:
|                        meta:  full meta-series (patches, config,
branches, etc)
|                        cfg:   configure fragment queue
|                        patch: patch queue
|
|       infiles      files to preprocess, and output into outfile or stdout
| ERROR: Could not find configuration queue (.kernel-meta/config.queue)
| WARNING:
/OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/run.do_kernel_configme.19498:1
exit 1 from 'exit 1'
| ERROR: Function failed: do_kernel_configme (log file is located at
/OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/log.do_kernel_configme.19498)
NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
do_kernel_configme: Failed
ERROR: Task
(/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_configme)
failed with exit code '1'
NOTE: Running task 530 of 6399
(/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:
do_kernel_version_sanity_check)
NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
do_kernel_version_sanity_check: Started
NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
do_kernel_version_sanity_check: Succeeded

I don't know if this is some new regression (the included changes in last
upgrade doesn't look suspicious much) or something which was already there
like race condition in kernel build or bad interaction between linux-yocto
and rm_work.

I'll try to rebuild it after cleansstate after current build is finished.

+Paul +Andrei if they have seen it with meta-raspberrypi and maybe it's
specific to raspberrypi3-64 or last linux-raspberrypi upgrade.

Looks a bit similar to discussion in:
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141097.html
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141304.html
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141323.html
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/141329.html

Regards,

On Mon, Sep 11, 2017 at 6:30 PM, <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a change to branch master
> in repository openembedded-core.
>
>     from cc319b6  mesa-gl: Fix build after recent mesa PACKAGECONFIG
> changes
>      add 9099cec  oeqa/qemurunner: Improve logging
>      add 67612dc  qemurunner.py: refactor searching for QEMU PID
>      add ff98085  pulseaudio: Backport a patch to replace use of VLAIS
>      add aa5b9ed  oeqa/selftest: Add missing IDs to various test cases
>      add cdb4316  oeqa/selftest/case: Add recipeinc method
>      new 0a43727  alsa-utils: Do not hardcode path to /lib/udev
>      new 43b1475  psplash: upgrade to latest git revision
>      new e4cc1a2  initramfs-framework: split setup-live and install-efi
> into separate recipes
>      new 0fae16b  oeqa: Replace "append +=" with normal "append =" in
> layerappend.py
>      new 87110e9  rootfs: improve postinst intercept logging
>      new 35ab2c7  insane.bbclass: write QA issues to log file only when
> they are in ERROR_QA or WARN_QA
>      new 40e8a15  gtk-doc.bbclass: add all directories where .so files are
> found to library search path
>      new d0a123e  devtool: status: Sort entries before printing
>      new 9ff023f  package_deb, ipk: improve subprocess output on package
> manager command
>      new 11350a6  package_[deb|ipk]: improve multiprocess logic when
> creating deb/ipk packages
>      new f2e586e  glibc: add ld.so locks in _libc_fork
>      new 10a1b29  kernel: Stop using update-alternatives
>      new 32c9b3d  yocto-compat-layer.py: Fix trace when layers can't be
> processed
>      new 2348dda  psplash: Initialize psplash only if a framebuffer exists
>      new ff9f629  sysstat: Add ability to enable lm-sensors
>      new b591ba6  wic: implement ext fs support for 'wic ls'
>      new 1a2bc70  wic: implement ext fs support for 'wic cp'
>      new be530b7  wic: implement ext fs support for 'wic rm'
>      new fcff05d  wic: update help content
>      new 6ae3ff9  wic: selftest: add test_wic_ls_ext test case
>      new 7970907  wic: selftest: add test_wic_cp_ext test case
>      new 693b555  wic: selftest: add test_wic_rm_ext test case
>      new 7d2d73b  shared-mime-info: enable nativesdk builds
>      new 51e4f9c  glib-2.0: recommend shared-mime-info
>      new 026403c  systemtap: Bump SRCREV for 4.12 Linux kernel support
>      new 31f1e5f  python3-pip: extend to nativesdk
>      new b9f0c54  python3-setuptools: extend to nativesdk
>      new 1f8dae4  xdg-utils: Add HOMEPAGE info into recipe file.
>      new 024caf6  bootchart2: update python interpreter
>      new acc9994  cve-check-tool: change BB_NO_NETWORK error to a warning
>      new fa36678  bmap-tools: upgrade to v3.4
>      new 0d6130b  bmap-tools: switch to Python 3
>      new 7fca44e  wic: run bmaptool with native Python3
>      new 1585ed0  texinfo-dummy-native: port to Python 3
>      new 3014099  glibc: do the multilib_header magic also for
> bits/pthreadtypes-arch.h
>      new 56cf3a0  util-linux: Add HOMEPAGE info into recipe file.
>      new 818d4a9  iputils: backport patch to fix arping hang problem
>      new 1d0c86a  diffutils: Add HOMEPAGE info into recipe file.
>      new 34cde8e  foomatic: Add HOMEPAGE info into recipe file.
>      new 6e1f800  subversion: fix CVE-2017-9800
>      new 1ca7d8d  libfm: remove file which conflicts with libfm-extra
>      new e67b40c  scripts/buildhistory-diff: use of argparse instead of
> optparse
>      new b6e72d0  linux-yocto: Make LINUX_VERSION_EXTENSION weaker
>      new 1a5026d  goarch.bbclass: Stop passing True as second argument of
> d.getVar
>      new 56ce355  go.bbclass: Fix binary installation path detection
>      new 26abbf1  go: Remove Go 1.6 and 1.7 releases
>      new 07b60c1  goarch.bbclass: Replace logic for setting GOARM
>      new e242e7c  goarch.bbclass: Add support for ARMv5
>      new d6b8e7e  go.bbclass: Use a global Go build flags
>      new 7a40ea8  go.bbclass: Enable parallel build
>      new 0369a99  go.bbclass: exported function cleanup
>      new 4971362  go.bbclass: Use an auxiliary variable to add the build
> dependencies
>      new c62a083  go.bbclass: separate ${S} and ${B}
>      new efcf651  go.bbclass: add do_unpack function to handle common cases
>      new 9819353  go.bbclass: add GO_INSTALL_FILTEROUT variable
>      new 79e0401  go-dep: Add 0.3.0 release
>      new 116d2ea  go-helloworld: Use the Golang examples repository
>      new 802829f  devtool: upgrade: check that user has configured git
> properly
>      new 2ebbeb6  staging: gracefully abort if two recipes conflict in the
> sysroot
>
> The 59 revisions listed above as "new" are entirely new to this
> repository and will be described in separate emails.  The revisions
> listed as "add" were already present in the repository and have only
> been added to this reference.
>
>
> Summary of changes:
>  meta/classes/go.bbclass                            | 110 ++++---
>  meta/classes/goarch.bbclass                        |  27 +-
>  meta/classes/gtk-doc.bbclass                       |   1 +
>  meta/classes/insane.bbclass                        |   3 +-
>  meta/classes/kernel.bbclass                        |  16 +-
>  meta/classes/package_deb.bbclass                   |  40 ++-
>  meta/classes/package_ipk.bbclass                   |  40 ++-
>  meta/classes/staging.bbclass                       |  18 +-
>  meta/lib/oe/rootfs.py                              |   7 +-
>  meta/lib/oeqa/selftest/case.py                     |  20 +-
>  meta/lib/oeqa/selftest/cases/archiver.py           |   3 +-
>  meta/lib/oeqa/selftest/cases/distrodata.py         |   2 +
>  meta/lib/oeqa/selftest/cases/imagefeatures.py      |   3 +
>  meta/lib/oeqa/selftest/cases/layerappend.py        |   2 +-
>  meta/lib/oeqa/selftest/cases/runcmd.py             |  17 +
>  meta/lib/oeqa/selftest/cases/wic.py                |  70 ++++
>  meta/lib/oeqa/utils/qemurunner.py                  | 351
> ++++++++++-----------
>  meta/recipes-core/glib-2.0/glib.inc                |   2 +
>  meta/recipes-core/glibc/glibc-package.inc          |   2 +-
>  ...bc-reset-dl-load-write-lock-after-forking.patch |  37 +++
>  .../0028-Bug-4578-add-ld.so-lock-while-fork.patch  |  57 ++++
>  meta/recipes-core/glibc/glibc_2.26.bb              |   2 +
>  .../initrdscripts/initramfs-framework_1.0.bb       |  20 +-
>  .../initramfs-module-install-efi_1.0.bb            |  18 ++
>  .../initramfs-module-setup-live_1.0.bb             |  18 ++
>  meta/recipes-core/psplash/files/psplash-init       |   6 +
>  meta/recipes-core/psplash/psplash_git.bb           |   2 +-
>  meta/recipes-core/util-linux/util-linux.inc        |   1 +
>  .../bootchart2/bootchart2_0.14.8.bb                |   2 +-
>  .../cve-check-tool/cve-check-tool_5.6.4.bb         |   2 +-
>  meta/recipes-devtools/go/go-1.6.inc                |  19 --
>  .../go/go-1.6/armhf-elf-header.patch               |  23 --
>  .../go/go-1.6/fix-cc-handling.patch                |  50 ---
>  .../go/go-1.6/fix-target-cc-for-build.patch        |  17 -
>  meta/recipes-devtools/go/go-1.6/gotooldir.patch    |  30 --
>  .../go/go-1.6/split-host-and-target-build.patch    |  63 ----
>  meta/recipes-devtools/go/go-1.6/syslog.patch       |  62 ----
>  meta/recipes-devtools/go/go-1.7.inc                |  19 --
>  .../go/go-1.7/armhf-elf-header.patch               |  23 --
>  .../go/go-1.7/fix-cc-handling.patch                |  50 ---
>  .../go/go-1.7/fix-target-cc-for-build.patch        |  17 -
>  meta/recipes-devtools/go/go-1.7/gotooldir.patch    |  30 --
>  .../go/go-1.7/split-host-and-target-build.patch    |  62 ----
>  meta/recipes-devtools/go/go-1.7/syslog.patch       |  62 ----
>  meta/recipes-devtools/go/go-cross_1.7.bb           |   5 -
>  meta/recipes-devtools/go/go-dep_0.3.0.bb           |  18 ++
>  meta/recipes-devtools/go/go_1.6.bb                 |   4 -
>  meta/recipes-devtools/go/go_1.7.bb                 |   2 -
>  meta/recipes-devtools/python/python3-pip_9.0.1.bb  |   2 +-
>  .../python/python3-setuptools_36.2.7.bb            |   7 +-
>  .../subversion/subversion/CVE-2017-9800.patch      | 136 ++++++++
>  .../subversion/subversion_1.9.6.bb                 |   1 +
>  meta/recipes-extended/diffutils/diffutils.inc      |   1 +
>  .../foomatic/foomatic-filters_4.0.17.bb            |   1 +
>  .../go-examples/files/helloworld.go                |  10 -
>  meta/recipes-extended/go-examples/go-examples.inc  |  10 -
>  .../go-examples/go-helloworld_0.1.bb               |  24 +-
>  ...ing-fix-arping-hang-if-SIGALRM-is-blocked.patch |  44 +++
>  meta/recipes-extended/iputils/iputils_s20151218.bb |   1 +
>  meta/recipes-extended/sysstat/sysstat.inc          |   6 +-
>  .../texinfo-dummy-native/texinfo-dummy/template.py |   4 +-
>  meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb |   2 +-
>  meta/recipes-kernel/linux/linux-dtb.inc            |  36 +--
>  meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>  ...apbpf-don-t-support-installing-a-non-root.patch |  62 ++++
>  meta/recipes-kernel/systemtap/systemtap_git.inc    |   5 +-
>  meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb   |   4 +-
>  ...-don-t-use-variable-length-array-in-union.patch |  59 ++++
>  .../pulseaudio/pulseaudio_10.0.bb                  |   1 +
>  .../{bmap-tools_3.2.bb => bmap-tools_3.4.bb}       |   9 +-
>  meta/recipes-support/libfm/libfm_1.2.5.bb          |   1 +
>  .../shared-mime-info/shared-mime-info.inc          |   3 +-
>  scripts/buildhistory-diff                          | 125 ++++----
>  scripts/lib/devtool/standard.py                    |   2 +-
>  scripts/lib/devtool/upgrade.py                     |  27 +-
>  scripts/lib/wic/engine.py                          |  55 ++--
>  scripts/lib/wic/help.py                            |  64 ++--
>  scripts/lib/wic/plugins/imager/direct.py           |   6 +-
>  scripts/yocto-compat-layer.py                      |   2 +-
>  79 files changed, 1137 insertions(+), 1030 deletions(-)
>  create mode 100644 meta/recipes-core/glibc/glibc/
> 0027-glibc-reset-dl-load-write-lock-after-forking.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/
> 0028-Bug-4578-add-ld.so-lock-while-fork.patch
>  create mode 100644 meta/recipes-core/initrdscripts/initramfs-
> module-install-efi_1.0.bb
>  create mode 100644 meta/recipes-core/initrdscripts/initramfs-
> module-setup-live_1.0.bb
>  delete mode 100644 meta/recipes-devtools/go/go-1.6.inc
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 6/fix-target-cc-for-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 6/split-host-and-target-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7.inc
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 7/fix-target-cc-for-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.
> 7/split-host-and-target-build.patch
>  delete mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
>  delete mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
>  create mode 100644 meta/recipes-devtools/go/go-dep_0.3.0.bb
>  delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
>  delete mode 100644 meta/recipes-devtools/go/go_1.7.bb
>  create mode 100644 meta/recipes-devtools/subversion/subversion/CVE-
> 2017-9800.patch
>  delete mode 100644 meta/recipes-extended/go-examples/files/helloworld.go
>  delete mode 100644 meta/recipes-extended/go-examples/go-examples.inc
>  create mode 100644 meta/recipes-extended/iputils/
> files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-staprun-
> stapbpf-don-t-support-installing-a-non-root.patch
>  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/
> pulseaudio-discuss-iochannel-don-t-use-variable-length-
> array-in-union.patch
>  rename meta/recipes-support/bmap-tools/{bmap-tools_3.2.bb =>
> bmap-tools_3.4.bb} (79%)
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--94eb2c07afe2a798420558fbed70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I don&#39;t see any obvious change =
in this update which should cause this, but rebuilding my image for raspber=
rypi3-64 after this update (the previous image was built without errors) sh=
ows:<div><br></div><div><div>NOTE: Running task 417 of 6399 (/OE/build/owpb=
/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb=
:do_validate_branches)</div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+gi=
tAUTOINC+4153f509b4-r0: task do_validate_branches: Started</div><div>....</=
div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: =
task do_validate_branches: Succeeded<br></div><div>NOTE: Running task 434 o=
f 6399 (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/li=
nux-raspberrypi_4.9.bb:do_kernel_metadata)</div><div>NOTE: recipe linux-ras=
pberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task do_kernel_metadata: Starte=
d</div><div>ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0 do_k=
ernel_metadata: Could not locate BSP definition for raspberrypi3-64/standar=
d and no defconfig was provided</div><div>NOTE: recipe linux-raspberrypi-1_=
4.9.41+gitAUTOINC+4153f509b4-r0: task do_kernel_metadata: Succeeded</div><d=
iv>...</div><div>NOTE: Running task 454 of 6399 (/OE/build/owpb/webos-ports=
/meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_patch)<b=
r></div></div><div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+=
4153f509b4-r0: task do_patch: Started</div><div>NOTE: recipe linux-raspberr=
ypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task do_patch: Succeeded</div><div>N=
OTE: Running task 491 of 6399 (/OE/build/owpb/webos-ports/meta-raspberrypi/=
recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_configme)</div><div=
>NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task do_=
kernel_configme: Started</div><div>ERROR: linux-raspberrypi-1_4.9.41+gitAUT=
OINC+4153f509b4-r0 do_kernel_configme: [ERROR]: no configuration queue foun=
d in outdir (.kernel-meta)</div><div><br></div><div>=C2=A0scc [--help] [--c=
onfigs] [--force] [-i] [-w] [--cmds &lt;comma separated list&gt;] [-o outdi=
r:&lt;meta,cfg,patch&gt;] [-D&lt;var&gt;=3D&lt;value&gt;] [-I&lt;path&gt;] =
[-v] infiles</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 --help:=C2=A0 =
=C2=A0 =C2=A0 This message</div><div>=C2=A0 =C2=A0 =C2=A0 --force:=C2=A0 =
=C2=A0 =C2=A0force overwrite output file if it already exists</div><div>=C2=
=A0 =C2=A0 =C2=A0 --cmds:=C2=A0 =C2=A0 =C2=A0 list of supported commands. I=
f not passed, all found commands are loaded,</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0valid commands are: patch,=
 kconf, branch, define</div><div>=C2=A0 =C2=A0 =C2=A0 --configs:=C2=A0 =C2=
=A0Output the list of compiled configuration fragments (if available), -o &=
lt;outdir&gt; is</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0used to locate the configuration options</div><div>=C2=
=A0 =C2=A0 =C2=A0 -D:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 define &lt;var&gt; =
to &lt;value&gt; which will be available to sub scripts</div><div>=C2=A0 =
=C2=A0 =C2=A0 -I:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include path &lt;path&g=
t; will be searched for files</div><div>=C2=A0 =C2=A0 =C2=A0 -i:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 leave intermediate files on failure</div><div>=C2=
=A0 =C2=A0 =C2=A0 -w:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 only warn on missin=
g files</div><div>=C2=A0 =C2=A0 =C2=A0 -v:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 verbose output</div><div>=C2=A0 =C2=A0 =C2=A0 -o:=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 output directory and artifacts. artifacts follow the colon an=
d ar a comma</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0separated list of:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meta:=C2=A0 full met=
a-series (patches, config, branches, etc)</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cfg:=C2=A0 =
=C2=A0configure fragment queue</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0patch: patch queue</div><d=
iv><br></div><div>=C2=A0 =C2=A0 =C2=A0 infiles=C2=A0 =C2=A0 =C2=A0 files to=
 preprocess, and output into outfile or stdout</div><div>ERROR: linux-raspb=
errypi-1_4.9.41+gitAUTOINC+4153f509b4-r0 do_kernel_configme: Could not find=
 configuration queue (.kernel-meta/config.queue)</div><div>ERROR: linux-ras=
pberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0 do_kernel_configme: Function fai=
led: do_kernel_configme (log file is located at /OE/build/owpb/webos-ports/=
tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAU=
TOINC+4153f509b4-r0/temp/log.do_kernel_configme.19498)</div><div>ERROR: Log=
file of failure stored in: /OE/build/owpb/webos-ports/tmp-glibc/work/raspbe=
rrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/t=
emp/log.do_kernel_configme.19498</div><div>Log data follows:</div><div>| DE=
BUG: Executing shell function do_kernel_configme</div><div>| ERROR: [ERROR]=
: no configuration queue found in outdir (.kernel-meta)</div></div><div><di=
v>|</div><div>|=C2=A0 scc [--help] [--configs] [--force] [-i] [-w] [--cmds =
&lt;comma separated list&gt;] [-o outdir:&lt;meta,cfg,patch&gt;] [-D&lt;var=
&gt;=3D&lt;value&gt;] [-I&lt;path&gt;] [-v] infiles</div><div>|</div><div>|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0--help:=C2=A0 =C2=A0 =C2=A0 This message</div><d=
iv>|=C2=A0 =C2=A0 =C2=A0 =C2=A0--force:=C2=A0 =C2=A0 =C2=A0force overwrite =
output file if it already exists</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0--cm=
ds:=C2=A0 =C2=A0 =C2=A0 list of supported commands. If not passed, all foun=
d commands are loaded,</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 valid commands are: patch, kconf, branch, defi=
ne</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0--configs:=C2=A0 =C2=A0Output the =
list of compiled configuration fragments (if available), -o &lt;outdir&gt; =
is</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 used to locate the configuration options</div><div>|=C2=A0 =C2=
=A0 =C2=A0 =C2=A0-D:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 define &lt;var&gt; t=
o &lt;value&gt; which will be available to sub scripts</div><div>|=C2=A0 =
=C2=A0 =C2=A0 =C2=A0-I:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 include path &lt;=
path&gt; will be searched for files</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0-=
i:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 leave intermediate files on failure</d=
iv><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0-w:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 o=
nly warn on missing files</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0-v:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 verbose output</div><div>|=C2=A0 =C2=A0 =C2=A0 =
=C2=A0-o:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output directory and artifacts.=
 artifacts follow the colon and ar a comma</div><div>|=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 separated list of:</div><d=
iv>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 meta:=C2=A0 full meta-series (patches, config, branches, etc)=
</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 cfg:=C2=A0 =C2=A0configure fragment queue</div><div>|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 patch: patch queue</div><div>|</div><div>|=C2=A0 =C2=A0 =C2=A0 =
=C2=A0infiles=C2=A0 =C2=A0 =C2=A0 files to preprocess, and output into outf=
ile or stdout</div><div>| ERROR: Could not find configuration queue (.kerne=
l-meta/config.queue)</div><div>| WARNING: /OE/build/owpb/webos-ports/tmp-gl=
ibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+=
4153f509b4-r0/temp/run.do_kernel_configme.19498:1 exit 1 from &#39;exit 1&#=
39;</div><div>| ERROR: Function failed: do_kernel_configme (log file is loc=
ated at /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-lin=
ux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/log.do_kernel_c=
onfigme.19498)</div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC=
+4153f509b4-r0: task do_kernel_configme: Failed</div><div>ERROR: Task (/OE/=
build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/linux/linux-raspberr=
ypi_4.9.bb:do_kernel_configme) failed with exit code &#39;1&#39;</div><div>=
NOTE: Running task 530 of 6399 (/OE/build/owpb/webos-ports/meta-raspberrypi=
/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_version_sanity_che=
ck)</div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4=
-r0: task do_kernel_version_sanity_check: Started</div><div>NOTE: recipe li=
nux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task do_kernel_version_s=
anity_check: Succeeded</div></div><div><br></div><div>I don&#39;t know if t=
his is some new regression (the included changes in last upgrade doesn&#39;=
t look suspicious much) or something which was already there like race cond=
ition in kernel build or bad interaction between linux-yocto and rm_work.</=
div><div><br></div><div>I&#39;ll try to rebuild it after cleansstate after =
current build is finished.</div><div><br></div><div>+Paul +Andrei if they h=
ave seen it with meta-raspberrypi and maybe it&#39;s specific to=C2=A0raspb=
errypi3-64 or last linux-raspberrypi upgrade.</div><div><br></div><div>Look=
s a bit similar to discussion in:</div><div><a href=3D"http://lists.openemb=
edded.org/pipermail/openembedded-core/2017-August/141097.html">http://lists=
.openembedded.org/pipermail/openembedded-core/2017-August/141097.html</a><b=
r></div><div><a href=3D"http://lists.openembedded.org/pipermail/openembedde=
d-core/2017-August/141304.html">http://lists.openembedded.org/pipermail/ope=
nembedded-core/2017-August/141304.html</a><br></div><div><a href=3D"http://=
lists.openembedded.org/pipermail/openembedded-core/2017-August/141323.html"=
>http://lists.openembedded.org/pipermail/openembedded-core/2017-August/1413=
23.html</a><br></div><div><a href=3D"http://lists.openembedded.org/pipermai=
l/openembedded-core/2017-August/141329.html">http://lists.openembedded.org/=
pipermail/openembedded-core/2017-August/141329.html</a><br></div><div><br><=
/div><div>Regards,</div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On Mon, Sep 11, 2017 at 6:30 PM,  <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:git@git.openembedded.org" target=3D"_blank">git@git.openembedded.org<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
This is an automated email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a change to branch master<br>
in repository openembedded-core.<br>
<br>
=C2=A0 =C2=A0 from cc319b6=C2=A0 mesa-gl: Fix build after recent mesa PACKA=
GECONFIG changes<br>
=C2=A0 =C2=A0 =C2=A0add 9099cec=C2=A0 oeqa/qemurunner: Improve logging<br>
=C2=A0 =C2=A0 =C2=A0add 67612dc=C2=A0 qemurunner.py: refactor searching for=
 QEMU PID<br>
=C2=A0 =C2=A0 =C2=A0add ff98085=C2=A0 pulseaudio: Backport a patch to repla=
ce use of VLAIS<br>
=C2=A0 =C2=A0 =C2=A0add aa5b9ed=C2=A0 oeqa/selftest: Add missing IDs to var=
ious test cases<br>
=C2=A0 =C2=A0 =C2=A0add cdb4316=C2=A0 oeqa/selftest/case: Add recipeinc met=
hod<br>
=C2=A0 =C2=A0 =C2=A0new 0a43727=C2=A0 alsa-utils: Do not hardcode path to /=
lib/udev<br>
=C2=A0 =C2=A0 =C2=A0new 43b1475=C2=A0 psplash: upgrade to latest git revisi=
on<br>
=C2=A0 =C2=A0 =C2=A0new e4cc1a2=C2=A0 initramfs-framework: split setup-live=
 and install-efi into separate recipes<br>
=C2=A0 =C2=A0 =C2=A0new 0fae16b=C2=A0 oeqa: Replace &quot;append +=3D&quot;=
 with normal &quot;append =3D&quot; in layerappend.py<br>
=C2=A0 =C2=A0 =C2=A0new 87110e9=C2=A0 rootfs: improve postinst intercept lo=
gging<br>
=C2=A0 =C2=A0 =C2=A0new 35ab2c7=C2=A0 insane.bbclass: write QA issues to lo=
g file only when they are in ERROR_QA or WARN_QA<br>
=C2=A0 =C2=A0 =C2=A0new 40e8a15=C2=A0 gtk-doc.bbclass: add all directories =
where .so files are found to library search path<br>
=C2=A0 =C2=A0 =C2=A0new d0a123e=C2=A0 devtool: status: Sort entries before =
printing<br>
=C2=A0 =C2=A0 =C2=A0new 9ff023f=C2=A0 package_deb, ipk: improve subprocess =
output on package manager command<br>
=C2=A0 =C2=A0 =C2=A0new 11350a6=C2=A0 package_[deb|ipk]: improve multiproce=
ss logic when creating deb/ipk packages<br>
=C2=A0 =C2=A0 =C2=A0new f2e586e=C2=A0 glibc: add ld.so locks in _libc_fork<=
br>
=C2=A0 =C2=A0 =C2=A0new 10a1b29=C2=A0 kernel: Stop using update-alternative=
s<br>
=C2=A0 =C2=A0 =C2=A0new 32c9b3d=C2=A0 yocto-compat-layer.py: Fix trace when=
 layers can&#39;t be processed<br>
=C2=A0 =C2=A0 =C2=A0new 2348dda=C2=A0 psplash: Initialize psplash only if a=
 framebuffer exists<br>
=C2=A0 =C2=A0 =C2=A0new ff9f629=C2=A0 sysstat: Add ability to enable lm-sen=
sors<br>
=C2=A0 =C2=A0 =C2=A0new b591ba6=C2=A0 wic: implement ext fs support for &#3=
9;wic ls&#39;<br>
=C2=A0 =C2=A0 =C2=A0new 1a2bc70=C2=A0 wic: implement ext fs support for &#3=
9;wic cp&#39;<br>
=C2=A0 =C2=A0 =C2=A0new be530b7=C2=A0 wic: implement ext fs support for &#3=
9;wic rm&#39;<br>
=C2=A0 =C2=A0 =C2=A0new fcff05d=C2=A0 wic: update help content<br>
=C2=A0 =C2=A0 =C2=A0new 6ae3ff9=C2=A0 wic: selftest: add test_wic_ls_ext te=
st case<br>
=C2=A0 =C2=A0 =C2=A0new 7970907=C2=A0 wic: selftest: add test_wic_cp_ext te=
st case<br>
=C2=A0 =C2=A0 =C2=A0new 693b555=C2=A0 wic: selftest: add test_wic_rm_ext te=
st case<br>
=C2=A0 =C2=A0 =C2=A0new 7d2d73b=C2=A0 shared-mime-info: enable nativesdk bu=
ilds<br>
=C2=A0 =C2=A0 =C2=A0new 51e4f9c=C2=A0 glib-2.0: recommend shared-mime-info<=
br>
=C2=A0 =C2=A0 =C2=A0new 026403c=C2=A0 systemtap: Bump SRCREV for 4.12 Linux=
 kernel support<br>
=C2=A0 =C2=A0 =C2=A0new 31f1e5f=C2=A0 python3-pip: extend to nativesdk<br>
=C2=A0 =C2=A0 =C2=A0new b9f0c54=C2=A0 python3-setuptools: extend to natives=
dk<br>
=C2=A0 =C2=A0 =C2=A0new 1f8dae4=C2=A0 xdg-utils: Add HOMEPAGE info into rec=
ipe file.<br>
=C2=A0 =C2=A0 =C2=A0new 024caf6=C2=A0 bootchart2: update python interpreter=
<br>
=C2=A0 =C2=A0 =C2=A0new acc9994=C2=A0 cve-check-tool: change BB_NO_NETWORK =
error to a warning<br>
=C2=A0 =C2=A0 =C2=A0new fa36678=C2=A0 bmap-tools: upgrade to v3.4<br>
=C2=A0 =C2=A0 =C2=A0new 0d6130b=C2=A0 bmap-tools: switch to Python 3<br>
=C2=A0 =C2=A0 =C2=A0new 7fca44e=C2=A0 wic: run bmaptool with native Python3=
<br>
=C2=A0 =C2=A0 =C2=A0new 1585ed0=C2=A0 texinfo-dummy-native: port to Python =
3<br>
=C2=A0 =C2=A0 =C2=A0new 3014099=C2=A0 glibc: do the multilib_header magic a=
lso for bits/pthreadtypes-arch.h<br>
=C2=A0 =C2=A0 =C2=A0new 56cf3a0=C2=A0 util-linux: Add HOMEPAGE info into re=
cipe file.<br>
=C2=A0 =C2=A0 =C2=A0new 818d4a9=C2=A0 iputils: backport patch to fix arping=
 hang problem<br>
=C2=A0 =C2=A0 =C2=A0new 1d0c86a=C2=A0 diffutils: Add HOMEPAGE info into rec=
ipe file.<br>
=C2=A0 =C2=A0 =C2=A0new 34cde8e=C2=A0 foomatic: Add HOMEPAGE info into reci=
pe file.<br>
=C2=A0 =C2=A0 =C2=A0new 6e1f800=C2=A0 subversion: fix CVE-2017-9800<br>
=C2=A0 =C2=A0 =C2=A0new 1ca7d8d=C2=A0 libfm: remove file which conflicts wi=
th libfm-extra<br>
=C2=A0 =C2=A0 =C2=A0new e67b40c=C2=A0 scripts/buildhistory-diff: use of arg=
parse instead of optparse<br>
=C2=A0 =C2=A0 =C2=A0new b6e72d0=C2=A0 linux-yocto: Make LINUX_VERSION_EXTEN=
SION weaker<br>
=C2=A0 =C2=A0 =C2=A0new 1a5026d=C2=A0 goarch.bbclass: Stop passing True as =
second argument of d.getVar<br>
=C2=A0 =C2=A0 =C2=A0new 56ce355=C2=A0 go.bbclass: Fix binary installation p=
ath detection<br>
=C2=A0 =C2=A0 =C2=A0new 26abbf1=C2=A0 go: Remove Go 1.6 and 1.7 releases<br=
>
=C2=A0 =C2=A0 =C2=A0new 07b60c1=C2=A0 goarch.bbclass: Replace logic for set=
ting GOARM<br>
=C2=A0 =C2=A0 =C2=A0new e242e7c=C2=A0 goarch.bbclass: Add support for ARMv5=
<br>
=C2=A0 =C2=A0 =C2=A0new d6b8e7e=C2=A0 go.bbclass: Use a global Go build fla=
gs<br>
=C2=A0 =C2=A0 =C2=A0new 7a40ea8=C2=A0 go.bbclass: Enable parallel build<br>
=C2=A0 =C2=A0 =C2=A0new 0369a99=C2=A0 go.bbclass: exported function cleanup=
<br>
=C2=A0 =C2=A0 =C2=A0new 4971362=C2=A0 go.bbclass: Use an auxiliary variable=
 to add the build dependencies<br>
=C2=A0 =C2=A0 =C2=A0new c62a083=C2=A0 go.bbclass: separate ${S} and ${B}<br=
>
=C2=A0 =C2=A0 =C2=A0new efcf651=C2=A0 go.bbclass: add do_unpack function to=
 handle common cases<br>
=C2=A0 =C2=A0 =C2=A0new 9819353=C2=A0 go.bbclass: add GO_INSTALL_FILTEROUT =
variable<br>
=C2=A0 =C2=A0 =C2=A0new 79e0401=C2=A0 go-dep: Add 0.3.0 release<br>
=C2=A0 =C2=A0 =C2=A0new 116d2ea=C2=A0 go-helloworld: Use the Golang example=
s repository<br>
=C2=A0 =C2=A0 =C2=A0new 802829f=C2=A0 devtool: upgrade: check that user has=
 configured git properly<br>
=C2=A0 =C2=A0 =C2=A0new 2ebbeb6=C2=A0 staging: gracefully abort if two reci=
pes conflict in the sysroot<br>
<br>
The 59 revisions listed above as &quot;new&quot; are entirely new to this<b=
r>
repository and will be described in separate emails.=C2=A0 The revisions<br=
>
listed as &quot;add&quot; were already present in the repository and have o=
nly<br>
been added to this reference.<br>
<br>
<br>
Summary of changes:<br>
=C2=A0meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 110 ++++---<br>
=C2=A0meta/classes/goarch.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 27 +-<br>
=C2=A0meta/classes/gtk-doc.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta/classes/insane.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 16 +-<br>
=C2=A0meta/classes/package_deb.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 40 ++-<br>
=C2=A0meta/classes/package_ipk.<wbr>bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 40 ++-<br>
=C2=A0meta/classes/staging.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 +-<br>
=C2=A0meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-=
<br>
=C2=A0meta/lib/oeqa/selftest/case.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/<wbr>archiver.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/<wbr>distrodata.py=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0meta/lib/oeqa/selftest/cases/<wbr>imagefeatures.py=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0meta/lib/oeqa/selftest/cases/<wbr>layerappend.py=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/<wbr>runcmd.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 +<br>
=C2=A0meta/lib/oeqa/selftest/cases/<wbr>wic.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 70 ++++<br>
=C2=A0meta/lib/oeqa/utils/<wbr>qemurunner.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 351 ++++++++++-----------<br>
=C2=A0meta/recipes-core/glib-2.0/<wbr>glib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-core/glibc/glibc-<wbr>package.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...bc-reset-dl-load-write-<wbr>lock-after-forking.patch |=C2=A0 37 ++=
+<br>
=C2=A0.../0028-Bug-4578-add-ld.so-<wbr>lock-while-fork.patch=C2=A0 |=C2=A0 =
57 ++++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_<wbr>2.26.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../initrdscripts/<a href=3D"http://initramfs-framework_1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">initramfs-<wbr>framework_1.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
=C2=A0.../<a href=3D"http://initramfs-module-install-efi_1.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">initramfs-module-install-<wbr>efi_1.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 ++<br>
=C2=A0.../<a href=3D"http://initramfs-module-setup-live_1.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">initramfs-module-setup-<wbr>live_1.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 ++<br>
=C2=A0meta/recipes-core/psplash/<wbr>files/psplash-init=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0meta/recipes-core/psplash/<a href=3D"http://psplash_git.bb" rel=3D"no=
referrer" target=3D"_blank">pspl<wbr>ash_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-core/util-linux/<wbr>util-linux.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../bootchart2/<a href=3D"http://bootchart2_0.14.8.bb" rel=3D"norefer=
rer" target=3D"_blank">bootchart2_0.<wbr>14.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../cve-check-tool/<a href=3D"http://cve-check-tool_5.6.4.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-check-<wbr>tool_5.6.4.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>6.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 --<br>
=C2=A0.../go/go-1.6/armhf-elf-<wbr>header.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 --<br>
=C2=A0.../go/go-1.6/fix-cc-handling.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 ---<br>
=C2=A0.../go/go-1.6/fix-target-cc-<wbr>for-build.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 17 -<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>6/gotooldir.patch=C2=A0 =C2=A0 |=
=C2=A0 30 --<br>
=C2=A0.../go/go-1.6/split-host-and-<wbr>target-build.patch=C2=A0 =C2=A0 |=
=C2=A0 63 ----<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>6/syslog.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 62 ----<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>7.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 --<br>
=C2=A0.../go/go-1.7/armhf-elf-<wbr>header.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 --<br>
=C2=A0.../go/go-1.7/fix-cc-handling.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 ---<br>
=C2=A0.../go/go-1.7/fix-target-cc-<wbr>for-build.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 17 -<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>7/gotooldir.patch=C2=A0 =C2=A0 |=
=C2=A0 30 --<br>
=C2=A0.../go/go-1.7/split-host-and-<wbr>target-build.patch=C2=A0 =C2=A0 |=
=C2=A0 62 ----<br>
=C2=A0meta/recipes-devtools/go/go-1.<wbr>7/syslog.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 62 ----<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-cross_1.7.bb" rel=3D"no=
referrer" target=3D"_blank">go-<wbr>cross_1.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 -<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-dep_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">go-<wbr>dep_0.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 18 ++<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go_1.6.bb" rel=3D"noreferr=
er" target=3D"_blank">go_1.<wbr>6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 -<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go_1.7.bb" rel=3D"noreferr=
er" target=3D"_blank">go_1.<wbr>7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pip_9.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank">p<wbr>ython3-pip_9.0.1.bb</a>=C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-setuptools_36.2.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-setuptools_<wbr>36.2.7.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0.../subversion/subversion/CVE-<wbr>2017-9800.patch=C2=A0 =C2=A0 =C2=
=A0 | 136 ++++++++<br>
=C2=A0.../subversion/<a href=3D"http://subversion_1.9.6.bb" rel=3D"noreferr=
er" target=3D"_blank">subversion_1.9.<wbr>6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-extended/<wbr>diffutils/diffutils.inc=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../foomatic/<a href=3D"http://foomatic-filters_4.0.17.bb" rel=3D"nor=
eferrer" target=3D"_blank">foomatic-filters_<wbr>4.0.17.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../go-examples/files/<wbr>helloworld.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 -<br>
=C2=A0meta/recipes-extended/go-<wbr>examples/go-examples.inc=C2=A0 |=C2=A0 =
10 -<br>
=C2=A0.../go-examples/<a href=3D"http://go-helloworld_0.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">go-helloworld_<wbr>0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 +-<br>
=C2=A0...ing-fix-arping-hang-if-<wbr>SIGALRM-is-blocked.patch |=C2=A0 44 ++=
+<br>
=C2=A0meta/recipes-extended/iputils/<a href=3D"http://iputils_s20151218.bb"=
 rel=3D"noreferrer" target=3D"_blank"><wbr>iputils_s20151218.bb</a> |=C2=A0=
 =C2=A01 +<br>
=C2=A0meta/recipes-extended/sysstat/<wbr>sysstat.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../texinfo-dummy-native/<wbr>texinfo-dummy/template.py |=C2=A0 =C2=
=A04 +-<br>
=C2=A0meta/recipes-extended/xdg-<wbr>utils/<a href=3D"http://xdg-utils_1.1.=
1.bb" rel=3D"noreferrer" target=3D"_blank">xdg-utils_1.1.1.bb</a> |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-dtb.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 36 +--<br>
=C2=A0meta/recipes-kernel/linux/<wbr>linux-yocto.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...apbpf-don-t-support-<wbr>installing-a-non-root.patch |=C2=A0 62 ++=
++<br>
=C2=A0meta/recipes-kernel/systemtap/<wbr>systemtap_git.inc=C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +-<br>
=C2=A0meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils_1.1.4.bb" r=
el=3D"noreferrer" target=3D"_blank">a<wbr>lsa-utils_1.1.4.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0...-don-t-use-variable-length-<wbr>array-in-union.patch |=C2=A0 59 ++=
++<br>
=C2=A0.../pulseaudio/<a href=3D"http://pulseaudio_10.0.bb" rel=3D"noreferre=
r" target=3D"_blank">pulseaudio_10.<wbr>0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../{<a href=3D"http://bmap-tools_3.2.bb" rel=3D"noreferrer" target=
=3D"_blank">bmap-tools_3.2.bb</a> =3D&gt; <a href=3D"http://bmap-tools_3.4.=
bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.4.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0meta/recipes-support/libfm/<a href=3D"http://libfm_1.2.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">lib<wbr>fm_1.2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../shared-mime-info/shared-<wbr>mime-info.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0scripts/buildhistory-diff=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 125 ++++----<br>
=C2=A0scripts/lib/devtool/standard.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/lib/devtool/upgrade.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 27 +-<br>
=C2=A0scripts/lib/wic/engine.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 55 ++--<br>
=C2=A0scripts/lib/wic/help.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 64 ++--<br>
=C2=A0scripts/lib/wic/plugins/<wbr>imager/direct.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0scripts/yocto-compat-layer.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A079 files changed, 1137 insertions(+), 1030 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/<wbr>0027-glibc-rese=
t-dl-load-<wbr>write-lock-after-forking.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/<wbr>0028-Bug-4578-a=
dd-ld.so-lock-<wbr>while-fork.patch<br>
=C2=A0create mode 100644 meta/recipes-core/<wbr>initrdscripts/<a href=3D"ht=
tp://initramfs-module-install-efi_1.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">initramfs-<wbr>module-install-efi_1.0.bb</a><br>
=C2=A0create mode 100644 meta/recipes-core/<wbr>initrdscripts/<a href=3D"ht=
tp://initramfs-module-setup-live_1.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">initramfs-<wbr>module-setup-live_1.0.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6/armhf-elf-hea=
der.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6/fix-cc-handli=
ng.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6/fix-target-cc=
-for-build.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6/gotooldir.pat=
ch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6/split-host-an=
d-target-build.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6/syslog.patch<=
br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>7.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>7/armhf-elf-hea=
der.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>7/fix-cc-handli=
ng.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>7/fix-target-cc=
-for-build.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>7/gotooldir.pat=
ch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>7/split-host-an=
d-target-build.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>7/syslog.patch<=
br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-cros=
s_1.7.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>cross_1.7.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-dep_=
0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">go-<wbr>dep_0.3.0.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go_1.6.=
bb" rel=3D"noreferrer" target=3D"_blank">go_1.<wbr>6.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go_1.7.=
bb" rel=3D"noreferrer" target=3D"_blank">go_1.<wbr>7.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/<wbr>subversion/subversion/C=
VE-<wbr>2017-9800.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/go-<wbr>examples/files/hello=
world.go<br>
=C2=A0delete mode 100644 meta/recipes-extended/go-<wbr>examples/go-examples=
.inc<br>
=C2=A0create mode 100644 meta/recipes-extended/iputils/<wbr>files/arping-fi=
x-arping-hang-<wbr>if-SIGALRM-is-blocked.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/systemtap/<wbr>systemtap/0001-=
staprun-<wbr>stapbpf-don-t-support-<wbr>installing-a-non-root.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/<wbr>pulseaudio/pulseaudio=
/<wbr>pulseaudio-discuss-iochannel-<wbr>don-t-use-variable-length-<wbr>arra=
y-in-union.patch<br>
=C2=A0rename meta/recipes-support/bmap-<wbr>tools/{<a href=3D"http://bmap-t=
ools_3.2.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.2.bb</a> =3D=
&gt; <a href=3D"http://bmap-tools_3.4.bb" rel=3D"noreferrer" target=3D"_bla=
nk">bmap-tools_3.4.bb</a>} (79%)<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org">Openembedded=
-commits@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div></div></div>

--94eb2c07afe2a798420558fbed70--
