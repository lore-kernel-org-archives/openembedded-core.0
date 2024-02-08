Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A74C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 12:29:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.16496.1707395389481847308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 04:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZt/7jYY;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40ff28388a6so15957365e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 04:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707395388; x=1708000188; darn=lists.openembedded.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/G8e8cZVNToIJihmqihhMHorPB/7uxEY3H61N3Nm2Zo=;
        b=kZt/7jYYqCuF6VZzoS+buUuqhBP7yuyTKIFiGqtKRAV1wUyq0FQMU1vHk/HcPLUi6G
         vXZJLxDkq/Bs2fCervyF1yNwv3DQ5P3WES6eG7+CDbfzSIqAiFo2kuUEVMrmCUYpAw/e
         94WU9il8d8XfC6/xOMjiJG1w/trkoDPpgtGcc+NFXznoWfpK7BIZ1hA8URYBP9DWmYZw
         5ec50kYdXhkfMywOg7Vmc0ylNs2flOyxx2W/AM95PBxp+WNFJOguhFvCKcq54UOkxoks
         Ih/pJLGd5Mv2Im2kXuBjnLMEn926qxufjgmlc929zTx+LqAG+CdItIxUmJ7PKkE2YeYe
         dgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707395388; x=1708000188;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G8e8cZVNToIJihmqihhMHorPB/7uxEY3H61N3Nm2Zo=;
        b=T4RbhCqpTWib09ubgz8AIcsdGcNerOIsztn9iYKTjvLvrvbaDBQeCkqwmgoI2e5bGs
         ishXajIT79r1WLKpDdJBhirAgbLKHNuiMxR7tC1SZ/DqYZzdvr6VwfJTr3Py1uT4ug7H
         XadQMJFaQeEVsshKPQaLrdq+498PErChjEx/leM50llg9lKXlEOjqeWgwHBhq6Ppf0Fb
         RiHh9MkvwpNcqTLVhPi0MSKaTpJeS6a3osXlQKmOWtQXwQ0JqyaitEPaAKvZEHJ1n5SD
         EvuUqfTQhp7BVavCIr/zV5e+Lm+ZnCbKG9KYhJJ4PZ3bdH/RpwDFp6YsSAgyN+jzAc1J
         tzHA==
X-Gm-Message-State: AOJu0YyKcFeNhhYZ5fdVWdw+dRTFSQ8jemEvG6wg/5cEXJ7eXBX8ZEy1
	xiZEzrw/Ms/Q9M4z8O14aDW8GHqgdasgXqMz2nmOD+ZCbo8ofvBfGgL6++qC
X-Google-Smtp-Source: AGHT+IFjvcd8aiP0XSIpbMiI8m/U+ofLC/hbUg13VKX5N3Sw946yqnkFbW60dMfA4YiYfDEx+qbK9w==
X-Received: by 2002:a05:600c:5029:b0:410:41e5:3a28 with SMTP id n41-20020a05600c502900b0041041e53a28mr872093wmr.16.1707395387319;
        Thu, 08 Feb 2024 04:29:47 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id o30-20020a05600c511e00b0040ec8330c8asm1494179wms.39.2024.02.08.04.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:29:46 -0800 (PST)
Message-ID: <bde1fbcb363b1bff4a8fc5be9dca6d7615cb7fcd.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] python 3.12 related fixes
From: adrian.freihofer@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 08 Feb 2024 13:29:45 +0100
In-Reply-To: <CANNYZj9_BtkgYOuu0YaemJK5fONV4CoERvCYquRtCL6=moc5Eg@mail.gmail.com>
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
	 <CANNYZj9_BtkgYOuu0YaemJK5fONV4CoERvCYquRtCL6=moc5Eg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-VDvq3hrnucCqxqGSCQak"
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 12:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195147

--=-VDvq3hrnucCqxqGSCQak
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex

Thank you.

It looks like there is already a Fedora-39 runner in the AB. So maybe
it's easier for you to wait for the results from the official Yocto
machine later on.
But of course I can provide you some lines from my log files.
(Unfortunately I already deleted the qemu-bootlog).


2024-02-08 02:41:24,247 - oe-selftest - INFO -
 runtime_test.TestImage.test_testimage_virgl_gtk_sdl (subunit.RemotedTe
stCase)
2024-02-08 02:41:24,250 - oe-selftest - INFO -  ... FAIL
2024-02-08 02:41:24,364 - oe-selftest - INFO -
 2: 109/130 376/576 (1454.58s) (2 failed) (runtime_test.TestImage.test_
testimage_virgl_gtk_sdl)
2024-02-08 02:41:24,364 - oe-selftest - INFO -
 testtools.testresult.real._StringException: Traceback (most recent cal
l last):
  File "/home/adrian/projets/oss/poky/meta/lib/oeqa/core/decorator/__in
it__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/adrian/projets/oss/poky/meta/lib/oeqa/selftest/cases/runt
ime_test.py", line 264, in test_testimage_virgl_gtk_sdl
    bitbake('-c testimage core-image-minimal')
  File "/home/adrian/projets/oss/poky/meta/lib/oeqa/utils/commands.py",
 line 234, in bitbake
    return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, *
*options)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
^^^^^^^^^
  File "/home/adrian/projets/oss/poky/meta/lib/oeqa/utils/commands.py",
 line 212, in runCmd
    raise AssertionError("Command '%s' returned non-
zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'bitbake  -c testimage core-image-
minimal' returned non-zero exit status 1:
Loading cache...done.
Loaded 1930 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           =3D "2.7.2"
BUILD_SYS            =3D "x86_64-linux"
NATIVELSBSTRING      =3D "universal"
TARGET_SYS           =3D "x86_64-poky-linux"
MACHINE              =3D "qemux86-64"
DISTRO               =3D "poky"
DISTRO_VERSION       =3D "4.3+snapshot-
245f71953bc7fdfbda6aa69bc71221867c5d9764"
TUNE_FEATURES        =3D "m64 core2"
TARGET_FPU           =3D ""
meta                =20
meta-poky           =20
meta-yocto-bsp       =3D "adrianf/oe-selftest-fedora-
39:245f71953bc7fdfbda6aa69bc71221867c5d9764"
meta-selftest        =3D "main:4d71a2f5c246deea74326929c1b4a50d4282b254"

Initialising tasks...Sstate summary: Wanted 52 Local 52 Mirrors 0 Misse
d 0 Current 452 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Running task 1716 of 1716 (/home/adrian/projets/oss/poky/meta/rec
ipes-core/images/core-image-minimal.bb:do_testimage)
NOTE: recipe core-image-minimal-1.0-r0: task do_testimage: Started
QMP Available for connection at /home/adrian/projets/oss/poky/build-st-
2701801/tmp/.wzpw04s6
ERROR: core-image-minimal-1.0-
r0 do_testimage: Qemu pid didn't appear in 300 seconds (02/08/24 02:41:
20)
ERROR: core-image-minimal-1.0-
r0 do_testimage: Status information, poll status: 0, pidfile exists: Fa
lse, pidfile contents None, proc pid exists False
ERROR: core-image-minimal-1.0-r0 do_testimage: Output from runqemu:
runqemu - INFO - Continuing with the following parameters:
KERNEL: [/home/adrian/projets/oss/poky/build-st-
2701801/tmp/deploy/images/qemux86-64/bzImage]
MACHINE: [qemux86-64]
FSTYPE: [ext4]
ROOTFS: [/home/adrian/projets/oss/poky/build-st-
2701801/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-
64.rootfs.ext4]
CONFFILE: [/home/adrian/projets/oss/poky/build-st-
2701801/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-
64.rootfs.qemuboot.conf]

runqemu - INFO - Using preconfigured tap device tap0
runqemu - INFO - If this is not intended, touch /tmp/qemu-tap-
locks/tap0.skip to make runqemu skip tap0.
runqemu - INFO -
 Network configuration: ip=3D192.168.7.2::192.168.7.1:255.255.255.0::eth0
:off:8.8.8.8 net.ifnames=3D0
runqemu - INFO - Running /home/adrian/projets/oss/poky/build-st-
2701801/tmp/work/x86_64-linux/qemu-helper-native/1.0/recipe-sysroot-
native/usr/bin/qemu-system-x86_64 -device virtio-net-
pci,netdev=3Dnet0,mac=3D52:54:00:12:34:02 -
netdev tap,id=3Dnet0,ifname=3Dtap0,script=3Dno,downscript=3Dno -object rng-
random,filename=3D/dev/urandom,id=3Drng0 -device virtio-rng-pci,rng=3Drng0 =
-
drive file=3D/home/adrian/projets/oss/poky/build-st-
2701801/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-
64.rootfs.ext4,if=3Dvirtio,format=3Draw -usb -device usb-tablet -usb -
device usb-kbd   -cpu IvyBridge -machine q35,i8042=3Doff -smp 4 -enable-
kvm -m 256 -serial tcp:127.0.0.1:32917,nodelay=3Don -
serial tcp:127.0.0.1:48415,nodelay=3Don  -
pidfile /home/adrian/projets/oss/poky/build-st-
2701801/pidfile_3501104  -S -qmp unix:./.611zx6pl,server,wait -
qmp unix:./.wzpw04s6,server,nowait -snapshot -device virtio-vga-gl  -
display gtk,gl=3Don,show-cursor=3Don  -
kernel /home/adrian/projets/oss/poky/build-st-
2701801/tmp/deploy/images/qemux86-64/bzImage -
append 'root=3D/dev/vda rw  ip=3D192.168.7.2::192.168.7.1:255.255.255.0::et
h0:off:8.8.8.8 net.ifnames=3D0 console=3DttyS0 console=3DttyS1 oprofile.tim=
er
=3D1 tsc=3Dreliable no_timer_check rcupdate.rcu_expedited=3D1 swiotlb=3D0  =
prin
tk.time=3D1'

runqemu - INFO - Host uptime: 842696.36

runqemu - ERROR -
 Failed to run qemu: Authorization required, but no authorization proto
col specified

qemu-system-x86_64: OpenGL is not supported by the display

runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 842696.45

tput: No value for $TERM and no -T specified

ERROR: core-image-minimal-1.0-
r0 do_testimage: Error executing a python function in exec_func_python(
) autogenerated:

The stack trace of python calls that resulted in this exception/failure
 was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_testimage(d)
     0003:
File: '/home/adrian/projets/oss/poky/meta/classes-
recipe/testimage.bbclass', lineno: 119, function: do_testimage
     0115:    dump-guest-
memory {"paging":false,"protocol":"file:%s.img"}
     0116:}
     0117:
     0118:python do_testimage() {
 *** 0119:    testimage_main(d)
     0120:}
     0121:
     0122:addtask testimage
     0123:do_testimage[nostamp] =3D "1"
File: '/home/adrian/projets/oss/poky/meta/classes-
recipe/testimage.bbclass', lineno: 397, function: testimage_main
     0393:    orig_sigterm_handler =3D signal.signal(signal.SIGTERM, sigt
erm_exception)
     0394:    try:
     0395:        # We need to check if runqemu ends unexpectedly
     0396:        # or if the worker send us a SIGTERM
 *** 0397:        tc.target.start(params=3Dd.getVar("TEST_QEMUPARAMS"), r
unqemuparams=3Dd.getVar("TEST_RUNQEMUPARAMS"))
     0398:        import threading
     0399:        try:
     0400:            threading.Timer(int(d.getVar("TEST_OVERALL_TIMEOU
T")), handle_test_timeout, (int(d.getVar("TEST_OVERALL_TIMEOUT")),)).st
art()
     0401:        except ValueError:
File: '/home/adrian/projets/oss/poky/meta/lib/oeqa/core/target/qemu.py'
, lineno: 91, function: start
     0087:            except (subprocess.CalledProcessError, subprocess
.TimeoutExpired, FileNotFoundError) as err:
     0088:                msg +=3D "Error running command: %s\n%s\n" % (b
lcmd, err)
     0089:            msg +=3D "\n\n=3D=3D=3D=3D=3D end: snippet =3D=3D=3D=
=3D=3D\n"
     0090:
 *** 0091:            raise RuntimeError("FAILED to start qemu -
 check the task log and the boot log %s" % (msg))
     0092:
     0093:    def stop(self):
     0094:        self.runner.stop()
Exception: RuntimeError: FAILED to start qemu -
 check the task log and the boot log=20

=3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D



=3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D

=3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D

Error running command: ['tail', '-
20', '/home/adrian/projets/oss/poky/build-st-
2701801/tmp/work/qemux86_64-poky-linux/core-image-
minimal/1.0/testimage/qemu_boot_log.20240208013616']
Command '['tail', '-20', '/home/adrian/projets/oss/poky/build-st-
2701801/tmp/work/qemux86_64-poky-linux/core-image-
minimal/1.0/testimage/qemu_boot_log.20240208013616']' returned non-
zero exit status 1.


=3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D


ERROR: Logfile of failure stored in: /home/adrian/projets/oss/poky/buil
d-st-2701801/tmp/work/qemux86_64-poky-linux/core-image-
minimal/1.0/temp/log.do_testimage.3501104
NOTE: recipe core-image-minimal-1.0-r0: task do_testimage: Failed
ERROR: Task (/home/adrian/projets/oss/poky/meta/recipes-
core/images/core-image-
minimal.bb:do_testimage) failed with exit code '1'
NOTE: Tasks Summary: Attempted 1716 tasks of which 1715 didn't need to=20
be rerun and 1 failed.

Summary: 1 task failed:
  /home/adrian/projets/oss/poky/meta/recipes-core/images/core-image-
minimal.bb:do_testimage
Summary: There were 4 ERROR messages, returning a non-zero exit code.


Stderr:
2024-02-07 22:42:37,482 - oe-selftest - INFO -
 Adding: "include selftest.inc" in /home/adrian/projets/oss/poky/build-
st-2701801/conf/local.conf
2024-02-07 22:42:37,482 - oe-selftest - INFO -
 Adding: "include bblayers.inc" in bblayers.conf
/usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult=20
has no addDuration method
  warnings.warn("TestResult has no addDuration method",

/usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult=20
has no addDuration method
  warnings.warn("TestResult has no addDuration method",

/usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult=20
has no addDuration method
  warnings.warn("TestResult has no addDuration method",

/usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult=20
has no addDuration method
  warnings.warn("TestResult has no addDuration method",

Regards,
Adrian



On Thu, 2024-02-08 at 10:15 +0100, Alexander Kanavin wrote:
> On Thu, 8 Feb 2024 at 09:28, Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> > - runtime_test.TestImage.test_testimage_virgl_gtk_sdl: FAILED
> > (1454.58s)
> > =C2=A0 No idea why this fails.
>=20
> If you can show the error that happens here, I can take a look.
>=20
> Alex



--=-VDvq3hrnucCqxqGSCQak
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hi Alex</div><div><br></div><div>Thank you.</div>=
<div><br></div><div>It looks like there is already a Fedora-39 runner in th=
e AB. So maybe it's easier for you to wait for the results from the officia=
l Yocto machine later on.</div><div>But of course I can provide you some li=
nes from my log files. (Unfortunately I already deleted the qemu-bootlog).<=
/div><div><br></div><div><br></div><div style=3D"color: #cccccc;background-=
color: #1f1f1f;font-family: 'Droid Sans Mono', 'monospace', monospace;font-=
weight: normal;font-size: 14px;line-height: 19px;white-space: pre;"><div><s=
pan style=3D"color: #6a9955;">2024-02-08</span><span style=3D"color: #ccccc=
c;"> </span><span style=3D"color: #6a9955;">02:41:24,247</span><span style=
=3D"color: #cccccc;"> - oe-selftest - </span><span style=3D"color: #b5cea8;=
">INFO</span><span style=3D"color: #cccccc;"> - </span><span style=3D"color=
: #569cd6;">runtime_test.TestImage.test_testimage_virgl_gtk_sdl</span><span=
 style=3D"color: #cccccc;"> (</span><span style=3D"color: #569cd6;">subunit=
.RemotedTestCase</span><span style=3D"color: #cccccc;">)</span></div><div><=
span style=3D"color: #6a9955;">2024-02-08</span><span style=3D"color: #cccc=
cc;"> </span><span style=3D"color: #6a9955;">02:41:24,250</span><span style=
=3D"color: #cccccc;"> - oe-selftest - </span><span style=3D"color: #b5cea8;=
">INFO</span><span style=3D"color: #cccccc;"> -  ... </span><span style=3D"=
color: #ce9178;font-weight: bold;">FAIL</span></div><div><span style=3D"col=
or: #6a9955;">2024-02-08</span><span style=3D"color: #cccccc;"> </span><spa=
n style=3D"color: #6a9955;">02:41:24,364</span><span style=3D"color: #ccccc=
c;"> - oe-selftest - </span><span style=3D"color: #b5cea8;">INFO</span><spa=
n style=3D"color: #cccccc;"> - </span><span style=3D"color: #569cd6;">2</sp=
an><span style=3D"color: #cccccc;">: </span><span style=3D"color: #569cd6;"=
>109</span><span style=3D"color: #cccccc;">/</span><span style=3D"color: #5=
69cd6;">130</span><span style=3D"color: #cccccc;"> </span><span style=3D"co=
lor: #569cd6;">376</span><span style=3D"color: #cccccc;">/</span><span styl=
e=3D"color: #569cd6;">576</span><span style=3D"color: #cccccc;"> (</span><s=
pan style=3D"color: #569cd6;">1454</span><span style=3D"color: #cccccc;">.5=
8s) (</span><span style=3D"color: #569cd6;">2</span><span style=3D"color: #=
cccccc;"> failed) (</span><span style=3D"color: #569cd6;">runtime_test.Test=
Image.test_testimage_virgl_gtk_sdl</span><span style=3D"color: #cccccc;">)<=
/span></div><div><span style=3D"color: #6a9955;">2024-02-08</span><span sty=
le=3D"color: #cccccc;"> </span><span style=3D"color: #6a9955;">02:41:24,364=
</span><span style=3D"color: #cccccc;"> - oe-selftest - </span><span style=
=3D"color: #b5cea8;">INFO</span><span style=3D"color: #cccccc;"> - </span><=
span style=3D"color: #569cd6;">testtools.testresult.real._StringException</=
span><span style=3D"color: #cccccc;">: Traceback (most recent call last):</=
span></div><div><span style=3D"color: #cccccc;">  File </span><span style=
=3D"color: #ce9178;">"/home/adrian/projets/oss/poky/meta/lib/oeqa/core/deco=
rator/__init__.py"</span><span style=3D"color: #cccccc;">, line </span><spa=
n style=3D"color: #569cd6;">35</span><span style=3D"color: #cccccc;">, in w=
rapped_f</span></div><div><span style=3D"color: #cccccc;">    return func(*=
args, **kwargs)</span></div><div><span style=3D"color: #cccccc;">          =
 ^^^^^^^^^^^^^^^^^^^^^</span></div><div><span style=3D"color: #cccccc;">  F=
ile </span><span style=3D"color: #ce9178;">"/home/adrian/projets/oss/poky/m=
eta/lib/oeqa/selftest/cases/runtime_test.py"</span><span style=3D"color: #c=
ccccc;">, line </span><span style=3D"color: #569cd6;">264</span><span style=
=3D"color: #cccccc;">, in test_testimage_virgl_gtk_sdl</span></div><div><sp=
an style=3D"color: #cccccc;">    bitbake(</span><span style=3D"color: #ce91=
78;">'-c testimage core-image-minimal'</span><span style=3D"color: #cccccc;=
">)</span></div><div><span style=3D"color: #cccccc;">  File </span><span st=
yle=3D"color: #ce9178;">"/home/adrian/projets/oss/poky/meta/lib/oeqa/utils/=
commands.py"</span><span style=3D"color: #cccccc;">, line </span><span styl=
e=3D"color: #569cd6;">234</span><span style=3D"color: #cccccc;">, in bitbak=
e</span></div><div><span style=3D"color: #cccccc;">    return runCmd(cmd, i=
gnore_status, timeout, output_log=3Doutput_log, **options)</span></div><div=
><span style=3D"color: #cccccc;">           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</span></div><div><span style=3D"colo=
r: #cccccc;">  File </span><span style=3D"color: #ce9178;">"/home/adrian/pr=
ojets/oss/poky/meta/lib/oeqa/utils/commands.py"</span><span style=3D"color:=
 #cccccc;">, line </span><span style=3D"color: #569cd6;">212</span><span st=
yle=3D"color: #cccccc;">, in runCmd</span></div><div><span style=3D"color: =
#cccccc;">    raise AssertionError(</span><span style=3D"color: #ce9178;">"=
Command '%s' returned non-zero exit status %d:\n%s"</span><span style=3D"co=
lor: #cccccc;"> % (command, </span><span style=3D"color: #569cd6;">result.s=
tatus</span><span style=3D"color: #cccccc;">, exc_output))</span></div><div=
><span style=3D"color: #cccccc;">AssertionError: Command </span><span style=
=3D"color: #ce9178;">'bitbake  -c testimage core-image-minimal'</span><span=
 style=3D"color: #cccccc;"> returned non-zero exit status </span><span styl=
e=3D"color: #569cd6;">1</span><span style=3D"color: #cccccc;">:</span></div=
><div><span style=3D"color: #cccccc;">Loading cache...done.</span></div><di=
v><span style=3D"color: #cccccc;">Loaded </span><span style=3D"color: #569c=
d6;">1930</span><span style=3D"color: #cccccc;"> entries from dependency ca=
che.</span></div><div><span style=3D"color: #cccccc;">NOTE: Resolving any m=
issing task queue dependencies</span></div><br><div><span style=3D"color: #=
cccccc;">Build Configuration:</span></div><div><span style=3D"color: #ccccc=
c;">BB_VERSION           =3D </span><span style=3D"color: #ce9178;">"2.7.2"=
</span></div><div><span style=3D"color: #cccccc;">BUILD_SYS            =3D =
</span><span style=3D"color: #ce9178;">"x86_64-linux"</span></div><div><spa=
n style=3D"color: #cccccc;">NATIVELSBSTRING      =3D </span><span style=3D"=
color: #ce9178;">"universal"</span></div><div><span style=3D"color: #cccccc=
;">TARGET_SYS           =3D </span><span style=3D"color: #ce9178;">"x86_64-=
poky-linux"</span></div><div><span style=3D"color: #cccccc;">MACHINE       =
       =3D </span><span style=3D"color: #ce9178;">"qemux86-64"</span></div>=
<div><span style=3D"color: #cccccc;">DISTRO               =3D </span><span =
style=3D"color: #ce9178;">"poky"</span></div><div><span style=3D"color: #cc=
cccc;">DISTRO_VERSION       =3D </span><span style=3D"color: #ce9178;">"4.3=
+snapshot-245f71953bc7fdfbda6aa69bc71221867c5d9764"</span></div><div><span =
style=3D"color: #cccccc;">TUNE_FEATURES        =3D </span><span style=3D"co=
lor: #ce9178;">"m64 core2"</span></div><div><span style=3D"color: #cccccc;"=
>TARGET_FPU           =3D </span><span style=3D"color: #ce9178;">""</span><=
/div><div><span style=3D"color: #cccccc;">meta                 </span></div=
><div><span style=3D"color: #cccccc;">meta-poky            </span></div><di=
v><span style=3D"color: #cccccc;">meta-yocto-bsp       =3D </span><span sty=
le=3D"color: #ce9178;">"adrianf/oe-selftest-fedora-39:245f71953bc7fdfbda6aa=
69bc71221867c5d9764"</span></div><div><span style=3D"color: #cccccc;">meta-=
selftest        =3D </span><span style=3D"color: #ce9178;">"main:4d71a2f5c2=
46deea74326929c1b4a50d4282b254"</span></div><br><div><span style=3D"color: =
#cccccc;">Initialising tasks...Sstate summary: Wanted </span><span style=3D=
"color: #569cd6;">52</span><span style=3D"color: #cccccc;"> Local </span><s=
pan style=3D"color: #569cd6;">52</span><span style=3D"color: #cccccc;"> Mir=
rors </span><span style=3D"color: #569cd6;">0</span><span style=3D"color: #=
cccccc;"> Missed </span><span style=3D"color: #569cd6;">0</span><span style=
=3D"color: #cccccc;"> Current </span><span style=3D"color: #569cd6;">452</s=
pan><span style=3D"color: #cccccc;"> (</span><span style=3D"color: #569cd6;=
">100</span><span style=3D"color: #cccccc;">% match, </span><span style=3D"=
color: #569cd6;">100</span><span style=3D"color: #cccccc;">% complete)</spa=
n></div><div><span style=3D"color: #cccccc;">done.</span></div><div><span s=
tyle=3D"color: #cccccc;">NOTE: Executing Tasks</span></div><div><span style=
=3D"color: #cccccc;">NOTE: Running task </span><span style=3D"color: #569cd=
6;">1716</span><span style=3D"color: #cccccc;"> of </span><span style=3D"co=
lor: #569cd6;">1716</span><span style=3D"color: #cccccc;"> (/home/adrian/pr=
ojets/oss/poky/meta/recipes-core/images/core-</span><span style=3D"color: #=
569cd6;">image-minimal.bb</span><span style=3D"color: #cccccc;">:do_testima=
ge)</span></div><div><span style=3D"color: #cccccc;">NOTE: recipe </span><s=
pan style=3D"color: #569cd6;">core-image-minimal-1.0-r0</span><span style=
=3D"color: #cccccc;">: task do_testimage: Started</span></div><div><span st=
yle=3D"color: #cccccc;">QMP Available for connection at /home/adrian/projet=
s/oss/poky/build-st-</span><span style=3D"color: #569cd6;">2701801</span><s=
pan style=3D"color: #cccccc;">/tmp/.wzpw04s6</span></div><div><span style=
=3D"color: #ce9178;font-weight: bold;">ERROR</span><span style=3D"color: #c=
ccccc;">: </span><span style=3D"color: #569cd6;">core-image-minimal-1.0-r0<=
/span><span style=3D"color: #cccccc;"> do_testimage: Qemu pid didn't appear=
 in </span><span style=3D"color: #569cd6;">300</span><span style=3D"color: =
#cccccc;"> seconds (</span><span style=3D"color: #569cd6;">02</span><span s=
tyle=3D"color: #cccccc;">/</span><span style=3D"color: #569cd6;">08</span><=
span style=3D"color: #cccccc;">/</span><span style=3D"color: #569cd6;">24</=
span><span style=3D"color: #cccccc;"> </span><span style=3D"color: #6a9955;=
">02:41:20</span><span style=3D"color: #cccccc;">)</span></div><div><span s=
tyle=3D"color: #ce9178;font-weight: bold;">ERROR</span><span style=3D"color=
: #cccccc;">: </span><span style=3D"color: #569cd6;">core-image-minimal-1.0=
-r0</span><span style=3D"color: #cccccc;"> do_testimage: Status information=
, poll status: </span><span style=3D"color: #569cd6;">0</span><span style=
=3D"color: #cccccc;">, pidfile exists: False, pidfile contents None, proc p=
id exists False</span></div><div><span style=3D"color: #ce9178;font-weight:=
 bold;">ERROR</span><span style=3D"color: #cccccc;">: </span><span style=3D=
"color: #569cd6;">core-image-minimal-1.0-r0</span><span style=3D"color: #cc=
cccc;"> do_testimage: Output from runqemu:</span></div><div><span style=3D"=
color: #cccccc;">runqemu - </span><span style=3D"color: #b5cea8;">INFO</spa=
n><span style=3D"color: #cccccc;"> - Continuing with the following paramete=
rs:</span></div><div><span style=3D"color: #cccccc;">KERNEL: [/home/adrian/=
projets/oss/poky/build-st-</span><span style=3D"color: #569cd6;">2701801</s=
pan><span style=3D"color: #cccccc;">/tmp/deploy/images/qemux86-</span><span=
 style=3D"color: #569cd6;">64</span><span style=3D"color: #cccccc;">/bzImag=
e]</span></div><div><span style=3D"color: #cccccc;">MACHINE: [qemux86-</spa=
n><span style=3D"color: #569cd6;">64</span><span style=3D"color: #cccccc;">=
]</span></div><div><span style=3D"color: #cccccc;">FSTYPE: [ext4]</span></d=
iv><div><span style=3D"color: #cccccc;">ROOTFS: [/home/adrian/projets/oss/p=
oky/build-st-</span><span style=3D"color: #569cd6;">2701801</span><span sty=
le=3D"color: #cccccc;">/tmp/deploy/images/qemux86-</span><span style=3D"col=
or: #569cd6;">64</span><span style=3D"color: #cccccc;">/core-</span><span s=
tyle=3D"color: #569cd6;">image-minimal-qemux86-64.rootfs.ext4</span><span s=
tyle=3D"color: #cccccc;">]</span></div><div><span style=3D"color: #cccccc;"=
>CONFFILE: [/home/adrian/projets/oss/poky/build-st-</span><span style=3D"co=
lor: #569cd6;">2701801</span><span style=3D"color: #cccccc;">/tmp/deploy/im=
ages/qemux86-</span><span style=3D"color: #569cd6;">64</span><span style=3D=
"color: #cccccc;">/core-</span><span style=3D"color: #569cd6;">image-minima=
l-qemux86-64.rootfs.qemuboot.conf</span><span style=3D"color: #cccccc;">]</=
span></div><br><div><span style=3D"color: #cccccc;">runqemu - </span><span =
style=3D"color: #b5cea8;">INFO</span><span style=3D"color: #cccccc;"> - Usi=
ng preconfigured tap device tap0</span></div><div><span style=3D"color: #cc=
cccc;">runqemu - </span><span style=3D"color: #b5cea8;">INFO</span><span st=
yle=3D"color: #cccccc;"> - If this is not intended, touch /tmp/qemu-tap-loc=
ks/tap0.skip to make runqemu skip tap0.</span></div><div><span style=3D"col=
or: #cccccc;">runqemu - </span><span style=3D"color: #b5cea8;">INFO</span><=
span style=3D"color: #cccccc;"> - Network configuration: ip=3D</span><span =
style=3D"color: #569cd6;">192</span><span style=3D"color: #cccccc;">.</span=
><span style=3D"color: #569cd6;">168</span><span style=3D"color: #cccccc;">=
.</span><span style=3D"color: #569cd6;">7</span><span style=3D"color: #cccc=
cc;">.</span><span style=3D"color: #569cd6;">2</span><span style=3D"color: =
#cccccc;">::</span><span style=3D"color: #569cd6;">192</span><span style=3D=
"color: #cccccc;">.</span><span style=3D"color: #569cd6;">168</span><span s=
tyle=3D"color: #cccccc;">.</span><span style=3D"color: #569cd6;">7</span><s=
pan style=3D"color: #cccccc;">.</span><span style=3D"color: #569cd6;">1</sp=
an><span style=3D"color: #cccccc;">:</span><span style=3D"color: #569cd6;">=
255</span><span style=3D"color: #cccccc;">.</span><span style=3D"color: #56=
9cd6;">255</span><span style=3D"color: #cccccc;">.</span><span style=3D"col=
or: #569cd6;">255</span><span style=3D"color: #cccccc;">.</span><span style=
=3D"color: #569cd6;">0</span><span style=3D"color: #cccccc;">::eth0:off:</s=
pan><span style=3D"color: #569cd6;">8</span><span style=3D"color: #cccccc;"=
>.</span><span style=3D"color: #569cd6;">8</span><span style=3D"color: #ccc=
ccc;">.</span><span style=3D"color: #569cd6;">8</span><span style=3D"color:=
 #cccccc;">.</span><span style=3D"color: #569cd6;">8</span><span style=3D"c=
olor: #cccccc;"> </span><span style=3D"color: #569cd6;">net.ifnames</span><=
span style=3D"color: #cccccc;">=3D</span><span style=3D"color: #569cd6;">0<=
/span></div><div><span style=3D"color: #cccccc;">runqemu - </span><span sty=
le=3D"color: #b5cea8;">INFO</span><span style=3D"color: #cccccc;"> - Runnin=
g /home/adrian/projets/oss/poky/build-st-</span><span style=3D"color: #569c=
d6;">2701801</span><span style=3D"color: #cccccc;">/tmp/work/x86_64-linux/q=
emu-helper-native/</span><span style=3D"color: #569cd6;">1</span><span styl=
e=3D"color: #cccccc;">.</span><span style=3D"color: #569cd6;">0</span><span=
 style=3D"color: #cccccc;">/recipe-sysroot-native/usr/bin/qemu-system-x86_6=
4 -device virtio-net-pci,netdev=3Dnet0,mac=3D</span><span style=3D"color: #=
6a9955;">52:54:00</span><span style=3D"color: #cccccc;">:</span><span style=
=3D"color: #6a9955;">12:34:02</span><span style=3D"color: #cccccc;"> -netde=
v tap,id=3Dnet0,ifname=3Dtap0,script=3Dno,downscript=3Dno -object rng-rando=
m,filename=3D/dev/urandom,id=3Drng0 -device virtio-rng-pci,rng=3Drng0 -driv=
e file=3D/home/adrian/projets/oss/poky/build-st-</span><span style=3D"color=
: #569cd6;">2701801</span><span style=3D"color: #cccccc;">/tmp/deploy/image=
s/qemux86-</span><span style=3D"color: #569cd6;">64</span><span style=3D"co=
lor: #cccccc;">/core-</span><span style=3D"color: #569cd6;">image-minimal-q=
emux86-64.rootfs.ext4</span><span style=3D"color: #cccccc;">,if=3Dvirtio,fo=
rmat=3Draw -usb -device usb-tablet -usb -device usb-kbd   -cpu IvyBridge -m=
achine q35,i8042=3Doff -smp </span><span style=3D"color: #569cd6;">4</span>=
<span style=3D"color: #cccccc;"> -enable-kvm -m </span><span style=3D"color=
: #569cd6;">256</span><span style=3D"color: #cccccc;"> -serial tcp:</span><=
span style=3D"color: #569cd6;">127</span><span style=3D"color: #cccccc;">.<=
/span><span style=3D"color: #569cd6;">0</span><span style=3D"color: #cccccc=
;">.</span><span style=3D"color: #569cd6;">0</span><span style=3D"color: #c=
ccccc;">.</span><span style=3D"color: #569cd6;">1</span><span style=3D"colo=
r: #cccccc;">:</span><span style=3D"color: #569cd6;">32917</span><span styl=
e=3D"color: #cccccc;">,nodelay=3Don -serial tcp:</span><span style=3D"color=
: #569cd6;">127</span><span style=3D"color: #cccccc;">.</span><span style=
=3D"color: #569cd6;">0</span><span style=3D"color: #cccccc;">.</span><span =
style=3D"color: #569cd6;">0</span><span style=3D"color: #cccccc;">.</span><=
span style=3D"color: #569cd6;">1</span><span style=3D"color: #cccccc;">:</s=
pan><span style=3D"color: #569cd6;">48415</span><span style=3D"color: #cccc=
cc;">,nodelay=3Don  -pidfile /home/adrian/projets/oss/poky/build-st-</span>=
<span style=3D"color: #569cd6;">2701801</span><span style=3D"color: #cccccc=
;">/pidfile_3501104  -S -qmp unix:./.611zx6pl,server,wait -qmp unix:./.wzpw=
04s6,server,nowait -snapshot -device virtio-vga-gl  -display gtk,gl=3Don,sh=
ow-cursor=3Don  -kernel /home/adrian/projets/oss/poky/build-st-</span><span=
 style=3D"color: #569cd6;">2701801</span><span style=3D"color: #cccccc;">/t=
mp/deploy/images/qemux86-</span><span style=3D"color: #569cd6;">64</span><s=
pan style=3D"color: #cccccc;">/bzImage -append </span><span style=3D"color:=
 #ce9178;">'root=3D/dev/vda rw  ip=3D192.168.7.2::192.168.7.1:255.255.255.0=
::eth0:off:8.8.8.8 net.ifnames=3D0 console=3DttyS0 console=3DttyS1 oprofile=
.timer=3D1 tsc=3Dreliable no_timer_check rcupdate.rcu_expedited=3D1 swiotlb=
=3D0  printk.time=3D1'</span></div><br><div><span style=3D"color: #cccccc;"=
>runqemu - </span><span style=3D"color: #b5cea8;">INFO</span><span style=3D=
"color: #cccccc;"> - Host uptime: </span><span style=3D"color: #569cd6;">84=
2696</span><span style=3D"color: #cccccc;">.</span><span style=3D"color: #5=
69cd6;">36</span></div><br><div><span style=3D"color: #cccccc;">runqemu - <=
/span><span style=3D"color: #ce9178;font-weight: bold;">ERROR</span><span s=
tyle=3D"color: #cccccc;"> - Failed to run qemu: Authorization required, but=
 no authorization protocol specified</span></div><br><div><span style=3D"co=
lor: #cccccc;">qemu-system-x86_64: OpenGL is not supported by the display</=
span></div><br><div><span style=3D"color: #cccccc;">runqemu - </span><span =
style=3D"color: #b5cea8;">INFO</span><span style=3D"color: #cccccc;"> - Cle=
aning up</span></div><div><span style=3D"color: #cccccc;">runqemu - </span>=
<span style=3D"color: #b5cea8;">INFO</span><span style=3D"color: #cccccc;">=
 - Host uptime: </span><span style=3D"color: #569cd6;">842696</span><span s=
tyle=3D"color: #cccccc;">.</span><span style=3D"color: #569cd6;">45</span><=
/div><br><div><span style=3D"color: #cccccc;">tput: No value for $TERM and =
no -T specified</span></div><br><div><span style=3D"color: #ce9178;font-wei=
ght: bold;">ERROR</span><span style=3D"color: #cccccc;">: </span><span styl=
e=3D"color: #569cd6;">core-image-minimal-1.0-r0</span><span style=3D"color:=
 #cccccc;"> do_testimage: </span><span style=3D"color: #ce9178;font-weight:=
 bold;">Error</span><span style=3D"color: #cccccc;"> executing a python fun=
ction in exec_func_python() autogenerated:</span></div><br><div><span style=
=3D"color: #cccccc;">The stack trace of python calls that resulted in this =
exception/failure was:</span></div><div><span style=3D"color: #cccccc;">Fil=
e: </span><span style=3D"color: #ce9178;">'exec_func_python() autogenerated=
'</span><span style=3D"color: #cccccc;">, lineno: </span><span style=3D"col=
or: #569cd6;">2</span><span style=3D"color: #cccccc;">, function: &lt;modul=
e&gt;</span></div><div><span style=3D"color: #cccccc;">     </span><span st=
yle=3D"color: #569cd6;">0001</span><span style=3D"color: #cccccc;">:</span>=
</div><div><span style=3D"color: #cccccc;"> *** </span><span style=3D"color=
: #569cd6;">0002</span><span style=3D"color: #cccccc;">:do_testimage(d)</sp=
an></div><div><span style=3D"color: #cccccc;">     </span><span style=3D"co=
lor: #569cd6;">0003</span><span style=3D"color: #cccccc;">:</span></div><di=
v><span style=3D"color: #cccccc;">File: </span><span style=3D"color: #ce917=
8;">'/home/adrian/projets/oss/poky/meta/classes-recipe/testimage.bbclass'</=
span><span style=3D"color: #cccccc;">, lineno: </span><span style=3D"color:=
 #569cd6;">119</span><span style=3D"color: #cccccc;">, function: do_testima=
ge</span></div><div><span style=3D"color: #cccccc;">     </span><span style=
=3D"color: #569cd6;">0115</span><span style=3D"color: #cccccc;">:    dump-g=
uest-memory {</span><span style=3D"color: #ce9178;">"paging"</span><span st=
yle=3D"color: #cccccc;">:</span><span style=3D"color: #569cd6;">false</span=
><span style=3D"color: #cccccc;">,</span><span style=3D"color: #ce9178;">"p=
rotocol"</span><span style=3D"color: #cccccc;">:</span><span style=3D"color=
: #ce9178;">"file:%s.img"</span><span style=3D"color: #cccccc;">}</span></d=
iv><div><span style=3D"color: #cccccc;">     </span><span style=3D"color: #=
569cd6;">0116</span><span style=3D"color: #cccccc;">:}</span></div><div><sp=
an style=3D"color: #cccccc;">     </span><span style=3D"color: #569cd6;">01=
17</span><span style=3D"color: #cccccc;">:</span></div><div><span style=3D"=
color: #cccccc;">     </span><span style=3D"color: #569cd6;">0118</span><sp=
an style=3D"color: #cccccc;">:python do_testimage() {</span></div><div><spa=
n style=3D"color: #cccccc;"> *** </span><span style=3D"color: #569cd6;">011=
9</span><span style=3D"color: #cccccc;">:    testimage_main(d)</span></div>=
<div><span style=3D"color: #cccccc;">     </span><span style=3D"color: #569=
cd6;">0120</span><span style=3D"color: #cccccc;">:}</span></div><div><span =
style=3D"color: #cccccc;">     </span><span style=3D"color: #569cd6;">0121<=
/span><span style=3D"color: #cccccc;">:</span></div><div><span style=3D"col=
or: #cccccc;">     </span><span style=3D"color: #569cd6;">0122</span><span =
style=3D"color: #cccccc;">:addtask testimage</span></div><div><span style=
=3D"color: #cccccc;">     </span><span style=3D"color: #569cd6;">0123</span=
><span style=3D"color: #cccccc;">:do_testimage[nostamp] =3D </span><span st=
yle=3D"color: #ce9178;">"1"</span></div><div><span style=3D"color: #cccccc;=
">File: </span><span style=3D"color: #ce9178;">'/home/adrian/projets/oss/po=
ky/meta/classes-recipe/testimage.bbclass'</span><span style=3D"color: #cccc=
cc;">, lineno: </span><span style=3D"color: #569cd6;">397</span><span style=
=3D"color: #cccccc;">, function: testimage_main</span></div><div><span styl=
e=3D"color: #cccccc;">     </span><span style=3D"color: #569cd6;">0393</spa=
n><span style=3D"color: #cccccc;">:    orig_sigterm_handler =3D </span><spa=
n style=3D"color: #569cd6;">signal.signal</span><span style=3D"color: #cccc=
cc;">(</span><span style=3D"color: #569cd6;">signal.SIGTERM</span><span sty=
le=3D"color: #cccccc;">, sigterm_exception)</span></div><div><span style=3D=
"color: #cccccc;">     </span><span style=3D"color: #569cd6;">0394</span><s=
pan style=3D"color: #cccccc;">:    try:</span></div><div><span style=3D"col=
or: #cccccc;">     </span><span style=3D"color: #569cd6;">0395</span><span =
style=3D"color: #cccccc;">:        # We need to check if runqemu ends unexp=
ectedly</span></div><div><span style=3D"color: #cccccc;">     </span><span =
style=3D"color: #569cd6;">0396</span><span style=3D"color: #cccccc;">:     =
   # or if the worker send us a SIGTERM</span></div><div><span style=3D"col=
or: #cccccc;"> *** </span><span style=3D"color: #569cd6;">0397</span><span =
style=3D"color: #cccccc;">:        </span><span style=3D"color: #569cd6;">t=
c.target.start</span><span style=3D"color: #cccccc;">(params=3D</span><span=
 style=3D"color: #569cd6;">d.getVar</span><span style=3D"color: #cccccc;">(=
</span><span style=3D"color: #ce9178;">"TEST_QEMUPARAMS"</span><span style=
=3D"color: #cccccc;">), runqemuparams=3D</span><span style=3D"color: #569cd=
6;">d.getVar</span><span style=3D"color: #cccccc;">(</span><span style=3D"c=
olor: #ce9178;">"TEST_RUNQEMUPARAMS"</span><span style=3D"color: #cccccc;">=
))</span></div><div><span style=3D"color: #cccccc;">     </span><span style=
=3D"color: #569cd6;">0398</span><span style=3D"color: #cccccc;">:        im=
port threading</span></div><div><span style=3D"color: #cccccc;">     </span=
><span style=3D"color: #569cd6;">0399</span><span style=3D"color: #cccccc;"=
>:        try:</span></div><div><span style=3D"color: #cccccc;">     </span=
><span style=3D"color: #569cd6;">0400</span><span style=3D"color: #cccccc;"=
>:            </span><span style=3D"color: #569cd6;">threading.Timer</span>=
<span style=3D"color: #cccccc;">(int(</span><span style=3D"color: #569cd6;"=
>d.getVar</span><span style=3D"color: #cccccc;">(</span><span style=3D"colo=
r: #ce9178;">"TEST_OVERALL_TIMEOUT"</span><span style=3D"color: #cccccc;">)=
), handle_test_timeout, (int(</span><span style=3D"color: #569cd6;">d.getVa=
r</span><span style=3D"color: #cccccc;">(</span><span style=3D"color: #ce91=
78;">"TEST_OVERALL_TIMEOUT"</span><span style=3D"color: #cccccc;">)),)).sta=
rt()</span></div><div><span style=3D"color: #cccccc;">     </span><span sty=
le=3D"color: #569cd6;">0401</span><span style=3D"color: #cccccc;">:        =
except ValueError:</span></div><div><span style=3D"color: #cccccc;">File: <=
/span><span style=3D"color: #ce9178;">'/home/adrian/projets/oss/poky/meta/l=
ib/oeqa/core/target/qemu.py'</span><span style=3D"color: #cccccc;">, lineno=
: </span><span style=3D"color: #569cd6;">91</span><span style=3D"color: #cc=
cccc;">, function: start</span></div><div><span style=3D"color: #cccccc;"> =
    </span><span style=3D"color: #569cd6;">0087</span><span style=3D"color:=
 #cccccc;">:            except (</span><span style=3D"color: #569cd6;">subp=
rocess.CalledProcessError</span><span style=3D"color: #cccccc;">, </span><s=
pan style=3D"color: #569cd6;">subprocess.TimeoutExpired</span><span style=
=3D"color: #cccccc;">, FileNotFoundError) as err:</span></div><div><span st=
yle=3D"color: #cccccc;">     </span><span style=3D"color: #569cd6;">0088</s=
pan><span style=3D"color: #cccccc;">:                msg +=3D </span><span =
style=3D"color: #ce9178;">"Error running command: %s\n%s\n"</span><span sty=
le=3D"color: #cccccc;"> % (blcmd, err)</span></div><div><span style=3D"colo=
r: #cccccc;">     </span><span style=3D"color: #569cd6;">0089</span><span s=
tyle=3D"color: #cccccc;">:            msg +=3D </span><span style=3D"color:=
 #ce9178;">"\n\n=3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D\n"</span></div=
><div><span style=3D"color: #cccccc;">     </span><span style=3D"color: #56=
9cd6;">0090</span><span style=3D"color: #cccccc;">:</span></div><div><span =
style=3D"color: #cccccc;"> *** </span><span style=3D"color: #569cd6;">0091<=
/span><span style=3D"color: #cccccc;">:            raise RuntimeError(</spa=
n><span style=3D"color: #ce9178;">"FAILED to start qemu - check the task lo=
g and the boot log %s"</span><span style=3D"color: #cccccc;"> % (msg))</spa=
n></div><div><span style=3D"color: #cccccc;">     </span><span style=3D"col=
or: #569cd6;">0092</span><span style=3D"color: #cccccc;">:</span></div><div=
><span style=3D"color: #cccccc;">     </span><span style=3D"color: #569cd6;=
">0093</span><span style=3D"color: #cccccc;">:    def stop(self):</span></d=
iv><div><span style=3D"color: #cccccc;">     </span><span style=3D"color: #=
569cd6;">0094</span><span style=3D"color: #cccccc;">:        </span><span s=
tyle=3D"color: #569cd6;">self.runner.stop</span><span style=3D"color: #cccc=
cc;">()</span></div><div><span style=3D"color: #ce9178;font-style: italic;"=
>Exception</span><span style=3D"color: #cccccc;">: RuntimeError: FAILED to =
start qemu - check the task log and the boot log </span></div><br><div><spa=
n style=3D"color: #cccccc;">=3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D<=
/span></div><br><br><br><div><span style=3D"color: #cccccc;">=3D=3D=3D=3D=
=3D end: snippet =3D=3D=3D=3D=3D</span></div><br><div><span style=3D"color:=
 #cccccc;">=3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D</span></div><br><=
div><span style=3D"color: #ce9178;font-weight: bold;">Error</span><span sty=
le=3D"color: #cccccc;"> running command: [</span><span style=3D"color: #ce9=
178;">'tail'</span><span style=3D"color: #cccccc;">, </span><span style=3D"=
color: #ce9178;">'-20'</span><span style=3D"color: #cccccc;">, </span><span=
 style=3D"color: #ce9178;">'/home/adrian/projets/oss/poky/build-st-2701801/=
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_l=
og.20240208013616'</span><span style=3D"color: #cccccc;">]</span></div><div=
><span style=3D"color: #cccccc;">Command </span><span style=3D"color: #ce91=
78;">'['</span><span style=3D"color: #cccccc;">tail', </span><span style=3D=
"color: #ce9178;">'-20'</span><span style=3D"color: #cccccc;">, </span><spa=
n style=3D"color: #ce9178;">'/home/adrian/projets/oss/poky/build-st-2701801=
/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_=
log.20240208013616'</span><span style=3D"color: #cccccc;">]' returned non-z=
ero exit status </span><span style=3D"color: #569cd6;">1</span><span style=
=3D"color: #cccccc;">.</span></div><br><br><div><span style=3D"color: #cccc=
cc;">=3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D</span></div><br><br><div>=
<span style=3D"color: #ce9178;font-weight: bold;">ERROR</span><span style=
=3D"color: #cccccc;">: Logfile of failure stored in: /home/adrian/projets/o=
ss/poky/build-st-</span><span style=3D"color: #569cd6;">2701801</span><span=
 style=3D"color: #cccccc;">/tmp/work/qemux86_64-poky-linux/core-image-minim=
al/</span><span style=3D"color: #569cd6;">1</span><span style=3D"color: #cc=
cccc;">.</span><span style=3D"color: #569cd6;">0</span><span style=3D"color=
: #cccccc;">/temp/log.</span><span style=3D"color: #569cd6;">do_testimage.3=
501104</span></div><div><span style=3D"color: #cccccc;">NOTE: recipe </span=
><span style=3D"color: #569cd6;">core-image-minimal-1.0-r0</span><span styl=
e=3D"color: #cccccc;">: task do_testimage: Failed</span></div><div><span st=
yle=3D"color: #ce9178;font-weight: bold;">ERROR</span><span style=3D"color:=
 #cccccc;">: Task (/home/adrian/projets/oss/poky/meta/recipes-core/images/c=
ore-</span><span style=3D"color: #569cd6;">image-minimal.bb</span><span sty=
le=3D"color: #cccccc;">:do_testimage) failed with exit code </span><span st=
yle=3D"color: #ce9178;">'1'</span></div><div><span style=3D"color: #cccccc;=
">NOTE: Tasks Summary: Attempted </span><span style=3D"color: #569cd6;">171=
6</span><span style=3D"color: #cccccc;"> tasks of which </span><span style=
=3D"color: #569cd6;">1715</span><span style=3D"color: #cccccc;"> didn't nee=
d to be rerun and </span><span style=3D"color: #569cd6;">1</span><span styl=
e=3D"color: #cccccc;"> failed.</span></div><br><div><span style=3D"color: #=
cccccc;">Summary: </span><span style=3D"color: #569cd6;">1</span><span styl=
e=3D"color: #cccccc;"> task failed:</span></div><div><span style=3D"color: =
#cccccc;">  /home/adrian/projets/oss/poky/meta/recipes-core/images/core-</s=
pan><span style=3D"color: #569cd6;">image-minimal.bb</span><span style=3D"c=
olor: #cccccc;">:do_testimage</span></div><div><span style=3D"color: #ccccc=
c;">Summary: There were </span><span style=3D"color: #569cd6;">4</span><spa=
n style=3D"color: #cccccc;"> </span><span style=3D"color: #ce9178;font-weig=
ht: bold;">ERROR</span><span style=3D"color: #cccccc;"> messages, returning=
 a non-zero exit code.</span></div><br><br><div><span style=3D"color: #cccc=
cc;">Stderr:</span></div><div><span style=3D"color: #6a9955;">2024-02-07</s=
pan><span style=3D"color: #cccccc;"> </span><span style=3D"color: #6a9955;"=
>22:42:37,482</span><span style=3D"color: #cccccc;"> - oe-selftest - </span=
><span style=3D"color: #b5cea8;">INFO</span><span style=3D"color: #cccccc;"=
> - Adding: </span><span style=3D"color: #ce9178;">"include selftest.inc"</=
span><span style=3D"color: #cccccc;"> in /home/adrian/projets/oss/poky/buil=
d-st-</span><span style=3D"color: #569cd6;">2701801</span><span style=3D"co=
lor: #cccccc;">/conf/local.conf</span></div><div><span style=3D"color: #6a9=
955;">2024-02-07</span><span style=3D"color: #cccccc;"> </span><span style=
=3D"color: #6a9955;">22:42:37,482</span><span style=3D"color: #cccccc;"> - =
oe-selftest - </span><span style=3D"color: #b5cea8;">INFO</span><span style=
=3D"color: #cccccc;"> - Adding: </span><span style=3D"color: #ce9178;">"inc=
lude bblayers.inc"</span><span style=3D"color: #cccccc;"> in </span><span s=
tyle=3D"color: #569cd6;">bblayers.conf</span></div><div><span style=3D"colo=
r: #cccccc;">/usr/lib64/python3.</span><span style=3D"color: #569cd6;">12</=
span><span style=3D"color: #cccccc;">/unittest/case.py:</span><span style=
=3D"color: #569cd6;">580</span><span style=3D"color: #cccccc;">: RuntimeWar=
ning: TestResult has no addDuration method</span></div><div><span style=3D"=
color: #cccccc;">  </span><span style=3D"color: #569cd6;">warnings.warn</sp=
an><span style=3D"color: #cccccc;">(</span><span style=3D"color: #ce9178;">=
"TestResult has no addDuration method"</span><span style=3D"color: #cccccc;=
">,</span></div><br><div><span style=3D"color: #cccccc;">/usr/lib64/python3=
.</span><span style=3D"color: #569cd6;">12</span><span style=3D"color: #ccc=
ccc;">/unittest/case.py:</span><span style=3D"color: #569cd6;">580</span><s=
pan style=3D"color: #cccccc;">: RuntimeWarning: TestResult has no addDurati=
on method</span></div><div><span style=3D"color: #cccccc;">  </span><span s=
tyle=3D"color: #569cd6;">warnings.warn</span><span style=3D"color: #cccccc;=
">(</span><span style=3D"color: #ce9178;">"TestResult has no addDuration me=
thod"</span><span style=3D"color: #cccccc;">,</span></div><br><div><span st=
yle=3D"color: #cccccc;">/usr/lib64/python3.</span><span style=3D"color: #56=
9cd6;">12</span><span style=3D"color: #cccccc;">/unittest/case.py:</span><s=
pan style=3D"color: #569cd6;">580</span><span style=3D"color: #cccccc;">: R=
untimeWarning: TestResult has no addDuration method</span></div><div><span =
style=3D"color: #cccccc;">  </span><span style=3D"color: #569cd6;">warnings=
.warn</span><span style=3D"color: #cccccc;">(</span><span style=3D"color: #=
ce9178;">"TestResult has no addDuration method"</span><span style=3D"color:=
 #cccccc;">,</span></div><br><div><span style=3D"color: #cccccc;">/usr/lib6=
4/python3.</span><span style=3D"color: #569cd6;">12</span><span style=3D"co=
lor: #cccccc;">/unittest/case.py:</span><span style=3D"color: #569cd6;">580=
</span><span style=3D"color: #cccccc;">: RuntimeWarning: TestResult has no =
addDuration method</span></div><div><span style=3D"color: #cccccc;">  </spa=
n><span style=3D"color: #569cd6;">warnings.warn</span><span style=3D"color:=
 #cccccc;">(</span><span style=3D"color: #ce9178;">"TestResult has no addDu=
ration method"</span><span style=3D"color: #cccccc;">,</span></div></div><d=
iv><br></div><div>Regards,</div><div>Adrian</div><div><br></div><div><br></=
div><div><br></div><div>On Thu, 2024-02-08 at 10:15 +0100, Alexander Kanavi=
n wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex"><div>On Thu, 8 Feb 2024 at 09:28, =
Adrian Freihofer</div><div>&lt;<a href=3D"mailto:adrian.freihofer@gmail.com=
">adrian.freihofer@gmail.com</a>&gt; wrote:</div><blockquote type=3D"cite" =
style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"=
><div>- runtime_test.TestImage.test_testimage_virgl_gtk_sdl: FAILED (1454.5=
8s)</div><div>&nbsp; No idea why this fails.</div></blockquote><div><br></d=
iv><div>If you can show the error that happens here, I can take a look.</di=
v><div><br></div><div>Alex</div></blockquote><div><br></div><div><br></div>=
<div><span></span></div></body></html>

--=-VDvq3hrnucCqxqGSCQak--

