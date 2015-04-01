Return-Path: <cliff.brake@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0935C724B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 22:17:36 +0000 (UTC)
Received: by lagg8 with SMTP id g8so47467136lag.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Apr 2015 15:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=MdfnC633ZbdrmydQ47GtmQ1+j3dFpJPO2YMUWgcUAZo=;
	b=DMNuHQ0MyFPQMqkBsPc5pUQqtuppds2fT4lQUQP4yKeHOwwrQDooDWR25KztkgvXoK
	CzCtHCvMxNhCH7BlkQSzAP2pr/eQRr1MSVPa/SVIr/1LLAJT0RcGeJ1RgJFoQzrfspky
	NmlhrUTuT9Ls+ivxJxRnBW2eZA07Rsv/ZF1rFHW7z01KcnGksoMjGkLy2FzjrvuqeZhU
	b2zGtbEGMYDwF2o1rVKys2ya5MihBQtzWo+DughUIye14mU1j03jpzcDdQSqylolGx/2
	AIXhuLqgJsXVSPSRVvfrzE+5q0znI44f7MMQp5c3ZmnPVhKjcIdfT9pBL721nXRXNOlu
	r09w==
MIME-Version: 1.0
X-Received: by 10.112.137.164 with SMTP id qj4mr37561109lbb.17.1427926656799; 
	Wed, 01 Apr 2015 15:17:36 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.114.58.134 with HTTP; Wed, 1 Apr 2015 15:17:36 -0700 (PDT)
Date: Wed, 1 Apr 2015 18:17:36 -0400
X-Google-Sender-Auth: yV8mxgZ1yXyRWrd38ofQRwXFTx4
Message-ID: <CAOd_LFx8=tqK64c=Xyq3Yqk+LX2aGeZfpGOmpgpk-hvkb_2Cww@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: populate_sdk error
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
X-List-Received-Date: Wed, 01 Apr 2015 22:17:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm getting the following when running populate_sdk with a dizzy build.

Angstrom distro
workstation OS is debian wheezy
gcc (Debian 4.7.2-5) 4.7.2

Any thoughts what I'm doing wrong?

Thanks,
Cliff

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_configure (log file is located at
/scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/log.do_configure.23863)
ERROR: Logfile of failure stored in:
/scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/log.do_configure.23863
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing python function gcc_multilib_setup
| DEBUG: Python function gcc_multilib_setup finished
| DEBUG: Executing shell function do_configure
| cat: /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work-shared/gcc-4.9.1-r0/gcc-4.9.1/gcc/defaults.h:
No such file or directory
| WARNING: /scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/run.do_configure.23863:1
exit 1 from
|   grep -v "\#endif.*GCC_DEFAULTS_H" >
/scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/gcc-4.9.1/build.x86_64-linux.x86_64-angstromsdk-linux/gcc/defaults.h.new
| ERROR: Function failed: do_configure (log file is located at
/scratch/fmc-accuload/oe-build-bbb/build/tmp-angstrom_v2014_12-glibc/work/x86_64-angstromsdk-linux/gcc-crosssdk-initial-x86_64/4.9.1-r0/temp/log.do_configure.23863)
ERROR: Task 2167
(/scratch/fmc-accuload/oe-build-bbb/sources/openembedded-core/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.9.bb,
do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1406 tasks of which 1218 didn't need to
be rerun and 1 failed.
NOTE: Writing buildhistory
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /scratch/fmc-accuload/oe-build-bbb/sources/openembedded-core/meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.9.bb,
do_configure
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

