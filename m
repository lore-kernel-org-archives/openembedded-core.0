Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B230C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 16:44:46 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.9111.1647708273630801657
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 09:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B2mAZ/5V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id h23so14883836wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 09:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=fj0/Rvk+R6MuUepAoKoOtmYHlZAvt93P6p4W0xjSioE=;
        b=B2mAZ/5VAKtYn66iA3DIN3YOzVfDguLBPJvEIpVXlUKjmxFXc/VisamtW7IDlRxRXa
         mlkvADQo3nkhs8Y3iWnNsUdyKX2e7SwtsA9l8qi/iXZVOr9iBMl8rAtIY6rfu+ZTSHcO
         U1saX4nIQDF2Sq5MS+UFcJzDGg5E28zH4bYOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fj0/Rvk+R6MuUepAoKoOtmYHlZAvt93P6p4W0xjSioE=;
        b=RkLQ0cOePy6t7E8FGkEcLX0HMSTNWUqCz4G5yS+EYrLXa20nyTnIGF2IuUmaPQMJD3
         ghJ1KXr9ZdLmNcN2PqAoprVGUa8/1QuOLeP0ImezG0pvxbNouBGl+UdwizdZaPcT+Onv
         2jHbfiJ2EFEnfc6k6VYMSfDvkA1WlyMwtl+kh/+C+TOWRPwQKB55NWSioFKTR3hoPw13
         7uP1e0HdgsleXqLeYHIHKwm/2FKXROZK4DtMCIHqaXdX54AwUZO7/vGGuwgVqPNQCkxj
         NCrPXZ+43wytCebSphqDZk1iVzIvVJauKswi5S0nzjWF1CtYI7wVBbACm3CNKiE3LnQu
         0o0Q==
X-Gm-Message-State: AOAM532eNpvtmNFWn+MJWzjiPIMdYvjJVBStcEl3r6sNpiJq0XvmCnPL
	DLqc/J7C8WDycTPpTl/kf9FsAA==
X-Google-Smtp-Source: 
 ABdhPJxXvlV5QuMqm1o81Ag1hqUf94GZsTwZt7VnvnP+zWP83x2JFc4PZD3XlDXnfexTfP4laVlkSw==
X-Received: by 2002:a5d:4ecd:0:b0:203:fd7b:bdd1 with SMTP id
 s13-20020a5d4ecd000000b00203fd7bbdd1mr4257061wrv.265.1647708271999;
        Sat, 19 Mar 2022 09:44:31 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ad7:b7e1:8044:d0f5?
 ([2001:8b0:aba:5f3c:3ad7:b7e1:8044:d0f5])
        by smtp.gmail.com with ESMTPSA id
 v10-20020a056000144a00b00203df06cf9bsm9116339wrx.106.2022.03.19.09.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 09:44:31 -0700 (PDT)
Message-ID: 
 <1916eb255426ba0a78fb960f876097195932c5f3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libtool: Upgrade 2.4.6 -> 2.4.7
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 19 Mar 2022 16:44:29 +0000
In-Reply-To: 
 <CAMKF1sqUk9d-02+dnZ=Q9+PECwLNUdeOsEFrt2D=yZRRQuOuuQ@mail.gmail.com>
References: <20220317180005.1009380-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1soE840jiaiuKZ3-zJKY+f5DWE8Ry_7HOhPFoK=hvZwBWw@mail.gmail.com>
	 <9f00a3fe1b69e4c4e9fd34ae04effcee6229b929.camel@linuxfoundation.org>
	 <CAMKF1sqUk9d-02+dnZ=Q9+PECwLNUdeOsEFrt2D=yZRRQuOuuQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 16:44:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163470

On Fri, 2022-03-18 at 17:28 -0700, Khem Raj wrote:
> On Fri, Mar 18, 2022 at 5:10 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Fri, 2022-03-18 at 17:06 -0700, Khem Raj wrote:
> > > seeing these 3 failures with new libtool in meta-oe
> > > 
> > > https://errors.yoctoproject.org/Errors/Build/142979/
> > > 
> > 
> > Those are all libtool version mismatches. Might be a case of deleting the
> > libtool m4 macros before reautoconf?
> 
> i have not looked into details but perhaps it could be just that
> 

I was going to have a look to see if I could help but saw you already have
patches doing that! :)

Cheers,

Richard




