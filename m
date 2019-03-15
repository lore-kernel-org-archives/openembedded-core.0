Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7437C724
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 18:24:23 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id x13so8763287ljj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 11:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qk+/KqvzFnxNsvU3WgR/l1TUXiSHfZok+GCQ411alQg=;
	b=nQVUt50dtnrwYBFj0xDlIn7pJoWrtu8YhFXZF66X4Z5f+cf/m+BBtoUUnYAPLE36a/
	WAS/G0kJxJOHHuQtANkyx89+uiaioqeaevbT7sXK+EB/tfXs8Ti5D/A8Xgy+YjpoZ4m7
	D3ob+hPc5CucPyj009jBrNauFlvIcmGnZCwsme/jx1Gt5pYdpj2S/VZi/6OI9kzNeBst
	A/DjGL35ix9rcRI7Pz7F1k2fOXbjIt44y4KmvXyRClMmtD9I72mZAlHwzraylQMJviBI
	cr1TuU0uwbmUregzbEnwbU+FpDqWUVIEADLP+OHxmnuPs71N5zTQ2tFZnL8XXhqcgemB
	fhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qk+/KqvzFnxNsvU3WgR/l1TUXiSHfZok+GCQ411alQg=;
	b=YEG3+04h3be1jHeqwmr0ILBpmwVMYo5+7Ndmqemox2dv1CzMNihgAPRs1ZnjdTAs+c
	I6LVRs3Er22PLzNgQ1HcbQdEVe1DmlkfbpydUGekjU9IUrOy+nd5xh+ZDLgFgSRnLgu7
	4q8L9MjsZ3ZOdq8PijQbVFMQD0UMsSPKycvNy11aQe5QLtDYU9D7h6wT4FZJYzQyrFPb
	fNg3eR3oxDulvLetJY6Otvh2FXD9AHBDsdCO+9qDV8Y0Or+rsoIr3KLrN1mx40sYP4fU
	hvq4u84e5T4Qkw3wukzdCGQlqHXUyV8nScWHl/QhuYKVZXMKA+zhBdxFVuPqit/w/YV8
	xrxg==
X-Gm-Message-State: APjAAAVMsa4J+vFbVdsi1mLOKDxkKvCCsgdHBb9FF3eSoQhnRsO04D2n
	yEWB3CVly756+z+ccAMs4IvFMJ6lmD49B2qfLkY=
X-Google-Smtp-Source: APXvYqw22MansoivRKUQ9FFPpTiZQcjNNusUxBZ1of6zRyGWexjvQtJLMFKFbHvQ5w1ZmJT0ACcnvHlgr3eDytL9W0U=
X-Received: by 2002:a2e:86d2:: with SMTP id n18mr2915396ljj.128.1552674264499; 
	Fri, 15 Mar 2019 11:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190315062903.1431-1-raj.khem@gmail.com>
In-Reply-To: <20190315062903.1431-1-raj.khem@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Mar 2019 11:23:13 -0700
Message-ID: <CAKmqyKNqP3GUaek46J5eisZ-fup-M9JAeLQNeb7+z5DiQfkhnA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cross-canadian.bbclass: Do not override LIBCOVERRIDE with SDK libc override
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
X-List-Received-Date: Fri, 15 Mar 2019 18:24:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 14, 2019 at 11:29 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> cross-canadian tools are supposed to generate code for target and if we
> override the libc override then needed overrides do not get applied when
> building gcc cross canadian e.g. for baremetal, which causes build
> failures during compile
>
> e.g. https://github.com/riscv/meta-riscv/issues/117
>
> Not override libc override helps us fix this issue
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/classes/cross-canadian.bbclass | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
> index f5c9f61595..ee53faad79 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -9,7 +9,6 @@
>  # or indirectly via dependency.  No need to be in 'world'.
>  EXCLUDE_FROM_WORLD = "1"
>  NATIVESDKLIBC ?= "libc-glibc"
> -LIBCOVERRIDE = ":${NATIVESDKLIBC}"
>  CLASSOVERRIDE = "class-cross-canadian"
>  STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
>
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

