Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0409878D2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 11:29:47 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id i12-v6so20573704oik.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 04:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EU145ptVzHrmaDyvhbChHb4N7waf9ZXAg3PIYKLMulI=;
	b=SQKxIg6qwA0t6PW314Jhq2ll6ceS7AtIEfit8EkXdYYunccz2juSuOMcoX+CEKUMLV
	iyKjvRj8KnxMd27pGOK/SSlDYq9/qbk9x/dQYVv8vRE1I5XAnGTNAo4gVpa4t+KjtsMS
	gIUj5RVFfZtvW/zraf1tc68nDM68OeyYwIKL0vyUEAvX2HU1YOn7t0w3Iw71rjIO1MNp
	aMifDtxW1fWwWDT95kWwHy+CveJj8SKyadP+c7O545ICUOl+rxsfLELVaCHNVPJeQZrw
	XLuOKfobGmJvzoVOUKMMJYqH6VpHCCB1B52GLdbwcueKvtIwfAgcAih6kT18rqHqwM+w
	t91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EU145ptVzHrmaDyvhbChHb4N7waf9ZXAg3PIYKLMulI=;
	b=LfEwgxjzBStkWrQXDL7pGT8QigKnBGctFQ6oMMGjKlvGYs6e+35iyR4DqSAimKPreX
	PCX1YAc9RK7VGvkOql6zeYqqXpZB2oreeuL/Jxxyr7bu8NYWTaw4fjSw00NC8V6yRq3I
	tF1oIHzTS3ZjoFtHldTYHSSKm/SpLQaOiWj0IfRfsTEpMqMA0i+kBg0p1b4rYsZKWtJ7
	BGZNbsuvisQe5UTIjZgK3cAC3tdPPNuHf6/jXxPnnL+tJzIM/BU3RSNX5r7iDprCayNW
	gC6EmyTp1dZz6A2hx25l0Fw7YNUs16uY2cnSjHUYuTUB3QYejQmwF30I3X2dn5s/alJN
	qJNQ==
X-Gm-Message-State: AOUpUlHvxGZapZu6noJVSMRY5oGe8/FnpTu+FUN2KvSdFi2llBWIi3xk
	bhV3lCKhEdGKnVsNg3lL+A7PfTQBA3tMCJYvFdNG1g==
X-Google-Smtp-Source: AAOMgpcGcmi6CQ1iB/a23jQ4ogGT/Nogfd0/WCRRhRJ3tEA49SACwkAT02DxnqfCPRMQE9calTl0kI7YbPRQNgE6GWk=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr17919798oib.320.1532950188870; 
	Mon, 30 Jul 2018 04:29:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 04:29:28
	-0700 (PDT)
In-Reply-To: <1532937321-4077-1-git-send-email-christopher.w.clark@gmail.com>
References: <1532937321-4077-1-git-send-email-christopher.w.clark@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 30 Jul 2018 12:29:28 +0100
Message-ID: <CAJTo0LbCA4OfxodE0ac60VHYwHm8fCRgQqWjJmQ_svVjeHc-dA@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] binutils : enable x86_64-pep for producing EFI binaries on x86-64
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
X-List-Received-Date: Mon, 30 Jul 2018 11:29:48 -0000
Content-Type: text/plain; charset="UTF-8"

Is just passing --enable-targets=all not an option?

Ross

On 30 July 2018 at 08:55, Christopher Clark
<christopher.w.clark@gmail.com> wrote:
> Add x86_64-pep emulation support to the set enabled for x86_64 targets
> to enable the linker to produce Portable Executables for EFI binaries.
>
> Enables building the x86-64 EFI variant of the Xen hypervisor for
> the OpenXT Project.
>
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
> Changes in v6: added required "Upstream-Status" field to patch header.
>
> Changes in v5: Apply a patch to extend the set of emulations for x86-64,
> instead of supplying the "enable-targets" flag via the recipe.
>
> Reasoning: this looks like the least invasive way to add the needed emulation
> only when required. It will add the extra support to any builds that have
> x86-64 target enabled and not modify others.
>
> binutils uses autoconf and the AC_ARG_ENABLE macro for handling the
> "--enable-targets" option to the generated configure script. It doesn't allow
> for repeating the parameter with additional arguments to extend the list:
> it's a one-shot flag. That seems to be standard practice for autoconf.
>
> binutils source contains config files that map from the target identifiers
> to lists of emulations to enable. This patch extends some of those lists.
>
> Tested with x86-64 build to produce Xen EFI.
>
>  meta/recipes-devtools/binutils/binutils-2.31.inc   |  1 +
>  .../0016-add-i386pep-emulation-for-x86_64.patch    | 41 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
> index ec9e9c3..02d5bca 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.31.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
> @@ -35,6 +35,7 @@ SRC_URI = "\
>       file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
>       file://0014-Detect-64-bit-MIPS-targets.patch \
>       file://0015-sync-with-OE-libtool-changes.patch \
> +     file://0016-add-i386pep-emulation-for-x86_64.patch \
>  "
>  S  = "${WORKDIR}/git"
>
> diff --git a/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch b/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch
> new file mode 100644
> index 0000000..9f20784
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0016-add-i386pep-emulation-for-x86_64.patch
> @@ -0,0 +1,41 @@
> +binutils : enable x86_64-pep for producing EFI binaries on x86-64
> +
> +Add x86_64-pep emulation support to the set enabled for x86_64 targets
> +to enable the linker to produce Portable Executables for EFI binaries.
> +
> +Enables building the x86-64 EFI variant of the Xen hypervisor for
> +the OpenXT Project.
> +
> +Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> +
> +Upstream-Status: Inappropriate [OE configuration specific]
> +---
> +diff --git a/bfd/config.bfd b/bfd/config.bfd
> +index c882421..dc705b6 100644
> +--- a/bfd/config.bfd
> ++++ b/bfd/config.bfd
> +@@ -688,7 +688,7 @@ case "${targ}" in
> +     ;;
> +   x86_64-*-linux-*)
> +     targ_defvec=x86_64_elf64_vec
> +-    targ_selvecs="i386_elf32_vec iamcu_elf32_vec x86_64_elf32_vec i386_pei_vec x86_64_pei_vec l1om_elf64_vec k1om_elf64_vec"
> ++    targ_selvecs="i386_elf32_vec iamcu_elf32_vec x86_64_elf32_vec i386_pei_vec x86_64_pei_vec l1om_elf64_vec k1om_elf64_vec x86_64_pe_vec x86_64_pe_be_vec i386_pe_vec"
> +     want64=true
> +     ;;
> +   x86_64-*-nacl*)
> +diff --git a/ld/configure.tgt b/ld/configure.tgt
> +index a1db7ad..65a984a 100644
> +--- a/ld/configure.tgt
> ++++ b/ld/configure.tgt
> +@@ -253,8 +253,9 @@ x86_64-*-linux-gnux32)     targ_emul=elf32_x86_64
> +                       tdir_elf_iamcu=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'`
> +                       tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/' -e 's/-linux-gnux32/-linux-gnu/'` ;;
> + x86_64-*-linux-*)     targ_emul=elf_x86_64
> +-                      targ_extra_emuls="elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om"
> +-                      targ_extra_libpath="elf_i386 elf32_x86_64 elf_l1om elf_k1om"
> ++                      targ_extra_emuls="elf32_x86_64 elf_i386 elf_iamcu elf_l1om elf_k1om i386pe i386pep"
> ++                      targ_extra_libpath="elf_i386 elf32_x86_64 elf_l1om elf_k1om i386pep"
> ++                      targ_extra_ofiles="deffilep.o pep-dll.o pe-dll.o"
> +                       tdir_elf_i386=`echo ${targ_alias} | sed -e 's/x86_64/i386/'` ;;
> + i[3-7]86-*-redox*)    targ_emul=elf_i386
> +                       targ_extra_emuls=elf_x86_64 ;;
> --
> 2.7.4
>

