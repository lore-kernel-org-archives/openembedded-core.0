Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5382F60797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 13:26:42 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id z80so1735149qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 06:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HmMsmqVmRcDpuXRu70qFG8kB8vMuCsPeQMy+eSJUV44=;
	b=0NuZd++lX7RX3uQ47FL+HhMbQkQ4s5QkCn6AyRPBq6wdYekVx+W0vkZ0MWwmXkO+nV
	g0PRHUmV3KAjKPZHqaCFcht14rUzsiOYaKUcP0dVIj9uJIpPlhMiC+athTsM2PK24Y7Y
	xIiX5UPl6WnpvhdLtG7KsD6mUG9H87NSa06+XuZBy2jwx+HwOnQ7oOZNp1bgd21QwQ9h
	v1sYAonT7y9eMsz+L/K/qVhuowEYhV0VJjZ4h0QAorZzFZsp8WqK+NKXegXlEfN/VUii
	FQwd8768xRBcxFyiaqrzdZIzr/vmZ98KPO0BqLaZQS69XYvhaUhrYshpDyB5Gv2w4fBX
	0IEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HmMsmqVmRcDpuXRu70qFG8kB8vMuCsPeQMy+eSJUV44=;
	b=AwrtYUhStJHsuSYD8d7xUX9W1PuSnAxg8b9mM1wanatuFEN4ZxCqjX5HwiBRIHjGII
	NfkwjZXvpJW4o1OJq2gkIEB3tSnwaXHIAQU4FjVcQlk6TDdOQT8P0r8SB5YFKW24i3FR
	TZ+5GzdCVzOoOmifnMAdKCJIlyfaZy3tlQw34RuS2TymON3J5U5v8mxxB/VB1+9yFjv9
	wjdVbpbCR8NqUy8VHOVNtdoJoo9I4yN5dOByEicyV3y8pzClF0ZpqyWPKxS3Ps/lXjzI
	5Wy0BcWM9LD/DkplDhAoMaXCR/JvJgLPFBtwIAc610THicCJ9+jSTKyics6TXAmWd0sM
	8Nzg==
X-Gm-Message-State: ALyK8tLO2ge+VOfq/Chdqzrz8vFHj1QCzqQpNLSHGMZonxR9ptX9ZfkvwaKfxUQ4XK2EqzMibP4UGFXDXLUn6A==
X-Received: by 10.233.239.210 with SMTP id d201mr3422494qkg.41.1464096402709; 
	Tue, 24 May 2016 06:26:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Tue, 24 May 2016 06:26:13 -0700 (PDT)
In-Reply-To: <1464095208-5639-1-git-send-email-marex@denx.de>
References: <1464095208-5639-1-git-send-email-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 May 2016 16:26:13 +0300
Message-ID: <CAMKF1spPT0PwwQR6p8Cnaf2ft_r1iBT-t8bYNp8d2GsF0ziUdA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Backport nios2 gcc ICE fix
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
X-List-Received-Date: Tue, 24 May 2016 13:26:43 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 24, 2016 at 4:06 PM, Marek Vasut <marex@denx.de> wrote:
> Backport a patch from mainline gcc 5 branch to fix ICE triggered
> when cross-compiling libdrm for nios2 architecture. The same ICE
> is fixed in gcc6 already.

This is ok

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-5.3.inc              |  1 +
>  .../0061-nios2-Make-assert-less-restrictive.patch  | 35 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
> index 5dd8022..c54fa68 100644
> --- a/meta/recipes-devtools/gcc/gcc-5.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
> @@ -90,6 +90,7 @@ SRC_URI = "\
>             file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
>             file://0059-libgcc-use-ldflags.patch \
>             file://0060-remove-prototypes-cfns.patch \
> +          file://0061-nios2-Make-assert-less-restrictive.patch \
>             file://CVE-2016-4488.patch \
>             file://CVE-2016-4489.patch \
>             file://CVE-2016-2226.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch b/meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch
> new file mode 100644
> index 0000000..6a20694
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch
> @@ -0,0 +1,35 @@
> +From 802c64857074cb7b002d91ce6352139c2353ca06 Mon Sep 17 00:00:00 2001
> +From: cltang <cltang@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Sat, 21 May 2016 08:26:11 +0000
> +Subject: [PATCH] 2016-05-21  Chung-Lin Tang  <cltang@codesourcery.com>
> +
> +       Backport from mainline
> +       2015-06-29  Sandra Loosemore  <sandra@codesourcery.com>
> +
> +       * config/nios2/nios2.c (nios2_delegitimize_address): Make
> +       assert less restrictive.
> +
> +
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@236555 138bc75d-0d04-0410-961f-82ee72b054a4
> +Upstream-Status: Backport (git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@236555 138bc75d-0d04-0410-961f-82ee72b054a4)
> +---
> + gcc/config/nios2/nios2.c | 2 +-
> + 1 files changed, 1 insertions(+), 1 deletion(-)
> +
> +diff --git a/gcc/config/nios2/nios2.c b/gcc/config/nios2/nios2.c
> +index 7b6b389..3b22331 100644
> +--- a/gcc/config/nios2/nios2.c
> ++++ b/gcc/config/nios2/nios2.c
> +@@ -1930,7 +1930,7 @@ nios2_delegitimize_address (rtx x)
> +       case UNSPEC_LOAD_TLS_IE:
> +       case UNSPEC_ADD_TLS_LE:
> +         x = XVECEXP (XEXP (x, 0), 0, 0);
> +-        gcc_assert (GET_CODE (x) == SYMBOL_REF);
> ++        gcc_assert (CONSTANT_P (x));
> +         break;
> +       }
> +     }
> +--
> +2.8.1
> +
> --
> 2.7.0
>

