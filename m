Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id F297C771A3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2016 21:03:40 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id l126so11652954vkh.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2016 13:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aa+ZMOVA4YS8aFf3HVSgZF9ZjNTg4IegylKC0mi4ACQ=;
	b=BPRew/1RK8/oBXj6Kd5/ntk2Bb35sX8rJuew5accELH6hMksXEpEKPr4onGkkTmbf6
	8nB5iXiDlKwzO8dXqVmkb0WeA7Dl9JJ2yVvISj65Penc7Gu5pSh0cTVlQFw9aQncUd2S
	9xeox1QdJqm3kjRRZZ7/8EnlEmYIpFwVqCLQqutglxG/LftVlDvlYB+rv6+p9H40MSKT
	u2Nc0dYzQYg9icq9LhS+yKDScxDKmz36xgeU2Htgh/hzpDsrlrNUcgoTKbQHupXXdfmq
	XcEqdZOaP+6IkpVz2CezOWF7IE1R7fBhfRb9rBtU5wyAavoGnnM9n75brVrakiCmc+tG
	lbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aa+ZMOVA4YS8aFf3HVSgZF9ZjNTg4IegylKC0mi4ACQ=;
	b=tEX+vAFdpHD1I4d3fWfcu+oLZRcfpWBi0115eNId48XjyfBc5odTkQl97lpgWk26BR
	nCfUxIwDXFfo4VdW4l3ny2psWqohqmR62mVy0JbKy4ioeeP7IXngAJWQGi/LxduReEnT
	dZpFhOD2lyIZRuTpe5HW339QoNAMZk33s+5pyuYghQrOvzDR9eFfbrvbcbOJWFN7uhlz
	yuRuyvJ7ikJDVlcbUTFfOJRzVWIdq2ko4dJtCK56/agMo7ucOSM8qHiBImo19PamzVmc
	COOqezdA5t11zueXt98cmYebu9OOM+JqBBmxxOYRioGxSLlfj1y9NMy1/WCCKBmT/eyT
	YbTw==
X-Gm-Message-State: AIkVDXI6HLMulpGrHRhHVDVYYAupKoSUIr2RPAf7kJCr6V6wwsxL/SPcRy9iLIvx2uzC+lVrSf5Tssz5a7Ttrg==
X-Received: by 10.31.115.205 with SMTP id o196mr3665819vkc.139.1482008621928; 
	Sat, 17 Dec 2016 13:03:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Sat, 17 Dec 2016 13:03:11 -0800 (PST)
In-Reply-To: <1481939011-3685-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
References: <1481939011-3685-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Dec 2016 13:03:11 -0800
Message-ID: <CAMKF1sopYg-AihWY2vKfqBNtJXkudvHGyPHehpDnWmjJ66cXLg@mail.gmail.com>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Sat, 17 Dec 2016 21:03:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 16, 2016 at 5:43 PM, Manjukumar Matha
<manjukumar.harthikote-matha@xilinx.com> wrote:
> There was bug with alignment frags for aarch64 in binutils. This is fixed in
> master of binutils. This patch backports the fix to binutils 2.27 version.
>

Looks fine. Thanks

> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
>  ...eration-of-alignment-frags-in-code-sectio.patch | 139 +++++++++++++++++++++
>  2 files changed, 140 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc b/meta/recipes-devtools/binutils/binutils-2.27.inc
> index df8864c..5a65d91 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.27.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
> @@ -37,6 +37,7 @@ SRC_URI = "\
>       file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
>       file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
>       file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
> +     file://0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch \
>       file://0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch \
>  "
>  S  = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
> new file mode 100644
> index 0000000..f8b46be
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
> @@ -0,0 +1,139 @@
> +From 4a4286465b5d6c28968bc2b29ae08daca7f219a3 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Fri, 18 Nov 2016 11:42:48 -0800
> +Subject: [PATCH] Fix the generation of alignment frags in code sections for AArch64.
> +
> +PR gas/20364
> +* config/tc-aarch64.c (s_ltorg): Change the mapping state after
> +aligning the frag.
> +(aarch64_init): Treat rs_align frags in code sections as
> +containing code, not data.
> +* testsuite/gas/aarch64/pr20364.s: New test.
> +* testsuite/gas/aarch64/pr20364.d: New test driver.
> +
> +Backporting the patch from binutils mainline
> +https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7ea12e5c3ad54da440c08f32da09534e63e515ca
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> +---
> + gas/ChangeLog                       | 10 ++++++++++
> + gas/config/tc-aarch64.c             | 10 +++++++---
> + gas/testsuite/gas/aarch64/pr20364.d | 13 +++++++++++++
> + gas/testsuite/gas/aarch64/pr20364.s | 28 ++++++++++++++++++++++++++++
> + 4 files changed, 58 insertions(+), 3 deletions(-)
> + create mode 100644 gas/testsuite/gas/aarch64/pr20364.d
> + create mode 100644 gas/testsuite/gas/aarch64/pr20364.s
> +
> +diff --git a/gas/ChangeLog b/gas/ChangeLog
> +index a39895a..fad06dc 100644
> +--- a/gas/ChangeLog
> ++++ b/gas/ChangeLog
> +@@ -1,3 +1,13 @@
> ++2016-08-05  Nick Clifton  <nickc@redhat.com>
> ++
> ++      PR gas/20364
> ++      * config/tc-aarch64.c (s_ltorg): Change the mapping state after
> ++      aligning the frag.
> ++      (aarch64_init): Treat rs_align frags in code sections as
> ++      containing code, not data.
> ++      * testsuite/gas/aarch64/pr20364.s: New test.
> ++      * testsuite/gas/aarch64/pr20364.d: New test driver.
> ++
> + 2016-08-03  Tristan Gingold  <gingold@adacore.com>
> +
> +       * configure: Regenerate.
> +diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
> +index ddc40f2..74933cb 100644
> +--- a/gas/config/tc-aarch64.c
> ++++ b/gas/config/tc-aarch64.c
> +@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)
> +       if (pool == NULL || pool->symbol == NULL || pool->next_free_entry == 0)
> +       continue;
> +
> +-      mapping_state (MAP_DATA);
> +-
> +       /* Align pool as you have word accesses.
> +          Only make a frag if we have to.  */
> +       if (!need_pass_2)
> +       frag_align (align, 0, 0);
> +
> ++      mapping_state (MAP_DATA);
> ++
> +       record_alignment (now_seg, align);
> +
> +       sprintf (sym_name, "$$lit_\002%x", pool->id);
> +@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int max_chars)
> +
> +   switch (fragP->fr_type)
> +     {
> +-    case rs_align:
> +     case rs_align_test:
> +     case rs_fill:
> +       mapping_state_2 (MAP_DATA, max_chars);
> +       break;
> ++    case rs_align:
> ++      /* PR 20364: We can get alignment frags in code sections,
> ++       so do not just assume that we should use the MAP_DATA state.  */
> ++      mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN : MAP_DATA, max_chars);
> ++      break;
> +     case rs_align_code:
> +       mapping_state_2 (MAP_INSN, max_chars);
> +       break;
> +diff --git a/gas/testsuite/gas/aarch64/pr20364.d b/gas/testsuite/gas/aarch64/pr20364.d
> +new file mode 100644
> +index 0000000..babcff1
> +--- /dev/null
> ++++ b/gas/testsuite/gas/aarch64/pr20364.d
> +@@ -0,0 +1,13 @@
> ++# Check that ".align <size>, <fill>" does not set the mapping state to DATA, causing unnecessary frag generation.
> ++#name: PR20364
> ++#objdump: -d
> ++
> ++.*:     file format .*
> ++
> ++Disassembly of section \.vectors:
> ++
> ++0+000 <.*>:
> ++   0: d2800000        mov     x0, #0x0                        // #0
> ++   4: 94000000        bl      0 <plat_report_exception>
> ++   8: 17fffffe        b       0 <bl1_exceptions>
> ++
> +diff --git a/gas/testsuite/gas/aarch64/pr20364.s b/gas/testsuite/gas/aarch64/pr20364.s
> +new file mode 100644
> +index 0000000..594ad7c
> +--- /dev/null
> ++++ b/gas/testsuite/gas/aarch64/pr20364.s
> +@@ -0,0 +1,28 @@
> ++ .macro vector_base label
> ++ .section .vectors, "ax"
> ++ .align 11, 0
> ++ \label:
> ++ .endm
> ++
> ++ .macro vector_entry label
> ++ .section .vectors, "ax"
> ++ .align 7, 0
> ++ \label:
> ++ .endm
> ++
> ++ .macro check_vector_size since
> ++   .if (. - \since) > (32 * 4)
> ++     .error "Vector exceeds 32 instructions"
> ++   .endif
> ++ .endm
> ++
> ++ .globl bl1_exceptions
> ++
> ++vector_base bl1_exceptions
> ++
> ++vector_entry SynchronousExceptionSP0
> ++ mov x0, #0x0
> ++ bl plat_report_exception
> ++ b SynchronousExceptionSP0
> ++ check_vector_size SynchronousExceptionSP0
> ++
> +--
> +2.7.4
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

