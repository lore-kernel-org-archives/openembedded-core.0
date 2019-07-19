Return-Path: <petr.vorel@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D91617E417
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 06:36:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n4so31101053wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 23:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=uiYc29PHI9CLgobiHoR6aW4/ApoTU93knzz6ZKQ0ZJE=;
	b=DJpoFYr8kyB5gFavSDoGtB9QcWwBJrNVMHLHL96qw1OAkccEuZUC4bw4tmzGfTQdqB
	PSlId2xLAXHI6ypvSQ7gdhgWKvKWmFHOzpyf/dAaRoFkNgnEJmidVf0mAjMo3xOQ32VB
	tP1udclUkuK7Ndt/c5bb/3Oha2J0WXV203z6N/8CU+s2ktOE0ByWgRBJaR/yVqBDmyuO
	8hxWh59WjJyL4IenAjhADELelzQ+Wxp1z4WBmrVJkTsRNOXZ6/rjeYYHKODmIKqH9sRv
	9C2QhBgYnmXvj4wfypdEWyM4qXWMIxvjd1FaZ1CwUNABvY78KaalY2KBfmUsIWQ5cSBk
	wEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=uiYc29PHI9CLgobiHoR6aW4/ApoTU93knzz6ZKQ0ZJE=;
	b=oFE9fU4waiJ25f1ln9J+/WRSCGgMMqr4sbI0hBm6z2axdsiQ81+FU/xcnfaddgCg1w
	Xh/Wme3xkNrTvTy6bHhSCi5l9FVStONaw9DLxY+1iddshQlyFqYnqFQk2rfYv3+uh8mJ
	o4qpeqioIPnhyCnStbrf9iHcpOuJka5k2gUwmAOpz78Gh11JnQY3hTOA8Zj9Ns+Mfu2W
	KWCdmigO/6svuGaXoHecvHsg0xaHVz4B4DQqg6Zm7KWWdcrVBf6CEPhItT+SvdbJyO19
	/GmJMqwDBgbs6No1BKglULZCBi3v9qg2Y1SF8TgQT7Jtu0nsPIeyhpAUguwsoHFL56tb
	HSog==
X-Gm-Message-State: APjAAAUccYjPxsuTvWXjI9uXJ1tD5veVcgGuYDIWMB/hC/Xj/T4rVhDO
	w/DE6BFrOrTRF85TzVZ9PW0=
X-Google-Smtp-Source: APXvYqxkUZ5JkfeKHZcT0MmVOMU8Je1xK00wx1guwDzXPTsEjVinYTflAZg0Ulh8+3ezb24oCglTpA==
X-Received: by 2002:adf:b1d1:: with SMTP id r17mr54367021wra.273.1563518174561;
	Thu, 18 Jul 2019 23:36:14 -0700 (PDT)
Received: from x230 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	b2sm37916512wrp.72.2019.07.18.23.36.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 23:36:13 -0700 (PDT)
Date: Fri, 19 Jul 2019 08:36:12 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <20190719063610.GA9894@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <1563513198-4037-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1563513198-4037-1-git-send-email-yi.zhao@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ltp: upgrade 20190115 -> 20190517
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
X-List-Received-Date: Fri, 19 Jul 2019 06:36:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yi,

> Drop the following patches since the issues have been fixed upstream:
>   0001-file01.sh-Fix-in-was-not-recognized.patch
>   0001-lapi-Define-TST_ABI-32-64-to-detect-target-type.patch
>   0001-syscalls-setrlimit03.c-read-proc-sys-fs-nr_open-for-.patch
>   0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
>   0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
>   0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch
>   0023-ptrace-Use-int-instead-of-enum-__ptrace_request.patch
>   0024-rt_sigaction-rt_sigprocmark-Define-_GNU_SOURCE.patch
>   0026-crash01-Define-_GNU_SOURCE.patch
>   0028-rt_sigaction.h-Use-sighandler_t-instead-of-__sighand.patch
>   0034-periodic_output.patch
>   0039-commands-ar01-Fix-for-test-in-deterministic-mode.patch
>   define-sigrtmin-and-sigrtmax-for-musl.patch
>   setregid01-security-string-formatting.patch

> Refresh the following patches:
>   0004-build-Add-option-to-select-libc-implementation.patch
>   0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
>   0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
>   0018-guard-mallocopt-with-__GLIBC__.patch
>   0020-getdents-define-getdents-getdents64-only-for-glibc.patch
>   0035-fix-test_proc_kill-hang.patch
>   0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
>   0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch
>   0001-shmctl01-don-t-use-hardcoded-index-0-for-SHM_STAT-te.patch
>   0001-diotest4-Let-kernel-pick-an-address-when-calling-mma.patch
>   0001-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch

> Add patch:
>   0006-rt_tgsigqueueinfo-disable-test-on-musl.patch

+rt_tgsigqueueinfo01.c: In function 'sigusr1_handler':
+rt_tgsigqueueinfo01.c:42:22: error: 'siginfo_t' {aka 'struct <anonymous>'} has no member named '_sifields'; did you mean '__si_fields'?
+   42 |  sigval_rcv = uinfo->_sifields._rt.SI_SIGVAL.sival_ptr;
+      |                      ^~~~~~~~~
+      |                      __si_fields

Interesting, I didn't notice this musl error.

> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>


Kind regards,
Petr

