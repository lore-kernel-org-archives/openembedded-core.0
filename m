Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D06C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 17:05:37 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web12.46.1657904732165058746
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 10:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fll5dtrR;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id w29so3485349qtv.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 10:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZHKLi2JT6t46/UYKU679PjyKgKSnMtsUGVsltSHPaRE=;
        b=fll5dtrRPiWY9/uYNXVKOnLnzvvnIp6H/MIYCiyWnXsOBW9vAIAg3J2ZcTiizzua55
         oDUtvu6qK8Dr3xRSBiQNM8VTddaUDAMH2WcT3hAZKjlQlHn1XUHQLEnju/svL4IMPzNO
         2XK5HctW6Ly4NMY2HrHSaPNtPxzm1e0qftMEt729hJa68BRwzArM+E1zfSsFpKQSut1R
         z5LEPsEtfPRjRmXOOBzalVxa2b2m/AbMlZ5njJ2MXQhW+VdNEI94obC7NPV0uQacP0TN
         80NNjusrK+uNZYGDNjesBOn3wNcvh1W1PywO+qzeDbwSty0OL379fm26b89fxDPkuZHJ
         Oolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZHKLi2JT6t46/UYKU679PjyKgKSnMtsUGVsltSHPaRE=;
        b=SvcY8VWJ6R4X11PYW67itqQuDmeIlhe77Tl+zaOPnxjvJphfJeITuVOkFkiUwkBZRu
         TGQGswvvQZ5DZ0hNyKRXJO72XUSZzZM8TWVn3GF1EmjVgAh2Wnjg+dntNlwAXj+YDfrP
         iyeFsCudecZklShOrfHopb6sjgLYPgruFCkrwvzTLOy5sUhhJEBbUiV3PTmHYghPIy7g
         B5Cfpm5S1JTd2Ehs/sNB8vKZTEGyRIkT9AufKvYUgLPURJpCdmaZT9q78C8VcDvRyes7
         BiYDzOT/h9UZDpjxPOvwUpkrG7gtAhKDN8obkfmcoccaijRAEC/2dBv4xP9xaGZ9c4Hp
         Bb6w==
X-Gm-Message-State: AJIora8BOMNtHiB2q+xPUZHLSBUbFwHGd9dplt3ENMfv9TxMiHn4WAOT
	DlkWK5PbtuRpSGjUhqKK5DM=
X-Google-Smtp-Source: 
 AGRyM1vxJs3QektBJDnKv2aVyyqVypSqIgsdgmIEpmH3gaEhnnW3s50MVVQ35QDp6JqJdC0A4tCP3w==
X-Received: by 2002:a05:622a:1709:b0:31e:dcb0:90b6 with SMTP id
 h9-20020a05622a170900b0031edcb090b6mr2839872qtk.659.1657904730343;
        Fri, 15 Jul 2022 10:05:30 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:2953:99a6:d45f:6161?
 ([2607:fea8:95df:9730:2953:99a6:d45f:6161])
        by smtp.gmail.com with ESMTPSA id
 m13-20020ac8688d000000b0031bf484079esm3429791qtq.18.2022.07.15.10.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 10:05:30 -0700 (PDT)
Message-ID: <d7ae54ce-8362-32ca-163e-539f5fa32805@gmail.com>
Date: Fri, 15 Jul 2022 13:05:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.2
Subject: Re: [OE-core] [PATCH] pulseaudio: add m4-native to DEPENDS
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20220715110533.4008485-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220715110533.4008485-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 17:05:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168132



On 7/15/22 7:05 AM, Ross Burton wrote:
> Normally m4-native ends up in the sysroot via the toolchain, but if a
> non-standard toolchain is used them m4-native may not be installed.
> 
> However Pulseaudio explicitly checks for m4 in the meson.build, so add
> it to DEPENDS.

I think default toolchain dependencies should be emulated by external 
toolchains too. Or perhaps m4-native should be dropped from the internal 
toolchain too.

> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index 602d7263ce8..6055a9ebadb 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -61,7 +61,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
>   "
>   
>   # libtool is needed for libltdl, used in module loading.
> -DEPENDS = "libatomic-ops libsndfile1 libtool"
> +DEPENDS = "m4-native libatomic-ops libsndfile1 libtool"
>   # optional
>   DEPENDS += "udev alsa-lib glib-2.0"
>   DEPENDS += "speexdsp libxml-parser-perl-native libcap"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168055): https://lists.openembedded.org/g/openembedded-core/message/168055
> Mute This Topic: https://lists.openembedded.org/mt/92398180/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

