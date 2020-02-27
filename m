Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 43E7E611CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:46:40 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l16so389446qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 12:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ctfWG+dYjqpGtuP4d2Gws2/8uvTyP89k1JXHp9xpMBQ=;
	b=PwM46SeqCK0k2qI9wyVEjsyf3WkrGJuz6/PMR2Cyx4IlkdP4fu8NsRlSTSygZHGbZa
	nNjaWe6MsU7wwiE8285PKpVCmtWqVU5OgEaWcj/QeQzFq1QHyYUUakvvMs66pg5N76MP
	KrSA+tuPfIs47Qk9k6tsUXz5P/fmW3WdWX30K7G/5BEoMbWJiEcyk43VOWRr8yHxmtCw
	b6iUCcyEK0Cuhmo5OzW1ezVXVtLDfYEf1w02u8QCMuVo8DlZWIo+2xTvl3sUS0kN9M/E
	FxWPQvzlWN38CJzPbIoeAwF76NRt9tUyOMtd7IPCor01uzkofkTo+Z8RbEQ5ihhBh0Qq
	S+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ctfWG+dYjqpGtuP4d2Gws2/8uvTyP89k1JXHp9xpMBQ=;
	b=jCE4/SNQfQ6uv9YXjiRdoMCP8+3rSjkUVx54sthpeQ6SHgLxSmssdl4v2FYmleBq9E
	pvYtG/P9OGYJf6fS12D69qVBoPmktoeZZJ0Kx3hkF8zkg8ixsmjkE8vUqWyeU2V1lHAK
	80Ow9nfLR9kvrjv2+gUYHvjpI5VMbo9FWkFsd8uY6Kw/bNWY7dZWrXSrei06QXPXDCTc
	qfUxyylOavELcD3SSF0Ha5yTrpMMpabQBu96fvSD1Td9yWpPCIYN3vuiQg5xiI/8htzc
	nPIYeOLq13xZn3OsOxO2HqD6sv0s0N4NKlJk4/dSw3bPqPhoMlnOzv5kZidAnQumU6xb
	U7Tw==
X-Gm-Message-State: APjAAAUCuuMuNPUJWiQuwramtxfmAiXRkxU12AUe3PI1GRhiHDxuX+tu
	Dj7e0SSyXwENSN5VpBWxFlWNolWs9atP9vypie8=
X-Google-Smtp-Source: APXvYqzUN3H1DdzHCZ80PfkPes6WvlsWSQB3JImtAJ5uGHin25ZeJOjMYrJ+BXWwyPRkXR5mVrXxSjsB4fp2jY0nndQ=
X-Received: by 2002:aed:29a4:: with SMTP id o33mr1079518qtd.316.1582836401514; 
	Thu, 27 Feb 2020 12:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20200227203456.7395-1-petr.vorel@gmail.com>
	<20200227203456.7395-2-petr.vorel@gmail.com>
In-Reply-To: <20200227203456.7395-2-petr.vorel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Feb 2020 12:46:15 -0800
Message-ID: <CAMKF1spWKKiWwD76QXA=gOj1nJFc7cMm2=oifR8S-wEDh_CLXw@mail.gmail.com>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"Hongzhi . Song" <hongzhi.song@windriver.com>
Subject: Re: [PATCH 2/2] ltp: Remove mips related open_posix_testsuite patch
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
X-List-Received-Date: Thu, 27 Feb 2020 20:46:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 27, 2020 at 12:35 PM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Upstream just disagree on this patch
> https://patchwork.ozlabs.org/comment/2012045/
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi,
>
> please don't deliver this patch to users, it's wrong.
>

Thanks Petr, is there an alternative approach we can take ?


> Kind regards,
> Petr
>
>  ...suite-mmap24-2-Relax-condition-a-bit.patch | 68 -------------------
>  meta/recipes-extended/ltp/ltp_20200120.bb     |  1 -
>  2 files changed, 69 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
>
> diff --git a/meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch b/meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
> deleted file mode 100644
> index d32ac1dd7c..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -From a8715a1446305ffd76406f63c7f160c13a5b2e72 Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> -Date: Wed, 10 Oct 2018 22:07:05 -0400
> -Subject: [PATCH] open_posix_testsuite/mmap24-2: Relax condition a bit
> -
> -Mips will return EINVAL instead of ENOMEM as expected
> -if the range [addr + len) exceeds TASK_SIZE.
> -
> -Linux kernel code: arch/mips/mm/mmap.c
> -if (flags & MAP_FIXED) {
> -    /* Even MAP_FIXED mappings must reside within TASK_SIZE */
> -    if (TASK_SIZE - len < addr)
> -        return -EINVAL;
> -
> -Relax the condition and accept both ENOMEM and EINVAL
> -as expected outcome.
> -
> -Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2018-October/009624.html]
> -
> -Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ----
> - .../open_posix_testsuite/conformance/interfaces/mmap/24-2.c    | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c b/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
> -index 9cf83d9..55090a6 100644
> ---- a/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
> -+++ b/testcases/open_posix_testsuite/conformance/interfaces/mmap/24-2.c
> -@@ -7,7 +7,7 @@
> -  * source tree.
> -  *
> -  * The mmap() function shall fail if:
> -- * [ENOMEM] MAP_FIXED was specified,
> -+ * [ENOMEM or EINVAL] MAP_FIXED was specified,
> -  * and the range [addr,addr+len) exceeds that allowed
> -  * for the address space of a process; or, if MAP_FIXED was not specified and
> -  * there is insufficient room in the address space to effect the mapping.
> -@@ -15,7 +15,7 @@
> -  * Test Step:
> -  * 1. Map a shared memory object, with size exceeding the value get from
> -  *    rlim_cur of resource RLIMIT_AS, setting MAP_FIXED;
> -- * 3. Should get ENOMEM.
> -+ * 3. Should get ENOMEM or EINVAL.
> -  */
> -
> - #include <stdio.h>
> -@@ -92,8 +92,8 @@ int main(void)
> -              (unsigned long)len);
> -       pa = mmap(addr, len, PROT_READ | PROT_WRITE, MAP_FIXED | MAP_SHARED, fd,
> -                 0);
> --      if (pa == MAP_FAILED && errno == ENOMEM) {
> --              printf("Got ENOMEM: %s\nTest PASSED\n", strerror(errno));
> -+      if (pa == MAP_FAILED && (errno == ENOMEM || errno == EINVAL)) {
> -+              printf("Got ENOMEM or EINVAL: %s\nTest PASSED\n", strerror(errno));
> -               exit(PTS_PASS);
> -       }
> -
> -@@ -102,6 +102,6 @@ int main(void)
> -       else
> -               munmap(pa, len);
> -       close(fd);
> --      printf("Test Fail: Did not get ENOMEM as expected\n");
> -+      printf("Test Failed: Did not get ENOMEM or EINVAL as expected\n");
> -       return PTS_FAIL;
> - }
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
> index 38fd0f6f87..069d9c2e0b 100644
> --- a/meta/recipes-extended/ltp/ltp_20200120.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200120.bb
> @@ -35,7 +35,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
>             file://0004-guard-mallocopt-with-__GLIBC__.patch \
>             file://0007-Fix-test_proc_kill-hanging.patch \
>             file://0008-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
> -           file://0009-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
>             file://0001-Add-more-musl-exclusions.patch \
>             file://0001-syscalls-Check-for-time64-unsafe-syscalls-before-usi.patch \
>             "
> --
> 2.25.1
>

