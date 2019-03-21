Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5A85E7CF3D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 13:41:19 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id z13so16284694qki.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VwbVjF5Yd8ODWrr3xJ/+ybiH+BU8qb+/kwVAuF8b6NU=;
	b=AZVaTtNMCBGvUTMQZmVcm62KhGY5x+ztU7EBIpMhYwGhIRbsyMEN2YFaC05aKFIbzm
	nbKwd2tipHnHP1OaK9TaBEdg7N2hM9v3rF28JyXtE263HkSgyaqWcKaORH6l3TE+vU+P
	bCSddJz7e69yk9GFrnwFejdaF5n6XfuronOe9IQAqLcu/lLiRXlSuqL4xygTxYwukrhi
	Iy/5DfuS2DxCeK76iQMzyibxlpN0Xhr5Ix0GuqCI8kUYOLHjaDpkaex+Gqd67AAEsIE5
	vVC+of+MITjLYjIJQQP9rD/wMzVTwLPS8qUyqBzDjv3DjOKgdXt1AoZwvfQtAMTk7w2o
	/nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VwbVjF5Yd8ODWrr3xJ/+ybiH+BU8qb+/kwVAuF8b6NU=;
	b=sxR84IcmjQCMkl3Odsjz+IVNQnfAJIC5ILEVzIpk/BCvX7ptfMmIwBxtaA2zubDrix
	EmVVxN9Zfk4Wn5vZQoADe36VNz5PDduboXe+poTEZt33z/9KMrOdwMYZGJJhR0A84dT+
	1UR093BYLQMZQvYRv27jyvqsyTShB+WfKynuPfYc+bRGe5SPvpDJS3/qF6c5JhYFNoLI
	3gNnFgr3r1OctDkvHVb8sQl4c7WqiSDoKDilgvxjo48oyP9yyx/DluS/GPZYNWNSh9Pr
	ZBmaQjsSp6SCiLJCJH0zb4wg15z2y7MALXIDpS7iqZRb3w3X7qJTOECY7Uv5fCZDTF62
	N8Ow==
X-Gm-Message-State: APjAAAXdlwhXZreyYrmfxLMNyHw8fibVYKX8RKXlZ7quNx7JDbKizOZe
	5xPsps/ETjs4BkhDrY2IrynaTCTw6cwJT1YgeYk=
X-Google-Smtp-Source: APXvYqx+4nmkI75UiOJnRZpAWpDcb5ULJFub+ZOwlCA5YYbw2w0WuLWx3oZ694779dbo9AhK4R7MBVFMPKx8Ro613aI=
X-Received: by 2002:a37:451:: with SMTP id 78mr2769043qke.315.1553175679860;
	Thu, 21 Mar 2019 06:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190321123112.3075-1-ross.burton@intel.com>
In-Reply-To: <20190321123112.3075-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Mar 2019 06:40:53 -0700
Message-ID: <CAMKF1srUfoLwqdNvB1owDxrVk=C9hv8h4=M0yexbSkH3v3OxTA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix CVE-2019-9169
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
X-List-Received-Date: Thu, 21 Mar 2019 13:41:19 -0000
Content-Type: text/plain; charset="UTF-8"

LGTM

On Thu, Mar 21, 2019 at 5:31 AM Ross Burton <ross.burton@intel.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/glibc/glibc/CVE-2019-9169.patch | 36 +++++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.29.bb             |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
> new file mode 100644
> index 00000000000..bc40361c5d7
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
> @@ -0,0 +1,36 @@
> +CVE: CVE-2019-9169
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From 583dd860d5b833037175247230a328f0050dbfe9 Mon Sep 17 00:00:00 2001
> +From: Paul Eggert <eggert@cs.ucla.edu>
> +Date: Mon, 21 Jan 2019 11:08:13 -0800
> +Subject: [PATCH] regex: fix read overrun [BZ #24114]
> +
> +Problem found by AddressSanitizer, reported by Hongxu Chen in:
> +https://debbugs.gnu.org/34140
> +* posix/regexec.c (proceed_next_node):
> +Do not read past end of input buffer.
> +---
> + posix/regexec.c |  6 ++++--
> + 2 files changed, 13 insertions(+), 3 deletions(-)
> +
> +diff --git a/posix/regexec.c b/posix/regexec.c
> +index 91d5a79..084b122 100644
> +--- a/posix/regexec.c
> ++++ b/posix/regexec.c
> +@@ -1293,8 +1293,10 @@ proceed_next_node (const re_match_context_t *mctx, Idx nregs, regmatch_t *regs,
> +             else if (naccepted)
> +               {
> +                 char *buf = (char *) re_string_get_buffer (&mctx->input);
> +-                if (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
> +-                            naccepted) != 0)
> ++                if (mctx->input.valid_len - *pidx < naccepted
> ++                    || (memcmp (buf + regs[subexp_idx].rm_so, buf + *pidx,
> ++                                naccepted)
> ++                        != 0))
> +                   return -1;
> +               }
> +           }
> +--
> +2.9.3
> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb b/meta/recipes-core/glibc/glibc_2.29.bb
> index db856c70adb..9184c5932cc 100644
> --- a/meta/recipes-core/glibc/glibc_2.29.bb
> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> @@ -55,6 +55,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0029-inject-file-assembly-directives.patch \
>             file://0030-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch \
>             file://0001-x86-64-memcmp-Use-unsigned-Jcc-instructions-on-size-.patch \
> +           file://CVE-2019-9169.patch \
>  "
>
>  S = "${WORKDIR}/git"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

