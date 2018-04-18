Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE97D71D79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 21:51:46 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 59-v6so1905107plc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 14:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kGwuxQzfISIyFGb0ni3FefmPgq2oQIXJuYallMHhrvI=;
	b=AH26FLkaeronSWB+ol8DQX+xAHqVSxGeY7fQjkDW9F7qHjphZRC43wiwm3YAzqK00x
	mXrxXoP1mQWF3mjgqopaSmewsTM7iuAb5ZJntE2k3K+kYZ9aWEVBktA4oy6Q+gKZRf4r
	UpiE8KC9Mg8KLHiBCzHa673RYBfIL48tc1VR7sl9rVThkc7V1Xm3BxvQ9juMtMP8VoeA
	5PxT0u/lsvmCK/upacYdPXySY5vpDbY179PotXbKjy22AxnJGthy7iMBugHL+ciNJaPx
	pS80qBz7/rN6Q9499l6o+JIVzSOIzrdyF6Sil7Y5tZ6VwOglY3EE4QuBvdTvWU3kSqU5
	KPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=kGwuxQzfISIyFGb0ni3FefmPgq2oQIXJuYallMHhrvI=;
	b=ixHA47qGvu8qyuKx10bbRGwAb8t+Aito/FtBSTnVuR4VOQSkQoDupk6l/ItvcWaIkE
	CTJ0vkfV+uhOcDrqayuoS9V+9CIk4VRO0WAfoZ1J93xYgSRLRyoz2K56rBMKQf+Gn8cF
	DA02S9Qg69u0YICncFIGb81Ra+u61vo0TeZ0dh6Akj7LvE/vwfViDkARdsAzeCqqP5Cc
	LTheFVqO9+p5WzoprdtywgzbB4oDkHNtSVlP/AiZ1l/HMIwR1Y2cGo6/1QPtyzWD1SFQ
	Iv0ljqkAZPIl2l7iSrZ42/RbFzWYXWip8vR3mxPWFd0JJSwzsthFbAvaRWFYNk7Yxe7c
	+hjQ==
X-Gm-Message-State: ALQs6tA5DxqkJiJqdObGx9qcytnxBLpB+EL+Imyo39yPqaVaeLmA8/In
	FPLqDXf3cnbpJaGaOu6M9oNSbg==
X-Google-Smtp-Source: AIpwx4+wc4I0jT0kCv/kV42/YLM/QhADFFa4OljvDo5483Fz8mSRy+uZIBtFESolCWc4adw15sldgg==
X-Received: by 2002:a17:902:9688:: with SMTP id
	n8-v6mr3552214plp.366.1524088307431; 
	Wed, 18 Apr 2018 14:51:47 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:94ac:f6b8:efca:146f?
	([2601:202:4000:1184:94ac:f6b8:efca:146f])
	by smtp.gmail.com with ESMTPSA id p1sm6451916pgc.15.2018.04.18.14.51.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Apr 2018 14:51:46 -0700 (PDT)
To: =?UTF-8?Q?Daniel_D=c3=adaz?= <daniel.diaz@linaro.org>,
	openembedded-core@lists.openembedded.org
References: <1523573708-6519-1-git-send-email-daniel.diaz@linaro.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1676c43b-ad92-ff97-768c-c5a60712aba8@gmail.com>
Date: Wed, 18 Apr 2018 14:51:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523573708-6519-1-git-send-email-daniel.diaz@linaro.org>
Subject: Re: [pyro][PATCH 1/2 v2] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Wed, 18 Apr 2018 21:51:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 04/12/2018 03:55 PM, Daniel Díaz wrote:
> From: Fathi Boudra <fathi.boudra@linaro.org>
>
> Patch submitted upstream, pending to be merged:
> https://sourceware.org/bugzilla/show_bug.cgi?id=21286
>
> (From OE-Core rev: 11ebb5054e5ec1171ade90249e3a30ac8174a35a)
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
In stable/pyro-next

> ---
> v2: No changes.
>
>  ...o.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch | 68 ++++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.25.bb              |  1 +
>  2 files changed, 69 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch b/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
> new file mode 100644
> index 0000000..bef8887
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch
> @@ -0,0 +1,68 @@
> +From 297aca56465035dce1f7b91b5cdda54379141957 Mon Sep 17 00:00:00 2001
> +From: Pratyush Anand <panand@redhat.com>
> +Date: Wed, 22 Mar 2017 17:02:38 +0530
> +Subject: [PATCH] bits/siginfo.h: enum definition for TRAP_HWBKPT is missing
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Compile following linux kernel test code with latest glibc:
> +
> +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
> +
> +and we get following error:
> +breakpoint_test_arm64.c: In function ‘run_test’:
> +breakpoint_test_arm64.c:171:25: error: ‘TRAP_HWBKPT’ undeclared (first use in this function)
> +  if (siginfo.si_code != TRAP_HWBKPT) {
> +                         ^
> +I can compile test code by modifying my local
> +/usr/include/bits/siginfo.h and test works great. Therefore, this patch
> +will be needed in upstream glibc so that issue is fixed there as well.
> +
> +Signed-off-by: Pratyush Anand <panand@redhat.com>
> +
> +Upstream-Status: Submitted [https://sourceware.org/bugzilla/show_bug.cgi?id=21286]
> +---
> + bits/siginfo.h                         | 6 +++++-
> + sysdeps/unix/sysv/linux/bits/siginfo.h | 6 +++++-
> + 2 files changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/bits/siginfo.h b/bits/siginfo.h
> +index 4919df5..6dc714e 100644
> +--- a/bits/siginfo.h
> ++++ b/bits/siginfo.h
> +@@ -140,8 +140,12 @@ enum
> + {
> +   TRAP_BRKPT = 1,		/* Process breakpoint.  */
> + #  define TRAP_BRKPT	TRAP_BRKPT
> +-  TRAP_TRACE			/* Process trace trap.  */
> ++  TRAP_TRACE,			/* Process trace trap.  */
> + #  define TRAP_TRACE	TRAP_TRACE
> ++  TRAP_BRANCH,			/* Process branch trap. */
> ++# define TRAP_BRANCH	TRAP_BRANCH
> ++  TRAP_HWBKPT			/* hardware breakpoint/watchpoint  */
> ++# define TRAP_HWBKPT	TRAP_HWBKPT
> + };
> + # endif
> + 
> +diff --git a/sysdeps/unix/sysv/linux/bits/siginfo.h b/sysdeps/unix/sysv/linux/bits/siginfo.h
> +index 7b0d4f6..9cdf42a 100644
> +--- a/sysdeps/unix/sysv/linux/bits/siginfo.h
> ++++ b/sysdeps/unix/sysv/linux/bits/siginfo.h
> +@@ -235,8 +235,12 @@ enum
> + {
> +   TRAP_BRKPT = 1,		/* Process breakpoint.  */
> + #  define TRAP_BRKPT	TRAP_BRKPT
> +-  TRAP_TRACE			/* Process trace trap.  */
> ++  TRAP_TRACE,			/* Process trace trap.  */
> + #  define TRAP_TRACE	TRAP_TRACE
> ++  TRAP_BRANCH,			/* Process branch trap. */
> ++# define TRAP_BRANCH	TRAP_BRANCH
> ++  TRAP_HWBKPT			/* hardware breakpoint/watchpoint  */
> ++# define TRAP_HWBKPT	TRAP_HWBKPT
> + };
> + # endif
> + 
> +-- 
> +2.7.4
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
> index 58b90b7..49fcf0c 100644
> --- a/meta/recipes-core/glibc/glibc_2.25.bb
> +++ b/meta/recipes-core/glibc/glibc_2.25.bb
> @@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0026-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
>             file://0027-locale-fix-hard-coded-reference-to-gcc-E.patch \
>             file://0028-Rework-fno-omit-frame-pointer-support-on-i386.patch \
> +           file://0029-bits-siginfo.h-enum-definition-for-TRAP_HWBKPT-is-mi.patch \
>  "
>  
>  NATIVESDKFIXES ?= ""


