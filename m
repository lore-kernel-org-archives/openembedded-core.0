Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1358AC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 09:24:41 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.8098.1672824280280166141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 01:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AMycNsro;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id g13so49548027lfv.7
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 01:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PthQ5NIIj0xFARqz+MwpjjsrcHN0fRVFS+tvyM4pTb4=;
        b=AMycNsroQJzNilhca25Bsxt/IqNCjhaTlaqlBZFjmkksb3K1rsLJJpj1vzgmgLKrAN
         Kt8uHguoTPpBnFG7eNXIo5O8d64EHtHz2oKRiejOX4dARQi03FEej7rUS7/+8F2ZxiE0
         CAmUNmeLNoVYstx3awO5VDlkMMMiv2jGDof/f1kdL3HR0Z/QmyfIuOCFqQBF/3XoE5mu
         9Uw530hiuDKKKZeFNrakKPufDqn0ReshwJNocWPWBQnju4D/1gjvWGVQStzBjbvgVOup
         Me6GD2YXFEbloFGv34JrDkjeANzWggn4CEvdtaexfOEEtGRvl6T7ER9UFMpybofDn/hx
         cvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PthQ5NIIj0xFARqz+MwpjjsrcHN0fRVFS+tvyM4pTb4=;
        b=LUIuiJjc9URsANs+ibX/IEDSiOUd/pB0z1RS71c4V9/DVH94Ugshq7Y31eP3vU2lCu
         nyxSilcV5FeSRSHSjciMDXi9HfowkmpnSmLZqbCqCQO5bX3p73DR9zOvIYfr9jh+GKPU
         g2zUV7EFdZOgpTh2BX0IkemzfqGf9B9KN25SE41LN0p9o4N/CPxBIN/l5BweWU8IUKsa
         tt9kkXCdro819HovZ1nwKXZ1GRC06P2uY2lkZKEDaCitzMT+buIWAJMNu6FLBdGBUHme
         kVu+arww8ly9VB/YQPG3TZCoL7ocC02cuY7KTsnPc3olQa78nD+C4O2Q2FPq1Tzz5NoY
         +4eA==
X-Gm-Message-State: AFqh2kpjdAFnZs6w58cxwhlt2VtR6eoqchK+9BQD7aSimWcvG+oZnyKL
	SbiO1KXg/6a1FUSrqDjAQh1iSg==
X-Google-Smtp-Source: AMrXdXt5X6PmG/a4HAfXc7H1mdb5D8eRmeaTF9toc80qesJxR9hFCLQqY8sOy31T7WZMeacUyHkgww==
X-Received: by 2002:ac2:4c11:0:b0:4cb:42e0:645a with SMTP id t17-20020ac24c11000000b004cb42e0645amr1276375lfq.40.1672824278489;
        Wed, 04 Jan 2023 01:24:38 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id u7-20020a056512094700b004949a8df775sm5065408lft.33.2023.01.04.01.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 01:24:37 -0800 (PST)
Date: Wed, 4 Jan 2023 11:24:20 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Miroslav =?utf-8?B?TWFyZcWh?= <mares@2n.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] wpa-supplicant: Enable native builds
Message-ID: <Y7VFxCWF/bLuBrSc@nuoska>
References: <20230104092139.9015-1-mares@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230104092139.9015-1-mares@2n.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 09:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175380

Hi,

On Wed, Jan 04, 2023 at 10:21:39AM +0100, Miroslav Mareš wrote:
> Native builds for wpa-supplicant can be enabled
> without any further modifications.

Why would this be needed? The reason should be in the commit message.

It is likely better to remove wpa-supplicant from the dependency which
needs it on -native.

Cheers,

-Mikko

> Signed-off-by: Miroslav Mareš <mares@2n.com>
> ---
>  meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> index 4e27b92bc6..ec20b8b32f 100644
> --- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> +++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
> @@ -135,3 +135,5 @@ python split_wpa_supplicant_libs () {
>          d.appendVar('RRECOMMENDS:' + pn + '-dbg', ' ' + ' '.join(split_dbg_packages))
>  }
>  PACKAGESPLITFUNCS:prepend = "split_wpa_supplicant_libs "
> +
> +BBCLASSEXTEND = "native"
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175378): https://lists.openembedded.org/g/openembedded-core/message/175378
> Mute This Topic: https://lists.openembedded.org/mt/96047102/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


