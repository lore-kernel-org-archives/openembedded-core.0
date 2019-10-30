Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D17427F74B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 23:14:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2019 16:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,248,1569308400"; d="scan'208";a="211427707"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by fmsmga001.fm.intel.com with ESMTP; 30 Oct 2019 16:14:28 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191024111126.41198-1-alex.kanavin@gmail.com>
	<20191024111126.41198-2-alex.kanavin@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <cd1794cf-f129-cd0f-f2e1-21d070e41b2f@intel.com>
Date: Wed, 30 Oct 2019 23:14:27 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024111126.41198-2-alex.kanavin@gmail.com>
Subject: Re: [PATCH 2/5] oe-selftest: extend virgl gtk test to also check the SDL option
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
X-List-Received-Date: Wed, 30 Oct 2019 23:14:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Sorry, but:

2019-10-30 05:06:57,094 - oe-selftest - INFO - FAIL: 
runtime_test.TestImage.test_testimage_virgl_gtk_sdl 
(subunit.RemotedTestCase)
2019-10-30 05:06:57,097 - oe-selftest - INFO - 
----------------------------------------------------------------------
2019-10-30 05:06:57,097 - oe-selftest - INFO - 
testtools.testresult.real._StringException: Traceback (most recent call 
last):
   File 
"/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/selftest/cases/runtime_test.py", 
line 206, in test_testimage_virgl_gtk_sdl
     bitbake('-c testimage core-image-minimal')
   File 
"/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/utils/commands.py", 
line 221, in bitbake
     return runCmd(cmd, ignore_status, timeout, output_log=output_log, 
**options)
   File 
"/home/pokybuild/yocto-worker/oe-selftest/build/meta/lib/oeqa/utils/commands.py", 
line 199, in runCmd
     raise AssertionError("Command '%s' returned non-zero exit status 
%d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  -c testimage core-image-minimal' 
returned non-zero exit status 1:
Loading cache...done.
Loaded 1332 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
Build Configuration:
BB_VERSION           = "1.44.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal-4.8"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "ross/mut:db5c0617da6bcfbe947b81dbf71fa123a6257fa0"
meta-selftest        = "master:74201d531e64b3d5b0bfb17d7189d416c485a1fb"
Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 124 (0% match, 100% 
complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1013 of 1013 
(/home/pokybuild/yocto-worker/oe-selftest/build/meta/recipes-core/images/core-image-minimal.bb:do_testimage)
NOTE: recipe core-image-minimal-1.0-r0: task do_testimage: Started
WARNING: core-image-minimal-1.0-r0 do_testimage: Last 25 lines of text:
[    0.942844] io scheduler kyber registered
[    0.944231] input: Power Button as 
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
[    0.949516] ACPI: Power Button [PWRF]
[    0.969010] PCI Interrupt Link [LNKB] enabled at IRQ 10
[    0.989213] PCI Interrupt Link [LNKC] enabled at IRQ 11
[    1.027830] PCI Interrupt Link [LNKA] enabled at IRQ 10
[    1.031426] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.057292] 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) 
is a 16550A
[    1.088281] 00:06: ttyS1 at I/O 0x2f8 (irq = 3, base_baud = 115200) 
is a 16550A
[    1.093703] Linux agpgart interface v0.103
[    1.095192] [drm] pci: virtio-vga detected at 0000:00:02.0
[    1.096746] virtio-pci 0000:00:02.0: 
remove_conflicting_pci_framebuffers: bar 0: 0xfe000000 -> 0xfe7fffff
[    1.099351] random: fast init done
[    1.100408] virtio-pci 0000:00:02.0: 
remove_conflicting_pci_framebuffers: bar 2: 0xfe800000 -> 0xfe803fff
[    1.103035] random: crng init done
[    1.104086] virtio-pci 0000:00:02.0: 
remove_conflicting_pci_framebuffers: bar 4: 0xfebd0000 -> 0xfebd0fff
[    1.106696] virtio-pci 0000:00:02.0: vgaarb: deactivate vga console
[    1.110129] Console: switching to colour dummy device 80x25
[    1.111417] [drm] virgl 3d acceleration enabled
[    1.112331] [drm] EDID support available.
[    1.115106] [TTM] Zone  kernel: Available graphics memory: 116016 KiB
[    1.116401] [TTM] Initializing pool allocator
[    1.117279] [TTM] Initializing DMA pool allocator
[    1.118253] [drm] number of scanouts: 1
[    1.119032] [drm] number of cap sets: 2
WARNING: core-image-minimal-1.0-r0 do_testimage: Check full boot log: 
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-5770/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20191030031548
WARNING: core-image-minimal-1.0-r0 do_testimage: Qemu ended 
unexpectedly, dump data from host is in 
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-5770/tmp/log/runtime-hostdump/201910300316_qemu
WARNING: core-image-minimal-1.0-r0 do_testimage: qemu-system ended 
unexpectedly
ERROR: core-image-minimal-1.0-r0 do_testimage: testimage received 
SIGTERM, shutting down...
ERROR: core-image-minimal-1.0-r0 do_testimage: core-image-minimal - 
FAILED - tests were interrupted during execution
ERROR: Logfile of failure stored in: 
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-5770/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_testimage.47342
NOTE: recipe core-image-minimal-1.0-r0: task do_testimage: Failed
ERROR: Task 
(/home/pokybuild/yocto-worker/oe-selftest/build/meta/recipes-core/images/core-image-minimal.bb:do_testimage) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1013 tasks of which 1012 didn't need to 
be rerun and 1 failed.
NOTE: The errors for this build are stored in 
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-5770/tmp/log/error-report/error_report_20191030031548.txt
You can send the errors to a reports server by running:
   send-error-report 
/home/pokybuild/yocto-worker/oe-selftest/build/build-st-5770/tmp/log/error-report/error_report_20191030031548.txt 
[-s server]
NOTE: The contents of these logs will be posted in public if you use the 
above command with the default server. Please ensure you remove any 
identifying or proprietary information when prompted before sending.
Summary: 1 task failed:
 
/home/pokybuild/yocto-worker/oe-selftest/build/meta/recipes-core/images/core-image-minimal.bb:do_testimage
Summary: There were 4 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/771/steps/8/logs/step2d

Centos 7 worker, if that matters.

Ross

