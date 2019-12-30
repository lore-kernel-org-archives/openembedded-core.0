Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 819A37F82B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 22:11:23 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id 5so30537378qtz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 14:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9Q+5QQQ83xsLXlL7sRQcuZfuigldQA1ru8qQ6Pa2Bb4=;
	b=GR6qSSHHl7yJB5OXpSekxnuCReNvc2DCMpMk4P65hRmekwMpT5F3r6VFBxC5edcC53
	ip/zMAXlD6EwgsFJyCTC0VJqFRvZ1qBIuxkrC3TI7uKwHfFb02gkbFFIb8w1YJcw7KHm
	N6fwYUxj+glOKi9bn38YhQNBn5GeIP7peWoUITM9rWiuY1lAxyYSHHRMLJiyPRQVUC67
	S8WzYX1NaDuz4TLlqvyXHQgkHx9+5ZOLcy6FuQ9WXwUK91B/8PW7XDeXWd4P6IlC0VSo
	/BBKitXkIErWCioHM4tXYsgDMICdNfq3oo+2sn+tR8j4UdowOZvsJDGrk6Yq5zh/oNUO
	WXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9Q+5QQQ83xsLXlL7sRQcuZfuigldQA1ru8qQ6Pa2Bb4=;
	b=WNCMISPlYpfLSSMHqPFuLymeAr0fn8xMhtZXlLKjz889BEIWXEmCb6xFvmPDCi0J4d
	/8dsiLzr+wO1bkD81HczVPjv+Pf0lGAf7Ctk3JfYAiNDAabM/eSLBvRblIr3JwHweGYS
	wsydJsNyhsS7nQIXTrizRXzNPvnqlbN0gKF88FjJVS8YH4GgMPnsrT4A+URsl6xqy2gc
	01A6Dncb/45tc2yVkOS5cg9e69kkIGJNO/S1WigC6CYN/5PvILc5JHC9S6Tp9Z/QaYUx
	mmoUscVgq4KppmaKUl77Y/ZJVs3wAil+B8VjfQJNfOv2NPBpFdtLJk24U3rigm1vXv2+
	sjsg==
X-Gm-Message-State: APjAAAWkWFzgEwISf/m2ntnuYs5iGlUFwyS3/WLeDctZesSW+SZQfLqC
	gB1hs/y81q9noZ4Wh+SkbtOLqSgw4+EPwgCAwSLQMDXHqWw=
X-Google-Smtp-Source: APXvYqwq80G6S9jKJOmLUCKFffTSnfWdDUErQy2ZEqLHohm821JuohlLLa0Z3pFUEWovGQWAd1Zuqwa8U9iaxHjH+08=
X-Received: by 2002:ac8:145:: with SMTP id f5mr49217803qtg.194.1577743884111; 
	Mon, 30 Dec 2019 14:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20191230084739.19193-1-richard.purdie@linuxfoundation.org>
	<20191230084739.19193-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20191230084739.19193-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Dec 2019 14:10:58 -0800
Message-ID: <CAMKF1socNxx-eYHAQ=7Jeftqg4mGTzTUY-7K6ZkxdteH+-waiQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] bitbake.conf: Simplify TARGET_SYS/SDK_SYS
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
X-List-Received-Date: Mon, 30 Dec 2019 22:11:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 30, 2019 at 12:48 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> As pointed out by Masahiro Yamada <masahiroy@kernel.org>, ('' or 'custom')
> equates to "custom" and this code seems unecesaarily complicated and unused.
>
> It was likely intended to supress the value if XXX_OS was set to '' but the
> code doesn't actually do that. Simplify it as we shouldn't have this indirection
> if we don't need it, its horrible.
>

introduced here in oe classic
https://git.openembedded.org/openembedded/commit/?id=e485a5d542a24109c8ab97e58916359efc0cd044

and fixed here
https://git.openembedded.org/openembedded/commit/?id=ff02b94de71

downstreamed into poky
https://git.openembedded.org/openembedded-core/commit/?id=5ad6d9a94a0

I think oe-core missed the second commit. perhaps it seems that it was
created out
of poky lineage rather than oe classic.

maybe porting the second commit above would be better option here.

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/bitbake.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 394484b2b73..62b5466b717 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -129,7 +129,7 @@ SDKUSE_NLS ??= "yes"
>  TARGET_ARCH = "${TUNE_ARCH}"
>  TARGET_OS = "linux${LIBCEXTENSION}${ABIEXTENSION}"
>  TARGET_VENDOR = "-oe"
> -TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS'), ''][d.getVar('TARGET_OS') == ('' or 'custom')]}"
> +TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
>  TARGET_PREFIX = "${TARGET_SYS}-"
>  TARGET_CC_ARCH = "${TUNE_CCARGS}"
>  TARGET_LD_ARCH = "${TUNE_LDARGS}"
> @@ -138,7 +138,7 @@ TARGET_AS_ARCH = "${TUNE_ASARGS}"
>  SDKMACHINE ??= "x86_64"
>  SDK_OS = "${BUILD_OS}"
>  SDK_VENDOR = "-oesdk"
> -SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS'), ''][d.getVar('SDK_OS') == ('' or 'custom')]}"
> +SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}"
>  SDK_PREFIX = "${SDK_SYS}-"
>  SDK_CC_ARCH = "${BUILD_CC_ARCH}"
>  SDKPKGSUFFIX = "nativesdk"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

