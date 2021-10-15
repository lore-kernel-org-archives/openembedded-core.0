Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2CDC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 09:58:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.7276.1634291886724656488
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 02:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MI44jA/Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so2431069wmj.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EDUFFinNE+TnXEOf7YLoUATFuKqUZPfbPG/EcySchRI=;
        b=MI44jA/Qm8cpYV49i0yF7uFvCwHQna//QPX2OUG75+3rPe1uUARqFpFQ9gSedqr2wA
         vNi/tKDghnhOta+dMSQfr00ZOzBjoUAlW95XH/ivPsXNS/pL35kKSYPGGWh7IJN3KuWz
         UO8ZV6HpP5Qyz4ehf4dsdDUVxYkG9pbdSBAI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EDUFFinNE+TnXEOf7YLoUATFuKqUZPfbPG/EcySchRI=;
        b=PjDpOc/KwEYx0ldhWMofX+etbEdKAH5b2QdT9bSjfBEyqH3CJQAGGljrOfO6/nQiZC
         e2PteN2nSrZKD+xFZ4SSlVvZGjmsgRATPCxN5lGEi7rxsP7NV77/FVwhD+fKQVrjd6bq
         doHJD0bN1NioaYizj52g/f5ltwJrJa9mSd3skVW8BNjsC3lIpP/lHTWAcHYOeB9BxbUr
         pBLLOhcUz+igXpaqINAMbE2Ah2RW9nbxeOKV+AxwI2Uzap52Te8p5GRDqF/BwWoTlNoq
         AkYlA6ufjCdWJ0g6CALYDPKOpkNCvrNxJdJyjm7MnThXEuXCP2mKUsYNCyFEig5Rv4Az
         4ihA==
X-Gm-Message-State: AOAM532l3fiOABgEazBKcVRGuYS7KvDgQQFIg805FobiuZAQeF87/236
	CIlFWXF1pit61kn5nBbsgHe8Vg==
X-Google-Smtp-Source: 
 ABdhPJwfuznjZ4y4n0sstLHaAII3CzttTq1Gn/H0AThxEVEkdcjlJUUn7dGERazUsBgRsqypWozSWw==
X-Received: by 2002:a05:600c:350c:: with SMTP id
 h12mr24764478wmq.163.1634291885084;
        Fri, 15 Oct 2021 02:58:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1?
 ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 c185sm4416209wma.8.2021.10.15.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 02:58:04 -0700 (PDT)
Message-ID: 
 <d1015886629914a9b2ca8dba71326ecf7b355bda.camel@linuxfoundation.org>
Subject: Re: [OE-core] libpsl: Add config knobs for runtime/builtin
 conversion choices
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, "steve@sakoman.com"
	 <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	 <raj.khem@gmail.com>
Date: Fri, 15 Oct 2021 10:58:01 +0100
In-Reply-To: <56ce3d16404402d0b6661fb067c587618a57661f.camel@siemens.com>
References: <0c5732d80a8f5810e9a26c3b1e634422cf750fbf.camel@siemens.com>
	 <CAOSpxdaGuK2RqNGz2VJg04AhnDhVRAMYvOLS497d-OTYUoXc-Q@mail.gmail.com>
	 <56ce3d16404402d0b6661fb067c587618a57661f.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 09:58:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156988

On Fri, 2021-10-15 at 06:15 +0000, Andrej Valek wrote:
> The reason, why I want to apply it here, to switch replace libidn2 with
> icu. According to libpsl documentation, you can chose who will generate
> the PSL database (libidn, libidn2, icu). So I don't want to install a
> new component if there is a valid replacement which is already
> installed.

I think what Steve is suggesting is a tweaked version which doesn't change the
current situation, just adds the PACKAGECONFIG options but doesn't change the
current default.

You could then change the configuration in your distro.

Cheers,

Richard


