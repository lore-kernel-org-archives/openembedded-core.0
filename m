Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F9DC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 06:20:25 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30106.1787811618383298638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 23:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Z4el9b22;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 21D2E1A185B;
	Thu, 27 Aug 2026 06:20:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA07B604ED;
	Thu, 27 Aug 2026 06:20:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66D1B11C78051;
	Thu, 27 Aug 2026 08:20:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787811615; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S3glg2PyXhqdwjgYHu6PVWP+IXkBp9l9PbjbnYV5HA8=;
	b=Z4el9b22nNUbd2sops/vr/2xZPLNOFbLZXE2RFDafWYfKA2h0k7tUG1g6jcPymWb7TLFkC
	7Z3EUzhOEsdcgbrC2/7eED3HOLGb4J7v36iScJqq5/9t/ZHwfHZFTOIx7aCAOYqNrq9Ij5
	AUh1B9mhwQtUCKHYpZImQfP96ZW0N+UStPPjtdZYcjMOWCAJsQWMCuzJTs7/jpS6vr6yc2
	y9PY67ir3som21Zyp4DiWgXJG5cy1dzqzkX0RWe+s+x8IBg+UFUsgLeDiqoNMJ/mpjA9Ay
	PLfSxwPC/IuDvHi/4E/OW8cm2xc7BoolyiYfNFy7dA8vyLaU3SzQPTX/rw0ZZg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 08:20:13 +0200
Message-Id: <DKZIBOZAFIR4.2AVSD2U5TJPB9@bootlin.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [meta][PATCH 03/06] linux-yocto/7.2: introduce
 reference kernel recipes
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260821112509.861559-1-bruce.ashfield@gmail.com>
 <20260821112509.861559-4-bruce.ashfield@gmail.com>
In-Reply-To: <20260821112509.861559-4-bruce.ashfield@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244452

On Fri Aug 21, 2026 at 1:25 PM CEST, Bruce Ashfield via lists.openembedded.=
org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> 7.2 is our next versioned reference kernel. The standard, preempt-rt
> (v7.2-rc4-rt3) and tiny variants are all generated and available.
>
> Signed SRCREVs point at the freshly generated v7.2 branches; the kmeta
> tracks the yocto-7.2 branch.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---

Hi Bruce,

I tested the 7.2 kernel, using this commit in meta-yocto:

https://git.yoctoproject.org/meta-yocto/commit/?h=3Dcontrib/mathieu/master-=
next-tests-72&id=3D98c8b2ca0c149201f6b2ee52157ca460fd0a2eb4

So far, I saw two different errors.


First, a fail of kernelmodule.KernelModuleTest.test_kernel_module on qemux8=
6:
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/=
meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/=
meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/=
meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  [Previous line repeated 2 more times]
  File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/=
meta/lib/oeqa/runtime/cases/kernelmodule.py", line 48, in test_kernel_modul=
e
    self.assertEqual(status, 0, msg=3D'\n'.join([cmd, output]))
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: 2 !=3D 0 : cd /usr/src/kernel && make scripts prepare
...
In file included from ./include/uapi/linux/elf.h:5,
                 from arch/x86/tools/vdso2c.c:66:
./include/uapi/linux/types.h:10:2: warning: #warning "Attempt to use kernel=
 headers from user space, see https://kernelnewbies.org/KernelHeaders" [-Wc=
pp]
   10 | #warning "Attempt to use kernel headers from user space, see https:=
//kernelnewbies.org/KernelHeaders"
      |  ^~~~~~~
arch/x86/tools/vdso2c.c:74:9: error: unknown type name 'bool'
   74 |         bool export;
      |         ^~~~
arch/x86/tools/vdso2c.c:69:1: note: 'bool' is defined in header '<stdbool.h=
>'; this is probably fixable by adding '#include <stdbool.h>'
...
make: *** [Makefile:248: __sub-make] Error 2

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/4474
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/4437

And then, failure in runtime_test.RustKernel.test_kernel_rust_sample
selftest:
2026-08-26 14:11:09,216 - oe-selftest - INFO - runtime_test.RustKernel.test=
_kernel_rust_sample (subunit.RemotedTestCase)
2026-08-26 14:11:09,221 - oe-selftest - INFO -  ... FAIL

Stderr:
2026-08-26 13:52:43,328 - oe-selftest - INFO - Adding: "include selftest.in=
c" in /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-803204/=
conf/local.conf
2026-08-26 13:52:43,328 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf
WARNING: test: LICENSE is using "CLOSED", which is deprecated. Convert to u=
sing a license ref pointing to an actual license file, e.g.
LICENSE =3D "LicenseRef-test-CLOSED"
WARNING: test: LICENSE is using "CLOSED", which is deprecated. Convert to u=
sing a license ref pointing to an actual license file, e.g.
LICENSE =3D "LicenseRef-test-CLOSED"
ERROR: When reparsing /tmp/selftest-fetch8rb2fo4w/test.bb:do_checkuri, the =
basehash value changed from eaf531c7d0304fd45f77fab173d0399db2b76e45cd46487=
426eb74bae7d4b7bb to 2cdec1b5839750d0c5998dd35b7ab7380727d2fa3a33aed8641444=
28d3a78f7d. The metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake test -cdo_checkuri -Snone
ERROR: Then:
ERROR: $ bitbake test -cdo_checkuri -Sprintdiff

I suspect the warning about the LICENSE value is unrelated, but is
something else I should fix.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4680
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4502
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4724

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


