Return-Path: <akuster808@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id D168277BB4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 21:10:15 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id h41so34499756ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=8FkIHaaYg6fEFue59AoV+95qCQleOfLhiP4ul7Jfwm4=;
	b=nk0XimNiIi2PEMi8Qfpg0iGwMqheoJ8pgJJYlzo8X2iRxlTMcS//wumVy2vnnkkI/s
	4bJQJEscnPSFgHkZqVrhHserr6ykmt7ofxJpNF9GPFIygMt+3V+eARtmb+nafLahVDxa
	7jrH2dFmDrovp6RCci6ObqsVYBj2DpneVGfm8soE17vUvs0rPOFYj9DBZRNkzPbcli3C
	gb6qcCMccMXeP4Cs4ucUD0YJIvRdyH8mumJOMmzq5TlFCrmSmV2y+daX0BS6lWv1WkPV
	t6bIQp+zMmJ58PfUM8JK8LdQqlJZ1G/aVVIOghZM7tpg+DJIAx2NsgMLFftU/m8gzI9W
	k7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=8FkIHaaYg6fEFue59AoV+95qCQleOfLhiP4ul7Jfwm4=;
	b=QiAS61x1RrB/cJekxbJZqeEP/nimmriBFu9RHv2I6x4tr3v3jeKDII6yfNqZmR/dIX
	0Rmfhl0oKkGzEMbRlUKADKgsybS0uDw3yU1tdFpe/sY2wesCabFI3Mv0JLvJBglgQwfD
	xgmOya+r8jjXhtVdCkfAER+zY0JZtLlLeEmuqFoLEMX0ba4MESxiD7VTCn5ythZRik5N
	DGgWsLUBZ+0klA3rxkmJ0J81YO3zK3HEgdGKx8NCuHY0/aobL0p+OAXtrt23XAaT5rgj
	JHYeMK/5WfMLPursgJ5G46yKCOVJQTD189xs/TyHCxj/+tZyWZkfIR7GSd75MDO3Jys8
	r6fQ==
X-Gm-Message-State: AN3rC/4j2mbNcko9OvxfOULiUxyIFEHRVm+eFz62/UL3XF2J9WCc524o
	FgM4BpZLlC4rEq7j
X-Received: by 10.98.112.134 with SMTP id l128mr14274487pfc.110.1492809016336; 
	Fri, 21 Apr 2017 14:10:16 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4001:9ea0:54cb:4fab:7f49:513a])
	by smtp.googlemail.com with ESMTPSA id
	b77sm17670948pfe.39.2017.04.21.14.10.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Apr 2017 14:10:15 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1492771066-9051-1-git-send-email-andrej.valek@siemens.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <1e25144c-3a2b-a0de-1c28-7a1cd2597bed@gmail.com>
Date: Fri, 21 Apr 2017 14:10:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1492771066-9051-1-git-send-email-andrej.valek@siemens.com>
Subject: Re: [PATCH][morty] glibc: Security fix CVE-2016-6323
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
X-List-Received-Date: Fri, 21 Apr 2017 21:10:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 4/21/17 3:37 AM, Andrej Valek wrote:
> arm: mark __startcontext as .cantunwind, GNU
>
> CVE: CVE-2016-6323
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>

what is different about this one and the one sent on the 19th?

-armin
> ---
>  meta/recipes-core/glibc/glibc/CVE-2016-6323.patch | 39 +++++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.24.bb             |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-6323.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2016-6323.patch b/meta/recipes-core/glibc/glibc/CVE-2016-6323.patch
> new file mode 100644
> index 0000000..f9b9fa5
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2016-6323.patch
> @@ -0,0 +1,39 @@
> +glibc-2.24: Fix CVE-2016-6323
> +
> +[No upstream tracking] -- https://sourceware.org/bugzilla/show_bug.cgi?id=20435
> +
> +arm: mark __startcontext as .cantunwind, GNU
> +
> +Glibc bug where the makecontext function would create
> +an execution context which is incompatible with the unwinder,
> +causing it to hang when the generation of a backtrace is attempted.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=9e2ff6c9cc54c0b4402b8d49e4abe7000fde7617]
> +CVE: CVE-2016-6323
> +Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> +Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> +
> +diff --git a/sysdeps/unix/sysv/linux/arm/setcontext.S b/sysdeps/unix/sysv/linux/arm/setcontext.S
> +index 603e508..d1f168f 100644
> +--- a/sysdeps/unix/sysv/linux/arm/setcontext.S
> ++++ b/sysdeps/unix/sysv/linux/arm/setcontext.S
> +@@ -86,12 +86,19 @@ weak_alias(__setcontext, setcontext)
> + 
> + 	/* Called when a makecontext() context returns.  Start the
> + 	   context in R4 or fall through to exit().  */
> ++	/* Unwind descriptors are looked up based on PC - 2, so we have to
> ++	   make sure to mark the instruction preceding the __startcontext
> ++	   label as .cantunwind.  */
> ++	.fnstart
> ++	.cantunwind
> ++	nop
> + ENTRY(__startcontext)
> + 	movs    r0, r4
> + 	bne     PLTJMP(__setcontext)
> + 
> + 	@ New context was 0 - exit
> + 	b       PLTJMP(HIDDEN_JUMPTARGET(exit))
> ++	.fnend
> + END(__startcontext)
> + 
> + #ifdef PIC
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
> index f5a21b2..bce06c7 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -37,6 +37,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>             file://0026-build_local_scope.patch \
> +           file://CVE-2016-6323.patch \
>  "
>  
>  SRC_URI += "\



