Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DFBC433FE
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 23:27:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.59625.1638833249264346116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 15:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W4q0tcX7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso435256wml.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 15:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VfDmJ45+NKIN3qq0GI7/8cIdYplanxGFYk9Mxl6zN94=;
        b=W4q0tcX7MOnY3TGWoCESJCS0EK/xAjkXhzgqR4U41to/4uSoO7gN5TDUVzX1bsabQd
         7UaX3a7ntSeveGDl8hrdD8h5ErzUs3+MohVCa9KRYRGEjg+08JxHR4gy/KC9SR8h3ZLB
         YeZco6nPDNxnCEvzurLPBHrKC7xhlT0CjvRaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VfDmJ45+NKIN3qq0GI7/8cIdYplanxGFYk9Mxl6zN94=;
        b=dvs+T1+CUnWoJFjDS+DgLks/u6c6A4NR9VT4lKVUiaOxQohmCIOR0kVL//VRo1567O
         iASVuiT97uvXPa6dehPPn3CmhYO4bmJtnsBSmRvi81SbjiT806qvxjC5hPaTb1wId8ux
         vqysIgZO4+euTPRPalC3G/lxLNllYR2WN5i0eJWP0oiYL7/TGPDtYX7Z4kOAbRfH5DIN
         wyL575i+zUB9RIOqtCJrAxAallzFSQvBXKKZPlCxxPnZUdcv+TKixtt2NARdiJA4qcnO
         r/mRokcmwWztcMvZndwQJhMhd8YbU0+4EQlzubt4h/dYjxWn28URzJ3fONQqoF0zWw5u
         9iow==
X-Gm-Message-State: AOAM530mSVfKg6BDvXVbKlVMWcqBrNi+0+L8pGp4ZlgoCYUQL7JZ+N2i
	UCN1Eqk1kYbMRaAan27PGUYe7Q==
X-Google-Smtp-Source: 
 ABdhPJzk6hWCFKIKy51GIFK/1tW6nMema5BYplz1o8DLnFm88Gsu6CNWGJzn+DAH4iGpVtYjHjntSA==
X-Received: by 2002:a05:600c:2948:: with SMTP id
 n8mr2095013wmd.170.1638833247771;
        Mon, 06 Dec 2021 15:27:27 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a?
 ([2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a])
        by smtp.gmail.com with ESMTPSA id
 f15sm881976wmg.30.2021.12.06.15.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 15:27:27 -0800 (PST)
Message-ID: 
 <f544c577cee7098d4211cab3b75cb0c6043d8a1a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] opkg: upgrade 0.4.5 -> 0.5.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Stewart <alex.stewart@ni.com>, zhengruoqin
 <zhengrq.fnst@fujitsu.com>,  openembedded-core@lists.openembedded.org
Date: Mon, 06 Dec 2021 23:27:26 +0000
In-Reply-To: <9e13c762-07e0-cace-2c51-927c25e07904@ni.com>
References: <1638835541-3789-1-git-send-email-zhengrq.fnst@fujitsu.com>
	 <9e13c762-07e0-cace-2c51-927c25e07904@ni.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 23:27:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159275

On Mon, 2021-12-06 at 13:13 -0600, Alex Stewart wrote:
> You beat me to posting my own recipe upgrade commit. :)
> 
> Toward the bottom of the opkg_*.bb recipe file is a 
> `package_qa_check_openssl_deprecation` function which I added in the 
> 0.4.5 release to warn BB users when they are building opkg with the 
> openssl options. Could you amend your patchset to remove that function 
> in its entirety, since it is no longer needed.

I added in that tweak since I wanted to get things queued for testing.

Cheers,

Richard


