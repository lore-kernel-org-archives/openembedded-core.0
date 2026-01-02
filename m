Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D20FA374F
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 14:44:09 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6152.1767365046635496163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 06:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ifP9KSui;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 896F01A25D2
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Jan 2026 14:44:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4ABF3606C7;
	Fri,  2 Jan 2026 14:44:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19605113B071B;
	Fri,  2 Jan 2026 15:44:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767365043; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rfkXOz/2BeTtZjUjiwzEYDivMeH8CSAyCm5j67FrT3c=;
	b=ifP9KSui84WbTEcY9NVp+PkSFnqUmgwLv/v2Xnz8ArYJsdSpCAqVwOxx34Yg+zuxfWHj/u
	FTyyG2qdhut3gr4u1t7qj9l7NJdkN0Wc8X468XQdVKQFDctfg4x9mNqxGA33sIKw8untTX
	iz7qR068WEQyKcfc1/BlZ60ppQ3NF/zXxw5EKL1+BQq2CsJtj/aDZ4Sox2NjMn9tUwd7Pe
	Bj6fLGjT3DPI2ye2RLC8V0BHYVdl5ggx7fPMyKfr1kwCHDm1VvFJRaJsV8FxHr8avIRnxy
	c2qUcy2rk+/SjJI7jv5CqW23iWdVRx0n2mTZVxWyfSO/KKXPAnvmLg0ogKPdsg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Jan 2026 15:44:01 +0100
Message-Id: <DFE6MBAAWOB4.26A0XX5Y79R3F@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 13/14] oe-selftest: devtool: add test for
 gdb pretty-printing
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
 <20251231114718.4031606-14-adrian.freihofer@siemens.com>
In-Reply-To: <20251231114718.4031606-14-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 14:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228848

On Wed Dec 31, 2025 at 12:46 PM CET, Adrian Freihofer via lists.openembedde=
d.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> This extends the existing devtool IDE SDK tests to verify that gdb
> pretty-printing is working correctly.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---

Hi Adrian,

Thanks for the new version, but it looks like it is still failing:

2026-01-02 10:09:04,822 - oe-selftest - INFO - 11: 2/36 112/655 (365.52s) (=
0 failed) (devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_cmake)
2026-01-02 10:09:04,822 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3237, in test_de=
vtool_ide_sdk_code_cmake
    self._verify_launch_json_debugging(tempdir, qemu, recipe_name, example_=
exe)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3106, in _verify=
_launch_json_debugging
    self._verify_launch_config(tempdir, config, tasks, qemu, example_exe,
    ~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                               self._gdb_debug_cpp_example, self._gdb_debug=
_cpp_example_check)
                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3206, in _verify=
_launch_config
    debug_check_func(r.output, DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 2750, in _gdb_de=
bug_cpp_example_check
    self.assertRegex(gdb_output, r"\$\d+ =3D std::vector of length 3, capac=
ity 3 =3D \{1, 2, 3\}")
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.13/unittest/case.py", line 1369, in assertRegex
    raise self.failureException(msg)
AssertionError: Regex didn't match: '\\$\\d+ =3D std::vector of length 3, c=
apacity 3 =3D \\{1, 2, 3\\}' not found in '_start () at ../sysdeps/aarch64/=
dl-start.S:23\n23\tENTRY (_start)\nBreakpoint 1 at 0xaaaaaaaa1400: file /us=
r/src/debug/cmake-example/1.0/cpp-example.cpp, line 15.\n\nBreakpoint 1, ma=
in (argc=3D1, argv=3D0xfffffffffd08) at /usr/src/debug/cmake-example/1.0/cp=
p-example.cpp:15\n15\t{\nBreakpoint 2 at 0xfffff7f91d70: file /usr/src/debu=
g/cmake-example/1.0/cpp-example-lib.cpp, line 28.\n\nBreakpoint 2, CppExamp=
le::print_json (this=3D0xfffffffffac8) at /usr/src/debug/cmake-example/1.0/=
cpp-example-lib.cpp:28\n28\t    jobj =3D json_object_new_object();\n$1 =3D =
0\n$2 =3D -3\n14\t    inline static const std::string test_string =3D "cpp-=
example-lib Magic: 123456789";\n55\t    std::vector<int> numbers =3D {1, 2,=
 3};\nBreakpoint 3 at 0xaaaaaaaa1780: file /usr/src/debug/cmake-example/1.0=
/cpp-example.cpp, line 56.\n\nBreakpoint 3, std::uninitialized_copy<int con=
st*, int*> (__first=3D<optimized out>, __last=3D<optimized out>, __result=
=3D<optimized out>) at /usr/src/debug/cmake-example/1.0/cpp-example.cpp:56\=
n56\t    std::cout << "Traversing std::vector<int> numbers:" << std::endl;\=
nAttempt to use a type name as an expression\n[Inferior 1 (process 346) exi=
ted normally]'

And a similar one for devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_none_=
qemu.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3078

I know debugging this might be a bit tough, as it is arm host only. If
you have doubts about what is failing, I can do some tests next week.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


