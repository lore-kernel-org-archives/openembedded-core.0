Return-Path: <gizero@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id C447578521;
	Wed, 13 Sep 2017 06:23:05 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id x85so15086263vkx.5;
	Tue, 12 Sep 2017 23:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TGZmtmcvLb5wvR/pYtQViyZbwtUNJhzFNn/X3GP9Dpk=;
	b=Ubi7vLFhSF+N+MwsZBaaGTFM9DlAE4IMyGArWwNqOTTfEF24zsV3NrJgg5ih9sLnzd
	sxde7O/pXKJe9C0GXdqrEzeM9BBTS1Err82BS0k2k4XA2PH2wJnz8q5OBabx0CVW7zUn
	NuZJUNNR3CgEbtRrMZPDClwH+Zfi4QeH50yu5KwVPB+Zn13nUxdQJTRPSzyG8ReJdkyr
	ottX8COLF1W8Y8Tl1piLud9MES7AAZrZpGMv9jiFToaQ3Jn30aexmXyECQXMsvm3Giu/
	OI8TJ3dxxLf9lCmKZeSrizlFNdfz5vzww9G/m44q9OLW2wShpzZHj2FfjkX6LVRLYl8r
	X5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TGZmtmcvLb5wvR/pYtQViyZbwtUNJhzFNn/X3GP9Dpk=;
	b=Dq+iFJw6mC7aqQ5oQgPqbOwIDo0xkA+WIP5jaKWBc9UJOinRFVDt2ngGnj0mAtxgV2
	Jem0W13KLPNoAQx0i7yvNTt1y5hPfV+jBaJ14afjYUBk6vkFRO0X+QI89I9C99TyiDR3
	yB+BKMyxdRle67U3Mw5rK3t/lN0/zPFH8wlqTqJj+OWbf8Ze74a/nYehS0URW4MonHP/
	zpqYDPoZSKWpKso6O8uaswJthY3urFxFQckuazU2lqJvWhkMRJWmZS1BeEpM121TVHJg
	y1htvwV3dtoSJVjFPOzgyUKQ8r+vtXrj/glayQhM+6hWXhKefVUAidb52n+a+BH01VvZ
	du1Q==
X-Gm-Message-State: AHPjjUhPGtlruVR7q2kswg6AYoWSfJwc5P9FEdSySo72QQE6Mdzttu39
	p737FMeCnGFuVqvMMEvBR4j0rKQJoZ3jOrdZ5oo=
X-Google-Smtp-Source: AOwi7QCPdoHPUPU8XLpqh2HVy5LgSIMDJyMqmXoU+KxKPuF0GcfO3HccBu+JjJH+on9U1rIo0hkZQWS3hbqVsgdbhxc=
X-Received: by 10.31.65.209 with SMTP id o200mr12892527vka.185.1505283786274; 
	Tue, 12 Sep 2017 23:23:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.193 with HTTP; Tue, 12 Sep 2017 23:23:05 -0700 (PDT)
In-Reply-To: <CA+chaQcO6meQ4kwAdz4sN46=NEY9QrmAUN5pCFbC=hji74tisw@mail.gmail.com>
References: <150514745160.18411.12374724192281962975@git.openembedded.org>
	<CA+chaQcO6meQ4kwAdz4sN46=NEY9QrmAUN5pCFbC=hji74tisw@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Wed, 13 Sep 2017 08:23:05 +0200
Message-ID: <CAC+thW3b_Q8fzxzyAQbVYuD-ESF+9vdARRhw5OqRJeaQW_MYtQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Paul Barker <paul@paulbarker.me.uk>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 13 Sep 2017 06:23:06 -0000
Content-Type: multipart/alternative; boundary="001a114db7e65e031a05590c31cc"

--001a114db7e65e031a05590c31cc
Content-Type: text/plain; charset="UTF-8"

Hi!

On Tue, Sep 12, 2017 at 12:58 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Hi,
>
> I don't see any obvious change in this update which should cause this, but
> rebuilding my image for raspberrypi3-64 after this update (the previous
> image was built without errors) shows:
>
> NOTE: Running task 417 of 6399 (/OE/build/owpb/webos-ports/
> meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_
> validate_branches)
> NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
> do_validate_branches: Started
> ....
> NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
> do_validate_branches: Succeeded
> NOTE: Running task 434 of 6399 (/OE/build/owpb/webos-ports/
> meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_
> metadata)
> NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
> do_kernel_metadata: Started
> ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
> do_kernel_metadata: Could not locate BSP definition for
> raspberrypi3-64/standard and no defconfig was provided
> NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
> do_kernel_metadata: Succeeded
> ...
> NOTE: Running task 454 of 6399 (/OE/build/owpb/webos-ports/
> meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_patch)
> NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
> do_patch: Started
> NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
> do_patch: Succeeded
> NOTE: Running task 491 of 6399 (/OE/build/owpb/webos-ports/
> meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_
> configme)
> NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
> do_kernel_configme: Started
> ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
> do_kernel_configme: [ERROR]: no configuration queue found in outdir
> (.kernel-meta)
>
>  scc [--help] [--configs] [--force] [-i] [-w] [--cmds <comma separated
> list>] [-o outdir:<meta,cfg,patch>] [-D<var>=<value>] [-I<path>] [-v]
> infiles
>
>       --help:      This message
>       --force:     force overwrite output file if it already exists
>       --cmds:      list of supported commands. If not passed, all found
> commands are loaded,
>                    valid commands are: patch, kconf, branch, define
>       --configs:   Output the list of compiled configuration fragments (if
> available), -o <outdir> is
>                    used to locate the configuration options
>       -D:          define <var> to <value> which will be available to sub
> scripts
>       -I:          include path <path> will be searched for files
>       -i:          leave intermediate files on failure
>       -w:          only warn on missing files
>       -v:          verbose output
>       -o:          output directory and artifacts. artifacts follow the
> colon and ar a comma
>                    separated list of:
>                        meta:  full meta-series (patches, config, branches,
> etc)
>                        cfg:   configure fragment queue
>                        patch: patch queue
>
>       infiles      files to preprocess, and output into outfile or stdout
> ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
> do_kernel_configme: Could not find configuration queue
> (.kernel-meta/config.queue)
> ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
> do_kernel_configme: Function failed: do_kernel_configme (log file is
> located at /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_
> 64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/
> log.do_kernel_configme.19498)
> ERROR: Logfile of failure stored in: /OE/build/owpb/webos-ports/
> tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+
> gitAUTOINC+4153f509b4-r0/temp/log.do_kernel_configme.19498
> Log data follows:
> | DEBUG: Executing shell function do_kernel_configme
> | ERROR: [ERROR]: no configuration queue found in outdir (.kernel-meta)
> |
> |  scc [--help] [--configs] [--force] [-i] [-w] [--cmds <comma separated
> list>] [-o outdir:<meta,cfg,patch>] [-D<var>=<value>] [-I<path>] [-v]
> infiles
> |
> |       --help:      This message
> |       --force:     force overwrite output file if it already exists
> |       --cmds:      list of supported commands. If not passed, all found
> commands are loaded,
> |                    valid commands are: patch, kconf, branch, define
> |       --configs:   Output the list of compiled configuration fragments
> (if available), -o <outdir> is
> |                    used to locate the configuration options
> |       -D:          define <var> to <value> which will be available to
> sub scripts
> |       -I:          include path <path> will be searched for files
> |       -i:          leave intermediate files on failure
> |       -w:          only warn on missing files
> |       -v:          verbose output
> |       -o:          output directory and artifacts. artifacts follow the
> colon and ar a comma
> |                    separated list of:
> |                        meta:  full meta-series (patches, config,
> branches, etc)
> |                        cfg:   configure fragment queue
> |                        patch: patch queue
> |
> |       infiles      files to preprocess, and output into outfile or stdout
> | ERROR: Could not find configuration queue (.kernel-meta/config.queue)
> | WARNING: /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_
> 64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/run.do_kernel_configme.19498:1
> exit 1 from 'exit 1'
> | ERROR: Function failed: do_kernel_configme (log file is located at
> /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_
> 64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/temp/
> log.do_kernel_configme.19498)
> NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
> do_kernel_configme: Failed
> ERROR: Task (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-
> kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_configme) failed with
> exit code '1'
> NOTE: Running task 530 of 6399 (/OE/build/owpb/webos-ports/
> meta-raspberrypi/recipes-kernel/linux/linux-raspberrypi_4.9.bb:do_kernel_
> version_sanity_check)
> NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
> do_kernel_version_sanity_check: Started
> NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0: task
> do_kernel_version_sanity_check: Succeeded
>
> I don't know if this is some new regression (the included changes in last
> upgrade doesn't look suspicious much) or something which was already there
> like race condition in kernel build or bad interaction between linux-yocto
> and rm_work.
>
> I'll try to rebuild it after cleansstate after current build is finished.
>
> +Paul +Andrei if they have seen it with meta-raspberrypi and maybe it's
> specific to raspberrypi3-64 or last linux-raspberrypi upgrade.
>
> Looks a bit similar to discussion in:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-August/141097.html
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-August/141304.html
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-August/141323.html
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-August/141329.html
>
> Regards,
>
> On Mon, Sep 11, 2017 at 6:30 PM, <git@git.openembedded.org> wrote:
>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a change to branch master
>> in repository openembedded-core.
>>
>>     from cc319b6  mesa-gl: Fix build after recent mesa PACKAGECONFIG
>> changes
>>      add 9099cec  oeqa/qemurunner: Improve logging
>>      add 67612dc  qemurunner.py: refactor searching for QEMU PID
>>      add ff98085  pulseaudio: Backport a patch to replace use of VLAIS
>>      add aa5b9ed  oeqa/selftest: Add missing IDs to various test cases
>>      add cdb4316  oeqa/selftest/case: Add recipeinc method
>>      new 0a43727  alsa-utils: Do not hardcode path to /lib/udev
>>      new 43b1475  psplash: upgrade to latest git revision
>>      new e4cc1a2  initramfs-framework: split setup-live and install-efi
>> into separate recipes
>>      new 0fae16b  oeqa: Replace "append +=" with normal "append =" in
>> layerappend.py
>>      new 87110e9  rootfs: improve postinst intercept logging
>>      new 35ab2c7  insane.bbclass: write QA issues to log file only when
>> they are in ERROR_QA or WARN_QA
>>      new 40e8a15  gtk-doc.bbclass: add all directories where .so files
>> are found to library search path
>>      new d0a123e  devtool: status: Sort entries before printing
>>      new 9ff023f  package_deb, ipk: improve subprocess output on package
>> manager command
>>      new 11350a6  package_[deb|ipk]: improve multiprocess logic when
>> creating deb/ipk packages
>>      new f2e586e  glibc: add ld.so locks in _libc_fork
>>      new 10a1b29  kernel: Stop using update-alternatives
>>      new 32c9b3d  yocto-compat-layer.py: Fix trace when layers can't be
>> processed
>>      new 2348dda  psplash: Initialize psplash only if a framebuffer exists
>>      new ff9f629  sysstat: Add ability to enable lm-sensors
>>      new b591ba6  wic: implement ext fs support for 'wic ls'
>>      new 1a2bc70  wic: implement ext fs support for 'wic cp'
>>      new be530b7  wic: implement ext fs support for 'wic rm'
>>      new fcff05d  wic: update help content
>>      new 6ae3ff9  wic: selftest: add test_wic_ls_ext test case
>>      new 7970907  wic: selftest: add test_wic_cp_ext test case
>>      new 693b555  wic: selftest: add test_wic_rm_ext test case
>>      new 7d2d73b  shared-mime-info: enable nativesdk builds
>>      new 51e4f9c  glib-2.0: recommend shared-mime-info
>>      new 026403c  systemtap: Bump SRCREV for 4.12 Linux kernel support
>>      new 31f1e5f  python3-pip: extend to nativesdk
>>      new b9f0c54  python3-setuptools: extend to nativesdk
>>      new 1f8dae4  xdg-utils: Add HOMEPAGE info into recipe file.
>>      new 024caf6  bootchart2: update python interpreter
>>      new acc9994  cve-check-tool: change BB_NO_NETWORK error to a warning
>>      new fa36678  bmap-tools: upgrade to v3.4
>>      new 0d6130b  bmap-tools: switch to Python 3
>>      new 7fca44e  wic: run bmaptool with native Python3
>>      new 1585ed0  texinfo-dummy-native: port to Python 3
>>      new 3014099  glibc: do the multilib_header magic also for
>> bits/pthreadtypes-arch.h
>>      new 56cf3a0  util-linux: Add HOMEPAGE info into recipe file.
>>      new 818d4a9  iputils: backport patch to fix arping hang problem
>>      new 1d0c86a  diffutils: Add HOMEPAGE info into recipe file.
>>      new 34cde8e  foomatic: Add HOMEPAGE info into recipe file.
>>      new 6e1f800  subversion: fix CVE-2017-9800
>>      new 1ca7d8d  libfm: remove file which conflicts with libfm-extra
>>      new e67b40c  scripts/buildhistory-diff: use of argparse instead of
>> optparse
>>      new b6e72d0  linux-yocto: Make LINUX_VERSION_EXTENSION weaker
>>      new 1a5026d  goarch.bbclass: Stop passing True as second argument of
>> d.getVar
>>      new 56ce355  go.bbclass: Fix binary installation path detection
>>      new 26abbf1  go: Remove Go 1.6 and 1.7 releases
>>      new 07b60c1  goarch.bbclass: Replace logic for setting GOARM
>>      new e242e7c  goarch.bbclass: Add support for ARMv5
>>      new d6b8e7e  go.bbclass: Use a global Go build flags
>>      new 7a40ea8  go.bbclass: Enable parallel build
>>      new 0369a99  go.bbclass: exported function cleanup
>>      new 4971362  go.bbclass: Use an auxiliary variable to add the build
>> dependencies
>>      new c62a083  go.bbclass: separate ${S} and ${B}
>>      new efcf651  go.bbclass: add do_unpack function to handle common
>> cases
>>      new 9819353  go.bbclass: add GO_INSTALL_FILTEROUT variable
>>      new 79e0401  go-dep: Add 0.3.0 release
>>      new 116d2ea  go-helloworld: Use the Golang examples repository
>>      new 802829f  devtool: upgrade: check that user has configured git
>> properly
>>      new 2ebbeb6  staging: gracefully abort if two recipes conflict in
>> the sysroot
>>
>> The 59 revisions listed above as "new" are entirely new to this
>> repository and will be described in separate emails.  The revisions
>> listed as "add" were already present in the repository and have only
>> been added to this reference.
>>
>>
>> Summary of changes:
>>  meta/classes/go.bbclass                            | 110 ++++---
>>  meta/classes/goarch.bbclass                        |  27 +-
>>  meta/classes/gtk-doc.bbclass                       |   1 +
>>  meta/classes/insane.bbclass                        |   3 +-
>>  meta/classes/kernel.bbclass                        |  16 +-
>>  meta/classes/package_deb.bbclass                   |  40 ++-
>>  meta/classes/package_ipk.bbclass                   |  40 ++-
>>  meta/classes/staging.bbclass                       |  18 +-
>>  meta/lib/oe/rootfs.py                              |   7 +-
>>  meta/lib/oeqa/selftest/case.py                     |  20 +-
>>  meta/lib/oeqa/selftest/cases/archiver.py           |   3 +-
>>  meta/lib/oeqa/selftest/cases/distrodata.py         |   2 +
>>  meta/lib/oeqa/selftest/cases/imagefeatures.py      |   3 +
>>  meta/lib/oeqa/selftest/cases/layerappend.py        |   2 +-
>>  meta/lib/oeqa/selftest/cases/runcmd.py             |  17 +
>>  meta/lib/oeqa/selftest/cases/wic.py                |  70 ++++
>>  meta/lib/oeqa/utils/qemurunner.py                  | 351
>> ++++++++++-----------
>>  meta/recipes-core/glib-2.0/glib.inc                |   2 +
>>  meta/recipes-core/glibc/glibc-package.inc          |   2 +-
>>  ...bc-reset-dl-load-write-lock-after-forking.patch |  37 +++
>>  .../0028-Bug-4578-add-ld.so-lock-while-fork.patch  |  57 ++++
>>  meta/recipes-core/glibc/glibc_2.26.bb              |   2 +
>>  .../initrdscripts/initramfs-framework_1.0.bb       |  20 +-
>>  .../initramfs-module-install-efi_1.0.bb            |  18 ++
>>  .../initramfs-module-setup-live_1.0.bb             |  18 ++
>>  meta/recipes-core/psplash/files/psplash-init       |   6 +
>>  meta/recipes-core/psplash/psplash_git.bb           |   2 +-
>>  meta/recipes-core/util-linux/util-linux.inc        |   1 +
>>  .../bootchart2/bootchart2_0.14.8.bb                |   2 +-
>>  .../cve-check-tool/cve-check-tool_5.6.4.bb         |   2 +-
>>  meta/recipes-devtools/go/go-1.6.inc                |  19 --
>>  .../go/go-1.6/armhf-elf-header.patch               |  23 --
>>  .../go/go-1.6/fix-cc-handling.patch                |  50 ---
>>  .../go/go-1.6/fix-target-cc-for-build.patch        |  17 -
>>  meta/recipes-devtools/go/go-1.6/gotooldir.patch    |  30 --
>>  .../go/go-1.6/split-host-and-target-build.patch    |  63 ----
>>  meta/recipes-devtools/go/go-1.6/syslog.patch       |  62 ----
>>  meta/recipes-devtools/go/go-1.7.inc                |  19 --
>>  .../go/go-1.7/armhf-elf-header.patch               |  23 --
>>  .../go/go-1.7/fix-cc-handling.patch                |  50 ---
>>  .../go/go-1.7/fix-target-cc-for-build.patch        |  17 -
>>  meta/recipes-devtools/go/go-1.7/gotooldir.patch    |  30 --
>>  .../go/go-1.7/split-host-and-target-build.patch    |  62 ----
>>  meta/recipes-devtools/go/go-1.7/syslog.patch       |  62 ----
>>  meta/recipes-devtools/go/go-cross_1.7.bb           |   5 -
>>  meta/recipes-devtools/go/go-dep_0.3.0.bb           |  18 ++
>>  meta/recipes-devtools/go/go_1.6.bb                 |   4 -
>>  meta/recipes-devtools/go/go_1.7.bb                 |   2 -
>>  meta/recipes-devtools/python/python3-pip_9.0.1.bb  |   2 +-
>>  .../python/python3-setuptools_36.2.7.bb            |   7 +-
>>  .../subversion/subversion/CVE-2017-9800.patch      | 136 ++++++++
>>  .../subversion/subversion_1.9.6.bb                 |   1 +
>>  meta/recipes-extended/diffutils/diffutils.inc      |   1 +
>>  .../foomatic/foomatic-filters_4.0.17.bb            |   1 +
>>  .../go-examples/files/helloworld.go                |  10 -
>>  meta/recipes-extended/go-examples/go-examples.inc  |  10 -
>>  .../go-examples/go-helloworld_0.1.bb               |  24 +-
>>  ...ing-fix-arping-hang-if-SIGALRM-is-blocked.patch |  44 +++
>>  meta/recipes-extended/iputils/iputils_s20151218.bb |   1 +
>>  meta/recipes-extended/sysstat/sysstat.inc          |   6 +-
>>  .../texinfo-dummy-native/texinfo-dummy/template.py |   4 +-
>>  meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb |   2 +-
>>  meta/recipes-kernel/linux/linux-dtb.inc            |  36 +--
>>  meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>>  ...apbpf-don-t-support-installing-a-non-root.patch |  62 ++++
>>  meta/recipes-kernel/systemtap/systemtap_git.inc    |   5 +-
>>  meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb   |   4 +-
>>  ...-don-t-use-variable-length-array-in-union.patch |  59 ++++
>>  .../pulseaudio/pulseaudio_10.0.bb                  |   1 +
>>  .../{bmap-tools_3.2.bb => bmap-tools_3.4.bb}       |   9 +-
>>  meta/recipes-support/libfm/libfm_1.2.5.bb          |   1 +
>>  .../shared-mime-info/shared-mime-info.inc          |   3 +-
>>  scripts/buildhistory-diff                          | 125 ++++----
>>  scripts/lib/devtool/standard.py                    |   2 +-
>>  scripts/lib/devtool/upgrade.py                     |  27 +-
>>  scripts/lib/wic/engine.py                          |  55 ++--
>>  scripts/lib/wic/help.py                            |  64 ++--
>>  scripts/lib/wic/plugins/imager/direct.py           |   6 +-
>>  scripts/yocto-compat-layer.py                      |   2 +-
>>  79 files changed, 1137 insertions(+), 1030 deletions(-)
>>  create mode 100644 meta/recipes-core/glibc/glibc/
>> 0027-glibc-reset-dl-load-write-lock-after-forking.patch
>>  create mode 100644 meta/recipes-core/glibc/glibc/
>> 0028-Bug-4578-add-ld.so-lock-while-fork.patch
>>  create mode 100644 meta/recipes-core/initrdscripts/
>> initramfs-module-install-efi_1.0.bb
>>  create mode 100644 meta/recipes-core/initrdscripts/
>> initramfs-module-setup-live_1.0.bb
>>  delete mode 100644 meta/recipes-devtools/go/go-1.6.inc
>>  delete mode 100644 meta/recipes-devtools/go/go-1.
>> 6/armhf-elf-header.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.
>> 6/fix-target-cc-for-build.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.6/gotooldir.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.
>> 6/split-host-and-target-build.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.7.inc
>>  delete mode 100644 meta/recipes-devtools/go/go-1.
>> 7/armhf-elf-header.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.
>> 7/fix-target-cc-for-build.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.7/gotooldir.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.
>> 7/split-host-and-target-build.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
>>  delete mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
>>  create mode 100644 meta/recipes-devtools/go/go-dep_0.3.0.bb
>>  delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
>>  delete mode 100644 meta/recipes-devtools/go/go_1.7.bb
>>  create mode 100644 meta/recipes-devtools/subversi
>> on/subversion/CVE-2017-9800.patch
>>  delete mode 100644 meta/recipes-extended/go-examples/files/helloworld.go
>>  delete mode 100644 meta/recipes-extended/go-examples/go-examples.inc
>>  create mode 100644 meta/recipes-extended/iputils/
>> files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
>>  create mode 100644 meta/recipes-kernel/systemtap/
>> systemtap/0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch
>>  create mode 100644 meta/recipes-multimedia/pulsea
>> udio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-
>> variable-length-array-in-union.patch
>>  rename meta/recipes-support/bmap-tools/{bmap-tools_3.2.bb =>
>> bmap-tools_3.4.bb} (79%)
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
Across a similar update on master I noticed a possibly related glitch while
building config attached below. Here
linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4 complained with:

ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
do_kernel_metadata: Could not locate BSP definition for
raspberrypi3-64/standard and no defconfig was provided

Surprisingly enough this wasn't marked as a failed build indeed. Next
builds did not trigger any error either. Not tried yet any sort of cleaning
for the recipe. Didn't report it immediately since, as you can see from my
layers revisions, I was meantime upgrading to latest master and testing
Paul's work for fixing build for 64bit kernel when u-boot is used to boot
the RPi. FWIW I don't have rm_work enabled on these builds.

I'm aware that the same error was triggered by a recent issue that
prevented the build to continue and was fixed by poky commit
fa664b1bba3ef8256083f4e52cafd0985d924586 (From OE-Core rev:
156cf9e25f875a50f907e570d9b62cbc2c051133).

Here is the configuration that "sort of" failed:

Build Configuration:
BB_VERSION        = "1.35.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "universal"
TARGET_SYS        = "aarch64-poky-linux"
MACHINE           = "raspberrypi3-64"
DISTRO            = "poky"
DISTRO_VERSION    = "2.3+snapshot-20170912"
TUNE_FEATURES     = "aarch64"
TARGET_FPU        = ""
meta
meta-poky
meta-yocto-bsp    = "HEAD:e3a69364eb1fdbf1dcb98a04b3ddfc8f9841a7fa"
meta-oe
meta-python
meta-networking   = "HEAD:d9f7ef40d74659a0348248841efadaf120d52c30"
meta-raspberrypi  =
"pbarker/kernel:a01be8b3cf4af9bcd0c01a5b0af3b9c7a2c2b756"

Initialising tasks: 100%
|#################################################################| Time:
0:00:12
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
do_kernel_metadata: Could not locate BSP definition for
raspberrypi3-64/standard and no defconfig was provided
NOTE: Tasks Summary: Attempted 4887 tasks of which 2194 didn't need to be
rerun and all succeeded.
NOTE: Writing buildhistory

--001a114db7e65e031a05590c31cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi!</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Tue=
, Sep 12, 2017 at 12:58 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr">Hi,<div><br></div><div>I don&#39;t see any obvious change in t=
his update which should cause this, but rebuilding my image for raspberrypi=
3-64 after this update (the previous image was built without errors) shows:=
<div><br></div><div><div>NOTE: Running task 417 of 6399 (/OE/build/owpb/web=
os-ports/<wbr>meta-raspberrypi/recipes-<wbr>kernel/linux/linux-<wbr>raspber=
rypi_4.9.bb:do_<wbr>validate_branches)</div><div>NOTE: recipe linux-raspber=
rypi-1_4.9.41+<wbr>gitAUTOINC+4153f509b4-r0: task do_validate_branches: Sta=
rted</div><div>....</div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+<wbr>=
gitAUTOINC+4153f509b4-r0: task do_validate_branches: Succeeded<br></div><di=
v>NOTE: Running task 434 of 6399 (/OE/build/owpb/webos-ports/<wbr>meta-rasp=
berrypi/recipes-<wbr>kernel/linux/linux-<wbr>raspberrypi_4.9.bb:do_kernel_<=
wbr>metadata)</div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+<wbr>gitAUT=
OINC+4153f509b4-r0: task do_kernel_metadata: Started</div><div>ERROR: linux=
-raspberrypi-1_4.9.41+<wbr>gitAUTOINC+4153f509b4-r0 do_kernel_metadata: Cou=
ld not locate BSP definition for raspberrypi3-64/standard and no defconfig =
was provided</div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+<wbr>gitAUTO=
INC+4153f509b4-r0: task do_kernel_metadata: Succeeded</div><div>...</div><d=
iv>NOTE: Running task 454 of 6399 (/OE/build/owpb/webos-ports/<wbr>meta-ras=
pberrypi/recipes-<wbr>kernel/linux/linux-<wbr>raspberrypi_4.9.bb:do_patch)<=
br></div></div><div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+<wbr>gitAU=
TOINC+4153f509b4-r0: task do_patch: Started</div><div>NOTE: recipe linux-ra=
spberrypi-1_4.9.41+<wbr>gitAUTOINC+4153f509b4-r0: task do_patch: Succeeded<=
/div><div>NOTE: Running task 491 of 6399 (/OE/build/owpb/webos-ports/<wbr>m=
eta-raspberrypi/recipes-<wbr>kernel/linux/linux-<wbr>raspberrypi_4.9.bb:do_=
kernel_<wbr>configme)</div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+<wb=
r>gitAUTOINC+4153f509b4-r0: task do_kernel_configme: Started</div><div>ERRO=
R: linux-raspberrypi-1_4.9.41+<wbr>gitAUTOINC+4153f509b4-r0 do_kernel_confi=
gme: [ERROR]: no configuration queue found in outdir (.kernel-meta)</div><d=
iv><br></div><div>=C2=A0scc [--help] [--configs] [--force] [-i] [-w] [--cmd=
s &lt;comma separated list&gt;] [-o outdir:&lt;meta,cfg,patch&gt;] [-D&lt;v=
ar&gt;=3D&lt;value&gt;] [-I&lt;path&gt;] [-v] infiles</div><div><br></div><=
div>=C2=A0 =C2=A0 =C2=A0 --help:=C2=A0 =C2=A0 =C2=A0 This message</div><div=
>=C2=A0 =C2=A0 =C2=A0 --force:=C2=A0 =C2=A0 =C2=A0force overwrite output fi=
le if it already exists</div><div>=C2=A0 =C2=A0 =C2=A0 --cmds:=C2=A0 =C2=A0=
 =C2=A0 list of supported commands. If not passed, all found commands are l=
oaded,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0valid commands are: patch, kconf, branch, define</div><div>=C2=
=A0 =C2=A0 =C2=A0 --configs:=C2=A0 =C2=A0Output the list of compiled config=
uration fragments (if available), -o &lt;outdir&gt; is</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used to locate t=
he configuration options</div><div>=C2=A0 =C2=A0 =C2=A0 -D:=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 define &lt;var&gt; to &lt;value&gt; which will be avai=
lable to sub scripts</div><div>=C2=A0 =C2=A0 =C2=A0 -I:=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 include path &lt;path&gt; will be searched for files</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 -i:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 leave interme=
diate files on failure</div><div>=C2=A0 =C2=A0 =C2=A0 -w:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 only warn on missing files</div><div>=C2=A0 =C2=A0 =C2=A0=
 -v:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 verbose output</div><div>=C2=A0 =C2=
=A0 =C2=A0 -o:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output directory and artif=
acts. artifacts follow the colon and ar a comma</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0separated list of:</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0meta:=C2=A0 full meta-series (patches, config, branches, etc)=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0cfg:=C2=A0 =C2=A0configure fragment queue</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0patch: patch queue</div><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 infi=
les=C2=A0 =C2=A0 =C2=A0 files to preprocess, and output into outfile or std=
out</div><div>ERROR: linux-raspberrypi-1_4.9.41+<wbr>gitAUTOINC+4153f509b4-=
r0 do_kernel_configme: Could not find configuration queue (.kernel-meta/con=
fig.queue)</div><div>ERROR: linux-raspberrypi-1_4.9.41+<wbr>gitAUTOINC+4153=
f509b4-r0 do_kernel_configme: Function failed: do_kernel_configme (log file=
 is located at /OE/build/owpb/webos-ports/<wbr>tmp-glibc/work/raspberrypi3_=
<wbr>64-webos-linux/linux-<wbr>raspberrypi/1_4.9.41+<wbr>gitAUTOINC+4153f50=
9b4-r0/temp/<wbr>log.do_kernel_configme.19498)</div><div>ERROR: Logfile of =
failure stored in: /OE/build/owpb/webos-ports/<wbr>tmp-glibc/work/raspberry=
pi3_<wbr>64-webos-linux/linux-<wbr>raspberrypi/1_4.9.41+<wbr>gitAUTOINC+415=
3f509b4-r0/temp/<wbr>log.do_kernel_configme.19498</div><div>Log data follow=
s:</div><div>| DEBUG: Executing shell function do_kernel_configme</div><div=
>| ERROR: [ERROR]: no configuration queue found in outdir (.kernel-meta)</d=
iv></div><div><div>|</div><div>|=C2=A0 scc [--help] [--configs] [--force] [=
-i] [-w] [--cmds &lt;comma separated list&gt;] [-o outdir:&lt;meta,cfg,patc=
h&gt;] [-D&lt;var&gt;=3D&lt;value&gt;] [-I&lt;path&gt;] [-v] infiles</div><=
div>|</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0--help:=C2=A0 =C2=A0 =C2=A0 Thi=
s message</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0--force:=C2=A0 =C2=A0 =C2=
=A0force overwrite output file if it already exists</div><div>|=C2=A0 =C2=
=A0 =C2=A0 =C2=A0--cmds:=C2=A0 =C2=A0 =C2=A0 list of supported commands. If=
 not passed, all found commands are loaded,</div><div>|=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 valid commands are: patch=
, kconf, branch, define</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0--configs:=C2=
=A0 =C2=A0Output the list of compiled configuration fragments (if available=
), -o &lt;outdir&gt; is</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 used to locate the configuration options</d=
iv><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0-D:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
efine &lt;var&gt; to &lt;value&gt; which will be available to sub scripts</=
div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0-I:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
include path &lt;path&gt; will be searched for files</div><div>|=C2=A0 =C2=
=A0 =C2=A0 =C2=A0-i:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 leave intermediate f=
iles on failure</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0-w:=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 only warn on missing files</div><div>|=C2=A0 =C2=A0 =C2=
=A0 =C2=A0-v:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 verbose output</div><div>|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0-o:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 output dir=
ectory and artifacts. artifacts follow the colon and ar a comma</div><div>|=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 separ=
ated list of:</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta:=C2=A0 full meta-series (patches, c=
onfig, branches, etc)</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg:=C2=A0 =C2=A0configure fragme=
nt queue</div><div>|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch: patch queue</div><div>|</div><div>|=C2=
=A0 =C2=A0 =C2=A0 =C2=A0infiles=C2=A0 =C2=A0 =C2=A0 files to preprocess, an=
d output into outfile or stdout</div><div>| ERROR: Could not find configura=
tion queue (.kernel-meta/config.queue)</div><div>| WARNING: /OE/build/owpb/=
webos-ports/<wbr>tmp-glibc/work/raspberrypi3_<wbr>64-webos-linux/linux-<wbr=
>raspberrypi/1_4.9.41+<wbr>gitAUTOINC+4153f509b4-r0/temp/<wbr>run.do_kernel=
_configme.19498:1 exit 1 from &#39;exit 1&#39;</div><div>| ERROR: Function =
failed: do_kernel_configme (log file is located at /OE/build/owpb/webos-por=
ts/<wbr>tmp-glibc/work/raspberrypi3_<wbr>64-webos-linux/linux-<wbr>raspberr=
ypi/1_4.9.41+<wbr>gitAUTOINC+4153f509b4-r0/temp/<wbr>log.do_kernel_configme=
.19498)</div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+<wbr>gitAUTOINC+4=
153f509b4-r0: task do_kernel_configme: Failed</div><div>ERROR: Task (/OE/bu=
ild/owpb/webos-ports/<wbr>meta-raspberrypi/recipes-<wbr>kernel/linux/linux-=
<wbr>raspberrypi_4.9.bb:do_kernel_<wbr>configme) failed with exit code &#39=
;1&#39;</div><div>NOTE: Running task 530 of 6399 (/OE/build/owpb/webos-port=
s/<wbr>meta-raspberrypi/recipes-<wbr>kernel/linux/linux-<wbr>raspberrypi_4.=
9.bb:do_kernel_<wbr>version_sanity_check)</div><div>NOTE: recipe linux-rasp=
berrypi-1_4.9.41+<wbr>gitAUTOINC+4153f509b4-r0: task do_kernel_version_sani=
ty_<wbr>check: Started</div><div>NOTE: recipe linux-raspberrypi-1_4.9.41+<w=
br>gitAUTOINC+4153f509b4-r0: task do_kernel_version_sanity_<wbr>check: Succ=
eeded</div></div><div><br></div><div>I don&#39;t know if this is some new r=
egression (the included changes in last upgrade doesn&#39;t look suspicious=
 much) or something which was already there like race condition in kernel b=
uild or bad interaction between linux-yocto and rm_work.</div><div><br></di=
v><div>I&#39;ll try to rebuild it after cleansstate after current build is =
finished.</div><div><br></div><div>+Paul +Andrei if they have seen it with =
meta-raspberrypi and maybe it&#39;s specific to=C2=A0raspberrypi3-64 or las=
t linux-raspberrypi upgrade.</div><div><br></div><div>Looks a bit similar t=
o discussion in:</div><div><a href=3D"http://lists.openembedded.org/piperma=
il/openembedded-core/2017-August/141097.html" target=3D"_blank">http://list=
s.openembedded.org/<wbr>pipermail/openembedded-core/<wbr>2017-August/141097=
.html</a><br></div><div><a href=3D"http://lists.openembedded.org/pipermail/=
openembedded-core/2017-August/141304.html" target=3D"_blank">http://lists.o=
penembedded.org/<wbr>pipermail/openembedded-core/<wbr>2017-August/141304.ht=
ml</a><br></div><div><a href=3D"http://lists.openembedded.org/pipermail/ope=
nembedded-core/2017-August/141323.html" target=3D"_blank">http://lists.open=
embedded.org/<wbr>pipermail/openembedded-core/<wbr>2017-August/141323.html<=
/a><br></div><div><a href=3D"http://lists.openembedded.org/pipermail/openem=
bedded-core/2017-August/141329.html" target=3D"_blank">http://lists.openemb=
edded.org/<wbr>pipermail/openembedded-core/<wbr>2017-August/141329.html</a>=
<br></div><div><br></div><div>Regards,</div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On Mon, Sep 11, 2017 at 6:30 PM,  <span dir=3D"l=
tr">&lt;<a href=3D"mailto:git@git.openembedded.org" target=3D"_blank">git@g=
it.openembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">This is an automated email from the git hooks/post-rece=
ive script.<br>
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
=C2=A0meta/classes/package_deb.bbcl<wbr>ass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 40 ++-<br>
=C2=A0meta/classes/package_ipk.bbcl<wbr>ass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 40 ++-<br>
=C2=A0meta/classes/staging.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 +-<br>
=C2=A0meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-=
<br>
=C2=A0meta/lib/oeqa/selftest/case.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
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
=C2=A0meta/lib/oeqa/utils/qemurunne<wbr>r.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 351 ++++++++++-----------<br>
=C2=A0meta/recipes-core/glib-2.0/gl<wbr>ib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-core/glibc/<wbr>glibc-package.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...bc-reset-dl-load-write-loc<wbr>k-after-forking.patch |=C2=A0 37 ++=
+<br>
=C2=A0.../0028-Bug-4578-add-ld.so-l<wbr>ock-while-fork.patch=C2=A0 |=C2=A0 =
57 ++++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glibc<wbr>_2.26.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../initrdscripts/<a href=3D"http://initramfs-framework_1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">initramfs-f<wbr>ramework_1.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
=C2=A0.../<a href=3D"http://initramfs-module-install-efi_1.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">initramfs-module-install-<wbr>efi_1.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 ++<br>
=C2=A0.../<a href=3D"http://initramfs-module-setup-live_1.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">initramfs-module-setup-li<wbr>ve_1.0.bb</a>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 ++<br>
=C2=A0meta/recipes-core/psplash/fil<wbr>es/psplash-init=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0meta/recipes-core/psplash/<a href=3D"http://psplash_git.bb" rel=3D"no=
referrer" target=3D"_blank">psp<wbr>lash_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-core/util-linux/<wbr>util-linux.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../bootchart2/<a href=3D"http://bootchart2_0.14.8.bb" rel=3D"norefer=
rer" target=3D"_blank">bootchart2_0.1<wbr>4.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0.../cve-check-tool/<a href=3D"http://cve-check-tool_5.6.4.bb" rel=3D"=
noreferrer" target=3D"_blank">cve-check-<wbr>tool_5.6.4.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>1.6.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 --<br>
=C2=A0.../go/go-1.6/armhf-elf-heade<wbr>r.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 --<br>
=C2=A0.../go/go-1.6/fix-cc-<wbr>handling.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 ---<br>
=C2=A0.../go/go-1.6/fix-target-cc-f<wbr>or-build.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 17 -<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>1.6/gotooldir.patch=C2=A0 =C2=A0 |=
=C2=A0 30 --<br>
=C2=A0.../go/go-1.6/split-host-and-<wbr>target-build.patch=C2=A0 =C2=A0 |=
=C2=A0 63 ----<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>1.6/syslog.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 62 ----<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>1.7.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 --<br>
=C2=A0.../go/go-1.7/armhf-elf-heade<wbr>r.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 --<br>
=C2=A0.../go/go-1.7/fix-cc-<wbr>handling.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 ---<br>
=C2=A0.../go/go-1.7/fix-target-cc-f<wbr>or-build.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 17 -<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>1.7/gotooldir.patch=C2=A0 =C2=A0 |=
=C2=A0 30 --<br>
=C2=A0.../go/go-1.7/split-host-and-<wbr>target-build.patch=C2=A0 =C2=A0 |=
=C2=A0 62 ----<br>
=C2=A0meta/recipes-devtools/go/go-<wbr>1.7/syslog.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 62 ----<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-cross_1.7.bb" rel=3D"no=
referrer" target=3D"_blank">go-c<wbr>ross_1.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 -<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-dep_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">go-d<wbr>ep_0.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 18 ++<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go_1.6.bb" rel=3D"noreferr=
er" target=3D"_blank">go_<wbr>1.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 -<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go_1.7.bb" rel=3D"noreferr=
er" target=3D"_blank">go_<wbr>1.7.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pip_9.0.1.bb" =
rel=3D"noreferrer" target=3D"_blank"><wbr>python3-pip_9.0.1.bb</a>=C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../python/<a href=3D"http://python3-setuptools_36.2.7.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-<wbr>setuptools_36.2.7.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0.../subversion/subversion/<wbr>CVE-2017-9800.patch=C2=A0 =C2=A0 =C2=
=A0 | 136 ++++++++<br>
=C2=A0.../subversion/<a href=3D"http://subversion_1.9.6.bb" rel=3D"noreferr=
er" target=3D"_blank">subversion_1.<wbr>9.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-extended/diffuti<wbr>ls/diffutils.inc=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../foomatic/<a href=3D"http://foomatic-filters_4.0.17.bb" rel=3D"nor=
eferrer" target=3D"_blank">foomatic-<wbr>filters_4.0.17.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../go-examples/files/hellowo<wbr>rld.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 -<br>
=C2=A0meta/recipes-extended/go-exam<wbr>ples/go-examples.inc=C2=A0 |=C2=A0 =
10 -<br>
=C2=A0.../go-examples/<a href=3D"http://go-helloworld_0.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">go-<wbr>helloworld_0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 +-<br>
=C2=A0...ing-fix-arping-hang-if-SIG<wbr>ALRM-is-blocked.patch |=C2=A0 44 ++=
+<br>
=C2=A0meta/recipes-extended/<wbr>iputils/<a href=3D"http://iputils_s2015121=
8.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20151218.bb</a> |=C2=A0=
 =C2=A01 +<br>
=C2=A0meta/recipes-extended/<wbr>sysstat/sysstat.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../texinfo-dummy-native/texi<wbr>nfo-dummy/template.py |=C2=A0 =C2=
=A04 +-<br>
=C2=A0meta/recipes-extended/xdg-uti<wbr>ls/<a href=3D"http://xdg-utils_1.1.=
1.bb" rel=3D"noreferrer" target=3D"_blank">xdg-utils_1.1.1.bb</a> |=C2=A0 =
=C2=A02 +-<br>
=C2=A0meta/recipes-kernel/linux/lin<wbr>ux-dtb.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 36 +--<br>
=C2=A0meta/recipes-kernel/linux/lin<wbr>ux-yocto.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0...apbpf-don-t-support-instal<wbr>ling-a-non-root.patch |=C2=A0 62 ++=
++<br>
=C2=A0meta/recipes-kernel/<wbr>systemtap/systemtap_git.inc=C2=A0 =C2=A0 |=
=C2=A0 =C2=A05 +-<br>
=C2=A0meta/recipes-multimedia/alsa/<a href=3D"http://alsa-utils_1.1.4.bb" r=
el=3D"noreferrer" target=3D"_blank"><wbr>alsa-utils_1.1.4.bb</a>=C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0...-don-t-use-variable-<wbr>length-array-in-union.patch |=C2=A0 59 ++=
++<br>
=C2=A0.../pulseaudio/<a href=3D"http://pulseaudio_10.0.bb" rel=3D"noreferre=
r" target=3D"_blank">pulseaudio_10.<wbr>0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../{<a href=3D"http://bmap-tools_3.2.bb" rel=3D"noreferrer" target=
=3D"_blank">bmap-tools_3.2.bb</a> =3D&gt; <a href=3D"http://bmap-tools_3.4.=
bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.4.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0meta/recipes-support/libfm/<a href=3D"http://libfm_1.2.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>bfm_1.2.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../shared-mime-info/shared-m<wbr>ime-info.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0scripts/buildhistory-diff=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 125 ++++----<br>
=C2=A0scripts/lib/devtool/standard.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/lib/devtool/upgrade.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 27 +-<br>
=C2=A0scripts/lib/wic/engine.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 55 ++--<br>
=C2=A0scripts/lib/wic/help.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 64 ++--<br>
=C2=A0scripts/lib/wic/plugins/image<wbr>r/direct.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0scripts/yocto-compat-layer.<wbr>py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A079 files changed, 1137 insertions(+), 1030 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/<wbr>0027-glibc-rese=
t-dl-load-write<wbr>-lock-after-forking.patch<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/<wbr>0028-Bug-4578-a=
dd-ld.so-lock-w<wbr>hile-fork.patch<br>
=C2=A0create mode 100644 meta/recipes-core/initrdscript<wbr>s/<a href=3D"ht=
tp://initramfs-module-install-efi_1.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">initramfs-module-install-<wbr>efi_1.0.bb</a><br>
=C2=A0create mode 100644 meta/recipes-core/initrdscript<wbr>s/<a href=3D"ht=
tp://initramfs-module-setup-live_1.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">initramfs-module-setup-live_<wbr>1.0.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6.inc<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6/armhf-elf-hea=
der.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6/fix-cc-handli=
ng.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>6/fix-target-cc=
-for-build.patc<wbr>h<br>
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
-for-build.patc<wbr>h<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>7/gotooldir.pat=
ch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>7/split-host-an=
d-target-build.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/go-1.<wbr>7/syslog.patch<=
br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-cros=
s_1.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cr<wbr>oss_1.7.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/go/<a href=3D"http://go-dep_=
0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">go-de<wbr>p_0.3.0.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go_1.6.=
bb" rel=3D"noreferrer" target=3D"_blank">go_1.<wbr>6.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-devtools/go/<a href=3D"http://go_1.7.=
bb" rel=3D"noreferrer" target=3D"_blank">go_1.<wbr>7.bb</a><br>
=C2=A0create mode 100644 meta/recipes-devtools/subversi<wbr>on/subversion/C=
VE-2017-9800.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/go-examp<wbr>les/files/hello=
world.go<br>
=C2=A0delete mode 100644 meta/recipes-extended/go-examp<wbr>les/go-examples=
.inc<br>
=C2=A0create mode 100644 meta/recipes-extended/iputils/<wbr>files/arping-fi=
x-arping-hang-i<wbr>f-SIGALRM-is-blocked.patch<br>
=C2=A0create mode 100644 meta/recipes-kernel/systemtap/<wbr>systemtap/0001-=
staprun-stapbpf<wbr>-don-t-support-installing-a-<wbr>non-root.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/pulsea<wbr>udio/pulseaudio=
/pulseaudio-<wbr>discuss-iochannel-don-t-use-<wbr>variable-length-array-in-=
<wbr>union.patch<br>
=C2=A0rename meta/recipes-support/bmap-tool<wbr>s/{<a href=3D"http://bmap-t=
ools_3.2.bb" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.2.bb</a> =3D=
&gt; <a href=3D"http://bmap-tools_3.4.bb" rel=3D"noreferrer" target=3D"_bla=
nk">bmap-tools_3.4.bb</a>} (79%)<span class=3D"gmail-HOEnZb"><font color=3D=
"#888888"><br>
<span class=3D"gmail-m_793022276445027755gmail-HOEnZb"><font color=3D"#8888=
88"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.ope<wbr>nembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></font></span></blockquote></div><br></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div></div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Across a similar update on master I noticed a possibly re=
lated glitch while building config attached below. Here linux-raspberrypi-1=
_4.9.41+gitAUTOINC+4153f509b4 complained with:</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">ERROR: linux-raspberrypi-1_4.9.41+=
gitAUTOINC+4153f509b4-r0 do_kernel_metadata: Could not locate BSP definitio=
n for raspberrypi3-64/standard and no defconfig was provided<br></div><div =
class=3D"gmail_extra"><br></div>Surprisingly enough this wasn&#39;t marked =
as a failed build indeed. Next builds did not trigger any error either. Not=
 tried yet any sort of cleaning for the recipe. Didn&#39;t report it immedi=
ately since, as you can see from my layers revisions, I was meantime upgrad=
ing to latest master and testing Paul&#39;s work for fixing build for 64bit=
 kernel when u-boot is used to boot the RPi. FWIW I don&#39;t have rm_work =
enabled on these builds.<br><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">I&#39;m aware that the same error was triggered by a recen=
t issue=20
that prevented the build to continue and was fixed by poky commit=20
fa664b1bba3ef8256083f4e52cafd0985d924586 (From OE-Core rev:=20
156cf9e25f875a50f907e570d9b62cbc2c051133).<br></div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Here is the configuration that &qu=
ot;sort of&quot; failed:</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Build Configuration:<br>BB_VERSION=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.35.0&quot;<br>BUILD_SYS=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;x86_64-linux&quot;<br>NATIVELSBSTR=
ING=C2=A0=C2=A0 =3D &quot;universal&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;aarch64-poky-linux&quot;<br>MACHINE=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;raspber=
rypi3-64&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D &quot;poky&quot;<br>DISTRO_VERSION=C2=A0=C2=A0=C2=A0 =
=3D &quot;2.3+snapshot-20170912&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;aarch64&quot;<br>TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-poky=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-yocto-bsp=C2=A0=C2=A0=C2=A0 =3D &quot;=
HEAD:e3a69364eb1fdbf1dcb98a04b3ddfc8f9841a7fa&quot;<br>meta-oe=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-python=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-networking=C2=A0=C2=A0 =3D &quot;HEAD:=
d9f7ef40d74659a0348248841efadaf120d52c30&quot;<br>meta-raspberrypi=C2=A0 =
=3D &quot;pbarker/kernel:a01be8b3cf4af9bcd0c01a5b0af3b9c7a2c2b756&quot;<br>=
<br>Initialising tasks: 100% |#############################################=
####################| Time: 0:00:12<br>NOTE: Executing SetScene Tasks<br>NO=
TE: Executing RunQueue Tasks<br>ERROR: linux-raspberrypi-1_4.9.41+gitAUTOIN=
C+4153f509b4-r0 do_kernel_metadata: Could not locate BSP definition for ras=
pberrypi3-64/standard and no defconfig was provided<br>NOTE: Tasks Summary:=
 Attempted 4887 tasks of which 2194 didn&#39;t need to be rerun and all suc=
ceeded.<br>NOTE: Writing buildhistory<br><br></div></div>

--001a114db7e65e031a05590c31cc--
