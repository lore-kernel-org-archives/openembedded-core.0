Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F86C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 16:36:05 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.602.1634229364200117921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e1/s3TLi;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso7344271pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=bW1CJodZAhWi4WxN34sb2iGhYIJMWce8U+ifAR6QqzU=;
        b=e1/s3TLi1oXpFeSDJmRTDCYQMGx5O+l+aG2xfY2VoIyytV9BLLkPMr8Ggzjf/Fa6L4
         IAZZbZBm9sHFt+ftF8YB9cFLZ5B5ldOtjnKKFFxf+h0Xyb6bl6zxlEfWLoq1FM3IxBiA
         gnm7KCmf7JxKtq8aM0GcyjBb25L31sKkTQE68h4vdrD4xeEKoKxLl0nkkCfJ7M+oUXFg
         vyjL9RXuHNFzY3DvCJG888Qh8mRBT3Dw+JiBNJ6dEc1AdtDcI4q9GmSQTjn13Z2wyC7K
         kXAFKi3l5/kQf0XjA577xTBSWzR+qeYoTzmpukl7u7Jri1VygrBDFFVf9oj+MO2NyOWD
         rjxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=bW1CJodZAhWi4WxN34sb2iGhYIJMWce8U+ifAR6QqzU=;
        b=fNCGFa0IMm3HLePZvAkIhxYetKKr1j86IAATx9YV7ELcbqN6RDshAXim/qI5rilw0s
         jSULo1lwLPGVMSByPVdgXfffqZact4Ur9QHKlVCOqXyHRE+rTG0V67bj9Ol9psI2Tc7t
         r/ARW27C8sCAWp5uljVIP37dFgJyuR9pKhHg1LcG1jD29m+9i+4UmIEtfeJuRDwhTSMk
         mYb5zfcHHINqM2BIkD3prcn7a1gbnQglTniOTlfzii0geO+sacKFGoe85a3I44mXv04G
         pg+Qmcrk943xl4qRmjOxw8MeQ2ndT0oqIKSp3KH2TZMwctsakL09wUI2l6JgWEtAR0fo
         fE3A==
X-Gm-Message-State: AOAM533a82Cy8zT72PXFsB1LM9wSgevFTfzaLJT6kRj6Bg9qzgRWEH6R
	Aqc2bi+Oe5eKzKOeYcHETIU=
X-Google-Smtp-Source: 
 ABdhPJw1eM5RRX2Pa74A15BzDp570dXRI0aD+y0ZS+meaYsjvNcnijyTBaLxmG3i/k2wBa/GSxfBFA==
X-Received: by 2002:a17:90a:2902:: with SMTP id
 g2mr7294033pjd.161.1634229363537;
        Thu, 14 Oct 2021 09:36:03 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f921:a382:258b:3024?
 ([2601:646:9200:a0f0:f921:a382:258b:3024])
        by smtp.gmail.com with ESMTPSA id
 i13sm9943340pjh.0.2021.10.14.09.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 09:36:03 -0700 (PDT)
Message-ID: <ca870211-18f1-8387-2d4a-354bd70a897f@gmail.com>
Date: Thu, 14 Oct 2021 09:36:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [OE-core] [PATCH 1/7] reproducible_build: Drop now unneeded
 compiler warning
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 16:36:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156964



On 10/14/21 5:10 AM, Richard Purdie wrote:
> We now pass compiler options that mean the compiler will adjust these values to
> SOURCE_DATE_EPOCH, the compiler warnings are now unneeded.
> 

Is there a chance of it being overwritten by component's build system
in that case this warning may still be handy

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/reproducible_build.bbclass | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
> index 7571c116c82..fd90d771d2b 100644
> --- a/meta/classes/reproducible_build.bbclass
> +++ b/meta/classes/reproducible_build.bbclass
> @@ -58,9 +58,6 @@ SDE_DIR = "${WORKDIR}/source-date-epoch"
>   SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
>   SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
>   
> -# Enable compiler warning when the __TIME__, __DATE__ and __TIMESTAMP__ macros are used.
> -TARGET_CC_ARCH:append:class-target = " -Wdate-time"
> -
>   # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
>   export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156939): https://lists.openembedded.org/g/openembedded-core/message/156939
> Mute This Topic: https://lists.openembedded.org/mt/86310655/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

