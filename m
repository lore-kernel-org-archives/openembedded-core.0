Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9BBC433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 17:51:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.15010.1637862686524908578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MpdGPKeI;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id i12so6559593pfd.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 09:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=jjENrv+vsiICSNQsHSg/uCAX7dElOoWZf0VlPyGW4fw=;
        b=MpdGPKeIKSQZ/Fwkwh/BJIPFuRZ22DOllyYu0BDo0BIj6Un4giAm4VQGIqcKnlkK/T
         qF22uhhOawY7jYHfDIwnFUdb4VEuLBoUy+rUTtXTI+91z2POu5Avg0qtamZQxd98zTrk
         spVYauZnZWH3jmGymL40pQ5vjvT/r/FhLJoBELZOQnNiqwC8wIAcuADPIL3oYO52gF4B
         bxsHNLfnGSt7Eg5ZjPodJHSMpKV66+AWpDXpPB4Ek6Phg6eyo2zc4LlDeUlyRQLiFNHW
         aBciQGJtniQGHwf/93iAl0oB5XVm/5xH16sbsrZl6b9zS2BHG2gsfTQCJket6lIo2ARp
         eI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=jjENrv+vsiICSNQsHSg/uCAX7dElOoWZf0VlPyGW4fw=;
        b=stEx0x6xfUgIXVA65VVgkDeutkb6jI+wc5f72mm/Bfudbu29hHXZ4zQAKGAxc3aNk9
         XUH5D7ODhNOGlTMU5G0rRGKy5L3ok24cqH+cSueAxMRFH8Gqavgr6f5N2unPNlmMVTM9
         q6XitVnNVSOJeQgKU8G+W6iGobbC//Eah3xeI7Oiu8KLwXY16XOaCXfrie5/5yOdLWKT
         dPBLWJxrBU7EUxXaJY622W98MMsYgdGnzCimcIxigCvtF79NUsytfDSbSLsa6hepdaAv
         5G50IuxIfJaez7Bhr1YTrPKhi9MqkZCiIbIC1D3TeclH5/WG+p3olU4BWUsC7Yf8kJ3v
         wFiA==
X-Gm-Message-State: AOAM530Xij/qX8dLyOwMLdDEoZiEAHJNCN85jo4yR4h9lM5AztVfBOlo
	OxYuQCKsmf29xX9BwvfHpscwCpKkLez4Vw==
X-Google-Smtp-Source: 
 ABdhPJz1sHhGuglh7fKl+WL3Z83dh/lR3sUsGAgWcoWscWyc/gt1DrVRzso3Rd+aRii5SA/2Y+Sl8A==
X-Received: by 2002:a63:88c1:: with SMTP id
 l184mr9037532pgd.460.1637862685933;
        Thu, 25 Nov 2021 09:51:25 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:dde5:a4ce:7ead:fc8c?
 ([2601:646:9200:a0f0:dde5:a4ce:7ead:fc8c])
        by smtp.gmail.com with ESMTPSA id
 g22sm4443036pfj.29.2021.11.25.09.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Nov 2021 09:51:25 -0800 (PST)
Message-ID: <beb9f06e-18dc-f69b-d5a6-6d15b131b752@gmail.com>
Date: Thu, 25 Nov 2021 09:51:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [OE-core] [PATCH 3/3] gcc: Drop mips default ABI patch
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211125152234.129463-1-richard.purdie@linuxfoundation.org>
 <20211125152234.129463-3-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211125152234.129463-3-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 17:51:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158791



On 11/25/21 7:22 AM, Richard Purdie wrote:
> gcc-configure-common.inc already sets --with-abi=64 for our mips64
> targets so this patch is no longer needed.

sounds good. Long time ago, IIRC it did not work for compiling the 
target gcc so it has to be enforced but I agree one less patch is better 
now.

> 
> [YOCTO #14639]
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 -
>   .../gcc/0010-MIPS64-Default-to-N64-ABI.patch  | 54 -------------------
>   2 files changed, 55 deletions(-)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index b4e4300c66b..afb8f2df5c2 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -36,7 +36,6 @@ SRC_URI = "\
>              file://0005-optional-libstdc.patch \
>              file://0007-Use-the-defaults.h-in-B-instead-of-S-and-t-oe-in-B.patch \
>              file://0009-cpp-honor-sysroot.patch \
> -           file://0010-MIPS64-Default-to-N64-ABI.patch \
>              file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
>              file://0012-gcc-Fix-argument-list-too-long-error.patch \
>              file://0014-libtool.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch b/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
> deleted file mode 100644
> index f385f8c5a20..00000000000
> --- a/meta/recipes-devtools/gcc/gcc/0010-MIPS64-Default-to-N64-ABI.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From a2dc2fa4cc7e5d54544d4a7b6601eef79bc26cad Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:23:08 +0400
> -Subject: [PATCH] MIPS64: Default to N64 ABI
> -
> -MIPS64 defaults to n32 ABI, this patch makes it
> -so that it defaults to N64 ABI
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Inappropriate [OE config specific]
> ----
> - gcc/config.gcc | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> -
> -diff --git a/gcc/config.gcc b/gcc/config.gcc
> -index 3ec7582f5dd..a046fa6945c 100644
> ---- a/gcc/config.gcc
> -+++ b/gcc/config.gcc
> -@@ -2543,29 +2543,29 @@ mips*-*-linux*)				# Linux MIPS, either endian.
> - 			default_mips_arch=mips32
> - 			;;
> - 		mips64el-st-linux-gnu)
> --			default_mips_abi=n32
> -+			default_mips_abi=64
> - 			tm_file="${tm_file} mips/st.h"
> - 			tmake_file="${tmake_file} mips/t-st"
> - 			enable_mips_multilibs="yes"
> - 			;;
> - 		mips64octeon*-*-linux*)
> --			default_mips_abi=n32
> -+			default_mips_abi=64
> - 			tm_defines="${tm_defines} MIPS_CPU_STRING_DEFAULT=\\\"octeon\\\""
> - 			target_cpu_default=MASK_SOFT_FLOAT_ABI
> - 			enable_mips_multilibs="yes"
> - 			;;
> - 		mipsisa64r6*-*-linux*)
> --			default_mips_abi=n32
> -+			default_mips_abi=64
> - 			default_mips_arch=mips64r6
> - 			enable_mips_multilibs="yes"
> - 			;;
> - 		mipsisa64r2*-*-linux*)
> --			default_mips_abi=n32
> -+			default_mips_abi=64
> - 			default_mips_arch=mips64r2
> - 			enable_mips_multilibs="yes"
> - 			;;
> - 		mips64*-*-linux* | mipsisa64*-*-linux*)
> --			default_mips_abi=n32
> -+			default_mips_abi=64
> - 			enable_mips_multilibs="yes"
> - 			;;
> - 	esac
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158783): https://lists.openembedded.org/g/openembedded-core/message/158783
> Mute This Topic: https://lists.openembedded.org/mt/87304170/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

