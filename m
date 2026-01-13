Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DC5D29DE9
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 08:17:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54435.1768292227465834136
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 00:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1cmFOgNs;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 35C4F1A2824
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 08:17:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0969260732;
	Tue, 13 Jan 2026 08:17:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04383103C816C;
	Tue, 13 Jan 2026 09:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768292224; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5UBICkv3CIwhrQ/Nlp7bGB6cxsxJTVSzLDbKIGM9yIU=;
	b=1cmFOgNspJwZbu9R4yKcmSCb4HfbnO2FXsZzILiQ+wFifnVTOxlyq3vHamICXgW9akKZou
	6hEUvqukCXNvHvgDFGDpjknNY7AA1galEMymAw/2QWBc/0g+VZLel6aXycP1+w+7dlVWQW
	J6Fp4oEpOx6D4h5W4LkrqekdFLyfXUuFE/HUGNmiIkmD/PcNwqSNmMDmjRlPTPQTMGloqY
	EhhXaB9R0+Q/ovVklHeZ/kmzhhp40Lrafxr+r/f9mNJ6plC18OSzWo1i+tJPlfED3oxNe5
	FULYiQ1JYxlexIPUYATkCrCdjPQUhd2LMiq4SXK3xxkWXPeMxE1Fv/fNP49STA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 09:17:03 +0100
Message-Id: <DFNBA0VIZPB8.12G68QK151UGC@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 00/14] IDE SDK Improvements
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
In-Reply-To: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 08:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229231

Hi Adrian,

I think I hit a different error on the Autobuilder with your series:

2026-01-12 21:40:10,012 - oe-selftest - INFO - FAIL: devtool.DevtoolIdeSdkT=
ests.test_devtool_ide_sdk_code_cmake (subunit.RemotedTestCase)
2026-01-12 21:40:10,012 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2026-01-12 21:40:10,012 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3238, in test_de=
vtool_ide_sdk_code_cmake
    self._verify_launch_json_debugging(tempdir, qemu, recipe_name, example_=
exe)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3107, in _verify=
_launch_json_debugging
    self._verify_launch_config(tempdir, config, tasks, qemu, example_exe,
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3204, in _verify=
_launch_config
    r =3D runCmd(gdb_batch_cmd, output_log=3Dself._cmd_logger)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command '/srv/pokybuild/yocto-worker/oe-selftest-armhost/bu=
ild/build-st-241514/tmp/work/aarch64-linux/gdb-cross-aarch64/16.3/recipe-sy=
sroot-native/usr/bin/aarch64-poky-linux/aarch64-poky-linux-gdb --batch -ex =
'set sysroot /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st=
-241514/tmp/work/cortexa57-poky-linux/cmake-example/1.0/image' -ex 'python =
import sys;sys.path.insert(0, '"'"'/srv/pokybuild/yocto-worker/oe-selftest-=
armhost/build/build-st-241514/tmp/work/cortexa57-poky-linux/cmake-example/1=
.0/recipe-sysroot/usr/share/gcc-15.2.0/python'"'"');from libstdcxx.v6.print=
ers import register_libstdcxx_printers;register_libstdcxx_printers(None)' -=
ex 'set substitute-path /usr/include /srv/pokybuild/yocto-worker/oe-selftes=
t-armhost/build/build-st-241514/tmp/work/cortexa57-poky-linux/cmake-example=
/1.0/recipe-sysroot/usr/include' -ex 'set substitute-path /usr/src/debug/cm=
ake-example/1.0 /tmp/devtoolqa5x_myf_r' -ex 'set substitute-path /usr/src/d=
ebug /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-241514/=
tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/src/debu=
g' -ex 'set solib-search-path /srv/pokybuild/yocto-worker/oe-selftest-armho=
st/build/build-st-241514/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.=
0/rootfs-dbg/lib/.debug:/srv/pokybuild/yocto-worker/oe-selftest-armhost/bui=
ld/build-st-241514/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.0/root=
fs-dbg/usr/lib/.debug:/srv/pokybuild/yocto-worker/oe-selftest-armhost/build=
/build-st-241514/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.0/rootfs=
-dbg/usr/lib/debug:/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/bu=
ild-st-241514/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.0/rootfs-db=
g/lib:/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-241514=
/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/lib:/sr=
v/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-241514/tmp/work=
/qemuarm64-poky-linux/oe-selftest-image/1.0/rootfs/lib:/srv/pokybuild/yocto=
-worker/oe-selftest-armhost/build/build-st-241514/tmp/work/qemuarm64-poky-l=
inux/oe-selftest-image/1.0/rootfs/usr/lib' -ex 'file /srv/pokybuild/yocto-w=
orker/oe-selftest-armhost/build/build-st-241514/tmp/work/cortexa57-poky-lin=
ux/cmake-example/1.0/image/usr/bin/cmake-example' -ex 'target remote 192.16=
8.7.2:1234' -ex 'break main' -ex 'continue' -ex 'break CppExample::print_js=
on()' -ex 'continue' -ex 'print CppExample::test_string.compare("cpp-exampl=
e-lib Magic: 123456789")' -ex 'print CppExample::test_string.compare("cpp-e=
xample-lib Magic: 123456789aaa")' -ex 'list cpp-example-lib.hpp:14,14' -ex =
'list cpp-example.cpp:55,55' -ex 'break cpp-example.cpp:55' -ex 'continue' =
-ex 'print numbers' -ex 'continue'' returned non-zero exit status 1:
_start () at ../sysdeps/aarch64/dl-start.S:23
23	ENTRY (_start)
Breakpoint 1 at 0xaaaaaaaa1400: file /usr/src/debug/cmake-example/1.0/cpp-e=
xample.cpp, line 15.

Breakpoint 1, main (argc=3D1, argv=3D0xfffffffffd08) at /usr/src/debug/cmak=
e-example/1.0/cpp-example.cpp:15
15	{
Breakpoint 2 at 0xfffff7f91d70: file /usr/src/debug/cmake-example/1.0/cpp-e=
xample-lib.cpp, line 28.

Breakpoint 2, CppExample::print_json (this=3D0xfffffffffac8) at /usr/src/de=
bug/cmake-example/1.0/cpp-example-lib.cpp:28
28	    jobj =3D json_object_new_object();
$1 =3D 0
$2 =3D -3
14	    inline static const std::string test_string =3D "cpp-example-lib Mag=
ic: 123456789";
55	    std::vector<int> numbers =3D {1, 2, 3};
No compiled code for line 55 in file "cpp-example.cpp".
Make breakpoint pending on future shared library load? (y or [n]) [answered=
 N; input not from terminal]
[Inferior 1 (process 333) exited normally]
A syntax error in expression, near the end of `numbers'.
The program is not being run.

It's also on an Arm host as Mathieu also noticed previously.

Can you have a look?

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3145
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4913998/raw_inlin=
e

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


