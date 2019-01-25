Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF337C2C9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 11:47:42 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id m62so10030356ith.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 03:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V5SzHXZe4eryy82ox2xcZ6ShlqkX3JvgLNpaqmFlgs8=;
	b=RAJN8/6EiKJgDqjddJpKOI1+HAR81ScFKXJmiH1R9OU9TbxjnithAqtmQKSzvIyY+V
	3LIUl8bimlMDW6tVjbbg/xeXlZ8n4rsSsZ/0r8ryOXm6Az9q1ilmDN1/PFzoGoObAaAB
	vQi2Rxv6EKX7uif90d4+3GYiZUfhtlR9z7pKuVg0rl+VP1pHijF2d++iYYYwsIMKddhH
	nSefaVlQYW9JMb/Fs+pqlp23z5YMUMRw0YJLx45bZDQLFJCcL6ttD2f4tyBSFAPJK28W
	UnJN9cSG/AidUDkdkSNSeOdv3MDFk0sJHW58xFRGUJc/FFvSjI3T4J7UoLWu47r/uANc
	rK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V5SzHXZe4eryy82ox2xcZ6ShlqkX3JvgLNpaqmFlgs8=;
	b=gmvS+R6VhHXol8lLrSwkQkPvuyQOUGk04kzgSTnTfkdVxXC4KXTsR1a+HEbkkzBz8t
	ES2ii9u0afKh/7ZMRahUP5FvGsN/xJyUecg2MUfYgMWjT0qoXP51fjJ+LRXyJU+RSTY7
	gxy/rKdCKuqpfeJrzBjE5LzAG1xmMkhKqh8KQL3wGWd3lZgwsNJ63myb47QDaU5JO2xJ
	KGvszI75nexuzm7hMvOarYCQ9BPETzRUA1PfcHat4vz5ick03u6NUAwRK4OlgWELWGu/
	jN/b6vNXQXDzeWD1dWn0CqRoqgFR5Puakv0bUGuUj2oesFICPOZrXQSDesZRM9L/yzdD
	hVNA==
X-Gm-Message-State: AJcUukcw6gSenLJuUPBMeHbrj7GAxwGZT/sH5llIV7p7I/KJPTGVbSMA
	I50Ofl0raQ7h2GcfRqNbhSI8m0kkBgRma2OEyK1YKA==
X-Google-Smtp-Source: ALg8bN4noOcDoJPuuJc5YVE5ztVJpe7PtJpzoug4kD0yPna3wQSN9FZuBk436JO/OInjpoHTS30dFj2DXVnxU0YKFaA=
X-Received: by 2002:a02:1bc5:: with SMTP id 66mr7143246jas.105.1548416863229; 
	Fri, 25 Jan 2019 03:47:43 -0800 (PST)
MIME-Version: 1.0
References: <1548317569-25007-1-git-send-email-chunrong.guo@nxp.com>
In-Reply-To: <1548317569-25007-1-git-send-email-chunrong.guo@nxp.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jan 2019 11:47:32 +0000
Message-ID: <CAJTo0LZ5M4sZvHfc-Wv_dt55vOe04yVzRaQKiFk3K-K6sZB4uw@mail.gmail.com>
To: "C.r. Guo" <chunrong.guo@nxp.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mozjs: add aarch64 be support
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
X-List-Received-Date: Fri, 25 Jan 2019 11:47:42 -0000
Content-Type: text/plain; charset="UTF-8"

How is this not appropriate for upstream?

Ross

On Fri, 25 Jan 2019 at 11:40, C.r. Guo <chunrong.guo@nxp.com> wrote:
>
> From: Chunrong Guo <chunrong.guo@nxp.com>
>
> Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
> ---
>  .../mozjs/mozjs/0001-add-aarch64-be-support.patch  | 28 ++++++++++++++++++++++
>  meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb     |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-add-aarch64-be-support.patch
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-add-aarch64-be-support.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-add-aarch64-be-support.patch
> new file mode 100644
> index 0000000..05ab2c1
> --- /dev/null
> +++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-add-aarch64-be-support.patch
> @@ -0,0 +1,28 @@
> +From 52ab270c9ff1e3b0d5ce2fd59a268afd6e9cc0c8 Mon Sep 17 00:00:00 2001
> +From: BJ DevOps Team <bjdevops@NXP1.onmicrosoft.com>
> +Date: Tue, 16 Oct 2018 16:53:18 +0800
> +Subject: [PATCH] add aarch64 be support
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +---
> + build/moz.configure/init.configure | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
> +index 56e6730..139b5fa 100644
> +--- a/build/moz.configure/init.configure
> ++++ b/build/moz.configure/init.configure
> +@@ -359,6 +359,9 @@ def split_triplet(triplet):
> +     elif cpu in ('mips64', 'mips64el'):
> +         canonical_cpu = 'mips64'
> +         endianness = 'little' if 'el' in cpu else 'big'
> ++    elif cpu in ('aarch64_be'):
> ++        canonical_cpu = 'aarch64'
> ++        endianness = 'big'
> +     elif cpu.startswith('aarch64'):
> +         canonical_cpu = 'aarch64'
> +         endianness = 'little'
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
> index a28ecc5..e39c929 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs_52.9.1.bb
> @@ -15,6 +15,7 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.9.1.o
>             file://add-riscv-support.patch \
>             file://0001-mozjs-fix-coredump-caused-by-getenv.patch \
>             file://format-overflow.patch \
> +           file://0001-add-aarch64-be-support.patch \
>             "
>  SRC_URI_append_libc-musl = " \
>             file://0006-support-musl.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

