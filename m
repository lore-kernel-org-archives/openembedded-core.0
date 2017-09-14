Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3EF77FE8;
	Thu, 14 Sep 2017 17:25:57 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id l94so9134ual.11;
	Thu, 14 Sep 2017 10:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=juwtI7Lyvb5ei2PcLM6pO0sN96oGpXKxqprQDV4UNIA=;
	b=qzLZFdNVVCM9vUlIq4xcMuT058X2vA1sYUEDNMfhsKT0p0TBIqyYKHG2CLvMjx27bL
	H5hHl2zTQI6JhmGHmWTDtZA642yFQ7qF8hOojcsLrEfo2DUqjqz8uaaoe5ICUKNzPW7F
	5HmmrQYYxNX+VbZ5/FNIuoY4eSdJHADAFYozaPeJZRpoid3KBRN4994w8xxCacEt1AOs
	qnKCkUZK1oiGBhL1euLbUs5qunCH+oQvMXUReVXgnLmCwUfBQw+/UCzqhZYEdRXIcCNB
	XPgtMSQkKVQFgOO5P9z1DtrNENtuEqQYhvYjHjxqtMM5iTd4tIfqb6VscFWSNDwnZphB
	vNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=juwtI7Lyvb5ei2PcLM6pO0sN96oGpXKxqprQDV4UNIA=;
	b=oqUYsNdVcSqVvROoNvtJii4d2224wm+MfovsZ4sKFVm56NC3I6TvysdW4ofgy0GSzB
	oIDPr1xyCknKM/ih3+D97ylXotDGl0cbmM5x2HGuVpho/kUd9P6J+SNzEPBW1xOk9tdX
	Y7KK2pJkq8UXFCiaPHzeMquDC/ujtQOMtdzyiU86o+8SQoKmrAelHjb+Mns7EYrWYRer
	sqjkH6lcRDK0+sY0MWUA9WcWKz8ZTiuIYHpGCH3JGwVgRu2CuOf7DqFVR/E+ag3b1J/i
	ctp37qfw1+yv1Oesitix8Lz+G3pgsKJiT46a0Ox7QkS0q6+4ZHnuFbDps43U7X7fPvVh
	lTEQ==
X-Gm-Message-State: AHPjjUjfo/471WZhLLMFI5y8XF8Ealg0ctkfxjfZxUGOSNXKwo/+hjBa
	AchM6OyN3/hELkTXoJJJ4LTwAVp6Oj9Y0WW8+zE=
X-Google-Smtp-Source: AOwi7QD6yUQvPu+kv2YaZYlb/c0aqONG4KEAkdVk1V9ONfwbpBtUZbUprN/kZJFhhh9ybeZGgGsq+KkHaRt7AP+wHik=
X-Received: by 10.176.2.5 with SMTP id 5mr19124422uas.160.1505409958072; Thu,
	14 Sep 2017 10:25:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Thu, 14 Sep 2017 10:25:57 -0700 (PDT)
In-Reply-To: <cf38090a-8608-f44c-132a-4bfaaaf26dd8@windriver.com>
References: <150514745160.18411.12374724192281962975@git.openembedded.org>
	<CA+chaQcO6meQ4kwAdz4sN46=NEY9QrmAUN5pCFbC=hji74tisw@mail.gmail.com>
	<CAC+thW3b_Q8fzxzyAQbVYuD-ESF+9vdARRhw5OqRJeaQW_MYtQ@mail.gmail.com>
	<cf38090a-8608-f44c-132a-4bfaaaf26dd8@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 14 Sep 2017 19:25:57 +0200
Message-ID: <CA+chaQcOcdkbzxAM13ykZY5Hrm0mBkGCXm=C02hpdSAAcCmvTA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Paul Barker <paul@paulbarker.me.uk>,
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
X-List-Received-Date: Thu, 14 Sep 2017 17:25:58 -0000
Content-Type: multipart/alternative; boundary="001a113cfa6acadf50055929918b"

--001a113cfa6acadf50055929918b
Content-Type: text/plain; charset="UTF-8"

Today I've created backup of this broken state with:

OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ mkdir
kernel-bad
OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ cp -ra
work-shared/raspberrypi3-64/
work/raspberrypi3_64-webos-linux/linux-raspberrypi/ kernel-bad

then cleansstate:

OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ bitbake -c
cleansstate virtual/kernel;

and now kernel_configme
OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ bitbake -c
kernel_configme virtual/kernel;

 was successful, create new copy of current state:

OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ mkdir
kernel-ok
OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ cp -ra
work-shared/raspberrypi3-64/
work/raspberrypi3_64-webos-linux/linux-raspberrypi/ kernel-ok

I'm not trying to understand what kern-tools do here and what the
ERROR: [ERROR]: no configuration queue found in outdir (.kernel-meta)
actually meant, but .kernel-meta directories are a bit different:

OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ ls -lah
kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta
kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta
kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta:
total 28K
drwxr-xr-x  4 bitbake bitbake 4.0K Sep 13 13:27 .
drwxr-xr-x 26 bitbake bitbake 4.0K Sep 13 13:27 ..
-rw-r--r--  1 bitbake bitbake    1 Sep 13 13:27 bsp_definition
drwxr-xr-x  3 bitbake bitbake 4.0K Sep 13 13:27 cfg
-rw-r--r--  1 bitbake bitbake  217 Sep 13 13:27 meta-series
drwxr-xr-x  2 bitbake bitbake 4.0K Sep 13 13:27 patches
-rw-r--r--  1 bitbake bitbake   33 Sep 13 13:27 patch.queue
lrwxrwxrwx  1 bitbake bitbake   11 Sep 13 13:27 series -> patch.queue

kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta:
total 40K
drwxr-xr-x  5 bitbake bitbake 4.0K Sep 14 19:05 .
drwxr-xr-x 26 bitbake bitbake 4.0K Sep 14 19:06 ..
-rw-r--r--  1 bitbake bitbake    1 Sep 14 19:05 bsp_definition
drwxr-xr-x  3 bitbake bitbake 4.0K Sep 14 19:05 cfg
-rw-r--r--  1 bitbake bitbake   36 Sep 14 19:05 config.queue
drwxr-xr-x  2 bitbake bitbake 4.0K Sep 14 19:05 configs
-rw-r--r--  1 bitbake bitbake  471 Sep 14 19:05 meta-series
-rw-r--r--  1 bitbake bitbake  113 Sep 14 19:05 non-hardware_frags.txt
drwxr-xr-x  2 bitbake bitbake 4.0K Sep 14 19:05 patches
-rw-r--r--  1 bitbake bitbake   33 Sep 14 19:05 patch.queue
lrwxrwxrwx  1 bitbake bitbake   11 Sep 14 19:05 series -> patch.queue

OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ diff -rq
kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta
kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta
Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/cfg:
merge_config_build.log
Files
kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh
and
kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh
differ
Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta: config.queue
Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta: configs
Files kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/meta-series and
kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/meta-series differ
Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta:
non-hardware_frags.txt

OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ diff -uNr
kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh
kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh
---
kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh
 2017-09-13 13:27:07.190918161 +0200
+++
kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh
2017-09-14 19:05:51.837031790 +0200
@@ -1 +1 @@
-.kernel-meta//patches//./001-luneos-logo.patch
17358b825642f04fbd408395ab844567c2f147ff
+.kernel-meta//patches//./001-luneos-logo.patch
690e156b362c77518ad8e269ccaafa83f9631913
OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ diff -uNr
kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/meta-series
kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/meta-series
--- kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/meta-series
 2017-09-13 13:27:01.331918171 +0200
+++ kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/meta-series
2017-09-14 19:05:50.522031885 +0200
@@ -1,8 +1,10 @@
 #
 # scc v0.8
-# processed: Wed Sep 13 13:27:01 CEST 2017
+# processed: Thu Sep 14 19:05:50 CEST 2017
 #
 # This is a scc output file, do not edit
 #
+# _reloc_dir
/OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi
 # _reloc_dir
/OE/build/owpb/webos-ports/meta-rpi-luneos/recipes-kernel/linux
+kconf
/OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/defconfig
# non-hardware
 patch patches//./001-luneos-logo.patch
OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ cat
kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/config.queue
configs//./defconfig # non-hardware
OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ cat
kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/non-hardware_frags.txt
/OE/build/owpb/webos-ports/tmp-glibc/work-shared/raspberrypi3-64/kernel-source/.kernel-meta/configs//./defconfig

OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ du -hs
kernel-*
2.4G    kernel-bad
793M    kernel-ok


I don't know if it makes any sense to you.

Let me know if you want me to check something or to share both these
directories.

I'm ready to give up and leave this as one-of weirdness in kernel-yocto.

On Wed, Sep 13, 2017 at 2:24 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> On 09/13/2017 02:23 AM, Andrea Galbusera wrote:
>
>> Hi!
>>
>>
>> On Tue, Sep 12, 2017 at 12:58 PM, Martin Jansa <martin.jansa@gmail.com
>> <mailto:martin.jansa@gmail.com>> wrote:
>>
>>     Hi,
>>
>>     I don't see any obvious change in this update which should cause
>>     this, but rebuilding my image for raspberrypi3-64 after this update
>>     (the previous image was built without errors) shows:
>>
>>     NOTE: Running task 417 of 6399
>>     (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/
>> linux/linux-raspberrypi_4.9.bb:do_validate_branches)
>>     NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>>     task do_validate_branches: Started
>>     ....
>>     NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>>     task do_validate_branches: Succeeded
>>     NOTE: Running task 434 of 6399
>>     (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/
>> linux/linux-raspberrypi_4.9.bb:do_kernel_metadata)
>>     NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>>     task do_kernel_metadata: Started
>>     ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>>     do_kernel_metadata: Could not locate BSP definition for
>>     raspberrypi3-64/standard and no defconfig was provided
>>     NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>>     task do_kernel_metadata: Succeeded
>>     ...
>>     NOTE: Running task 454 of 6399
>>     (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/
>> linux/linux-raspberrypi_4.9.bb:do_patch)
>>     NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>>     task do_patch: Started
>>     NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>>     task do_patch: Succeeded
>>     NOTE: Running task 491 of 6399
>>     (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/
>> linux/linux-raspberrypi_4.9.bb:do_kernel_configme)
>>     NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>>     task do_kernel_configme: Started
>>     ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>>     do_kernel_configme: [ERROR]: no configuration queue found in outdir
>>     (.kernel-meta)
>>
>>       scc [--help] [--configs] [--force] [-i] [-w] [--cmds <comma
>>     separated list>] [-o outdir:<meta,cfg,patch>] [-D<var>=<value>]
>>     [-I<path>] [-v] infiles
>>
>>            --help:      This message
>>            --force:     force overwrite output file if it already exists
>>            --cmds:      list of supported commands. If not passed, all
>>     found commands are loaded,
>>                         valid commands are: patch, kconf, branch, define
>>            --configs:   Output the list of compiled configuration
>>     fragments (if available), -o <outdir> is
>>                         used to locate the configuration options
>>            -D:          define <var> to <value> which will be available
>>     to sub scripts
>>            -I:          include path <path> will be searched for files
>>            -i:          leave intermediate files on failure
>>            -w:          only warn on missing files
>>            -v:          verbose output
>>            -o:          output directory and artifacts. artifacts follow
>>     the colon and ar a comma
>>                         separated list of:
>>                             meta:  full meta-series (patches, config,
>>     branches, etc)
>>                             cfg:   configure fragment queue
>>                             patch: patch queue
>>
>>            infiles      files to preprocess, and output into outfile or
>>     stdout
>>     ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>>     do_kernel_configme: Could not find configuration queue
>>     (.kernel-meta/config.queue)
>>     ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>>     do_kernel_configme: Function failed: do_kernel_configme (log file is
>>     located at
>>     /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-
>> webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+
>> 4153f509b4-r0/temp/log.do_kernel_configme.19498)
>>     ERROR: Logfile of failure stored in:
>>     /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-
>> webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+
>> 4153f509b4-r0/temp/log.do_kernel_configme.19498
>>     Log data follows:
>>     | DEBUG: Executing shell function do_kernel_configme
>>     | ERROR: [ERROR]: no configuration queue found in outdir
>> (.kernel-meta)
>>     |
>>     |  scc [--help] [--configs] [--force] [-i] [-w] [--cmds <comma
>>     separated list>] [-o outdir:<meta,cfg,patch>] [-D<var>=<value>]
>>     [-I<path>] [-v] infiles
>>     |
>>     |       --help:      This message
>>     |       --force:     force overwrite output file if it already exists
>>     |       --cmds:      list of supported commands. If not passed, all
>>     found commands are loaded,
>>     |                    valid commands are: patch, kconf, branch, define
>>     |       --configs:   Output the list of compiled configuration
>>     fragments (if available), -o <outdir> is
>>     |                    used to locate the configuration options
>>     |       -D:          define <var> to <value> which will be available
>>     to sub scripts
>>     |       -I:          include path <path> will be searched for files
>>     |       -i:          leave intermediate files on failure
>>     |       -w:          only warn on missing files
>>     |       -v:          verbose output
>>     |       -o:          output directory and artifacts. artifacts
>>     follow the colon and ar a comma
>>     |                    separated list of:
>>     |                        meta:  full meta-series (patches, config,
>>     branches, etc)
>>     |                        cfg:   configure fragment queue
>>     |                        patch: patch queue
>>     |
>>     |       infiles      files to preprocess, and output into outfile or
>>     stdout
>>     | ERROR: Could not find configuration queue
>> (.kernel-meta/config.queue)
>>     | WARNING:
>>     /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-
>> webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+
>> 4153f509b4-r0/temp/run.do_kernel_configme.19498:1
>>     exit 1 from 'exit 1'
>>     | ERROR: Function failed: do_kernel_configme (log file is located at
>>     /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-
>> webos-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+
>> 4153f509b4-r0/temp/log.do_kernel_configme.19498)
>>     NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>>     task do_kernel_configme: Failed
>>     ERROR: Task
>>     (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/
>> linux/linux-raspberrypi_4.9.bb:do_kernel_configme)
>>     failed with exit code '1'
>>     NOTE: Running task 530 of 6399
>>     (/OE/build/owpb/webos-ports/meta-raspberrypi/recipes-kernel/
>> linux/linux-raspberrypi_4.9.bb:do_kernel_version_sanity_check)
>>     NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>>     task do_kernel_version_sanity_check: Started
>>     NOTE: recipe linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0:
>>     task do_kernel_version_sanity_check: Succeeded
>>
>>     I don't know if this is some new regression (the included changes in
>>     last upgrade doesn't look suspicious much) or something which was
>>     already there like race condition in kernel build or bad interaction
>>     between linux-yocto and rm_work.
>>
>>     I'll try to rebuild it after cleansstate after current build is
>>     finished.
>>
>>     +Paul +Andrei if they have seen it with meta-raspberrypi and maybe
>>     it's specific to raspberrypi3-64 or last linux-raspberrypi upgrade.
>>
>>     Looks a bit similar to discussion in:
>>     http://lists.openembedded.org/pipermail/openembedded-core/20
>> 17-August/141097.html
>>     <http://lists.openembedded.org/pipermail/openembedded-core/
>> 2017-August/141097.html>
>>     http://lists.openembedded.org/pipermail/openembedded-core/20
>> 17-August/141304.html
>>     <http://lists.openembedded.org/pipermail/openembedded-core/
>> 2017-August/141304.html>
>>     http://lists.openembedded.org/pipermail/openembedded-core/20
>> 17-August/141323.html
>>     <http://lists.openembedded.org/pipermail/openembedded-core/
>> 2017-August/141323.html>
>>     http://lists.openembedded.org/pipermail/openembedded-core/20
>> 17-August/141329.html
>>     <http://lists.openembedded.org/pipermail/openembedded-core/
>> 2017-August/141329.html>
>>
>>     Regards,
>>
>>     On Mon, Sep 11, 2017 at 6:30 PM, <git@git.openembedded.org
>>     <mailto:git@git.openembedded.org>> wrote:
>>
>>         This is an automated email from the git hooks/post-receive script.
>>
>>         rpurdie pushed a change to branch master
>>         in repository openembedded-core.
>>
>>              from cc319b6  mesa-gl: Fix build after recent mesa
>>         PACKAGECONFIG changes
>>               add 9099cec  oeqa/qemurunner: Improve logging
>>               add 67612dc  qemurunner.py: refactor searching for QEMU PID
>>               add ff98085  pulseaudio: Backport a patch to replace use
>>         of VLAIS
>>               add aa5b9ed  oeqa/selftest: Add missing IDs to various
>>         test cases
>>               add cdb4316  oeqa/selftest/case: Add recipeinc method
>>               new 0a43727  alsa-utils: Do not hardcode path to /lib/udev
>>               new 43b1475  psplash: upgrade to latest git revision
>>               new e4cc1a2  initramfs-framework: split setup-live and
>>         install-efi into separate recipes
>>               new 0fae16b  oeqa: Replace "append +=" with normal "append
>>         =" in layerappend.py
>>               new 87110e9  rootfs: improve postinst intercept logging
>>               new 35ab2c7  insane.bbclass: write QA issues to log file
>>         only when they are in ERROR_QA or WARN_QA
>>               new 40e8a15  gtk-doc.bbclass: add all directories where
>>         .so files are found to library search path
>>               new d0a123e  devtool: status: Sort entries before printing
>>               new 9ff023f  package_deb, ipk: improve subprocess output
>>         on package manager command
>>               new 11350a6  package_[deb|ipk]: improve multiprocess logic
>>         when creating deb/ipk packages
>>               new f2e586e  glibc: add ld.so locks in _libc_fork
>>               new 10a1b29  kernel: Stop using update-alternatives
>>               new 32c9b3d  yocto-compat-layer.py: Fix trace when layers
>>         can't be processed
>>               new 2348dda  psplash: Initialize psplash only if a
>>         framebuffer exists
>>               new ff9f629  sysstat: Add ability to enable lm-sensors
>>               new b591ba6  wic: implement ext fs support for 'wic ls'
>>               new 1a2bc70  wic: implement ext fs support for 'wic cp'
>>               new be530b7  wic: implement ext fs support for 'wic rm'
>>               new fcff05d  wic: update help content
>>               new 6ae3ff9  wic: selftest: add test_wic_ls_ext test case
>>               new 7970907  wic: selftest: add test_wic_cp_ext test case
>>               new 693b555  wic: selftest: add test_wic_rm_ext test case
>>               new 7d2d73b  shared-mime-info: enable nativesdk builds
>>               new 51e4f9c  glib-2.0: recommend shared-mime-info
>>               new 026403c  systemtap: Bump SRCREV for 4.12 Linux kernel
>>         support
>>               new 31f1e5f  python3-pip: extend to nativesdk
>>               new b9f0c54  python3-setuptools: extend to nativesdk
>>               new 1f8dae4  xdg-utils: Add HOMEPAGE info into recipe file.
>>               new 024caf6  bootchart2: update python interpreter
>>               new acc9994  cve-check-tool: change BB_NO_NETWORK error to
>>         a warning
>>               new fa36678  bmap-tools: upgrade to v3.4
>>               new 0d6130b  bmap-tools: switch to Python 3
>>               new 7fca44e  wic: run bmaptool with native Python3
>>               new 1585ed0  texinfo-dummy-native: port to Python 3
>>               new 3014099  glibc: do the multilib_header magic also for
>>         bits/pthreadtypes-arch.h
>>               new 56cf3a0  util-linux: Add HOMEPAGE info into recipe file.
>>               new 818d4a9  iputils: backport patch to fix arping hang
>>         problem
>>               new 1d0c86a  diffutils: Add HOMEPAGE info into recipe file.
>>               new 34cde8e  foomatic: Add HOMEPAGE info into recipe file.
>>               new 6e1f800  subversion: fix CVE-2017-9800
>>               new 1ca7d8d  libfm: remove file which conflicts with
>>         libfm-extra
>>               new e67b40c  scripts/buildhistory-diff: use of argparse
>>         instead of optparse
>>               new b6e72d0  linux-yocto: Make LINUX_VERSION_EXTENSION
>> weaker
>>               new 1a5026d  goarch.bbclass: Stop passing True as second
>>         argument of d.getVar
>>               new 56ce355  go.bbclass: Fix binary installation path
>>         detection
>>               new 26abbf1  go: Remove Go 1.6 and 1.7 releases
>>               new 07b60c1  goarch.bbclass: Replace logic for setting GOARM
>>               new e242e7c  goarch.bbclass: Add support for ARMv5
>>               new d6b8e7e  go.bbclass: Use a global Go build flags
>>               new 7a40ea8  go.bbclass: Enable parallel build
>>               new 0369a99  go.bbclass: exported function cleanup
>>               new 4971362  go.bbclass: Use an auxiliary variable to add
>>         the build dependencies
>>               new c62a083  go.bbclass: separate ${S} and ${B}
>>               new efcf651  go.bbclass: add do_unpack function to handle
>>         common cases
>>               new 9819353  go.bbclass: add GO_INSTALL_FILTEROUT variable
>>               new 79e0401  go-dep: Add 0.3.0 release
>>               new 116d2ea  go-helloworld: Use the Golang examples
>> repository
>>               new 802829f  devtool: upgrade: check that user has
>>         configured git properly
>>               new 2ebbeb6  staging: gracefully abort if two recipes
>>         conflict in the sysroot
>>
>>         The 59 revisions listed above as "new" are entirely new to this
>>         repository and will be described in separate emails.  The
>> revisions
>>         listed as "add" were already present in the repository and have
>> only
>>         been added to this reference.
>>
>>
>>         Summary of changes:
>>           meta/classes/go.bbclass                            | 110 ++++---
>>           meta/classes/goarch.bbclass                        |  27 +-
>>           meta/classes/gtk-doc.bbclass                       |   1 +
>>           meta/classes/insane.bbclass                        |   3 +-
>>           meta/classes/kernel.bbclass                        |  16 +-
>>           meta/classes/package_deb.bbclass                   |  40 ++-
>>           meta/classes/package_ipk.bbclass                   |  40 ++-
>>           meta/classes/staging.bbclass                       |  18 +-
>>           meta/lib/oe/rootfs.py                              |   7 +-
>>           meta/lib/oeqa/selftest/case.py                     |  20 +-
>>           meta/lib/oeqa/selftest/cases/archiver.py           |   3 +-
>>           meta/lib/oeqa/selftest/cases/distrodata.py         |   2 +
>>           meta/lib/oeqa/selftest/cases/imagefeatures.py      |   3 +
>>           meta/lib/oeqa/selftest/cases/layerappend.py        |   2 +-
>>           meta/lib/oeqa/selftest/cases/runcmd.py             |  17 +
>>           meta/lib/oeqa/selftest/cases/wic.py                |  70 ++++
>>           meta/lib/oeqa/utils/qemurunner.py                  | 351
>>         ++++++++++-----------
>>           meta/recipes-core/glib-2.0/glib.inc                |   2 +
>>           meta/recipes-core/glibc/glibc-package.inc          |   2 +-
>>           ...bc-reset-dl-load-write-lock-after-forking.patch |  37 +++
>>           .../0028-Bug-4578-add-ld.so-lock-while-fork.patch  |  57 ++++
>>           meta/recipes-core/glibc/glibc_2.26.bb <http://glibc_2.26.bb>
>>                     |   2 +
>>           .../initrdscripts/initramfs-framework_1.0.bb
>>         <http://initramfs-framework_1.0.bb>       |  20 +-
>>           .../initramfs-module-install-efi_1.0.bb
>>         <http://initramfs-module-install-efi_1.0.bb>            |  18 ++
>>           .../initramfs-module-setup-live_1.0.bb
>>         <http://initramfs-module-setup-live_1.0.bb>             |  18 ++
>>           meta/recipes-core/psplash/files/psplash-init       |   6 +
>>           meta/recipes-core/psplash/psplash_git.bb
>>         <http://psplash_git.bb>           |   2 +-
>>           meta/recipes-core/util-linux/util-linux.inc        |   1 +
>>           .../bootchart2/bootchart2_0.14.8.bb
>>         <http://bootchart2_0.14.8.bb>                |   2 +-
>>           .../cve-check-tool/cve-check-tool_5.6.4.bb
>>         <http://cve-check-tool_5.6.4.bb>         |   2 +-
>>           meta/recipes-devtools/go/go-1.6.inc                |  19 --
>>           .../go/go-1.6/armhf-elf-header.patch               |  23 --
>>           .../go/go-1.6/fix-cc-handling.patch                |  50 ---
>>           .../go/go-1.6/fix-target-cc-for-build.patch        |  17 -
>>           meta/recipes-devtools/go/go-1.6/gotooldir.patch    |  30 --
>>           .../go/go-1.6/split-host-and-target-build.patch    |  63 ----
>>           meta/recipes-devtools/go/go-1.6/syslog.patch       |  62 ----
>>           meta/recipes-devtools/go/go-1.7.inc                |  19 --
>>           .../go/go-1.7/armhf-elf-header.patch               |  23 --
>>           .../go/go-1.7/fix-cc-handling.patch                |  50 ---
>>           .../go/go-1.7/fix-target-cc-for-build.patch        |  17 -
>>           meta/recipes-devtools/go/go-1.7/gotooldir.patch    |  30 --
>>           .../go/go-1.7/split-host-and-target-build.patch    |  62 ----
>>           meta/recipes-devtools/go/go-1.7/syslog.patch       |  62 ----
>>           meta/recipes-devtools/go/go-cross_1.7.bb
>>         <http://go-cross_1.7.bb>           |   5 -
>>           meta/recipes-devtools/go/go-dep_0.3.0.bb
>>         <http://go-dep_0.3.0.bb>           |  18 ++
>>           meta/recipes-devtools/go/go_1.6.bb <http://go_1.6.bb>
>>                |   4 -
>>           meta/recipes-devtools/go/go_1.7.bb <http://go_1.7.bb>
>>                |   2 -
>>           meta/recipes-devtools/python/python3-pip_9.0.1.bb
>>         <http://python3-pip_9.0.1.bb>  |   2 +-
>>           .../python/python3-setuptools_36.2.7.bb
>>         <http://python3-setuptools_36.2.7.bb>            |   7 +-
>>           .../subversion/subversion/CVE-2017-9800.patch      | 136
>> ++++++++
>>           .../subversion/subversion_1.9.6.bb
>>         <http://subversion_1.9.6.bb>                 |   1 +
>>           meta/recipes-extended/diffutils/diffutils.inc      |   1 +
>>           .../foomatic/foomatic-filters_4.0.17.bb
>>         <http://foomatic-filters_4.0.17.bb>            |   1 +
>>           .../go-examples/files/helloworld.go                |  10 -
>>           meta/recipes-extended/go-examples/go-examples.inc  |  10 -
>>           .../go-examples/go-helloworld_0.1.bb
>>         <http://go-helloworld_0.1.bb>               |  24 +-
>>           ...ing-fix-arping-hang-if-SIGALRM-is-blocked.patch |  44 +++
>>           meta/recipes-extended/iputils/iputils_s20151218.bb
>>         <http://iputils_s20151218.bb> |   1 +
>>           meta/recipes-extended/sysstat/sysstat.inc          |   6 +-
>>           .../texinfo-dummy-native/texinfo-dummy/template.py |   4 +-
>>           meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
>>         <http://xdg-utils_1.1.1.bb> |   2 +-
>>           meta/recipes-kernel/linux/linux-dtb.inc            |  36 +--
>>           meta/recipes-kernel/linux/linux-yocto.inc          |   2 +-
>>           ...apbpf-don-t-support-installing-a-non-root.patch |  62 ++++
>>           meta/recipes-kernel/systemtap/systemtap_git.inc    |   5 +-
>>           meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
>>         <http://alsa-utils_1.1.4.bb>   |   4 +-
>>           ...-don-t-use-variable-length-array-in-union.patch |  59 ++++
>>           .../pulseaudio/pulseaudio_10.0.bb <http://pulseaudio_10.0.bb>
>>                         |   1 +
>>           .../{bmap-tools_3.2.bb <http://bmap-tools_3.2.bb> =>
>>         bmap-tools_3.4.bb <http://bmap-tools_3.4.bb>}       |   9 +-
>>           meta/recipes-support/libfm/libfm_1.2.5.bb
>>         <http://libfm_1.2.5.bb>          |   1 +
>>           .../shared-mime-info/shared-mime-info.inc          |   3 +-
>>           scripts/buildhistory-diff                          | 125
>> ++++----
>>           scripts/lib/devtool/standard.py                    |   2 +-
>>           scripts/lib/devtool/upgrade.py                     |  27 +-
>>           scripts/lib/wic/engine.py                          |  55 ++--
>>           scripts/lib/wic/help.py                            |  64 ++--
>>           scripts/lib/wic/plugins/imager/direct.py           |   6 +-
>>           scripts/yocto-compat-layer.py                      |   2 +-
>>           79 files changed, 1137 insertions(+), 1030 deletions(-)
>>           create mode 100644
>>         meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write
>> -lock-after-forking.patch
>>           create mode 100644
>>         meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-w
>> hile-fork.patch
>>           create mode 100644
>>         meta/recipes-core/initrdscripts/initramfs-module-install-
>> efi_1.0.bb
>>         <http://initramfs-module-install-efi_1.0.bb>
>>           create mode 100644
>>         meta/recipes-core/initrdscripts/initramfs-module-setup-live_
>> 1.0.bb
>>         <http://initramfs-module-setup-live_1.0.bb>
>>           delete mode 100644 meta/recipes-devtools/go/go-1.6.inc
>>           delete mode 100644
>>         meta/recipes-devtools/go/go-1.6/armhf-elf-header.patch
>>           delete mode 100644
>>         meta/recipes-devtools/go/go-1.6/fix-cc-handling.patch
>>           delete mode 100644
>>         meta/recipes-devtools/go/go-1.6/fix-target-cc-for-build.patch
>>           delete mode 100644 meta/recipes-devtools/go/go-1.
>> 6/gotooldir.patch
>>           delete mode 100644
>>         meta/recipes-devtools/go/go-1.6/split-host-and-target-build.patch
>>           delete mode 100644 meta/recipes-devtools/go/go-1.6/syslog.patch
>>           delete mode 100644 meta/recipes-devtools/go/go-1.7.inc
>>           delete mode 100644
>>         meta/recipes-devtools/go/go-1.7/armhf-elf-header.patch
>>           delete mode 100644
>>         meta/recipes-devtools/go/go-1.7/fix-cc-handling.patch
>>           delete mode 100644
>>         meta/recipes-devtools/go/go-1.7/fix-target-cc-for-build.patch
>>           delete mode 100644 meta/recipes-devtools/go/go-1.
>> 7/gotooldir.patch
>>           delete mode 100644
>>         meta/recipes-devtools/go/go-1.7/split-host-and-target-build.patch
>>           delete mode 100644 meta/recipes-devtools/go/go-1.7/syslog.patch
>>           delete mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb
>>         <http://go-cross_1.7.bb>
>>           create mode 100644 meta/recipes-devtools/go/go-dep_0.3.0.bb
>>         <http://go-dep_0.3.0.bb>
>>           delete mode 100644 meta/recipes-devtools/go/go_1.6.bb
>>         <http://go_1.6.bb>
>>           delete mode 100644 meta/recipes-devtools/go/go_1.7.bb
>>         <http://go_1.7.bb>
>>           create mode 100644
>>         meta/recipes-devtools/subversion/subversion/CVE-2017-9800.patch
>>           delete mode 100644
>>         meta/recipes-extended/go-examples/files/helloworld.go
>>           delete mode 100644
>>         meta/recipes-extended/go-examples/go-examples.inc
>>           create mode 100644
>>         meta/recipes-extended/iputils/files/arping-fix-arping-hang-i
>> f-SIGALRM-is-blocked.patch
>>           create mode 100644
>>         meta/recipes-kernel/systemtap/systemtap/0001-staprun-stapbpf
>> -don-t-support-installing-a-non-root.patch
>>           create mode 100644
>>         meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-
>> discuss-iochannel-don-t-use-variable-length-array-in-union.patch
>>           rename meta/recipes-support/bmap-tools/{bmap-tools_3.2.bb
>>         <http://bmap-tools_3.2.bb> => bmap-tools_3.4.bb
>>         <http://bmap-tools_3.4.bb>} (79%)
>>
>>         --
>>         To stop receiving notification emails like this one, please
>> contact
>>         the administrator of this repository.
>>         --
>>         _______________________________________________
>>         Openembedded-commits mailing list
>>         Openembedded-commits@lists.openembedded.org
>>         <mailto:Openembedded-commits@lists.openembedded.org>
>>         http://lists.openembedded.org/mailman/listinfo/openembedded-
>> commits
>>         <http://lists.openembedded.org/mailman/listinfo/openembedded
>> -commits>
>>
>>
>>
>>     --
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>
>> Across a similar update on master I noticed a possibly related glitch
>> while building config attached below. Here linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4
>> complained with:
>>
>> ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>> do_kernel_metadata: Could not locate BSP definition for
>> raspberrypi3-64/standard and no defconfig was provided
>>
>> Surprisingly enough this wasn't marked as a failed build indeed. Next
>> builds did not trigger any error either. Not tried yet any sort of cleaning
>> for the recipe. Didn't report it immediately since, as you can see from my
>> layers revisions, I was meantime upgrading to latest master and testing
>> Paul's work for fixing build for 64bit kernel when u-boot is used to boot
>> the RPi. FWIW I don't have rm_work enabled on these builds.
>>
>
> Interesting.
>
> It definitely sounds like something is racing, that previously
> didn't .. or was much better hidden.
>
> I had the rpi3 on a continuous build loop yesterday and didn't
> trigger the error here.
>
> I'll continue my builds and have another look to see what could
> possibly be racing in the tasks.
>
> If anyone does make this happen reproducibly, let me know and
> I'll switch my config to debug.
>
> Bruce
>
>
>
>> I'm aware that the same error was triggered by a recent issue that
>> prevented the build to continue and was fixed by poky commit
>> fa664b1bba3ef8256083f4e52cafd0985d924586 (From OE-Core rev:
>> 156cf9e25f875a50f907e570d9b62cbc2c051133).
>>
>> Here is the configuration that "sort of" failed:
>>
>> Build Configuration:
>> BB_VERSION        = "1.35.0"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "universal"
>> TARGET_SYS        = "aarch64-poky-linux"
>> MACHINE           = "raspberrypi3-64"
>> DISTRO            = "poky"
>> DISTRO_VERSION    = "2.3+snapshot-20170912"
>> TUNE_FEATURES     = "aarch64"
>> TARGET_FPU        = ""
>> meta
>> meta-poky
>> meta-yocto-bsp    = "HEAD:e3a69364eb1fdbf1dcb98a04b3ddfc8f9841a7fa"
>> meta-oe
>> meta-python
>> meta-networking   = "HEAD:d9f7ef40d74659a0348248841efadaf120d52c30"
>> meta-raspberrypi  = "pbarker/kernel:a01be8b3cf4af9
>> bcd0c01a5b0af3b9c7a2c2b756"
>>
>> Initialising tasks: 100% |#############################
>> ####################################| Time: 0:00:12
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> ERROR: linux-raspberrypi-1_4.9.41+gitAUTOINC+4153f509b4-r0
>> do_kernel_metadata: Could not locate BSP definition for
>> raspberrypi3-64/standard and no defconfig was provided
>> NOTE: Tasks Summary: Attempted 4887 tasks of which 2194 didn't need to be
>> rerun and all succeeded.
>> NOTE: Writing buildhistory
>>
>>
>

--001a113cfa6acadf50055929918b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Today I&#39;ve created backup of this broken state with:<d=
iv><br></div><div>OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-gl=
ibc $ mkdir kernel-bad<br></div><div>OE raspberrypi3-64@luneos ~/build/owpb=
/webos-ports/tmp-glibc $ cp -ra work-shared/raspberrypi3-64/ work/raspberry=
pi3_64-webos-linux/linux-raspberrypi/ kernel-bad<br></div><div><br></div><d=
iv>then cleansstate:</div><div><br></div><div>OE raspberrypi3-64@luneos ~/b=
uild/owpb/webos-ports/tmp-glibc $ bitbake -c cleansstate virtual/kernel;<br=
></div><div><br></div><div>and now kernel_configme</div><div>OE raspberrypi=
3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ bitbake -c kernel_configme=
 virtual/kernel;<br></div><div><br></div><div>=C2=A0was successful, create =
new copy of current state:<br></div><div><br></div><div><div>OE raspberrypi=
3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ mkdir kernel-ok<br></div><=
div>OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ cp -ra w=
ork-shared/raspberrypi3-64/ work/raspberrypi3_64-webos-linux/linux-raspberr=
ypi/ kernel-ok</div></div><div><br></div><div>I&#39;m not trying to underst=
and what kern-tools do here and what the</div><div><span style=3D"font-size=
:12.8px">ERROR: [ERROR]: no configuration queue found in outdir (.kernel-me=
ta)</span><br></div><div><span style=3D"font-size:12.8px">actually meant, b=
ut .kernel-meta directories are a bit different:</span></div><div><span sty=
le=3D"font-size:12.8px"><br></span></div><div><div>OE raspberrypi3-64@luneo=
s ~/build/owpb/webos-ports/tmp-glibc $ ls -lah kernel-bad/raspberrypi3-64/k=
ernel-source/.kernel-meta kernel-ok/raspberrypi3-64/kernel-source/.kernel-m=
eta</div><div>kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta:</div><=
div>total 28K</div><div>drwxr-xr-x=C2=A0 4 bitbake bitbake 4.0K Sep 13 13:2=
7 .</div><div>drwxr-xr-x 26 bitbake bitbake 4.0K Sep 13 13:27 ..</div><div>=
-rw-r--r--=C2=A0 1 bitbake bitbake=C2=A0 =C2=A0 1 Sep 13 13:27 bsp_definiti=
on</div><div>drwxr-xr-x=C2=A0 3 bitbake bitbake 4.0K Sep 13 13:27 cfg</div>=
<div>-rw-r--r--=C2=A0 1 bitbake bitbake=C2=A0 217 Sep 13 13:27 meta-series<=
/div><div>drwxr-xr-x=C2=A0 2 bitbake bitbake 4.0K Sep 13 13:27 patches</div=
><div>-rw-r--r--=C2=A0 1 bitbake bitbake=C2=A0 =C2=A033 Sep 13 13:27 patch.=
queue</div><div>lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A011 Sep 13 13=
:27 series -&gt; patch.queue</div><div><br></div><div>kernel-ok/raspberrypi=
3-64/kernel-source/.kernel-meta:</div><div>total 40K</div><div>drwxr-xr-x=
=C2=A0 5 bitbake bitbake 4.0K Sep 14 19:05 .</div><div>drwxr-xr-x 26 bitbak=
e bitbake 4.0K Sep 14 19:06 ..</div><div>-rw-r--r--=C2=A0 1 bitbake bitbake=
=C2=A0 =C2=A0 1 Sep 14 19:05 bsp_definition</div><div>drwxr-xr-x=C2=A0 3 bi=
tbake bitbake 4.0K Sep 14 19:05 cfg</div><div>-rw-r--r--=C2=A0 1 bitbake bi=
tbake=C2=A0 =C2=A036 Sep 14 19:05 config.queue</div><div>drwxr-xr-x=C2=A0 2=
 bitbake bitbake 4.0K Sep 14 19:05 configs</div><div>-rw-r--r--=C2=A0 1 bit=
bake bitbake=C2=A0 471 Sep 14 19:05 meta-series</div><div>-rw-r--r--=C2=A0 =
1 bitbake bitbake=C2=A0 113 Sep 14 19:05 non-hardware_frags.txt</div><div>d=
rwxr-xr-x=C2=A0 2 bitbake bitbake 4.0K Sep 14 19:05 patches</div><div>-rw-r=
--r--=C2=A0 1 bitbake bitbake=C2=A0 =C2=A033 Sep 14 19:05 patch.queue</div>=
<div>lrwxrwxrwx=C2=A0 1 bitbake bitbake=C2=A0 =C2=A011 Sep 14 19:05 series =
-&gt; patch.queue</div></div><div><br></div><div><div>OE raspberrypi3-64@lu=
neos ~/build/owpb/webos-ports/tmp-glibc $ diff -rq kernel-bad/raspberrypi3-=
64/kernel-source/.kernel-meta kernel-ok/raspberrypi3-64/kernel-source/.kern=
el-meta</div><div>Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-m=
eta/cfg: merge_config_build.log</div><div>Files kernel-bad/raspberrypi3-64/=
kernel-source/.kernel-meta/cfg/scratch/refresh and kernel-ok/raspberrypi3-6=
4/kernel-source/.kernel-meta/cfg/scratch/refresh differ</div><div>Only in k=
ernel-ok/raspberrypi3-64/kernel-source/.kernel-meta: config.queue</div><div=
>Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta: configs</div=
><div>Files kernel-bad/raspberrypi3-64/kernel-source/.kernel-meta/meta-seri=
es and kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/meta-series dif=
fer</div><div>Only in kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta:=
 non-hardware_frags.txt</div></div><div><br></div><div><div>OE raspberrypi3=
-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ diff -uNr kernel-bad/raspbe=
rrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh kernel-ok/raspberr=
ypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh</div><div>--- kernel=
-bad/raspberrypi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh=C2=A0 =
=C2=A02017-09-13 13:27:07.190918161 +0200</div><div>+++ kernel-ok/raspberry=
pi3-64/kernel-source/.kernel-meta/cfg/scratch/refresh=C2=A0 =C2=A0 2017-09-=
14 19:05:51.837031790 +0200</div><div>@@ -1 +1 @@</div><div>-.kernel-meta//=
patches//./001-luneos-logo.patch 17358b825642f04fbd408395ab844567c2f147ff</=
div><div>+.kernel-meta//patches//./001-luneos-logo.patch 690e156b362c77518a=
d8e269ccaafa83f9631913</div><div>OE raspberrypi3-64@luneos ~/build/owpb/web=
os-ports/tmp-glibc $ diff -uNr kernel-bad/raspberrypi3-64/kernel-source/.ke=
rnel-meta/meta-series kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/=
meta-series</div><div>--- kernel-bad/raspberrypi3-64/kernel-source/.kernel-=
meta/meta-series=C2=A0 =C2=A02017-09-13 13:27:01.331918171 +0200</div><div>=
+++ kernel-ok/raspberrypi3-64/kernel-source/.kernel-meta/meta-series=C2=A0 =
=C2=A0 2017-09-14 19:05:50.522031885 +0200</div><div>@@ -1,8 +1,10 @@</div>=
<div>=C2=A0#</div><div>=C2=A0# scc v0.8</div><div>-# processed: Wed Sep 13 =
13:27:01 CEST 2017</div><div>+# processed: Thu Sep 14 19:05:50 CEST 2017</d=
iv><div>=C2=A0#</div><div>=C2=A0# This is a scc output file, do not edit</d=
iv><div>=C2=A0#</div><div>+# _reloc_dir /OE/build/owpb/webos-ports/tmp-glib=
c/work/raspberrypi3_64-webos-linux/linux-raspberrypi</div><div>=C2=A0# _rel=
oc_dir /OE/build/owpb/webos-ports/meta-rpi-luneos/recipes-kernel/linux</div=
><div>+kconf /OE/build/owpb/webos-ports/tmp-glibc/work/raspberrypi3_64-webo=
s-linux/linux-raspberrypi/1_4.9.41+gitAUTOINC+4153f509b4-r0/defconfig # non=
-hardware</div><div>=C2=A0patch patches//./001-luneos-logo.patch</div><div>=
OE raspberrypi3-64@luneos ~/build/owpb/webos-ports/tmp-glibc $ cat kernel-o=
k/raspberrypi3-64/kernel-source/.kernel-meta/config.queue=C2=A0</div><div>c=
onfigs//./defconfig # non-hardware</div><div>OE raspberrypi3-64@luneos ~/bu=
ild/owpb/webos-ports/tmp-glibc $ cat kernel-ok/raspberrypi3-64/kernel-sourc=
e/.kernel-meta/non-hardware_frags.txt=C2=A0</div><div>/OE/build/owpb/webos-=
ports/tmp-glibc/work-shared/raspberrypi3-64/kernel-source/.kernel-meta/conf=
igs//./defconfig</div></div><div><br></div><div><div>OE raspberrypi3-64@lun=
eos ~/build/owpb/webos-ports/tmp-glibc $ du -hs kernel-*</div><div>2.4G=C2=
=A0 =C2=A0 kernel-bad</div><div>793M=C2=A0 =C2=A0 kernel-ok</div></div><div=
><br></div><div><br></div><div>I don&#39;t know if it makes any sense to yo=
u.</div><div><br></div><div>Let me know if you want me to check something o=
r to share both these directories.</div><div><br></div><div>I&#39;m ready t=
o give up and leave this as one-of weirdness in kernel-yocto.=C2=A0</div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Sep 1=
3, 2017 at 2:24 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:=
bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">=
On 09/13/2017 02:23 AM, Andrea Galbusera wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
Hi!<div><div class=3D"h5"><br>
<br>
On Tue, Sep 12, 2017 at 12:58 PM, Martin Jansa &lt;<a href=3D"mailto:martin=
.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gma=
il.com</a><wbr>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Hi,<br>
<br>
=C2=A0 =C2=A0 I don&#39;t see any obvious change in this update which shoul=
d cause<br>
=C2=A0 =C2=A0 this, but rebuilding my image for raspberrypi3-64 after this =
update<br>
=C2=A0 =C2=A0 (the previous image was built without errors) shows:<br>
<br>
=C2=A0 =C2=A0 NOTE: Running task 417 of 6399<br>
=C2=A0 =C2=A0 (/OE/build/owpb/webos-ports/me<wbr>ta-raspberrypi/recipes-ker=
nel/<wbr>linux/linux-raspberrypi_4.9.<wbr>bb:do_validate_branches)<br>
=C2=A0 =C2=A0 NOTE: recipe linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f=
509b4-r0:<br>
=C2=A0 =C2=A0 task do_validate_branches: Started<br>
=C2=A0 =C2=A0 ....<br>
=C2=A0 =C2=A0 NOTE: recipe linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f=
509b4-r0:<br>
=C2=A0 =C2=A0 task do_validate_branches: Succeeded<br>
=C2=A0 =C2=A0 NOTE: Running task 434 of 6399<br>
=C2=A0 =C2=A0 (/OE/build/owpb/webos-ports/me<wbr>ta-raspberrypi/recipes-ker=
nel/<wbr>linux/linux-raspberrypi_4.9.<wbr>bb:do_kernel_metadata)<br>
=C2=A0 =C2=A0 NOTE: recipe linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f=
509b4-r0:<br>
=C2=A0 =C2=A0 task do_kernel_metadata: Started<br>
=C2=A0 =C2=A0 ERROR: linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f509b4-=
r0<br>
=C2=A0 =C2=A0 do_kernel_metadata: Could not locate BSP definition for<br>
=C2=A0 =C2=A0 raspberrypi3-64/standard and no defconfig was provided<br>
=C2=A0 =C2=A0 NOTE: recipe linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f=
509b4-r0:<br>
=C2=A0 =C2=A0 task do_kernel_metadata: Succeeded<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 NOTE: Running task 454 of 6399<br>
=C2=A0 =C2=A0 (/OE/build/owpb/webos-ports/me<wbr>ta-raspberrypi/recipes-ker=
nel/<wbr>linux/linux-raspberrypi_4.9.<wbr>bb:do_patch)<br>
=C2=A0 =C2=A0 NOTE: recipe linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f=
509b4-r0:<br>
=C2=A0 =C2=A0 task do_patch: Started<br>
=C2=A0 =C2=A0 NOTE: recipe linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f=
509b4-r0:<br>
=C2=A0 =C2=A0 task do_patch: Succeeded<br>
=C2=A0 =C2=A0 NOTE: Running task 491 of 6399<br>
=C2=A0 =C2=A0 (/OE/build/owpb/webos-ports/me<wbr>ta-raspberrypi/recipes-ker=
nel/<wbr>linux/linux-raspberrypi_4.9.<wbr>bb:do_kernel_configme)<br>
=C2=A0 =C2=A0 NOTE: recipe linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f=
509b4-r0:<br>
=C2=A0 =C2=A0 task do_kernel_configme: Started<br>
=C2=A0 =C2=A0 ERROR: linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f509b4-=
r0<br>
=C2=A0 =C2=A0 do_kernel_configme: [ERROR]: no configuration queue found in =
outdir<br>
=C2=A0 =C2=A0 (.kernel-meta)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 scc [--help] [--configs] [--force] [-i] [-w] [--cmds &=
lt;comma<br>
=C2=A0 =C2=A0 separated list&gt;] [-o outdir:&lt;meta,cfg,patch&gt;] [-D&lt=
;var&gt;=3D&lt;value&gt;]<br>
=C2=A0 =C2=A0 [-I&lt;path&gt;] [-v] infiles<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--help:=C2=A0 =C2=A0 =C2=A0 This m=
essage<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--force:=C2=A0 =C2=A0 =C2=A0force =
overwrite output file if it already exists<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--cmds:=C2=A0 =C2=A0 =C2=A0 list o=
f supported commands. If not passed, all<br>
=C2=A0 =C2=A0 found commands are loaded,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 valid commands are: patch, kconf, branch, define<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--configs:=C2=A0 =C2=A0Output the =
list of compiled configuration<br>
=C2=A0 =C2=A0 fragments (if available), -o &lt;outdir&gt; is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 used to locate the configuration options<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-D:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 define &lt;var&gt; to &lt;value&gt; which will be available<br>
=C2=A0 =C2=A0 to sub scripts<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-I:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 include path &lt;path&gt; will be searched for files<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-i:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 leave intermediate files on failure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-w:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 only warn on missing files<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-v:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 verbose output<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 output directory and artifacts. artifacts follow<br>
=C2=A0 =C2=A0 the colon and ar a comma<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 separated list of:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 meta:=C2=A0 full meta-series (patches, config,<br>
=C2=A0 =C2=A0 branches, etc)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cfg:=C2=A0 =C2=A0configure fragment queue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 patch: patch queue<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infiles=C2=A0 =C2=A0 =C2=A0 files =
to preprocess, and output into outfile or<br>
=C2=A0 =C2=A0 stdout<br>
=C2=A0 =C2=A0 ERROR: linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f509b4-=
r0<br>
=C2=A0 =C2=A0 do_kernel_configme: Could not find configuration queue<br>
=C2=A0 =C2=A0 (.kernel-meta/config.queue)<br>
=C2=A0 =C2=A0 ERROR: linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f509b4-=
r0<br>
=C2=A0 =C2=A0 do_kernel_configme: Function failed: do_kernel_configme (log =
file is<br>
=C2=A0 =C2=A0 located at<br>
=C2=A0 =C2=A0 /OE/build/owpb/webos-ports/tmp<wbr>-glibc/work/raspberrypi3_6=
4-<wbr>webos-linux/linux-raspberrypi/<wbr>1_4.9.41+gitAUTOINC+<wbr>4153f509=
b4-r0/temp/log.do_<wbr>kernel_configme.19498)<br>
=C2=A0 =C2=A0 ERROR: Logfile of failure stored in:<br>
=C2=A0 =C2=A0 /OE/build/owpb/webos-ports/tmp<wbr>-glibc/work/raspberrypi3_6=
4-<wbr>webos-linux/linux-raspberrypi/<wbr>1_4.9.41+gitAUTOINC+<wbr>4153f509=
b4-r0/temp/log.do_<wbr>kernel_configme.19498<br>
=C2=A0 =C2=A0 Log data follows:<br>
=C2=A0 =C2=A0 | DEBUG: Executing shell function do_kernel_configme<br>
=C2=A0 =C2=A0 | ERROR: [ERROR]: no configuration queue found in outdir (.ke=
rnel-meta)<br>
=C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 |=C2=A0 scc [--help] [--configs] [--force] [-i] [-w] [--cmds =
&lt;comma<br>
=C2=A0 =C2=A0 separated list&gt;] [-o outdir:&lt;meta,cfg,patch&gt;] [-D&lt=
;var&gt;=3D&lt;value&gt;]<br>
=C2=A0 =C2=A0 [-I&lt;path&gt;] [-v] infiles<br>
=C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0--help:=C2=A0 =C2=A0 =C2=A0 This =
message<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0--force:=C2=A0 =C2=A0 =C2=A0force=
 overwrite output file if it already exists<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0--cmds:=C2=A0 =C2=A0 =C2=A0 list =
of supported commands. If not passed, all<br>
=C2=A0 =C2=A0 found commands are loaded,<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 valid commands are: patch, kconf, branch, define<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0--configs:=C2=A0 =C2=A0Output the=
 list of compiled configuration<br>
=C2=A0 =C2=A0 fragments (if available), -o &lt;outdir&gt; is<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 used to locate the configuration options<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0-D:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 define &lt;var&gt; to &lt;value&gt; which will be available<br>
=C2=A0 =C2=A0 to sub scripts<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0-I:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 include path &lt;path&gt; will be searched for files<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0-i:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 leave intermediate files on failure<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0-w:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 only warn on missing files<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0-v:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 verbose output<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0-o:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 output directory and artifacts. artifacts<br>
=C2=A0 =C2=A0 follow the colon and ar a comma<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 separated list of:<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 meta:=C2=A0 full meta-series (patches, config,<br>
=C2=A0 =C2=A0 branches, etc)<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cfg:=C2=A0 =C2=A0configure fragment queue<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 patch: patch queue<br>
=C2=A0 =C2=A0 |<br>
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0infiles=C2=A0 =C2=A0 =C2=A0 files=
 to preprocess, and output into outfile or<br>
=C2=A0 =C2=A0 stdout<br>
=C2=A0 =C2=A0 | ERROR: Could not find configuration queue (.kernel-meta/con=
fig.queue)<br>
=C2=A0 =C2=A0 | WARNING:<br>
=C2=A0 =C2=A0 /OE/build/owpb/webos-ports/tmp<wbr>-glibc/work/raspberrypi3_6=
4-<wbr>webos-linux/linux-raspberrypi/<wbr>1_4.9.41+gitAUTOINC+<wbr>4153f509=
b4-r0/temp/run.do_<wbr>kernel_configme.19498:1<br>
=C2=A0 =C2=A0 exit 1 from &#39;exit 1&#39;<br>
=C2=A0 =C2=A0 | ERROR: Function failed: do_kernel_configme (log file is loc=
ated at<br>
=C2=A0 =C2=A0 /OE/build/owpb/webos-ports/tmp<wbr>-glibc/work/raspberrypi3_6=
4-<wbr>webos-linux/linux-raspberrypi/<wbr>1_4.9.41+gitAUTOINC+<wbr>4153f509=
b4-r0/temp/log.do_<wbr>kernel_configme.19498)<br>
=C2=A0 =C2=A0 NOTE: recipe linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f=
509b4-r0:<br>
=C2=A0 =C2=A0 task do_kernel_configme: Failed<br>
=C2=A0 =C2=A0 ERROR: Task<br>
=C2=A0 =C2=A0 (/OE/build/owpb/webos-ports/me<wbr>ta-raspberrypi/recipes-ker=
nel/<wbr>linux/linux-raspberrypi_4.9.<wbr>bb:do_kernel_configme)<br>
=C2=A0 =C2=A0 failed with exit code &#39;1&#39;<br>
=C2=A0 =C2=A0 NOTE: Running task 530 of 6399<br>
=C2=A0 =C2=A0 (/OE/build/owpb/webos-ports/me<wbr>ta-raspberrypi/recipes-ker=
nel/<wbr>linux/linux-raspberrypi_4.9.<wbr>bb:do_kernel_version_sanity_<wbr>=
check)<br>
=C2=A0 =C2=A0 NOTE: recipe linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f=
509b4-r0:<br>
=C2=A0 =C2=A0 task do_kernel_version_sanity_check<wbr>: Started<br>
=C2=A0 =C2=A0 NOTE: recipe linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f=
509b4-r0:<br>
=C2=A0 =C2=A0 task do_kernel_version_sanity_check<wbr>: Succeeded<br>
<br>
=C2=A0 =C2=A0 I don&#39;t know if this is some new regression (the included=
 changes in<br>
=C2=A0 =C2=A0 last upgrade doesn&#39;t look suspicious much) or something w=
hich was<br>
=C2=A0 =C2=A0 already there like race condition in kernel build or bad inte=
raction<br>
=C2=A0 =C2=A0 between linux-yocto and rm_work.<br>
<br>
=C2=A0 =C2=A0 I&#39;ll try to rebuild it after cleansstate after current bu=
ild is<br>
=C2=A0 =C2=A0 finished.<br>
<br>
=C2=A0 =C2=A0 +Paul +Andrei if they have seen it with meta-raspberrypi and =
maybe<br>
=C2=A0 =C2=A0 it&#39;s specific to raspberrypi3-64 or last linux-raspberryp=
i upgrade.<br>
<br>
=C2=A0 =C2=A0 Looks a bit similar to discussion in:<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedd=
ed-core/2017-August/141097.html" rel=3D"noreferrer" target=3D"_blank">http:=
//lists.openembedded.org/<wbr>pipermail/openembedded-core/20<wbr>17-August/=
141097.html</a><br></div></div>
=C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/pipermail/openem=
bedded-core/2017-August/141097.html" rel=3D"noreferrer" target=3D"_blank">h=
ttp://lists.openembedded.org<wbr>/pipermail/openembedded-core/<wbr>2017-Aug=
ust/141097.html</a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedd=
ed-core/2017-August/141304.html" rel=3D"noreferrer" target=3D"_blank">http:=
//lists.openembedded.org/<wbr>pipermail/openembedded-core/20<wbr>17-August/=
141304.html</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/pipermail/openem=
bedded-core/2017-August/141304.html" rel=3D"noreferrer" target=3D"_blank">h=
ttp://lists.openembedded.org<wbr>/pipermail/openembedded-core/<wbr>2017-Aug=
ust/141304.html</a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedd=
ed-core/2017-August/141323.html" rel=3D"noreferrer" target=3D"_blank">http:=
//lists.openembedded.org/<wbr>pipermail/openembedded-core/20<wbr>17-August/=
141323.html</a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/pipermail/openem=
bedded-core/2017-August/141323.html" rel=3D"noreferrer" target=3D"_blank">h=
ttp://lists.openembedded.org<wbr>/pipermail/openembedded-core/<wbr>2017-Aug=
ust/141323.html</a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedd=
ed-core/2017-August/141329.html" rel=3D"noreferrer" target=3D"_blank">http:=
//lists.openembedded.org/<wbr>pipermail/openembedded-core/20<wbr>17-August/=
141329.html</a><span class=3D""><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/pipermail/openem=
bedded-core/2017-August/141329.html" rel=3D"noreferrer" target=3D"_blank">h=
ttp://lists.openembedded.org<wbr>/pipermail/openembedded-core/<wbr>2017-Aug=
ust/141329.html</a>&gt;<br>
<br>
=C2=A0 =C2=A0 Regards,<br>
<br>
=C2=A0 =C2=A0 On Mon, Sep 11, 2017 at 6:30 PM, &lt;<a href=3D"mailto:git@gi=
t.openembedded.org" target=3D"_blank">git@git.openembedded.org</a><br></spa=
n><div><div class=3D"h5">
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:git@git.openembedded.org" target=
=3D"_blank">git@git.openembedded.o<wbr>rg</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 This is an automated email from the git hooks/p=
ost-receive script.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpurdie pushed a change to branch master<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 in repository openembedded-core.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from cc319b6=C2=A0 mesa-gl:=
 Fix build after recent mesa<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKAGECONFIG changes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add 9099cec=C2=A0 oeqa/qem=
urunner: Improve logging<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add 67612dc=C2=A0 qemurunn=
er.py: refactor searching for QEMU PID<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add ff98085=C2=A0 pulseaud=
io: Backport a patch to replace use<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of VLAIS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add aa5b9ed=C2=A0 oeqa/sel=
ftest: Add missing IDs to various<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 test cases<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add cdb4316=C2=A0 oeqa/sel=
ftest/case: Add recipeinc method<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 0a43727=C2=A0 alsa-uti=
ls: Do not hardcode path to /lib/udev<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 43b1475=C2=A0 psplash:=
 upgrade to latest git revision<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new e4cc1a2=C2=A0 initramf=
s-framework: split setup-live and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install-efi into separate recipes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 0fae16b=C2=A0 oeqa: Re=
place &quot;append +=3D&quot; with normal &quot;append<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D&quot; in layerappend.py<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 87110e9=C2=A0 rootfs: =
improve postinst intercept logging<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 35ab2c7=C2=A0 insane.b=
bclass: write QA issues to log file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 only when they are in ERROR_QA or WARN_QA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 40e8a15=C2=A0 gtk-doc.=
bbclass: add all directories where<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .so files are found to library search path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new d0a123e=C2=A0 devtool:=
 status: Sort entries before printing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 9ff023f=C2=A0 package_=
deb, ipk: improve subprocess output<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 on package manager command<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 11350a6=C2=A0 package_=
[deb|ipk]: improve multiprocess logic<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 when creating deb/ipk packages<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new f2e586e=C2=A0 glibc: a=
dd ld.so locks in _libc_fork<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 10a1b29=C2=A0 kernel: =
Stop using update-alternatives<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 32c9b3d=C2=A0 yocto-co=
mpat-layer.py: Fix trace when layers<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 can&#39;t be processed<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 2348dda=C2=A0 psplash:=
 Initialize psplash only if a<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 framebuffer exists<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new ff9f629=C2=A0 sysstat:=
 Add ability to enable lm-sensors<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new b591ba6=C2=A0 wic: imp=
lement ext fs support for &#39;wic ls&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 1a2bc70=C2=A0 wic: imp=
lement ext fs support for &#39;wic cp&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new be530b7=C2=A0 wic: imp=
lement ext fs support for &#39;wic rm&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new fcff05d=C2=A0 wic: upd=
ate help content<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 6ae3ff9=C2=A0 wic: sel=
ftest: add test_wic_ls_ext test case<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 7970907=C2=A0 wic: sel=
ftest: add test_wic_cp_ext test case<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 693b555=C2=A0 wic: sel=
ftest: add test_wic_rm_ext test case<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 7d2d73b=C2=A0 shared-m=
ime-info: enable nativesdk builds<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 51e4f9c=C2=A0 glib-2.0=
: recommend shared-mime-info<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 026403c=C2=A0 systemta=
p: Bump SRCREV for 4.12 Linux kernel<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 support<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 31f1e5f=C2=A0 python3-=
pip: extend to nativesdk<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new b9f0c54=C2=A0 python3-=
setuptools: extend to nativesdk<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 1f8dae4=C2=A0 xdg-util=
s: Add HOMEPAGE info into recipe file.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 024caf6=C2=A0 bootchar=
t2: update python interpreter<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new acc9994=C2=A0 cve-chec=
k-tool: change BB_NO_NETWORK error to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 a warning<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new fa36678=C2=A0 bmap-too=
ls: upgrade to v3.4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 0d6130b=C2=A0 bmap-too=
ls: switch to Python 3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 7fca44e=C2=A0 wic: run=
 bmaptool with native Python3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 1585ed0=C2=A0 texinfo-=
dummy-native: port to Python 3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 3014099=C2=A0 glibc: d=
o the multilib_header magic also for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bits/pthreadtypes-arch.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 56cf3a0=C2=A0 util-lin=
ux: Add HOMEPAGE info into recipe file.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 818d4a9=C2=A0 iputils:=
 backport patch to fix arping hang<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 problem<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 1d0c86a=C2=A0 diffutil=
s: Add HOMEPAGE info into recipe file.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 34cde8e=C2=A0 foomatic=
: Add HOMEPAGE info into recipe file.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 6e1f800=C2=A0 subversi=
on: fix CVE-2017-9800<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 1ca7d8d=C2=A0 libfm: r=
emove file which conflicts with<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libfm-extra<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new e67b40c=C2=A0 scripts/=
buildhistory-diff: use of argparse<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 instead of optparse<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new b6e72d0=C2=A0 linux-yo=
cto: Make LINUX_VERSION_EXTENSION weaker<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 1a5026d=C2=A0 goarch.b=
bclass: Stop passing True as second<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 argument of d.getVar<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 56ce355=C2=A0 go.bbcla=
ss: Fix binary installation path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 detection<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 26abbf1=C2=A0 go: Remo=
ve Go 1.6 and 1.7 releases<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 07b60c1=C2=A0 goarch.b=
bclass: Replace logic for setting GOARM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new e242e7c=C2=A0 goarch.b=
bclass: Add support for ARMv5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new d6b8e7e=C2=A0 go.bbcla=
ss: Use a global Go build flags<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 7a40ea8=C2=A0 go.bbcla=
ss: Enable parallel build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 0369a99=C2=A0 go.bbcla=
ss: exported function cleanup<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 4971362=C2=A0 go.bbcla=
ss: Use an auxiliary variable to add<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 the build dependencies<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new c62a083=C2=A0 go.bbcla=
ss: separate ${S} and ${B}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new efcf651=C2=A0 go.bbcla=
ss: add do_unpack function to handle<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 common cases<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 9819353=C2=A0 go.bbcla=
ss: add GO_INSTALL_FILTEROUT variable<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 79e0401=C2=A0 go-dep: =
Add 0.3.0 release<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 116d2ea=C2=A0 go-hello=
world: Use the Golang examples repository<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 802829f=C2=A0 devtool:=
 upgrade: check that user has<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 configured git properly<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new 2ebbeb6=C2=A0 staging:=
 gracefully abort if two recipes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 conflict in the sysroot<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 The 59 revisions listed above as &quot;new&quot=
; are entirely new to this<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 repository and will be described in separate em=
ails.=C2=A0 The revisions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 listed as &quot;add&quot; were already present =
in the repository and have only<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 been added to this reference.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary of changes:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/classes/go.bbclass=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 110 ++++---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/classes/goarch.bbclass=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 27 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/classes/gtk-doc.bbclass=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/classes/insane.bbclass=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 16 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/classes/package_deb.bbcla<wbr>ss=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4=
0 ++-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/classes/package_ipk.bbcla<wbr>ss=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4=
0 ++-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/classes/staging.bbclass=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 18 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/lib/oe/rootfs.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/lib/oeqa/selftest/case.<wbr>py=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 20 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/lib/oeqa/selftest/cases/a<wbr>rchiv=
er.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/lib/oeqa/selftest/cases/d<wbr>istro=
data.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/lib/oeqa/selftest/cases/i<wbr>magef=
eatures.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/lib/oeqa/selftest/cases/l<wbr>ayera=
ppend.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/lib/oeqa/selftest/cases/r<wbr>uncmd=
.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 17 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/lib/oeqa/selftest/cases/w<wbr>ic.py=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 70 ++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/lib/oeqa/utils/qemurunner<wbr>.py=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 351<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ++++++++++-----------<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-core/glib-2.0/gli<wbr>b.inc=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-core/glibc/glibc-<wbr>packa=
ge.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...bc-reset-dl-load-write-lock<wbr>-afte=
r-forking.patch |=C2=A0 37 +++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../0028-Bug-4578-add-ld.so-lo<wbr>ck-wh=
ile-fork.patch=C2=A0 |=C2=A0 57 ++++<br></div></div>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-core/glibc/<a href=3D"http:=
//glibc_2.26.bb" rel=3D"noreferrer" target=3D"_blank">glibc_<wbr>2.26.bb</a=
> &lt;<a href=3D"http://glibc_2.26.bb" rel=3D"noreferrer" target=3D"_blank"=
>http://glibc_2.26.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../initrdscripts/<a href=3D"http://init=
ramfs-framework_1.0.bb" rel=3D"noreferrer" target=3D"_blank">initramfs-fr<w=
br>amework_1.0.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://initramfs-framework_1.0.b=
b" rel=3D"noreferrer" target=3D"_blank">http://initramfs-framework_1.<wbr>0=
.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 20 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../<a href=3D"http://initramfs-module-i=
nstall-efi_1.0.bb" rel=3D"noreferrer" target=3D"_blank">initramfs-module-in=
stall-e<wbr>fi_1.0.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://initramfs-module-install-=
efi_1.0.bb" rel=3D"noreferrer" target=3D"_blank">http://initramfs-module-in=
sta<wbr>ll-efi_1.0.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 18 ++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../<a href=3D"http://initramfs-module-s=
etup-live_1.0.bb" rel=3D"noreferrer" target=3D"_blank">initramfs-module-set=
up-liv<wbr>e_1.0.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://initramfs-module-setup-li=
ve_1.0.bb" rel=3D"noreferrer" target=3D"_blank">http://initramfs-module-set=
up<wbr>-live_1.0.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 18 ++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-core/psplash/file<wbr>s/psp=
lash-init=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-core/psplash/<a href=3D"htt=
p://psplash_git.bb" rel=3D"noreferrer" target=3D"_blank">pspl<wbr>ash_git.b=
b</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://psplash_git.bb" rel=3D"no=
referrer" target=3D"_blank">http://psplash_git.bb</a>&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-core/util-linux/u<wbr>til-l=
inux.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../bootchart2/<a href=3D"http://bootcha=
rt2_0.14.8.bb" rel=3D"noreferrer" target=3D"_blank">bootchart2_0.14<wbr>.8.=
bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://bootchart2_0.14.8.bb" rel=
=3D"noreferrer" target=3D"_blank">http://bootchart2_0.14.8.bb</a>&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../cve-check-tool/<a href=3D"http://cve=
-check-tool_5.6.4.bb" rel=3D"noreferrer" target=3D"_blank">cve-check-t<wbr>=
ool_5.6.4.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://cve-check-tool_5.6.4.bb" =
rel=3D"noreferrer" target=3D"_blank">http://cve-check-tool_5.6.4.b<wbr>b</a=
>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<span class=3D""><=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>6.inc=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../go/go-1.6/armhf-elf-header<wbr>.patc=
h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../go/go-1.6/fix-cc-handling.<wbr>patch=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 ---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../go/go-1.6/fix-target-cc-fo<wbr>r-bui=
ld.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>6/got=
ooldir.patch=C2=A0 =C2=A0 |=C2=A0 30 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../go/go-1.6/split-host-and-t<wbr>arget=
-build.patch=C2=A0 =C2=A0 |=C2=A0 63 ----<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>6/sys=
log.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 62 ----<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>7.inc=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 19 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../go/go-1.7/armhf-elf-header<wbr>.patc=
h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 23 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../go/go-1.7/fix-cc-handling.<wbr>patch=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 50 ---<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../go/go-1.7/fix-target-cc-fo<wbr>r-bui=
ld.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>7/got=
ooldir.patch=C2=A0 =C2=A0 |=C2=A0 30 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../go/go-1.7/split-host-and-t<wbr>arget=
-build.patch=C2=A0 =C2=A0 |=C2=A0 62 ----<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>7/sys=
log.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 62 ----<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/<a href=3D"http=
://go-cross_1.7.bb" rel=3D"noreferrer" target=3D"_blank">go-cr<wbr>oss_1.7.=
bb</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://go-cross_1.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://go-cross_1.7.bb</a>&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/<a href=3D"http=
://go-dep_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank">go-de<wbr>p_0.3.0.=
bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://go-dep_0.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://go-dep_0.3.0.bb</a>&gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 18 ++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/<a href=3D"http=
://go_1.6.bb" rel=3D"noreferrer" target=3D"_blank">go_1.<wbr>6.bb</a> &lt;<=
a href=3D"http://go_1.6.bb" rel=3D"noreferrer" target=3D"_blank">http://go_=
1.6.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/<a href=3D"http=
://go_1.7.bb" rel=3D"noreferrer" target=3D"_blank">go_1.<wbr>7.bb</a> &lt;<=
a href=3D"http://go_1.7.bb" rel=3D"noreferrer" target=3D"_blank">http://go_=
1.7.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/python/<a href=3D"=
http://python3-pip_9.0.1.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>yth=
on3-pip_9.0.1.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://python3-pip_9.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">http://python3-pip_9.0.1.bb</a>&gt;=C2=A0=
 |=C2=A0 =C2=A02 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../python/<a href=3D"http://python3-set=
uptools_36.2.7.bb" rel=3D"noreferrer" target=3D"_blank">python3-setuptools_=
<wbr>36.2.7.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://python3-setuptools_36.2.7=
.bb" rel=3D"noreferrer" target=3D"_blank">http://python3-setuptools_36.<wbr=
>2.7.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../subversion/subversion/CVE-<wbr>2017-=
9800.patch=C2=A0 =C2=A0 =C2=A0 | 136 ++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../subversion/<a href=3D"http://subvers=
ion_1.9.6.bb" rel=3D"noreferrer" target=3D"_blank">subversion_1.9.<wbr>6.bb=
</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://subversion_1.9.6.bb" rel=
=3D"noreferrer" target=3D"_blank">http://subversion_1.9.6.bb</a>&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-extended/diffutil<wbr>s/dif=
futils.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../foomatic/<a href=3D"http://foomatic-=
filters_4.0.17.bb" rel=3D"noreferrer" target=3D"_blank">foomatic-filters_<w=
br>4.0.17.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://foomatic-filters_4.0.17.b=
b" rel=3D"noreferrer" target=3D"_blank">http://foomatic-filters_4.0.1<wbr>7=
.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<span=
 class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../go-examples/files/hellowor<wbr>ld.go=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-extended/go-examp<wbr>les/g=
o-examples.inc=C2=A0 |=C2=A0 10 -<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../go-examples/<a href=3D"http://go-hel=
loworld_0.1.bb" rel=3D"noreferrer" target=3D"_blank">go-helloworld_<wbr>0.1=
.bb</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://go-helloworld_0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">http://go-helloworld_0.1.bb</a>&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...ing-fix-arping-hang-if-SIGA<wbr>LRM-i=
s-blocked.patch |=C2=A0 44 +++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-extended/iputils/<a href=3D=
"http://iputils_s20151218.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>ipu=
tils_s20151218.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://iputils_s20151218.bb" rel=
=3D"noreferrer" target=3D"_blank">http://iputils_s20151218.bb</a>&gt; |=C2=
=A0 =C2=A01 +<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-extended/sysstat/<wbr>sysst=
at.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../texinfo-dummy-native/texin<wbr>fo-du=
mmy/template.py |=C2=A0 =C2=A04 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-extended/xdg-util<wbr>s/<a =
href=3D"http://xdg-utils_1.1.1.bb" rel=3D"noreferrer" target=3D"_blank">xdg=
-utils_1.1.1.bb</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://xdg-utils_1.1.1.bb" rel=
=3D"noreferrer" target=3D"_blank">http://xdg-utils_1.1.1.bb</a>&gt; |=C2=A0=
 =C2=A02 +-<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-kernel/linux/linu<wbr>x-dtb=
.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 +--<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-kernel/linux/linu<wbr>x-yoc=
to.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...apbpf-don-t-support-install<wbr>ing-a=
-non-root.patch |=C2=A0 62 ++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-kernel/systemtap/<wbr>syste=
mtap_git.inc=C2=A0 =C2=A0 |=C2=A0 =C2=A05 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-multimedia/alsa/<a href=3D"=
http://alsa-utils_1.1.4.bb" rel=3D"noreferrer" target=3D"_blank">a<wbr>lsa-=
utils_1.1.4.bb</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://alsa-utils_1.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">http://alsa-utils_1.1.4.bb</a>&gt;=C2=A0 =
=C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...-don-t-use-variable-length-<wbr>array=
-in-union.patch |=C2=A0 59 ++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../pulseaudio/<a href=3D"http://pulseau=
dio_10.0.bb" rel=3D"noreferrer" target=3D"_blank">pulseaudio_10.0<wbr>.bb</=
a> &lt;<a href=3D"http://pulseaudio_10.0.bb" rel=3D"noreferrer" target=3D"_=
blank">http://pulseaudio_10.0.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../{<a href=3D"http://bmap-tools_3.2.bb=
" rel=3D"noreferrer" target=3D"_blank">bmap-tools_3.2.bb</a> &lt;<a href=3D=
"http://bmap-tools_3.2.bb" rel=3D"noreferrer" target=3D"_blank">http://bmap=
-tools_3.2.bb</a>&gt; =3D&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://bmap-tools_3.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">bmap-tools_3.4.bb</a> &lt;<a href=3D"http://bmap=
-tools_3.4.bb" rel=3D"noreferrer" target=3D"_blank">http://bmap-tools_3.4.b=
b</a>&gt;}=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A09 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-support/libfm/<a href=3D"ht=
tp://libfm_1.2.5.bb" rel=3D"noreferrer" target=3D"_blank">lib<wbr>fm_1.2.5.=
bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://libfm_1.2.5.bb" rel=3D"no=
referrer" target=3D"_blank">http://libfm_1.2.5.bb</a>&gt;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .../shared-mime-info/shared-mi<wbr>me-in=
fo.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/buildhistory-diff=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 125 ++++----<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/lib/devtool/standard.p<wbr>y=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/lib/devtool/upgrade.<wbr>py=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 27 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/lib/wic/engine.py=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 55 ++--<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/lib/wic/help.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 64 ++--<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/lib/wic/plugins/imager<wbr>/dire=
ct.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 scripts/yocto-compat-layer.py=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 79 files changed, 1137 insertions(+), 10=
30 deletions(-)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-core/glibc/glibc/<wbr>0027-glibc-r=
eset-dl-load-write<wbr>-lock-after-forking.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-core/glibc/glibc/<wbr>0028-Bug-457=
8-add-ld.so-lock-w<wbr>hile-fork.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-core/initrdscript<wbr>s/<a href=3D=
"http://initramfs-module-install-efi_1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">initramfs-module-install-<wbr>efi_1.0.bb</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://initramfs-module-install-=
efi_1.0.bb" rel=3D"noreferrer" target=3D"_blank">http://initramfs-module-in=
sta<wbr>ll-efi_1.0.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-core/initrdscript<wbr>s/<a href=3D=
"http://initramfs-module-setup-live_1.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">initramfs-module-setup-live_<wbr>1.0.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://initramfs-module-setup-li=
ve_1.0.bb" rel=3D"noreferrer" target=3D"_blank">http://initramfs-module-set=
up<wbr>-live_1.0.bb</a>&gt;<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 meta/recipes-devtools=
/go/go-1.<wbr>6.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>6/armhf-elf-=
header.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>6/fix-cc-han=
dling.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>6/fix-target=
-cc-for-build.patc<wbr>h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 meta/recipes-devtools=
/go/go-1.<wbr>6/gotooldir.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>6/split-host=
-and-target-build.<wbr>patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 meta/recipes-devtools=
/go/go-1.<wbr>6/syslog.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 meta/recipes-devtools=
/go/go-1.<wbr>7.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>7/armhf-elf-=
header.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>7/fix-cc-han=
dling.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>7/fix-target=
-cc-for-build.patc<wbr>h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 meta/recipes-devtools=
/go/go-1.<wbr>7/gotooldir.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/go/go-1.<wbr>7/split-host=
-and-target-build.<wbr>patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 meta/recipes-devtools=
/go/go-1.<wbr>7/syslog.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 meta/recipes-devtools=
/go/<a href=3D"http://go-cross_1.7.bb" rel=3D"noreferrer" target=3D"_blank"=
>go-cr<wbr>oss_1.7.bb</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://go-cross_1.7.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://go-cross_1.7.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644 meta/recipes-devtools=
/go/<a href=3D"http://go-dep_0.3.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>go-de<wbr>p_0.3.0.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://go-dep_0.3.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">http://go-dep_0.3.0.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 meta/recipes-devtools=
/go/<a href=3D"http://go_1.6.bb" rel=3D"noreferrer" target=3D"_blank">go_1.=
<wbr>6.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://go_1.6.bb" rel=3D"norefer=
rer" target=3D"_blank">http://go_1.6.bb</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644 meta/recipes-devtools=
/go/<a href=3D"http://go_1.7.bb" rel=3D"noreferrer" target=3D"_blank">go_1.=
<wbr>7.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://go_1.7.bb" rel=3D"norefer=
rer" target=3D"_blank">http://go_1.7.bb</a>&gt;<span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-devtools/subversi<wbr>on/subversio=
n/CVE-2017-9800.<wbr>patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-extended/go-examp<wbr>les/files/he=
lloworld.go<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-extended/go-examp<wbr>les/go-examp=
les.inc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-extended/iputils/<wbr>files/arping=
-fix-arping-hang-i<wbr>f-SIGALRM-is-blocked.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-kernel/systemtap/<wbr>systemtap/00=
01-staprun-stapbpf<wbr>-don-t-support-installing-a-<wbr>non-root.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 create mode 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 meta/recipes-multimedia/pulsea<wbr>udio/pulseau=
dio/pulseaudio-<wbr>discuss-iochannel-don-t-use-<wbr>variable-length-array-=
in-<wbr>union.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rename meta/recipes-support/bmap-tool<wb=
r>s/{<a href=3D"http://bmap-tools_3.2.bb" rel=3D"noreferrer" target=3D"_bla=
nk">bmap-tools_3.2.bb</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://bmap-tools_3.2.bb" rel=3D=
"noreferrer" target=3D"_blank">http://bmap-tools_3.2.bb</a>&gt; =3D&gt; <a =
href=3D"http://bmap-tools_3.4.bb" rel=3D"noreferrer" target=3D"_blank">bmap=
-tools_3.4.bb</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://bmap-tools_3.4.bb" rel=3D=
"noreferrer" target=3D"_blank">http://bmap-tools_3.4.bb</a>&gt;} (79%)<span=
 class=3D""><br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 To stop receiving notification emails like this=
 one, please contact<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 the administrator of this repository.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ______________________________<wbr>____________=
_____<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Openembedded-commits mailing list<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-commits@lists.op=
enembedded.org" target=3D"_blank">Openembedded-commits@lists.ope<wbr>nembed=
ded.org</a><br></span>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-commi=
ts@lists.openembedded.org" target=3D"_blank">Openembedded-commits@l<wbr>ist=
s.openembedded.org</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailma=
n/listinfo/openembedded-commits" rel=3D"noreferrer" target=3D"_blank">http:=
//lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>commits</a=
><span class=3D""><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/ma=
ilman/listinfo/openembedded-commits" rel=3D"noreferrer" target=3D"_blank">h=
ttp://lists.openembedded.org<wbr>/mailman/listinfo/openembedded<wbr>-commit=
s</a>&gt;<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 --<br>
=C2=A0 =C2=A0 ______________________________<wbr>_________________<br>
=C2=A0 =C2=A0 Openembedded-core mailing list<br>
=C2=A0 =C2=A0 <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br></spa=
n>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembe=
dded.org" target=3D"_blank">Openembedded-core@list<wbr>s.openembedded.org</=
a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><span class=3D""><b=
r>
=C2=A0 =C2=A0 &lt;<a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org<wbr>/mailman/listinfo/openembedded<wbr>-core</a>&gt;<br>
<br>
<br>
Across a similar update on master I noticed a possibly related glitch while=
 building config attached below. Here linux-raspberrypi-1_4.9.41+git<wbr>AU=
TOINC+4153f509b4 complained with:<br>
<br>
ERROR: linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f509b4-r0 do_kernel_m=
etadata: Could not locate BSP definition for raspberrypi3-64/standard and n=
o defconfig was provided<br>
<br>
Surprisingly enough this wasn&#39;t marked as a failed build indeed. Next b=
uilds did not trigger any error either. Not tried yet any sort of cleaning =
for the recipe. Didn&#39;t report it immediately since, as you can see from=
 my layers revisions, I was meantime upgrading to latest master and testing=
 Paul&#39;s work for fixing build for 64bit kernel when u-boot is used to b=
oot the RPi. FWIW I don&#39;t have rm_work enabled on these builds.<br>
</span></blockquote>
<br>
Interesting.<br>
<br>
It definitely sounds like something is racing, that previously<br>
didn&#39;t .. or was much better hidden.<br>
<br>
I had the rpi3 on a continuous build loop yesterday and didn&#39;t<br>
trigger the error here.<br>
<br>
I&#39;ll continue my builds and have another look to see what could<br>
possibly be racing in the tasks.<br>
<br>
If anyone does make this happen reproducibly, let me know and<br>
I&#39;ll switch my config to debug.<span class=3D"HOEnZb"><font color=3D"#8=
88888"><br>
<br>
Bruce</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I&#39;m aware that the same error was triggered by a recent issue that prev=
ented the build to continue and was fixed by poky commit fa664b1bba3ef82560=
83f4e52cafd0<wbr>985d924586 (From OE-Core rev: 156cf9e25f875a50f907e570d9b6=
2c<wbr>bc2c051133).<br>
<br>
Here is the configuration that &quot;sort of&quot; failed:<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.35.0&quot;<br>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;universal&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;aarch64-poky-linux&quot;<br=
>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;raspberrypi3-64&q=
uot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2.3+snapshot-20170912&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;aarch64&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&quot;<br>
meta<br>
meta-poky<br>
meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;HEAD:e3a69364eb1fdbf1dcb98a04<wbr>b3d=
dfc8f9841a7fa&quot;<br>
meta-oe<br>
meta-python<br>
meta-networking=C2=A0 =C2=A0=3D &quot;HEAD:d9f7ef40d74659a034824884<wbr>1ef=
adaf120d52c30&quot;<br>
meta-raspberrypi=C2=A0 =3D &quot;pbarker/kernel:a01be8b3cf4af9<wbr>bcd0c01a=
5b0af3b9c7a2c2b756&quot;<br>
<br>
Initialising tasks: 100% |#############################<wbr>###############=
###############<wbr>######| Time: 0:00:12<br>
NOTE: Executing SetScene Tasks<br>
NOTE: Executing RunQueue Tasks<br>
ERROR: linux-raspberrypi-1_4.9.41+git<wbr>AUTOINC+4153f509b4-r0 do_kernel_m=
etadata: Could not locate BSP definition for raspberrypi3-64/standard and n=
o defconfig was provided<br>
NOTE: Tasks Summary: Attempted 4887 tasks of which 2194 didn&#39;t need to =
be rerun and all succeeded.<br>
NOTE: Writing buildhistory<br>
<br>
</blockquote>
<br>
</div></div></blockquote></div><br></div>

--001a113cfa6acadf50055929918b--
