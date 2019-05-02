Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 41B8A7D7A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 21:21:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id h11so4397727wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 14:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=mJkVtjniXj5hs8fJ8ItNTPR/Wj0O87OEVGPlz+s6V8Q=;
	b=WBbcJlCZOV62z8NCK04LLnx85K1y1kCIRtbFsjdq2rK5kq/SHpshIWPf3I5JXImMl2
	MS01+c/7g+XNkJUKDfqaTzosT0tWPXyNJVtyF9adtpkGhgaCo6+Tntg1ZHLVmHPI4o63
	P1EI2tPV9mqfbfCctIrp2ihfXeegs98WphwVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mJkVtjniXj5hs8fJ8ItNTPR/Wj0O87OEVGPlz+s6V8Q=;
	b=UT1XpFtfFhJe/2Y93YNQ5XChmGMsh3K2KUbkO5hdYEQoT2iMoc7x//MPt/122YGt1h
	hjNoZ3hJ8pxSrt7+63NZR+iehX0w40hwOhay6c2KUHjdyBZmXvxht89RdeWJ7mUtHBo5
	8P/xY7sQqIY0hMoYEGr9pagljjlj08dUmv+VDl5DBr4tKPa+3roKsCj5FP2NTsikYrE1
	lX27i0eIteYgxQ/Kx9fxYrZ19m6WlmbxM7AWTmfTuItBJlRlwz40eMqcX07OcZ+EC/ZL
	fOykjnUr14WWIU4DUAczld3SeaemSkN6Zwby+TQ5lZVrzdNL3tfrO2nY/EDWZOot5vwx
	mjog==
X-Gm-Message-State: APjAAAV+3YKBz96KE3ATZG4R7Ss437nwAvNtY8qyn6U+70qN3YVIIXt7
	xZ0d0rDMpgzbF4QPmA1ejkk/tQ==
X-Google-Smtp-Source: APXvYqznFaW7hyFd2OkTmjMzTQg6R90DqIWxf8kh7nYwh4HL8GEUSDXZTE7aIYy6udpB1vRnTYKgoQ==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr3749694wmj.111.1556832118046; 
	Thu, 02 May 2019 14:21:58 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id h123sm293972wme.6.2019.05.02.14.21.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 May 2019 14:21:56 -0700 (PDT)
Message-ID: <efa24551716f7349c08a7ea002542dca2bed66c0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lei Maohui <leimaohui@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 02 May 2019 22:21:55 +0100
In-Reply-To: <1555557449-1879-1-git-send-email-leimaohui@cn.fujitsu.com>
References: <1555557449-1879-1-git-send-email-leimaohui@cn.fujitsu.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] icu: Added armeb support.
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
X-List-Received-Date: Thu, 02 May 2019 21:21:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-18 at 11:17 +0800, Lei Maohui wrote:
> Make icu support arm32 BE.
> 
> Upstream-Status: Pending
> 
> Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> ---
>  .../icu/icu/0001-Make-icu-support-arm-BE.patch     | 28 ++++++++++++++++++++++
>  meta/recipes-support/icu/icu_64.2.bb               |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-support/icu/icu/0001-Make-icu-support-arm-BE.patch
> 
> diff --git a/meta/recipes-support/icu/icu/0001-Make-icu-support-arm-BE.patch b/meta/recipes-support/icu/icu/0001-Make-icu-support-arm-BE.patch
> new file mode 100644
> index 0000000..019d09e
> --- /dev/null
> +++ b/meta/recipes-support/icu/icu/0001-Make-icu-support-arm-BE.patch
> @@ -0,0 +1,28 @@
> +From 8fa6cbf2d3de73bdca5e65f6523e4cce334aeee7 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@cn.fujitsu.com>
> +Date: Fri, 14 Dec 2018 16:07:31 +0900
> +Subject: [PATCH] Make icu support arm BE.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +---
> + i18n/double-conversion-utils.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/i18n/double-conversion-utils.h b/source/i18n/double-conversion-utils.h
> +index 0bd3e83..9288e28 100644
> +--- a/i18n/double-conversion-utils.h
> ++++ b/i18n/double-conversion-utils.h
> +@@ -77,7 +77,7 @@ inline void abort_noreturn() { abort(); }
> + // On Linux,x86 89255e-22 != Div_double(89255.0/1e22)
> + // ICU PATCH: Enable ARM32 & ARM64 builds for Windows with 'defined(_M_ARM) || defined(_M_ARM64)'.
> + #if defined(_M_X64) || defined(__x86_64__) || \
> +-    defined(__ARMEL__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
> ++    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
> +     defined(__hppa__) || defined(__ia64__) || \
> +     defined(__mips__) || \
> +     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
> +-- 
> 

This patch still doesn't apply cleanly and the build therefore throws
warnings...

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/558

or pretty much anything in 
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/135

Cheers,

Richard


