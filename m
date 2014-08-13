Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7F89A609BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 22:45:28 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id l13so11792053iga.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 15:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=fwBaU4Mlg1sFTM0KVya/6nQWiXhntS7YxFp1eoMlaCc=;
	b=Vi4E3Lckv8DEzskgfMAjx9s95lu86H0dS+KqsTPidP3p6cACo6lOCGOrD/uYHGRK4n
	3pnrungICnq6nUQW4Rk6hviC7Hkjn/wT7p98jL8wg6GOauUtF3WKv54IwEc0wBrm3eip
	9dpRcPYjfc14tlNuR5THTN1IBSq6gwG4pIDmzXwLV8s6wTOl00SPGF1cJ/mGlYGUCdUu
	qzY/+aLiKrfuu1Oj1PeIWaPGO8YqB+oah1Q1Grid9l9ydfF+DcyQGz0fm+N+xAssJmhm
	/4OUNl9b1mu3aOqcd3228bwPyFy2Yr03J256mjzThhSmRkHNXREB4Ttre52ta7PYavRX
	6/Sw==
X-Received: by 10.50.119.105 with SMTP id kt9mr11994663igb.20.1407969929997;
	Wed, 13 Aug 2014 15:45:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.126.103 with HTTP; Wed, 13 Aug 2014 15:44:59 -0700 (PDT)
In-Reply-To: <1407963825-20257-3-git-send-email-pab@pabigot.com>
References: <1407963825-20257-1-git-send-email-pab@pabigot.com>
	<1407963825-20257-3-git-send-email-pab@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Aug 2014 15:44:59 -0700
Message-ID: <CAMKF1soo1HEfuD99aDVpY7Q8PyUgqV4ujtSTRvjeDaGfuRyUCQ@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] gcc-4.8, gcc-4.9: remove inappropriate patch
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
X-List-Received-Date: Wed, 13 Aug 2014 22:45:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 13, 2014 at 2:03 PM, Peter A. Bigot <pab@pabigot.com> wrote:
> 0037-gcc-4.8-PR56797.patch was originally added as an OE backport during
> 4.8.0.  Upstream merged it in 4.8.1, and it was present in 4.9.0.
>
> The original patch still applies to 4.9.1 (and presumably 4.8.2), but
> now is modifying store_multiple_sequence instead of
> load_multiple_sequence (the two functions are nearly identical).  It may
> or may not be necessary in store_multiple_sequence, but absent a bug
> report upstream supporting its application in this case, or a least an
> updated comment and upstream status in the patch, I think this patch
> should be dropped.
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>

This looks good.

> ---
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 -
>  .../gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch         | 66 ----------------------
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 -
>  .../gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch         | 66 ----------------------
>  4 files changed, 134 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch
>  delete mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
> index 80a3fc4..dbe1ba6 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -59,7 +59,6 @@ SRC_URI = "\
>      file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
>      file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
>      file://0035-wcast-qual-PR-55383.patch \
> -    file://0037-gcc-4.8-PR56797.patch \
>      file://0038-gcc-4.8-build-args.patch \
>      file://0039-gcc-4.8-PR57717.patch \
>      file://0040-fix-g++-sysroot.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch b/meta/recipes-devtools/gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch
> deleted file mode 100644
> index b5d7b86..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.8/0037-gcc-4.8-PR56797.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -From patchwork Fri Apr 19 09:34:49 2013
> -Content-Type: text/plain; charset="utf-8"
> -MIME-Version: 1.0
> -Content-Transfer-Encoding: 7bit
> -Subject: [ARM] Fix PR56797
> -Date: Thu, 18 Apr 2013 23:34:49 -0000
> -From: Greta Yorsh <Greta.Yorsh@arm.com>
> -X-Patchwork-Id: 237891
> -Message-Id: <000801ce3ce1$23fbdd60$6bf39820$@yorsh@arm.com>
> -To: "GCC Patches" <gcc-patches@gcc.gnu.org>
> -Cc: <raj.khem@gmail.com>, "Richard Earnshaw" <Richard.Earnshaw@arm.com>,
> - "Ramana Radhakrishnan" <Ramana.Radhakrishnan@arm.com>
> -
> -Fix PR56797
> -http://gcc.gnu.org/bugzilla/show_bug.cgi?id=56797
> -
> -The problem is that peephole optimizer thinks it can generate an ldm, but
> -the pattern for ldm no longer matches, because after r188738 it requires
> -that if one of the destination registers is SP then the base register must
> -be SP, and it's not SP in the test case.
> -
> -The test case fails on armv5t but doesn't fail on armv6t2 or armv7-a because
> -peephole doesn't trigger there (because there is a different epilogue
> -sequence). It looks like a latent problem for other architecture or CPUs.
> -
> -This patch adds this condition to the peephole optimizer.
> -
> -No regression on qemu for arm-none-eabi and fixes the test reported in the
> -PR. I couldn't minimize the test sufficiently to include it in the
> -testsuite.
> -
> -Ok for trunk?
> -
> -Thanks,
> -Greta
> -
> -gcc/
> -
> -2013-04-18  Greta Yorsh  <Greta.Yorsh@arm.com>
> -
> -       PR target/56797
> -       * config/arm/arm.c (load_multiple_sequence): Require SP
> -        as base register for loads if SP is in the register list.
> -
> -
> -diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
> -index d00849c..60fef78 100644
> ---- a/gcc/config/arm/arm.c
> -+++ b/gcc/config/arm/arm.c
> -@@ -10347,6 +10347,13 @@ load_multiple_sequence (rtx *operands, int nops, int *regs, int *saved_order,
> -             || (i != nops - 1 && unsorted_regs[i] == base_reg))
> -           return 0;
> -
> -+          /* Don't allow SP to be loaded unless it is also the base
> -+             register.  It guarantees that SP is reset correctly when
> -+             an LDM instruction is interruptted.  Otherwise, we might
> -+             end up with a corrupt stack.  */
> -+          if (unsorted_regs[i] == SP_REGNUM && base_reg != SP_REGNUM)
> -+            return 0;
> -+
> -         unsorted_offsets[i] = INTVAL (offset);
> -         if (i == 0 || unsorted_offsets[i] < unsorted_offsets[order[0]])
> -           order[0] = i;
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 5a1c028..01dfde1 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -58,7 +58,6 @@ SRC_URI = "\
>      file://0032-libtool.patch \
>      file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
>      file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
> -    file://0037-gcc-4.8-PR56797.patch \
>      file://0040-fix-g++-sysroot.patch \
>      file://0041-libtool-avoid-libdir.patch \
>      file://0043-cpp.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch b/meta/recipes-devtools/gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch
> deleted file mode 100644
> index b5d7b86..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0037-gcc-4.8-PR56797.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -From patchwork Fri Apr 19 09:34:49 2013
> -Content-Type: text/plain; charset="utf-8"
> -MIME-Version: 1.0
> -Content-Transfer-Encoding: 7bit
> -Subject: [ARM] Fix PR56797
> -Date: Thu, 18 Apr 2013 23:34:49 -0000
> -From: Greta Yorsh <Greta.Yorsh@arm.com>
> -X-Patchwork-Id: 237891
> -Message-Id: <000801ce3ce1$23fbdd60$6bf39820$@yorsh@arm.com>
> -To: "GCC Patches" <gcc-patches@gcc.gnu.org>
> -Cc: <raj.khem@gmail.com>, "Richard Earnshaw" <Richard.Earnshaw@arm.com>,
> - "Ramana Radhakrishnan" <Ramana.Radhakrishnan@arm.com>
> -
> -Fix PR56797
> -http://gcc.gnu.org/bugzilla/show_bug.cgi?id=56797
> -
> -The problem is that peephole optimizer thinks it can generate an ldm, but
> -the pattern for ldm no longer matches, because after r188738 it requires
> -that if one of the destination registers is SP then the base register must
> -be SP, and it's not SP in the test case.
> -
> -The test case fails on armv5t but doesn't fail on armv6t2 or armv7-a because
> -peephole doesn't trigger there (because there is a different epilogue
> -sequence). It looks like a latent problem for other architecture or CPUs.
> -
> -This patch adds this condition to the peephole optimizer.
> -
> -No regression on qemu for arm-none-eabi and fixes the test reported in the
> -PR. I couldn't minimize the test sufficiently to include it in the
> -testsuite.
> -
> -Ok for trunk?
> -
> -Thanks,
> -Greta
> -
> -gcc/
> -
> -2013-04-18  Greta Yorsh  <Greta.Yorsh@arm.com>
> -
> -       PR target/56797
> -       * config/arm/arm.c (load_multiple_sequence): Require SP
> -        as base register for loads if SP is in the register list.
> -
> -
> -diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
> -index d00849c..60fef78 100644
> ---- a/gcc/config/arm/arm.c
> -+++ b/gcc/config/arm/arm.c
> -@@ -10347,6 +10347,13 @@ load_multiple_sequence (rtx *operands, int nops, int *regs, int *saved_order,
> -             || (i != nops - 1 && unsorted_regs[i] == base_reg))
> -           return 0;
> -
> -+          /* Don't allow SP to be loaded unless it is also the base
> -+             register.  It guarantees that SP is reset correctly when
> -+             an LDM instruction is interruptted.  Otherwise, we might
> -+             end up with a corrupt stack.  */
> -+          if (unsorted_regs[i] == SP_REGNUM && base_reg != SP_REGNUM)
> -+            return 0;
> -+
> -         unsorted_offsets[i] = INTVAL (offset);
> -         if (i == 0 || unsorted_offsets[i] < unsorted_offsets[order[0]])
> -           order[0] = i;
> --
> 1.8.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

