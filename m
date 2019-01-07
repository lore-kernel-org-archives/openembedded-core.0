Return-Path: <raj.khem@gmail.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id C60147BF11
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 18:51:02 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id c206so1234288oib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 10:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uajHstGgzeYnsil+zzsginJ+Gi727rDzybkx6UjXEW0=;
	b=PhjiRuPDDyfACbDqtAckiVJ60rV2o7mukXcpCvjiEL//3gGPZDzPz56aWJQAN5IfYN
	xgzb5/wFmy9RTL8GCv4UrQoPMxWTThv+dYSX3vlxPPtX31OyQo44df2LjsaO8ve4cEd5
	w4OOT80o9SMNoT8uf6WHWQKlzrUZ12f2Bu1TuZKekJnxj888MrlsJr1qrFRU+PUNjR+Y
	eMICvvd92qPDEgxnV9HSv+2FTS3nZOY3Fw3w6U0O1xcI5DU74TRB/CuAyqjb6UlZzxoB
	OXyiXLGmHM36X0bDUxc5nE/quAu11a1GOYxO0HZA4/S+n9grfn55Vym/0HimYRVsqdL9
	C1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uajHstGgzeYnsil+zzsginJ+Gi727rDzybkx6UjXEW0=;
	b=l8o28FkjMd6dRR/p4J+7+LBgKGd/mFftjbOugutHSO/pid1TYMqg/RWBLWDxQh5OBc
	n5AtWxuCQtSVA5WEij/SwYEQ0hIDIuocJgb/t+q+obfQO6LJ3ycs9fm6YWrNEs7Iy8+N
	4Nyp9zBYIFPlhdUCITrLBRXHkfUHR5g7iCs5srSB82e5YVkq1RUC3mGcmNnv8Tn1Wz5R
	3IQyU77MPCyw5LgnSnom3mvv7j/dieALd8YHsjQLdX3xnvdKgZQGuwlupX9riQVhI2pI
	tcjxRvZktlzgigd/44qI0wQwlEunafyRAG4z/D3Mg+27p2cQ7BXZRHRa0V1pzcDiBjPE
	JgnQ==
X-Gm-Message-State: AJcUukcrPxCxxkI60VnGr8qHrJem+o+9+l5Eg9jYQ/TeVV9nh08WoTWI
	EzTdSlTYBa1I4PraOBB7e60TLEWqr8JX1s83KXI=
X-Google-Smtp-Source: ALg8bN45VpvugW6kZ8sGF9TuJnLok0Puh8tojIJWmFt40MlaQ4DuICcsdS3kA0J5NBbPW8IS4fWrEzkGyU6nYhcCWmM=
X-Received: by 2002:aca:da02:: with SMTP id r2mr8434923oig.66.1546887063209;
	Mon, 07 Jan 2019 10:51:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1546871336.git.bruce.ashfield@windriver.com>
	<328fc70b9e58c5ddb4dd265721ada519daa82272.1546871336.git.bruce.ashfield@windriver.com>
In-Reply-To: <328fc70b9e58c5ddb4dd265721ada519daa82272.1546871336.git.bruce.ashfield@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Jan 2019 10:50:36 -0800
Message-ID: <CAMKF1somHp9baX5QPAExC-hZMw-X_rXwcCpvy+GzbKrHPd0qOQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] linux-libc-headers: update to v4.19
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
X-List-Received-Date: Mon, 07 Jan 2019 18:51:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

thanks I will try it on musl/aach64 and see if it fixed all ptrace
using recipes build

On Mon, Jan 7, 2019 at 6:34 AM Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
>
> Updating the linux-libc-headers to match the latest reference
> kernel in oe-core.
>
> We addtionally add three patches (identified by Khem) to fix muslc
> aarch64 build issues.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc        |   2 +-
>  ...all_headers.sh-Strip-_UAPI-from-if-define.patch |  39 +++
>  ...-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch |  41 +++
>  ...isentangle-uapi-asm-ptrace.h-from-uapi-as.patch | 287 +++++++++++++++=
++++++
>  ...-headers_4.18.bb =3D> linux-libc-headers_4.19.bb} |   7 +-
>  meta/recipes-kernel/linux-libc-headers/x.mbox      | 174 +++++++++++++
>  6 files changed, 547 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-hea=
ders/0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-hea=
ders/0002-arm64-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-hea=
ders/0003-arm64-sve-Disentangle-uapi-asm-ptrace.h-from-uapi-as.patch
>  rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_4.18.b=
b =3D> linux-libc-headers_4.19.bb} (62%)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/x.mbox
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 8c99907f0278..812b923fa200 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -23,7 +23,7 @@ SDKGCCVERSION ?=3D "${GCCVERSION}"
>  BINUVERSION ?=3D "2.31%"
>  GDBVERSION ?=3D "8.2%"
>  GLIBCVERSION ?=3D "2.28%"
> -LINUXLIBCVERSION ?=3D "4.18%"
> +LINUXLIBCVERSION ?=3D "4.19%"
>  QEMUVERSION ?=3D "3.1%"
>  GOVERSION ?=3D "1.11%"
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
01-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.patch b/meta/recipe=
s-kernel/linux-libc-headers/linux-libc-headers/0001-kbuild-install_headers.=
sh-Strip-_UAPI-from-if-define.patch
> new file mode 100644
> index 000000000000..68ffb86f0775
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-kbui=
ld-install_headers.sh-Strip-_UAPI-from-if-define.patch
> @@ -0,0 +1,39 @@
> +From 9ca6c6a510bda90954aa2532711200b89dd1df89 Mon Sep 17 00:00:00 2001
> +From: Dave Martin <Dave.Martin@arm.com>
> +Date: Tue, 11 Dec 2018 19:26:45 +0000
> +Subject: [PATCH 1/3] kbuild: install_headers.sh: Strip _UAPI from
> + #if-defined() guards
> +
> +install_headers.sh knows how to strip the _UAPI prefix from #ifdef/
> +ifndef and #define directives used to guard headers against multiple
> +or inappropriate inclusion.  Currently this does not work for guards
> +in the "#if defined()" style, which may be needed for non-trivial
> +cases.
> +
> +This patch adds similar logic so that the _UAPI prefix is also
> +stripped from guard directives written using "#if defined()" etc.
> +
> +This is not completely foolproof, but will work for simple cases of
> +using #if defined() to guard against inappropriate header inclusion.
> +
> +Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +---
> + scripts/headers_install.sh | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> +index 593f8879c641..fe1d3fc0d33a 100755
> +--- a/scripts/headers_install.sh
> ++++ b/scripts/headers_install.sh
> +@@ -38,6 +38,7 @@ do
> +               -e 's/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attri=
bute__((packed))\2/g' \
> +               -e 's/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|=
$)/\1__\2__\3/g' \
> +               -e 's@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_=
UAPI@#\1 @' \
> ++              -e ':1;s/(#(if|elif)(.*[^A-Za-z0-9_])defined\([[:space:]]=
*)_UAPI/\1/;t1' \
> +               "$SRCDIR/$i" > "$OUTDIR/$FILE.sed" || exit 1
> +       scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ "$OUTDIR/$FIL=
E.sed" \
> +               > "$OUTDIR/$FILE"
> +--
> +2.5.0
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
02-arm64-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch b/meta/recipes-=
kernel/linux-libc-headers/linux-libc-headers/0002-arm64-sve-ptrace-Fix-SVE_=
PT_REGS_OFFSET-definition.patch
> new file mode 100644
> index 000000000000..1f3ec07aa999
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-arm6=
4-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch
> @@ -0,0 +1,41 @@
> +From 0dede80d25ae2005f8af7235809fc09a7c47c62e Mon Sep 17 00:00:00 2001
> +From: Dave Martin <Dave.Martin@arm.com>
> +Date: Tue, 11 Dec 2018 19:26:46 +0000
> +Subject: [PATCH 2/3] arm64/sve: ptrace: Fix SVE_PT_REGS_OFFSET definitio=
n
> +
> +SVE_PT_REGS_OFFSET is supposed to indicate the offset for skipping
> +over the ptrace NT_ARM_SVE header (struct user_sve_header) to the
> +start of the SVE register data proper.
> +
> +However, currently SVE_PT_REGS_OFFSET is defined in terms of struct
> +sve_context, which is wrong: that structure describes the SVE
> +header in the signal frame, not in the ptrace regset.
> +
> +This patch fixes the definition to use the ptrace header structure
> +struct user_sve_header instead.
> +
> +By good fortune, the to structures are the same size anyway, so
> +there is no functional or ABI change.
> +
> +Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +---
> + arch/arm64/include/uapi/asm/ptrace.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/u=
api/asm/ptrace.h
> +index 98c4ce55d9c3..ad64d2c92ef5 100644
> +--- a/arch/arm64/include/uapi/asm/ptrace.h
> ++++ b/arch/arm64/include/uapi/asm/ptrace.h
> +@@ -130,7 +130,7 @@ struct user_sve_header {
> +
> + /* Offset from the start of struct user_sve_header to the register data=
 */
> + #define SVE_PT_REGS_OFFSET                                    \
> +-      ((sizeof(struct sve_context) + (SVE_VQ_BYTES - 1))      \
> ++      ((sizeof(struct user_sve_header) + (SVE_VQ_BYTES - 1))  \
> +               / SVE_VQ_BYTES * SVE_VQ_BYTES)
> +
> + /*
> +--
> +2.5.0
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
03-arm64-sve-Disentangle-uapi-asm-ptrace.h-from-uapi-as.patch b/meta/recipe=
s-kernel/linux-libc-headers/linux-libc-headers/0003-arm64-sve-Disentangle-u=
api-asm-ptrace.h-from-uapi-as.patch
> new file mode 100644
> index 000000000000..c7a3ce31c94c
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-arm6=
4-sve-Disentangle-uapi-asm-ptrace.h-from-uapi-as.patch
> @@ -0,0 +1,287 @@
> +From 1114697c04b9699112e78dd8fc6ec849609ca1cb Mon Sep 17 00:00:00 2001
> +From: Dave Martin <Dave.Martin@arm.com>
> +Date: Tue, 11 Dec 2018 19:26:47 +0000
> +Subject: [PATCH 3/3] arm64/sve: Disentangle <uapi/asm/ptrace.h> from
> + <uapi/asm/sigcontext.h>
> +
> +Currently, <uapi/asm/sigcontext.h> provides common definitions for
> +describing SVE context structures that are also used by the ptrace
> +definitions in <uapi/asm/ptrace.h>.
> +
> +For this reason, a #include of <asm/sigcontext.h> was added in
> +ptrace.h, but it this turns out that this can interact badly with
> +userspace code that tries to include ptrace.h on top of the libc
> +headers (which may provide their own shadow definitions for
> +sigcontext.h).
> +
> +To make the headers easier for userspace to consume, this patch
> +bounces the common definitions into an __SVE_* namespace and moves
> +them to a backend header <uapi/asm/sve_context.h> that can be
> +included by the other headers as appropriate.  This should allow
> +ptrace.h to be used alongside libc's sigcontext.h (if any) without
> +ill effects.
> +
> +This should make the situation unambiguous: <asm/sigcontext.h> is
> +the header to include for the sigframe-specific definitions, while
> +<asm/ptrace.h> is the header to include for ptrace-specific
> +definitions.
> +
> +To avoid conflicting with existing usage, <asm/sigcontext.h>
> +remains the canonical way to get the common definitions for
> +SVE_VQ_MIN, sve_vq_from_vl() etc., both in userspace and in the
> +kernel: relying on these being defined as a side effect of
> +including just <asm/ptrace.h> was never intended to be safe.
> +
> +Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +---
> + arch/arm64/include/uapi/asm/ptrace.h      | 39 ++++++++++-----------
> + arch/arm64/include/uapi/asm/sigcontext.h  | 56 +++++++++++++++---------=
-------
> + arch/arm64/include/uapi/asm/sve_context.h | 50 ++++++++++++++++++++++++=
+++
> + 3 files changed, 96 insertions(+), 49 deletions(-)
> + create mode 100644 arch/arm64/include/uapi/asm/sve_context.h
> +
> +diff --git a/arch/arm64/include/uapi/asm/ptrace.h b/arch/arm64/include/u=
api/asm/ptrace.h
> +index ad64d2c92ef5..81547c3a95a3 100644
> +--- a/arch/arm64/include/uapi/asm/ptrace.h
> ++++ b/arch/arm64/include/uapi/asm/ptrace.h
> +@@ -23,7 +23,7 @@
> + #include <linux/types.h>
> +
> + #include <asm/hwcap.h>
> +-#include <asm/sigcontext.h>
> ++#include <asm/sve_context.h>
> +
> +
> + /*
> +@@ -129,9 +129,9 @@ struct user_sve_header {
> +  */
> +
> + /* Offset from the start of struct user_sve_header to the register data=
 */
> +-#define SVE_PT_REGS_OFFSET                                    \
> +-      ((sizeof(struct user_sve_header) + (SVE_VQ_BYTES - 1))  \
> +-              / SVE_VQ_BYTES * SVE_VQ_BYTES)
> ++#define SVE_PT_REGS_OFFSET                                            \
> ++      ((sizeof(struct user_sve_header) + (__SVE_VQ_BYTES - 1))        \
> ++              / __SVE_VQ_BYTES * __SVE_VQ_BYTES)
> +
> + /*
> +  * The register data content and layout depends on the value of the
> +@@ -177,39 +177,36 @@ struct user_sve_header {
> +  * Additional data might be appended in the future.
> +  */
> +
> +-#define SVE_PT_SVE_ZREG_SIZE(vq)      SVE_SIG_ZREG_SIZE(vq)
> +-#define SVE_PT_SVE_PREG_SIZE(vq)      SVE_SIG_PREG_SIZE(vq)
> +-#define SVE_PT_SVE_FFR_SIZE(vq)               SVE_SIG_FFR_SIZE(vq)
> ++#define SVE_PT_SVE_ZREG_SIZE(vq)      __SVE_ZREG_SIZE(vq)
> ++#define SVE_PT_SVE_PREG_SIZE(vq)      __SVE_PREG_SIZE(vq)
> ++#define SVE_PT_SVE_FFR_SIZE(vq)               __SVE_FFR_SIZE(vq)
> + #define SVE_PT_SVE_FPSR_SIZE          sizeof(__u32)
> + #define SVE_PT_SVE_FPCR_SIZE          sizeof(__u32)
> +
> +-#define __SVE_SIG_TO_PT(offset) \
> +-      ((offset) - SVE_SIG_REGS_OFFSET + SVE_PT_REGS_OFFSET)
> +-
> + #define SVE_PT_SVE_OFFSET             SVE_PT_REGS_OFFSET
> +
> + #define SVE_PT_SVE_ZREGS_OFFSET \
> +-      __SVE_SIG_TO_PT(SVE_SIG_ZREGS_OFFSET)
> ++      (SVE_PT_REGS_OFFSET + __SVE_ZREGS_OFFSET)
> + #define SVE_PT_SVE_ZREG_OFFSET(vq, n) \
> +-      __SVE_SIG_TO_PT(SVE_SIG_ZREG_OFFSET(vq, n))
> ++      (SVE_PT_REGS_OFFSET + __SVE_ZREG_OFFSET(vq, n))
> + #define SVE_PT_SVE_ZREGS_SIZE(vq) \
> +-      (SVE_PT_SVE_ZREG_OFFSET(vq, SVE_NUM_ZREGS) - SVE_PT_SVE_ZREGS_OFF=
SET)
> ++      (SVE_PT_SVE_ZREG_OFFSET(vq, __SVE_NUM_ZREGS) - SVE_PT_SVE_ZREGS_O=
FFSET)
> +
> + #define SVE_PT_SVE_PREGS_OFFSET(vq) \
> +-      __SVE_SIG_TO_PT(SVE_SIG_PREGS_OFFSET(vq))
> ++      (SVE_PT_REGS_OFFSET + __SVE_PREGS_OFFSET(vq))
> + #define SVE_PT_SVE_PREG_OFFSET(vq, n) \
> +-      __SVE_SIG_TO_PT(SVE_SIG_PREG_OFFSET(vq, n))
> ++      (SVE_PT_REGS_OFFSET + __SVE_PREG_OFFSET(vq, n))
> + #define SVE_PT_SVE_PREGS_SIZE(vq) \
> +-      (SVE_PT_SVE_PREG_OFFSET(vq, SVE_NUM_PREGS) - \
> ++      (SVE_PT_SVE_PREG_OFFSET(vq, __SVE_NUM_PREGS) - \
> +               SVE_PT_SVE_PREGS_OFFSET(vq))
> +
> + #define SVE_PT_SVE_FFR_OFFSET(vq) \
> +-      __SVE_SIG_TO_PT(SVE_SIG_FFR_OFFSET(vq))
> ++      (SVE_PT_REGS_OFFSET + __SVE_FFR_OFFSET(vq))
> +
> + #define SVE_PT_SVE_FPSR_OFFSET(vq)                            \
> +       ((SVE_PT_SVE_FFR_OFFSET(vq) + SVE_PT_SVE_FFR_SIZE(vq) + \
> +-                      (SVE_VQ_BYTES - 1))                     \
> +-              / SVE_VQ_BYTES * SVE_VQ_BYTES)
> ++                      (__SVE_VQ_BYTES - 1))                   \
> ++              / __SVE_VQ_BYTES * __SVE_VQ_BYTES)
> + #define SVE_PT_SVE_FPCR_OFFSET(vq) \
> +       (SVE_PT_SVE_FPSR_OFFSET(vq) + SVE_PT_SVE_FPSR_SIZE)
> +
> +@@ -220,8 +217,8 @@ struct user_sve_header {
> +
> + #define SVE_PT_SVE_SIZE(vq, flags)                                    \
> +       ((SVE_PT_SVE_FPCR_OFFSET(vq) + SVE_PT_SVE_FPCR_SIZE             \
> +-                      - SVE_PT_SVE_OFFSET + (SVE_VQ_BYTES - 1))       \
> +-              / SVE_VQ_BYTES * SVE_VQ_BYTES)
> ++                      - SVE_PT_SVE_OFFSET + (__SVE_VQ_BYTES - 1))     \
> ++              / __SVE_VQ_BYTES * __SVE_VQ_BYTES)
> +
> + #define SVE_PT_SIZE(vq, flags)                                         =
       \
> +        (((flags) & SVE_PT_REGS_MASK) =3D=3D SVE_PT_REGS_SVE ?          =
   \
> +diff --git a/arch/arm64/include/uapi/asm/sigcontext.h b/arch/arm64/inclu=
de/uapi/asm/sigcontext.h
> +index dca8f8b5168b..5f3c0cec5af9 100644
> +--- a/arch/arm64/include/uapi/asm/sigcontext.h
> ++++ b/arch/arm64/include/uapi/asm/sigcontext.h
> +@@ -130,6 +130,8 @@ struct sve_context {
> +
> + #endif /* !__ASSEMBLY__ */
> +
> ++#include <asm/sve_context.h>
> ++
> + /*
> +  * The SVE architecture leaves space for future expansion of the
> +  * vector length beyond its initial architectural limit of 2048 bits
> +@@ -138,21 +140,20 @@ struct sve_context {
> +  * See linux/Documentation/arm64/sve.txt for a description of the VL/VQ
> +  * terminology.
> +  */
> +-#define SVE_VQ_BYTES          16      /* number of bytes per quadword *=
/
> ++#define SVE_VQ_BYTES          __SVE_VQ_BYTES  /* bytes per quadword */
> +
> +-#define SVE_VQ_MIN            1
> +-#define SVE_VQ_MAX            512
> ++#define SVE_VQ_MIN            __SVE_VQ_MIN
> ++#define SVE_VQ_MAX            __SVE_VQ_MAX
> +
> +-#define SVE_VL_MIN            (SVE_VQ_MIN * SVE_VQ_BYTES)
> +-#define SVE_VL_MAX            (SVE_VQ_MAX * SVE_VQ_BYTES)
> ++#define SVE_VL_MIN            __SVE_VL_MIN
> ++#define SVE_VL_MAX            __SVE_VL_MAX
> +
> +-#define SVE_NUM_ZREGS         32
> +-#define SVE_NUM_PREGS         16
> ++#define SVE_NUM_ZREGS         __SVE_NUM_ZREGS
> ++#define SVE_NUM_PREGS         __SVE_NUM_PREGS
> +
> +-#define sve_vl_valid(vl) \
> +-      ((vl) % SVE_VQ_BYTES =3D=3D 0 && (vl) >=3D SVE_VL_MIN && (vl) <=
=3D SVE_VL_MAX)
> +-#define sve_vq_from_vl(vl)    ((vl) / SVE_VQ_BYTES)
> +-#define sve_vl_from_vq(vq)    ((vq) * SVE_VQ_BYTES)
> ++#define sve_vl_valid(vl)      __sve_vl_valid(vl)
> ++#define sve_vq_from_vl(vl)    __sve_vq_from_vl(vl)
> ++#define sve_vl_from_vq(vq)    __sve_vl_from_vq(vq)
> +
> + /*
> +  * If the SVE registers are currently live for the thread at signal del=
ivery,
> +@@ -205,34 +206,33 @@ struct sve_context {
> +  * Additional data might be appended in the future.
> +  */
> +
> +-#define SVE_SIG_ZREG_SIZE(vq) ((__u32)(vq) * SVE_VQ_BYTES)
> +-#define SVE_SIG_PREG_SIZE(vq) ((__u32)(vq) * (SVE_VQ_BYTES / 8))
> +-#define SVE_SIG_FFR_SIZE(vq)  SVE_SIG_PREG_SIZE(vq)
> ++#define SVE_SIG_ZREG_SIZE(vq) __SVE_ZREG_SIZE(vq)
> ++#define SVE_SIG_PREG_SIZE(vq) __SVE_PREG_SIZE(vq)
> ++#define SVE_SIG_FFR_SIZE(vq)  __SVE_FFR_SIZE(vq)
> +
> + #define SVE_SIG_REGS_OFFSET                                   \
> +-      ((sizeof(struct sve_context) + (SVE_VQ_BYTES - 1))      \
> +-              / SVE_VQ_BYTES * SVE_VQ_BYTES)
> ++      ((sizeof(struct sve_context) + (__SVE_VQ_BYTES - 1))    \
> ++              / __SVE_VQ_BYTES * __SVE_VQ_BYTES)
> +
> +-#define SVE_SIG_ZREGS_OFFSET  SVE_SIG_REGS_OFFSET
> ++#define SVE_SIG_ZREGS_OFFSET \
> ++              (SVE_SIG_REGS_OFFSET + __SVE_ZREGS_OFFSET)
> + #define SVE_SIG_ZREG_OFFSET(vq, n) \
> +-      (SVE_SIG_ZREGS_OFFSET + SVE_SIG_ZREG_SIZE(vq) * (n))
> +-#define SVE_SIG_ZREGS_SIZE(vq) \
> +-      (SVE_SIG_ZREG_OFFSET(vq, SVE_NUM_ZREGS) - SVE_SIG_ZREGS_OFFSET)
> ++              (SVE_SIG_REGS_OFFSET + __SVE_ZREG_OFFSET(vq, n))
> ++#define SVE_SIG_ZREGS_SIZE(vq) __SVE_ZREGS_SIZE(vq)
> +
> + #define SVE_SIG_PREGS_OFFSET(vq) \
> +-      (SVE_SIG_ZREGS_OFFSET + SVE_SIG_ZREGS_SIZE(vq))
> ++              (SVE_SIG_REGS_OFFSET + __SVE_PREGS_OFFSET(vq))
> + #define SVE_SIG_PREG_OFFSET(vq, n) \
> +-      (SVE_SIG_PREGS_OFFSET(vq) + SVE_SIG_PREG_SIZE(vq) * (n))
> +-#define SVE_SIG_PREGS_SIZE(vq) \
> +-      (SVE_SIG_PREG_OFFSET(vq, SVE_NUM_PREGS) - SVE_SIG_PREGS_OFFSET(vq=
))
> ++              (SVE_SIG_REGS_OFFSET + __SVE_PREG_OFFSET(vq, n))
> ++#define SVE_SIG_PREGS_SIZE(vq) __SVE_PREGS_SIZE(vq)
> +
> + #define SVE_SIG_FFR_OFFSET(vq) \
> +-      (SVE_SIG_PREGS_OFFSET(vq) + SVE_SIG_PREGS_SIZE(vq))
> ++              (SVE_SIG_REGS_OFFSET + __SVE_FFR_OFFSET(vq))
> +
> + #define SVE_SIG_REGS_SIZE(vq) \
> +-      (SVE_SIG_FFR_OFFSET(vq) + SVE_SIG_FFR_SIZE(vq) - SVE_SIG_REGS_OFF=
SET)
> +-
> +-#define SVE_SIG_CONTEXT_SIZE(vq) (SVE_SIG_REGS_OFFSET + SVE_SIG_REGS_SI=
ZE(vq))
> ++              (__SVE_FFR_OFFSET(vq) + __SVE_FFR_SIZE(vq))
> +
> ++#define SVE_SIG_CONTEXT_SIZE(vq) \
> ++              (SVE_SIG_REGS_OFFSET + SVE_SIG_REGS_SIZE(vq))
> +
> + #endif /* _UAPI__ASM_SIGCONTEXT_H */
> +diff --git a/arch/arm64/include/uapi/asm/sve_context.h b/arch/arm64/incl=
ude/uapi/asm/sve_context.h
> +new file mode 100644
> +index 000000000000..140f14c318a5
> +--- /dev/null
> ++++ b/arch/arm64/include/uapi/asm/sve_context.h
> +@@ -0,0 +1,50 @@
> ++/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> ++/* Copyright (C) 2017-2018 ARM Limited */
> ++
> ++#if !defined(_UAPI__ASM_PTRACE_H) && !defined(_UAPI__ASM_SIGCONTEXT_H)
> ++#error "Do not include this header or use its definitions directly."
> ++#endif
> ++
> ++#ifndef _UAPI__ASM_SVE_CONTEXT_H
> ++#define _UAPI__ASM_SVE_CONTEXT_H
> ++
> ++#define __SVE_VQ_BYTES                16      /* number of bytes per qu=
adword */
> ++
> ++#define __SVE_VQ_MIN          1
> ++#define __SVE_VQ_MAX          512
> ++
> ++#define __SVE_VL_MIN          (__SVE_VQ_MIN * __SVE_VQ_BYTES)
> ++#define __SVE_VL_MAX          (__SVE_VQ_MAX * __SVE_VQ_BYTES)
> ++
> ++#define __SVE_NUM_ZREGS               32
> ++#define __SVE_NUM_PREGS               16
> ++
> ++#define __sve_vl_valid(vl)                    \
> ++      ((vl) % __SVE_VQ_BYTES =3D=3D 0 &&          \
> ++       (vl) >=3D __SVE_VL_MIN &&                \
> ++       (vl) <=3D __SVE_VL_MAX)
> ++
> ++#define __sve_vq_from_vl(vl)  ((vl) / __SVE_VQ_BYTES)
> ++#define __sve_vl_from_vq(vq)  ((vq) * __SVE_VQ_BYTES)
> ++
> ++#define __SVE_ZREG_SIZE(vq)   ((__u32)(vq) * __SVE_VQ_BYTES)
> ++#define __SVE_PREG_SIZE(vq)   ((__u32)(vq) * (__SVE_VQ_BYTES / 8))
> ++#define __SVE_FFR_SIZE(vq)    __SVE_PREG_SIZE(vq)
> ++
> ++#define __SVE_ZREGS_OFFSET    0
> ++#define __SVE_ZREG_OFFSET(vq, n) \
> ++      (__SVE_ZREGS_OFFSET + __SVE_ZREG_SIZE(vq) * (n))
> ++#define __SVE_ZREGS_SIZE(vq) \
> ++      (__SVE_ZREG_OFFSET(vq, __SVE_NUM_ZREGS) - __SVE_ZREGS_OFFSET)
> ++
> ++#define __SVE_PREGS_OFFSET(vq) \
> ++      (__SVE_ZREGS_OFFSET + __SVE_ZREGS_SIZE(vq))
> ++#define __SVE_PREG_OFFSET(vq, n) \
> ++      (__SVE_PREGS_OFFSET(vq) + __SVE_PREG_SIZE(vq) * (n))
> ++#define __SVE_PREGS_SIZE(vq) \
> ++      (__SVE_PREG_OFFSET(vq, __SVE_NUM_PREGS) - __SVE_PREGS_OFFSET(vq))
> ++
> ++#define __SVE_FFR_OFFSET(vq) \
> ++      (__SVE_PREGS_OFFSET(vq) + __SVE_PREGS_SIZE(vq))
> ++
> ++#endif /* ! _UAPI__ASM_SVE_CONTEXT_H */
> +--
> +2.5.0
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.=
18.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
> similarity index 62%
> rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.1=
8.bb
> rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.=
bb
> index 229a0027d716..8fd427efef71 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
> @@ -11,7 +11,10 @@ SRC_URI_append_libc-musl =3D "\
>
>  SRC_URI_append =3D "\
>      file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.pat=
ch \
> +    file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.pat=
ch \
> +    file://0002-arm64-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch=
 \
> +    file://0003-arm64-sve-Disentangle-uapi-asm-ptrace.h-from-uapi-as.pat=
ch \
>  "
>
> -SRC_URI[md5sum] =3D "bee5fe53ee1c3142b8f0c12c0d3348f9"
> -SRC_URI[sha256sum] =3D "19d8bcf49ef530cd4e364a45b4a22fa70714b70349c8100e=
7308488e26f1eaf1"
> +SRC_URI[md5sum] =3D "740a90cf810c2105df8ee12e5d0bb900"
> +SRC_URI[sha256sum] =3D "0c68f5655528aed4f99dae71a5b259edc93239fa899e2df7=
9c055275c21749a1"
> diff --git a/meta/recipes-kernel/linux-libc-headers/x.mbox b/meta/recipes=
-kernel/linux-libc-headers/x.mbox
> new file mode 100644
> index 000000000000..25e76e7595c1
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/x.mbox
> @@ -0,0 +1,174 @@
> +From openembedded-core-bounces@lists.openembedded.org Tue Dec 25 20:46:0=
9 2018
> +Delivered-To: bruce.ashfield@gmail.com
> +Received: by 2002:a2e:4c3:0:0:0:0:0 with SMTP id a64-v6csp5312962ljf;
> +        Tue, 25 Dec 2018 17:46:09 -0800 (PST)
> +X-Google-Smtp-Source: ALg8bN5+ydksOT9csVRJHxYDz7K6mUppK0qIlnMBsbGWz9Sq8F=
dlk64bzsaJk68T9XGeIzgSwxS9
> +X-Received: by 2002:a63:295:: with SMTP id 143mr16751743pgc.362.15457887=
69434;
> +        Tue, 25 Dec 2018 17:46:09 -0800 (PST)
> +ARC-Seal: i=3D1; a=3Drsa-sha256; t=3D1545788769; cv=3Dnone;
> +        d=3Dgoogle.com; s=3Darc-20160816;
> +        b=3DjG9fBrPvXAw8K+BjylRwE9cyo1dGTSQIXWYQAsxDXBL4sJKb/9HQ7t9CARYj=
48ptNC
> +         PyU9C1SF8FBe8jel1WM2zKHYxcoKShkfNv92t9jrw7thhkeRGtOPIfoQXt1ma6+=
1MLGa
> +         hdinQ5eBKdQt2AouG0A8huAMuHJfxYB9XpD5771sN0XD51Ecc8oYTYOEPmzg21E=
Yg9EC
> +         /8A+bodbKwBlIjg6x/O1ucx7W6fV5iyeyaOsJbzbPZeTdC3FqGycgSfErAkyoEJ=
jYwAP
> +         /k5PPo4vm6SU3PHJOV7a2cLbWfG6bS5K6/cxzdpXQKTGheKZOc6FFE3ptZfAwkF=
bVxfX
> +         Siww=3D=3D
> +ARC-Message-Signature: i=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3Dg=
oogle.com; s=3Darc-20160816;
> +        h=3Derrors-to:sender:content-transfer-encoding:mime-version
> +         :list-subscribe:list-help:list-post:list-archive:list-unsubscri=
be
> +         :list-id:precedence:subject:cc:message-id:date:to:from:delivere=
d-to;
> +        bh=3DL66KCbYgtwDc95aWv7eY3oTToexeHY5x8MVGyHJ/gPM=3D;
> +        b=3DrrE3b6NDRkazf03I4sTmeHnGX/emKFRWJSUcjyKS2hmAS83KcWTj/WfkinO4=
w4TeuB
> +         S7hPfsAA+DsVLI8Qz0Y2FpZp8dyCeDTDkJtPqZdlDhErV2b3weNNFqbiY4fjIlR=
EkYO/
> +         OIg0TgyyPGu4Ekur2dkYbdGmxIGtNsdIEQwv/zROwASqQiK/jpz7M156pGCbKYi=
SZz1g
> +         k3Bwrg+ON72xwBpMoN/x/9Ep7UXl3dvKAkgxUgPaBnPuwDW3HV+y4a3AYyiBoXR=
RILvm
> +         NDuAEwBRysljjsAeD1fxvwtKosRKuNfQpKDwibdgcsHjywPZKykADwYvp3Yc9bd=
OUwry
> +         A8FA=3D=3D
> +ARC-Authentication-Results: i=3D1; mx.google.com;
> +       spf=3Dpass (google.com: best guess record for domain of openembed=
ded-core-bounces@lists.openembedded.org designates 140.211.169.62 as permit=
ted sender) smtp.mailfrom=3Dopenembedded-core-bounces@lists.openembedded.or=
g
> +Return-Path: <openembedded-core-bounces@lists.openembedded.org>
> +Received: from mail.openembedded.org (mail.openembedded.org. [140.211.16=
9.62])
> +        by mx.google.com with ESMTP id j35si31697173pgl.223.2018.12.25.1=
7.46.08;
> +        Tue, 25 Dec 2018 17:46:09 -0800 (PST)
> +Received-SPF: pass (google.com: best guess record for domain of openembe=
dded-core-bounces@lists.openembedded.org designates 140.211.169.62 as permi=
tted sender) client-ip=3D140.211.169.62;
> +Authentication-Results: mx.google.com;
> +       spf=3Dpass (google.com: best guess record for domain of openembed=
ded-core-bounces@lists.openembedded.org designates 140.211.169.62 as permit=
ted sender) smtp.mailfrom=3Dopenembedded-core-bounces@lists.openembedded.or=
g
> +Received: from 165.28.230.35.bc.googleusercontent.com (localhost [127.0.=
0.1])
> +       by mail.openembedded.org (Postfix) with ESMTP id 564896BEF4;
> +       Wed, 26 Dec 2018 01:45:54 +0000 (UTC)
> +X-Original-To: openembedded-core@lists.openembedded.org
> +Delivered-To: openembedded-core@lists.openembedded.org
> +Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
> +       by mail.openembedded.org (Postfix) with ESMTP id 812D86B79B
> +       for <openembedded-core@lists.openembedded.org>;
> +       Wed, 26 Dec 2018 01:45:45 +0000 (UTC)
> +Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
> +       by mail.windriver.com (8.15.2/8.15.1) with SMTP id wBQ1ji3b015924=
;
> +       Tue, 25 Dec 2018 17:45:44 -0800 (PST)
> +Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
> +       Tue, 25 Dec 2018 17:45:44 -0800
> +From: He Zhe <zhe.he@windriver.com>
> +To: openembedded-core@lists.openembedded.org
> +Date: Tue, 25 Dec 2018 17:45:44 -0800
> +Message-Id: <20181226014544.1991-1-zhe.he@windriver.com>
> +X-Mailer: git-send-email 2.11.0
> +Cc: bruce.ashfield@windriver.com
> +Subject: [OE-core] [PATCH] linux-libc-headers: Fix build failure with fi=
xed
> +       input and output files instead of pipe
> +X-BeenThere: openembedded-core@lists.openembedded.org
> +X-Mailman-Version: 2.1.12
> +Precedence: list
> +List-Id: Patches and discussions about the oe-core layer
> +       <openembedded-core.lists.openembedded.org>
> +List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openemb=
edded-core>,
> +       <mailto:openembedded-core-request@lists.openembedded.org?subject=
=3Dunsubscribe>
> +List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core=
/>
> +List-Post: <mailto:openembedded-core@lists.openembedded.org>
> +List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subj=
ect=3Dhelp>
> +List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core>,
> +       <mailto:openembedded-core-request@lists.openembedded.org?subject=
=3Dsubscribe>
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3D"us-ascii"
> +Content-Transfer-Encoding: 7bit
> +Sender: openembedded-core-bounces@lists.openembedded.org
> +Errors-To: openembedded-core-bounces@lists.openembedded.org
> +Status: RO
> +X-Status: A
> +Content-Length: 4076
> +Lines: 94
> +
> +This is an amendment for
> +2322dc4 "linux-libc-headers: Fix build failure by using fixed temporary =
file instead of pipe"
> +which moves just the temporary input file from /tmp to build directory. =
But the
> +build directory may not in the same file system with the output file,
> +/dev/null, either and thus make it possible to trigger that bug, 67f846b=
, in
> +binutil v2.31.
> +
> +This patch puts both the input and output files into build directory for=
 good.
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +---
> + ...fixed-input-and-output-files-instead-of-.patch} | 22 ++++++++++-----=
-------
> + .../linux-libc-headers/linux-libc-headers_4.18.bb  |  2 +-
> + 2 files changed, 11 insertions(+), 13 deletions(-)
> + rename meta/recipes-kernel/linux-libc-headers/linux-libc-headers/{0001-=
scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch =3D> 0001-script=
s-Use-fixed-input-and-output-files-instead-of-.patch} (83%)
> +
> +diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0=
001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch b/meta/recip=
es-kernel/linux-libc-headers/linux-libc-headers/0001-scripts-Use-fixed-inpu=
t-and-output-files-instead-of-.patch
> +similarity index 83%
> +rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
01-scripts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> +rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001=
-scripts-Use-fixed-input-and-output-files-instead-of-.patch
> +index 0d8fa80939..9ba1c076e8 100644
> +--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scr=
ipts-Use-fixed-temporary-file-instead-of-pipe-for.patch
> ++++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-scr=
ipts-Use-fixed-input-and-output-files-instead-of-.patch
> +@@ -1,7 +1,7 @@
> +-From 3bbea65e11918f8753e8006a2198b999cdb0af58 Mon Sep 17 00:00:00 2001
> ++From 694eba7bb974f6b8bd308804cb24350150108b2b Mon Sep 17 00:00:00 2001
> + From: He Zhe <zhe.he@windriver.com>
> + Date: Wed, 21 Nov 2018 15:12:43 +0800
> +-Subject: [PATCH] scripts: Use fixed temporary file instead of pipe for
> ++Subject: [PATCH] scripts: Use fixed input and output files instead of p=
ipe for
> +  here-doc
> +
> + There was a bug of "as" in binutils that when it checks if the input fi=
le and
> +@@ -40,31 +40,29 @@ Upstream-Status: Inappropriate [A work around for bi=
nutils v2.31]
> +
> + Signed-off-by: He Zhe <zhe.he@windriver.com>
> + ---
> +- scripts/gcc-goto.sh | 7 ++++++-
> +- 1 file changed, 6 insertions(+), 1 deletion(-)
> ++ scripts/gcc-goto.sh | 5 ++++-
> ++ 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> + diff --git a/scripts/gcc-goto.sh b/scripts/gcc-goto.sh
> +-index 083c526..0aaf1b4 100755
> ++index 083c526..8dfac55 100755
> + --- a/scripts/gcc-goto.sh
> + +++ b/scripts/gcc-goto.sh
> +-@@ -3,7 +3,9 @@
> ++@@ -3,7 +3,7 @@
> +  # Test for gcc 'asm goto' support
> +  # Copyright (C) 2010, Jason Baron <jbaron@redhat.com>
> +
> + -cat << "END" | $@ -x c - -c -o /dev/null >/dev/null 2>&1 && echo "y"
> +-+TMPFILE=3D`mktemp -p .`
> +-+
> +-+cat << "END" > ${TMPFILE}
> +++cat << "END" > ./input
> +  int main(void)
> +  {
> +  #if defined(__arm__) || defined(__aarch64__)
> +-@@ -20,3 +22,6 @@ entry:
> ++@@ -20,3 +20,6 @@ entry:
> +       return 0;
> +  }
> +  END
> + +
> +-+$@ -x c ${TMPFILE} -c -o /dev/null && echo "y"
> +-+rm ${TMPFILE}
> +++$@ -x c ./input -c -o ./output && echo "y"
> +++rm ./input ./output
> + --
> + 2.7.4
> +
> +diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4=
.18.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> +index 00420aa6f7..229a0027d7 100644
> +--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> ++++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.18.bb
> +@@ -10,7 +10,7 @@ SRC_URI_append_libc-musl =3D "\
> +    "
> +
> + SRC_URI_append =3D "\
> +-    file://0001-scripts-Use-fixed-temporary-file-instead-of-pipe-for.pa=
tch \
> ++    file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.pa=
tch \
> + "
> +
> + SRC_URI[md5sum] =3D "bee5fe53ee1c3142b8f0c12c0d3348f9"
> +--
> +2.11.0
> +
> +--
> +_______________________________________________
> +Openembedded-core mailing list
> +Openembedded-core@lists.openembedded.org
> +http://lists.openembedded.org/mailman/listinfo/openembedded-core
> +
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

