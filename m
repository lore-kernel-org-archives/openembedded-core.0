Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61171C83F25
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 01:23:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.2641.1753147414089642753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 18:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U1MLoGat;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-23dea2e01e4so57429335ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 18:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753147413; x=1753752213; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSGAwW1o4TnzXReHLgU2Rp2lVpy14xWPvjpOQcHSvBw=;
        b=U1MLoGatChFZJBaTNiAr9j14Xb1GKDsI0CvkmPxXKNpnlcYA+jcyuuA6RrqnIq7tcC
         KL7ADzWUOV8sndUEp0dhOzrDKjIC8NYi6i7c6i69/zjxg+TrRsS2KDdag8zQZspG0scC
         rMIfR4CRkQbPHaSHyOL35zFVBDPD5H88H5B9z5znkl0uQCF7b4YWv5LYhBmysYLu6jKu
         Dgxgfrspi/wlk+kpxlj7K6cBrmIM57dGUqmkGS/Kht3e8vU6TFR1/PD8Y01eh/t9Hc9V
         rbTXYGJ3rXX4ngTiX7HX/w7X/+wBOOsxE7RTgTZFruBgDwnKlmgNYu3iVCY6V2MfQkvH
         gCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753147413; x=1753752213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vSGAwW1o4TnzXReHLgU2Rp2lVpy14xWPvjpOQcHSvBw=;
        b=r8KVucplKdcjPMZYEzPK0Hkp/BdMo5q+uCwUyiy2YhNbHfZRHvkP4n2w0ZCJIGrlYh
         OHbtPkYB836EyDiPmPGPfNoisrgYcfFb96h6MD4Ifc0ZLENRZdsS5WaAkF7/THsgjJh/
         oYEfin8hr59xTkuCL8tIlsuOS6XclhTMs+o03WkiAz72svn/UaDHM6AdECP84FJD/+rk
         Cz75yq6a0cLeaO8JWRpxeUWiUeU8StzoVMAQa5OhxWwufU2F1RLI/SsNqSt5COCCCDcP
         ken9Lpx30xpS1oXZ+46y73SmDcNHLCBUPvAHTZkLi/wKq+8f1sXAKCD/MWlNkAr3zhba
         +LeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzVHIoTmOtdqDnUb6cfZVBJ6akQxs45GsJ/asxUbOzaHg4f8biSPG8OXUQjvT8F77Lk2tPeLBSoQq2yXAJth9mSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyovudNxnInxtt5TZ2Yzy2BFli4yX0oShaz68CpfG46869ITX+e
	Ciz/OFZFuA3QpxqUw+hM9FMCsLMKi8EAn/74GRGV9Od+girVLH/D9rQL
X-Gm-Gg: ASbGnct7CArbDyIS5RKRmu6E1bSPqzpBMew54/vQ6YRTcrnHUN6DrYEO5Md4Ww+wL7H
	oHiwGw6jWSwODD4gnoFTwhaUwwSVyJpTNEXsvBK35Zu2NP4IYexRu8j5aldfj7p9uzqlwCF4Egu
	MDKsw4x2ttwW72dbzVSZiSVOqifp9JggZK6eWY1pUVDqiESyhobdDuaChogx0O3/R6ZCiTTiLS6
	xs/Ki7lEdOUaF87ULelJgG13GOiEwn1NfaQzuFkZOXI2Evg7U1RMe1ql1LzKtTot2wYQwgO5IeU
	/vta8MQ9Xa3bkZQqS0gGn6ivKU78u3lgb0l5TKsUP9eojoZBgFW0gbpTqZq9v5QMaiZX4tuw1sb
	357PedcFws2viKFu+EWIozPF4DX34wSn4cANT
X-Google-Smtp-Source: AGHT+IHWNSQQsgsti74ZCA1jaJkMfklsHxLuidqtM4mOGVYa4Raj+NAZ59kkrce3bh2QMkS+QrH3Cw==
X-Received: by 2002:a17:902:f70b:b0:23d:fda6:1ac6 with SMTP id d9443c01a7336-23e25764c7dmr286541755ad.39.1753147413336;
        Mon, 21 Jul 2025 18:23:33 -0700 (PDT)
Received: from [10.15.13.154] ([209.129.148.213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e22e5sm64556745ad.38.2025.07.21.18.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 18:23:32 -0700 (PDT)
Message-ID: <193893a9-5edb-4562-993b-80d69c9bb70f@gmail.com>
Date: Mon, 21 Jul 2025 18:23:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 4/4] lttng-tools: Remove the scope resolution
 operator with musl
To: mingli.yu@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250720090010.3122861-1-mingli.yu@eng.windriver.com>
 <20250720090010.3122861-4-mingli.yu@eng.windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250720090010.3122861-4-mingli.yu@eng.windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 01:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220713



On 7/20/25 2:00 AM, Yu, Mingli via lists.openembedded.org wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> Remove the scope resolution operator :: in musl build to fix the below
> build failure.
>   | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
>   |    18 |                 int flags = ::EFD_CLOEXEC;
>   |       |                               ^~~~~~~~~~~
>   | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
>   |    21 |                         flags |= ::EFD_SEMAPHORE;
>   |       |
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   ...Remove-the-scope-resolution-operator.patch | 41 +++++++++++++++++++
>   .../lttng/lttng-tools_2.14.0.bb               |  2 +
>   2 files changed, 43 insertions(+)
>   create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
> new file mode 100644
> index 00000000000..dac5002f097
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch
> @@ -0,0 +1,41 @@
> +From da83d31a8dd555c28eb27bd7a7d3c53b51d5f276 Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Sun, 20 Jul 2025 16:37:57 +0800
> +Subject: [PATCH] eventfd.cpp: Remove the scope resolution operator
> +
> +Remove the scope resolution operator :: to fix the below build failure
> +with musl.
> + | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: expected id-expression before numeric constant
> + |    18 |                 int flags = ::EFD_CLOEXEC;
> + |       |                               ^~~~~~~~~~~
> + | ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: expected id-expression before numeric constant
> + |    21 |                         flags |= ::EFD_SEMAPHORE;
> + |       |                                    ^~~~~~~~~~~~~
> +
> +Upstream-Status: Pending

The difference is that musl defines these labels as preprocessor macros

https://git.musl-libc.org/cgit/musl/tree/include/sys/eventfd.h#n14

where as glibc defines then as enums as well.

https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/bits/eventfd.h;h=97a000a4948d02aa9f3d15f488b63545adcf02b4;hb=HEAD#l27

so they can be referenced as flags from the global namespace as well.

Removing the global scope resolution operator (::) and just using the 
flags directly is a portable fix that will work across glibc and musl
so need to make it musl specific, moreover, please send it upstream as
well since its a portable fix.

> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + src/common/eventfd.cpp | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/common/eventfd.cpp b/src/common/eventfd.cpp
> +index fe5b549..3379b0b 100644
> +--- a/src/common/eventfd.cpp
> ++++ b/src/common/eventfd.cpp
> +@@ -15,10 +15,10 @@
> +
> + lttng::eventfd::eventfd(bool use_semaphore_semantics, std::uint64_t initial_value) :
> + 	file_descriptor([use_semaphore_semantics, initial_value]() {
> +-		int flags = ::EFD_CLOEXEC;
> ++		int flags = EFD_CLOEXEC;
> +
> + 		if (use_semaphore_semantics) {
> +-			flags |= ::EFD_SEMAPHORE;
> ++			flags |= EFD_SEMAPHORE;
> + 		}
> +
> + 		const auto raw_fd = ::eventfd(initial_value, flags);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
> index da3bdd4052f..989c963c1f8 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
> @@ -48,6 +48,8 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>              file://0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch \
>              "
>   
> +SRC_URI:append:libc-musl = " file://0001-eventfd.cpp-Remove-the-scope-resolution-operator.patch"
> +
>   SRC_URI[sha256sum] = "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c1b60ef1c3a3c2fd3"
>   
>   inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220617): https://lists.openembedded.org/g/openembedded-core/message/220617
> Mute This Topic: https://lists.openembedded.org/mt/114249011/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


