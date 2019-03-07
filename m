Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id EC9B27CECA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 15:19:48 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v10so17462158qtp.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 07:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ttkMnsCm3es3YjRcPpZBeV8Ue/kUmY51VXfbhaNJ3rA=;
	b=kMd18xnVaE+TvXOZR9wnW9X9OIFyNu/wsWae3Y6Z4QeP9vLHL94I2B/f7HwT3/aVyL
	Nu4bd+aUk1Ev2pNl79OD92em3tJkn/0iEHhIHBdppkPiqf7GZnSRhxZQE7hba3f59BH9
	8PcW6u13mvsCpsxp0WzOWYY/FsbW+hBYSoJkOGpv1vqM3B9dbZRvF/CsL2NIq8FSATKx
	uPRukgeWSwWJwQBo8zf5Jogm/LucTXTfXHiZb1VgcCH++9zzTNjWUWsBU0jYCZIBfxOx
	srJAC7/Baw8ttLiia/9QyTlkACoBTsL73exQ9OU2mcRJOUl4Q+6Il63vJF9X5tELtzuK
	qDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ttkMnsCm3es3YjRcPpZBeV8Ue/kUmY51VXfbhaNJ3rA=;
	b=nGAkTJuSS91ZNvffNu75CJ2dN4qOuhTKLIEC0TD8YEJCYXlF19W6/njMhAfnzTSyIK
	pGHiv0P1AaQtXO2RLmGYYBuOa3G2/hGZQBE1LT1vVDV1Jp2SXf8IjPYvW28UPSaywbYt
	2QdgtcXuGKzwfd0jg/K+kAvi21E3g2AJNivmZDKvQlTwpPaQpL3qU6/DLUkK03ZcUXh7
	BBPPlioYrIYH/vCYL+dkIjbMOsuLhkqIh7N6WGDbXF8xrsFhlN7zgnNHejfiaJVgyEhH
	Dle8COsBe9jeGo3LiI/cwwuQhHJ9NcOBlJk+JYNDPPw3gtmgPhDh9AwX6hU0fXrU2kLL
	ZTmA==
X-Gm-Message-State: APjAAAWBNcasejNdGoAkCvLGwY7Zd/zyqYTSaeGfj5eIzfo5uzCUkABy
	J+rkLhP6OMVd7tmMuURqFnzBL/kI5qLI7AwYWms=
X-Google-Smtp-Source: APXvYqwhbEQ1M1w/fnckBFVorklqncriAger2Bxfd+TW1tTR5ZnorV8b4J39PfnLGwFyTO7FfjnMc/OhP0VTvhqPfCg=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr10351693qte.196.1551971989318; 
	Thu, 07 Mar 2019 07:19:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
	<ae97e09579b59253aec08f5b8118e739ec57c4de.1551889557.git.bruce.ashfield@gmail.com>
In-Reply-To: <ae97e09579b59253aec08f5b8118e739ec57c4de.1551889557.git.bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2019 07:19:23 -0800
Message-ID: <CAMKF1squopTO1P=cN2ky2pEeH_kGqkW-HxLj=nm4QsvBhv6Tqg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] linux-libc-headers: update to 5.x headers
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
X-List-Received-Date: Thu, 07 Mar 2019 15:19:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce

https://errors.yoctoproject.org/Errors/Details/231923/

seems to be due to this. seems we need to get this define from
elsewhere have you encountered this?

On Wed, Mar 6, 2019 at 8:37 AM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating the linux-libc-headers to the 5.x kernel variant to match
> the latest reference kernel in the 2.7 release.
>
> We have two patches refreshed for context changes, and three patches
> dropped since they have been merged to the mainline kernel and are
> no longer necessary.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>  .../linux-libc-headers/linux-libc-headers.inc |   2 +
>  ...kernel_clockid_t-in-uapi-net_stamp.h.patch |  49 ---
>  ...d-input-and-output-files-instead-of-.patch |  11 +-
>  ...ce-Fix-SVE_PT_REGS_OFFSET-definition.patch |  43 ---
>  ...angle-uapi-asm-ptrace.h-from-uapi-as.patch | 289 ------------------
>  ...ders_4.19.bb =3D> linux-libc-headers_5.0.bb} |   7 +-
>  7 files changed, 10 insertions(+), 393 deletions(-)
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-hea=
ders/0001-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-hea=
ders/0002-arm64-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch
>  delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-hea=
ders/0003-arm64-sve-Disentangle-uapi-asm-ptrace.h-from-uapi-as.patch
>  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.19.b=
b =3D> linux-libc-headers_5.0.bb} (65%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 5d71825889..12d3901ee1 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -23,7 +23,7 @@ SDKGCCVERSION ?=3D "${GCCVERSION}"
>  BINUVERSION ?=3D "2.32%"
>  GDBVERSION ?=3D "8.2%"
>  GLIBCVERSION ?=3D "2.29%"
> -LINUXLIBCVERSION ?=3D "4.19%"
> +LINUXLIBCVERSION ?=3D "5.0%"
>  QEMUVERSION ?=3D "3.1%"
>  GOVERSION ?=3D "1.11%"
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.in=
c b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> index be215af9b9..7f838f623e 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -38,6 +38,8 @@ python __anonymous () {
>          d.setVar("HEADER_FETCH_VER", "3.0")
>      elif major =3D=3D "4":
>          d.setVar("HEADER_FETCH_VER", "4.x")
> +    elif major =3D=3D "5":
> +        d.setVar("HEADER_FETCH_VER", "5.x")
>      else:
>          d.setVar("HEADER_FETCH_VER", "2.6")
>  }
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
01-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch b/meta/recipes-kern=
el/linux-libc-headers/linux-libc-headers/0001-net-Use-__kernel_clockid_t-in=
-uapi-net_stamp.h.patch
> deleted file mode 100644
> index 3684cc21bf..0000000000
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-net-=
Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From e2c4cf7f98a519eb4d95532bfa06bcaf3562fed5 Mon Sep 17 00:00:00 2001
> -From: Davide Caratti <dcaratti@redhat.com>
> -Date: Mon, 17 Dec 2018 11:26:38 +0100
> -Subject: [PATCH] net: Use __kernel_clockid_t in uapi net_stamp.h
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Herton reports the following error when building a userspace program tha=
t
> -includes net_stamp.h:
> -
> - In file included from foo.c:2:
> - /usr/include/linux/net_tstamp.h:158:2: error: unknown type name
> - =E2=80=98clockid_t=E2=80=99
> -   clockid_t clockid; /* reference clockid */
> -   ^~~~~~~~~
> -
> -Fix it by using __kernel_clockid_t in place of clockid_t.
> -
> -Fixes: 80b14dee2bea ("net: Add a new socket option for a future transmit=
 time.")
> -Cc: Timothy Redaelli <tredaelli@redhat.com>
> -Reported-by: Herton R. Krzesinski <herton@redhat.com>
> -Signed-off-by: Davide Caratti <dcaratti@redhat.com>
> -Tested-by: Paolo Abeni <pabeni@redhat.com>
> -Signed-off-by: David S. Miller <davem@davemloft.net>
> ----
> -Upstream-Status: Backport [https://github.com/torvalds/linux/commit/e2c4=
cf7f98a519eb4d95532bfa06bcaf3562fed5]
> -
> - include/uapi/linux/net_tstamp.h | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/include/uapi/linux/net_tstamp.h b/include/uapi/linux/net_ts=
tamp.h
> -index 97ff3c17ec4d..e5b39721c6e4 100644
> ---- a/include/uapi/linux/net_tstamp.h
> -+++ b/include/uapi/linux/net_tstamp.h
> -@@ -155,8 +155,8 @@ enum txtime_flags {
> - };
> -
> - struct sock_txtime {
> --      clockid_t       clockid;        /* reference clockid */
> --      __u32           flags;          /* as defined by enum txtime_flag=
s */
> -+      __kernel_clockid_t      clockid;/* reference clockid */
> -+      __u32                   flags;  /* as defined by enum txtime_flag=
s */
> - };
> -
> - #endif /* _NET_TIMESTAMPING_H */
> ---
> -2.20.1
> -
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
01-scripts-Use-fixed-input-and-output-files-instead-of-.patch b/meta/recipe=
s-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-input=
-and-output-files-instead-of-.patch
> index 9ba1c076e8..a5ded602e5 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scri=
pts-Use-fixed-input-and-output-files-instead-of-.patch
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scri=
pts-Use-fixed-input-and-output-files-instead-of-.patch
> @@ -1,8 +1,7 @@
>  From 694eba7bb974f6b8bd308804cb24350150108b2b Mon Sep 17 00:00:00 2001
>  From: He Zhe <zhe.he@windriver.com>
>  Date: Wed, 21 Nov 2018 15:12:43 +0800
> -Subject: [PATCH] scripts: Use fixed input and output files instead of pi=
pe for
> - here-doc
> +Subject: [PATCH] scripts: Use fixed input and output files instead of pi=
pe for here-doc
>
>  There was a bug of "as" in binutils that when it checks if the input fil=
e and
>  output file are the same one, it would not check if they are on the same=
 block
> @@ -44,14 +43,14 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
>  diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh
> -index 083c526..8dfac55 100755
> +index 8b980fb22..d256a9438 100755
>  --- a/scripts/gcc-goto.sh
>  +++ b/scripts/gcc-goto.sh
>  @@ -3,7 +3,7 @@
>   # Test for gcc 'asm goto' support
>   # Copyright (C) 2010, Jason Baron <jbaron@redhat.com>
>
> --cat << "END" | $@ -x c - -c -o /dev/null >/dev/null 2>&1 && echo "y"
> +-cat << "END" | $@ -x c - -fno-PIE -c -o /dev/null
>  +cat << "END" > ./input
>   int main(void)
>   {
> @@ -61,8 +60,8 @@ index 083c526..8dfac55 100755
>   }
>   END
>  +
> -+$@ -x c ./input -c -o ./output && echo "y"
> ++$@ -x c ./input -fno-PIE -c -o ./output
>  +rm ./input ./output
>  --
> -2.7.4
> +2.19.1
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
02-arm64-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch b/meta/recipes-=
kernel/linux-libc-headers/linux-libc-headers/0002-arm64-sve-ptrace-Fix-SVE_=
PT_REGS_OFFSET-definition.patch
> deleted file mode 100644
> index 462fdba2ed..0000000000
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-arm6=
4-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 0dede80d25ae2005f8af7235809fc09a7c47c62e Mon Sep 17 00:00:00 2001
> -From: Dave Martin <Dave.Martin@arm.com>
> -Date: Tue, 11 Dec 2018 19:26:46 +0000
> -Subject: [PATCH 2/3] arm64/sve: ptrace: Fix SVE_PT_REGS_OFFSET definitio=
n
> -
> -SVE_PT_REGS_OFFSET is supposed to indicate the offset for skipping
> -over the ptrace NT_ARM_SVE header (struct user_sve_header) to the
> -start of the SVE register data proper.
> -
> -However, currently SVE_PT_REGS_OFFSET is defined in terms of struct
> -sve_context, which is wrong: that structure describes the SVE
> -header in the signal frame, not in the ptrace regset.
> -
> -This patch fixes the definition to use the ptrace header structure
> -struct user_sve_header instead.
> -
> -By good fortune, the to structures are the same size anyway, so
> -there is no functional or ABI change.
> -
> -Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> -
> -Upstream-Status: Submitted [https://www.spinics.net/lists/arm-kernel/msg=
694800.html]
> ----
> - arch/arm64/include/uapi/asm/ptrace.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/u=
api/asm/ptrace.h
> -index 98c4ce55d9c3..ad64d2c92ef5 100644
> ---- a/arch/arm64/include/uapi/asm/ptrace.h
> -+++ b/arch/arm64/include/uapi/asm/ptrace.h
> -@@ -130,7 +130,7 @@ struct user_sve_header {
> -
> - /* Offset from the start of struct user_sve_header to the register data=
 */
> - #define SVE_PT_REGS_OFFSET                                    \
> --      ((sizeof(struct sve_context) + (SVE_VQ_BYTES - 1))      \
> -+      ((sizeof(struct user_sve_header) + (SVE_VQ_BYTES - 1))  \
> -               / SVE_VQ_BYTES * SVE_VQ_BYTES)
> -
> - /*
> ---
> -2.5.0
> -
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
03-arm64-sve-Disentangle-uapi-asm-ptrace.h-from-uapi-as.patch b/meta/recipe=
s-kernel/linux-libc-headers/linux-libc-headers/0003-arm64-sve-Disentangle-u=
api-asm-ptrace.h-from-uapi-as.patch
> deleted file mode 100644
> index 0423f0f2cc..0000000000
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-arm6=
4-sve-Disentangle-uapi-asm-ptrace.h-from-uapi-as.patch
> +++ /dev/null
> @@ -1,289 +0,0 @@
> -From 1114697c04b9699112e78dd8fc6ec849609ca1cb Mon Sep 17 00:00:00 2001
> -From: Dave Martin <Dave.Martin@arm.com>
> -Date: Tue, 11 Dec 2018 19:26:47 +0000
> -Subject: [PATCH 3/3] arm64/sve: Disentangle <uapi/asm/ptrace.h> from
> - <uapi/asm/sigcontext.h>
> -
> -Currently, <uapi/asm/sigcontext.h> provides common definitions for
> -describing SVE context structures that are also used by the ptrace
> -definitions in <uapi/asm/ptrace.h>.
> -
> -For this reason, a #include of <asm/sigcontext.h> was added in
> -ptrace.h, but it this turns out that this can interact badly with
> -userspace code that tries to include ptrace.h on top of the libc
> -headers (which may provide their own shadow definitions for
> -sigcontext.h).
> -
> -To make the headers easier for userspace to consume, this patch
> -bounces the common definitions into an __SVE_* namespace and moves
> -them to a backend header <uapi/asm/sve_context.h> that can be
> -included by the other headers as appropriate.  This should allow
> -ptrace.h to be used alongside libc's sigcontext.h (if any) without
> -ill effects.
> -
> -This should make the situation unambiguous: <asm/sigcontext.h> is
> -the header to include for the sigframe-specific definitions, while
> -<asm/ptrace.h> is the header to include for ptrace-specific
> -definitions.
> -
> -To avoid conflicting with existing usage, <asm/sigcontext.h>
> -remains the canonical way to get the common definitions for
> -SVE_VQ_MIN, sve_vq_from_vl() etc., both in userspace and in the
> -kernel: relying on these being defined as a side effect of
> -including just <asm/ptrace.h> was never intended to be safe.
> -
> -Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> -Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> -
> -Upstream-Status: Submitted [https://www.spinics.net/lists/arm-kernel/msg=
694800.html]
> ----
> - arch/arm64/include/uapi/asm/ptrace.h      | 39 ++++++++++-----------
> - arch/arm64/include/uapi/asm/sigcontext.h  | 56 +++++++++++++++---------=
-------
> - arch/arm64/include/uapi/asm/sve_context.h | 50 ++++++++++++++++++++++++=
+++
> - 3 files changed, 96 insertions(+), 49 deletions(-)
> - create mode 100644 arch/arm64/include/uapi/asm/sve_context.h
> -
> -diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/u=
api/asm/ptrace.h
> -index ad64d2c92ef5..81547c3a95a3 100644
> ---- a/arch/arm64/include/uapi/asm/ptrace.h
> -+++ b/arch/arm64/include/uapi/asm/ptrace.h
> -@@ -23,7 +23,7 @@
> - #include <linux/types.h>
> -
> - #include <asm/hwcap.h>
> --#include <asm/sigcontext.h>
> -+#include <asm/sve_context.h>
> -
> -
> - /*
> -@@ -129,9 +129,9 @@ struct user_sve_header {
> -  */
> -
> - /* Offset from the start of struct user_sve_header to the register data=
 */
> --#define SVE_PT_REGS_OFFSET                                    \
> --      ((sizeof(struct user_sve_header) + (SVE_VQ_BYTES - 1))  \
> --              / SVE_VQ_BYTES * SVE_VQ_BYTES)
> -+#define SVE_PT_REGS_OFFSET                                            \
> -+      ((sizeof(struct user_sve_header) + (__SVE_VQ_BYTES - 1))        \
> -+              / __SVE_VQ_BYTES * __SVE_VQ_BYTES)
> -
> - /*
> -  * The register data content and layout depends on the value of the
> -@@ -177,39 +177,36 @@ struct user_sve_header {
> -  * Additional data might be appended in the future.
> -  */
> -
> --#define SVE_PT_SVE_ZREG_SIZE(vq)      SVE_SIG_ZREG_SIZE(vq)
> --#define SVE_PT_SVE_PREG_SIZE(vq)      SVE_SIG_PREG_SIZE(vq)
> --#define SVE_PT_SVE_FFR_SIZE(vq)               SVE_SIG_FFR_SIZE(vq)
> -+#define SVE_PT_SVE_ZREG_SIZE(vq)      __SVE_ZREG_SIZE(vq)
> -+#define SVE_PT_SVE_PREG_SIZE(vq)      __SVE_PREG_SIZE(vq)
> -+#define SVE_PT_SVE_FFR_SIZE(vq)               __SVE_FFR_SIZE(vq)
> - #define SVE_PT_SVE_FPSR_SIZE          sizeof(__u32)
> - #define SVE_PT_SVE_FPCR_SIZE          sizeof(__u32)
> -
> --#define __SVE_SIG_TO_PT(offset) \
> --      ((offset) - SVE_SIG_REGS_OFFSET + SVE_PT_REGS_OFFSET)
> --
> - #define SVE_PT_SVE_OFFSET             SVE_PT_REGS_OFFSET
> -
> - #define SVE_PT_SVE_ZREGS_OFFSET \
> --      __SVE_SIG_TO_PT(SVE_SIG_ZREGS_OFFSET)
> -+      (SVE_PT_REGS_OFFSET + __SVE_ZREGS_OFFSET)
> - #define SVE_PT_SVE_ZREG_OFFSET(vq, n) \
> --      __SVE_SIG_TO_PT(SVE_SIG_ZREG_OFFSET(vq, n))
> -+      (SVE_PT_REGS_OFFSET + __SVE_ZREG_OFFSET(vq, n))
> - #define SVE_PT_SVE_ZREGS_SIZE(vq) \
> --      (SVE_PT_SVE_ZREG_OFFSET(vq, SVE_NUM_ZREGS) - SVE_PT_SVE_ZREGS_OFF=
SET)
> -+      (SVE_PT_SVE_ZREG_OFFSET(vq, __SVE_NUM_ZREGS) - SVE_PT_SVE_ZREGS_O=
FFSET)
> -
> - #define SVE_PT_SVE_PREGS_OFFSET(vq) \
> --      __SVE_SIG_TO_PT(SVE_SIG_PREGS_OFFSET(vq))
> -+      (SVE_PT_REGS_OFFSET + __SVE_PREGS_OFFSET(vq))
> - #define SVE_PT_SVE_PREG_OFFSET(vq, n) \
> --      __SVE_SIG_TO_PT(SVE_SIG_PREG_OFFSET(vq, n))
> -+      (SVE_PT_REGS_OFFSET + __SVE_PREG_OFFSET(vq, n))
> - #define SVE_PT_SVE_PREGS_SIZE(vq) \
> --      (SVE_PT_SVE_PREG_OFFSET(vq, SVE_NUM_PREGS) - \
> -+      (SVE_PT_SVE_PREG_OFFSET(vq, __SVE_NUM_PREGS) - \
> -               SVE_PT_SVE_PREGS_OFFSET(vq))
> -
> - #define SVE_PT_SVE_FFR_OFFSET(vq) \
> --      __SVE_SIG_TO_PT(SVE_SIG_FFR_OFFSET(vq))
> -+      (SVE_PT_REGS_OFFSET + __SVE_FFR_OFFSET(vq))
> -
> - #define SVE_PT_SVE_FPSR_OFFSET(vq)                            \
> -       ((SVE_PT_SVE_FFR_OFFSET(vq) + SVE_PT_SVE_FFR_SIZE(vq) + \
> --                      (SVE_VQ_BYTES - 1))                     \
> --              / SVE_VQ_BYTES * SVE_VQ_BYTES)
> -+                      (__SVE_VQ_BYTES - 1))                   \
> -+              / __SVE_VQ_BYTES * __SVE_VQ_BYTES)
> - #define SVE_PT_SVE_FPCR_OFFSET(vq) \
> -       (SVE_PT_SVE_FPSR_OFFSET(vq) + SVE_PT_SVE_FPSR_SIZE)
> -
> -@@ -220,8 +217,8 @@ struct user_sve_header {
> -
> - #define SVE_PT_SVE_SIZE(vq, flags)                                    \
> -       ((SVE_PT_SVE_FPCR_OFFSET(vq) + SVE_PT_SVE_FPCR_SIZE             \
> --                      - SVE_PT_SVE_OFFSET + (SVE_VQ_BYTES - 1))       \
> --              / SVE_VQ_BYTES * SVE_VQ_BYTES)
> -+                      - SVE_PT_SVE_OFFSET + (__SVE_VQ_BYTES - 1))     \
> -+              / __SVE_VQ_BYTES * __SVE_VQ_BYTES)
> -
> - #define SVE_PT_SIZE(vq, flags)                                         =
       \
> -        (((flags) & SVE_PT_REGS_MASK) =3D=3D SVE_PT_REGS_SVE ?          =
   \
> -diff --git a/arch/arm64/include/uapi/asm/sigcontext.h b/arch/arm64/inclu=
de/uapi/asm/sigcontext.h
> -index dca8f8b5168b..5f3c0cec5af9 100644
> ---- a/arch/arm64/include/uapi/asm/sigcontext.h
> -+++ b/arch/arm64/include/uapi/asm/sigcontext.h
> -@@ -130,6 +130,8 @@ struct sve_context {
> -
> - #endif /* !__ASSEMBLY__ */
> -
> -+#include <asm/sve_context.h>
> -+
> - /*
> -  * The SVE architecture leaves space for future expansion of the
> -  * vector length beyond its initial architectural limit of 2048 bits
> -@@ -138,21 +140,20 @@ struct sve_context {
> -  * See linux/Documentation/arm64/sve.txt for a description of the VL/VQ
> -  * terminology.
> -  */
> --#define SVE_VQ_BYTES          16      /* number of bytes per quadword *=
/
> -+#define SVE_VQ_BYTES          __SVE_VQ_BYTES  /* bytes per quadword */
> -
> --#define SVE_VQ_MIN            1
> --#define SVE_VQ_MAX            512
> -+#define SVE_VQ_MIN            __SVE_VQ_MIN
> -+#define SVE_VQ_MAX            __SVE_VQ_MAX
> -
> --#define SVE_VL_MIN            (SVE_VQ_MIN * SVE_VQ_BYTES)
> --#define SVE_VL_MAX            (SVE_VQ_MAX * SVE_VQ_BYTES)
> -+#define SVE_VL_MIN            __SVE_VL_MIN
> -+#define SVE_VL_MAX            __SVE_VL_MAX
> -
> --#define SVE_NUM_ZREGS         32
> --#define SVE_NUM_PREGS         16
> -+#define SVE_NUM_ZREGS         __SVE_NUM_ZREGS
> -+#define SVE_NUM_PREGS         __SVE_NUM_PREGS
> -
> --#define sve_vl_valid(vl) \
> --      ((vl) % SVE_VQ_BYTES =3D=3D 0 && (vl) >=3D SVE_VL_MIN && (vl) <=
=3D SVE_VL_MAX)
> --#define sve_vq_from_vl(vl)    ((vl) / SVE_VQ_BYTES)
> --#define sve_vl_from_vq(vq)    ((vq) * SVE_VQ_BYTES)
> -+#define sve_vl_valid(vl)      __sve_vl_valid(vl)
> -+#define sve_vq_from_vl(vl)    __sve_vq_from_vl(vl)
> -+#define sve_vl_from_vq(vq)    __sve_vl_from_vq(vq)
> -
> - /*
> -  * If the SVE registers are currently live for the thread at signal del=
ivery,
> -@@ -205,34 +206,33 @@ struct sve_context {
> -  * Additional data might be appended in the future.
> -  */
> -
> --#define SVE_SIG_ZREG_SIZE(vq) ((__u32)(vq) * SVE_VQ_BYTES)
> --#define SVE_SIG_PREG_SIZE(vq) ((__u32)(vq) * (SVE_VQ_BYTES / 8))
> --#define SVE_SIG_FFR_SIZE(vq)  SVE_SIG_PREG_SIZE(vq)
> -+#define SVE_SIG_ZREG_SIZE(vq) __SVE_ZREG_SIZE(vq)
> -+#define SVE_SIG_PREG_SIZE(vq) __SVE_PREG_SIZE(vq)
> -+#define SVE_SIG_FFR_SIZE(vq)  __SVE_FFR_SIZE(vq)
> -
> - #define SVE_SIG_REGS_OFFSET                                   \
> --      ((sizeof(struct sve_context) + (SVE_VQ_BYTES - 1))      \
> --              / SVE_VQ_BYTES * SVE_VQ_BYTES)
> -+      ((sizeof(struct sve_context) + (__SVE_VQ_BYTES - 1))    \
> -+              / __SVE_VQ_BYTES * __SVE_VQ_BYTES)
> -
> --#define SVE_SIG_ZREGS_OFFSET  SVE_SIG_REGS_OFFSET
> -+#define SVE_SIG_ZREGS_OFFSET \
> -+              (SVE_SIG_REGS_OFFSET + __SVE_ZREGS_OFFSET)
> - #define SVE_SIG_ZREG_OFFSET(vq, n) \
> --      (SVE_SIG_ZREGS_OFFSET + SVE_SIG_ZREG_SIZE(vq) * (n))
> --#define SVE_SIG_ZREGS_SIZE(vq) \
> --      (SVE_SIG_ZREG_OFFSET(vq, SVE_NUM_ZREGS) - SVE_SIG_ZREGS_OFFSET)
> -+              (SVE_SIG_REGS_OFFSET + __SVE_ZREG_OFFSET(vq, n))
> -+#define SVE_SIG_ZREGS_SIZE(vq) __SVE_ZREGS_SIZE(vq)
> -
> - #define SVE_SIG_PREGS_OFFSET(vq) \
> --      (SVE_SIG_ZREGS_OFFSET + SVE_SIG_ZREGS_SIZE(vq))
> -+              (SVE_SIG_REGS_OFFSET + __SVE_PREGS_OFFSET(vq))
> - #define SVE_SIG_PREG_OFFSET(vq, n) \
> --      (SVE_SIG_PREGS_OFFSET(vq) + SVE_SIG_PREG_SIZE(vq) * (n))
> --#define SVE_SIG_PREGS_SIZE(vq) \
> --      (SVE_SIG_PREG_OFFSET(vq, SVE_NUM_PREGS) - SVE_SIG_PREGS_OFFSET(vq=
))
> -+              (SVE_SIG_REGS_OFFSET + __SVE_PREG_OFFSET(vq, n))
> -+#define SVE_SIG_PREGS_SIZE(vq) __SVE_PREGS_SIZE(vq)
> -
> - #define SVE_SIG_FFR_OFFSET(vq) \
> --      (SVE_SIG_PREGS_OFFSET(vq) + SVE_SIG_PREGS_SIZE(vq))
> -+              (SVE_SIG_REGS_OFFSET + __SVE_FFR_OFFSET(vq))
> -
> - #define SVE_SIG_REGS_SIZE(vq) \
> --      (SVE_SIG_FFR_OFFSET(vq) + SVE_SIG_FFR_SIZE(vq) - SVE_SIG_REGS_OFF=
SET)
> --
> --#define SVE_SIG_CONTEXT_SIZE(vq) (SVE_SIG_REGS_OFFSET + SVE_SIG_REGS_SI=
ZE(vq))
> -+              (__SVE_FFR_OFFSET(vq) + __SVE_FFR_SIZE(vq))
> -
> -+#define SVE_SIG_CONTEXT_SIZE(vq) \
> -+              (SVE_SIG_REGS_OFFSET + SVE_SIG_REGS_SIZE(vq))
> -
> - #endif /* _UAPI__ASM_SIGCONTEXT_H */
> -diff --git a/arch/arm64/include/uapi/asm/sve_context.h b/arch/arm64/incl=
ude/uapi/asm/sve_context.h
> -new file mode 100644
> -index 000000000000..140f14c318a5
> ---- /dev/null
> -+++ b/arch/arm64/include/uapi/asm/sve_context.h
> -@@ -0,0 +1,50 @@
> -+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -+/* Copyright (C) 2017-2018 ARM Limited */
> -+
> -+#if !defined(_UAPI__ASM_PTRACE_H) && !defined(_UAPI__ASM_SIGCONTEXT_H)
> -+#error "Do not include this header or use its definitions directly."
> -+#endif
> -+
> -+#ifndef _UAPI__ASM_SVE_CONTEXT_H
> -+#define _UAPI__ASM_SVE_CONTEXT_H
> -+
> -+#define __SVE_VQ_BYTES                16      /* number of bytes per qu=
adword */
> -+
> -+#define __SVE_VQ_MIN          1
> -+#define __SVE_VQ_MAX          512
> -+
> -+#define __SVE_VL_MIN          (__SVE_VQ_MIN * __SVE_VQ_BYTES)
> -+#define __SVE_VL_MAX          (__SVE_VQ_MAX * __SVE_VQ_BYTES)
> -+
> -+#define __SVE_NUM_ZREGS               32
> -+#define __SVE_NUM_PREGS               16
> -+
> -+#define __sve_vl_valid(vl)                    \
> -+      ((vl) % __SVE_VQ_BYTES =3D=3D 0 &&          \
> -+       (vl) >=3D __SVE_VL_MIN &&                \
> -+       (vl) <=3D __SVE_VL_MAX)
> -+
> -+#define __sve_vq_from_vl(vl)  ((vl) / __SVE_VQ_BYTES)
> -+#define __sve_vl_from_vq(vq)  ((vq) * __SVE_VQ_BYTES)
> -+
> -+#define __SVE_ZREG_SIZE(vq)   ((__u32)(vq) * __SVE_VQ_BYTES)
> -+#define __SVE_PREG_SIZE(vq)   ((__u32)(vq) * (__SVE_VQ_BYTES / 8))
> -+#define __SVE_FFR_SIZE(vq)    __SVE_PREG_SIZE(vq)
> -+
> -+#define __SVE_ZREGS_OFFSET    0
> -+#define __SVE_ZREG_OFFSET(vq, n) \
> -+      (__SVE_ZREGS_OFFSET + __SVE_ZREG_SIZE(vq) * (n))
> -+#define __SVE_ZREGS_SIZE(vq) \
> -+      (__SVE_ZREG_OFFSET(vq, __SVE_NUM_ZREGS) - __SVE_ZREGS_OFFSET)
> -+
> -+#define __SVE_PREGS_OFFSET(vq) \
> -+      (__SVE_ZREGS_OFFSET + __SVE_ZREGS_SIZE(vq))
> -+#define __SVE_PREG_OFFSET(vq, n) \
> -+      (__SVE_PREGS_OFFSET(vq) + __SVE_PREG_SIZE(vq) * (n))
> -+#define __SVE_PREGS_SIZE(vq) \
> -+      (__SVE_PREG_OFFSET(vq, __SVE_NUM_PREGS) - __SVE_PREGS_OFFSET(vq))
> -+
> -+#define __SVE_FFR_OFFSET(vq) \
> -+      (__SVE_PREGS_OFFSET(vq) + __SVE_PREGS_SIZE(vq))
> -+
> -+#endif /* ! _UAPI__ASM_SVE_CONTEXT_H */
> ---
> -2.5.0
> -
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.=
19.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb
> similarity index 65%
> rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1=
9.bb
> rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.b=
b
> index 48f25ebc1a..e76120c5b8 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.0.bb
> @@ -10,12 +10,9 @@ SRC_URI_append_libc-musl =3D "\
>     "
>
>  SRC_URI_append =3D "\
> -    file://0001-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch \
>      file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.pat=
ch \
>      file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.pat=
ch \
> -    file://0002-arm64-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch=
 \
> -    file://0003-arm64-sve-Disentangle-uapi-asm-ptrace.h-from-uapi-as.pat=
ch \
>  "
>
> -SRC_URI[md5sum] =3D "740a90cf810c2105df8ee12e5d0bb900"
> -SRC_URI[sha256sum] =3D "0c68f5655528aed4f99dae71a5b259edc93239fa899e2df7=
9c055275c21749a1"
> +SRC_URI[md5sum] =3D "7381ce8aac80a01448e065ce795c19c0"
> +SRC_URI[sha256sum] =3D "437b141a6499159f5a7282d5eb4b2be055f8e862ccce44d7=
464e8759c31a2e43"
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

