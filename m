Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 57451719F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 01:40:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y5so8221024wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 18:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p0rIEphsr9Yk8JKvwv9hsxO+gfiOSA7g9O1afliyBJE=;
	b=Z3q8to+fz9042bdBfrFFMgTtkGUfit4tAKt5zaFJLwQLm1VGHjEl9nVA7vG02diPli
	ylQq/RLJ3IxYbwC8cGZypqnfiq6owUeiZoy+16O/eYdggMQ4YeXVOKLO4kIEIV6H8lDv
	osKANbG5i3QpU5dOyKYIw0vlSC9lfiQYP/iMlw/Jbttu7+aX10C+tvcfZU+M8JFENSyp
	m70H4LN6pLzXXBBK4uALqlv4Xz+v1LXcXRGv0Pc9irwYLaBVFnSx03d/qt1MrNB/WF2W
	EJgY0zfeFU57z5ht/7Dl4BXfOVJasDlXKqrEJWfli1NlfFa3YSd6gQhoxMawuQpgvB25
	p3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p0rIEphsr9Yk8JKvwv9hsxO+gfiOSA7g9O1afliyBJE=;
	b=Bi8LTmB8SFQJbl2IumM1d7KgesCq5PyMvEQgcMEn52HEu/fMcWC5fYeN0NBr2wemO6
	TCneZ/QYpvJftfBM5xu+4UhrCDEY+Vz5MG+Ms3rZwXHho/fUaEQNZw4q6u9ioDxqRpIa
	14zYZlpW6767gXbV5AOyD5RrRGWIaXtm9WjJ4SqiSFQRS5EGi14t/W+xZZ2xID4Jtc4Z
	e4NN4S0MB9LRRGgp6mF44JlGZ9NG6ykyoofdEdQVigGMNYzfEXUhEy3/m0JAgRREttlN
	Mc7FcWcXOJF7nnKBP53E5op972hJzLa3NUsTDuGtFaUCnEqt5qGAQvlRvaIuRd46r5Fq
	MHug==
X-Gm-Message-State: AIVw112gKm0w944yKXAa0WtQIZF51UwITsn4t+Dm9+YvQzOibW09bPrx
	xzw+GLsslU60AeJsEh67zIRcayHhMQ==
X-Received: by 10.80.140.204 with SMTP id r12mr4883548edr.123.1499996443975;
	Thu, 13 Jul 2017 18:40:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Thu, 13 Jul 2017 18:40:13 -0700 (PDT)
In-Reply-To: <1499991861-19044-2-git-send-email-jslater@windriver.com>
References: <1499991861-19044-1-git-send-email-jslater@windriver.com>
	<1499991861-19044-2-git-send-email-jslater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Jul 2017 18:40:13 -0700
Message-ID: <CAMKF1sqfZiBJa2NTmgaV2fEm=vUxTgmKqHF_zb2sL1QhGbeNNQ@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] valgrind: allow version 3.12 to build under gcc7
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
X-List-Received-Date: Fri, 14 Jul 2017 01:40:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 13, 2017 at 5:24 PM, Joe Slater <jslater@windriver.com> wrote:
> Building for powerpc64 fails because of erroneous assertions
> that register r2 is clobbered.  This has probably been fixed
> in version 3.13.
>

there were patches for 3.13 posted.
lets make that work for you.

> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../valgrind/valgrind/wait-for-3.13.patch          | 40 ++++++++++++++++++++++
>  meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  3 ++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch b/meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch
> new file mode 100644
> index 0000000..efab1d3
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/wait-for-3.13.patch
> @@ -0,0 +1,40 @@
> +valgrind: allow compilation under gcc7 for powerpc64
> +
> +Remove a few admonitions that r2 is not preserved by function or system calls
> +since they are not true.  -m32 ppc code does not care, but -m64 code does.
> +
> +Upstream-Status: not-applicable [ version 3.13 has similar changes, but this is NOT a backport ]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +--- a/coregrind/m_debuglog.c
> ++++ b/coregrind/m_debuglog.c
> +@@ -215,7 +215,7 @@ static UInt local_sys_write_stderr ( con
> +       :
> +       : "b" (block)
> +       : "cc","memory","cr0","ctr",
> +-        "r0","r2","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12"
> ++        "r0","r3","r4","r5","r6","r7","r8","r9","r10","r11","r12"
> +    );
> +    if (block[0] < 0)
> +       block[0] = -1;
> +@@ -231,7 +231,7 @@ static UInt local_sys_getpid ( void )
> +       : "=&r" (__res)
> +       : "i" (__NR_getpid)
> +       : "cc","memory","cr0","ctr",
> +-        "r0","r2","r4","r5","r6","r7","r8","r9","r10","r11","r12"
> ++        "r0","r4","r5","r6","r7","r8","r9","r10","r11","r12"
> +    );
> +    return (UInt)__res;
> + }
> +--- a/include/valgrind.h
> ++++ b/include/valgrind.h
> +@@ -2708,7 +2708,7 @@ typedef
> + #define __CALLER_SAVED_REGS                                       \
> +    "lr", "ctr", "xer",                                            \
> +    "cr0", "cr1", "cr2", "cr3", "cr4", "cr5", "cr6", "cr7",        \
> +-   "r0", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",   \
> ++   "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",   \
> +    "r11", "r12", "r13"
> +
> + /* Macros to save and align the stack before making a function
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
> index 00135d8..8b0bc35 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
> @@ -31,6 +31,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>             file://0004-pth_atfork1.c-Define-error-API-for-musl.patch \
>             file://0005-tc20_verifywrap.c-Fake-__GLIBC_PREREQ-with-musl.patch \
>             file://0006-pth_detached3.c-Dereference-pthread_t-before-adding-.patch \
> +           file://wait-for-3.13.patch \
>             "
>  SRC_URI_append_libc-musl = "\
>             file://0001-fix-build-for-musl-targets.patch \
> @@ -40,6 +41,8 @@ SRC_URI[sha256sum] = "67ca4395b2527247780f36148b084f5743a68ab0c850cb43e4a5b4b012
>
>  COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
>
> +#COMPATIBLE_HOST_powerpc64 = 'null'
> +
>  # valgrind supports armv7 and above
>  COMPATIBLE_HOST_armv4 = 'null'
>  COMPATIBLE_HOST_armv5 = 'null'
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

