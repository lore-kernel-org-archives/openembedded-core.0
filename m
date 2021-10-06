Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5273C433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 19:26:53 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.982.1633548412992334810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 12:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=azpa7bQ5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id r18so11978022wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 12:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0nJT+ujpgp1sm6Qc7JZ4D6zS3BfMdDpFUjFr56N9P3k=;
        b=azpa7bQ5VqgLzfG/ggl0QAyaxNC3+WcT0Q8vN9zsKwN6GVQlgM0qDOOUfNOTLf6I4S
         A+Rlxvd+YaaDudQxyml/Oms8DwHIiykdzU2QZ72GtE4wL2A8PoOg4arz85MLowlX4QGA
         VxkuPA2e/Hs8sYdcpfROVbY/qhQ6aXGFP8Yfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0nJT+ujpgp1sm6Qc7JZ4D6zS3BfMdDpFUjFr56N9P3k=;
        b=xn+bTwWf2acdkCrXS1cGURcNEKORBUfGccyPEO9XZbdDDML0XhRcpd1ZIwuZZe+vcx
         dhhhQVJ9RSyYQZ1dS8MBzDo6NMgmJdwVoQNk1HWbQ1XRr9bCT+fyVXOAGdXZgbfOq7NU
         4xPDpwXNGKAHN8LNCO0GfyeLeIVuA7Is9OTINBfAzT4Sy1012sHoPd7YQFEQH8A6cBRv
         BG5OjfRzMil8K8wvnWzs6XpoBWfMNzjCB/y99rQ5U+eIbzeU8n4gwj+JFt+dT9fTOE+Y
         BLEkKXM6TFsjT1Vo8LeCQ1YnswKxGXoDiuAsft+961IaGukkD12KRl/8S3+2F3+iH3q8
         o8Lg==
X-Gm-Message-State: AOAM532lzRCE6ZnlEFwfZMAtJI+p3fyfTWiMHK5e84LFNtFumo4278+4
	pUrbXsGQQVSBGGFgrD0mo6Rbqw==
X-Google-Smtp-Source: 
 ABdhPJyaphjrIE6HbcVqM7isig5awFe7uLFRSLKnFN1cQvsCuNzXowNo1Y6wJ3Llm1ddncBXxMIUwQ==
X-Received: by 2002:adf:bc12:: with SMTP id
 s18mr30171899wrg.328.1633548411360;
        Wed, 06 Oct 2021 12:26:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4ef0:3e29:718c:a98a?
 ([2001:8b0:aba:5f3c:4ef0:3e29:718c:a98a])
        by smtp.gmail.com with ESMTPSA id y5sm6835610wma.5.2021.10.06.12.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:26:51 -0700 (PDT)
Message-ID: 
 <b65c244a80638ce5498ad75e1627fe7e2ecf66e9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cairo: use ${PN} in package name
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steven Walter <steven.walter@lexmark.com>, "bkylerussell@gmail.com"
	 <bkylerussell@gmail.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 06 Oct 2021 20:26:50 +0100
In-Reply-To: 
 <CO1PR10MB44342798D12267B2DCF6FA9EF9B09@CO1PR10MB4434.namprd10.prod.outlook.com>
References: <20211006143606.55529-1-bkylerussell@gmail.com>
	 <df755fcfe28bc98a227c99e6cb034242f7063e8b.camel@linuxfoundation.org>
	 <CO1PR10MB443438D0A26177CABAB54BCFF9B09@CO1PR10MB4434.namprd10.prod.outlook.com>
	 <cef25f4b0dcb62b1e0bf782e66eaa3e46e1675f8.camel@linuxfoundation.org>
	 <CO1PR10MB44342798D12267B2DCF6FA9EF9B09@CO1PR10MB4434.namprd10.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 19:26:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156701

On Wed, 2021-10-06 at 19:22 +0000, Steven Walter wrote:
> I have reproduced it with 23.0.10

That sounds like dunfell and there have definitely been fixes for this since
dunfell that weren't easily ported into the LTS.

Cheers,

Richard


