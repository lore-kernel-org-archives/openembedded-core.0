Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id C989878275
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 16:35:34 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u191so2884774pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 09:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nFB3RKPiIguAqkya86ktyc7NYJFo+MKlM3ikSOHoOts=;
	b=PceHG7ghvY3qER93q48MFvRi1PuUeSF9xKCt77VSR43eohTnUrKm+yX+hAs4RpCMXC
	LF6vrPFGKhcRL86PP49Q383WA5hkEFL0eUJFniOUVuPWkUtLBzXAWFghqadx3yoMJXsd
	JjHtYspHnP4q28MKw3/HlquLn4UY6Q6/QkiMwCGc9er9RrCUBu0hXrVEhzhBRPQu1uog
	Hee6UN4VDXlgoPg+zRWUtQXlPX11O1mA44mFfKKyfB7uOorRJa2ELIWcYTBklgviWv5C
	s9p4aORTQ/ghC1BKuJP5gMy2c3vWA39OkwMBp6UxMk96T24AZxOAfUJEfqBZyVJRfva0
	ATVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nFB3RKPiIguAqkya86ktyc7NYJFo+MKlM3ikSOHoOts=;
	b=EUYhiV7mgS5XhXxy0E/SV4wUuqDiWyBZ5nwvKk/dFfLjUL9KA6nrwcX2XU1eORizi2
	TeURFgKcqhNNHllsa+kxRCpZk8e13l/rGqvO6yCM1hA1EKYr8+Wcb6M7jIM1tnDvx07K
	so6Lpd+ro8w/q0XwtzFRWx06dPv8+OPflC/HXWeBh90dR+Sv3ysoPqF5IeT3hYW19sTU
	oznq46SILSm6x6KbQjyjgpVeEt5PrtCiKr+gyXPZUhGz4yzD+QZ6N0XVLY1I1DiiQ/Az
	ocg3Kr6e4BsOcgQgaD/JO8HnqSHVAMwk2nket/gCmUvjm+10PwXzdiv7p1Dt0cGkc4Oj
	di8g==
X-Gm-Message-State: AHYfb5gs2dXGBhA91zSKogNFtCDSEmxXNhdkbSxcvDO98D/WgbFOPzkn
	un+vfytTHoJRReNN/GqV1Y59yd3anw==
X-Received: by 10.98.30.7 with SMTP id e7mr1310408pfe.329.1503419736425; Tue,
	22 Aug 2017 09:35:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Tue, 22 Aug 2017 09:35:04 -0700 (PDT)
In-Reply-To: <1503400000-25414-1-git-send-email-rbilovol@cisco.com>
References: <1503400000-25414-1-git-send-email-rbilovol@cisco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2017 09:35:04 -0700
Message-ID: <CAMKF1spLkW=57FZtm5_Xa3OGkBgj4RzvW9GKTudg1o2nDi9=9w@mail.gmail.com>
To: Ruslan Bilovol <rbilovol@cisco.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] machine-sdk: oldest kernel for x86/x86_64 is 3.2.0 now
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
X-List-Received-Date: Tue, 22 Aug 2017 16:35:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 4:06 AM, Ruslan Bilovol <rbilovol@cisco.com> wrote:
> With glibc upgrade to 2.26 release (commit d6a0bc57fa07
> "glibc: Upgrade to 2.26 final release") it's not possible
> to build x86/x86_64 SDK for kernels lower than 3.2.0
> (see glibc commit 139ace95756a "Require Linux kernel 3.2
> or later on x86 / x86_64.")
>
> Thus drop SDK_OLDEST_KERNEL overrides from machine-specific
> conf files, so default version 3.2.0 from conf/bitbake.conf
> will be picked up.
>

this is ok

> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>  meta/conf/machine-sdk/i586.conf   | 1 -
>  meta/conf/machine-sdk/i686.conf   | 1 -
>  meta/conf/machine-sdk/x86_64.conf | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/meta/conf/machine-sdk/i586.conf b/meta/conf/machine-sdk/i586.conf
> index 99083fb..41e5e15 100644
> --- a/meta/conf/machine-sdk/i586.conf
> +++ b/meta/conf/machine-sdk/i586.conf
> @@ -1,5 +1,4 @@
>  SDK_ARCH = "i586"
>  SDK_CC_ARCH = "-march=i586"
>  ABIEXTENSION_class-nativesdk = ""
> -SDK_OLDEST_KERNEL = "2.6.32"
>
> diff --git a/meta/conf/machine-sdk/i686.conf b/meta/conf/machine-sdk/i686.conf
> index cf22784..fe40697 100644
> --- a/meta/conf/machine-sdk/i686.conf
> +++ b/meta/conf/machine-sdk/i686.conf
> @@ -1,4 +1,3 @@
>  SDK_ARCH = "i686"
>  SDK_CC_ARCH = "-march=i686"
>  ABIEXTENSION_class-nativesdk = ""
> -SDK_OLDEST_KERNEL = "2.6.32"
> diff --git a/meta/conf/machine-sdk/x86_64.conf b/meta/conf/machine-sdk/x86_64.conf
> index 7d2e717..61439b4 100644
> --- a/meta/conf/machine-sdk/x86_64.conf
> +++ b/meta/conf/machine-sdk/x86_64.conf
> @@ -1,3 +1,2 @@
>  SDK_ARCH = "x86_64"
>  ABIEXTENSION_class-nativesdk = ""
> -SDK_OLDEST_KERNEL = "2.6.32"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

