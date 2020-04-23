Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.5974.1587647889570413469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 06:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kvayEWlg;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id y4so6170637ljn.7
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GKQFIFB2qiFZHw0odEuOVtkjXQfw5NYhguSXtWV9xtI=;
        b=kvayEWlgwME+B0vt2xkGlCbgj8t9oi7QYilNngyPqNQzHF/l7KT1jNgcsNobGP4jbL
         Iu3TDmF8oJjOyGiLSSFb29fksg0FeMARVhDksm8Te88LCBLGwHNmJ04RXMR2ZwFMMAm3
         nMlujJmfSYS/+5YiC2Kti1NFBchWxliyDNancQMhiFn2c2v6BeiV/Rsq8aVDzBScZq3t
         ko06YDP75VSBkKI25OvmQsdESGNMwygiawg8bmNItEsaaOKBY4cRyfWo7UsDpllaNVIU
         bYj3hdSOWe/OVQHzuAxxSXvs5W/ETIWedHk4mk3dwP4fzqy8YBXmCo2Exhv/UTciJpud
         yoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GKQFIFB2qiFZHw0odEuOVtkjXQfw5NYhguSXtWV9xtI=;
        b=r+jZ4FYYW/wH4GDCuce8CZa+X6uctr33EdA4284xMMvqz0eFmiBjvHvpCRB19Tv8TG
         KqEK8e7nTylUCdzqSUhdm8GRYiH7ViMx8FYXeecnO07sWh8952ZPDhWRfwnpYdCq043n
         rHOJhQpE81ZC+nViUhlS04/xlk1IbHe+xBQ3DGUIqJldiqG4f3hD2fl8y1f+TzoS0ie2
         URPCA5FGXuUTpicQHSmE08lDxlHySNEcEJn01SNzJqO6Zk92LhQvUwIsYOczWImf0FFh
         ayi29UaJCxCnCJixG62gMxyRYgEE2nU2UhfFyD6THHRJqHDxRU+jdIQGGG/cj45cKTg+
         pHdw==
X-Gm-Message-State: AGi0PuZ2ZZtDg6VBntIf+J/IfreWIco9sigtJbBjIbVHtln71XFiwNBN
	FXwpo1F3qpvGb/+Rx1M+n9jnnm5YypsEGWbR+Fc=
X-Google-Smtp-Source: APiQypIfbL3BftIq5BdCzu8mIHDw5IKz9O0fDbcvf7DGZ5kZ8vTxVeg721Y1pXh8h0BBH/JOQhMiZpXj8r08TRAesMo=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr2300067ljn.125.1587647887241;
 Thu, 23 Apr 2020 06:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200419063539.1467641-1-ricardo@ribalda.com> <258be2a52105a49413b954df67e61444dc73492e.camel@linuxfoundation.org>
 <CAPybu_1XdULtkfUQsjTa=PvuyUECKpNLoFXX95F_+Ly3=fbqBg@mail.gmail.com>
 <ebb64c86224b51b49b1d86f864566ecd91696f95.camel@linuxfoundation.org> <16086D1E57B63D5A.14079@lists.openembedded.org>
In-Reply-To: <16086D1E57B63D5A.14079@lists.openembedded.org>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Thu, 23 Apr 2020 15:17:51 +0200
Message-ID: <CAPybu_16DsHfqq-Frixoq+ySqCbb2qvGmapZR-UbKGgmT8sJyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v7 00/10] Fix permissions and embed-rotofs
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Paul Barker <pbarker@konsulko.com>
Content-Type: text/plain; charset="UTF-8"

On my setup, using debian crops the error is even different :(

If you want I can keep trying, otherwise I will leave it to the experts ;)


Best regards!

pokyuser@e81a7801004c:/workdir/build$ oe-selftest  -r
wic.Wic2.test_biosplusefi_plugin_qemu wic.Wic2.test_expand_mbr_image
wic.Wic2.test_qemu wic.Wic2.test_qemu_efi
wic.Wic2.test_rawcopy_plugin_qemu
2020-04-23 09:50:45,488 - oe-selftest - WARNING - meta-selftest layer
not found in BBLAYERS, adding it
2020-04-23 09:50:50,587 - oe-selftest - ERROR - Please unset
SANITY_TESTED_DISTROS in order to run oe-selftest
pokyuser@e81a7801004c:/workdir/build$ oe-selftest  -r
wic.Wic2.test_biosplusefi_plugin_qemu wic.Wic2.test_expand_mbr_image
wic.Wic2.test_qemu wic.Wic2.test_qemu_efi
wic.Wic2.test_rawcopy_plugin_qemu
2020-04-23 09:51:46,909 - oe-selftest - INFO - Adding layer libraries:
2020-04-23 09:51:46,910 - oe-selftest - INFO - /workdir/meta/lib
2020-04-23 09:51:46,910 - oe-selftest - INFO - /workdir/meta-yocto-bsp/lib
2020-04-23 09:51:46,910 - oe-selftest - INFO - /workdir/meta-selftest/lib
2020-04-23 09:51:46,912 - oe-selftest - INFO - Running bitbake -e to
test the configuration is valid/parsable
2020-04-23 09:51:50,683 - oe-selftest - INFO - Adding: "include
selftest.inc" in /workdir/build-st/conf/local.conf
2020-04-23 09:51:50,684 - oe-selftest - INFO - Adding: "include
bblayers.inc" in bblayers.conf
2020-04-23 09:51:50,685 - oe-selftest - INFO -
test_biosplusefi_plugin_qemu (wic.Wic2)
2020-04-23 11:15:10,685 - oe-selftest - INFO - Keepalive message
2020-04-23 12:38:30,687 - oe-selftest - INFO - Keepalive message
2020-04-23 12:46:55,356 - oe-selftest - INFO -  ... ERROR

Stdout:
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423124632
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423124632
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:57999
Created listening socket for qemu serial console on: 127.0.0.1:45643
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
tcpserial=57999:45643 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2137514
waiting at most 120 seconds for qemu pid (04/23/20 12:46:35)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231246_qemu
2020-04-23 12:46:55,357 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 42, in wrapped_f
    return func(*args, **kwargs)
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 732, in
test_biosplusefi_plugin_qemu
    with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/workdir/meta/lib/oeqa/utils/commands.py", line 342, in runqemu
    qemu.start(params=qemuparams, ssh=ssh,
runqemuparams=runqemuparams, launch_cmd=launch_cmd,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/targetcontrol.py", line 167, in start
    start = self.runner.start(params, get_ip=ssh,
extra_bootparams=extra_bootparams, runqemuparams=runqemuparams,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 166, in start
    return self.launch(launch_cmd, qemuparams=qemuparams,
get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 245, in launch
    time.sleep(0.5)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 128, in handleSIGCHLD
    raise SystemExit
SystemExit

Stdout:
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423124632
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423124632
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:57999
Created listening socket for qemu serial console on: 127.0.0.1:45643
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
tcpserial=57999:45643 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2137514
waiting at most 120 seconds for qemu pid (04/23/20 12:46:35)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231246_qemu

2020-04-23 12:46:55,357 - oe-selftest - INFO - test_expand_mbr_image (wic.Wic2)
2020-04-23 12:48:53,064 - oe-selftest - INFO -  ... ERROR

Stdout:
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423124830
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423124830
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:39485
Created listening socket for qemu serial console on: 127.0.0.1:51903
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4
tcpserial=39485:51903 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2144564
waiting at most 120 seconds for qemu pid (04/23/20 12:48:32)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231248_qemu
2020-04-23 12:48:53,065 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 1002, in
test_expand_mbr_image
    with runqemu('core-image-minimal', ssh=False) as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/workdir/meta/lib/oeqa/utils/commands.py", line 342, in runqemu
    qemu.start(params=qemuparams, ssh=ssh,
runqemuparams=runqemuparams, launch_cmd=launch_cmd,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/targetcontrol.py", line 167, in start
    start = self.runner.start(params, get_ip=ssh,
extra_bootparams=extra_bootparams, runqemuparams=runqemuparams,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 166, in start
    return self.launch(launch_cmd, qemuparams=qemuparams,
get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 245, in launch
    time.sleep(0.5)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 128, in handleSIGCHLD
    raise SystemExit
SystemExit

Stdout:
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423124830
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423124830
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:39485
Created listening socket for qemu serial console on: 127.0.0.1:51903
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4
tcpserial=39485:51903 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2144564
waiting at most 120 seconds for qemu pid (04/23/20 12:48:32)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231248_qemu

2020-04-23 12:48:53,065 - oe-selftest - INFO - test_qemu (wic.Wic2)
2020-04-23 12:50:55,372 - oe-selftest - INFO -  ... ERROR

Stdout:
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/wic-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423125032
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/testimage/ssh_target_log.20200423125032
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:41315
Created listening socket for qemu serial console on: 127.0.0.1:58191
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/wic-image-minimal-qemux86-64.wic
tcpserial=41315:58191 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2152208
waiting at most 120 seconds for qemu pid (04/23/20 12:50:35)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231250_qemu
2020-04-23 12:50:55,373 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 42, in wrapped_f
    return func(*args, **kwargs)
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 605, in test_qemu
    with runqemu('wic-image-minimal', ssh=False) as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/workdir/meta/lib/oeqa/utils/commands.py", line 342, in runqemu
    qemu.start(params=qemuparams, ssh=ssh,
runqemuparams=runqemuparams, launch_cmd=launch_cmd,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/targetcontrol.py", line 167, in start
    start = self.runner.start(params, get_ip=ssh,
extra_bootparams=extra_bootparams, runqemuparams=runqemuparams,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 166, in start
    return self.launch(launch_cmd, qemuparams=qemuparams,
get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 245, in launch
    time.sleep(0.5)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 128, in handleSIGCHLD
    raise SystemExit
SystemExit

Stdout:
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/wic-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423125032
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/testimage/ssh_target_log.20200423125032
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:41315
Created listening socket for qemu serial console on: 127.0.0.1:58191
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/wic-image-minimal-qemux86-64.wic
tcpserial=41315:58191 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2152208
waiting at most 120 seconds for qemu pid (04/23/20 12:50:35)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231250_qemu

2020-04-23 12:50:55,373 - oe-selftest - INFO - test_qemu_efi (wic.Wic2)
2020-04-23 13:03:49,786 - oe-selftest - INFO -  ... ERROR

Stdout:
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423130327
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423130327
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:41257
Created listening socket for qemu serial console on: 127.0.0.1:53105
launchcmd=runqemu snapshot nographic ovmf qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
tcpserial=41257:53105 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2168394
waiting at most 120 seconds for qemu pid (04/23/20 13:03:29)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231303_qemu
2020-04-23 13:03:49,787 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 42, in wrapped_f
    return func(*args, **kwargs)
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 625, in
test_qemu_efi
    runqemuparams='ovmf', image_fstype='wic') as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/workdir/meta/lib/oeqa/utils/commands.py", line 342, in runqemu
    qemu.start(params=qemuparams, ssh=ssh,
runqemuparams=runqemuparams, launch_cmd=launch_cmd,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/targetcontrol.py", line 167, in start
    start = self.runner.start(params, get_ip=ssh,
extra_bootparams=extra_bootparams, runqemuparams=runqemuparams,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 166, in start
    return self.launch(launch_cmd, qemuparams=qemuparams,
get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 245, in launch
    time.sleep(0.5)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 128, in handleSIGCHLD
    raise SystemExit
SystemExit

Stdout:
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423130327
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423130327
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:41257
Created listening socket for qemu serial console on: 127.0.0.1:53105
launchcmd=runqemu snapshot nographic ovmf qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
tcpserial=41257:53105 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2168394
waiting at most 120 seconds for qemu pid (04/23/20 13:03:29)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231303_qemu

2020-04-23 13:03:49,787 - oe-selftest - INFO -
test_rawcopy_plugin_qemu (wic.Wic2)
2020-04-23 13:07:15,387 - oe-selftest - INFO -  ... ERROR

Stdout:
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423130652
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423130652
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:39627
Created listening socket for qemu serial console on: 127.0.0.1:37345
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
tcpserial=39627:37345 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2182265
waiting at most 120 seconds for qemu pid (04/23/20 13:06:55)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231306_qemu
2020-04-23 13:07:15,387 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 42, in wrapped_f
    return func(*args, **kwargs)
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 702, in
test_rawcopy_plugin_qemu
    with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/workdir/meta/lib/oeqa/utils/commands.py", line 342, in runqemu
    qemu.start(params=qemuparams, ssh=ssh,
runqemuparams=runqemuparams, launch_cmd=launch_cmd,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/targetcontrol.py", line 167, in start
    start = self.runner.start(params, get_ip=ssh,
extra_bootparams=extra_bootparams, runqemuparams=runqemuparams,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 166, in start
    return self.launch(launch_cmd, qemuparams=qemuparams,
get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 245, in launch
    time.sleep(0.5)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 128, in handleSIGCHLD
    raise SystemExit
SystemExit

Stdout:
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423130652
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423130652
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:39627
Created listening socket for qemu serial console on: 127.0.0.1:37345
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
tcpserial=39627:37345 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2182265
waiting at most 120 seconds for qemu pid (04/23/20 13:06:55)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231306_qemu

2020-04-23 13:07:15,388 - oe-selftest - INFO -
======================================================================
2020-04-23 13:07:15,389 - oe-selftest - INFO - ERROR:
test_biosplusefi_plugin_qemu (wic.Wic2)
2020-04-23 13:07:15,389 - oe-selftest - INFO -
----------------------------------------------------------------------
2020-04-23 13:07:15,389 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 42, in wrapped_f
    return func(*args, **kwargs)
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 732, in
test_biosplusefi_plugin_qemu
    with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/workdir/meta/lib/oeqa/utils/commands.py", line 342, in runqemu
    qemu.start(params=qemuparams, ssh=ssh,
runqemuparams=runqemuparams, launch_cmd=launch_cmd,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/targetcontrol.py", line 167, in start
    start = self.runner.start(params, get_ip=ssh,
extra_bootparams=extra_bootparams, runqemuparams=runqemuparams,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 166, in start
    return self.launch(launch_cmd, qemuparams=qemuparams,
get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 245, in launch
    time.sleep(0.5)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 128, in handleSIGCHLD
    raise SystemExit
SystemExit

Stdout:
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423124632
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423124632
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:57999
Created listening socket for qemu serial console on: 127.0.0.1:45643
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
tcpserial=57999:45643 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2137514
waiting at most 120 seconds for qemu pid (04/23/20 12:46:35)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231246_qemu
======================================================================
2020-04-23 13:07:15,389 - oe-selftest - INFO - ERROR:
test_expand_mbr_image (wic.Wic2)
2020-04-23 13:07:15,390 - oe-selftest - INFO -
----------------------------------------------------------------------
2020-04-23 13:07:15,390 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 1002, in
test_expand_mbr_image
    with runqemu('core-image-minimal', ssh=False) as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/workdir/meta/lib/oeqa/utils/commands.py", line 342, in runqemu
    qemu.start(params=qemuparams, ssh=ssh,
runqemuparams=runqemuparams, launch_cmd=launch_cmd,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/targetcontrol.py", line 167, in start
    start = self.runner.start(params, get_ip=ssh,
extra_bootparams=extra_bootparams, runqemuparams=runqemuparams,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 166, in start
    return self.launch(launch_cmd, qemuparams=qemuparams,
get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 245, in launch
    time.sleep(0.5)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 128, in handleSIGCHLD
    raise SystemExit
SystemExit

Stdout:
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423124830
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423124830
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:39485
Created listening socket for qemu serial console on: 127.0.0.1:51903
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.ext4
tcpserial=39485:51903 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2144564
waiting at most 120 seconds for qemu pid (04/23/20 12:48:32)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231248_qemu
======================================================================
2020-04-23 13:07:15,390 - oe-selftest - INFO - ERROR: test_qemu (wic.Wic2)
2020-04-23 13:07:15,391 - oe-selftest - INFO -
----------------------------------------------------------------------
2020-04-23 13:07:15,391 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 42, in wrapped_f
    return func(*args, **kwargs)
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 605, in test_qemu
    with runqemu('wic-image-minimal', ssh=False) as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/workdir/meta/lib/oeqa/utils/commands.py", line 342, in runqemu
    qemu.start(params=qemuparams, ssh=ssh,
runqemuparams=runqemuparams, launch_cmd=launch_cmd,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/targetcontrol.py", line 167, in start
    start = self.runner.start(params, get_ip=ssh,
extra_bootparams=extra_bootparams, runqemuparams=runqemuparams,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 166, in start
    return self.launch(launch_cmd, qemuparams=qemuparams,
get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 245, in launch
    time.sleep(0.5)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 128, in handleSIGCHLD
    raise SystemExit
SystemExit

Stdout:
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/wic-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423125032
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/wic-image-minimal/1.0-r0/testimage/ssh_target_log.20200423125032
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:41315
Created listening socket for qemu serial console on: 127.0.0.1:58191
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/wic-image-minimal-qemux86-64.wic
tcpserial=41315:58191 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2152208
waiting at most 120 seconds for qemu pid (04/23/20 12:50:35)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231250_qemu
======================================================================
2020-04-23 13:07:15,391 - oe-selftest - INFO - ERROR: test_qemu_efi (wic.Wic2)
2020-04-23 13:07:15,392 - oe-selftest - INFO -
----------------------------------------------------------------------
2020-04-23 13:07:15,392 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 42, in wrapped_f
    return func(*args, **kwargs)
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 625, in
test_qemu_efi
    runqemuparams='ovmf', image_fstype='wic') as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/workdir/meta/lib/oeqa/utils/commands.py", line 342, in runqemu
    qemu.start(params=qemuparams, ssh=ssh,
runqemuparams=runqemuparams, launch_cmd=launch_cmd,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/targetcontrol.py", line 167, in start
    start = self.runner.start(params, get_ip=ssh,
extra_bootparams=extra_bootparams, runqemuparams=runqemuparams,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 166, in start
    return self.launch(launch_cmd, qemuparams=qemuparams,
get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 245, in launch
    time.sleep(0.5)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 128, in handleSIGCHLD
    raise SystemExit
SystemExit

Stdout:
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423130327
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423130327
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:41257
Created listening socket for qemu serial console on: 127.0.0.1:53105
launchcmd=runqemu snapshot nographic ovmf qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
tcpserial=41257:53105 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2168394
waiting at most 120 seconds for qemu pid (04/23/20 13:03:29)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231303_qemu
======================================================================
2020-04-23 13:07:15,392 - oe-selftest - INFO - ERROR:
test_rawcopy_plugin_qemu (wic.Wic2)
2020-04-23 13:07:15,392 - oe-selftest - INFO -
----------------------------------------------------------------------
2020-04-23 13:07:15,393 - oe-selftest - INFO - Traceback (most recent
call last):
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 42, in wrapped_f
    return func(*args, **kwargs)
  File "/workdir/meta/lib/oeqa/selftest/cases/wic.py", line 702, in
test_rawcopy_plugin_qemu
    with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
  File "/usr/lib/python3.5/contextlib.py", line 59, in __enter__
    return next(self.gen)
  File "/workdir/meta/lib/oeqa/utils/commands.py", line 342, in runqemu
    qemu.start(params=qemuparams, ssh=ssh,
runqemuparams=runqemuparams, launch_cmd=launch_cmd,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/targetcontrol.py", line 167, in start
    start = self.runner.start(params, get_ip=ssh,
extra_bootparams=extra_bootparams, runqemuparams=runqemuparams,
discard_writes=discard_writes)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 166, in start
    return self.launch(launch_cmd, qemuparams=qemuparams,
get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 245, in launch
    time.sleep(0.5)
  File "/workdir/meta/lib/oeqa/utils/qemurunner.py", line 128, in handleSIGCHLD
    raise SystemExit
SystemExit

Stdout:
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
rootfs file: /workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Qemu log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/qemu_boot_log.20200423130652
SSH log file: /workdir/build-st/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testimage/ssh_target_log.20200423130652
Not using kvm for runqemu
Created listening socket for qemu serial console on: 127.0.0.1:39627
Created listening socket for qemu serial console on: 127.0.0.1:37345
launchcmd=runqemu snapshot nographic  qemux86-64
/workdir/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
tcpserial=39627:37345 bootparams="console=tty1 console=ttyS0,115200n8
printk.time=1" qemuparams="-pidfile pidfile_135"
runqemu started, pid is 2182265
waiting at most 120 seconds for qemu pid (04/23/20 13:06:55)
runqemu exited with code 1
Output from runqemu:
runqemu - ERROR - TUN control device /dev/net/tun is unavailable; you
may need to enable TUN (e.g. sudo modprobe tun)
runqemu - INFO - Cleaning up

Sending SIGTERM to runqemu
Qemu ended unexpectedly, dump data from host is in
/workdir/build-st/tmp/log/runtime-hostdump/202004231306_qemu
----------------------------------------------------------------------
2020-04-23 13:07:15,393 - oe-selftest - INFO - Ran 5 tests in 11724.705s
2020-04-23 13:07:15,393 - oe-selftest - INFO - FAILED
2020-04-23 13:07:15,394 - oe-selftest - INFO -  (errors=5)
2020-04-23 13:07:20,028 - oe-selftest - INFO - RESULTS:
2020-04-23 13:07:20,030 - oe-selftest - INFO - RESULTS -
wic.Wic2.test_biosplusefi_plugin_qemu: ERROR (10504.67s)
2020-04-23 13:07:20,030 - oe-selftest - INFO - RESULTS -
wic.Wic2.test_expand_mbr_image: ERROR (117.71s)
2020-04-23 13:07:20,030 - oe-selftest - INFO - RESULTS -
wic.Wic2.test_qemu: ERROR (122.31s)
2020-04-23 13:07:20,031 - oe-selftest - INFO - RESULTS -
wic.Wic2.test_qemu_efi: ERROR (774.41s)
2020-04-23 13:07:20,031 - oe-selftest - INFO - RESULTS -
wic.Wic2.test_rawcopy_plugin_qemu: ERROR (205.60s)
2020-04-23 13:07:20,033 - oe-selftest - INFO - SUMMARY:
2020-04-23 13:07:20,033 - oe-selftest - INFO - oe-selftest () - Ran 5
tests in 11726.658s
2020-04-23 13:07:20,033 - oe-selftest - INFO - oe-selftest - FAIL -
Required tests failed (successes=0, skipped=0, failures=0, errors=5)

On Thu, Apr 23, 2020 at 12:47 PM Ricardo Ribalda via
lists.openembedded.org
<ricardo.ribalda=gmail.com@lists.openembedded.org> wrote:
>
> On Thu, Apr 23, 2020 at 12:45 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2020-04-23 at 11:57 +0200, Ricardo Ribalda Delgado wrote:
> > > Hi Richard
> > >
> > > Thanks for the test.
> > >
> > > All the errors seem to have the same pattern:
> > >
> > > FileNotFoundError: [Errno 2] No such file or directory:
> > > '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-
> > > 27135/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0-
> > > r0/testimage/qemurunner_log.20200423015612'
> > >
> > > I do not believe that it is related to my patchset, I have seen that
> > > you are already running the selftest without the patchset
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/850
> > >
> > > Lets see if it also crashes or not. I am also trying to replicate
> > > locally.
> >
> > It did recur:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/862
> >
> > so your patches are probably not the cause, sorry! :)
>
> No problem, thanks!
>
> I am trying to replicate it anyway here. If I find a problem I will ping you.
>
> >
> > I'll continue to try and track it down.
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> Ricardo Ribalda
> 



-- 
Ricardo Ribalda
