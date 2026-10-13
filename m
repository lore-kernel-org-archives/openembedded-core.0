Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A82CC6B1D
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3979.1791914047959779834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 10:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vdVMd50f;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3FFDAC653F9
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:55:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C9DC60362
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:54:05 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 2CF4011D7188E; Tue, 13 Oct 2026 19:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914045; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F4d/UyW8PqYsJahTcc3ggfh2JLdob/3aKYieKNgbfvw=;
	b=vdVMd50f89DlHdY8AVo1kQEdMlaELJBoRjZhgwOZLK38ZJGP/O0OQJkGZXWFI1WcUhpcwU
	dXxtzAyiNmZD9YqRDTkWl7EY93tcgclzarBnB6CXdpTLUNsSxDrMj6R5m8dtCzXiqPIhJw
	9leX8rD9zQwa+m+tHvwB+M+KSjhdcY1y1fis9/tOKG6+g4c7Xw1uoAUIQrrpmfBnu17YFW
	9CFFkxflG1v4enOLARekd24tEUbEmm36yRsP9vgMsM0HU3ama2B6Ws77XnUCNJOgS9ix/L
	pSqjfUWy9enS7XnWLrhZfxKKpNN9jgW66MN4el+n0/XmHuntua868p5vNwoCQQ==
Authentication-Results: mail.galae.net;
	none
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 10:00:57 +0200
Message-Id: <DM3JWFC4RAAB.872FGKDCKDY3@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/2] python3: upgrade 3.14.7 -> 3.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261012103426.3090-1-jaipaul.cheernam@est.tech>
 <20261012103426.3090-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20261012103426.3090-2-jaipaul.cheernam@est.tech>
X-TUID: 9C+N2/MpAQsQ
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 2CF4011D7188E
X-Spamd-Result: default: False [-5.10 / 30.00];
	BAYES_HAM(-5.50)[99.99%];
	MV_CASE(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	ARC_NA(0.00)[];
	BCC(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[python.org:url,localhost:rdns,localhost:helo,est.tech:email,bootlin.com:mid,bootlin.com:url,yoctoproject.org:url];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 17:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247735

On Mon Oct 12, 2026 at 12:34 PM CEST, Jaipaul Cheernam wrote:
> ReleaseNotes: https://docs.python.org/3/whatsnew/changelog.html#python-3-=
15-0-final
>
> - Drop patches which are part of upstream release
>   - 0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
>   - 0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
>   - 0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
>   - valid-dists.patch
> - Add mpdecimal dependency and --with-system-libmpdec configure option
> - Bump PYTHON_BASEVERSION to 3.15 in python3-dir.bbclass
> - Update python3-manifest
> - Refresh existing patches
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade, but this is failing in various ways.

First, some builds are failing, probably musl related:

ERROR: python3-3.15.0-r0 do_compile: oe_runmake failed
...
| aarch64-poky-linux-musl-gcc  -mcpu=3Dcortex-a57+crc -mbranch-protection=
=3Dstandard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -W=
format-security -Werror=3Dformat-security --sysroot=3D/srv/pokybuild/yocto-=
worker/qemuarm64-musl-ptest/build/build/tmp/work/cortexa57-poky-linux-musl/=
python3/3.15.0/recipe-sysroot -shared -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--=
as-needed -Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-neede=
d -Wl,-z,relro,-z,now    Modules/_ctypes/_ctypes_test.o -lm  -o Modules/_ct=
ypes_test.cpython-315-aarch64-linux-musl.so
| aarch64-poky-linux-musl-gcc  -mcpu=3Dcortex-a57+crc -mbranch-protection=
=3Dstandard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -W=
format-security -Werror=3Dformat-security --sysroot=3D/srv/pokybuild/yocto-=
worker/qemuarm64-musl-ptest/build/build/tmp/work/cortexa57-poky-linux-musl/=
python3/3.15.0/recipe-sysroot -shared -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--=
as-needed -Wl,-z,relro,-z,now -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-neede=
d -Wl,-z,relro,-z,now    Modules/_testinternalcapi.o Modules/_testinternalc=
api/test_lock.o Modules/_testinternalcapi/pytime.o Modules/_testinternalcap=
i/set.o Modules/_testinternalcapi/test_critical_sections.o Modules/_testint=
ernalcapi/complex.o Modules/_testinternalcapi/interpreter.o Modules/_testin=
ternalcapi/tuple.o   -o Modules/_testinternalcapi.cpython-315-aarch64-linux=
-musl.so
| nativepython3: error while loading shared libraries: libc.so: cannot open=
 shared object file: No such file or directory
| make: *** [Makefile:1796: checksharedmods] Error 127

https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1368
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1355


Then, when build succeeds, some test is failing:

RESULTS - maturin.MaturinTest.test_maturin_list_python: FAILED (3.41s)
...
Testing 'maturin develop' requires Rust cross-canadian in the SDK
Testing 'maturin develop' requires Rust cross-canadian in the SDK
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarmv5/build/layers/openembedded-cor=
e/meta/lib/oeqa/sdk/cases/maturin.py", line 30, in test_maturin_list_python
    self.assertIn(expected, output)
    ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
AssertionError: '3.15 at /srv/pokybuild/yocto-worker/qemuarmv5/build/build/=
tmp/work/qemuarmv5-poky-linux-gnueabi/core-image-minimal/1.0/testsdkext/bui=
ldtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3' not found in '=F0=9F=
=90=8D 2 python interpreter found:\n - CPython 3.11 at /srv/pokybuild/build=
bot-venv/bin/python3.11\n - CPython 3.13 at /srv/pokybuild/yocto-worker/qem=
uarmv5/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3.13\n'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/4646
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/4817
https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/4825


Also, I'm adding back a link to the issues we had with 3.14.8 upgrade.
Some ptests were failing while building with musl. This might be fixed
by upstream, but it might be worth checking:
https://lore.kernel.org/openembedded-core/DLUD1OK99YO3.1QPQV67EMZI06@bootli=
n.com/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


