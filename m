Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0380A79C9D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 13:29:44 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id n12so26316738qkh.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 05:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j8dbeH5CM2zJjMw+nluGfYeDIBLACUcGZuDecFCi7Xw=;
	b=O0jFaKedAGzNVpUkgpHUqP7rfgSBsUbcKk/yjOdbAX4XCV8L08kED7J432Ilctww41
	kAiEC82wYvNwwibGXNmtM+8bZX83svnidhg0oSz9l+kn0l7TjuriID2XTKOOjtHQNBVw
	2bfQsvdS3AX7Zr2pUPCjyO8FX8SF3L8n1nYOIpjxO+0m2h8axGumwmtpM2J3L2XjGj7d
	n49/mpEocWQb+/Vq+9tSiBda2XIqDbBmB+EgU758+LWY1VmIdgezgj5IO/NZsxkoGaI7
	KG9H+Q36/AlRsPrbXephiz1I6pac+tbZnf4DyPzOuw4CQ2O0o32fdv+PSluJzrGR6SJ3
	h0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j8dbeH5CM2zJjMw+nluGfYeDIBLACUcGZuDecFCi7Xw=;
	b=NetzhmPb2L4+eGfpznKeSAEDMi+OW8xAM+EOd/uJh1Zv8RnArJ4WDvzMjD16KON0Ec
	/ZbPrvNeKuPIfE5CiqfUjSHnYRWZ5RQkktAprINa7OsfUzgZX8tRz17eC/P1oWx1Qtzf
	YdwOidSoHLMDLDLp2YkIYbDcLHZxNHxLUANVEtIwbIRsazWvl7/iz9gPpPunevpfWEg/
	nzBrXNZf4vDUZHC6okkqaEkADUVKTlb2rZDwLnr2z3ZAp5rdoPvGNtxzYDkGJMtyBlMN
	fTk+x9hCi8zDWrX1bz1B9gLAkbNw61QiMYox6Coc+afnyVr8+uXrPq22YBcsyh7iz5iE
	aX8g==
X-Gm-Message-State: AGRZ1gJbZjO+URcRpeLeZG6R95DaP/5H6MXrBnau121Xc2Bi/950m1jt
	HokFAF5VOjhMwMvmFaUi91ffB/YvmEJgO9Rl8CCRlc0i
X-Google-Smtp-Source: AJdET5eVdgPqsv96zwKvHnqrFcO6Ksp0f61RM9Ygfftrv5WfE96yvc8JitIzFo8fuSEXTBKeAhpD2QZ7eSsHEN5KpnY=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr4224442qkm.102.1541683785591; 
	Thu, 08 Nov 2018 05:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20181108084312.9306-1-nathan@nathanrossi.com>
In-Reply-To: <20181108084312.9306-1-nathan@nathanrossi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Nov 2018 05:29:19 -0800
Message-ID: <CAMKF1spLq0bORBG-0p32o3mKV4tqOd0hUjueCoMFcq3VkJMtcQ@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ghostscript: Define COMPATIBLE_HOST with supported platforms
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
X-List-Received-Date: Thu, 08 Nov 2018 13:29:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 8, 2018 at 12:43 AM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> Setup the COMPATIBLE_HOST variable with all supported hosts based on the
> provided objarch.h files. This inverts the existing pattern where
> unsupported hosts (e.g. 'arc.*') are explicitly set.
>
> This suppresses the warning message generated on hosts that are not
> supported but were not listed explicitly.
>
>   WARNING: .../ghostscript_9.25.bb: Unable to get checksum for
>   ghostscript SRC_URI entry objarch.h: file could not be found
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
> Changes in v2:
>   - Fix up to use HOST_SYS patterns instead of OVERRIDES
>   - Make i586/i686 pattern common as done in other recipes
> ---
>  meta/recipes-extended/ghostscript/ghostscript_9.25.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> index 35eaaeb2fa..93134dfb9d 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.25.bb
> @@ -121,5 +121,4 @@ do_install_class-native () {
>
>  BBCLASSEXTEND = "native"
>
> -# ghostscript does not supports "arc"
> -COMPATIBLE_HOST = "^(?!arc).*"
> +COMPATIBLE_HOST = "(aarch64|arm|i.86|microblaze|mips|nios2|powerpc|x86_64).*"

this ignores riscv now. since you wsnt to
ignore for just one arch you can use

COMPATIBLE_HOST_arc = "(none)"

or somesuch mechanism.

> ---
> 2.19.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

