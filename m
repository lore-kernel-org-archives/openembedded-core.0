Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FD4EC433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 12:43:07 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.6730.1639140181822905282
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 04:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IQ3DzdKu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id a9so14700516wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 04:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pGiTo0gjZRFGztG1WaLOTpG57v8xtSOEnogAO1ZZuEU=;
        b=IQ3DzdKuJuwUXRvZC1oH2xparoztcwtr5v3bsFlIWIH0AyUMWvRiuLfA/IsMgbw1tl
         cZm27ZeYHYRWanPaNRCfOKYdVI6/7r4/aZQTKVJbDAb6vqU0mTm5FSOkhAc0e6pwVqIQ
         P23bz8e64lIPGA/wGLCNT/VuhWylYLj9HBjxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pGiTo0gjZRFGztG1WaLOTpG57v8xtSOEnogAO1ZZuEU=;
        b=5azsqpbSRD+B9uevKXab7Ih0bum8m/XAF2weqeJCHAwTsfNgArnITcZRe+zTHHRTJb
         nFotYIr1jzFVABrBjsvE7bCF6/wRCgesu+RbPsuDlkmH4pT+OUMNib0yAoRd3lDBrYaB
         Rypvc9VxEDakyfwJhnWaHuBW6uxZS9ZYZjLecyq2UdPWjzl1D3S/NCnpnS38pghq7bHa
         Mv58ppes6xIktld5IngMN6Jlu1yXaTpwzy2U6hEqzlL64u+noTw89NZEAWlHbsYTn7Mj
         +P7Mozi6SSRFAPi0eR8Ey8dCEhb0GkoVnDWOaChDhOovLD4HTQF+DTRUYThi8o5HZEqf
         G0oQ==
X-Gm-Message-State: AOAM5300l4TESU5DZYhuuEkRL63oBPJ7pxz8Uk/aq98S+Mpjj3ci6AYI
	iSOkudP43tJtoNUC2x6xjFuARA==
X-Google-Smtp-Source: 
 ABdhPJzImkQUDrA1JYPGZpAi/vnw+SOazhTvn9qlovNn4U0V50PlvjFrE12+Gfm9uXjQvM8nb7MQAw==
X-Received: by 2002:adf:f5ce:: with SMTP id
 k14mr13747712wrp.100.1639140180165;
        Fri, 10 Dec 2021 04:43:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1746:a8bd:1fb1:93fc?
 ([2001:8b0:aba:5f3c:1746:a8bd:1fb1:93fc])
        by smtp.gmail.com with ESMTPSA id
 r7sm2421337wrq.29.2021.12.10.04.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 04:42:59 -0800 (PST)
Message-ID: 
 <cd72f4fec818ee92ad54c04e8a85f62d5e05a696.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/8] files: add preinit.sh.in
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Dec 2021 12:42:57 +0000
In-Reply-To: 
 <375fb52dba5ec14ef42748139ea90fabaee87131.1639136706.git.uvv.mail@gmail.com>
References: <cover.1639136706.git.uvv.mail@gmail.com>
	 <375fb52dba5ec14ef42748139ea90fabaee87131.1639136706.git.uvv.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 12:43:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159508

On Fri, 2021-12-10 at 12:50 +0100, Vyacheslav Yurkov wrote:
> A template init script for overlayfs-etc class
> 
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/files/preinit.sh.in | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 meta/files/preinit.sh.in

Can you call this something like overlayfs-etc-preinit.sh please?

That way we can know roughly what is using it!

Cheers,

Richard


