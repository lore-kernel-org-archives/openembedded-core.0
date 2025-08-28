Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5B2CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 09:57:23 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.17176.1756375040690679535
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 02:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=P3cpEs+K;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b618e067eso12654975e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 02:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756375038; x=1756979838; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f45NVRwtws6YjxRyUqlLgiPo6wVrlhO1CQf5XKOsM/w=;
        b=P3cpEs+K4GnNiDsP56LktRSh6ZicwTKWORYYq74xnrtj7oqq68fiAmYRT9wIuJMTcb
         I5k3tMRgjnjEhmMbthPqqaRpejaQydCurn2on0c0rnawj6rhLKYieOWxbXH3zH+aEdxX
         A5TNTJmShINuHTVAWuvp4+A091i/ekR0Rn4BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756375038; x=1756979838;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f45NVRwtws6YjxRyUqlLgiPo6wVrlhO1CQf5XKOsM/w=;
        b=TC4TiPiLg8q7w49fWFCuv1n3Zheo9SPgDGAwzd7WRDZLl/bClLFQJ4LcBHVWd79oRV
         g9x3iIkR30zYuf1HTX3bKBGhMRajPdK7sVqSq04Qnu5U9nX18M4HowpMyzjmiueIVVow
         Wa2aF62w5SuYGIzgNiubIjl2+YsrdaElkUQeZgKZjXljcwwQ6VpS6NYxDQRbj8fPHxis
         kiyXlL79Pf2mCqO+CKKwg5oM3Jwo1F4u+Qv5QAl2rTKMXQYDuTd5XbSDJZ93uva/FOXl
         0NLtfxN4c0/P3+tDRP/51NijpKazGY7iyXtlT7LJuOqBx4LLliM1zDlKR0bAErNC9u3m
         0JpQ==
X-Gm-Message-State: AOJu0Yx/XX8f7wS0syvix6IsUJhyQd8sGwd8f0J0EbBRj4ldohV8IJUv
	bLvkvoiL31CDQeDho7BXMg1fWRqPTSpEStikpUYNleq2bWj8ToOom/FpSmRTF89UvzRds0PpTwG
	Al9ch
X-Gm-Gg: ASbGncsjuGPx7LcVQjCCpkXtnvEsly8QuynPNhBHHd5RRzvfxtxb3s8Y1RZbfBUIxkP
	Bbp3Yt6JjM9gF65LAFoiaRUlcrTXB6Qx+FppG6W2kH3vEkvq6SqOm/jjYwK/7lU21DpYuRgLpFl
	awunM808KhyO7LRi7+AoGst+ULM2k3SK1uJ0edU9hmuKSgngBcwFcg1zk5rmbChS4EaXUaadgXX
	OPv89v+VSfwEs5QcktPMmjEm2hleRvmPuRee3lNl/sRG2FPpjIjTrWCuvILo+MUtgTdPPRxK1wk
	OatmAUcP4wrL4LCmaMz6d+lNPeVVxKdCNE7IAYGuhrYfEkK96SztFcfA8yq0skp09gHNMO7Yom0
	66h4e43/NRnzqY9UQnYIyv38fFLnyjWmuS3u5QUWbL8XxYuU92LqQitzNIcvrWcaxWcwYdi8fyp
	X0Ln3f81wAZ70=
X-Google-Smtp-Source: AGHT+IGc8gegKXSDEiaYaLQnqvxy48j1z10UjFHr4J4mOxjdc/xUx8lB19pwSXYZM31KZ8IlRFBwyw==
X-Received: by 2002:a05:600c:314a:b0:45b:7a3a:32e with SMTP id 5b1f17b1804b1-45b7a3a0589mr16232245e9.9.1756375038268;
        Thu, 28 Aug 2025 02:57:18 -0700 (PDT)
Received: from [10.1.8.151] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b79799c4fsm24817175e9.3.2025.08.28.02.57.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 02:57:17 -0700 (PDT)
Message-ID: <18caac02-584e-4362-82ed-fa3341032ed7@smile.fr>
Date: Thu, 28 Aug 2025 11:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] libmd: add ptest for 'libmd'
To: openembedded-core@lists.openembedded.org
References: <20250818081557.776364-1-semc.2042@gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20250818081557.776364-1-semc.2042@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 09:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222553

Hello,

Le 18/08/2025 à 10:15, rajmohan r via lists.openembedded.org a écrit :
> Adapt the compile 'test' phony target from Makefile and deploy as
> ptest for libmd.
> It takes less than 30seconds for ptest completion.
> 
> Signed-off-by: rajmohan r <semc.2042@gmail.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc |  1 +
>  meta/recipes-support/libmd/libmd/run-ptest      | 13 +++++++++++++
>  meta/recipes-support/libmd/libmd_1.1.0.bb       | 16 ++++++++++++++--
>  3 files changed, 28 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/libmd/libmd/run-ptest
> 
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index e3099439f4..6cfafdca5a 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -31,6 +31,7 @@ PTESTS_FAST = "\
>      libconvert-asn1-perl \
>      libexif \
>      libgpg-error\
> +    libmd \
>      libnl \
>      libpcre \
>      libssh2 \
> diff --git a/meta/recipes-support/libmd/libmd/run-ptest b/meta/recipes-support/libmd/libmd/run-ptest
> new file mode 100644
> index 0000000000..871b6a0102
> --- /dev/null
> +++ b/meta/recipes-support/libmd/libmd/run-ptest
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +
> +for testFile in $(ls); do
> +	if [ "$testFile" = "run-ptest" ]; then
> +		continue
> +	else
> +		if ./${testFile}; then
> +			echo "PASS: ${testFile}"
> +		else
> +			echo "FAIL: ${testFile}"
> +		fi
> +	fi
> +done

You should explicitly return 0 (if all tests succeeded) or 1 (if any
test failed).
If I read correctly, your script will always return 0 (success) because
the last command run is an 'echo'.

See
https://docs.yoctoproject.org/dev/test-manual/ptest.html#running-ptest
(that was added recently)

Thanks!

> diff --git a/meta/recipes-support/libmd/libmd_1.1.0.bb b/meta/recipes-support/libmd/libmd_1.1.0.bb
> index dc588a0f95..223f1f1418 100644
> --- a/meta/recipes-support/libmd/libmd_1.1.0.bb
> +++ b/meta/recipes-support/libmd/libmd_1.1.0.bb
> @@ -8,9 +8,21 @@ HOMEPAGE = "https://www.hadrons.org/software/libmd/"
>  LICENSE = "BSD-3-Clause & BSD-2-Clause"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
>  
> -SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
> +SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz \
> +           file://run-ptest \
> +"
>  SRC_URI[sha256sum] = "1bd6aa42275313af3141c7cf2e5b964e8b1fd488025caf2f971f43b00776b332"
>  
> -inherit autotools
> +inherit autotools ptest
> +
> +do_compile_ptest() {
> +    sed -i "/\$(MAKE) \$(AM_MAKEFLAGS) check-TESTS/d" test/Makefile
> +    oe_runmake check
> +}
> +
> +do_install_ptest() {
> +    # install the test dir
> +    cp -rf ${B}/test/.libs/* ${D}${PTEST_PATH}
> +}
>  
>  BBCLASSEXTEND = "native nativesdk"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222035): https://lists.openembedded.org/g/openembedded-core/message/222035
> Mute This Topic: https://lists.openembedded.org/mt/114760002/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS - Tech Expert


