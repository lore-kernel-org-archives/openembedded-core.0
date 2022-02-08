Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85457C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 12:50:49 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.10731.1644324648104802800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 04:50:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mmVGZcnQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id p24so14210666ejo.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 04:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=E53IVkzFVEqzSX4JcmWJcCFgODIFY9h9TTySiVSkj3k=;
        b=mmVGZcnQEJkX9anPKSzqYx6Xiwq9McVWbBBtlkFl4MvsSwL2IkidqCs5usuDCsgF5B
         fCN/ruXKkFQ3oiLKg/SaWYV9k/yNHNf+W+r19bppQ18qxsW2yplaV9Rl5NmcxD5Wo9iQ
         oKNhV6yQRDrb/lwjGwwrexVK3ZZapEbdcZtk7qGCkDISebQgwhuQFVp38fpEbTxRPqtQ
         NnSLhCb0KtvHxh9MX/fgP9/oVvCQiLs93Jml9u6mjwONIDi/rjyvwV7pOVIz+M7yVOcp
         hy5LPYozfMSFe4MjBSvybXV5c536geN0XECJTJeODVxiJQlQ/FiDullYZuTg7jrlw5GC
         DlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=E53IVkzFVEqzSX4JcmWJcCFgODIFY9h9TTySiVSkj3k=;
        b=CE5hOqXnxmww6VDBd4L0aFcaDoZ+YFFDmbp4dZO9BUjSJtbE5vlenCAYj9BIGrt7G1
         9mtYipm9CKO8uFpHcw2XHK3K62l5FtU6SaoYoPFcnkv/ccO/0Xf7tBaMJ54zftVXMfMW
         D1SbdZIqw1FExb4+1RGtlj9tpgnb1+plWhgvx+TcKOX1if2VzV6NfDj9HF3X15YXTtck
         nZpQ3afSxiLk9eeCPENB5V4TBqopNCVvv0LmjdSaTg4qCywFknT6fPEkQmPqePKe8/Ws
         qQBFAFVx2QemcPFZkafSV1kIHwwjYYyrQ/GgXlJKRVImKw6MgWbVdSc/kWDX1Z7domni
         CxmQ==
X-Gm-Message-State: AOAM532vhQ8hnx1H5eEDg4+iPz2WfkBps2piIoH+f0IUpV77twUnfxz6
	NC4uEL421WCi52ZtFrqAzPc=
X-Google-Smtp-Source: 
 ABdhPJzC0g6OB9HQiSSLTQGprmF8GXTE+VJEQb3S/GyPRmJsUfqZTU4PqqB8OHmPJJItvHrPOj+3sA==
X-Received: by 2002:a17:906:648a:: with SMTP id
 e10mr523918ejm.608.1644324646395;
        Tue, 08 Feb 2022 04:50:46 -0800 (PST)
Received: from [192.168.42.52] ([80.107.72.0])
        by smtp.gmail.com with ESMTPSA id
 z19sm4801797eji.87.2022.02.08.04.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 04:50:46 -0800 (PST)
Message-ID: <9b2823c3-2f49-8760-7ba2-1c67d56148fb@gmail.com>
Date: Tue, 8 Feb 2022 14:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH v2] create-spdx: Get SPDX-License-Identifier
 from source
Content-Language: en-US
To: Scott Murray <scott.murray@konsulko.com>,
 Joshua Watt <jpewhacker@gmail.com>, jsmoeller@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
References: <20220207192915.70095-1-saul.wold@windriver.com>
 <5aebf892-1a3d-9647-3490-39242941653@spiteful.org>
 <2e636f2e-dba9-e336-8060-9e8cce40cedb@gmail.com>
 <dc177cfd-50c2-33e2-bd3c-b33d65ee35@spiteful.org>
From: Robert Berger <oecore.mailinglist@gmail.com>
In-Reply-To: <dc177cfd-50c2-33e2-bd3c-b33d65ee35@spiteful.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 12:50:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161505

Hi,

On 07/02/2022 22:59, Scott Murray wrote:
> Jan-Simon can talk to it better, as he's done some dev work on the layer
> and done tests with it against AGL (and the subsequent Fossology instance
> experimentation), but AFAIK for the actual scanning scancode-toolkit
> does pattern matching based license detection, so in theory it'll catch
> excerpts of or slightly modified versions of the licenses in its
> database, as opposed to just searching for SPDX-License-Identifier
> declarations.

If I understand it correctly scancode-toolkit[1] claims to do this:

"ScanCode provides the most accurate license detection engine and does a 
full comparison (also known as diff or red line comparison) between a 
database of license texts and your code instead of relying only on 
approximate regex patterns or probabilistic search, edit distance or 
machine learning."

[1] https://github.com/nexB/scancode-toolkit

meta-spdxscanner can also create tarballs for each recipe and uploads 
them to a Fossology instance. Then Fossology takes care about license 
scanning and so on - and manual intervention is required.

A major issue here is, that the combined work (linking) is not taken 
into account at all, but it's all only per recipe.

Regards,

Robert

-- 
Robert Berger
Embedded Software Evangelist

Reliable Embedded Systems
Consulting Training Engineering
URL: https://www.reliableembeddedsystems.com

Schedule a web meeting:
https://calendly.com/reliableembeddedsystems/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--

