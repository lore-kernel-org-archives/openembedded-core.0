Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E64C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 15:06:29 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.24801.1706886384583322540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 07:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mQjAA/Dg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96F14FF805;
	Fri,  2 Feb 2024 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706886382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SIDBycAKwE5DgalcpM2jKnvfwaHCEBhsko8A0TJPwbk=;
	b=mQjAA/Dg3UD5qKKMulmd/KX2nmckizj8E5KoUeoDoOSTjOrIw4OtzJk+P92SbISu39AUe8
	GnaQxOBcILMDDcPQDncVzVrCW+M5GOLr7CBtxCSgj9TrBuIQFtx4n9oCN65lMiaAs8uUo4
	t4Sq+GfPAqK2wtlcqkg/PJ1FL/E8PVTLtrHAzbAZ/6eMJ7inrTP3FU9FgOfikJSDSosknq
	of26ymRw9sxFwFiPTy4aTlKJB0HPdISgNy7S+lhPRhyuMAq7dQCqI5h5+luYGIr0a8eKFt
	KvtNMPbI4XD71iiVIbrmiJm67zWutrhOCbudJtR1zdHrTsPhQAiBDdgTkq78UA==
Date: Fri, 2 Feb 2024 16:06:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] ltp: upgrade 20230929 -> 20240129
Message-ID: <202402021506218c278a26@mail.local>
References: <1706765184-12808-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1706765184-12808-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 15:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194801

https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5918/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/5958/steps/12/logs/stdio

On 01/02/2024 13:26:24+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> 0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
> revmoed since it's included in 20240129
> 
> 0001-Remove-OOM-tests-from-runtest-mm.patch
> refreshed for 20240129
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...001-Remove-OOM-tests-from-runtest-mm.patch | 10 +++----
>  ...-syscalls-fcntl-define-_LARGEFILE64_.patch | 28 -------------------
>  .../ltp/{ltp_20230929.bb => ltp_20240129.bb}  |  3 +-
>  3 files changed, 5 insertions(+), 36 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
>  rename meta/recipes-extended/ltp/{ltp_20230929.bb => ltp_20240129.bb} (97%)
> 
> diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> index 6d945700be..a5e7b37976 100644
> --- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> +++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> @@ -1,4 +1,4 @@
> -From e87c2ad1e16cdbd62ba71b2ace3270503decaa56 Mon Sep 17 00:00:00 2001
> +From 02136a4490b7d9b31e691cdd50adef95378c781b Mon Sep 17 00:00:00 2001
>  From: "Mingde (Matthew) Zeng" <matthewzmd@gmail.com>
>  Date: Wed, 29 Jul 2020 08:47:09 -0400
>  Subject: [PATCH] Remove OOM tests from runtest/mm
> @@ -9,15 +9,16 @@ Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
>  [ pvorel: rebased for 20210927 ]
>  Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +
>  ---
>   runtest/mm | 6 ------
>   1 file changed, 6 deletions(-)
>  
>  diff --git a/runtest/mm b/runtest/mm
> -index 6537666a9..e5a091a5a 100644
> +index d859b331c..3c2962f44 100644
>  --- a/runtest/mm
>  +++ b/runtest/mm
> -@@ -73,12 +73,6 @@ ksm06_2 ksm06 -n 8000
> +@@ -74,12 +74,6 @@ ksm07 ksm07
>   
>   cpuset01 cpuset01
>   
> @@ -30,6 +31,3 @@ index 6537666a9..e5a091a5a 100644
>   swapping01 swapping01 -i 5
>   
>   thp01 thp01 -I 120
> --- 
> -2.33.0
> -
> diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
> deleted file mode 100644
> index dbe63f2170..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From f4f75ce9218b469d91b536218de3323977edc529 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Tue, 13 Jun 2023 15:10:33 +0200
> -Subject: [PATCH] testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE
> -
> -This is required for off64_t to be available on musl systems.
> -
> -Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/1047]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - testcases/kernel/syscalls/fcntl/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/kernel/syscalls/fcntl/Makefile b/testcases/kernel/syscalls/fcntl/Makefile
> -index df663a50a..aac774111 100644
> ---- a/testcases/kernel/syscalls/fcntl/Makefile
> -+++ b/testcases/kernel/syscalls/fcntl/Makefile
> -@@ -17,6 +17,6 @@ include $(abs_srcdir)/../utils/newer_64.mk
> - 
> - %_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64
> - 
> --CPPFLAGS		+= -D_GNU_SOURCE
> -+CPPFLAGS		+= -D_GNU_SOURCE -D_LARGEFILE64_SOURCE
> - 
> - include $(top_srcdir)/include/mk/generic_leaf_target.mk
> --- 
> -2.30.2
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20230929.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
> similarity index 97%
> rename from meta/recipes-extended/ltp/ltp_20230929.bb
> rename to meta/recipes-extended/ltp/ltp_20240129.bb
> index 5c43346883..5cd33bb6a3 100644
> --- a/meta/recipes-extended/ltp/ltp_20230929.bb
> +++ b/meta/recipes-extended/ltp/ltp_20240129.bb
> @@ -24,12 +24,11 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
>  
>  CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> -SRCREV = "110d3be6a9c58674de3e366b96a70f0129a5d299"
> +SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
>  
>  SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
>             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
>             file://disable_hanging_tests.patch \
> -           file://0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch \
>             "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194570): https://lists.openembedded.org/g/openembedded-core/message/194570
> Mute This Topic: https://lists.openembedded.org/mt/104091613/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

