Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED23C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 16:59:32 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.933.1659977970159235623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 09:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OZaYEldq;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id l64so9148888pge.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 09:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=xmXstorBSAG3A9FXZyuagL/cnvvnLGDLo+KSuN7cr+I=;
        b=OZaYEldqn8dUQJEljPTCgAa4A9rMKOUTWQbd+eRa6qOlK1J3tgaXmkwqiWDJGR9cbK
         jEqnSCaqGOwIgn59RqJZyye1Qib5tkDU8pJ1ZacSpbYVOfT6h8A5DyHAj1ln0DWjne/j
         95E1tFlOnXet1lI1o4VwmS/12eQ1TjuWtdQUvpQLQE/9N1g8910dIHNFHno9uWeEVj+X
         LkSI3UfmClekAhyPMqvp8UUvoLiFLrt61jdozZkCi7nk8rPzMZ6LL0g1BsM2ioLQjhjd
         tZCJV4pYQ6FmLOgPL7+ldw2opL9Kax75QcSoHhbMLTyJcy9lE7B2V7ZHrPjbj6BlkFJ1
         fhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=xmXstorBSAG3A9FXZyuagL/cnvvnLGDLo+KSuN7cr+I=;
        b=v7k/ZB9UOk4N5sxpUNPoYSMst77HJm/pZIybGxRsVrhR7FTXM5erM5HXBjkjM+QJep
         Q5AUtjUkSH3YFOf6qCyA51IQ7fmOSpi5ukjXYhjybnXmYZiFh1nDPudmtPWRspmSWdVe
         RDmFkuRfClL/n2RCC1FEjnb8cb3tRgz0CqiZ9WiXhWewoQyNDb8gf5RXy4XlN+96x1Tp
         4/lf0bi58eaPolGUKhtV8sXx4NGol5L5eOfcsZ0bm2n5uy3obigYvNL8Zcwyqi3TpvtI
         xMJjCAtHEVeS6L/UmjGzlmQxtMZyW7wkraWwF/kV3amYk85E7sMJl6Mwzx6cQFbz2F7L
         u5kw==
X-Gm-Message-State: ACgBeo33q8bFX44WawsQss3IV2HaJGNEYRu8gLZlFZXd3QM0SL104Ds6
	rOAXKYQ3ElSGODYToW8uvS/XUKCZlcY=
X-Google-Smtp-Source: 
 AA6agR4wEdSCtBeYqBn+WNuWBIuN2f6LshubNFLZ7lFcGw2xEE7+TxFGVSQRtwcq+hf4PQjLAUK3Ng==
X-Received: by 2002:a05:6a00:1992:b0:52e:86cc:9442 with SMTP id
 d18-20020a056a00199200b0052e86cc9442mr18929753pfl.47.1659977968742;
        Mon, 08 Aug 2022 09:59:28 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f9ab:8bd3:9e60:d783?
 ([2601:646:9200:a0f0:f9ab:8bd3:9e60:d783])
        by smtp.gmail.com with ESMTPSA id
 y17-20020a170902cad100b0016d9d6d05f7sm8832555pld.273.2022.08.08.09.59.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 09:59:28 -0700 (PDT)
Message-ID: <28454095-adb7-15c6-f09d-5763f5478c87@gmail.com>
Date: Mon, 8 Aug 2022 09:59:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.1
Subject: Re: [OE-core] [PATCH v2 06/44] cmake: update 3.23.2 -> 3.24.0
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-6-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220808064237.3975347-6-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 16:59:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169100



On 8/7/22 11:41 PM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../cmake/{cmake-native_3.23.2.bb => cmake-native_3.24.0.bb}  | 0
>   meta/recipes-devtools/cmake/cmake.inc                         | 4 ++--
>   .../cmake/{cmake_3.23.2.bb => cmake_3.24.0.bb}                | 0
>   3 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-devtools/cmake/{cmake-native_3.23.2.bb => cmake-native_3.24.0.bb} (100%)
>   rename meta/recipes-devtools/cmake/{cmake_3.23.2.bb => cmake_3.24.0.bb} (100%)
> 
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.23.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake-native_3.23.2.bb
> rename to meta/recipes-devtools/cmake/cmake-native_3.24.0.bb
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 4a6884e871..d64afffdc1 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -10,7 +10,7 @@ HOMEPAGE = "http://www.cmake.org/"
>   BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
>   SECTION = "console/utils"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f2102a52df7aa592cf072180e7ebc8c7 \
> +LIC_FILES_CHKSUM = "file://Copyright.txt;md5=45025187a129339459b6f1a24f7fac6e \

Reason for this change would be good to document in commit msg.

>                       file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
>                       "
>   
> @@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>              file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
>   "
>   
> -SRC_URI[sha256sum] = "f316b40053466f9a416adf981efda41b160ca859e97f6a484b447ea299ff26aa"
> +SRC_URI[sha256sum] = "c2b61f7cdecb1576cad25f918a8f42b8685d88a832fd4b62b9e0fa32e915a658"
>   
>   UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
>   
> diff --git a/meta/recipes-devtools/cmake/cmake_3.23.2.bb b/meta/recipes-devtools/cmake/cmake_3.24.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake_3.23.2.bb
> rename to meta/recipes-devtools/cmake/cmake_3.24.0.bb
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169031): https://lists.openembedded.org/g/openembedded-core/message/169031
> Mute This Topic: https://lists.openembedded.org/mt/92887002/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

