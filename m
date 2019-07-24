Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 353D87F0EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 12:31:08 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id z28so44405230ljn.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 05:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Ka/fIc63ZotjGT5UjFDP2/SiYyMfwRb0aHQHC0xL8WE=;
	b=K7qjbtbVBFAZC/7IVp2FniySy8h9W1xtABtxsa+pO8P/dR9OhMq2OK7m7s43tFOgwd
	R/dsSCBtVkndz1i+kFxsNYKdjiLfhvPAwEkQMaTUayhCh8oqCZ8jZEabRWQvRMSAIRFm
	yaH+80Xs4nco0FQ0I76TRXjMrYjl4g/B3u8X/7xOMHkix9U30Xs8LcLsLSG99L6ZGzOT
	bHL5+B7nTFHai/U3gBoz1/kpjRjrjurR4CNa97j44n+CxruQ15iTtLyfKZ5IyFln2jAY
	bRCcrFhR+/WpEnxR5rUGlqRqFHYMkzJ2deZ0O1eSOT59K3KO7rOWsF9/s6lNPMPbwwEa
	Ex/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Ka/fIc63ZotjGT5UjFDP2/SiYyMfwRb0aHQHC0xL8WE=;
	b=j338nNdzD1PJz6yxIq4ny0dlAy9izz+M8gJjuQJZJ3bF/oDg20F84yRt1iD7O90FEj
	WdfXHQhBnhyCtryxHuIWGyYLJyZ8A6QtKNS8Cr7EbkHG8YWMUe5hj+kIkN0jIWvyaVFr
	0pE1zpiYGz5RZvokEYYClFb3JhLcglQCwqYWUTS7txjp+GzQ4gK6d4df+pA5PmmC5Jn/
	hI7gPLD1dgaj4ux0+os9cUcUOdsAsWIf9syhlqv6MwKh4GeG64Bizqsj8kvsn9QMPY+V
	zE74lNiYePHM8+uuIAiWGplXz1T/Pwy8HKgFIsaTNiO+oRKsgrQd/ucUVHEsEw59bBWm
	JFxg==
X-Gm-Message-State: APjAAAXp08lf242w/crb85wekCtAulmhJd2K07YRLjQia3zzBmgx14Xd
	Hr0xVIAIfvS6alrw7cSCMywliSaFbQVpKEpkap31zZkW5xo=
X-Google-Smtp-Source: APXvYqxxqORhMzNMWOrg/1dDvlIvoHPhZgvTeXbyPfV+oVuS/C+Eep9cdLKyXHWUdXiBv8F8oCU+kwQPxHZe56uCey0=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr2836121ljj.185.1563971469459; 
	Wed, 24 Jul 2019 05:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190724065615.13704-1-raj.khem@gmail.com>
In-Reply-To: <20190724065615.13704-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Jul 2019 08:30:58 -0400
Message-ID: <CADkTA4MUfLX70RejaS5sMZw7vyUzPy1k0x9KMZxQD3hM-2EEjQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] linux-libc-header: Fix ptrace.h and prctl.h conflict on aarch64
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
X-List-Received-Date: Wed, 24 Jul 2019 12:31:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

v2 looks good to me.

I have a full linux-libc-headers from 5.2 just about ready to go, so
I'll make sure to test and drop this patch as part of that work.

Cheers,

Bruce

On Wed, Jul 24, 2019 at 2:56 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This is a backport from 5.2 release upstream, it fixes long standing
> build failure on musl/aarch64
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Drop unused patch
>
>  ...sm-ptrace.h-should-not-depend-on-uap.patch | 62 +++++++++++++++++++
>  .../linux-libc-headers_5.0.bb                 |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-hea=
ders/0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
01-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch b/meta/recipe=
s-kernel/linux-libc-headers/linux-libc-headers/0001-arm64-sve-uapi-asm-ptra=
ce.h-should-not-depend-on-uap.patch
> new file mode 100644
> index 0000000000..5ea46e9590
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-arm6=
4-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.patch
> @@ -0,0 +1,62 @@
> +From 35341ca0614ab13e1ef34ad4f29a39e15ef31fa8 Mon Sep 17 00:00:00 2001
> +From: Anisse Astier <aastier@freebox.fr>
> +Date: Mon, 17 Jun 2019 15:22:22 +0200
> +Subject: [PATCH] arm64/sve: <uapi/asm/ptrace.h> should not depend on
> + <uapi/linux/prctl.h>
> +
> +Pulling linux/prctl.h into asm/ptrace.h in the arm64 UAPI headers causes
> +userspace build issues for any program (e.g. strace and qemu) that
> +includes both <sys/prctl.h> and <linux/ptrace.h> when using musl libc:
> +
> +  | error: redefinition of 'struct prctl_mm_map'
> +  |  struct prctl_mm_map {
> +
> +See https://github.com/foundriesio/meta-lmp/commit/6d4a106e191b5d79c41b9=
ac78fd321316d3013c0
> +for a public example of people working around this issue.
> +
> +Although it's a bit grotty, fix this breakage by duplicating the prctl
> +constant definitions. Since these are part of the kernel ABI, they
> +cannot be changed in future and so it's not the end of the world to have
> +them open-coded.
> +
> +Fixes: 43d4da2c45b2 ("arm64/sve: ptrace and ELF coredump support")
> +
> +Upstream-Status: Backport [https://github.com/torvalds/linux/commit/3534=
1ca0614ab13e1ef34ad4f29a39e15ef31fa8]
> +Cc: stable@vger.kernel.org
> +Acked-by: Dave Martin <Dave.Martin@arm.com>
> +Signed-off-by: Anisse Astier <aastier@freebox.fr>
> +Signed-off-by: Will Deacon <will.deacon@arm.com>
> +---
> + arch/arm64/include/uapi/asm/ptrace.h | 8 +++-----
> + 1 file changed, 3 insertions(+), 5 deletions(-)
> +
> +diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/u=
api/asm/ptrace.h
> +index 97c53203150b..e932284993d4 100644
> +--- a/arch/arm64/include/uapi/asm/ptrace.h
> ++++ b/arch/arm64/include/uapi/asm/ptrace.h
> +@@ -65,8 +65,6 @@
> +
> + #ifndef __ASSEMBLY__
> +
> +-#include <linux/prctl.h>
> +-
> + /*
> +  * User structures for general purpose, floating point and debug regist=
ers.
> +  */
> +@@ -113,10 +111,10 @@ struct user_sve_header {
> +
> + /*
> +  * Common SVE_PT_* flags:
> +- * These must be kept in sync with prctl interface in <linux/ptrace.h>
> ++ * These must be kept in sync with prctl interface in <linux/prctl.h>
> +  */
> +-#define SVE_PT_VL_INHERIT             (PR_SVE_VL_INHERIT >> 16)
> +-#define SVE_PT_VL_ONEXEC              (PR_SVE_SET_VL_ONEXEC >> 16)
> ++#define SVE_PT_VL_INHERIT             ((1 << 17) /* PR_SVE_VL_INHERIT *=
/ >> 16)
> ++#define SVE_PT_VL_ONEXEC              ((1 << 18) /* PR_SVE_SET_VL_ONEXE=
C */ >> 16)
> +
> +
> + /*
> +--
> +2.22.0
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.=
0.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb
> index e76120c5b8..473688d95f 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb
> @@ -12,6 +12,7 @@ SRC_URI_append_libc-musl =3D "\
>  SRC_URI_append =3D "\
>      file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.pat=
ch \
>      file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.pat=
ch \
> +    file://0001-arm64-sve-uapi-asm-ptrace.h-should-not-depend-on-uap.pat=
ch \
>  "
>
>  SRC_URI[md5sum] =3D "7381ce8aac80a01448e065ce795c19c0"
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

