Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id C447C6C4CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Dec 2018 14:24:08 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id r200so13709477iod.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 06:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=00+WNj9N+1WlKNnQ+LE0dchgLrNjg73oSH8Z7HhDUHg=;
	b=zHkmsV2ScxEgmxOYRiwSX8SukgIAtugfqqWChAFsxn9E/YuwH4/uflS5iWqA0CjZ5t
	BC+RnBoFwEVa2HkC0aptQ9evqPgxp49qI6kzKZv1mVWIchxw2J4/ja6iaHT9Yn+zuJnV
	WigDCtd5VgN/27JNaFSq4ANXumIog/S60usf7K0xingtBdCo+vFI9fIGt70V/FmVfAGY
	QnV2Tbl693T4MI7CwVCgk4Uz8/VP8p3EVTlcKPrWQeAT85BKsyo4g6G1pUsCBqcBNbuQ
	bYjG65GP9kGvzX/Uy1zjxtiAehZvUKfHiUnX7NCy8eDpWy2CRve5i1L15LScAwPjeLtQ
	NwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=00+WNj9N+1WlKNnQ+LE0dchgLrNjg73oSH8Z7HhDUHg=;
	b=gX78+yf9ftPWR1cVKFHLlOKwtFd1rz2s3mUFRH0XU3URdSBACETedpVC8rXzarHws7
	fG/kF3PBearieVAudngkY/qePyHxpczTpNDIpR8Yfszu3JA+iVG9gUyyliqKGIuln33b
	ea7VCK9qXYW/dLu51rfrkbz/S6WjvtSCuYOzFEy3/HT0yzOlGPKRN6u3octqI2gfyUZR
	tGq4dB/XTf6YHntVmnKSmxxzEfrOy59V+xCIYUMJQGOaH0Sa5ojnbXlYoULl+CUXFuc1
	ZP6Sx7Uu2oGNzcMPm7anAZeA/T24p/iiCKWMOpYrMWJz5nf376enfX47Fi1+lx5an7mY
	bRww==
X-Gm-Message-State: AA+aEWbof7itNL/zE1VBwLAgDR/Pq2j3GocQP5oEF+tuD7oTgFJoZaNH
	cAMoDuQh8XK6nWhbPkF0Cxn/mo8iuFB9ywmRCiIoMQ==
X-Google-Smtp-Source: AFSGD/XpMXq7QSRRmljC0RpDb40MMPIU7j1eJKR2VY6cZrooSc0oUmGuLho2q/0A2PCTW4J8oLyrSBmpxJf1hNFYWUU=
X-Received: by 2002:a6b:b844:: with SMTP id i65mr16861248iof.20.1543933449586; 
	Tue, 04 Dec 2018 06:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20181204134233.12495-1-anders.roxell@linaro.org>
In-Reply-To: <20181204134233.12495-1-anders.roxell@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2018 14:23:58 +0000
Message-ID: <CAJTo0La5UGW2OVTX_6mcLZL0PuZ4w4jLg3fse6hL-3HihtOGpQ@mail.gmail.com>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: add coreutils-native to the DEPENDS list
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
X-List-Received-Date: Tue, 04 Dec 2018 14:24:09 -0000
Content-Type: text/plain; charset="UTF-8"

Can't we just add this to HOSTTOOLS instead?
On Tue, 4 Dec 2018 at 13:43, Anders Roxell <anders.roxell@linaro.org> wrote:
>
> In newer kernels fold gets used, see output from a build:
>
> .../kernel-source/scripts/atomic/atomic-tbl.sh:
>    line 183: fold: command not found
>
> Rework so that coreutils-native is in the DEPENDS list.
>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 880c5ef17283..8d83ca4843e3 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -4,7 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
>  KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
>
>  PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native coreutils-native"
>  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>
>  do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
> --
> 2.19.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

