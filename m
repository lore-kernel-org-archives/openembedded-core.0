Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B3C987E182
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 07:32:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f204so1782244wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 00:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=FcPiZG8DRM1r7r81P6OSzKK4Suw5ojO/D1pzCTIhYa8=;
	b=Fitry+nwZ4gLFcduT6kT9TNwkTEUKpWM9Nx4D7Wbc0XGScO3KvO4VJn9uP2f+QR6k1
	sl1YqAPjNPyPmId6lf+9O7QTkvNEwENZStrj+xUKLkwHhi1ZNV9ajQH9WsjVBEKLzFyf
	zvIRvtKP3Xp8FLeLTFEcjEjIYuuOm7BWkQelY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=FcPiZG8DRM1r7r81P6OSzKK4Suw5ojO/D1pzCTIhYa8=;
	b=gKxcWK2uzecK9rG9bNPTR21NfBufzkxGN96+LXViaEtiM9l4H1jRGx3bc/tG+wQV8m
	75iwt7X3AVXgEuB1M+5iz3VbZAyFGFXRNFm71YFwCk/23iCMMXjiBorKvBSbArLGhOl0
	jYXtvypdNNhjUzEVrAkgOHsulgNeqPiT5+8Q+iyk06dqOlw7C5hBsbRR9n0QwhHCE4IO
	zQL9agSzs26bo6+Z5x0wGHOsSoAhA9SckyqJwYteLWp1So4+nKxUtRElw+dLF/8uXCO0
	PTwAX4pMNrK35Oh/Sbq9XTEA8K7wgRXyxzwvcIpLsLufJeKOGHbwCOXhMet7PyJ8+D7I
	PCfg==
X-Gm-Message-State: APjAAAXmXp6M4HbhAXmTnsRg1YaSW/ijT9m0S8jpOfymIxmADMnCbwoN
	2UPsqYHMrM36Uc+d1+KdvcXB8A==
X-Google-Smtp-Source: APXvYqyFVtryeC/YMtRGvFN4oZgftgFaAQSRlwgdu+2qqV1FwQJmxc0iHeRHmZL/TfG6TTLI21/gvA==
X-Received: by 2002:a1c:f314:: with SMTP id q20mr2331966wmq.74.1558423946363; 
	Tue, 21 May 2019 00:32:26 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h17sm1880350wrq.79.2019.05.21.00.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 00:32:25 -0700 (PDT)
Message-ID: <5677817951fee18102345b773c66546f550bb3e6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair.francis@wdc.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 08:32:24 +0100
In-Reply-To: <20190517235308.4139-1-alistair.francis@wdc.com>
References: <20190517235308.4139-1-alistair.francis@wdc.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] gdb: Upgrade from 8.2.1 to 8.3
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
X-List-Received-Date: Tue, 21 May 2019 07:32:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-05-17 at 16:53 -0700, Alistair Francis wrote:
> Bump GDB and change the oeqa selftest expression to allow ptests to
> pass.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>  meta/lib/oeqa/selftest/cases/package.py       |  2 +-
>  .../gdb/{gdb-8.2.1.inc => gdb-8.3.inc}        | 12 +--
>  .../gdb/gdb-cross-canadian.inc                |  1 -
>  ...ian_8.2.1.bb => gdb-cross-canadian_8.3.bb} |  0
>  .../{gdb-cross_8.2.1.bb => gdb-cross_8.3.bb}  |  0
>  ...1-Fix-build-with-latest-GCC-9.0-tree.patch | 50 ----------
>  ...h => 0001-gdbserver-ctrl-c-handling.patch} |  0
>  ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 23 ++---
>  ...-Use-exorted-definitions-of-SIGRTMIN.patch | 16 ++-
>  ...h64-Fix-the-gdb-build-with-musl-libc.patch | 52 ----------
>  .../gdb/gdb/CVE-2017-9778.patch               | 99 ---------------
> ----
>  .../gdb/{gdb_8.2.1.bb => gdb_8.3.bb}          |  0
>  13 files changed, 23 insertions(+), 234 deletions(-)
>  rename meta/recipes-devtools/gdb/{gdb-8.2.1.inc => gdb-8.3.inc}
> (73%)
>  rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.2.1.bb =>
> gdb-cross-canadian_8.3.bb} (100%)
>  rename meta/recipes-devtools/gdb/{gdb-cross_8.2.1.bb => gdb-
> cross_8.3.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/0001-Fix-build-
> with-latest-GCC-9.0-tree.patch
>  rename meta/recipes-devtools/gdb/gdb/{gdbserver-ctrl-c-
> handling.patch => 0001-gdbserver-ctrl-c-handling.patch} (100%)
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-AArch64-Fix-
> the-gdb-build-with-musl-libc.patch
>  delete mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2017-9778.patch
>  rename meta/recipes-devtools/gdb/{gdb_8.2.1.bb => gdb_8.3.bb} (100%)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 668f31324e..744c6c3247 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -21,7 +21,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>  GCCVERSION ?= "8.%"
>  SDKGCCVERSION ?= "${GCCVERSION}"
>  BINUVERSION ?= "2.32%"
> -GDBVERSION ?= "8.2%"
> +GDBVERSION ?= "8.3%"
>  GLIBCVERSION ?= "2.29%"
>  LINUXLIBCVERSION ?= "5.0%"
>  QEMUVERSION ?= "4.0%"
> diff --git a/meta/lib/oeqa/selftest/cases/package.py
> b/meta/lib/oeqa/selftest/cases/package.py
> index 7a00753821..aa13a8df76 100644
> --- a/meta/lib/oeqa/selftest/cases/package.py
> +++ b/meta/lib/oeqa/selftest/cases/package.py
> @@ -134,7 +134,7 @@ class PackageTests(OESelftestTestCase):
>                      return False
>  
>                  # Check debugging symbols works correctly
> -                elif "Breakpoint 1, main () at hello.c:4" in l:
> +                elif re.match("Breakpoint 1.*hello\.c.*4", l):
>                      return True
>  
>              self.logger.error("GDB result:\n%d: %s", status, output)


2019-05-20 19:03:42,463 - oe-selftest - INFO - ======================================================================
2019-05-20 19:03:42,463 - oe-selftest - INFO - ERROR: package.PackageTests.test_gdb_hardlink_debug (subunit.RemotedTestCase)
2019-05-20 19:03:42,464 - oe-selftest - INFO - ----------------------------------------------------------------------
2019-05-20 19:03:42,464 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/package.py", line 148, in test_gdb_hardlink_debug
    if not gdbtest(qemu, binary):
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/package.py", line 137, in gdbtest
    elif re.match("Breakpoint 1.*hello\.c.*4", l):
NameError: name 're' is not defined

Cheers,

Richard



